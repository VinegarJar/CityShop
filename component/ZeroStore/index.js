
// import { createStore, applyMiddleware } from 'redux';
// import thunkMiddleware from 'redux-thunk';
// import rootReducer from './Reducers/storeReducer';

// const createStoreWithMiddleware = applyMiddleware(thunkMiddleware)(createStore);
// export default function configureStore(initialState) {
//   debugger
//   const store = createStoreWithMiddleware(rootReducer, initialState)
//   return store;
// }


// import thunk from 'redux-thunk';
// import { createStore, applyMiddleware, compose } from 'redux';
// import rootReducer from './../Reducers/RootReducers';

// let store = createStore(rootReducer, {}, compose(
//   applyMiddleware(thunk),
//   window.devToolsExtension ? window.devToolsExtension() : f => f
// ))

// export default store;




// import { createStore, applyMiddleware,compose } from 'redux'
// import thunk from 'redux-thunk';
// import rootReducer from './Reducers/storeReducer';

// const createStoreWithMiddleware = compose(
//   applyMiddleware(
//       thunk
//   ),
//   window.devToolsExtension ? window.devToolsExtension() : f => f
// )(createStore);

// export default function configureStore(initialState) {
//   const store = createStoreWithMiddleware(reducer, initialState);

//   //热替换选项
//   if (module.hot) {
//       // Enable Webpack hot module replacement for reducers
//       module.hot.accept('./Reducers', () => {
//           const nextReducer = require('../ZeroStore/Reducers/storeReducer');
//           store.replaceReducer(nextReducer)
//       })
//   }

//   return store;
// }


// import { createStore, applyMiddleware} from 'redux'
// import thunk from 'redux-thunk';
// import reducer from './Reducers/storeReducer';

// export default function configureStore() {
//     const store = createStore(reducer, applyMiddleware(thunk));
//   return store;
// }