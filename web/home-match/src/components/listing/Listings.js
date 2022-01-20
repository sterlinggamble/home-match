import React from "react";
import Listing from "./Listing";

class Listings extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            listings: this.props.listings
        }
    }

    componentDidUpdate(prevProps) {
        if (prevProps.listings !== this.props.listings) {
            this.setState({ listings: this.props.listings });
        }
    }

    render() {
        let listings = this.state.listings.map((listing) =>
            <Listing listing={listing} />
        );

        return (
            <div className="listings-container">
                <div className="listings">
                    {listings}
                </div>
            </div>
        );
    }
}

export default Listings;