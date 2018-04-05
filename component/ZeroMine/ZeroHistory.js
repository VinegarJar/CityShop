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
    View
} from 'react-native';

import ZeroSpaceView from '../ZeroTool/ZeroSpaceView';

import ZeroItem from './ZeroItem';

export default class ZeroHistory extends Component {
    render() {
        return (
            <View style={styles.container}>
                <View style={styles.commendStyle}>
                    <Text style={styles.textStyle} >我的社区</Text>
                </View>

                <ZeroSpaceView/>
                <ZeroItem
                    menuInfos={this.getDataList()}
                    onItemSelected={(index) => this.onItemSelected(index)}/>
                <ZeroSpaceView/>
            </View>
        );
    }

    onItemSelected(index) {
        alert('点击'+index);
    }
    getDataList() {
        return(
            [
                { title: '我的收藏',  image: require('../../src/Mine/icon_mine_collection@2x.png') },
                { title: '社区', image: require('../../src/Mine/icon_mine_aboutmeituan@2x.png') },
                { title: '客户服务',  image: require('../../src/Mine/icon_mine_customerService@2x.png') },
                { title: '我的卡包', image: require('../../src/Mine/icon_mine_member@2x.png') }
            ]
        );
    }
}

const styles = StyleSheet.create({
    container: {
        height: 120,
        // backgroundColor:'#f3f3f3',
        backgroundColor:'white',
    },
    textStyle:{
        fontSize:17,
        marginTop:15,
    },
    commendStyle:{
        justifyContent: 'center',
        alignItems: 'center',
    },
});


