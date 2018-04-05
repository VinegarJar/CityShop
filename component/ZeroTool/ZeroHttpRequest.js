'use strict'

import queryString from 'query-string';
import  _ from 'lodash';
import ZeroConfig from './ZeroConfig'




let ZeroHttpRequest={

}


ZeroHttpRequest.get = (url,params)=>{
    if (params){
        url+= "?"+ queryString.stringify(params)
    }
    return fetch(url)
        .then((response)=> response.json())
        .then((response)=>{});
}




ZeroHttpRequest.post = (url,body)=>{
    //合并JSON对象
    let  params = _.extend(ZeroConfig.params,{
         body:JSON.stringify(body)
    })

    return fetch(url,params)
        .then((response)=>response.json())
        .then((response)=>{});
}


module.exports = ZeroHttpRequest;