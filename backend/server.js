const express = require("express");
const cors = require("cors");
const app = express();
const Sequelize = require("sequelize-cockroachdb");
const fs = require("fs");

require("dotenv").config();
const port = process.env.PORT || 8000;

const sequelize = new Sequelize(
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
//const { models } = require("./sequelize/sequelize");
app.use(cors());
app.use(express.json());
sequelize.authenticate();
console.info(
  "INFO: Connection to the database has been established successfully."
);

app.use("/swipe", require("./routes/swipe"));
app.use("/sessions", require("./routes/sessions"));
app.use("/user", require("./routes/user"));
app.use("/test", require("./routes/test"));

app.listen(port, () => {
  console.log("Server is running on port: " + port);
});
