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
    Image,
} from 'react-native';

export default class ZeroItem extends Component {
    render() {

        return (
            <View style={styles.container}>

                {this.props.menuInfos.map((item, index) => {
                    console.log(index);
                    return (
                        <TouchableOpacity
                            activeOpacity={1}
                            key = {index}
                            onPress = {() => this.props.onItemSelected(index)}
                        >
                            <Image source={item.image}
                                   style={styles.orderImageStyle}
                                   resizeMethod='auto'
                            />
                            <Text style={styles.orderTextStyle}>
                                {item.title}
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
        // justifyContent: 'flex-end',
        justifyContent: 'space-around',
    },

    orderImageStyle:{
        width:30,
        height:30,
        marginTop:15,
        marginRight:30,
        marginLeft:30,

    },
    orderTextStyle:{
        marginTop:10,
        textAlign:'center',
        fontSize:14,


    },
});


