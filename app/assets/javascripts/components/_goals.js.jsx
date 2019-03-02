const Goals = props => (
  <div>
    <h2>Week goals</h2>
    <ul className="week-goals">
      {
        props.goals.map(goal => (
          <Goal
            key={goal.id}
            goal={goal}
            handleUpdateGoal={props.handleUpdateGoal}
            handleDeleteGoal={props.handleDeleteGoal}
          />
        ))
      }
    </ul>
  </div>
)