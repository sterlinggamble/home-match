import React from 'react';
// import { Link } from 'react-router-dom';
import "./Navbar.css";
import { FaSearch, FaImage } from 'react-icons/fa';
import Modal from '../modal/Modal';

class Navbar extends React.Component {
    constructor() {
        super();
        this.state = {
            show: false,
            img_url: "",
            location: ""
        };
        this.showModal = this.showModal.bind(this);
        this.hideModal = this.hideModal.bind(this);
        this.updateURL = this.updateURL.bind(this);
    }

    showModal() {
        this.setState({ show: true });
    }

    hideModal() {
        this.setState({ show: false });
    };


    updateURL(img) {
        this.setState({ img_url: img });
    }

    handleSubmit(event) {
        // alert(this.state.location);
        event.preventDefault();
        const { img_url, location } = this.state;
        this.props.handleSubmit(img_url, location)
        // console.log(this.state.location);

    }

    handleChange(event) {
        this.setState({ location: event.target.value });
    }

    render() {
        let img;
        if (this.state.img_url) {
            img = <img src={this.state.img_url} className="search-image" />
        } else {
            img = <FaImage className="image-icon" />
        }

        return (
            <div class="navbar">
                <div class="container">
                    <a href="/">Home</a>
                    <div class="search-container">
                        <FaSearch className="search-icon" />
                        <form onSubmit={evt => this.handleSubmit(evt)}>
                            <input
                                class="search-bar"
                                type="text"
                                placeholder="Enter a location"
                                value={this.state.location}
                                onChange={evt => this.handleChange(evt)} />
                            <input type="submit" value="Submit" style={{ display: "none" }} />
                        </form>
                    </div>

                    <div class="image-button" onClick={this.showModal}>
                        {img}
                    </div>

                </div>
                <Modal show={this.state.show} handleClose={this.hideModal} updateURL={this.updateURL}>
                    <p>Modal</p>
                </Modal>
            </div>
        );

    }
}

export default Navbar;