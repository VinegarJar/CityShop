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
    FlatList,
    Dimensions,
    Button


} from 'react-native';

const {width,height}=Dimensions.get('window')
export default class ZeroFlatList extends Component {

    static navigationOptions = ({ navigation }) => ({
        title: '特卖',
        headerStyle: { backgroundColor: 'white' },
    })



    // render() {
    //     return (
    //         <View style={styles.container}>
    //             <Text style={styles.welcome}>
    //                 购物车页面
    //             </Text>
    //         </View>
    //     );
    // }


    // constructor(props) {
    //     super(props);
    //     this.state = {
    //         data: this._sourceData,
    //         refreshing: false, //初始化不刷新
    //         text: ''//跳转的行
    //     };
    // }

    constructor(props) {
        super(props);
    }
    refreshing(){
        let timer =  setTimeout(()=>{
            clearTimeout(timer)
            alert('刷新成功')
        },1500)
    }
    _onload(){
        let timer =  setTimeout(()=>{
            clearTimeout(timer)
            alert('加载成功')
        },1500)
    }
    render() {
        var data = [];
        for (var i = 0; i < 100; i++) {
            data.push({key: i, title: i + ''});
        }

        return (
            <View style={{flex:1}}>
                <Button title='滚动到指定位置' onPress={()=>{
                    this._flatList.scrollToOffset({animated: true, offset: 2000});
                }}/>
                <View style={{flex:1}}>
                    <FlatList
                        ref={(flatList)=>this._flatList = flatList}
                        ListHeaderComponent={this._header}
                        ListFooterComponent={this._footer}
                        ItemSeparatorComponent={this._separator}
                        renderItem={this._renderItem}
                        onRefresh={this.refreshing}
                        refreshing={false}
                        onEndReachedThreshold={0}
                        onEndReached={
                            this._onload
                        }
                        //给cell画框
                        numColumns ={3}
                        columnWrapperStyle={{borderWidth:2,borderColor:'black',paddingLeft:20}}

                        //horizontal={true}

                        getItemLayout={(data,index)=>(
                        {length: 100, offset: (100+2) * index, index}
                        )}

                        data={data}>
                    </FlatList>
                </View>

            </View>
        );
    }


    _renderItem = (item) => {
        var txt = '第' + item.index + '个' + ' title=' + item.item.title;
        var bgColor = item.index % 2 == 0 ? 'red' : 'blue';
        return <Text style={[{flex:1,height:100,backgroundColor:bgColor},styles.txt]}>{txt}</Text>
    }

    _header = () => {
        return <Text style={[styles.txt,{backgroundColor:'black'}]}>这是头部</Text>;
    }

    _footer = () => {
        return <Text style={[styles.txt,{backgroundColor:'black'}]}>这是尾部</Text>;
    }

    _separator = () => {
        return <View style={{height:2,backgroundColor:'yellow'}}/>;
    }


}

const styles = StyleSheet.create({
    // container: {
    //     flex: 1,
    //     justifyContent: 'center',
    //     alignItems: 'center',
    //     backgroundColor: '#F5FCFF',
    // },
    // welcome: {
    //     fontSize: 20,
    //     textAlign: 'center',
    //     margin: 10,
    // },

    container:{

    },
    content:{
        width:width,
        height:height,
        backgroundColor:'yellow',
        justifyContent:'center',
        alignItems:'center'
    },
    cell:{
        height:100,
        backgroundColor:'purple',
        alignItems:'center',
        justifyContent:'center',
        borderBottomColor:'#ececec',
        borderBottomWidth:1

    },
    txt: {
        textAlign: 'center',
        textAlignVertical: 'center',
        color: 'white',
        fontSize: 30,
    }

});



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



} from 'react-native';

const {width,height}=Dimensions.get('window');
var ITEM_HEIGHT = 100;
export default class ZeroSales extends Component {

    static navigationOptions = ({ navigation }) => ({
        title: '特卖',
        headerStyle: { backgroundColor: 'white' },
    })


    _flatList;

    _renderItem = (item) => {
        var txt = '第' + item.index + '个' + ' title=' + item.item.title;
        var bgColor = item.index % 2 == 0 ? 'red' : 'blue';
        return <Text style={[{flex:1,height:ITEM_HEIGHT,backgroundColor:bgColor},styles.txt]}>{txt}</Text>
    }


    _header = () => {
        return <Text style={[styles.txt,{backgroundColor:'black'}]}>这是头部</Text>;
    }

    _footer = () => {
        return <Text style={[styles.txt,{backgroundColor:'black'}]}>这是尾部</Text>;
    }

    //分割线
    _separator = () => {
        return <View style={{height:20,backgroundColor:'yellow'}}/>;
    }

    render() {
        var data = [];
        for (var i = 0; i < 100; i++) {
            data.push({key: i, title: i + ''});
        }

        return (
            <View style={{flex:1}}>
                {/*<Button title='滚动到指定位置' onPress={()=>{*/}
                {/*//this._flatList.scrollToEnd();*/}
                {/*//this._flatList.scrollToIndex({viewPosition:0,index:8});*/}
                {/*this._flatList.scrollToOffset({animated: true, offset: 2000});*/}
                {/*}}/>*/}
                <View style={{flex:1}}>
                    <FlatList
                        ref={(flatList)=>this._flatList = flatList}
                        ListHeaderComponent={this._header}
                        ListFooterComponent={this._footer}
                        ItemSeparatorComponent={this._separator}
                        renderItem={this._renderItem}

                        //numColumns ={3}
                        //columnWrapperStyle={{borderWidth:2,borderColor:'black',paddingLeft:20}}

                        //horizontal={true}

                        //getItemLayout={(data,index)=>(
                        //{length: ITEM_HEIGHT, offset: (ITEM_HEIGHT+2) * index, index}
                        //)}

                        //onEndReachedThreshold={5}
                        //onEndReached={(info)=>{
                        //console.warn(info.distanceFromEnd);
                        //}}

                        //onViewableItemsChanged={(info)=>{
                        //console.warn(info);
                        //}}
                        data={data}>
                    </FlatList>
                </View>

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
    txt: {
        textAlign: 'center',
        textAlignVertical: 'center',
        color: 'white',
        fontSize: 30,
    }
});

