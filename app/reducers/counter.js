import * as types from '../actions/actionTypes';
import React  from 'react-native';

const initialState = {
  count: 0
};

export default function counter(state = initialState, action = {}) {
  switch (action.type) {
    case types.INCREMENT:
    React.NativeModules.CalendarManager.addEvent("One", "Two", 3)
      return {
        ...state,
        count: state.count + 1
      };
    case types.DECREMENT:
      return {
        ...state,
        count: state.count - 1
      };
    default:
      return state;
  }
}
