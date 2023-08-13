const mongoose = require("mongoose");

const connection = mongoose
  .createConnection("mongodb://127.0.0.1:27017/inventory-users")
  .on("open", () => {
    console.log("mongo db connected");
  })
  .on("error", () => {
    console.log("error");
  });

module.exports = connection;
