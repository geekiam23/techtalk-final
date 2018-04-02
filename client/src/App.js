import React, { Component } from 'react';
import { Route } from 'react-router-dom';
import PostCardGroup from './components/PostCardGroup';
import MenuBar from './components/MenuBar';
import Footer from './components/Footer';
import JumboTron from './components/JumboTron';
import PostModal from './components/PostModal';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import Login from './Login';
import $ from 'jquery';

$.auth.configure({
  apiUrl:                '/api',
  signOutPath:           '/auth/sign_out',
  emailSignInPath:       '/auth/sign_in',
  emailRegistrationPath: '/auth',
  accountUpdatePath:     '/auth',
  accountDeletePath:     '/auth',
  passwordResetPath:     '/auth/password',
  passwordUpdatePath:    '/auth/password',
  tokenValidationPath:   '/auth/validate_token',
  proxyIf:               function() { return false; },
  proxyUrl:              '/proxy',
  validateOnPageLoad:    false,
  forceHardRedirect:     false,
  storage:               'cookies',
  cookieExpiry:          14,
  cookiePath:            '/',

  passwordResetSuccessUrl: function() {
    return window.location.href;
  },

  confirmationSuccessUrl:  function() {
    return window.location.href;
  },

  tokenFormat: {
    "access-token": "{{ access-token }}",
    "token-type":   "Bearer",
    client:         "{{ client }}",
    expiry:         "{{ expiry }}",
    uid:            "{{ uid }}"
  },

  parseExpiry: function(headers){
    // convert from ruby time (seconds) to js time (millis)
    return (parseInt(headers['expiry'], 10) * 1000) || null;
  },

  handleLoginResponse: function(resp) {
    return resp.data;
  },

  handleAccountUpdateResponse: function(resp) {
    return resp.data;
  },

  handleTokenValidationResponse: function(resp) {
    return resp.data;
  },

  authProviderPaths: {
    github:    '/auth/github',
    facebook:  '/auth/facebook',
    google:    '/auth/google_oauth2'
  }
});

class App extends Component {


  render() {
    return (
      <div className='App'>
        <MuiThemeProvider>
          <div className="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <div className="techtalk-content mdl-layout__content">
              <MenuBar/>
              <main>
                <Route path="/JumboTron" component={JumboTron} />
                <Route path="/Login" component={Login} />
                <Route path="/PostCardGroup" component={PostCardGroup} />
              </main>
              <PostModal/>
              <Footer/>
            </div>
          </div>
        </MuiThemeProvider>
      </div>
    );
  }
}

export default App;
