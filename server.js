const express = require('express');
const app = express();

const dotenv = require('dotenv'); 

dotenv.config();

app.get('/foo', (req, res) => {
  res.json({ myFavouriteColor: 'Blue' });
});

const port = process.env.PORT || 5000;

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

