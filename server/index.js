const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')

const app = express()

app.use(express.json())
app.use(cors())

require('./routes/api/posts')(app)

const port = process.env.port || 5000;
app.listen(port, () => console.log(`Server started on port ${port}`))