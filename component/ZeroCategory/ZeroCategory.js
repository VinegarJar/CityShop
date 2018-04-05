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
    View
} from 'react-native';

export default class ZeroCategory extends Component {

    static navigationOptions = ({ navigation }) => ({

        headerTitle:'点我搜索'

        // headerTitle: (
        //     <Text>
        //         点我搜索
        //     </Text>
        // <TouchableOpacity style={styles.searchBar}>
        //     <Image source={require('../../img/Home/search_icon.png')} style={styles.searchIcon} />
        //     <Paragraph>点我搜索</Paragraph>
        // </TouchableOpacity>
        // ),
        // headerRight: (
        //     <NavigationItem
        //         icon={require('../../img/Home/icon_navigationItem_message_white@2x.png')}
        //         onPress={() => {
        //
        //         }}
        //     />
        // ),
        // headerLeft: (
        //     <NavigationItem
        //         title='上海'
        //         titleStyle={{ ZeroColor: 'white' }}
        //         onPress={() => {
        //
        //         }}
        //     />
        // ),
        //  headerStyle: { backgroundColor: 'white' },
    })

    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.welcome}>
                    商品分类页面
                </Text>
            </View>
        );
    }
}

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


