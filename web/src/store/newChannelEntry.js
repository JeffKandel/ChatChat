// ACTION TYPES

const WRITE_CHANNEL_NAME = 'WRITE_CHANNEL_NAME';

// ACTION CREATORS

export function writeChannelName (channelName) {
  const action = { type: WRITE_CHANNEL_NAME, channelName };
  return action;
}

// REDUCER
export default function reducer (state = '', action) {

  switch (action.type) {

    case WRITE_CHANNEL_NAME:
      return action.channelName;

    default:
      return state;
  }

}
