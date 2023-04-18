import React, { useState } from "react";
import kokoalogo from "../assets/logo-kokoa-50dpi.png";
import styles from "../styles/header.module.css";
import { Link } from "react-router-dom";
import { LinkContainer } from "react-router-bootstrap";

export const Header = ({ onButtonClick }) => {
  function handleClick() {
    onButtonClick();
  }

  return (
    <nav className={styles.header}>
      <div className={styles.container}>
        <div className={styles.titleNav}>
          <Link to="/">
            <img src={kokoalogo} alt="KOKOA logo" />
          </Link>
          <Link to="/">Lightning Talks</Link>
        </div>
        <LinkContainer to="/login">
          <button className={styles.login} onClick={handleClick}>
            <Link to="/login">Log In</Link>
          </button>
        </LinkContainer>
      </div>
    </nav>
  );
};
