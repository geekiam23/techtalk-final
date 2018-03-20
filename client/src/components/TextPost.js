import React from 'react';
// import { Button } from 'reactstrap';

export default class TextPost extends React.Component{
  render (){
    let indLinks = {
      position: "relative",
      display: "inline-block",
      width: "50%",
      float: "both",
      textAlign: "center"
    }

    let divContainerLinks = {
      bottom: "0",
      position: "relative"
    }

    let textBodyAlignment = {
       'textAlign': "center"
    }

    let cardMargin = {
      margin: "40px auto"
    }

    return (
      <div className="mdl-cell mdl-cell--7-col mdl-cell--7-col-tablet mdl-cell--7-col-phone mdl-card mdl-shadow--3dp" style={cardMargin}>
        <div className="mdl-card__title" style={textBodyAlignment}>
           <h4 className="mdl-card__title-text">{this.props.body}</h4>
        </div>
        <div className="mdl-card__supporting-text">
          <p className="mdl-typography--font-light mdl-typography--subhead">{this.props.created_at}</p>
        </div>
        <div style={divContainerLinks}>
          <div className="mdl-card__actions" style={indLinks}>
             <a className="techtalk-link mdl-button mdl-js-button mdl-typography--text-uppercase" href="">
               Reply
               <i className="material-icons">chevron_right</i>
             </a>
          </div>
        </div>
      </div>
    )
  }
}
