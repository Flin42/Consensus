var Sequelize = require("sequelize-cockroachdb");

module.exports = (sequelize) => {
  return sequelize.define("item", {
    name: {
      type: Sequelize.STRING,
      allowNull: false,
      primaryKey: true,
    },
  });
};
