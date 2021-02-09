import React, { Component, Fragment } from 'react'
import TinderCard from 'react-tinder-card';
import LoadingScreen from 'components/AppScreens/LoadingScreen';
import SlidingPane from "react-sliding-pane";
import "react-sliding-pane/dist/react-sliding-pane.css";
import jokerimg from 'contents/images/game/joker.png';
import jokerimgUp from 'contents/images/game/joker-up.png';
import {Collapse} from 'react-collapse';
export default class GameScreen extends Component {
  constructor(props) {
    super(props);
    this.state = {
      maxPoint: 0,
      qLength: 0,
      gameSession: null,
      answers: null,
      yourPoint: 0,
      dialogText: '',
      questionText: '',
      infoText: '',
      isFinish: false,
      isLoading: true,
      isPaneOpen: false,
      isPaneOpenBottom: false,
      handleHeightChange: false
    }
  }
  async componentDidMount() {
    const response = await fetch('question/get');
    const data = await response.json();
    if (data != null && data.characters != null) {
      var length = data.characters.length;
      var nextQuestion = length > 0 ? data.characters[0].question : null;
      let _dialogText = '';
      let _questionText = '';
      let _infoText = '';
      if (nextQuestion != null) {
        _dialogText = nextQuestion.description;
        _questionText = nextQuestion.content;
        _infoText = nextQuestion.info;
      }
      console.log(data.characters);
      //setTimeout(() => this.setState({isLoading: false}), 3000);
      this.setState({
        maxPoint: data.qMaxPoint,
        qLength: data.qLength,
        gameSession: data.characters,
        answers: null,
        yourPoint: 0,
        dialogText: _dialogText,
        questionText: _questionText,
        infoText: _infoText,
        isLoading: false
      });
      
    }
  }
  onShowHelpText = () => {
    this.setState({ isPaneOpenBottom: !this.state.isPaneOpenBottom, 
    })
  }
  render() {
    const onSwipe = (direction, question, nextQuestion) => {
      console.log('You swiped: ' + direction);
      switch (direction) {
        case 'right': {
          //yes
          onAnswer(true, question, nextQuestion);
          break;
        }
        case 'left': {
          //no
          onAnswer(false, question, nextQuestion);
          break;
        }
        case 'up': {
          onShowExtendInfo(nextQuestion.info);
          break;
        }
      }
    }
    const onAnswer = (selection, question, nextQuestion) => {
      var _answers = this.state.answers != null ? this.state.answers : [];
      var existIndex = _answers.findIndex(f => f.questionId === question.id);
      if (existIndex >= 0) {
        _answers[existIndex].selection = selection;
      }
      else {
        _answers.push({
          questionId: question.id,
          selection: selection
        });
      }
      var myPoint = 0;
      var questions = this.state.gameSession;
      _answers.map((answer, index) => {
        var index = questions.findIndex(f => f.question.id === answer.questionId);
        if (index >= 0) {
          var qInfo = questions[index].question;
          myPoint += qInfo.isCorrect == answer.selection ? qInfo.point : qInfo.inCorrectPoint;
        }
      });
      let _dialogText = '';
      let _questionText = '';
      let _infoText = '';
      if (nextQuestion != null) {
        _dialogText = nextQuestion.description;
        _questionText = nextQuestion.content;
        _infoText = nextQuestion.info;
      }
      let isFinish = _answers.length == this.state.qLength;
      this.setState({
        answers: _answers,
        yourPoint: Number(myPoint.toFixed(1)),
        dialogText: _dialogText,
        questionText: _questionText,
        infoText: _infoText,
        isFinish: isFinish,
        isPaneOpenBottom: false
      });
      console.log(this.state.answers);
      console.log(this.state.yourPoint);
    }
    const onShowExtendInfo = (info) => {
      //todo show extend info

      //
      console.log(info);
      this.setState({
        infoText: info
      });
    }

    return (
      <div className="sas__game">
        <div>

        </div>
        {
          this.state.isFinish != true
            ?
            <Fragment>
              {
                this.state.isLoading == true ?
                  <LoadingScreen />
                  :
                  <div className="sas__gamewrapper">
                    {
                      this.state.gameSession != null ?
                        this.state.gameSession.map((item, index) => {
                          var _src = require(`contents/images/characters/${item.contentUrl}`);
                          var length = this.state.gameSession.length;
                          var nextQuestion = (index + 1) <= (length - 1) ? this.state.gameSession[index + 1].question : null;
                          return <TinderCard
                            key={index}
                            onSwipe={(direction) => onSwipe(direction, item.question, nextQuestion)}
                            preventSwipe={['up', 'down']}
                            className="sas__gameitem"
                          >
                            <img src={_src} />
                            
                            <div className="gameitem__dialog">
                              {this.state.dialogText}
                            </div>
                            <div className="gameitem__charactername">
                              {item.name}
                            </div>
                            <div className={`gameitem__help ${this.state.isPaneOpenBottom ? 'height-translate': ''}`}
                            >
                            <div onClick={() => this.onShowHelpText()} className="help__togglebtn">
                                  <span>{this.state.questionText}</span>
                                  <span className="help__joker">
                                    {this.state.isPaneOpenBottom ? <img src={jokerimg}/> : <img src={jokerimgUp}/>}
                                    </span>
                                </div>
                                <div>{this.state.infoText}</div>
                            </div>
                          </TinderCard>
                        })
                        :
                        <div></div>
                    }
                  </div>
              }
            </Fragment>
            :
            <div className="hint-gr">
              <h2>Your point: {this.state.yourPoint}</h2>
            </div>
        }
      </div>
    )
  }
}
