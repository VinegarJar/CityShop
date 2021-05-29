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
    Dimensions,
    FlatList,
    Image,
    Platform
} from 'react-native';
import { scaleSize } from '../../tool/index'
//第一种引用iOS关键代码
var { NativeModules } = require('react-native');
// var  RNBridgeModule = NativeModules.RNBridgeModule;


import ZeroNavigationItem from '../../ZeroNavigationItem'
import ZeroSpaceView from '../ZeroTool/ZeroSpaceView';
import ZeroOrder from './ZeroOrder';
import ZeroHistory from './ZeroHistory';
import ZeroMineAccount from './ZeroMineAccount';
import ZeroShare from './ZeroShare';
const { width, height } = Dimensions.get('window');

import { apiUrl } from '../../tool/url';

export default class ZeroMine extends Component {

    static navigationOptions = ({ navigation }) => ({
        title: '我的账户',
        //headerTitleStyle: {fontSize: 18, color: '#666666',justifyContent:"center"},
        headerRight: (
            <View style={{ flexDirection: 'row' }}>
                <ZeroNavigationItem
                    icon={require('../../src/Mine/icon_navigationItem_set_white.png')}
                    onPress={() => {
                        alert('xxxx');
                    }}
                />
                <ZeroNavigationItem
                    icon={require('../../src/Mine/icon_navigationItem_message_white.png')}
                    onPress={() => {
                        alert('调用消息事件');
                    }}
                />
            </View>
        ),
    })


    constructor(props) {
        super(props);
        this.state = {
            goods_list: [],

        }
    }


    render() {
        const { goods_list } = this.state || {};
        return (
            <View style={{ flex: 1 }}>
                <FlatList
                    removeClippedSubviews={false}
                    style={styles.flatListStyle}
                    contentContainerStyle={styles.listViewStyle}
                    renderItem={this.renderItem}
                    keyExtractor={(item, index) => index.toString()}
                    ItemSeparatorComponent={this.separator}
                    ListHeaderComponent={this.renderHeader}
                    onScroll={this.scrollViewDidScroll}
                    onEndReachedThreshold={0.1}
                    data={goods_list}>
                </FlatList>
            </View>
        );
    }
    separator = () => {
        return <View style={{ height: scaleSize(15), backgroundColor: '#F5F5F9' }} />;
    }

    scrollViewDidScroll() {


    }


    onTouchableOpacity(index) {

    }

    renderHeader() {
        return (

            <View >
                <ZeroMineAccount onTouchableOpacity={(index) => this.onTouchableOpacity(index)} />
                <ZeroSpaceView />
                <ZeroShare />
                <ZeroSpaceView />
                <ZeroOrder />
                <ZeroSpaceView />
                <ZeroHistory />
                <ZeroSpaceView />
                <View style={styles.commendStyle}>
                    <Text style={styles.textStyle} >为你推荐</Text>
                </View>

            </View>


        )
    }

    renderItem = (items) => {
        const { item } = items || {};
        console.log("info===========>", item)
        // return (
        //     <Text style={styles.textStyle} >为你推荐</Text>

        // )
        return (
            <View style={styles.bgStyle}>
                <Image style={styles.imageStyle}
                    source={{ uri: item.pic }}
                />
                <Text style={styles.describe}
                      numberOfLines={2}>
                    {item.name}
                </Text>
                <Text style={styles.price}>
                    ¥:{item.price}
                </Text>
            </View>
        );
    }
    

    //发送网络请求
    componentDidMount() {
        this.requestNetwork();
    }

    requestNetwork() {
        fetch(apiUrl.homeHotCommendGoods_URL)
            .then((response) => response.json())
            .then((responseJson) => {
                let items = [];
                let { lists } = responseJson.data;
                lists.map(
                    (info) => {



                        let productList = info.productList || [];
                        productList.map(
                            (object) => {
                                // console.log(object);
                                items.push(object);
                            }
                        )
                    }
                )

                //刷新界面数据
                this.setState({
                    goods_list: items
                })
            }

            ).catch(
                (error) => {
                    console.log('错误信息' + error);
                }
            )
    }




}

//345 × 345
let zoomWidth = (width - 30) / 2;
let imgHeight = 345 * 0.5;
let imgWidth = 345 * 0.5;
const styles = StyleSheet.create({

    textStyle: {
        fontSize: 17,
    },
    commendStyle: {
        height: 30,
        width: width, //cell的宽度
        //左右剧中
        justifyContent: 'center',
        alignItems: 'center',
        //横向显示
        flexDirection: "row",
    },
    flatListStyle: {
        backgroundColor: "#F5F5F9"

    },
    listViewStyle: {
        flexDirection: 'row', //设置横向布局
        flexWrap: 'wrap'    //设置换行显示
    },
    bgStyle: {
        backgroundColor: 'white',
        width: zoomWidth, //cell的宽度
        height: 250,
        marginLeft: 10,
        marginTop: 10,
        borderRadius: 5,
        borderWidth: 1,
        borderColor: 'transparent',
    },
    imageStyle: {
        width: imgWidth,
        height: imgHeight,
        // marginBottom:0,
        marginTop: 0,
    },
    describe: {
        fontSize: 15,
        // marginBottom:0
        marginTop: 0,
        marginRight: 5,
        marginLeft: 5,
    },
    price: {
        fontSize: 14,
        marginTop: 10,
        marginRight: 5,
        marginLeft: 5,
        color: '#EB5148',
        // fontWeight:('normal'),
        fontWeight: ('bold', '900'),
        // 字符间距
        letterSpacing: 0
    },
});


