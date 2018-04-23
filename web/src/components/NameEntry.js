import React from 'react';
import { connect } from 'react-redux';
import { updateName } from '../store';

function NameEntry (props) {

  const { name, handleChange } = props;

  return (
    <form className="form-inline">
      <label htmlFor="name">Your name:</label>
      <input
        type="text"
        name="name"
        placeholder="Enter your name"
        className="form-control"
        onChange={handleChange}
        value={name}
      />
    </form>
  );
}

const mapStateToProps = function (state) {
  return {
    name: state.name
  };
};

const mapDispatchToProps = function (dispatch) {
  return {
    handleChange (evt) {
      dispatch(updateName(evt.target.value));
    }
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(NameEntry);
