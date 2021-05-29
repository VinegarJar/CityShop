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
    Image,
    FlatList,
    Dimensions,
    TouchableOpacity,
} from 'react-native';

export default class ZeroShare extends Component {

    //声明变量
    constructor(props) {
        super(props);
        this.state = {
            //定义数据源
            dataSource: [
                { title: '签到中心', image: require('../../src/Mine/shar.png'),indexPath:0},
                { title: '邀请好友', image: require('../../src/Mine/shar.png'),indexPath:1},
                { title: '帮助中心', image: require('../../src/Mine/shar.png'),indexPath:2},
                { title: '意见反馈', image: require('../../src/Mine/shar.png'),indexPath:3}
            ],
        }

    }


    render() {
        const {dataSource} = this.state||{};
        return (
            <FlatList
            removeClippedSubviews={false}
            renderItem={this.renderItem}
            keyExtractor={(item, index) => index.toString()}
            ItemSeparatorComponent={this.separator}
            onScroll={this.scrollViewDidScroll}
            onEndReachedThreshold={0.1}
            data={dataSource}>
        </FlatList>
        );
    }

    separator = () => {
        return <View style={{ height: 1, backgroundColor: '#F5F5F9' }} />;
    }
    renderItem = (items) => {
        const {item} = items||{};
        return (
            <TouchableOpacity activeOpacity={0.5}
                              onPress={()=>didSelectedIndexPath(item.title)}
            >
                <View style={styles.cellViewStyle}>
                    <Text style={styles.titleStyle}>{item
                        .title}</Text>
                    <Image source={item.image}
                           style={styles.imageStyle}
                           resizeMode={'stretch'}
                    />
                </View>
            </TouchableOpacity>
        )
    }
   
}

//调用点击事件
const didSelectedIndexPath = (event)=>{
    alert('点击'+event);
}


const styles = StyleSheet.create({

    cellViewStyle:{
        //分割线
        borderBottomWidth:0.5,
        borderBottomColor:'#e8e8e8',
        // //设置主轴方向
        flexDirection:'row',
        backgroundColor:'white',
        height:55,
        alignItems: 'center',
        justifyContent: 'space-between',
    },


    titleStyle:{
        fontSize:15,
        // backgroundColor:'green',
        textAlign:'center',
        marginLeft:30,
    },
    imageStyle:{
        width:30,
        height:30,
        // backgroundColor:'red',
        // marginLeft:100,

        // left:15,
    }
});



