export default {

    tabBarItem: {
            home_Normal: () => { return require('./TabBar/home_Normal.png') },
            home_Selected: () => { return require('./TabBar/home_Selected.png') },
            category_Normal: () => { return require('./TabBar/category_Normal.png') },
            category_Selected: () => { return require('./TabBar/category_Selected.png') },
            saleSell_Normal: () => { return require('./TabBar/saleSell_Normal.png') },
            saleSell_Selected: () => { return require('./TabBar/saleSell_Selected.png') },
            car_Normal: () => { return require('./TabBar/car_Normal.png') },
            car_Selected: () => { return require('./TabBar/car_Selected.png') },
            me_Normal: () => { return require('./TabBar/me_Normal.png') },
            me_Selected: () => { return require('./TabBar/me_Selected.png') },
    },


    homeItem:{
        home_Scan: () => { return require('./Home/scan_icon.png') },
        home_Search: () => { return require('./Home/search.png') },
        home_News: () => { return require('./Home/news.png') },
    },


}