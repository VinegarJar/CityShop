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
    Dimensions
} from 'react-native';

const {width,height}=Dimensions.get('window');

export default class ZeroHotGoodsCell extends Component {

    render() {
        let item = this.props.item;
        return (
            <View style={styles.container}>
                <Image
                    source={{uri:item.item.small_pic_pc}}
                    style={styles.hotGoodsImage}
                    resizeMethod='auto'
                />
                <View style={styles.goodSynopsis}>
                    <Text style={styles.titleText}>
                        {item.item.title}
                    </Text>
                    <Text style={styles.productText}>
                        {item.item.product_description}
                    </Text>
                    <Text style={styles.priceText}>
                        ¥:{item.item.price}
                    </Text>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container:{
        flex:1,
        height: 140,
        backgroundColor:'white',
        alignItems: 'center',
        //横向显示orange
        flexDirection:"row",
    },
    goodSynopsis:{
        // backgroundColor:'yellow',
        width:width-150,
        marginLeft:15,
    },
    titleText: {
        // color: 'white',
        fontSize: 17,
        marginBottom:5,
    },
    productText: {
        color: '#666666',
        fontSize: 12,
        // backgroundColor:'orange',
        //marginBottom:5,
    },
    priceText:{

        fontSize: 17,
        // backgroundColor:'red',
        color:'#ff8e4a',
        fontWeight:('bold','100'),
    },
    hotGoodsImage:{
      width:120,
      height:120,
    },
});


