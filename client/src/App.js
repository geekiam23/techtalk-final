import React, { Component } from 'react';
import { Segment } from 'semantic-ui-react';
import PostCard from './components/PostCard';
import MenuBar from './components/MenuBar';
import Footer from './components/Footer';


class App extends Component {

  // componentDidMount() {
  //   this.fetchPosts();
  // }
  //
  //
  // fetchPosts() {
  //   fetch('api/posts/1')
  //     .then((resp) => {
  //       return resp.json();
  //     })
  //     .then((posts) => {
  //       this.setState([
  //         posts: posts
  //       ]);
  //     });
  // }
  //
  // fetchPost(id) {
  //   return fetch(`api/posts/${id}`)
  //     .then((resp) => {
  //       return resp.json();
  //     });
  // }
  //
  // handleSetPost(id) {
  //   this.fetchPost(id)
  //     .then((post) => {
  //       this.setState({
  //         activePost: post
  //       });
  //     })
  // }

  // componentDidMount() {
  //   window.fetch('api/posts')
  //     .then(response => response.json())
  //     .then(json => console.log(json))
  //     .catch(error => console.log(error))
  // }

  render() {
    // const postCards = this.state.posts.length ?
    // this.state.posts.map((post, index) => (
    //   <PostCard
    //     key={index}
    //     post={post}
    //     handleSetPost={this.handleSetPost}
    //   />
    // )) : "";
    //
    // const postsGroup = !this.state.activePost ?
    //   (
    //     <Card.Group className="post-cards-group">
    //       {postCards}
    //     </Card.Group>
    //   ) : '';
    //
    return (
      <div className='App'>
        <MenuBar/>
          <PostCard></PostCard>
            <Segment>
            <p>
            </p>
          </Segment>
        <Footer/>
      </div>
    );
  }
}

export default App;
