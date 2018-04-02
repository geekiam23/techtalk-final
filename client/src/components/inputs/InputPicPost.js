import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import Button from 'material-ui-next/Button';
import FlatButton from 'material-ui/FlatButton';


export default class InputPicPost extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      body: this.props.body
    }
  }

  render(){

    const floatButton = {
      float: "right"
    };
    return (
      <div>
        <div>
          <input
            accept="image/*"
            id="raised-button-file"
            multiple
            type="file"
          />
          <label htmlFor="raised-button-file">
            <Button variant="raised" color="primary" component="span" >
              Upload
            </Button>
          </label>
        </div>
        <div style={floatButton} >
          <FlatButton
            label="Submit"
            primary={true}
            keyboardFocused={true}
            // onClick={this.handleClose}
          />
        </div>
      </div>
    );
  }
}


