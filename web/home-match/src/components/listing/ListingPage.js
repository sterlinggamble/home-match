import React, { useState, useEffect } from "react";
import "./ListingPage.css";
// import { FaSearch, FaSearchPlus } from 'react-icons/fa';
import { useParams } from "react-router-dom";

function numberWithCommas(n) {
    return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function ListingPage() {
    const { id } = useParams();

    const [listing, setListing] = useState(null);

    useEffect(() => {
        fetch(`http://localhost:5000/listing?id=${id}`)
            .then(response => response.json())
            .then(data => setListing(data))
            .catch(function (error) {
                console.log('error = ' + error)
            });
    }, []);

    if (listing) {
        const { price, address, description, baths, beds, building_size } = listing;
        const { line, city, state_code } = address;

        let photos = listing.photos.map((photo) =>
            <a href={`/similar/${city}/${state_code}/${encodeURIComponent(photo.href)}`}>
                <div className="photo">
                    {/* <div class="search-button">
                    <FaSearchPlus className="image-icon" />
                </div> */}
                    <img src={photo.href} className="listing-photo" />
                </div>
            </a>
        );

        const full_address = `${line}, ${city}, ${state_code}`;

        const { size, units } = building_size;

        return (
            <div className="listing-page">
                <div className="info">
                    <div className="text-container">
                        <h2 className="price">{'$' + numberWithCommas(price)}</h2>
                        <p className="secondary-text">{full_address}</p>
                    </div>

                    <div className="text-container">
                        <p className="primary-text">House Information</p>
                        <p className="secondary-text">{beds} bedrooms / {baths} bathrooms / {size} {units}</p>
                    </div>

                    <div className="text-container">
                        <p className="primary-text">Description</p>
                        <p className="secondary-text">{description}</p>
                    </div>
                </div>
                <div className="photos">{photos}</div>
            </div>
        );
    } else {
        return (null);
    }


}

export default ListingPage;