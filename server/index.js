const express =require('express');
const mongoose=require('mongoose');
//IMports from other files

const authRouter=require('./routes/auth');
const e = require('express');
//INIT
const PORT=3000;
const app = express();
const DB="mongodb+srv://rocky:rocky77@cluster0.dyplgwq.mongodb.net/?retryWrites=true&w=majority"




//Middleware
app.use(express.json());
app.use(authRouter);

// creating an API
mongoose.connect(DB).then(()=>{
   console.log("Connection Successful");

}).catch((e)=>{
    console.log(e);
});


app.listen(PORT,"0.0.0.0",function (){
   console.log(`Connected at port ${PORT}`);
});
