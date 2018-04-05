//轮播图实现方式二

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    Image,
    Dimensions,
    TouchableOpacity
} from 'react-native';



import Swiper from 'react-native-swiper';
var ImageData = require('../../data.json');
const {width} = Dimensions.get('window');
export default class ZeroBanner extends Component {





    //声明变量
    constructor(props){
        super(props);
        this.state = {
            items:[],
            swiperShow:false,
        }

    }


    componentDidMount() {
        setTimeout(()=>{
            this.setState({
                swiperShow:true
            });
        },0);

        let items = ImageData.data.map(
            (info)=>{
                return {
                    link: info.link,
                    pic: info.pic,
                }
            }
        )
        //console.log('获取数据'+items);
        this.setState({
            items:items
        })
    }

    render() {
        if(this.state.swiperShow){
            return (
            <View style={styles.container} >
                <Swiper style={styles.wrapper}
                        autoplayTimeout={5} //每隔4秒切换
                        autoplay={true}   //自动轮播
                        showsPagination={true}
                        //滚动方向
                        horizontal={true}

                        dot={<View style={styles.dotViewStyle}/>}
                        activeDot={<View style={styles.activeDotViewStyle}/>}
                        paginationStyle={{bottom: 5}}
                >

                    {this.state.items.map((item, index) => {
                        console.log(index);
                        return (
                            <TouchableOpacity
                                  activeOpacity={1}
                                  style={styles.container}
                                  key = {index}
                                  onPress = {() => this.props.onGridSelected(item.link)}
                                  //()=>this.click(item.link)
                            >
                            <Image style={styles.image}

                                   key = {index}
                                   resizeMode='cover'
                                   source={{uri:item.pic}}
                            />
                            </TouchableOpacity>)
                    })}

                </Swiper>
            </View>

        );
        }else {
            return (
                <View style={{height:200}}>
                    <Image source={ require('../../src/Home/banner.jpg')} style={styles.bannerImg} />
                </View>
            );
        }
    }



}

let zoomHeight = (218/375)*width;
const styles = StyleSheet.create({
    container: {
        backgroundColor: '#F5FCFF',
        height:zoomHeight,
        alignItems:'center',
    },

    wrapper: {
    },
    image: {
        width:width,
        height:zoomHeight,
    },

    //原点黑色样式
    dotViewStyle:{
        backgroundColor:'rgba(0,0,0,.5)',
        width: 8,
        height: 8,
        borderRadius: 4,
        marginLeft: 5,
        marginRight: 5,
        marginTop: 5,
        marginBottom: 5,
    },
    //滚动选择其他颜色样式
    activeDotViewStyle:{
        backgroundColor:'white',
        width: 8,
        height: 8,
        borderRadius: 4,
        marginLeft: 5,
        marginRight: 5,
        marginTop: 5,
        marginBottom: 5,
    },
    bannerImg: {
        width: '100%',
        height: 200,
        // flex: 1
    }

});
