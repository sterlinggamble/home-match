import React from 'react';
import './Modal.css';

class Modal extends React.Component {
    constructor(props) {
        super(props);
        this.state = { url: "" };
        // this.updateURL = this.updateURL.bind(this);
    }

    // enterImg() {
    //     this.props.handleClose();
    //     // this.props.updateURL(this.state.url);
    // }

    updateURL(evt) {
        const val = evt.target.value;

        this.setState({
            url: val
        })
    }

    render() {
        const { handleClose, show } = this.props;

        const showHideClassName = show ? "modal display-block" : "modal display-none";

        let enterImg = () => {
            handleClose();
            this.props.updateURL(this.state.url);
        };

        return (
            <div className={showHideClassName}>
                <section className="modal-main" >
                    <input placeholder="image url" className="image-input" value={this.state.url} onChange={evt => this.updateURL(evt)} />
                    <div className='buttons'>
                        <button type="button" onClick={handleClose} className="button1">
                            Cancel
                        </button>
                        <button type="button" onClick={enterImg} className="button2">
                            Enter
                        </button>
                    </div>

                </section>
            </div>
        );
    }
}

// const Modal = ({ handleClose, show }) => {


//     const showHideClassName = show ? "modal display-block" : "modal display-none";

//     const enterImg = () => {
//         handleClose();

//     }

//     return (
//         <div className={showHideClassName}>
//             <section className="modal-main" >
//                 <input type="text" placeholder="image url" className="image-input" />
//                 <div className='buttons'>
//                     <button type="button" onClick={handleClose} className="button1">
//                         Cancel
//                     </button>
//                     <button type="button" onClick={enterImg} className="button2">
//                         Enter
//                     </button>
//                 </div>

//             </section>
//         </div>
//     );
// };

export default Modal;