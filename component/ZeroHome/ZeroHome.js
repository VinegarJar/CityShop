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
    ListView,
    Image,
    TouchableOpacity,
    Dimensions,
    ScrollView,
} from 'react-native';



const {width,height} = Dimensions.get('window');
import ZeroBanner from './ZeroBanner'
import ZeroHomeNavigator from './ZeroHomeNavigator'
import ZeroConfig from '../ZeroTool/ZeroConfig';
import ZeroWebScene from '../ZeroTool/ZeroWebScene';
import ZeroSpaceView from '../ZeroTool/ZeroSpaceView';

export default class ZeroHome extends Component {

    constructor(props){
        super(props);
        this.state={
            dataSource:new ListView.DataSource({
                rowHasChanged:(r1,r2) => r1!==r2
            }),
            //暂停
            paused: false,
        }
    }



    render() {
        return (

            <View style={styles.container}>

                <ZeroHomeNavigator/>
                <ListView
                    dataSource={this.state.dataSource}
                    renderRow={this.renderRow}
                    //renderFooter={this.renderFooter}
                    renderHeader={() => this.renderHeader()}
                    contentContainerStyle={styles.listViewStyle}//设置cell的样式
                    ref={(listView) => { _listView = listView }}
                    onScroll={() =>this.scrollViewDidScroll() }
                    removeClippedSubviews={false}
                />


                <TouchableOpacity
                    activeOpacity={1}
                    onPress = {()=>this.backToTop()}>
                <View style={styles.backToTop}>
                    {/*<Image*/}
                        {/*source={require('../../src/Home/search@2x.png')}*/}
                        {/*style={styles.backToImage}*/}
                    {/*/>*/}
                </View>
                </TouchableOpacity>
                <View style={styles.footerStyles}>

                </View>
            </View>



        );
    }




    renderHeader() {
        return (
            <View>
                <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)}/>
            </View>
        )
    }

    // renderFooter(){
    //     return (
    //         <View>
    //         </View>
    //     )
    // }
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


    onGridSelected(url:string) {
        this.props.navigation.navigate('ZeroWebScene',{url:url })
    }

    backToTop(){
        // alert('发布会');
        {_listView.scrollTo({y: 0});}
    }

    scrollViewDidScroll(){

    }
}



//调用点击事件
const pushViewController = ()=>{
   //AlertIOS.alert('哈哈哈');

}

//345 × 345
let zoomWidth = (width-30)/2;
let imgHeight = 345*0.5;
let imgWidth = 345*0.5;
const styles = StyleSheet.create({
    container:{
      height:height-50,
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

    backToTop:{
        // backgroundColor:'red',
        width:50,
        height:50,
        position:'absolute',
        right:30,
        bottom:100,
        justifyContent: 'center',
        alignItems: 'center',
    },
    backToImage:{
        width:30,
        height:30,
    },
    renderFooterStyle: {
        height:49,
        backgroundColor:'red',
    },
});


