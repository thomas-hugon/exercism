
space_age("Earth", AgeSec, Years) :- Years is AgeSec / 31557600.0, !.
space_age(Planet, AgeSec, Years) :-
    space_age("Earth", AgeSec, EarthYears),
    earth_years(Planet, Ratio),
    Years is EarthYears / Ratio.

earth_years("Mercury", 0.2408467).
earth_years("Venus", 0.61519726).
earth_years("Mars", 1.8808158).
earth_years("Jupiter", 11.862615).
earth_years("Saturn", 29.447498).
earth_years("Uranus", 84.016846).
earth_years("Neptune", 164.79132).
