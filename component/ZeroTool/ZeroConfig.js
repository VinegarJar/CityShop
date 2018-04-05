'use strict'

const  ZeroConfig={
    api:{
        //首页轮播广告图
        homeBanner_URL :  "https://portal-web.cjwsc.com/home/topBanner.action" ,
        //首页热卖推荐
        homeHotCommendGoods_URL:"https://portal-web.cjwsc.com/home/hotRecommend.action",


        //特卖专区Banner
        specialSell_URL:
        'http://baseservice_cms.cjwsc.com/Sale/ThankfulWednesday',
        //每周品牌热卖
        brandHotGoods_URL:
        'http://baseservice_cms.cjwsc.com/Sale/WeekBrandSale',

        //特卖场-爆款商品
        saleHotStyle_URL:
        'http://baseservice_cms.cjwsc.com/Sale/HotStyleSale'

    },

    params:{
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type':'application/x-www-form-urlencoded',
        },
        timeout:10000,
    }
}



module.exports = ZeroConfig;
