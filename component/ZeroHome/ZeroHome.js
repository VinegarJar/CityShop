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

import { connect } from "react-redux";
import { getHomeAdver,requestGet } from '../../reducers/postAction';
import {apiUrl} from '../../tool/url';


import ZeroBanner from './ZeroBanner';
import ZeroHomeNavigator from './ZeroHomeNavigator';


class ZeroHome extends Component {

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
        this.props.requestGet(apiUrl.homeGoodsList_URL,{"size":"50", "page":1});
    }


    onGridSelected(url: string) {
        //this.props.navigation.navigate('ZeroWebScene', { url: url })
        console.log("=======>",this.props.post); 
    }



}


const styles = StyleSheet.create({
    container: {
        flex: 1,
    },

});


const mapStatetoProps = (state, props) => ({
  post: state.post,
});

const mapDispatchToProps = dispatch => ({
   getHomeAdver: () => dispatch(getHomeAdver()),
   requestGet: (url,params) => dispatch(requestGet(url,params)),
});

export default connect(mapStatetoProps, mapDispatchToProps)(ZeroHome);