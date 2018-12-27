class Goals extends React.Component {
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
    let goals = this.state.goals.map(goal => (
      <li key={goal.id}>{goal.description}</li>
    ))

    return (
      <div>
        <h2>Week goals</h2>
        <ul>
          {goals}
        </ul>
      </div>
    )
  }
}