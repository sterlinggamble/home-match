import React, { useState, useEffect } from "react";
import Listing from "./Listing";
import "./Similar.css";
import { useParams } from "react-router-dom";

let data = [
    {
        "address": "1711 Third St in West End, Alameda, 94501",
        "address_new": {
            "city": "Alameda",
            "county": "Alameda",
            "county_needed_for_uniq": false,
            "fips_code": "06001",
            "lat": 37.776711,
            "line": "1711 Third St",
            "lon": -122.288187,
            "neighborhood_name": "West End",
            "neighborhoods": [
                {
                    "city": "Alameda",
                    "id": null,
                    "level": "neighborhood",
                    "name": "West End",
                    "state_code": "CA"
                }
            ],
            "postal_code": "94501",
            "state": "California",
            "state_code": "CA",
            "time_zone": "America/Los_Angeles"
        },
        "advertiser_id": 1178377,
        "baths": 1,
        "baths_full": 1,
        "beds": 2,
        "broker_advertiser_id": 3633649,
        "color_score": 0.9997883435624968,
        "colors": [
            [
                201.0,
                195.0,
                190.0
            ],
            [
                171.0,
                110.0,
                72.0
            ],
            [
                212.0,
                195.0,
                170.0
            ],
            [
                163.0,
                157.0,
                155.0
            ],
            [
                198.0,
                133.0,
                87.0
            ],
            [
                171.0,
                153.0,
                133.0
            ],
            [
                129.0,
                121.0,
                117.0
            ],
            [
                135.0,
                117.0,
                99.0
            ],
            [
                150.0,
                111.0,
                88.0
            ],
            [
                191.0,
                148.0,
                122.0
            ]
        ],
        "data_source_name": "mls",
        "has_leadform": true,
        "is_cobroker": true,
        "is_new_construction": false,
        "is_new_listing": true,
        "is_showcase": false,
        "is_turbo": false,
        "last_update": "2022-01-18T21:16:17Z",
        "lat": 37.776711,
        "lead_forms": [
            {
                "cashback_enabled": false,
                "flip_the_market_enabled": false,
                "form": {
                    "agents": [
                        {
                            "advertiser_id": 1178377,
                            "has_ratings": false,
                            "is_listing_agent": true
                        }
                    ],
                    "email": {
                        "minimum_character_count": 5,
                        "required": true
                    },
                    "message": {
                        "minimum_character_count": 0,
                        "required": false
                    },
                    "name": {
                        "minimum_character_count": 1,
                        "required": true
                    },
                    "phone": {
                        "maximum_character_count": 11,
                        "minimum_character_count": 10,
                        "required": true
                    },
                    "show": true
                },
                "is_lcm_enabled": false,
                "lead_type": "co_broke",
                "show_text_leads": true,
                "smarthome_enabled": false,
                "type": "classic"
            }
        ],
        "list_date": "2022-01-18T21:22:47Z",
        "list_tracking": "type|property|data|prop_id|9066598163|list_id|2939178107|page|rank|list_branding|listing_agent|listing_office|data_source|mls|advertiser_id|agent|office|broker|property_status|product_code|advantage_code^1|2|0|1|P98P|25WEM|25VQP|1|9HS|5^^$0|1|2|$3|4|5|6|7|L|8|M|9|$A|N|B|O]|C|D|E|$F|P|G|Q|H|R]|I|S|J|T|K|U]]",
        "listing_id": "2939178107",
        "lon": -122.288187,
        "match_score": 10,
        "mls": {
            "abbreviation": "BYCA",
            "id": "40978353",
            "name": "BayEast",
            "plan_id": null,
            "type": "mls"
        },
        "office_advertiser_id": 3634510,
        "office_name": "Keller Williams Realty",
        "open_house_start_date": "2022-01-22T22:00:00.000Z",
        "open_houses": [
            {
                "dst": true,
                "end_date": "2022-01-23T00:00:00.000Z",
                "start_date": "2022-01-22T22:00:00.000Z",
                "time_zone": "PST"
            },
            {
                "dst": true,
                "end_date": "2022-01-24T00:00:00.000Z",
                "start_date": "2022-01-23T22:00:00.000Z",
                "time_zone": "PST"
            },
            {
                "dst": true,
                "end_date": "2022-01-30T00:00:00.000Z",
                "start_date": "2022-01-29T22:00:00.000Z",
                "time_zone": "PST"
            },
            {
                "dst": true,
                "end_date": "2022-01-31T00:00:00.000Z",
                "start_date": "2022-01-30T22:00:00.000Z",
                "time_zone": "PST"
            }
        ],
        "page_no": 1,
        "photo": "https://ap.rdcpix.com/4c56ceabd9541ead3f5330c275a2269fl-m151306768x.jpg",
        "photo_count": 28,
        "price": "$575,000",
        "price_raw": 575000,
        "products": [
            "core.agent",
            "core.broker",
            "co_broke"
        ],
        "prop_status": "for_sale",
        "prop_sub_type": "townhomes",
        "prop_type": "condo",
        "property_id": "9066598163",
        "rank": 2,
        "rdc_web_url": "https://www.realtor.com/realestateandhomes-detail/1711-Third-St_Alameda_CA_94501_M90665-98163",
        "short_price": "$575K",
        "sqft": "967 sq ft",
        "sqft_raw": 967,
        "tag_score": 0.0,
        "tags": [
            "Couch",
            "Living room",
            "Furniture",
            "Azure",
            "Interior design",
            "Picture frame",
            "Property",
            "Table",
            "Chair",
            "Floor"
        ]
    },
    {
        "address": "1234 Otis Dr in East End, Alameda, 94501",
        "address_new": {
            "city": "Alameda",
            "county": "Alameda",
            "county_needed_for_uniq": false,
            "fips_code": "06001",
            "lat": 37.763354,
            "line": "1234 Otis Dr",
            "lon": -122.263727,
            "neighborhood_name": "East End",
            "neighborhoods": [
                {
                    "city": "Alameda",
                    "id": null,
                    "level": "neighborhood",
                    "name": "East End",
                    "state_code": "CA"
                },
                {
                    "city": "Alameda",
                    "id": "2",
                    "level": "sub_neighborhood",
                    "name": "South Shore",
                    "state_code": "CA"
                }
            ],
            "postal_code": "94501",
            "state": "California",
            "state_code": "CA",
            "time_zone": "America/Los_Angeles"
        },
        "advertiser_id": 2199148,
        "baths": 2,
        "baths_full": 2,
        "beds": 3,
        "broker_advertiser_id": 4482137,
        "color_score": 0.9999085916799992,
        "colors": [
            [
                129.0,
                155.0,
                175.0
            ],
            [
                88.0,
                81.0,
                82.0
            ],
            [
                23.0,
                24.0,
                27.0
            ],
            [
                251.0,
                251.0,
                248.0
            ],
            [
                141.0,
                149.0,
                157.0
            ],
            [
                52.0,
                50.0,
                52.0
            ],
            [
                115.0,
                116.0,
                120.0
            ],
            [
                111.0,
                129.0,
                144.0
            ],
            [
                93.0,
                74.0,
                64.0
            ],
            [
                49.0,
                56.0,
                69.0
            ]
        ],
        "data_source_name": "mls",
        "has_leadform": true,
        "is_cobroker": true,
        "is_new_construction": false,
        "is_new_listing": true,
        "is_showcase": false,
        "is_turbo": false,
        "last_update": "2022-01-19T04:59:25Z",
        "lat": 37.763354,
        "lead_forms": [
            {
                "cashback_enabled": false,
                "flip_the_market_enabled": false,
                "form": {
                    "agents": [
                        {
                            "advertiser_id": 2199148,
                            "has_ratings": false,
                            "is_listing_agent": true
                        }
                    ],
                    "email": {
                        "minimum_character_count": 5,
                        "required": true
                    },
                    "message": {
                        "minimum_character_count": 0,
                        "required": false
                    },
                    "name": {
                        "minimum_character_count": 1,
                        "required": true
                    },
                    "phone": {
                        "maximum_character_count": 11,
                        "minimum_character_count": 10,
                        "required": true
                    },
                    "show": true
                },
                "is_lcm_enabled": false,
                "lead_type": "co_broke",
                "show_text_leads": true,
                "smarthome_enabled": false,
                "type": "classic"
            }
        ],
        "list_date": "2022-01-19T05:03:10Z",
        "list_tracking": "type|property|data|prop_id|2102190759|list_id|2939191018|page|rank|list_branding|listing_agent|listing_office|data_source|mls|advertiser_id|agent|office|broker|property_status|product_code|advantage_code^1|1|0|1|1B4VG|1TDH6|2O2FT|1|9HS|5^^$0|1|2|$3|4|5|6|7|L|8|M|9|$A|N|B|O]|C|D|E|$F|P|G|Q|H|R]|I|S|J|T|K|U]]",
        "listing_id": "2939191018",
        "lon": -122.263727,
        "lot_size": "5,500 sq ft lot",
        "match_score": 4,
        "mls": {
            "abbreviation": "ALCA",
            "id": "40978398",
            "name": "ContraCosta",
            "plan_id": null,
            "type": "mls"
        },
        "office_advertiser_id": 3050106,
        "office_name": "Keenan Howard Realty, Inc.",
        "open_house_start_date": "2022-01-22T21:00:00.000Z",
        "open_houses": [
            {
                "dst": true,
                "end_date": "2022-01-23T00:00:00.000Z",
                "start_date": "2022-01-22T21:00:00.000Z",
                "time_zone": "PST"
            },
            {
                "dst": true,
                "end_date": "2022-01-24T00:00:00.000Z",
                "start_date": "2022-01-23T21:00:00.000Z",
                "time_zone": "PST"
            }
        ],
        "page_no": 1,
        "photo": "https://ap.rdcpix.com/04df2c52debb54ea1f3ab32dee7f4eb5l-m2834056752x.jpg",
        "photo_count": 4,
        "price": "$1,050,000",
        "price_raw": 1050000,
        "products": [
            "core.agent",
            "core.broker",
            "co_broke"
        ],
        "prop_status": "for_sale",
        "prop_type": "single_family",
        "property_id": "2102190759",
        "rank": 1,
        "rdc_web_url": "https://www.realtor.com/realestateandhomes-detail/1234-Otis-Dr_Alameda_CA_94501_M21021-90759",
        "short_price": "$1.1M",
        "sqft": "1,250 sq ft",
        "sqft_raw": 1250,
        "tag_score": 0.2607409686183504,
        "tags": [
            "Land lot",
            "Floor",
            "Asphalt",
            "Grass",
            "Plant",
            "Property",
            "Building",
            "Architecture",
            "Road surface",
            "Sky"
        ]
    }
]

