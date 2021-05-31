import {observable,action} from 'mobx';

var appStore = observable({
    counter: 0
});

appStore.addCount = action(()=>{
    appStore.counter+=1;
});

appStore.subCount = action(()=>{
    if(appStore.counter<=0){
        return;
    }
    appStore.counter-=1;
});

appStore.changeCount = action((key)=>{
    if(key<=0){
        appStore.counter=0;
    }
    appStore.counter=parseInt(key);
});


export default appStore

// class appStore{
//     @observable counter = 0;
//     @observable themeType = 'light';
//     @observable theme=themeData['light'];
//     @action changeTheme=(themeType)=>{
//         this.themeType=themeType
//         this.theme=themeData[themeType];
//     }
// }
// const AppStores = appStore();
// export default AppStores;