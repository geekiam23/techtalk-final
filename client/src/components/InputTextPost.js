import React from 'react';
import FlatButton from 'material-ui/FlatButton';


export default class TextPost extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      body: this.props.body
    }
    this.handleBodyChange = this.handleBodyChange.bind(this);
  }

  handleBodyChange(e) {
    this.setState({ body: e.target.value });
  }
  render (){
    const floatButton = {
      float: "right"
    };
    return (
      <div>
        <input
          type="text"
          name="post[body]"
          onChange={this.handleBodyChange} placeholder="Post Here!"
        />
        <div style={floatButton} >
          <FlatButton
            label="Submit"
            primary={true}
            keyboardFocused={true}
            onClick={this.handleClose}
          />
        </div>
      </div>
    )
  }
}
