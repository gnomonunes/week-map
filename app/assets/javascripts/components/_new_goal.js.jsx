const NewGoal = (props) => {
  let formFields = {}

  return (
    <form>
      <input ref={input => formFields.description = input} className="new-goal-description" placeholder="New goal" />
      <button>Add</button>
    </form>
  )
}