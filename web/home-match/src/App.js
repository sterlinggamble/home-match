import React from 'react';
import { Routes, Route, BrowserRouter as Router } from 'react-router-dom';

import './App.css';
import Navbar from './components/navbar/Navbar';
import ListingPage from './components/listing/ListingPage';
import Listings from './components/listing/Listings';
import Similar from './components/listing/Similar';

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      search_img_url: "",
      location: {},
      listings: []
    }

    this.search = this.search.bind(this);
  }

  search(img, location) {
    let split_location = location.split(', ');

    fetch(`http://localhost:5000/match?img_url=${img}&city=${split_location[0]}&state=${split_location[1]}`)
      .then(response => response.json())
      .then(data => {
        this.setState({ listings: data })
      })
      .catch(function (error) {
        console.log('error = ' + error)
      });
  }

  render() {
    return (
      <Router>
        <Navbar handleSubmit={this.search} />
        <Routes>
          <Route path='/' element={<Listings listings={this.state.listings} />} />
          <Route path="/listing/:id" element={<ListingPage />} />
          <Route path="/similar/:city/:state/:img" element={<Similar />} />
        </Routes>

      </Router>
    );
  }
}


export default App;
