const router = require("express").Router();

router.route("/right").post((req, res) => {
  var msg = "swiped right";
  res.send(JSON.stringify(msg));
  console.log("Swiped right");
});

module.exports = router;
