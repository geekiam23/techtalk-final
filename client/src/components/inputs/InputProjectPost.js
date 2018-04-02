import React from 'react';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';


export default class InputProjectPost extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      title: "",
      body: "",
      link: "",
      repo: ""
    }
  }

  handleChange = name => event => {
    this.setState({
      [name]: event.target.value,
    });
  };
  render (){
    const floatButton = {
      float: "right"
    };
    return (
      <div>
        <div>
          <TextField
            id="title"
            label="With placeholder multiline"
            placeholder="Title"
            onChange={this.handleChange('date')}
            margin="normal"
            name="title"
          />
          <TextField
            id="body"
            label="With placeholder multiline"
            placeholder="Body"
            multiline="true"
            onChange={this.handleChange('date')}
            margin="normal"
            name="body"
          />
          <TextField
            id="link"
            label="With placeholder multiline"
            placeholder="Demo Link"
            onChange={this.handleChange('date')}
            margin="normal"
            name="link"
          />
          <TextField
            id="repo"
            label="With placeholder multiline"
            placeholder="Repo Link"
            onChange={this.handleChange('date')}
            margin="normal"
            name="repo"
          />
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
    )
  }
}
