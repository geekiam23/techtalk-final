import React from 'react';
import {Tabs, Tab} from 'material-ui/Tabs';
import SwipeableViews from 'react-swipeable-views';
import InputTextPost from './inputs/InputTextPost';
import InputMeetingPost from './inputs/InputMeetingPost';
import InputPicPost from './inputs/InputPicPost';
import InputProjectPost from './inputs/InputProjectPost';
import InputJobPost from './inputs/InputJobPost';

const styles = {
  headline: {
    fontSize: 24,
    paddingTop: 16,
    marginBottom: 12,
    fontWeight: 400,
  },
  slide: {
    padding: 10,
  },
};

export default class ModalBody extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      slideIndex: 0,
    };
  }

  handleChange = (value) => {
    this.setState({
      slideIndex: value,
    });
  };

  render() {
    return (
      <div>
        <Tabs
          onChange={this.handleChange}
          value={this.state.slideIndex}
        >
          <Tab label="Text" value={0} />
          <Tab label="Pics" value={1} />
          <Tab label="Meetings" value={2} />
          <Tab label="Projects" value={3} />
          <Tab label="Jobs" value={4} />
        </Tabs>
        <SwipeableViews
          index={this.state.slideIndex}
          onChangeIndex={this.handleChange}
        >
          <div>
            <div style={styles.headline}></div>
            <InputTextPost />
          </div>
          <div style={styles.slide}>
            <div style={styles.headline}></div>
            <InputPicPost />
          </div>
          <div style={styles.slide}>
            <div style={styles.headline}></div>
            <InputMeetingPost />
          </div>
          <div style={styles.slide}>
            <div style={styles.headline}></div>
            <InputProjectPost />
          </div>
          <div style={styles.slide}>
            <div style={styles.headline}></div>
            <InputJobPost />
          </div>
        </SwipeableViews>
      </div>
    );
  }
}

