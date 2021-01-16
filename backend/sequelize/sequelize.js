var Sequelize = require("sequelize-cockroachdb");
var fs = require("fs");

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    dialect: "postgres",
    define: {
      timestamps: false,
    },
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

const user = require("./models/user.model")(sequelize);
const item = require("./models/item.model")(sequelize);
const sessionitem = require("./models/sessionitem.model")(sequelize);
const session = require("./models/session.model")(sequelize);

sequelize.authenticate();
module.exports = { sequelize, models: { user, item, sessionitem, session } };
