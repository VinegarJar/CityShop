/*
 * @Creator: 陈美安 
 * @Date: 2018-12-26 10:05:47 
 * @Last Modified by: 陈美安
 * @Last Modified time: 2019-03-06 09:48:43
 * @Desc: Reducers
 */
import StoreTypes from "../Types";

const initialState = {
    recommendList: [],
    all: []
};

export default function (state = initialState, action){
    console.log("reducers.brand", action);
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
