/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */


/**
 * 
 *  待付款 url: 'order_all?ckzt=dfk', statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    待发货 url: 'order_all?ckzt=dfh',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    已发货 url: 'order_all?ckzt=yfh',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    已收货 url: 'order_all?ckzt=ysh',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    待收货url: 'whole_order?type=dsh',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    发布商品 url: 'choosecategory',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    商品管理 url: 'goodsmanage',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    买家求购 url: 'askbuylist',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    店铺管理 url: 'shops_manage',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    分销管理url: 'retail_manage',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    收藏夹  url: 'collection',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    我的供应商 url: 'my_partner',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    员工管理 url: 'staff_manage',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
    资金管理 url: 'fund_manage',statusBar: { barStyle: 'light-content', backgroundColor: '#2473d5' } }
    全部订单 (销售/采购) url: ' order_all?ckzt=dfk/whole_order?type=dfk',statusBar: { barStyle: 'dark-content', backgroundColor: '#ffffff' } }
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


import ZeroBanner from './ZeroBanner'
import ZeroHomeNavigator from './ZeroHomeNavigator'


export default class ZeroHome extends Component {

    constructor(props){
        super(props);
        this.state={
           
        }
    }



    render() {
        return (

            <View style={styles.container}>
                <ZeroHomeNavigator/>
                <ZeroBanner onGridSelected={(url) => this.onGridSelected(url)}/>
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

   


    //发送网络请求
    componentDidMount(){
   
    }


    onGridSelected(url:string) {
        this.props.navigation.navigate('ZeroWebScene',{url:url})
    }

    
  
}


const styles = StyleSheet.create({
    container:{
       flex:1,
    },
    
});


