class App extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      goals: []
    }

    this.handleCreateGoal = this.handleCreateGoal.bind(this)
    this.handleUpdateGoal = this.handleUpdateGoal.bind(this)
    this.handleDeleteGoal = this.handleDeleteGoal.bind(this)
  }

  handleCreateGoal(description) {
    let body = JSON.stringify({
      data: {
        type: "goal",
        attributes: {
          description: description
        }
      }
    })

    fetch('/api/v1/weeks/1/goals', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
      .then(response => response.json())
      .then(jsonResponse => this.addNewGoal({
        id: jsonResponse.data.id,
        description: jsonResponse.data.attributes.description
      }))
  }

  handleUpdateGoal(goal) {
    let body = JSON.stringify({
      data: {
        id: goal.id,
        type: "goal",
        attributes: {
          description: goal.description
        }
      }
    })

    fetch(`/api/v1/weeks/1/goals/${goal.id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
      .then(response => this.updateGoals(goal))
  }

  updateGoals(updatedGoal) {
    goals = this.state.goals.map(goal => {
      if (goal.id === updatedGoal.id) {
        goal = updatedGoal
      }

      return goal
    })

    this.setState({
      goals: goals
    })
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
      .then(jsonResponse => this.setState({ goals: jsonResponse.data[0].attributes.goals }))
  }

  render() {
    return (
      <div>
        <Goals
          goals={this.state.goals}
          handleUpdateGoal={this.handleUpdateGoal}
          handleDeleteGoal={this.handleDeleteGoal}
        />
        <NewGoal handleCreateGoal={this.handleCreateGoal} />
      </div>
    )
  }
}