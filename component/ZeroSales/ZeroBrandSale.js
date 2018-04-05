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
    Dimensions,
    Image,
    TouchableOpacity,

} from 'react-native';

const {width,height}=Dimensions.get('window');
export default class ZeroBrandSale extends Component {
    render() {
        return (


            <View style={styles.container}>
                {this.props.infos.map((info, index) => (

                <TouchableOpacity
                    activeOpacity={1}
                    onPress={() => this.props.onBrandSelected(info,index)}
                    key={index}
                >
                    <Image
                        source={{uri:info.info.pic}}
                        style={styles.brandSaleStyles}
                        resizeMethod='auto'
                    />
                </TouchableOpacity>
                ))}
            </View>
        );
    }
}

let brandHeight = (180/520)*width;

const styles = StyleSheet.create({
    container: {
        // flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        // backgroundColor: '#F5FCFF',
        // height:200,
    },
    brandSaleStyles:{
        width:width,
        height:brandHeight,
        marginBottom:10,
    },
});


