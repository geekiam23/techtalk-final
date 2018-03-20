import React, { Component } from 'react'

export default class Jumbotron extends Component {
  render() {
    return (
      <div className="techtalk-be-together-section mdl-typography--text-center">
        <div className="logo-font techtalk-slogan">If your presence does not make a difference,&#10; your absence will not make a difference.</div>
        <div className="logo-font techtalk-sub-slogan">welcome to techtalk... be you. do you. meet others.</div>

        <a href="#techtalk-footer">
          <button className="techtalk-fab mdl-button mdl-button--colored mdl-js-button mdl-button--fab mdl-js-ripple-effect">
            <i className="material-icons">expand_more</i>
          </button>
        </a>
      </div>
    )
  }
}
