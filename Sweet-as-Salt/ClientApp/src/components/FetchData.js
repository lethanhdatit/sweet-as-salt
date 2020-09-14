import React, { Component } from 'react';
import { NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
export class FetchData extends Component {
  static displayName = FetchData.name;

  constructor(props) {
    super(props);
    this.state = { items: [], loading: true };
  }

  componentDidMount() {
      this.fetchData();
  }

    static fetchData(data) {
        return (
            <table className='table table-striped' aria-labelledby="tabelLabel">
                <thead>
                    <tr>
                        <th>Hạng</th>
                        <th>Tổng Điểm</th>
                        <th>Tên</th>
                        <th>Ngày Chơi</th>
                    </tr>
                </thead>
                <tbody>
                    {data.map(item =>
                        <tr key={item.id}>
                            <td>{item.rank}</td>
                            <td>{item.totalScore}</td>
                            <td>{item.name}</td>
                            <td>{item.createdTS}</td>
                        </tr>
                    )}
                </tbody>
            </table>
        );
    }

  render() {
    let contents = this.state.loading
      ? <p><em>Loading...</em></p>
        : FetchData.fetchData(this.state.items);

    return (
        <div>
            <h1 id="tabelLabel" >Test Fetch Data From Controller</h1>
            <NavLink tag={Link} className="" to="/">Back</NavLink>
            {contents}
        </div>
    );
  }

    async fetchData() {
        try
        {
            const response = await fetch('apiAction'); // gọi api lên controller để lấy data
            const data = await response.json();
            console.log(data);
            this.setState({ items: data, loading: false });
        }
        catch (e) {
            alert("Gọi API thất bại");
        }
    }
}
