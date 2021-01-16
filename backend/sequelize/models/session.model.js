const {
  timeStamp
} = require("console");
var Sequelize = require("sequelize-cockroachdb");

module.exports = (sequelize) => {
  return sequelize.define("session", {
    session_id: {
      type: Sequelize.STRING,
      //primaryKey: true,
      allowNull: false,
    },
    owner_id: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
  });
};