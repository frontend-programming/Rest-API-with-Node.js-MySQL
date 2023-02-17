const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const mysql = require("mysql");

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Defaults Routes
app.get("/", (req, res) => {
  return res.send({ status: true, message: "It works!" });
});

// DB Connections
const dbConnect = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "node_crud",
});

dbConnect.connect();

// Get All Users
app.get("/users", (req, res) => {
  dbConnect.query("SELECT * FROM users", (error, results, fields) => {
    if (error) {
      return res.send({
        error: true,
        message: error.sqlMessage,
        data: null,
      });
    }
    return res.status(200).json({
      error: false,
      message: "Fetch uses successfully!!",
      data: results,
    });
  });
});

// Get Single User
app.get("/user/:id", (req, res) => {
  let id = req.params.id;
  if (!id) {
    return res.status(400).json({
      error: true,
      message: "Please provide user id",
      data: null,
    });
  }

  dbConnect.query(
    "SELECT * FROM users WHERE id = ?",
    id,
    (error, results, fields) => {
      if (error) {
        return res.status(403).json({
          error: true,
          message: error.sqlMessage,
          data: null,
        });
      }

      return res.status(200).json({
        error: false,
        message: "Fetch user successfully!",
        data: results[0],
      });
    }
  );
});

// Add User
app.post("/user", (req, res) => {
  const { user } = req.body;

  if (!user) {
    return res.status(400).json({
      error: true,
      message: "Please provide user",
      data: null,
    });
  }

  dbConnect.query(
    `INSERT INTO users (name, email) VALUES ('${user.name}', '${user.email}')`,
    (error, results, fields) => {
      if (error) {
        return res.status(403).json({
          error: true,
          message: error.sqlMessage,
          data: null,
        });
      }

      return res.status(201).json({
        error: false,
        message: "User create successfully!!",
        data: `User Id ${results.insertId} inserted`,
      });
    }
  );
});

// Update User
app.put("/user/:id", (req, res) => {
  const { id } = req.params;
  const user = req.body.user;

  if (!id || !user) {
    return res.status(400).json({
      error: true,
      message: "Please provide user & user id",
      data: null,
    });
  }

  dbConnect.query(
    `UPDATE users SET name='${user.name}', email='${user.email}' WHERE id = ${id}`,
    (error, results, fields) => {
      if (error) {
        return res.status(403).json({
          error: true,
          message: error.message,
          data: null,
        });
      }

      return res.status(200).json({
        error: false,
        message: "User Update Successfully!!",
      });
    }
  );
});

// Delete User
app.delete("/user/:id", (req, res) => {
  const { id } = req.params;
  if (!id) {
    return res.status(400).json({
      error: true,
      message: "Please provide   user id",
      data: null,
    });
  }

  dbConnect.query(
    "DELETE FROM users WHERE id = ?",
    id,
    (error, results, fields) => {
      if (error) {
        return res.status(403).json({
          error: true,
          message: error.message,
          data: null,
        });
      }
      return res.status(200).json({
        error: false,
        message: "User Delete Successfully!!",
      });
    }
  );
});

module.exports = app;
