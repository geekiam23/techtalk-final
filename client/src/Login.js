import React, { Component } from "react";
import Auth from 'j-toker';
import "./Login.css";
import _ from 'lodash';

export default class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      password: "",
      isModalOpen: false,
      errors: null,
    };
  }

  handleInputChange(ev) {
    var nextState = _.cloneDeep(this.state);
    nextState[ev.target.name] = ev.target.value;
    this.setState(nextState);
  }

  handleSignInClick(ev) {
    Auth.emailSignIn({
      email:    this.state.email,
      password: this.state.password,
    })

      .then(function(resp) {
        this.setState({
          email: '',
          password: '',
          errors: null,
          isModalOpen: true
        });
      }.bind(this))

      .fail(function(resp) {
        this.setState({
          errors: resp.data.errors,
          isModalOpen: true
        });
      }.bind(this));
  }

  successModalTitle: 'Email Sign In Success';
  errorModalTitle: 'Email Sign In Error';

  renderSuccessMessage() {
    return (
      <p>Welcome {Auth.user.email}!</p>
    );
  }

  renderErrorMessage() {
    return (
      <p>There was an error: {this.state.errors.join(', ')}</p>
    );
  }

  render() {
    return (
      <div className="login techtalk-card-container mdl-grid">
        <form className="form">
          <input
            className="formInput"
            defaultChecked="true"
            id="signin"
            name="action"
            type="radio"
            defaultValue="signin"
          />

        <label className="label" htmlFor="signin">Sign in</label>

        <input
          className="formInput"
          id="signup"
          name="action"
          type="radio"
          defaultValue="signup"
        />

      <label className="label" htmlFor="signup">Sign up</label>

      <input
        className="formInput"
        id="reset"
        name="action"
        type="radio"
        defaultValue="reset"
      />

    <label className="label" htmlFor="reset">Reset</label>
    <div id="wrapper">
      <div id="arrow" />
      <input
        className="formInput"
        id="email"
        placeholder="Email"
        type="email"
        name='email'
        value={this.state.email}
        onChange={(e) => this.handleInputChange(e)}
        disabled={this.props.signedIn}
      />
      <input
        className="formInput"
        id="pass"
        type='password'
        value={this.state.password}
        placeholder="Password"
        onChange={(e) => this.handleInputChange(e)}
        disabled={this.props.signedIn}
        name='password'
      />
      <input
        className="formInput"
        id="repass"
        placeholder="Repeat password"
        type="password"
        onChange={(e) => this.handleInputChange(e)}
      />
    </div>
          <button className="button" type="submit" onClick={() => this.handleSignInClick()}
          disabled={this.props.signedIn} >
            <span>
              Reset password
              <br />
              Sign in
              <br />
              Sign up
            </span>
          </button>
        </form>
      </div>
    );
  }
}
