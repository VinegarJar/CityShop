
import HttpRequest from '../tool/fetchRequest'
import PostTypes from "./postType";
const { GET_HOMEADVER, GET_HOMEGOOSLIST } = PostTypes;




/**
 * @param {请求接口地址} url
 * @param {请求接口参数} params
 * @memberof getGoodsList 获取商品列表数据
 */
export const getGoodsList = (url, params) => dispatch => {

    HttpRequest.getRequest(url, params).then((response) => {
      dispatch({
            type: GET_HOMEGOOSLIST,
            data: response
        })
    })
}


/**
 * @param {请求接口地址} url
 * @param {请求接口参数} params
 * @memberof requestPost POST网络请求
 */
export const requestPost = (url, params) => dispatch => {

    HttpRequest.postRequest(url, params).then((response) => {
        dispatch({
            type: GET_HOMEGOOSLIST,
            data: response
        })
    })
}



/**
 * @param {请求接口地址} url
 * @param {请求接口参数} params
 * @memberof getHomeAdver 实例演示
 */
export const getHomeAdver = () => dispatch => {
    console.log("getHomeAdver");

    fetch("https://portal-web.cjwsc.com/home/hotRecommend.action")
        .then((response) => response.json())
        .then((posts) => {
            dispatch({
                type: GET_HOMEADVER,
                data: posts
            })
        }).catch((error) => {
            console.log('错误信息' + error);
        })
}