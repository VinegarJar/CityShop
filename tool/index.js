/*
 * @Creator: CHENMEIAN 
 * @Date: 2018-11-19 14:31:09 
 * @Last Modified by: CHENMEIAN 
 * @Last Modified time: 2019-02-20 15:36:54
 * @Desc:  屏幕适配工具
 */

import { Dimensions, PixelRatio,Platform } from 'react-native'
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
 * 判断是否为iphoneX
 * @returns {boolean}
 */
export function isIphoneX() {
    return (
        Platform.OS === 'ios' &&
        ((screenH === X_HEIGHT && screenW === X_WIDTH) ||
            (screenH === X_WIDTH && screenW === X_HEIGHT))
    )
}


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

export default {
    Color_D1D1D6:"#D1D1D6",
    Color_E5E5E5:"#E5E5E5",
    Color_C7C7CC:"#C7C7CC",
    Color_F7F7FF:"#F7F7FF",
    Color_F5F5F9:"#F5F5F9",
    Color_FFFFFF:"#FFFFFF",
    Color_8E8E93:"#8E8E93",
    Color_000000:"#000000",
    Color_FE4B3A:"#FE4B3A",
    Color_333333:"#333333",
    Color_999999:"#999999",
    Color_666666:"#666666",
    Color_F7F7F7:'#F7F7F7',
    
    /**以下服务商新增主题*/
    /**
     * app文字字体类型 颜色 大小整理归类 
     */

    mediumFontFamily: 'PingFangSC-Medium',
    regularFontFamily: 'PingFangSC-Regular',
    semiboldFontFamily: 'PingFangSC-Medium',
    // semiboldFontFamily:'PingFangSC-Semibold',
    DINCondensedFamily: 'DINCondensed-Bold',
    microsoftYaHeiFamily: (Platform === 'ios') ? 'PingFangSC-Medium' : 'MicrosoftYaHei',
    PingFangFamily:"PingFang-SC-Regular",
}