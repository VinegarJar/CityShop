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
    AlertIOS,
    FlatList,
    Image,
    TouchableOpacity,
    Dimensions,
    ScrollView,
} from 'react-native';

import { connect } from "react-redux";
import { Container} from 'native-base';
import FontAwesome from 'react-native-vector-icons/FontAwesome';
import {getGoodsList } from '../../reducers/postAction';
import {apiUrl} from '../../tool/url';
import { scaleSize } from '../../tool/index'

import ZeroBanner from './ZeroBanner';
import ZeroHomeNavigator from './ZeroHomeNavigator';


class ZeroHome extends Component {

    constructor(props) {
        super(props);
        this.state = {
          
        }
    }


    render() {
        return (
            <Container style={styles.container}>
                <ZeroHomeNavigator />
                <ScrollView style={{flex:1,backgroundColor:"#fff"}}>
                    <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)} />
                     <View>
                       <FontAwesome size={20} name={"wpforms"} ></FontAwesome>
                     </View>
                </ScrollView>
                {/* <FlatList
                    removeClippedSubviews={false}
                    style={styles.flatListStyle}
                    contentContainerStyle={styles.cellViewStyle}
                    renderItem={this.renderItem}
                    keyExtractor={(item, index) => index.toString()}
                    ItemSeparatorComponent={this.separator}
                    ListHeaderComponent={this.renderHeader}
                    // refreshControl={
                    //     <RefreshControl
                    //         colors={["#4D78E7"]}
                    //         refreshing={this.state.isRefresh}
                    //         onRefresh={() => this.onRefresh()}
                    //     />
                    // }
                    // onScroll={this._onScroll}
                    // onEndReached={() => this.onLoadMore()}
                    // onEndReachedThreshold={0.1}
                    data={dataSource}>
                </FlatList> */}
            </Container>
        );
    }




    renderItem = (item) => {
       
        return (
            <View >
             
            </View>
        )
    }

    separator = () => {
        return <View style={{height:2,backgroundColor:'yellow'}}/>;
    }

    renderHeader = () => {
        return (
            <View>
                <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)} />
            </View>
        )
    }




    //发送网络请求


    componentDidMount() {
        this.props.getGoodsList(apiUrl.homeGoodsList_URL,{"size":"50", "page":1});

      

    }


    onGridSelected(url: string) {
        //this.props.navigation.navigate('ZeroWebScene', { url: url })
        console.log("=======>",this.props.post); 
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
        marginLeft: scaleSize(30),
        marginRight: scaleSize(30),
        backgroundColor:"#F5F5F9"
    },
});


const mapStatetoProps = (state, props) => ({
  post: state.post,
});

const mapDispatchToProps = dispatch => ({
   getGoodsList: (url,params) => dispatch(getGoodsList(url,params)),
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