class App extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      goals: []
    }
  }

  componentDidMount() {
    fetch('/api/v1/weeks.json')
      .then(response => response.json())
      .then(data => this.setState({ goals: data.goals }))
  }

  render() {
    return (
      <div>
        <Goals goals={this.state.goals} />
        <NewGoal />
      </div>
    )
  }
}