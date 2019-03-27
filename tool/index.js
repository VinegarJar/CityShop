/*
 * @Creator: 朱子豪 
 * @Date: 2018-11-19 14:31:09 
 * @Last Modified by: 朱子豪
 * @Last Modified time: 2019-02-20 15:36:54
 * @Desc:  屏幕适配工具
 */

import { Dimensions, PixelRatio } from 'react-native'
// import theme from "../../themes/base-theme";
// export let screenW = theme.deviceWidth;
// export let screenH = theme.deviceHeight;

const screenW = Dimensions.get('window').width
const screenH = Dimensions.get('window').height

const fontScale = PixelRatio.getFontScale();
export let pixelRatio = PixelRatio.get();
//像素密度
export const DEFAULT_DENSITY = 2;
//px转换成dp
//以iphone6为基准,如果以其他尺寸为基准的话,请修改下面的750和1334为对应尺寸即可.
const w2 = 750 / DEFAULT_DENSITY;
//px转换成dp
const h2 = 1334 / DEFAULT_DENSITY;

// iPhoneX
const X_WIDTH = 375;
const X_HEIGHT = 812;

/**
 * 设置字体的size（单位px）
 * @param size 传入设计稿上的px
 * @returns {Number} 返回实际sp
 */
export function setSpText(size: Number) {
    let scaleWidth = screenW / w2;
    let scaleHeight = screenH / h2;
    let scale = Math.min(scaleWidth, scaleHeight);
    size = Math.round((size * scale + 0.5));
    return size / DEFAULT_DENSITY;
}

/**
 * 屏幕适配,缩放size
 * @param size
 * @returns {Number}
 */
export function scaleSize(size: Number) {
    let scaleWidth = screenW / w2;
    let scaleHeight = screenH / h2;
    let scale = Math.min(scaleWidth, scaleHeight);
    size = Math.round((size * scale + 0.5));
    return size / DEFAULT_DENSITY;
}

/**
 * 手机号正则校验
 * @param phoneNumber
 * @returns {BOOL}
 */
export function validatemobile(phoneNumber: string) {
    if (phoneNumber.length == 0) {
        return false;
    }
    if (phoneNumber.length != 11) {
        return false;
    }
    var PATTERN_CHINAMOBILE = /^1(3[4-9]|5[012789]|8[23478]|4[7]|7[8])\d{8}$/; //移动号
    var PATTERN_CHINAUNICOM = /^1(3[0-2]|5[56]|8[56]|4[5]|7[6])\d{8}$/; //联通号
    var PATTERN_CHINATELECOM = /^1(3[3])|(8[019])\d{8}$/; //电信号
    var PATTERN_MOBILEHOT = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;// 手机号码正则表达式
    var PATTERN_OTHERMOBILEHOT = /^((0{0,1}[1]{1}[3-9]{1}[0-9]{9}))$/;
    if (PATTERN_CHINAUNICOM.test(phoneNumber)) {
        return true;
    } else if (PATTERN_CHINAMOBILE.test(phoneNumber)) {
        return true;
    } else if (PATTERN_CHINATELECOM.test(phoneNumber)) {
        return true;
    } else if (PATTERN_MOBILEHOT.test(phoneNumber)) {
        return true;
    } else if (PATTERN_OTHERMOBILEHOT.test(phoneNumber)) {
        return true;
    }else {
        return false;
    }
}

export function checkUrl(url) {
    var requestPath = new RegExp();
    requestPath.compile("^[A-Za-z]+://[A-Za-z0-9-_]+\\.[A-Za-z0-9-_%&\?\/.=]+$");
    if (!requestPath.test(url)) {
        return false;
    }
    return true;
}


/** 
  * js截取字符串，中英文都能用 
  * @param str：需要截取的字符串 
  * @param len: 需要截取的长度 
  */
export function cutString(str, len) {
    var str_length = 0;
    var str_len = 0;
    str_cut = new String();
    str_len = str.length;
    for (var i = 0; i < str_len; i++) {
        a = str.charAt(i);
        str_length++;
        if (escape(a).length > 4) {
            //中文字符的长度经编码之后大于4  
            str_length++;
        }
        str_cut = str_cut.concat(a);
        if (str_length >= len) {
            str_cut = str_cut.concat("...");
            return str_cut;
        }
    }
    //如果给定字符串小于指定长度，则返回源字符串；  
    if (str_length < len) {
        return str;
    }
}

export function checkArray(array) {
    if (array === null || array === undefined || array.length == 0) {
        return false;
    } else {
        return true;
    }
}


export function checkBuyer(identity_id: string,buyer:string)  {
    if(buyer&&buyer.indexOf(identity_id)!=-1){// !=-1含有 ==-1不含有
      console.log("yes",identity_id,buyer);
      return true;
    }else{
      console.log("no",identity_id,buyer);
      return false;
    }
}

export function checkBool(relation)  {
    if (relation === null || relation === undefined || relation == 0) {
        return false;
    } else {
        return true;
    }
}

export function GoodsCategory(goods) {
    switch (goods) {
        case 0:
            return "Original";
            break;
        case 1: return "Brands";
            break;
        case 2: return "OME";
            break;
        case 3: return "split";
            break;
        case 4: return "om";
            break;
        default:
            break;
    }
}


export function GoodsCategoryColor(goods) {
    switch (goods) {
        case 0:
            return "#07BFA7";
            break;
        case 1: return "#3F50F3";
            break;
        case 2: return "#17CAD9";
            break;
        case 3: return "#FFC24C";
            break;
        case 4: //return "#09CAB1";
            return "#4B4B4B";
            break;
        default:
            break;
    }
}

export function validate(phoneNumber: string) {
    //只能输入数字
    var reg = new RegExp("^[0-9]*$");
    if (!reg.test(phoneNumber)) {
        return false;
    }
    //匹配数字字符
    if (!/^[0-9]+$/.test(phoneNumber)) {
        return false;
    }
    return true;
}

//去掉空格及换行
export function formatString(originString) {
    // const originString = text.
    const keyStr = originString.replace(/\ +/g, "").replace(/[\r\n]/g, "");
    return keyStr
}

