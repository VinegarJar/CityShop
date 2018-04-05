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
    Image,
    Dimensions,
} from 'react-native';

import ZeroLine from '../ZeroTool/ZeroLine';
import ZeroSpaceView from '../ZeroTool/ZeroSpaceView';

import ZeroItem from './ZeroItem';
import ZeroWallet from './ZeroWallet';
const {width} = Dimensions.get('window');
export default class ZeroOrder extends Component {
    render() {
        return (
            <View style={styles.container}>
                <ZeroItem
                    menuInfos={this.getDataList()}
                    onItemSelected={(index) => this.onItemSelected(index)}/>
                <ZeroSpaceView/>
                <View style={styles.lineStyles}>

                </View>
                <ZeroWallet
                    menuInfos={this.getWalletList()}
                    onWalletSelected={(index) => this.onWalletSelected(index)}/>
            </View>
        );
    }





    onWalletSelected(index) {
        alert('点击'+index);
    }

    onItemSelected(index) {
        alert('点击'+index);
    }


    getDataList() {
        return(
            [
                { title: '待付款',  image: require('../../src/Mine/icon_MeMain_WaitPayment@2x.png') },
                { title: '待收货', image: require('../../src/Mine/icon_MeMain_WaitReceiveGoods@2x.png') },
                { title: '待评价',  image: require('../../src/Mine/icon_MeMain_WaitDeliverGoods@2x.png') },
                { title: '退货/售后', image: require('../../src/Mine/icon_MeMain_RefundRepair@2x.png') }
            ]
        );
    }

    getWalletList() {
        return(
            [
                { title: '余额',  numbers: '195' },
                { title: '优惠券', numbers: '2' },
                { title: '白条',  numbers: '0.00' },
                { title: '积分榜',numbers: '1000' }
            ]
        );
    }


}

const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white',
        height: 160,
    },
    lineStyles:{
        height: 0.5,
        backgroundColor:'#e3e5e9',
    }
});


