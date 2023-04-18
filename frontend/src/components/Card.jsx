import React from 'react'
import styles from '../styles/card.module.css'
import streaminglogo from '../assets/live-streaming.png'


export const Card = () => {
    return (
        <>
            <div className={styles.container}>
                <div className={styles.card}>
                    <img src={streaminglogo} alt='hello'></img>
                    <div className={styles.cardBody}>
                        <div className={styles.speaker}>
                            <h2>Speaker</h2>
                            <p>Alexander Goussas</p>
                        </div>
                        <div className={styles.theme}>
                            <h2>Theme</h2>
                            <p>ChatGPT y su evolución</p>
                        </div>
                    </div>
                </div>
            </div>

        </>
    )
}
