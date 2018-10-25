import React from "react"
import ReactTable from "react-table";
import 'react-table/react-table.css'

class BooksTable extends React.Component {
  render () {
    const data = this.props.data
    const columns = [{
      Header: 'Title',
      accessor: 'title'
    }, {
      Header: 'Price',
      accessor: 'price'
    }, {
      Header: 'Popularity',
      accessor: 'popularity'
    }]

    return (
      <React.Fragment>
        <ReactTable
          data={data}
          columns={columns}
          filterable={true}
          defaultPageSize={20}
        />
      </React.Fragment>
    );
  }
}

export default BooksTable
