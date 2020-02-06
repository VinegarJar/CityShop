/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';

export default class  App extends Component{

  render() {
      return (
        <View style={{ backgroundColor: 'orange', flex: 1, }} >
          <StatusBar translucent={false} barStyle={'dark-content'} backgroundColor={'#EB5148'} networkActivityIndicatorVisible={true} />
     
        </View>
      );
   }
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: "#f1f1f1",
  },

});


