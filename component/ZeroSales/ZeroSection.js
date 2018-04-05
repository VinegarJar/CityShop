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
} from 'react-native';

export default class ZeroSection extends Component {

    constructor(props) {
        super(props)
    }

    render() {
        let title = this.props.title;
        return (
            <View style={styles.container}>
                <Image
                    source={require('../../src/Sales/adorn_icon@2x.png')}
                    style={styles.hotSalesImage}
                    resizeMethod='auto'
                />
                <Text style={styles.textStyle}>{title}</Text>
                <Image
                    source={require('../../src/Sales/adorn_icon@2x.png')}
                    style={styles.hotSalesImage}
                    resizeMethod='auto'
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container:{
        //左右剧中
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor:'white',
        //横向显示
        flexDirection:"row",
        height:40,
    },
    hotSalesImage:{
        width:30,
        height:30,
    },
    textStyle:{
        fontSize:17,
        fontWeight:('bold','700'),
        fontFamily: 'Times',
        //文字加横线 'underline'(下划线)
        //extDecorationLine:'line-through'
    },
});


