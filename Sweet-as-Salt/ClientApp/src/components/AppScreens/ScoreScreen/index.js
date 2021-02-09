import React, { Component } from 'react'
import { NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
import shopbtn from 'contents/images/buttons/shopbtn.png';
import sharebtn from 'contents/images/buttons/sharebtn.png';
import replaybtn from 'contents/images/buttons/replaybtn.png';
export default class ScoreScreen extends Component {
  constructor(props) {
    super(props);
    this.state = { items: [], loading: true };
  }
  componentDidMount() {
    this.fetchData();
  }
  static fetchData(data) {
    return (
      <table className='table table-responsive' aria-labelledby="tabelLabel">
        {/* <thead>
                      <tr>
                          <th>Hạng</th>
                          <th>Tổng Điểm</th>
                          <th>Tên</th>
                          <th>Ngày Chơi</th>
                      </tr>
                  </thead> */}
        <tbody>
          {data.map(item =>
            <tr key={item.id}>
              <td>{item.rank}</td>
              <td>{item.name}</td>
              <td>{item.totalScore}</td>
              {/* <td>{item.createdTS}</td> */}
            </tr>
          )}
        </tbody>
      </table>
    );
  }
  onClickShareBtn = () => {
    this.props.history.push("/game");
  }
  onClickreplayBtn = () => {
    this.props.history.push("/game");
  }

  render() {
    let contents = this.state.loading
      ? <p><em>Loading...</em></p>
      : ScoreScreen.fetchData(this.state.items);

    return (
      (this.state.loading) ? (
        <div>loading</div>
      ) : (
          <div className="sas__blankpaper">
            <div className="sas__score">
              <div className="score__header">
                <div className="score__headermain">top best kings</div>
                <div className="score__headersub">of all times</div>
              </div>
              {contents}
              <div className="score__actionbtngroup">
                <div className="actionbtngroup__item">
                  <img src={shopbtn} />
                  <div>shop</div>
                </div>
                <div className="actionbtngroup__item"  onClick={() => this.onClickreplayBtn()}>
                  <img src={replaybtn} />
                  <div>replay</div>
                </div>
                <div className="actionbtngroup__item" 
                  //onClick={() => this.onClickShareBtn()}
                >
                  <img src={sharebtn} />
                  <div>share </div>
                </div>
              </div>
            </div>
          </div>

        )

    );
  }

  async fetchData() {
    try {
      const response = await fetch('leaderBoard'); // gọi api lên controller để lấy data
      const data = await response.json();
      console.log(data);
      this.setState({ items: data, loading: false });
    }
    catch (e) {
      console.log(e);
    }
  }
}
