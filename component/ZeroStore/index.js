'use strict';
import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';
import rootReducer from './Reducers/storeReducer';

const createStoreWithMiddleware = applyMiddleware(thunkMiddleware)(createStore);
export default function configureStore(initialState) {
  debugger
  const store = createStoreWithMiddleware(rootReducer, initialState)
  return store;
}


// import thunk from 'redux-thunk';
// import { createStore, applyMiddleware, compose } from 'redux';
// import rootReducer from './../Reducers/RootReducers';

// let store = createStore(rootReducer, {}, compose(
//   applyMiddleware(thunk),
//   window.devToolsExtension ? window.devToolsExtension() : f => f
// ))

// export default store;