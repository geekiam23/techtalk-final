import React, { Component } from 'react';
import PostCardGroup from './components/PostCardGroup';
import MenuBar from './components/MenuBar';
import Footer from './components/Footer';
import JumboTron from './components/JumboTron';
import PostButton from './components/PostButton';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'




class App extends Component {
  render() {
    return (
      <div className='App'>
        <MuiThemeProvider>
          <div className="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <div className="techtalk-content mdl-layout__content">
              <MenuBar/>
                <JumboTron/>
                <PostCardGroup/>
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
