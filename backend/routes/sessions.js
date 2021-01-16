const sequelize = require("../sequelize/sequelize");
const router = require("express").Router();
const Sequelize = require("sequelize-cockroachdb");
const fs = require("fs");
const { models } = require("../sequelize/sequelize");
//console.log(ARRAY_LENGTH);
const SENDABLE_ARRAY_LENGTH = 3;

const seq = new Sequelize(
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
const ARRAY_LENGTH = 3;
//seq.query("SELECT COUNT(*) FROM items");

router.route("/add").post((req, res) => {
  const userID = req.body.userID;
  const sessionID = generateCode(6);
  /* ADD SESSION TO DB */
  seq.query(
    "INSERT INTO sessions(sessionID, ownerID, members) VALUES('" +
      sessionID +
      "'," +
      userID +
      ", 1)"
  );

  /* RETURN SESSION ID AND LISTINGS ARRAY */
  grabItems(res, sessionID);

  console.log(userID);
});

async function grabItems(res, sessionID) {
  models.item.findAll().then((r) => {
    var arr = [];
    /* CHECK IF ITEM EXISTS */
    for (var i = 0; i < SENDABLE_ARRAY_LENGTH; i++) {
      //var i = Math.floor(Math.random() * ARRAY_LENGTH);
      seq.query(
        "insert into sessionitems(sessionID, item, count) values('" +
          sessionID +
          "', '" +
          r[i].dataValues.name +
          "', 0);"
      );
      console.log(
        "insert into sessionitems(sessionID, item, count) values('" +
          sessionID +
          "', '" +
          r[i].dataValues.name +
          "', 0);"
      );
      //insert into sessionitems(sessionID, name, count) values('test','movie',0);
      arr.push(r[i].dataValues.name);
    }
    res.send({ items: arr, session_ID: sessionID });
  });
}

router.route("/getItems").post((req, res) => {
  const userID = req.body.userID;
  const sessionID = req.body.sessionID;
  res.send(sessionID);

  console.log(userID);
});

function generateCode(count) {
  var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split("");
  var result = "";
  for (var i = 0; i < count; i++) {
    var x = Math.floor(Math.random() * chars.length);
    result += chars[x];
  }
  return result;
}

module.exports = router;
