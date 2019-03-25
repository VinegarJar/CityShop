

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
import ZeroScreen from '../../tool/ZeroScreen';
import PropTypes from 'prop-types';

var ImageData  = require('../../data.json');



export default class ZeroBanner extends Component {

    static propTypes = {
        items: PropTypes.array,//轮播数据源
    }

    static defaultProps = {
        items:require('../../data.json').data,
    }


    render() {
        const { items, } = this.props;
        return (
            <Swiper
                style={{ backgroundColor: "#efeff4", }}
                height={230}
                key={items.length}
                autoplayTimeout={4} autoplay={true}
                showsPagination={true} horizontal={true}
                dot={<View style={styles.dotViewStyle}/>}
                activeDot={<View style={styles.activeDotViewStyle}/>}
                paginationStyle={{ bottom: 20 }}>{
                    items.map((item, index) => {
                        return (
                            <View style={styles.imageView} key={index}>
                                {
                                    <Image style={styles.imageStyle} key={index} source={{ uri: item ? item.pic : "error_url" }} />
                                }
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
        width: ZeroScreen.width,
        alignItems: 'center',
        justifyContent: 'center',
    },

    imageStyle: {
        height: 210,
        width: ZeroScreen.width,
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
