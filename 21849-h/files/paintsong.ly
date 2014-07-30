\version "2.10.25" 
\include "english.ly"


melody = \relative c''
  {
  \tempo 4=120  
  \phrasingSlurUp
  \slurDown
  \dynamicUp
  \once \override Score.MetronomeMark #'transparent = ##t
  \clef treble 
  \key ef \major 
  \time 4/4
  r2 g4\(\p f8 ef | g4( ef) g4. f8 | f4^> ef\) 
  c'^\( c8 c | bf4( ^\markup{ \italic cres.} ef,) bf'4. af8 | g2^^\) 
  c4\( c8\< c | bf4 ef,\! bf'4. af8 | af4 g\)
  f\(\p c8 c | ef4.^^\) d8\( ^\markup{ \italic cres.}
      g4.^>\< f8\! ^\markup{ \italic rall.} | ef2\) r2 \bar "||"
  } 

text = \lyricmode
  {
  If you
  \set ignoreMelismata = ##t
  would on -- ly,
  \unset ignoreMelismata
  on -- ly love me;
  If you
  \set ignoreMelismata = ##t
  would mere -- ly,
  \unset ignoreMelismata
  mere -- ly say,
  Wait but a lit -- tle, lit -- tle for me,
  I will be yours, be yours some day!
  } 

upper = \relative c'
  {
  \clef treble 
  \key ef \major 
  \time 4/4
  r2 <bf g'>4( <af f'>8 <g ef'>) | <b f' g>4 <c ef> <bf g'>4. <bf f'>8 |
      <bf d f>4 <bf ef>4
   <c ef c'>2 | <bf ef bf'>4\( <g ef'>\) << {<bf d>2} \\ {bf'4. af8} >> |
      <d, f g>2^^
  << {ef2 | f4} \\ {c'4 c8 c | bf4} >> ef,4 <bf d bf'>4. <d af'>8 |
      <bf d af'>4^> <bf ef g>
  <c f>\( c8 c | <bf ef>4.\) <bf d>8\( << {d2} \\ {g4. f8}>> |
      <bf, ef>2\) r2 \bar "||"
  }

lower = \relative c
 {
  \clef bass 
  \key ef \major 
  \time 4/4 
  r1 | <g g'>4 <c g'> r8 bf( c d) | af'4-> g 
  <af, ef' af>2 | <g ef' g>4 c <bf f'>2 | <b g'>2
  << {c2 | d4 ef} \\ {g4 af\< | af g\!} >> bf,8\( c d f\) |
      f4^> ef <af, f'>2 |
      << {bf2 bf2} \\ {g'4. f8 bf4^\markup{ \italic {colla voce}} af} >> |
      <ef g>2 r2 \bar "||"
  }

\score
  {
    <<
    \new Voice = "mel"
      { \autoBeamOff 
      \melody } 
    \new Lyrics \lyricsto mel \text 
    \new PianoStaff
      <<
      \new Staff = "upper" \upper 
      \new Staff = "lower" \lower
      >>
    >>

  \layout
    {
    \context { \RemoveEmptyStaffContext }
    } 
  \midi
    { 
    \context
      { 
      \Score 
      tempoWholesPerMinute = #(ly:make-moment 120 4) 
      } 
    } 
  } 



