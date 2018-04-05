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
    ListView,
    Dimensions,
    TouchableOpacity,
} from 'react-native';

const {width} = Dimensions.get('window');
export default class ZeroShare extends Component {

    //声明变量
    constructor(props) {
        super(props);
        var ds = new ListView.DataSource({
            rowHasChanged: (r1, r2) => r1 !== r2
        });
        this.state = {
            //定义数据源
            dataSource: ds.cloneWithRows(this.getDataList()),
        }

    }
    render() {
        return (
            <ListView
                automaticallyAdjustContentInsets={true}
                dataSource={this.state.dataSource}
                renderRow={this.renderRow}
                removeClippedSubviews={false}
            />
        );
    }

    renderRow(rowData, sectionID, rowID, highlightRow) {
        return (
            <TouchableOpacity activeOpacity={0.5}
                              onPress={()=>didSelectedIndexPath(rowData.title)}
            >
                <View style={styles.cellViewStyle}>
                    <Text style={styles.titleStyle}>{rowData
                        .title}</Text>
                    <Image source={rowData.image}
                           style={styles.imageStyle}
                           resizeMode={'stretch'}
                    />
                </View>
            </TouchableOpacity>
        )

    }

    getDataList() {
        return(
            [
                { title: '签到中心', image: require('../../src/Mine/shar@2x.png'),indexPath:0},
                { title: '邀请好友', image: require('../../src/Mine/shar@2x.png'),indexPath:1},
                { title: '帮助中心', image: require('../../src/Mine/shar@2x.png'),indexPath:2},
                { title: '意见反馈', image: require('../../src/Mine/shar@2x.png'),indexPath:3}
            ]
        );
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



