function onCreatePost() --everything written by Rhy
--fixed by WarlyFarly_Unity

    makeLuaText('score', "Score: ", 0, 15, 375) --score
    setTextSize('score', 24)
    setTextFont('score', 'PhantomMuff.ttf')
    setTextColor('score', 'FFFF00')
    addLuaText('score', "Score: ", 0, 150, 150)
    setObjectCamera('score', 'other')

    makeLuaText('misses', "Misses: ", 0, 15, 400) --misses
    setTextSize('misses', 24)
    setTextFont('misses', 'PhantomMuff.ttf')
    setTextColor('misses', '296D98')
    addLuaText('misses', "Misses: ", 0, 150, 140)
    setObjectCamera('misses', 'other')

    makeLuaText('ratingName', "Rating: ", 0, 15, 425) --rating
    setTextSize('ratingName', 24)
    setTextFont('ratingName', 'PhantomMuff.ttf')
    setTextColor('ratingName', 'CEA200')
    addLuaText('ratingName', "Rating: ", 0, 150, 150)
    setObjectCamera('ratingName', 'other')

    makeLuaText('difficultyName', "Difficulty: ", 0, 15, 455) --ratingFC
    setTextSize('difficultyName', 24)
    setTextFont('difficultyName', 'PhantomMuff.ttf')
    setTextColor('difficultyName', 'B65400')
    addLuaText('difficultyName', "Difficulty: ", 0, 150, 150)
    setObjectCamera('difficultyName', 'other')

end

function onUpdatePost()

    setTextString('score', 'Score: '.. getPropertyFromClass(score))

    setTextString('misses', 'Misses: '.. getPropertyFromClass(misses))

    setTextString('ratingName', 'Rating: '.. getPropertyFromClass(ratingName))

    setTextString('difficultyName', "DFFC: ".. getPropertyFromClass(difficultyName))

end