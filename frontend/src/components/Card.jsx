import React from 'react'
import style from '../styles/card.module.css'

export const Card = () => {
  return (
    <>
        <div className={style.card}>
            <div className={style.cardBoody}>
                <p>Speaker</p>
                <h2>Alexander Goussas</h2>

                <p>Theme</p>
                <h2>API's jeje</h2>
            </div>
        </div>
    </>
  )
}
