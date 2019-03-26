
const errorCodeMsg = {
    200: '服务器成功返回请求的数据',
    201: '新建或修改数据成功。',
    202: '一个请求已经进入后台排队（异步任务）',
    203: 'token已失效',
    204: '删除数据成功。',
    400: '发出的请求有错误，服务器没有进行新建或修改数据,的操作。',
    401: '用户没有权限（令牌、用户名、密码错误）。',
    403: '用户得到授权，但是访问是被禁止的。',
    404: '发出的请求针对的是不存在的记录，服务器没有进行操作',
    406: '请求的格式不可得。',
    410: '请求的资源被永久删除，且不会再得到的。',
    422: '当创建一个对象时，发生一个验证错误。',
    500: '服务器发生错误，请检查服务器',
    502: '网关错误',
    503: '服务不可用，服务器暂时过载或维护',
    504: '网关超时',
    518: "解析报错",
    600: "超时"
};

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



class NetWorkRequest {
    static TimeOut = 30000

    static headers = {
        'Accept': 'application/json',
        'Content-Type':'application/x-www-form-urlencoded',
    }
      


    errorCode(response) {
        const errortext = errorCodeMsg[response.status] || response.statusText;
        const error = new Error(errortext);
        error.name = response.status;
        error.response = response;
        throw error;
    }

    request(url, options = {method:"GET",body:null,headers:NetWorkRequest.headers},timeout = NetWorkRequest.TimeOut) {

        return Promise.race([
            fetch(url, {method:options.method,body:options.body,headers:options.headers})
                .then(this.errorCode)
                .then((response) => {
                    const data = response.json();
                    console.log("handleUrl======>",data);
                    return data;
                }),
            new Promise((resolve, reject) => {
                setTimeout(() => { reject({ status_code: 600, msg: "超时", status: 600 }) }, timeout)
            })
        ])
            .then((data) => {
                console.log("data======>",data);
                return data
            }).catch((error) => {
                
                 console.log("error======>",error);
                return {
                    status: 1,
                    code: 518,
                    reason: error
                }
            })

          
    }




}


const NetWork = new NetWorkRequest()
export const request = NetWork.request.bind(NetWork)