/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow command +m 调试
 */

import React, { Component } from 'react';
import {
    StyleSheet,
    Text,
    View,
    RefreshControl,
    FlatList,
    Image,
    TouchableOpacity,
    ImageBackground,
} from 'react-native';

import { connect } from "react-redux";
import { CachedImage } from "react-native-img-cache";
import PropTypes from 'prop-types';



import { getGoodsList } from '../../reducers/postAction';
import { apiUrl } from '../../tool/url';
import { scaleSize } from '../../tool/index'
import { screenWidth } from '../../tool/ZeroScreen';
import ZeroBanner from './ZeroBanner';
import ZeroHomeNavigator from './ZeroHomeNavigator';
import source from '../../src'
import ZeroSalesSection from '../ZeroSales/ZeroSection';


export class ZeroHotItem extends Component {


    static propTypes = {
        productList: PropTypes.array,
        title: PropTypes.string,
        onPressHotItem: PropTypes.func,
    }

    static defaultProps = {
        productList: [],
        title: "",
        onPressHotItem: () => { }
    }

    render() {
        const { productList, onPressHotItem, title } = this.props;
        return (
            <View style={{ flex: 1, }} >
                <View style={{ paddingVertical: scaleSize(15) }}>
                    <ZeroSalesSection title={title} />
                </View>
                <View style={styles.hotItemStyle}>
                    {
                        productList.map((item, index) => {
                            return (
                                <TouchableOpacity key={index} onPress={() => { onPressHotItem(item) }} activeOpacity={1} >
                                    < ImageBackground style={{ width: screenWidth / productList.length - scaleSize(15), height: scaleSize(item.height), justifyContent: "flex-start", }}
                                        resizeMode='cover' source={{ uri: item ? item.pic : "error_url" }}>
                                        <Text style={{ fontSize: 13, fontWeight: ('bold', '500'), fontFamily: 'Times', }}>{item.title || ""}</Text>
                                    </ ImageBackground>
                                </TouchableOpacity>
                            )
                        })
                    }
                </View>

            </View>
        );
    }
}




export class ZeroListItem extends Component {


    static propTypes = {
        item: PropTypes.object,//轮播数据源
        onGridPress: PropTypes.func,
    }

    static defaultProps = {
        item: {},
        onGridPress: () => { }
    }

    render() {

        const { item, onGridPress } = this.props;
        const { hd_thumb_url = null, goods_name = null, group = null, sales_tip = null, short_name = null } = item;

        return (
            <View style={styles.cellItemStyle} >
                <TouchableOpacity onPress={onGridPress} activeOpacity={1} style={{ paddingHorizontal: scaleSize(10) }}>
                    <View style={{ backgroundColor: "#fff", borderRadius: scaleSize(5) }}>
                        <CachedImage style={styles.imageStyle} resizeMode='stretch' source={{ uri: item ? hd_thumb_url : "error_url" }} />
                        <View style={{ width: "100%", paddingHorizontal: scaleSize(10), paddingVertical: scaleSize(5) }}>
                            <Text style={styles.titleStyle}>{short_name}</Text>
                        </View>
                        <View style={{ width: "100%", paddingHorizontal: scaleSize(10), paddingVertical: scaleSize(5), flexDirection: 'row', justifyContent: "space-between", }}>
                            <Text style={styles.textStyle}>{"¥" + group.price.toFixed(2)}</Text>
                            <Text style={styles.textStyle}>{sales_tip}</Text>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
        );
    }
}




class ZeroHome extends Component {


    static navigationOptions = ({ navigation }) => ({
        header : (
            <ZeroHomeNavigator />
        ),
    })


    constructor(props) {
        super(props);
        this.state = {
            isRefresh: false, // 下拉刷新
        }
    }


    render() {
        const { goods_list = [] } = this.props.post.data || {};
        return (
            <View style={styles.container}>
                <FlatList
                    removeClippedSubviews={false}
                    style={styles.flatListStyle}
                    contentContainerStyle={styles.cellViewStyle}
                    renderItem={this.renderItem}
                    keyExtractor={(item, index) => index.toString()}
                    ItemSeparatorComponent={this.separator}
                    ListHeaderComponent={this.renderHeader}
                    numColumns={2}
                    refreshControl={
                        <RefreshControl
                            colors={["#EB5148"]}
                            refreshing={this.state.isRefresh}
                            onRefresh={() => this.onRefresh()}
                        />
                    }
                    onScroll={this._onScroll}
                    onEndReachedThreshold={0.1}
                    data={goods_list}>
                </FlatList>
            </View>
        );
    }




