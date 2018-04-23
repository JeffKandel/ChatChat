import React, { Component } from 'react';
import { connect } from 'react-redux';
import Message from './Message';
import NewMessageEntry from './NewMessageEntry';
import { changeCurrentChannel } from '../store';

function MessagesList (props) {

  const { channelId, messages } = props;

  return (
    <div>
      <ul className="media-list">
        { messages.map(message => <Message message={message} key={message.id} />) }
      </ul>
      <NewMessageEntry channelId={channelId} />
    </div>
  );
}

class MessagesListLoader extends Component {

  componentDidMount () {
    this.props.changeCurrentChannel(this.props.channel.name);
  }

  componentWillReceiveProps (nextProps) {
    if (nextProps.channel.name !== this.props.channel.name) {
      this.props.changeCurrentChannel(nextProps.channel.name);
    }
  }

  render () {
    return (
      <MessagesList {...this.props} />
    );
  }
}

const mapStateToProps = function (state, ownProps) {

  const channelId = Number(ownProps.match.params.channelId);

  return {
    channel: state.channels.find(channel => channel.id === channelId) || { name: '' },
    messages: state.messages.filter(message => message.channelId === channelId),
    channelId
  };
};

const mapDispatchToProps = function (dispatch) {
  return {
    changeCurrentChannel(channelName) {
      dispatch(changeCurrentChannel(channelName));
    }
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MessagesListLoader);
