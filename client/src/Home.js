import React, { useEffect, useState } from "react";
import ProjectListView from "./ProjectListView";
import Projects from "./Projects";
import "./home.css";
import { Link } from "react-router-dom";

function Home({ user }) {
  // // const [errors, setErrors] = useState([])
  // const [projects, setProjects] = useState([])
  // useEffect(()=> {
  //   fetch('/projects')
  //   .then(resp => {
  //     if(resp.ok){
  //       resp.json().then(projects => setProjects(projects))
  //     }
  //   })
  // },[])

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      {!user ? (
        "Please login to see your account"
      ) : (

            <div className="home1">
              <div>
                <h1>Welcome to Collabland!</h1>
              </div>
              <div className="type-container">
                <div className="typed-out">You are now logged in as </div>
                <div className="c1">
                  <div className="typed-out2">{user.username}</div>
                </div>
              </div>
              <div className="my-projects-div">
                {user.projects.map(project => {
                  return(
                    <div  key={project.id}>
                      <h1>My Projects:</h1>
                      <Link  className='home-project-links' to={`/my_projects/${project.id}`}>{project.title}</Link>
                    </div>
                  )
                })}
              </div>
          </div>

      )}
    </div>
  );
}

export default Home;
