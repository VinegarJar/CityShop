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
    Image,
} from 'react-native';

const {width} = Dimensions.get('window');
export default class ZeroMineAccount extends Component {
    render() {
        return (
            <View style={styles.container}>
            <TouchableOpacity
                onPress = {() => this.props.onTouchableOpacity(1)}
            >
                <Image
                    source={require('../../src/Mine/icon_user_avatar_anonymous@2x.png')}
                    style={styles.mineImageStyle}
                    resizeMethod='auto'
                />

            </TouchableOpacity>

            <View style={styles.loginStyles}>
                <TouchableOpacity onPress = {() => this.props.onTouchableOpacity(2)}>
                <Text style={styles.loginTitleStyles}>豆芽菜</Text>
                </TouchableOpacity>
                <View style={styles.vipViewStyles}>
                    <Text style={styles.vipTitleStyles}>
                        会员福利V1
                    </Text>
                </View>
            </View >
                <TouchableOpacity onPress = {() => this.props.onTouchableOpacity(3)}>
            <View style={styles.tagViewStyle}>
                    <Image
                        source={require('../../src/Mine/shar@2x.png')}
                        style={styles.tagImageStyle}
                        resizeMethod='auto'
                    />
            </View>
                </TouchableOpacity>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        //横向显示
        flexDirection:"row",
        // justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'white',
        height: 120,
        //justifyContent: 'space-between',
        //justifyContent: 'space-around',
    },

    mineImageStyle:{
       width:50,
       height:50,
       // backgroundColor: 'red',
       marginLeft:30,

    },
    loginStyles:{
        marginLeft:20,
        marginRight:20,
    },
    loginTitleStyles: {
        textAlign: 'center',
        fontSize:17,

    },
    vipViewStyles:{
        // borderRadius:5,
        // borderWidth: 1,
        // borderColor: '#ff8e4a',
        height:30,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop:10,
    },
    vipTitleStyles:{
        textAlign: 'center',
        fontSize:15,
    },
    tagImageStyle:{
        width:30,
        height:30,
        // backgroundColor: 'orange',
        // left:145,
    },
    tagViewStyle:{
        // backgroundColor: 'red',
        //距离上下两边
        padding:20,
        left:120,

        // marginRight:15,
        // width:width/2,
        // paddingRight:15,
    }

});


