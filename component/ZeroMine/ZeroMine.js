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
    AlertIOS,
    Dimensions,
    ListView,
    Image,

} from 'react-native';

//第一种引用iOS关键代码
var { NativeModules } = require('react-native');
var  RNBridgeModule = NativeModules.RNBridgeModule;


import  ZeroNavigationItem from '../../ZeroNavigationItem'
import ZeroConfig from '../ZeroTool/ZeroConfig';
import ZeroSpaceView from '../ZeroTool/ZeroSpaceView';
import ZeroOrder from './ZeroOrder';
import ZeroHistory from './ZeroHistory';
import ZeroMineAccount from './ZeroMineAccount';
import ZeroShare from './ZeroShare';
const {width,height} = Dimensions.get('window');
export default class ZeroMine extends Component {

    static navigationOptions = ({ navigation }) => ({
        title: '我的账户',
        headerStyle: { backgroundColor: 'white' },
        headerRight: (
            <View style={{ flexDirection: 'row' }}>
                <ZeroNavigationItem
                    icon={require('../../src/Mine/icon_navigationItem_set_white@2x.png')}
                    onPress={() => {
                        AlertIOS.alert('调用设置事件');
                    }}
                />
                <ZeroNavigationItem
                    icon={require('../../src/Mine/icon_navigationItem_message_white@2x.png')}
                    onPress={() => {
                        AlertIOS.alert('调用消息事件');
                    }}
                />
            </View>
        ),
    })


    constructor(props){
        super(props);
        this.state={
            dataSource:new ListView.DataSource({
                rowHasChanged:(r1,r2) => r1!==r2
            }),
        }
    }


    render() {
        return (
            <ListView
                dataSource={this.state.dataSource}
                renderRow={this.renderRow}
                renderHeader={() => this.renderHeader()}
                contentContainerStyle={styles.listViewStyle}//设置cell的样式
                ref={(listView) => { _listView = listView }}
                onScroll={() =>this.scrollViewDidScroll() }
                removeClippedSubviews={false}
            />
        );
    }

    scrollViewDidScroll(){


    }


    onTouchableOpacity(index) {
        //alert('弹出分享框'+index);
        RNBridgeModule.RNOpenVC('弹出分享框');
        //RCTZeroShar.RNOpenVC('弹出分享框');

    }

    renderHeader() {
        return (

            <View >
                <ZeroMineAccount  onTouchableOpacity={(index) => this.onTouchableOpacity(index)}/>
                <ZeroSpaceView/>
                <ZeroShare/>
                <ZeroSpaceView/>
                <ZeroOrder/>
                <ZeroSpaceView/>
                <ZeroHistory/>
                <ZeroSpaceView/>
                <View style={styles.commendStyle}>
                    <Text style={styles.textStyle} >为你推荐</Text>
                </View>

            </View>


        )
    }

    renderRow(rowData,sectionID,rowID,highlightRow){
        return(
            <View style={styles.bgStyle}>
                <Image style={styles.imageStyle}
                       source={{uri:rowData.pic}}
                />
                <Text style={styles.describe}
                      numberOfLines={2}
                >
                    {rowData.name}
                </Text>
                <Text style={styles.price}
                >
                    ¥:{rowData.price}
                </Text>
            </View>
        );

    }


    //发送网络请求
    componentDidMount(){
        this.requestNetwork();
    }

    requestNetwork(){
        fetch(ZeroConfig.api.homeHotCommendGoods_URL)
            .then((response)=>response.json())
            .then((responseJson)=>{
                    let items = [];
                    let {lists} = responseJson.data;
                    lists.map(
                        (info)=>{
                            let productList = info.productList;
                            productList.map(
                                (object)=>{
                                    // console.log(object);
                                    items.push(object);
                                }
                            )
                        }
                    )

                    //刷新界面数据
                    this.setState({
                        dataSource:this.state.dataSource.cloneWithRows(items)
                    })
                }

            ).catch(
            (error)=>{
                console.log('错误信息'+error);
            }
        )
    }




}

//345 × 345
let zoomWidth = (width-30)/2;
let imgHeight = 345*0.5;
let imgWidth = 345*0.5;
const styles = StyleSheet.create({

    textStyle:{
        fontSize:17,
    },
    commendStyle:{
        height:30,
        width:width, //cell的宽度
        //左右剧中
        justifyContent: 'center',
        alignItems: 'center',
        //横向显示
        flexDirection:"row",
    },

    listViewStyle:{
        flexDirection:'row', //设置横向布局
        flexWrap:'wrap'    //设置换行显示
    },
    bgStyle:{
        backgroundColor:'white',
        width:zoomWidth, //cell的宽度
        height:250,
        marginLeft:10,
        marginTop:10,
        borderRadius:5,
        borderWidth: 1,
        borderColor: 'transparent',
    },
    imageStyle:{
        width:imgWidth,
        height:imgHeight,
        // marginBottom:0,
        marginTop:0,
    },
    describe:{
        fontSize:15,
        // marginBottom:0
        marginTop:0,
        marginRight:5,
        marginLeft:5,
    },
    price:{
        fontSize:14,
        marginTop:10,
        marginRight:5,
        marginLeft:5,
        color:'#ff8e4a',
        // fontWeight:('normal'),
        fontWeight:('bold','900'),
        // 字符间距
        letterSpacing:0
    },
});


