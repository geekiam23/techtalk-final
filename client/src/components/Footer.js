import React, { Component } from 'react'


export default class Footer extends Component {
  render() {
    return (
      <div id="techtalk-footer">
        <footer className="techtalk-footer mdl-mega-footer">
          <div className="mdl-mega-footer--top-section">
            <div className="mdl-mega-footer--left-section">
              <button className="mdl-mega-footer--social-btn"></button>
              &nbsp;
              <button className="mdl-mega-footer--social-btn"></button>
              &nbsp;
              <button className="mdl-mega-footer--social-btn"></button>
            </div>
            <div className="mdl-mega-footer--right-section">
              <a className="mdl-typography--font-light" href="#top">
                Back to Top
                <i className="material-icons">expand_less</i>
              </a>
            </div>
          </div>

          <div className="mdl-mega-footer--bottom-section">
            <a className="techtalk-link mdl-typography--font-light" href="">Blog</a>
            <a className="techtalk-link mdl-typography--font-light" href="">Privacy Policy</a>
          </div>

        </footer>
      </div>
    )
  }
}
