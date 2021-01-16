const express = require("express.io");
const cors = require("cors");
const app = express();
app.http().io();
const Sequelize = require("sequelize-cockroachdb");
const fs = require("fs");
const { Socket } = require("dgram");

require("dotenv").config();
const port = process.env.PORT || 8000;

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    dialect: "postgres",
    host: process.env.DB_URL,
    port: process.env.DB_PORT,
    logging: false,
    dialectOptions:
      process.env.DB_SSL_MODE === "ENABLED"
        ? {
            ssl: {
              ca: fs.readFileSync(process.env.DB_CERT_LOCATION).toString(),
            },
          }
        : {},
  }
);

//const { models } = require("./sequelize/sequelize");
app.use(cors());
app.use(express.json());
sequelize.authenticate();
console.info(
  "INFO: Connection to the database has been established successfully."
);

app.use("/swipe", require("./routes/swipe"));
app.use("/sessions", require("./routes/sessions"));
app.use("/user", require("./routes/user"));
app.use("/test", require("./routes/test"));

const { models } = require("./sequelize/sequelize");

/* Create Room:
  - Check if roomID exists in sessions in db
  - Create roomID and join user into room, and send roomID to db
*/
function createRoom(user_id) {
  const room_code = generateCode(6);
  sequelize.query(
    "INSERT INTO sessions(sessionID, ownerID, members) VALUES('" +
      room_code +
      "'," +
      user_id +
      ", 1)"
  );
  return room_code;
}

// emit events to session:create, session:join, session:start
app.io.route("session", {
  create: function (req) {
    // create room
    const room_code = createRoom(req.data.user_id);
    req.io.join(room_code);
    req.io.room(room_code).broadcast("room_code", room_code);
  },

  join: function (req) {
    //Check if room exists

    models.session
      .findOne({
        where: {
          session_id: req.data.room_code,
        },
      })
      .then((room) => {
        if (room === null) {
          console.log("room not found");
          req.io.broadcast("room_not_found");
        } else {
          // update join room
          req.io.join(req.data.room_code);
          req.io.broadcast("room_found");
        }
      });
  },

  start: function (req) {
    // start swiping
    const room_code = req.data.room_code;
    app.io.room(room_code).broadcast("start", items);
  },
});
/* 
app.io.route("item", {
  swipeRight()

}) */

function generateCode(count) {
  var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split("");
  var result = "";
  for (var i = 0; i < count; i++) {
    var x = Math.floor(Math.random() * chars.length);
    result += chars[x];
  }
  return result;
}

app.listen(port, () => {
  console.log("Server is running on port: " + port);
});
