import React from 'react';
import { Card } from 'semantic-ui-react';

class PostCard extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      posts: []
    }
    this.getPosts = this.getPosts.bind(this)
    this.getPost = this.getPost.bind(this)
    // this.handleSetPost = this.handleSetPost.bind(this);
  }

  componentDidMount() {
    window.fetch('api/posts')
      .then(response => response.json())
      .then(json => console.log(json))
      .catch(error => console.log(error))
      .then(this.getPosts())
  }
  // componentDidMount () {
  //   this.getPosts()
  // }
  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    })
  }
  // getPosts () {
  //   this.fetch('api/posts')
  //     .then(posts => {
  //       this.setState({posts: posts})
  //       this.getPost(posts[0].id)
  //     })
  // }
  getPosts () {
    this.fetch('api/posts')
    .then(posts => {
      console.log(posts);
      this.setState({posts: posts})
      this.getPost(posts[0].id)
    })
  } 
  getPost (id) {
    this.fetch(`api/posts/${id}`)
      .then(post => this.setState({post: post}))
  }
  render (){
    return (
      <div>
        <Card>
          <Card.Description>
            <div>data
              { this.state.posts.map( (post, index) =>
                <Card.Item key={index} body={post.id}  />
              )}
            </div>
          </Card.Description>
        </Card>
      </div>
    );
  };
}

export default PostCard;
