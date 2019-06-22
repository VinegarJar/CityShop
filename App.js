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
    StatusBar,
} from 'react-native';


import ZeroTabBar from './ZeroTabBar'
export default class App extends Component {

    render() {
        return ( 
             
            <View style={{flex:1}} >
                <StatusBar translucent={true} barStyle={'light-content'} backgroundColor={'#EB5148'} networkActivityIndicatorVisible={true}/>  
                <ZeroTabBar/>  
            </View>     
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

