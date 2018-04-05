/**
 * Created by ryp-app01 on 2018/3/6.
 * 快速获取屏幕宽高,我们可以做一个简单的封装，创建一个screen.js文件
 */

import {Dimensions, PixelRatio} from 'react-native'

const screenWidth = Dimensions.get('window').width
const screenHeight = Dimensions.get('window').height

let screen = {
    width: screenWidth,
    height: screenHeight,
}

export default screen

