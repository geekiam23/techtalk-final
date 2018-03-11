import React, { Component } from 'react'
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'

class App extends Component {
  constructor () {
    super()
    this.state = {}
    this.getPosts = this.getPosts.bind(this)
    this.getPost = this.getPost.bind(this)
  }
  componentDidMount () {
    this.getPosts()
  }
  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    })
  }
  getPosts () {
    this.fetch('api/posts')
      .then(posts => {
        this.setState({posts: posts})
        this.getPost(posts[0].id)
      })
  }
  getPost (id) {
    this.fetch(`api/posts/${id}`)
      .then(post => this.setState({post: post}))
  }
  render () {
    let {posts, post} = this.state
    return posts
    ? <Container text>
        <Header as='h2' icon textAlign='center'>
        <Icon name='cocktail' circular />
        <Header.Content>
          List of Ingredients
        </Header.Content>
      </Header>
      <Button.Group fluid widths={posts.length}>
        {Object.keys(posts).map((key) => {
          return <Button active={post && post.id === posts[key].id} fluid key={key} onClick={() => this.getPost(posts[key].id)}>
            {posts[key].body}
          </Button>
        })}
      </Button.Group>
      <Divider hidden />
      {post &&
        <Container>
          <Header as='h2'>{post.body}</Header>
          {post.description && <p>{post.description}</p>}
          {post.ingredients &&
            <Segment.Group>
              {post.ingredients.map((ingredient, i) => <Segment key={i}>{ingredient.description}</Segment>)}
            </Segment.Group>
          }
          {post.steps && <p>{post.steps}</p>}
        </Container>
      }
    </Container>
    : <Container text>
      <Dimmer active inverted>
        <Loader content='Loading' />
      </Dimmer>
    </Container>
  }
}

export default App
