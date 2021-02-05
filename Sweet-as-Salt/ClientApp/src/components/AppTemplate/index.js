import NavBar from 'components/AppLayout/NavBar';
import React, { Component } from 'react';
import { Route } from 'react-router-dom';
import { Container } from 'reactstrap';

function AppLayout(props) {
  return (
    <div>
      <div className="sas__container">
        <NavBar />
        {props.children}
      </div>
    </div>
  )
}
export default function AppTemplate({Component, ...props}) {
  return (
    <Route 
      {...props}
      render={(propsComponent) => (
        <AppLayout>
          <Component {...propsComponent} />
        </AppLayout>
      )}
    />
  )
}
