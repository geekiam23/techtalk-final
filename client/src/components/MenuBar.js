import React, { Component } from 'react'
import { Link } from 'react-router-dom';
import Drawer from 'material-ui/Drawer';
import AppBar from 'material-ui/AppBar';
import MenuItem from 'material-ui/MenuItem';

export default class MenuBar extends Component {
    constructor(props) {
      super(props);
      this.state = {
        open: false,
      };
    }

    handleToggle = () => this.setState({open: !this.state.open});

  render() {
    return (
      <div className="techtalk-header mdl-layout__header mdl-layout__header--waterfall">
        <div className="mdl-layout__header-row">
          <div className="techtalk-header-spacer mdl-layout-spacer"></div>
          <div className="techtalk-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
            <label className="mdl-button mdl-js-button mdl-button--icon">
              <i className="material-icons">search</i>
            </label>
            <div className="mdl-textfield__expandable-holder">
              <input className="mdl-textfield__input" type="text" id="search-field"/>
            </div>
          </div>

          <button className="techtalk-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button" onClick={this.handleToggle}>
            <i className="material-icons">more_vert</i>
          </button>
          <Drawer
            docked={false}
            width={200}
            openSecondary={true}
            open={this.state.open}
            onRequestChange={(open) => this.setState({open})}
          >
            <AppBar title="TechTalk" showMenuIconButton={false}/>
            <MenuItem onClick={this.handleClose} primaryText="home" containerElement={<Link to='/JumboTron'/>} />
            <MenuItem onClick={this.handleClose} primaryText="Login" containerElement={<Link to='/Login'/>} />
            <MenuItem onClick={this.handleClose} primaryText="Posts" containerElement={<Link to='/PostCardGroup'/>} />
          </Drawer>
        </div>
      </div>
    )
  }
}
