import React, { Component } from 'react'
import loadingimg from '../../../contents/images/loading-screen.png'
export default class LoadingScreen extends Component {
    render() {
        return (
            <div className="sas__loading">
                <img src={loadingimg} className="loading__img"/>
            </div>
        )
    }
}
