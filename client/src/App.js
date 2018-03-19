import React, { Component } from 'react';
import PostCardGroup from './components/PostCardGroup';
import MenuBar from './components/MenuBar';
import SideBar from './components/SideBar';
import Footer from './components/Footer';
import JumboTron from './components/JumboTron';
import PostButton from './components/PostButton';


class App extends Component {
  render() {
    return (
      <div className='App'>
        <div className="mdl-layout mdl-js-layout mdl-layout--fixed-header">
          <div className="techtalk-content mdl-layout__content">
            <MenuBar/>
            <SideBar/>
              <JumboTron/>
              <PostCardGroup/>
              <PostButton/>
            <Footer/>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
