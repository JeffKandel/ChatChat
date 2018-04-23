// ACTION TYPES
const CHANGE_CHANNEL = 'CHANGE_CHANNEL';

// ACTION CREATORS
export function changeCurrentChannel (channelName) {
  const action = { type: CHANGE_CHANNEL, channelName };
  return action;
}

// REDUCER
export default function reducer (state = '', action) {

  switch (action.type) {

    case CHANGE_CHANNEL:
      return action.channelName

    default:
      return state;
  }

}
