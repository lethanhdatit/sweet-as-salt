import React, { Component } from 'react'
import { NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
import LoadingScreen from '../LoadingScreen';
export default class HomeScreen extends Component {
    constructor(props) {
        super(props);
        this.state = { };
      }
    
      render() {
        return (
            <div>
                HomeScreen
            </div>
        );
      }

}
