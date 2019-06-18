

import PostTypes from "./postType";
const  {GET_HOMEADVER, GET_HOMEGOOSLIST } = PostTypes;

//存储你想要的状态
const initialState = {
    data:{},
};

export default function (state = initialState, action){
   
    console.log("postReducer===========>", action)
    const { type,  } = action;
    switch (type) {
        case GET_HOMEADVER:
            return {
                ...state,
                data:action.data
            }
            break;
            case  GET_HOMEGOOSLIST:
            return {
                ...state,
                data:action.data
            }
            break;     
    }
    return state;
}
