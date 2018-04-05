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
    TouchableOpacity,
    Dimensions,
} from 'react-native';

const {width} = Dimensions.get('window');
export default class ZeroWallet extends Component {
    render() {

        return (
            <View style={styles.container}>

                {this.props.menuInfos.map((item, index) => {
                    console.log(index);
                    return (
                        <TouchableOpacity
                            activeOpacity={1}
                            key = {index}
                            onPress = {() => this.props.onWalletSelected(index)}
                        >
                            <Text style={styles.walletStyle}>
                                {item.title}
                            </Text>
                            <Text style={styles.walletTextStyle}>
                                {item.numbers}
                            </Text>
                        </TouchableOpacity>)
                })}

            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        backgroundColor:'white',
        //横向显示
        flexDirection:"row",
        justifyContent: 'space-around',

    },

    walletStyle:{
        // width:width/4,
        // height:30,
        marginTop:20,
        // marginRight:30,
        // marginLeft:30,
        textAlign:'center',
        fontSize:17,
        // backgroundColor:'red',

    },
    walletTextStyle:{
        marginTop:10,
        textAlign:'center',
        fontSize:14,
        // backgroundColor:'orange',
    },
});


