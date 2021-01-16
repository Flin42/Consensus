const router = require("express").Router();
const Sequelize = require("sequelize-cockroachdb");
const fs = require("fs");
const { models } = require("../sequelize/sequelize");
const { Op, and } = require("sequelize-cockroachdb");
//FOR TESTING CERTAIN (SEQUELIZE) API CALLS DIRECTLY
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
router.route("/getItemCount").get((req, res) => {
  console.log("Testing getting specific item");
  getItemCount(req.body.session_id, req.body.item, res);
  /* models.sessionitem
    .findAll({ where: { session_id: "VUBZ5L", item: "Interstellar" } })
    .then((sessionitem) => {
      console.log(sessionitem[0].dataValues.item);
      res.send(
        sessionitem[0].dataValues.count +
          " was found for session " +
          sessionitem[0].dataValues.session_id
      );
    }); */
});

router.route("/roomCheck").get((req, res) => {
  console.log(req.body.room_code);

  models.session
    .findOne({
      where: {
        session_id: req.body.room_code,
      },
    })
    .then((room) => {
      if (room === null) {
        console.log("room not found");
        /* req.io.broadcast("room_not_found"); */
      } else {
        // update join room
        console.log("f");
        /*   req.io.join(req.body.room_code);
        req.io.broadcast("room_found"); */
      }
    });
});

module.exports = router;
