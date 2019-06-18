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
    Platform
} from 'react-native';

import { screenWidth }  from '../../tool/ZeroScreen';
import source from '../../src'
import PropTypes from 'prop-types';
import {isIphoneX} from "../../tool/index"


class BarItem extends Component {

    static propTypes = {
        onPress: PropTypes.func,
        source: PropTypes.number,
    }

    static defaultProps = {
        source: "",
        onPress: () => { }
    }

    render() {

        const { source, onPress } = this.props;
        return (
            <TouchableOpacity activeOpacity={1} onPress={onPress} >
                <Image source={source} style={{ width: 30, height: 30 }} />
            </TouchableOpacity>
        );
    }
}

export default class ZeroHomeNavigator extends Component {
    render() {
        return (
            <View style={styles.NavViewStyle}>
                <BarItem source={source.homeItem.home_Scan()} onPress={() => this.searchClick(0)} />
                <TouchableOpacity activeOpacity={1} onPress={() => this.searchClick(1)}>
                    <View style={styles.NavSearch}>
                        <Image  source={source.homeItem.home_Search()}
                                style={styles.NavSearchIcon}/>
                        <Text style={styles.NavViewTitleStyle}>冬季新款抢购中</Text>
                    </View>
                </TouchableOpacity>
                <BarItem source={source.homeItem.home_News()} onPress={() => this.searchClick(2)} />
            </View>

        );
    }

    //调用点击事件
    searchClick(index) {

        switch (index) {
            case 0: {
                alert('调用点击扫码事件');
            }
                break;

            case 1: {
                alert('调用点击搜索事件');
            }
                break;
            case 2: {
                alert('调用点击消息事件');
            }
                break;
            default:
                break;
        }

    }
}

const styles = StyleSheet.create({
//Platform.OS === 'ios' ? 64 : 84
    NavViewStyle: {
        height: Platform.OS === 'ios'?64:84,
        backgroundColor: '#ff8e4a',
        justifyContent: 'space-around',
        alignItems: 'center',
        flexDirection: "row",
    },

    NavSearch:{
        height:36,
        backgroundColor: 'white',
        width: screenWidth*0.7,
        borderRadius:18,
        borderWidth: 1,
        borderColor: 'transparent',
        flexDirection:"row",
        alignItems: 'center',
    },
    NavViewTitleStyle:{
        fontSize:16,
        textAlign:'center',
        marginLeft:25,
    },
    NavSearchIcon:{
        width: 20,
        height: 20,
        marginLeft:25,
    },
    
});



