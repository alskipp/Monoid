/*:
**Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

[**<- Previous page**](@previous)
* * *

## Anarcho-Syndicalist-Commune-Monoid
### (Featuring The Holy Turnip)
*/
import Monoid
/*:
As a real world example of the use of Monoids, imagine an agrarian commune dedicated to the task of cultivating,
consuming and worshipping turnips. At harvest time the turnips are gathered together to be distributed equally
amongst the commune – with the exception of the largest turnip, which is given the designation ‘Holy Turnip’.
The Holy Turnip is revered as the guarantor of a plentiful harvest the following year. Needless to say,
the commune will endure great hardship before even considering eating the Holy Turnip.

How can we represent our Commune in code? To keep things simple, the people will be represented
as an Array of Strings, the total number of turnips as an Int and The Holy Turnip can be represented
as a Double that records its mass (why will become clear shortly).
*/
struct Commune { let people: [String], turnips: Int, holyTurnipMass: Double }
/*:
Communes can join together to form larger communes. The combining procedure works as follows:
in accordance with the egalitarian ideals, all turnips will be amassed together and shared amongst all.
There can only be one Holy Turnip in a commune, the largest turnip will be given the honour.

This combining operation can be represented as a Monoid : )
*/
extension Commune: Monoid {
  static var mempty: Commune {
    return Commune(people: [], turnips: 0, holyTurnipMass: 0)
  }

  static func combine(a: Commune, _ b: Commune) -> Commune {
    return Commune(people: a.people + b.people,
                   turnips: a.turnips + b.turnips,
                   holyTurnipMass: max(a.holyTurnipMass, b.holyTurnipMass))
  }
}

let communes = [
  Commune(people: ["Fred", "Bob"], turnips: 2, holyTurnipMass: 0.5),
  Commune(people: ["Jane", "Bret", "Claire"], turnips: 5, holyTurnipMass: 1.25),
  Commune(people: ["Albert", "Jo", "Burt"], turnips: 0, holyTurnipMass: 0),
  Commune(people: ["Debs", "Eric"], turnips: 3, holyTurnipMass: 2.75),
]

Commune.mconcat(communes)

