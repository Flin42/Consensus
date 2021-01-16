const router = require("express").Router();
const { models } = require("../sequelize/sequelize");

router.route("/add").post((req, res) => {
  res.send("Session created");
  console.log("NEW USER CREATED");
});

router.route("/getuser").get((req, res) => {
  models.user.findAll().then((r) => {
    console.log("Users requested");
    /* console.log(
      r.map((user) => {
        return user.name;
      })
    ); */
    res.send(
      r.map((user) => {
        return user.user_id;
      })
    );
  });
});

module.exports = router;
