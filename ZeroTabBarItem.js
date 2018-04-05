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
    Image
} from 'react-native';

export default class ZeroTabBarItem extends Component {
    render() {
        let  selectedImage = this.props.selectedImage ? this.props.selectedImage : this.props.normalImage

        return (
            <Image
                source={this.props.focused
                    ? selectedImage
                    : this.props.normalImage}
                style={{ tintColor: this.props.tintColor,
                         width: 25,
                         height: 25
                      }}

            />
        );
    }
}




