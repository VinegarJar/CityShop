import ZeroAppServer  from '../../ZeroTool/ZeroAppServer';
import StoreTypes from "../Types";
const  {GET_HOMEADVER } = StoreTypes;


export async function getHomeAdver(params) {
    let data = await ZeroAppServer.getHomeAdver(params);
    console.log("获取首页广告数据：", data)
    return {
        type:GET_HOMEADVER,
        data:data
    }
}

