/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow command +m 调试
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    RefreshControl,
    FlatList,
    Image,
    TouchableOpacity,
    Dimensions,
    ScrollView,
    ImageBackground
} from 'react-native';

import { connect } from "react-redux";
import { Container } from 'native-base';
import FontAwesome from 'react-native-vector-icons/FontAwesome';
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
            <View style={{ flex:1, }} >
                <View style={{ paddingVertical: scaleSize(15) }}>
                    <ZeroSalesSection title={title} />
                </View>
                <View style={styles.hotItemStyle}>
                    {
                        productList.map((item, index) => {
                            return (
                                <TouchableOpacity key = {index} onPress={()=>{onPressHotItem(item)}} activeOpacity={1} >
                                    < ImageBackground   style={{ width:screenWidth/productList.length-scaleSize(15),height:scaleSize(item.height),justifyContent:"flex-start",}} 
                                                   resizeMode='cover' source={{ uri: item ? item.pic : "error_url" }}>
                                                     <Text style={{ fontSize:13,fontWeight:('bold','500'),fontFamily: 'Times',}}>{item.title||""}</Text>
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

    constructor(props) {
        super(props);
        this.state = {
            isRefresh: false, // 下拉刷新
        }
    }


    render() {
        const { goods_list = [] } = this.props.post.data || {};
        return (
            <Container style={styles.container}>
                <ZeroHomeNavigator />
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
            </Container>
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
                                <ZeroHotItem key={index} title={tabName} productList={productList} onPressHotItem = {(item) => { alert(item.name) }} />
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
    hotItemStyle:{
        flexDirection: 'row',
        alignItems:"flex-start",
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


/**       
 * 
class SalesOrder extends Component {

    constructor(props) {
        super(props);
        this.state = {
            tabSource: [
                '待付款',
                '待发货',
                '已发货',
                '全部',
            ],
            tabIndex: [
                { index: 'no_pay' },
                { index: 'no_shipped' },
                { index: 'shipped' },
                { index: 'all' },
            ],

            dataSource: [],   //销售订单数据源
            total: 0,//订单总个数
            last_page: 0,//总页数
            loading: true,   //加载
            currentIndex: 0,//当前标签
            isRefresh: false, // 下拉刷新

            isLoadMore: false, // 加载更多
            isHiddeLoad: true,//是否隐藏加载视图
            isrefreshStatus: true,//默认上拉刷新
            models: false,//发货选择
            id: "",//订单编号
        }

        this.navStyle = {
            icon: { name: 'return', color: '#333333', size: SCALESIZE(35) },
            titleStyle: { color: '#000000', fontFamily: AppTheme.semiboldFontFamily, fontSize: SCALESIZE(34) },
            title: "销售订单"
        }
    }





    currentPage = 1//当前页码

    render() {
        const { tabSource, dataSource, loading, currentIndex, isRefresh, models } = this.state;
        return (
            <Container style={{ flex: 1, backgroundColor: AppTheme.Color_FFFFFF }}>
                <Header leftIcon
                    title={this.navStyle.title}
                    titleStyle={this.navStyle.titleStyle}
                    leftIconProps={this.navStyle.icon} borderBottomWidth={0}
                    leftOnPress={this._goBack} />
                <SegTabs ref="tabs" items={tabSource} onChangeTab={this.onChangeTab} currentIndex={currentIndex}></SegTabs>
                <FlatList
                    removeClippedSubviews={false}
                    style={{ flex: 1, backgroundColor: "#fff" }}
                    contentContainerStyle={{ minHeight: '100%' }}
                    renderItem={this.renderItem}
                    keyExtractor={(item, index) => index.toString()}
                    ItemSeparatorComponent={this.separator}
                    ListHeaderComponent={this.separator}
                    ListFooterComponent={this.moreLayout}
                    ListEmptyComponent={() =>
                        loading ?
                            <View style={styles.emptViewStyle}>
                                <ActivityIndicator size="small" colors={'#4D78E7'} animating={loading}>
                                </ActivityIndicator>
                            </View> : <OrderEmptystate title={"抱歉,暂无相关订单"}></OrderEmptystate>
                    }
                    refreshControl={
                        <RefreshControl
                            colors={["#4D78E7"]}
                            refreshing={this.state.isRefresh}
                            onRefresh={() => this.onRefresh()}
                        />
                    }
                    onScroll={this._onScroll}
                    onEndReached={() => this.onLoadMore()}
                    onEndReachedThreshold={0.1}
                    data={dataSource}>
                </FlatList>
                {
                    models ?
                        < OrderActionSheet colse={(index) => { this.closCarModels(index); }} /> : true
                }

            </Container>
        )
    }

    _goBack = () => {
        this.props.navigation.pop()
    }



    renderItem = (data) => {
        let item = data.item;
        return (
            <OrderCell data={item}
                commodity={() => {

                    // this.props.navigation.navigate("Freight", {pname:"POWEREN",id:item.id}); 
                    console.log("点击事件发货", item.id);
                    this.setState({ models: true, id: item.id });
                }}
                onPress={() => {
                    console.log("点击事件")
                    //this.props.navigation.navigate("Hitchhiking", {pname:"POWEREN",id:item.id,});
                    // this.props.navigation.navigate('H5WebView', { url: 'order_detail?ddid=' + item.id, pname: "POWEREN", });
                    this.props.navigation.navigate("SalesOrderDetails", {
                        item: item, id: item.id, pname: "POWEREN", callback: (data) => {
                            console.log('SalesOrderDetails------callback',data);
                            
                            if(data.type == "updateOrderStatus"){
                                this._setCount()
                                this.onChangeTab(2);   
                            }
                        }
                    });

                }} >
            </OrderCell>
        )
    }


    componentWillMount() {
        this._setCount()
        this.onRefreshData = EventEmitterCenter.registerReceiver(EventTypeCenter.registerEvent("SalesOrder"), ({ type, data }) => {
            this.onRefresh();
            EventEmitterCenter.emit('refreshCount')
        })
    }

    _setCount = () => {
        const { uid, token } = this.props.user;
        UserSet.getMySaleData({ uid: uid, token: token }).then(res => {
            const { status, data } = res;
            if (status == 0) {
                console.log('getMySaleData---0', data);
                const all = Number(data.no_pay).Add(Number(data.no_shipped)).Add(Number(data.shipped)).Add(Number(data.close)).Add(Number(data.completed)).Add(Number(data.return)).Add(Number(data.receipt));
                let dataS = [
                    `待付款(${data.no_pay})`,
                    `待发货(${data.no_shipped})`,
                    `已发货(${data.shipped})`,
                    `全部(${all})`,
                ]

                this.setState({
                    tabSource: dataS
                })
            }
        });
    }

    componentWillUnmount() {
        this.onRefreshData && this.onRefreshData.remove();
    }

    //关闭弹出框
    closCarModels = (index) => {

        this.setState({ models: false });
        const { id } = this.state;


        switch (index) {
            case 0: {//货运

                this.props.navigation.navigate("Freight", {
                    pname: "POWEREN", id: id, callback: (data) => {
                        if (data.status == 0) {
                            this.onChangeTab(2);
                        }
                    }
                });
            } break;
            case 1: {//顺风车

                this.props.navigation.navigate("Hitchhiking", {
                    pname: "POWEREN", id: id, callback: (data) => {
                        if (data.status == 0) {
                            this.onChangeTab(2);
                        }
                    }
                });

            } break;
            default:
                break;
        }
    };


    separator = () => {
        return (
            <View style={style = { flex: 1, height: SCALESIZE(24), backgroundColor: '#f5f5f9' }} />
        )
    }


    moreLayout = () => {
        return (
            this.state.isLoadMore ?
                <View style={styles.moreLayout}>
                    {
                        this.state.isHiddeLoad ?
                            <ActivityIndicator size="small" color={AppTheme.Color_B7B7B7} /> : <Text> 数据已全部加载</Text>
                    }
                </View> : <View></View>
        )
    }


    onRefresh = () => {
        this.setState({ isrefreshStatus: true })
        this.setRefreshStartState("start");
        this._setCount();
    }

    _onScroll = (evt) => {


    }


    onLoadMore = () => {
        console.log("滑动开始加载更多1", this.currentPage);


        if (this.currentPage < this.state.last_page) {
            console.log("开始加载更多2", this.state.last_page, this.state.isrefreshStatus);


            this.currentPage = this.currentPage + 1;
            this.setState({ isrefreshStatus: false, isLoadMore: true, isHiddeLoad: true })
            const { tabIndex, currentIndex } = this.state;
            this.getMyordersList(tabIndex[currentIndex]);
            this._setCount();

        } else {
            if (this.currentPage <= this.state.last_page) {
                this.setState({ isLoadMore: true, isHiddeLoad: false })
            }
            console.log("数据已经加载完毕3=====>");


        }




    }

    setRefreshStartState = (operation) => {
        let isrefresh = operation === "start" ? true : false;
        if (operation === "start") { this.currentPage = 1; }
        this.setState({ isRefresh: isrefresh, });
        const { tabIndex, currentIndex } = this.state;
        this.getMyordersList(tabIndex[currentIndex]);
    }



    onChangeTab = (index) => {
        this.currentIndex = index;
        const { tabIndex } = this.state;
        this.currentPage = 1;
        // console.log('onChangeTab--------->',index);

        this.setState({ currentIndex: index, isLoadMore: false, dataSource: [], loading: true });
        this.getMyordersList(tabIndex[index]);
    }


    componentDidMount() {
        const { index } = this.props.navigation.state.params;
        const { tabIndex } = this.state;
        this.setState({ currentIndex: index });
        this.getMyordersList(tabIndex[index]);

    }


    getMyordersList(items) {
        var index = items.index;
        const { uid, token } = this.props.user;
        UserSalesOrder.getSalesOrderList({ uid: uid, token: token, page_size: 10, page: this.currentPage, }, index).then(res => {
            const { status, data } = res;
            let resData;
            if (status == 0) {
                if (this.state.isrefreshStatus) {
                    resData = data.data;
                } else {
                    resData = this.state.dataSource.concat(data.data);
                }
                this.setState({ dataSource: resData, total: data.total, last_page: data.last_page, loading: false, isRefresh: false });

            } else {
                this.setState({ dataSource: [], total: 0, last_page: 0, loading: false, isRefresh: false });
            }


        });
    }



}


const styles = StyleSheet.create({

    emptViewStyle: {
        flex: 1,
        height: SCREENH / 2,
        justifyContent: "center",
        alignItems: "center",
    },
    moreLayout: {
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        height: 50
    },

});



const mapStateToProps = (state) => ({
    user: state.AppModule.user,
    checkjoin: state.AppModule.checkjoin,
});

const mapDispatchToProps = dispatch => ({

});

export default connect(mapStateToProps, mapDispatchToProps)(SalesOrder);
 */