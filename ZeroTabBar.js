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
    Platform
} from 'react-native';

import {
    StackNavigator,
    TabNavigator,
    TabBarBottom
} from 'react-navigation';


import ZeroHome from './component/ZeroHome/ZeroHome'
import ZeroCategory from './component/ZeroCategory/ZeroCategory'
import ZeroSales from './component/ZeroSales/ZeroSales'
import ZeroCar from './component/ZeroCar/ZeroCar'
import ZeroMine from './component/ZeroMine/ZeroMine'
import ZeroTabBarItem from './ZeroTabBarItem'
import ZeroColor from './tool/ZeroColor'
import  ZeroBanner from './component/ZeroHome/ZeroBanner'
import ZeroWebScene from './component/ZeroTool/ZeroWebScene'
// import { StatusBar } from 'react-native';
import SplashScreen from 'react-native-splash-screen'
import source from './src'

function getCurrentRouteName(navigationState) {
    if (!navigationState) {
        return null;
    }
    const route = navigationState.routes[navigationState.index];
    // dive into nested navigators
    if (route.routes) {
        return getCurrentRouteName(route);
    }
    return route.routeName;
}



export default class ZeroTabBar extends Component {


    constructor(props){
        super(props);
        //  StatusBar.setBarStyle('light-content')
    }

    componentDidMount() {
        SplashScreen.hide();
    }

    render() {
        return (
            <Navigator
                onNavigationStateChange={
                    (prevState, currentState) => {
                        const currentScene = getCurrentRouteName(currentState);
                        const previousScene = getCurrentRouteName(prevState);
                    }
                }

            />
        );
    }
}

/*
 导航配置
 screen：对应界面名称，需要填入import之后的页面。
 navigationOptions：配置StackNavigator的一些属性。
 title：标题，如果设置了这个导航栏和标签栏的title就会变成一样的，所以不推荐使用这个方法。
 header：可以设置一些导航的属性，当然如果想隐藏顶部导航条只要将这个属性设置为null就可以了。
 headerTitle：设置导航栏标题，推荐用这个方法。
 headerBackTitle：设置跳转页面左侧返回箭头后面的文字，默认是上一个页面的标题。可以自定义，也可以设置为null
 headerTruncatedBackTitle：设置当上个页面标题不符合返回箭头后的文字时，默认改成"返回"。（上个页面的标题过长，导致显示不下，所以改成了短一些的。）
 headerRight：设置导航条右侧。可以是按钮或者其他。
 headerLeft：设置导航条左侧。可以是按钮或者其他。
 headerStyle：设置导航条的样式。背景色，宽高等。如果想去掉安卓导航条底部阴影可以添加elevation: 0，iOS下用shadowOpacity: 0。
 headerTitleStyle：设置导航条文字样式。安卓上如果要设置文字居中，只要添加alignSelf:'center'就可以了。在安卓上会遇到，如果左边有返回箭头导致文字还是没有居中的问题，最简单的解决思路就是在右边也放置一个空的按钮。
 headerBackTitleStyle：设置导航条返回文字样式。
 headerTintColor：设置导航栏文字颜色。总感觉和上面重叠了。
 headerPressColorAndroid：安卓独有的设置颜色纹理，需要安卓版本大于5.0
 gesturesEnabled：是否支持滑动返回手势，iOS默认支持，安卓默认关闭
 gestureResponseDistance：对象覆盖触摸从屏幕边缘开始的距离，以识别手势。 它需要以下属性：
 horizontal - number - 水平方向的距离 默认为25。
 vertical - number - 垂直方向的距离 默认为135。 
 */

const Tab = TabNavigator(
    {
         Home:{
             screen:ZeroHome,
             navigationOptions: ({ navigation }) => ({
                 tabBarLabel: '首页',
                 //隐藏导航栏属性
                 header:null,
                 tabBarIcon: ({ focused, tintColor }) => (
                     <ZeroTabBarItem
                         tintColor={tintColor}
                         focused={focused}
                         normalImage={source.tabBarItem.home_Normal()}
                         selectedImage={source.tabBarItem.home_Selected()}
                     />
                 )
             }),
         },
         Category:{
            screen:ZeroCategory,
            navigationOptions: ({ navigation }) => ({
                tabBarLabel: '分类',
                tabBarIcon: ({ focused, tintColor }) => (
                    <ZeroTabBarItem
                        tintColor={tintColor}
                        focused={focused}
                        normalImage={source.tabBarItem.category_Normal()}
                        selectedImage={source.tabBarItem.category_Selected()}
                    />
                )
            }),
        },
         Sales:{
            screen:ZeroSales,
            navigationOptions: ({ navigation }) => ({
                tabBarLabel: '特卖',
                tabBarIcon: ({ focused, tintColor }) => (
                    <ZeroTabBarItem
                        tintColor={tintColor}
                        focused={focused}
                        normalImage={source.tabBarItem.saleSell_Normal()}
                        selectedImage={source.tabBarItem.saleSell_Selected()}
                    />
                )
            }),
        },
         Car:{
            screen:ZeroCar,
            navigationOptions: ({ navigation }) => ({
                tabBarLabel: '购物车',
                tabBarIcon: ({ focused, tintColor }) => (
                    <ZeroTabBarItem
                        tintColor={tintColor}
                        focused={focused}
                        normalImage={source.tabBarItem.car_Normal()}
                        selectedImage={source.tabBarItem.car_Selected()}
                    />
                )
            }),
        },
         Mine:{
            screen:ZeroMine,
            navigationOptions: ({ navigation }) => ({
                tabBarLabel: '我的账户',
                tabBarIcon: ({ focused, tintColor }) => (
                    <ZeroTabBarItem
                        tintColor={tintColor}
                        focused={focused}
                        normalImage={source.tabBarItem.me_Normal()}
                        selectedImage={source.tabBarItem.me_Selected()}
                    />
                )
            }),
        },
    },
    {
        tabBarComponent: TabBarBottom,
        tabBarPosition: 'bottom',
        swipeEnabled: false,// 是否可以左右滑动切换tab
        animationEnabled: false, // 切换页面时是否有动画效果
        lazy: true,
        tabBarOptions: {
            activeTintColor: ZeroColor.theme,
            inactiveTintColor: '#414141',
            style: {backgroundColor: '#ffffff' },
        },

    }
)


const Navigator = StackNavigator(

    {
        Tab: { screen: Tab },
        ZeroBanner: { screen: ZeroBanner },
        ZeroWebScene: { screen: ZeroWebScene },
    },
    {
        navigationOptions: {
            headerBackTitle: null,
            headerTintColor: '#333333',
            showIcon: true,
            headerStyle: { backgroundColor: ZeroColor.theme,}
        },
    },


);

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
});


