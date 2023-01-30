import { useState, useEffect } from 'react'

import "./bootstrap.css"
import Navbar from './Navbar';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Signup from './Signup';
import Home from './Home';
import ProjectListView from './ProjectListView';
import NewProjectView from './NewProjectView';
import ProjectView from './ProjectView';
import EditComment from './EditComment';

function App() {
  const [currentUser, setCurrentUser] = useState(null)
  const [errors, setErrors] = useState([])


  useEffect(() => {
    fetch('/auth')
    .then(resp => {
      if(resp.ok){
        resp.json().then(user => setCurrentUser(user))
      } else {
        resp.json().then((errorData) => setErrors(errorData.errors))
      }
    })
  }, [])

  
   
  // if(!currentUser) return <Signup setCurrentUser={setCurrentUser} />
  return (
    <BrowserRouter>
    <div className="App" style={{minHeight: '100vh',}}>
      <Navbar setCurrentUser={setCurrentUser} user={currentUser}/>
      <Switch>
        <Route exact path="/">
          <Home user={currentUser}/>
        </Route>
        <Route exact path="/signup">
          <Signup setCurrentUser={setCurrentUser}/>
        </Route>
        {/* view all projects */}
        <Route exact path="/my_projects">
          <ProjectListView 
          // id={id}
          />
        </Route>
        {/* create new project */}
        <Route exact path="/my_projects/new">
          <NewProjectView user={currentUser}/>
        </Route>
        {/* display individual projects */}
        <Route exact path="/my_projects/:id">
          {/* <div>project view</div> */}
          <ProjectView />
        </Route>
        {/* display all projects */}
        <Route exact path="/notes/:id/edit">
          <EditComment />
        </Route>
      </Switch>
    </div>
  </BrowserRouter>
  );
}

export default App;
