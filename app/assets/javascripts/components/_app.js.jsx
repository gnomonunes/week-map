class App extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      goals: []
    }

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.handleDeleteGoal = this.handleDeleteGoal.bind(this)
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

  handleDeleteGoal(goal_id) {
    fetch(`/api/v1/weeks/1/goals/${goal_id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then(response => {
        if (response.ok) {
          this.setState({
            goals: this.state.goals.filter(goal => goal.id !== goal_id)
          })
        }
      })
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
        <Goals goals={this.state.goals} handleDeleteGoal={this.handleDeleteGoal} />
        <NewGoal handleFormSubmit={this.handleFormSubmit} />
      </div>
    )
  }
}