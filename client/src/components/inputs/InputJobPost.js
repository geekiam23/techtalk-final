import React from 'react';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';


export default class InputJobPost extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      date: new Date()
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
          />
          <TextField
            id="body"
            label="With placeholder multiline"
            placeholder="Body"
            multiline="true"
            onChange={this.handleChange('date')}
            margin="normal"
          />
          <TextField
            id="time"
            label="Alarm clock"
            type="time"
            defaultValue="07:30"
          />
          <TextField
            id="date"
            label="Birthday"
            type="date"
            defaultValue={this.state.date}
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

