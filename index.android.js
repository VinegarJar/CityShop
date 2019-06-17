/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow 陈美安
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

import { Provider } from 'react-redux';
import App from './App';
import { store } from './tool/store'

export default class ZeroCityShop extends Component {
  render() {
    return (
      <Provider store={store}>
        <App />
      </Provider>
    );
  }
}


AppRegistry.registerComponent('ZeroCityShop', () => ZeroCityShop);
