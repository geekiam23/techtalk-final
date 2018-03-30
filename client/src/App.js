import React, { Component } from 'react';
import { Route } from 'react-router-dom';
import PostCardGroup from './components/PostCardGroup';
import MenuBar from './components/MenuBar';
import Footer from './components/Footer';
import JumboTron from './components/JumboTron';
import PostButton from './components/PostButton';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import Login from './Login';
import $ from 'jquery';

  $.auth.configure({
    apiUrl: '/api'
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
              <PostButton/>
              <Footer/>
            </div>
          </div>
        </MuiThemeProvider>
      </div>
    );
  }
}

export default App;
