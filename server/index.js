const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')

const app = express()

app.use(bodyParser.json())
app.use(cors())

const posts = require('./routes/api/posts')

app.use('/api/posts', posts)

const port = process.env.port || 5000;
app.listen(port, () => console.log(`Server started on port ${port}`))