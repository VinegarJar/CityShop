/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    TouchableOpacity
} from 'react-native';
import { AlertUtil } from '../../tool/AlertUtil';
export default class ZeroCategory extends Component {

    remark() {
        AlertUtil.show('弹框标题',
            <View><Text>{'可以自行设置话术'}</Text></View>,
            () => { AlertUtil.hidden()
                    // 确定的操作
             },
            () => {
                AlertUtil.hidden()
                //取消的操作
        })
    }


    render() {
        return (
            <TouchableOpacity onPress={this.remark}><Text>点我</Text></TouchableOpacity>
            // <View style={styles.container}>
            //     <TouchableOpacity onPress={this.remark}>  
            //     <Text style={styles.welcome}>
            //         购物车页面
            //     </Text>
            //     </TouchableOpacity>
            // </View>
        );
    }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
});


