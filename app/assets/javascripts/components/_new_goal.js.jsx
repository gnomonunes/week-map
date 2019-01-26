const NewGoal = (props) => {
  let formFields = {}

  return (
    <form className="new-goal">
      <input ref={input => formFields.description = input} className="description" placeholder="New goal" />
      <button className="add">Add</button>
    </form>
  )
}