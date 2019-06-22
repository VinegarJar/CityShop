

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
import {screenWidth }  from '../../tool/ZeroScreen';
import PropTypes from 'prop-types';
import {CachedImage} from "react-native-img-cache";
import { scaleSize } from '../../tool/index'
export default class ZeroBanner extends Component {

    static propTypes = {
        items: PropTypes.array,//轮播数据源
        onGridSelected:PropTypes.func,
    }

    static defaultProps = {
        items:require('../../data.json').data,
        onGridSelected:()=>{}
    }


    render() {
        const { items,onGridSelected } = this.props;
        return (
            <Swiper
                style={{ backgroundColor: "#efeff4", }}
                height={scaleSize(420)}
                key={items.length}
                autoplayTimeout={4} autoplay={true}
                showsPagination={true} horizontal={true}
                dot={<View style={styles.dotViewStyle}/>}
                activeDot={<View style={styles.activeDotViewStyle}/>}
                paginationStyle={{ bottom: 20 }}>{
                    items.map((item, index) => {
                        return (
                            <View style={styles.imageView} key={index}>
                                 <TouchableOpacity activeOpacity={1} onPress={() =>{onGridSelected(item.link)}}>
                                    <CachedImage style={styles.imageStyle} key={index} source={{ uri: item ? item.pic : "error_url" }} />
                                 </TouchableOpacity>
                            </View>
                        )
                    })
                }
            </Swiper>

        )


    }



}

const styles = StyleSheet.create({

    imageView: {
        width: screenWidth,
        alignItems: 'center',
        justifyContent: 'center',
    },

    imageStyle: {
        height: 210,
        width: screenWidth,
    },

    //原点黑色样式
    dotViewStyle: {
        backgroundColor: 'rgba(0,0,0,.5)',
        width: 8,
        height: 8,
        borderRadius: 4,
        marginLeft: 5,
        marginRight: 5,
        marginTop: 5,
        marginBottom: 5,
    },
    //滚动选择其他颜色样式
    activeDotViewStyle: {
        backgroundColor: 'white',
        width: 8,
        height: 8,
        borderRadius: 4,
        marginLeft: 5,
        marginRight: 5,
        marginTop: 5,
        marginBottom: 5,
    },
 

});
