# ZeroCityShop
IOS打包命令
react-native bundle --entry-file index..ios.js --bundle-output ./ios/main.jsbundle --platform ios --assets-dest ./ios --dev false

https://blog.csdn.net/hefeng6500/article/details/79869647

React-Native开源电商项目
一款使用react-native写的垮平台代码,rn新手上路多多指教

3.2.1 业务代码按需加载

LazyRequire按需加载方案


先来看一段我们初始化页面路由表的代码

import PageA from ("pages/PageA");
import PageB from ("pages/PageB");
import PageC from ("pages/PageC");
import PageD from ("pages/PageD");

//设置页面路由表
let pageList = [PageA, PageB, PageC, PageD];
App.startApp(pageList);


早期业务简单，页面数量少，上面的优化方案已经可以是RN基本达到native的体验，但是随着业务越来越复杂(当时有业务bundle，包含70多个Page js代码uglify之后达到3MB)，首屏加载慢的问题又出来，为此我们实现一种懒加载的方案，进入业务时候，只加载当前需要显示的Page的代码， 对业务的使用非常简单，下面是我们懒加载的页面路由代码写法。



const PageA = lazyRequire("pages/PageA");
const PageB = lazyRequire("pages/PageB");
const PageC = lazyRequire("pages/PageC");
const PageD = lazyRequire("pages/PageD");
//设置页面路由表
let pageList = [PageA, PageB, PageC, PageD];
App.startApp(pageList);
对业务开发来说，切换成本非常低，只需要使用lazyRequire函数替代import指令。怎么做到的呢，其实也很简单。



//LazyRequire函数定义，返回lazyModule对象
LazyModule lazyRequire(path)

LazyModule = {
    load(); //代码真正执行的点，返回执行结果
}


细心的同学可能发现这里有个问题，lazyRequire函数传入的文件相对路径，打包之后，还是相对路径，而打包完成之后，每个业务js模块都被打成模块ID.js文件，这会导致运行时查找不到这些业务页面的模块。是的，在打包过程中，需要开发一个babel插件，将lazyRequire函数例的文件路径，转换成模块ID，实现方式和import 的babel插件基本一致。



随着业务代码增加，进入首屏需要加载(require)的代码会增加，前面分析过，require会导致JS代码的执行，是耗时的操作，最终导致首屏变慢。所以，我们就想，进入业务的时候，只加载第一个Page相关的代码，其他页面的，路由跳转过去的时候再加载。


Getter API导出模块


我们先来看看React Native模块内的组件导出方式：



//原始代码如下
//Module1.js
console.log("Start load module1");
module.exports = {    
doJob:()=> {        
console.log("doJob called in module1");
    }
}

//Module2.js
import Module1 from "./Module1";
//执行结果：Start load module1


这是最常见的模块导出和引用方式，和我们前面说的一样，import的时候，实际上会去执行对应的代码。接下来，我们创建一个common.js（文件名无限制），修改下模块的导出方式，参考下面的代码。



//common.js
module.exports = {    
get Module1() {        
return require('./Module1');
    }
}

//回到Module2.js的引用
import Module1 from "./common";
//执行结果：没打印任何日志

Module1.doJob();
//执行结果: 打印以下两条日志
//Start load module1
//doJob called in module1


可以看到，通过ES5的getter API来导出模块，在引用时，代码不会立即执行，直到导出对象真正使用时候，才开始执行。所以如果我们有自己的公共组件，多个业务都需要用到，那么使用getter API导出模块是一种不错的选择。其实RN里面的ReactNative模块导出方式也是这样，参考下面的代码。



const ReactNative = {    
get ActivityIndicator() { return require('ActivityIndicator'); },    
get ART() { return require('React NativeART'); },    
get DatePickerIOS() { return require('DatePickerIOS'); },    
get DrawerLayoutAndroid() { return require('DrawerLayoutAndroid'); },    
get Image() { return require('Image'); },    
get ListView() { return require('ListView'); },    
//...
}  
module.exports = React Native;


通过getter API导出模块实现按需加载是ES5默认支持的，对原始RN没有任何侵入性修改，是比较推荐的一种方案。



那我们为何需要LazyRequire呢？很明显，使用getter API导出替换LazyRequire是可行的，只是达到不了按需加载的功效了，因为在赋值页面路由表的时候，需要用到所有的Page对象，用到这些对象的时候，会直接触发所有Page的代码加载执行。


inlineRequire方案


方案很简单，预先定义模块对象，赋值为null，在使用时候判断对象是否为null，null时候则做真正的require，进行模块加载。看一段简单示例代码。



let VeryExpensiveModule = null;

export default class Optimized extends Component {
    someEvent = ()=>{        
        if (VeryExpensiveModule == null) {            
            //require('path').default, 动态加载模块代码
            VeryExpensiveModule = require('./VeryExpensive').default;
        }
    }
}



