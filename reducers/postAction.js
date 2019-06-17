
import PostTypes from "./postType";
const  {GET_HOMEADVER } = PostTypes;




//定义一个请求方法
export  const  getFetchRequest = (url,params)=> dispatch=>{
    console.log("getHomeAdver");
    


}


//定义一个请求方法
export  const  getHomeAdver = ()=> dispatch=>{
    console.log("getHomeAdver");

    fetch("https://portal-web.cjwsc.com/home/hotRecommend.action")
    .then((response)=>response.json())
    .then((posts)=>{
        dispatch({
            type:GET_HOMEADVER,
             data:posts
        })

    }).catch((error)=>{
        console.log('错误信息'+error);
    })

}