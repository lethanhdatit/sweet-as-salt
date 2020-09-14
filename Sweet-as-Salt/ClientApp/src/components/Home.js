import React, { Component } from 'react';
import { NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
export class Home extends Component {
  static displayName = Home.name;

  render () {
    return (
      <div>
            <h1>Hello, world!</h1>
            <NavLink tag={Link} className="" to="/fetch-data">Test Navigate</NavLink>
      </div>
    );
  }
}
