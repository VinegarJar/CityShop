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

import {Provider} from 'react-redux'
import ZeroTabBar from './ZeroTabBar'
import configureStore from './component/ZeroStore'
const store  = configureStore()

export default class App extends Component {

    render() {
        return ( 
             
            <Provider store={store}>
                <StatusBar translucent={true} barStyle={'light-content'} backgroundColor={'#ff8e4a'} networkActivityIndicatorVisible={true}/>  
                <ZeroTabBar/>  
            </Provider>     
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