    renderItem = (item) => {
        return (
            <ZeroListItem key={item.index} item={item.item} onGridPress={() => this.onGridPress(item.item)}> </ZeroListItem>

        )
    }

    onRefresh = () => {
        this.setState({ isRefresh: true, });
        let timer = setTimeout(() => {
            clearTimeout(timer)
            this.setState({ isRefresh: false, });
        }, 1500)
    }

    _onScroll = (evt) => {


    }




    separator = () => {
        return <View style={{ height: scaleSize(15), backgroundColor: '#F5F5F9' }} />;
    }

    renderHeader = () => {
        const { data_list = [] } = source.data;
        const { lists = [] } = source.hot_list;
        return (
            <View style={{ width: "100%" }}>
                <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)} />
                <View style={styles.itemViewStyle}>
                    {
                        data_list.map((item, index) => {
                            return (
                                <View style={{ width: "25%", paddingVertical: scaleSize(15) }} key={index}>
                                    <TouchableOpacity onPress={() => { alert(item.name) }} activeOpacity={1} key={index} style={{ justifyContent: "center", alignItems: "center", }}>
                                        <Image style={{ width: scaleSize(100), height: scaleSize(100), resizeMode: "center" }} source={item.pic} />
                                        <Text style={styles.titleStyle}>{item.name}</Text>
                                    </TouchableOpacity>
                                </View>
                            )
                        })
                    }
                </View>
                <View >
                    {
                        lists.map((item, index) => {
                            const { productList = [], tabName = null } = item;
                            return (
                                <ZeroHotItem key={index} title={tabName} productList={productList} onPressHotItem={(item) => { alert(item.name) }} />
                            )
                        })
                    }
                </View>
                <View style={{ paddingVertical: scaleSize(15) }}>
                    <ZeroSalesSection title='发现好货' />
                </View>
            </View>
        )
    }




    //发送网络请求


    componentDidMount() {

        this.getGoodsList();
    }

    getGoodsList() {
        this.props.getGoodsList(apiUrl.homeGoodsList_URL, { "size": "60", "page": 1 });
    }

    onGridSelected(url: string) {
        this.props.navigation.navigate('ZeroWebScene', { url: url })
    }

    onGridPress(item: object) {
        //console.log("item=======>", item);
        alert(item.short_name)
    }


}


const styles = StyleSheet.create({
    container: {
        flex: 1,
    },
    cellViewStyle: {
        flexDirection: 'row',
        justifyContent: "space-between",
        flexWrap: 'wrap',
    },

    flatListStyle: {
        backgroundColor: "#F5F5F9"

    },
    cellItemStyle: {
        width: "50%",
    },
    imageStyle: {
        width: "100%",
        height: scaleSize(445),
    },
    titleStyle: {
        fontSize: scaleSize(26),
        color: "#333333",
        // fontFamily: 'semiboldFontFamily',
    },

    textStyle: {
        fontSize: scaleSize(22),
        // fontWeight: ('bold', '700'),
        //  fontFamily: 'Times',
        //文字加横线 'underline'(下划线)
        // extDecorationLine:'line-through',
        color: "#EB5148",
    },
    itemViewStyle: {
        backgroundColor: "#fff",
        flexDirection: 'row',
        justifyContent: "space-between",
        flexWrap: 'wrap',
        alignItems: "center",
    },
    hotItemStyle: {
        flexDirection: 'row',
        alignItems: "flex-start",
        justifyContent: "space-around",
    }
});


const mapStatetoProps = (state, props) => ({
    post: state.post,
});

const mapDispatchToProps = dispatch => ({
    getGoodsList: (url, params) => dispatch(getGoodsList(url, params)),
});

export default connect(mapStatetoProps, mapDispatchToProps)(ZeroHome);
