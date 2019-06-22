/**
 * Copyright (c) 2017-present, dudongge
 * All rights reserved.
 *
 * https://github.com/dudongge/DDGMeiTuan
 * copyright by dudodongge
 */


import React, { Component } from 'react';
import { View, Platform, StyleSheet, WebView, InteractionManager } from 'react-native';



export default class ZeroWebScene extends Component {

    static navigationOptions = ({ navigation }) => ({
        headerStyle: { backgroundColor: '#EB5148', height: Platform.OS === 'ios' ? 64 : 84, },
        title: navigation.state.params.title,
    });

    constructor(props) {
        super(props);
        this.state = {
            source: {}
        }
        this.props.navigation.setParams({ title: '加载中..' })
    }

    render() {
        return (
            <View style={styles.container}>
                <WebView
                    ref='webView'
                    automaticallyAdjustContentInsets={false}
                    style={styles.webView}
                    source={this.state.source}
                    onLoadEnd={(e) => this.onLoadEnd(e)}
                    scalesPageToFit
                />
            </View>
        );
    }

    componentWillMount() {
        InteractionManager.runAfterInteractions(() => {
            this.setState({ source: { uri: this.props.navigation.state.params.url } })
        })
    }

    onLoadEnd(e) {
        if (e.nativeEvent.title.length > 0&&e.nativeEvent.title!=="about:blank") {
            this.props.navigation.setParams({ title: e.nativeEvent.title })
        }
    }
    
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#2c3e50',
    },
    webView: {
        flex: 1,
        backgroundColor: 'white',
    }
});


