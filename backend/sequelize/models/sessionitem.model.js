var Sequelize = require("sequelize-cockroachdb");

module.exports = (sequelize) => {
  return sequelize.define("sessionitem", {
    session_id: {
      type: Sequelize.STRING,
      allowNull: false,
      primaryKey: true,
    },
    item: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    count: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
  });
};
