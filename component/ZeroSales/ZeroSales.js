/*
 data:代表数据源
 ItemSeparatorComponent:行与行之间的分割线组件
 ListEmptyComponent:累不为空时渲染该组件
 ListFooterComponent:尾部组件
 ListHeaderComponent:头部组件
 getItem：获取每个Item
 debug是否是开发模式
 disableVirtualization：只有在debug模式下才打开( true )，这是个boolean值，用来优化内存和显示用的，也就是在render window外面完全卸载react实例的
 getItemLayout：计算高度。在item固定高度的时候才用的，如果指定了SeparatorComponent，分割线的尺寸也要算到offset中
 horizontal：是否是水平布局
 legacyImplementation：设置为true则使用旧的ListView的实现
 numColumns：布局的列数，这里是1
 onEndReached：滑动到底部的回调函数。通常可以做往数据源中再添加数据
 onRefresh：下拉刷新的回调
 onScroll：滑动时的回调函数，用于对应的偏移量设置

 onViewableItemsChanged：可见区域发生变化的回调，是由viewablePercentThreshold属性定义的
 refreshing：是否刷新
 renderItem：单个item组件的渲染
 viewabilityConfig这是view的配置项，在ViewabilityHelper里面，有四个可配置项，（minimumViewTime、viewAreaCoveragePercentThreshold、itemVisiblePercentThreshold、waitForInteraction）
 scrollToEnd:滚动到底部。如果不设置getItemLayout 属性的话，可能会比较卡。
 scrollToIndex:滚动到指定index的item 如果不设置getItemLayout属性的话，无法跳转到当前可视区域以外的位置。
 scrollToItem:滚动到指定item，如果不设置getItemLayout属性的话，可能会比较卡。
 scrollToOffset:滚动指定距离

 //getItemLayout 是一个可选的优化，用于避免动态测量内容尺寸的开销，不过前提是你可以提前知道内容的高度。如果你的行高是固定的getItemLayout

 //getItemLayout={(data, index) => ( {length: 行高, offset: 行高 * index, index} )}
 //注意如果你指定了SeparatorComponent，请把分隔线的尺寸也考虑到offset的计算之中。
 getItemLayout={(data,index)=>(
 {length: 100, offset: (102) * index, index}
 )}
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    FlatList,
    Dimensions,
    Button,
    ActivityIndicator,
    Image,
    TouchableOpacity,


} from 'react-native';

const {width,height}=Dimensions.get('window');

import ZeroConfig from '../ZeroTool/ZeroConfig';
import ZeroSpaceView from '../ZeroTool/ZeroSpaceView';
import ZeroSalesSection from './ZeroSection';
import ZeroHotGoodsCell from './ZeroHotGoodsCell';
import ZeroBrandSale from './ZeroBrandSale';

export default class ZeroSales extends Component {

    static navigationOptions = ({ navigation }) => ({
        title: '特卖专区',
        headerStyle: { backgroundColor: 'white' },
    })


    constructor(props) {
        super(props);
        this.state = {
             dataSource:[],
             discounts: []
        }
    }




    render() {

        return (

            <View style={styles.container}>

                <FlatList
                    ref={(flatList)=>this._flatList = flatList}
                    ListHeaderComponent={this._headerComponent}
                    ListFooterComponent={this._footerComponent}
                    ItemSeparatorComponent={this._separator}
                    renderItem={this._renderItem}
                    keyExtractor={this._keyExtractor}
                    getItemLayout={(data,index)=>({
                        length: 100,
                        offset: (102) * index,
                        index
                    })}
                    data={this.state.dataSource}>
                </FlatList>
            </View>
        );
    }

    _headerComponent = () => {
        return(
            <View>
                <ZeroSalesSection title='热卖爆款'/>
            </View>
        )
    }

    _footerComponent = () => {
        return(
            <View>
                <ZeroSpaceView/>
                <ZeroSalesSection title='品牌特卖'/>
                <ZeroBrandSale infos={this.state.discounts}
                           onBrandSelected={(info,index) => this.onBrandSelected(info,index)}
                />
            </View>
        )
    }



    _keyExtractor = (item, index) => index;
    //分割线
    _separator = () => {
        return (
            <View style={styles.separatorStyle}/>
        )
    }

    //发送网络请求
    componentDidMount(){
        this.requestNetwork();
        this.requestBrandSale();
    }



    requestNetwork(){
        fetch(ZeroConfig.api.saleHotStyle_URL)
            .then((response)=>response.json())
            .then((responseJson)=>{
                    let items = [];
                    let {list} = responseJson.msg;
                  list.map(
                        (info)=>{
                           // console.log(info);
                            items.push(info);
                        }
                    )
                    //刷新界面数据
                    this.setState({
                        dataSource:this.state.dataSource.concat(items)
                    })
                }
            ).catch(
            (error)=>{
                console.log('特卖错误信息'+error);
            }
        )
    }


    requestBrandSale(){
        fetch(ZeroConfig.api.brandHotGoods_URL)
            .then((response)=>response.json())
            .then((responseJson)=>{

                let {list} = responseJson.msg;
                let items = list.map(
                    (info)=>{
                        return {
                            info
                        }
                    }
                )
                //console.log(items);
                //刷新界面数据
                this.setState({
                    discounts:items
                })

             }).catch(
            (error)=>{
                console.log('特卖错误信息'+error);
            }
        )
    }




    _renderItem = (item) => {
        return(
            <TouchableOpacity
                activeOpacity={1}
                onPress={this.itemClick.bind(this, item, item.index)}>
              <ZeroHotGoodsCell item = {item}/>
            </TouchableOpacity>
        )
    }


    itemClick(item, index) {
        alert('点击了第' + index  + '热卖爆款商品：' + item.item.title);
    }

    onBrandSelected(info,index) {
        alert('点击了第' + index  + '热卖爆款商品：'+ info.info.name);
    }

}

const styles = StyleSheet.create({

    container: {
        flex: 1,
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    separatorStyle:{
        height:0.5,
    }
});


