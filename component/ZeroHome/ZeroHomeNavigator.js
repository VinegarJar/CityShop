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
    AlertIOS,
} from 'react-native';




const {width} = Dimensions.get('window');
export default class ZeroHomeNavigator extends Component {
    render() {
        return (
            <View style={styles.NavViewStyle}>

                <TouchableOpacity
                    activeOpacity={1}
                    style={styles.NavScanItem}
                    onPress = {()=>this.searchClick(0)}
                >
                    <View style={styles.NavScanItem}>
                        <Image
                            source={require('../../src/Home/scan_icon@2x.png')}
                            style={styles.NavScanIcon}
                        />
                    </View>
                </TouchableOpacity>


                <TouchableOpacity
                    activeOpacity={1}
                    style={styles.NavSearch}
                    onPress = {()=>this.searchClick(1)}
                >
                    <View style={styles.NavSearch}>

                        <Image
                            source={require('../../src/Home/search@2x.png')}
                            style={styles.NavSearchIcon}
                        />
                        <Text style={styles.NavViewTitleStyle}
                        >冬季新款抢购中</Text>
                    </View>
                </TouchableOpacity>

                <TouchableOpacity
                    activeOpacity={1}
                    style={styles.NavNewItem}
                    onPress = {()=>this.searchClick(2)}
                >
                    <View style={styles.NavNewItem}>
                        <Image
                            source={require('../../src/Home/news@2x.png')}
                            style={styles.NavScanIcon}
                        />
                    </View>
                </TouchableOpacity>


            </View>

        );
    }

    //调用点击事件
    searchClick(index){

        switch (index) {
            case 0:{
                AlertIOS.alert('调用点击扫码事件');
            }
            break;

            case 1:{
                AlertIOS.alert('调用点击搜索事件');
            }
                break;
            case 2:{
                AlertIOS.alert('调用点击消息事件');
            }
                break;
            default:
            break;
        }

    }
}

const styles = StyleSheet.create({

    NavViewStyle:{
        height:64,
        backgroundColor: '#ff8e4a',
        //左右剧中clearColor #ff8e4a
        justifyContent: 'center',
        alignItems: 'center',
        //横向显示
        flexDirection:"row",
    },
    NavSearch:{
        height:36,
        backgroundColor: 'white',
        width:width*0.7,
        borderRadius:18,
        borderWidth: 1,
        borderColor: 'transparent',
        //横向显示
        flexDirection:"row",
        //上下剧中
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

    NavScanItem:{
        height:30,
        width:30,
        left:-8
    },
    NavScanIcon:{
        height:25,
        width:25,
    },
    NavNewItem:{
        height:30,
        width:30,
        // backgroundColor: 'red',
        left:8
    },

});



