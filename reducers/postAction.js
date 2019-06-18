
import HttpRequest from '../tool/fetchRequest'
import PostTypes from "./postType";
const  {GET_HOMEADVER, GET_HOMEGOOSLIST } = PostTypes;




//定义一个请求方法
export  const  requestGet = (url,params={})=> dispatch=>{

    HttpRequest.getRequest(url,params).then((response) =>{
        dispatch({
             type: GET_HOMEGOOSLIST,
             data: response
        })
    })
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