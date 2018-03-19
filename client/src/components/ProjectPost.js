import React from 'react';
// import { Button } from 'reactstrap';

export default class MeetingPost extends React.Component{
  render (){
    let indLinks = {
      position: "relative",
      display: "inline",
      width: "50%",
      float: "both"
    }

    let divContainerLinks = {
      bottom: "0",
      position: "relative"
    }

    let textBodyAlignment = {
       'textAlign': "center"
    }

    return (
      <div className="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
        <div className="mdl-card__title" style={textBodyAlignment}>
           <h4 className="mdl-card__title-text">{this.props.title}</h4>
        </div>
        <div className="mdl-card__supporting-text">
          <span className="mdl-typography--font-light mdl-typography--subhead">{this.props.body}</span>
        </div>
        <div style={divContainerLinks}>
          <div className="mdl-card__actions" style={indLinks}>
             <a className="techtalk-link mdl-button mdl-js-button mdl-typography--text-uppercase" href={this.props.repo}>
               Demo
               <i className="material-icons">chevron_right</i>
             </a>
          </div>
          <div className="mdl-card__actions" style={indLinks}>
             <a className="techtalk-link mdl-button mdl-js-button mdl-typography--text-uppercase" href={this.props.link}>
               Link to Project
               <i className="material-icons">chevron_right</i>
             </a>
          </div>
          <div className="mdl-card__supporting-text">
            <p className="mdl-typography--font-light mdl-typography--subhead">{this.props.created_at}</p>
          </div>
        </div>
      </div>
    )
  }
}
