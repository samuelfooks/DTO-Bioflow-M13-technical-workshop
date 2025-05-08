---
marp: true
paginate: true
title: EDITO Data Lake
description: How to access the data in the EDITO Data Lake
---

<style>
/******************
Refined Digital Twin Ocean Theme with Responsive Scaling
******************/
:root {
  --background-gradient: linear-gradient(to bottom, #f0faff, #e6f7ff); /* Light ocean gradient */
  --text-color: #00264d; /* Darker blue text */
  --accent-color: #005b99; /* Deep blue accents */
  --border-color: #99ccff; /* Subtle blue border */
  --font-family: 'Lato', sans-serif; /* Modern sans-serif font */
  --icon-size: 5vw; /* Responsive icon size */
  --text-size: 3vw; /* Responsive text size */
}

section {
  background: var(--background-gradient);
  color: var(--text-color);
  font-family: var(--font-family);
  padding: 5%; /* Increased padding for larger elements */
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  position: relative;
}

section::before {
  content: '';
  position: absolute;
  top: 50%;
  right: 5%;
  transform: translateY(-50%);
  background: url('./images/editoglobe.png') no-repeat center;
  background-size: 300px;
  opacity: 0.1; /* Subtle watermark */
  width: 300px;
  height: 300px;
  z-index: 0;
}

section::after {
  content: '';
  position: absolute;
  bottom: 10px;
  right: 10px;
  background: url('./images/editofish.png'), url('./images/euflag.png');
  background-repeat: no-repeat;
  background-size: 50px, 50px;
  background-position: right bottom, right 60px bottom;
  width: 100px;
  height: 100px;
  z-index: 1;
}

h1, h2, h3 {
  color: var(--accent-color);
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
  z-index: 2;
  position: relative;
  font-size: var(--text-size); /* Responsive text size */
}

/******************
Reusable Scrollable Style
******************/
.scrollable {
  height: 400px; /* Adjust height as needed */
  overflow-y: auto;
  border: 1px solid var(--border-color);
  padding: 10px;
  background-color: rgba(255, 255, 255, 0.95); /* Slightly opaque white */
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  z-index: 2;
  position: relative;
}

/******************
Responsive Icon and Text Styling
******************/
.icon {
  font-size: var(--icon-size); /* Responsive icon size */
  display: inline-block;
  vertical-align: middle;
}

.link-text {
  font-size: var(--text-size); /* Responsive text size */
  font-weight: bold;
  color: var(--accent-color);
}
</style>

# 👋 Welcome!

## Using the data in the EDITO Data Lake

Learn the fundamentals on accessing data from the EDITO Data Lake

Presented by **Samuel Fooks**  
_Flanders Marine Institute (VLIZ)_

---