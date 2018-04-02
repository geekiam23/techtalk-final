import React from 'react';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';


export default class InputJobPost extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      title: "",
      body: "",
      link: "",
      salary: "",
      location: ""
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
            placeholder="Link"
            onChange={this.handleChange('date')}
            margin="normal"
            name="link"
          />
          <TextField
            id="salary"
            label="With placeholder multiline"
            placeholder="Salary"
            onChange={this.handleChange('date')}
            margin="normal"
            name="salary"
          />
          <TextField
            id="location"
            label="With placeholder multiline"
            placeholder="Location"
            onChange={this.handleChange('date')}
            margin="normal"
            name="location"
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