function Similar() {
    const { city, state, img } = useParams();

    let search_img = decodeURIComponent(img);

    const [similar_listings, setListings] = useState(null);

    useEffect(() => {
        fetch(`http://localhost:5000/match?img_url=${img}&city=${city}&state=${state}`)
            .then(response => response.json())
            .then(data => setListings(data))
            .catch(function (error) {
                console.log('error = ' + error)
            });
    }, []);

    if (similar_listings) {
        let listings = similar_listings.map((listing) =>
            <Listing listing={listing} />
        );

        return (
            <div className="similar-homes">
                <h2 style={{ textAlign: 'center', margin: '0' }}>Similar Homes</h2>
                <div className="body">
                    {/* <div className="search-listing">
                        <Listing src={search_img} />
                    </div> */}
                    <img src={search_img} className="search-listing" />
                    <div className="listings">
                        {listings}
                    </div>
                </div>
            </div>
        );
    } else {
        return (
            <div className="similar-homes">
                <h2 style={{ textAlign: 'center', margin: '0' }}>Similar Homes</h2>
                <div className="body">
                    {/* <div className="search-listing">
                        <Listing src={search_img} />
                    </div> */}
                    <img src={search_img} className="search-listing" />
                </div>
            </div>
        );
    }

    // return (
    //     <div className="similar-homes">
    //         <h2 style={{ textAlign: 'center', margin: '0' }}>Similar Homes</h2>
    //         <div className="body">
    //             {/* <div className="search-listing">
    //                 <Listing src={search_img} />
    //             </div> */}
    //             <img src={search_img} className="search-listing" />
    //             <div className="listings">
    //                 {listings}
    //             </div>
    //         </div>
    //     </div>
    // );
}

export default Similar;