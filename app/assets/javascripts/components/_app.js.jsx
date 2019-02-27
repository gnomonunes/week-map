class App extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      goals: []
    }

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
  }

  handleFormSubmit(description) {
    let body = JSON.stringify({goal: {description: description}})

    fetch('/api/v1/weeks/1/goals', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
      .then(response => response.json())
      .then(goal => this.addNewGoal(goal))
  }

  addNewGoal(goal) {
    this.setState({
      goals: this.state.goals.concat(goal)
    })
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
        <NewGoal handleFormSubmit={this.handleFormSubmit} />
      </div>
    )
  }
}