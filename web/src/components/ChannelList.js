import React from 'react';
import { withRouter, NavLink } from 'react-router-dom';
import { connect } from 'react-redux';

function ChannelList (props) {

  const { messages, channels, changeChannel } = props;

  return (
    <ul>
      {
        channels.map(channel => {
          return (
            <li key={channel.id}>
              <NavLink to={`/channels/${channel.id}`}>
                <span># {channel.name}</span>
                <span className="badge">{ messages.filter(message => message.channelId === channel.id).length }</span>
              </NavLink>
            </li>
          );
        })
      }
      <li>
        <NavLink to="/new-channel">Create a channel...</NavLink>
      </li>
    </ul>
  );
}

const mapStateToProps = function (state) {
  return {
    messages: state.messages,
    channels: state.channels
  };
};

// We need to wrap the component in `withRouter` so that the NavLinks will be able to update
// Because `connect` implements `shouldComponentUpdate`, it will block re-rendering unless it detects
// a prop change. When we change the url, neither the messages nor the channels we send to the ChannelList
// component change, so the component doesn't re-render. What `withRouter` does is it passes the Router's
// props down to its inner component.
//
// It's equivalent to saying:
//
// const ConnectedChannelList = connect(mapStateToProps)(ChannelList);
//
// ...elsewhere, in a `render`:
// <Route component={ConnectedChannelList} />
//
export default withRouter(connect(mapStateToProps)(ChannelList));
