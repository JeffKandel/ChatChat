import React from 'react';
import { connect } from 'react-redux';
import NameEntry from './NameEntry';

function Navbar (props) {

  const { currentChannel } = props;

  return (
    <nav>
      <h3># { currentChannel }</h3>
      <NameEntry />
    </nav>
  );
}

const mapStateToProps = function (state) {
  return {
    currentChannel: state.currentChannel
  };
};

export default connect(mapStateToProps)(Navbar);
