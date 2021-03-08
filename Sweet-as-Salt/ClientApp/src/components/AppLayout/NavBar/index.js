import React, { Component } from 'react'
import { NavLink } from "react-router-dom";
import logoimg from '../../../contents/images/sas-crown-icon.png';
export default class NavBar extends Component {
    render() {
        return (
            <div className="sas__navbar">
                <div className="navbar__logo">
                    <NavLink activeClassName="active" className="nav-link" to="/sweet-as-salt/home">
                        <img src={logoimg} className="navbar__logoimg" />
                    </NavLink>
                </div>
                <div className="navbar__menu">
                    <NavLink activeClassName="active" className="nav-link" to="/sweet-as-salt/instructions">Instructions</NavLink>
                    <NavLink activeClassName="active" className="nav-link" to="/sweet-as-salt/score">Score</NavLink>
                    <NavLink activeClassName="active" className="nav-link" to="/sweet-as-salt/about">About</NavLink>
                </div>
            </div>
        )
    }
}
