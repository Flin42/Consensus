const sequelize = require("../sequelize/sequelize");
const router = require("express").Router();
const { models } = require("../sequelize/sequelize");

const fs = require("fs");
const Sequelize = require("sequelize-cockroachdb");
const { Session } = require("inspector");
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

router.route("/right").post((req, res) => {
  sessionID = req.body.session_id;
  item = req.body.item;
  seq
    .query(
      "update sessionitems set count = count + 1 where item='" +
        item +
        "' and session_id='" +
        sessionID +
        "';"
    )
    .then(() => {
      checkCount(sessionID, item, res).then((count) => {
        console.log(count);
        res.send(count);
      });
    });
  //update sessionitems set count = count + 1 where item='Interstellar' and sessionID='FMGDXJ';
});

function checkCount(session_id, item, res) {
  console.log("'" + session_id + "'" + "___" + "'" + item + "'");

  var count = models.sessionitem
    .findAll({
      where: { session_id: session_id, item: item },
    })
    .then((sessionitem) => {
      return sessionitem[0].dataValues.count;
    });
  return count;
}

module.exports = router;
