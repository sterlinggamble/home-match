import React from 'react';
import { Link } from 'react-router-dom';
import './Listing.css';

const Listing = props => {
    const { property_id, photo, price, address_new, baths, beds, sqft_raw } = props.listing;
    const { city, state_code } = address_new;

    return (
        <div class="listing">
            <Link to={"/listing/" + property_id}>
                <img src={photo} />
                <div class="listing-info">
                    <div class="top-info">
                        <p class="price">{price}</p>
                        <p class="location">{city}, {state_code}</p>
                    </div>
                    <p class="specs">{beds} bedrooms / {baths} bathrooms / {sqft_raw} sqft</p>
                </div>
            </Link>
        </div>
    );
};

export default Listing;