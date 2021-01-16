const { timeStamp } = require("console");
var Sequelize = require("sequelize-cockroachdb");

module.exports = (sequelize) => {
  return sequelize.define("session", {
    sessionID: {
      type: Sequelize.STRING,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    ownerID: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
  });
};
