const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World23!')
});

app.listen(port, () => {
  console.log(`Example app 23 listening at http://localhost:${port}`)
})