import { stringify } from 'qs';
import {request} from './ZeroFetchRequest';
import ZeroConfig from '../ZeroTool/ZeroConfig';
const { homeBanner_URL,homeHotCommendGoods_URL,specialSell_URL,brandHotGoods_URL,saleHotStyle_URL, } = ZeroConfig.api;


export default {

    getHomeAdver : async function (params) {
       let url = `${homeHotCommendGoods_URL}`
       return await request(url, {
           method: "GET",
       })
   }, 



}





