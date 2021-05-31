/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

 import React, {Component} from 'react';
 import {Platform, StyleSheet, Text, View,TouchableOpacity,TextInput} from 'react-native';
 import {observer, inject} from 'mobx-react';

inject('store')
observer
export default class ZeroCategory extends Component  {


    constructor(props){
        super(props);
        this.state={
            value:0
        }
    }
    componentWillMount(){
        // console.log(this.props.store.counter)
    }
    sub=()=>{
        let {store}=this.props;
        store.subCount()
    }
    add=()=>{
        let {store}=this.props;
        store.addCount()
    }
    render() {
        let {store}=this.props
        return (
        <View style={styles.container}>
            <TouchableOpacity onPress={this.sub}>
                <Text>-</Text>  
            </TouchableOpacity>
            <TextInput style={{width:100,height:35,borderWidth:1}} value={store.counter.toString()}/>
            <TouchableOpacity onPress={this.add}>
                <Text>+</Text>  
            </TouchableOpacity>   
        </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        backgroundColor: '#F5FCFF',
        flex:1,
        flexDirection:'row',
        alignItems:'center',
        justifyContent:'center'
    },

});


