const app = require('./app')
const port =  3000;
const db = require('./config/db')
const UserModel =  require('./model/user.model')

app.get('/',(req,res)=>{
    res.send('hello world')
})

app.listen(port,()=>{
    console.log(`server started on http://localhost:${port}`);
})
