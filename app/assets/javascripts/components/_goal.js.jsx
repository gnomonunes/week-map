class Goal extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      editable: false
    }

    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit() {
    if (this.state.editable) {
      let goal = {
        id: this.props.goal.id,
        description: this.description.value
      }

      this.props.handleUpdateGoal(goal)
    }

    this.setState({
      editable: !this.state.editable
    })
  }

  render() {
    let description = ''
    let button = ''

    if (this.state.editable) {
      description = <input
        type='text'
        ref={input => this.description = input}
        className='edit-goal-description'
        defaultValue={this.props.goal.description} />

      button = <button
        className='save'
        onClick={() => this.handleEdit()}>
        Save
      </button>
    } else {
      description = <span onClick={() => this.handleEdit()}>
        {this.props.goal.description}
      </span>

      button = <button
        className='delete-goal'
        onClick={() => this.props.handleDeleteGoal(this.props.goal.id)}>
        x
      </button>
    }

    return (
      <li>
        {description}
        {button}
      </li>
    )
  }
}