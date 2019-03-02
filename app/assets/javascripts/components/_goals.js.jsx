const Goals = props => (
  <div>
    <h2>Week goals</h2>
    <ul className="week-goals">
      {
        props.goals.map(goal => (
          <li key={goal.id}>
            {goal.description}
            <button className="delete-goal" onClick={() => props.handleDeleteGoal(goal.id)}>
              x
            </button>
          </li>
        ))
      }
    </ul>
  </div>
)