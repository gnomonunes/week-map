const NewGoal = (props) => {
  let formFields = {}

  return (
    <form
      className="new-goal"
      onSubmit={ e => {
        e.preventDefault(); props.handleCreateGoal(formFields.description.value)
      }}>
      <input ref={input => formFields.description = input} className="description" placeholder="New goal" />
      <button className="add">Add</button>
    </form>
  )
}