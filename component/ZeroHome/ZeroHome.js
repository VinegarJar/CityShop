/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow command +m 调试
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    AlertIOS,
    ListView,
    Image,
    TouchableOpacity,
    Dimensions,
    ScrollView,
} from 'react-native';


import ZeroBanner from './ZeroBanner'
import ZeroHomeNavigator from './ZeroHomeNavigator'


export default class ZeroHome extends Component {

    constructor(props) {
        super(props);
        this.state = {

        }
    }



    render() {
        return (

            <View style={styles.container}>
                <ZeroHomeNavigator />
                <ScrollView style={{flex:1,backgroundColor:"orange"}}>
                    <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)} />
                </ScrollView>

            </View>
        );
    }




    renderHeader() {
        return (
            <View>
                <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)} />
            </View>
        )
    }




    //发送网络请求
    componentDidMount() {

    }


    onGridSelected(url: string) {
        this.props.navigation.navigate('ZeroWebScene', { url: url })
    }



}


const styles = StyleSheet.create({
    container: {
        flex: 1,
    },

});


