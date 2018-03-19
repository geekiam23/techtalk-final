import React from 'react';
import TextPost from './TextPost'
import MeetingPost from './MeetingPost'
import JobPost from './JobPost'
import ProjectPost from './ProjectPost'
import PicPost from './PicPost'
import '../App.css'

class PostCard extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      posts: [],
      job_posts: [],
      meeting_posts: [],
      pic_posts: [],
      project_posts: [],
      text_post: []
    }
    this.getPosts = this.getPosts.bind(this)
    // this.getPost = this.getPost.bind(this)
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
      this.setState({posts})
      console.log(posts);
    })
  }

  render (){
    let postTypes =
    this.state.posts.map((post) => {
      if(post.content_type === "TextPost") {
        return  <TextPost
                  key={post.id}
                  body={post.body}
                  created_at={post.created_at}
                />
      }else if (post.content_type === "JobPost") {
        return  <JobPost
                  key={post.id}
                  title={post.title}
                  body={post.body}
                  link={post.link}
                  location={post.location}
                  salary={post.salary}
                  created_at={post.created_at}
                />
      }else if (post.content_type === "MeetingPost") {
        return  <MeetingPost
                  key={post.id}
                  title={post.title}
                  body={post.body}
                  date={post.date}
                  time={post.time}
                  created_at={post.created_at}
                />
      }else if (post.content_type === "PicPost") {
        return  <PicPost
                  key={post.id}
                  image_file_name={post.image_file_name}
                  created_at={post.created_at}
                />
      }else if (post.content_type === "ProjectPost") {
        return  <ProjectPost
                  key={post.id}
                  title={post.title}
                  body={post.body}
                  link={post.link}
                  repo={post.repo}
                  created_at={post.created_at}
                />
      }return console.log("done");
    });
    return (
      <div className="techtalk-card-container mdl-grid">
        {postTypes}
      </div>
    );
  };
}

export default PostCard;
