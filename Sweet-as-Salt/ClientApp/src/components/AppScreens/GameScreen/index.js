import React, { Component } from 'react'
import TinderCard from 'react-tinder-card';
import princessimg from 'contents/images/characters/princess.png'
export default class GameScreen extends Component {
  constructor(props){
    super(props);
    this.state = {

    }
  }
  handleSwipeLeft = () => {
    console.log("onSwipedLeftEvent");
  }
  render() {
    const onSwipe = (direction) => {
      console.log('You swiped: ' + direction)
    }
     
    const onCardLeftScreen = (myIdentifier) => {
      console.log(myIdentifier + ' left the screen')
    }
    return (
      <div className="sas__game">
        <TinderCard 
        onSwipe={onSwipe} 
        onCardLeftScreen={() => onCardLeftScreen('fooBar')} 
        preventSwipe={['right', 'left']}>
          <img src={princessimg} />
        </TinderCard>
      </div>
    )
  }
}
