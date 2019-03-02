const NewGoal = (props) => {
  let formFields = {}

  return (
    <form
      className="new-goal"
      onSubmit={ e => {
        e.preventDefault(); props.handleFormSubmit(formFields.description.value)
      }}>
      <input ref={input => formFields.description = input} className="description" placeholder="New goal" />
      <button className="add">Add</button>
    </form>
  )
}