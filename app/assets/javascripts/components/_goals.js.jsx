const Goals = props => {
  return (
    <div>
      <h2>Week goals</h2>
      <ul>
        {
          props.goals.map(goal => (
            <li key={goal.id}>{goal.description}</li>
          ))
        }
      </ul>
    </div>
  )
}