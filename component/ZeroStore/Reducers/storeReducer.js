/*
 * @Creator: 陈美安 
 * @Date: 2018-12-26 10:05:47 
 * @Last Modified by: 陈美安
 * @Last Modified time: 2019-03-06 09:48:43
 * @Desc: Reducers
 */
import StoreTypes from "../Types";

const initialState = {
    
};

export default function (state = initialState, action){
   
    console.log("获取首页广告数据action=======：", action)
    const { type, ..._data } = action;
    switch (type) {
        case StoreTypes.GET_HOMEADVER:
            return {
                ...state,
                ..._data
            }
            break;
    }
    return state;
}
