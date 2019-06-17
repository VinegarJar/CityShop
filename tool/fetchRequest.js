import React,{Component} from 'react'

const TIMOUT = 3000;
const timeoutFetch = (original_fetch,timeout = TIMOUT) => {

    let timeoutBlock = () => {

    }

    let timeout_promise = new Promise((resolve,reject) => {
        timeoutBlock = () => {
            reject('请求超时')
        }
    })
    let abortable_promise = Promise.race([original_fetch,timeout_promise])
    setTimeout(() => {
        timeoutBlock();
    },timeout)

    return abortable_promise;
}

const handleUrl = url => params => {
    if(params){
        const dataArray = [];
        Object.keys(params).forEach(key => {
            dataArray.push(key+"="+encodeURIComponent(params[key]))
        })
        if (url.search(/\?/)){
            return typeof  params === 'object' ? url += "?"+params.join("&") : url
        }else {
            url += "&"+params.join("&")
        }
        return url
    }else {
        return url
    }
}

export default class HttpUtil extends Component{
    static getRequest = (url,params={},headers)=>{
        console.log("url=>"+url)
        console.log(params)
        console.log(headers)
        return timeoutFetch(fetch(handleUrl(url)(params),{
            method:'GET',
            headers:headers,
        })).then((response)=>{
            if(response.ok){
                return response.json();
            }else {
                alert("网络繁忙，重新再试")
            }
        }).then((response)=>{
            return response
        }).catch((error)=>{
            console.log(error)
        })
    }

    static postRequest = (url,params = {},headers) => {
        console.log("url+postRequest=>"+url)
        console.log(params)
        return timeoutFetch(fetch(url,{
            method:'POST',
            headers:headers,
            body:JSON.stringify(params)
        })).then((result) => {
            if (result.ok){
                return result.json();
            }else {
                alert("网络繁忙，请稍后再试");
            }
        }).then(response =>{
            return response
        }).catch((error)=>{
            alert("出现错误了"+error)
        })
    }
}