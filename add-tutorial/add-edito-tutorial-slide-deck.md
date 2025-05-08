---
marp: true
paginate: true
title: Contributing an R Tutorial to EDITO Datalab
description: From R Markdown to Pull Request in 20 minutes
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

## Contributing to EDITO Datalab

Learn how to contribute an R tutorial in **just 20 minutes**.

Presented by **Samuel Fooks**  
_Flanders Marine Institute (VLIZ)_

---

# 🎯 What You'll Learn

By the end of this session, you’ll know how to:

✅ Create an R tutorial with `.Rmd`  
✅ Share it publicly via **GitHub**  
✅ Launch it on **EDITO Datalab**  
✅ Become a contributor to the EDITO tutorials  
✅ Register it using `tutorials.json`  
✅ Submit a **merge request**

---

# Get an Account on EDITO

<div class="scrollable">

<span style="font-size: 1.5em; font-weight: bold; color: var(--accent-color);">🌐 Become a Beta Tester:</span>
<a href="https://edito-infra.eu/european-digital-twin-ocean-beta-testing-sign-up-form/" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Sign up here</a>

<br><br>

<span style="font-size: 1.5em; font-weight: bold; color: var(--accent-color);">📧 Receive an Email:</span>
You will receive an email from the developer team with further instructions.

<br><br>

<span style="font-size: 1.5em; font-weight: bold; color: var(--accent-color);">🔑 Sign up to Mercator Ocean GitLab:</span>
<a href="https://gitlab.mercator-ocean.fr/users/sign_up" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Create your account</a>

<br><br>

<span style="font-size: 1.5em; font-weight: bold; color: var(--accent-color);">🔗 Access Repositories:</span>
Once your account is created, you will be added as a developer to the following repositories:
<ul>
  <li><a href="https://gitlab.mercator-ocean.fr/pub/edito-infra/service-playground" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Service Playground Repository</a></li>
  <li><a href="https://gitlab.mercator-ocean.fr/pub/edito-infra/process-playground" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Process Playground Repository</a></li>
  <li><a href="https://gitlab.mercator-ocean.fr/pub/edito-infra/edito-tutorials-content" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Tutorial Content Repository</a></li>
</ul>

</div>

---

# 🧱 Make a tutorial in R Markdown

✔️ Open **RStudio**
➡️ Create a new `.Rmd` file:
  - Go to `File → New File → R Markdown...`
  - Choose a title, author, and output format (e.g., HTML)
🖋️ Add content to your `.Rmd` file:
  - Write text using Markdown syntax
  - Insert code chunks with R code using ```` ```{r}`````
  - Add visualizations, tables, or outputs

---
# 🧱 Example Tutorial Accessing EDITO STAC

## demo_stac_query.Rmd [Rmd]()
<video src="../videos/makeRmd.mp4" controls width="800" allowfullscreen></video>

---

# 🔄 Knit Rmd
 
<video src="../videos/testRmd.mp4" controls width="800" allowfullscreen></video>

---


# 📂 Recommended Folder Structure

Organize your files like this:

```
sst-r-tutorial/
├── sst-r-tutorial.Rmd
├── data/
└── README.md
```

---

# 🌐 Create a GitHub Repository

- Go to [github.com](https://github.com)
- Click **New repository**
- Set it to **Public**
- Creating Your First GitHub Repository and Pushing Code [Youtube](https://youtu.be/f26KI43FK58)

---

# 💻 Push Your Local Code

<div class="scrollable">

```bash
# Initialize Git in your local directory (if not already initialized)
git init

# Create a .gitignore file to exclude the data/ folder
echo "data/" >> .gitignore

# Add all files to the staging area
git add .
git config user.name username
git config user.email usermail@mail.com

# Commit the changes
git commit -m "Initial commit"

# Add the remote origin
git remote add origin https://github.com/username/repo-name.git

# Push the changes to GitHub
git branch -M main
git push -u origin main

```

Replace `username` and `repo-name` with your GitHub username and repository name.

Creating Your First GitHub Repository and Pushing Code [Youtube](https://youtu.be/f26KI43FK58)

</div>

---

# 🔗 Test in EDITO

- Visit **https://datalab.dive.edito.eu/**
- Choose a service from 'Service Catalog' for R (ex. R Studio)
- Launch the Service (configure it, most important put your GitHub repo in)
- Save the Configuration
- Test launch

---

Configuring EDITO service, add GitHub, Launch

<div class="scrollable">
  <video src="../videos/configuretutorialservice.mp4" controls width="800"></video>

  <video src="../videos/copypassword.mp4" controls width="800"></video>
</div>

---

# Test My Tutorial Service

- <span style="color: var(--accent-color);">🚀</span> **Run Everything**
- <span style="color: var(--accent-color);">✅</span> **Check Output**
- <span style="color: var(--accent-color);">⚙️</span> **Choose Configuration Options**:
  - <span style="color: var(--accent-color);">🔗</span> **Configuration Link**: Allows users to configure how the service launches
  - <span style="color: var(--accent-color);">🚀</span> **Autolaunch Link**: Launches the configuration you save

---

# Link to Service Configuration or Auto Launch Link

<span style="font-size: 1.5em; font-weight: bold; color: var(--accent-color);">Configuration Link:</span>
<a href="https://datalab.dive.edito.eu/launcher/ide/rstudio?name=myeditotutorialtest&version=2.3.1&s3=region-bb0d481d&resources.limits.cpu=%C2%AB1600m%C2%BB&resources.limits.memory=%C2%AB5Gi%C2%BB&git.name=%C2%AB%C2%BB&git.email=%C2%AB%C2%BB&git.repository=%C2%ABhttps%3A%2F%2Fgithub.com%2Fsamuelfooks%2Fcontributing-edito%C2%BB" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Configure the tutorial</a>

<br>

<span style="font-size: 1.5em; font-weight: bold; color: var(--accent-color);">Auto Launch Link:</span>
<a href="https://datalab.dive.edito.eu/launcher/ide/rstudio?name=myeditotutorialtest&version=2.3.1&s3=region-bb0d481d&resources.limits.cpu=«1600m»&resources.limits.memory=«5Gi»&git.name=«»&git.email=«»&git.repository=«https%3A%2F%2Fgithub.com%2Fsamuelfooks%2Fcontributing-edito»&autoLaunch=true" style="font-size: 1.2em; text-decoration: none; color: var(--text-color);">Click here to auto-launch the tutorial </a>

---

# 🛠️ Step 5 – Clone the Tutorials Repository

<div class="scrollable">

🌐 **Go to GitLab**:  
  [https://gitlab.mercator-ocean.fr/pub/edito-infra/edito-tutorials-content](https://gitlab.mercator-ocean.fr/pub/edito-infra/edito-tutorials-content)

<br>

📂 **Clone the Repo**:
  ```bash
  git clone https://gitlab.mercator-ocean.fr/pub/edito-infra/edito-tutorials-content.git
  ```
</div>

---

<video src="../videos/clonetutorialscontent.mp4" controls width="800"></video>

---

# 🛠️ Make a new branch, Add Your Tutorial to `tutorials.json`

<div class="scrollable">
  <span style="color: var(--accent-color); font-size: 1.5em;">🌿</span> **Create a New Branch**:

  ```bash
  git checkout -b my-new-tutorial-branch
  ```

  <span style="color: var(--accent-color); font-size: 1.5em;">📤</span> **Push the New Branch**:

  ```bash
  git push origin my-new-tutorial-branch
  ```

  <br>
  <video src="../videos/makenewbranch.mp4" controls width="800"></video>
  <br>

  <span style="color: var(--accent-color); font-size: 1.5em;">📄</span> **Edit `tutorials.json`**:

  <pre style="font-size: 1.2em; background-color: #f9f9f9; padding: 10px; border-radius: 5px;">
  {
    "title": "Exploring Ocean Data with EDITO STAC API",
    "description": "Learn how to query the EDITO STAC API and process Parquet files in R for ocean data analysis.",
    "authors": ["Jane Doe", "Marine Data Institute"],
    "types": ["Tutorial"],
    "tags": ["ocean", "data analysis", "R"],
    "category": "Training Courses",
    "imageUrl": "https://www.edito.eu/wp-content/uploads/2023/09/favicon.png",
    "articleUrl": "https://github.com/marine-data-institute/ocean-tutorial",
    "deploymentUrl": "https://datalab.dive.edito.eu/launcher/ide/rstudio?name=Exploring%20Ocean%20Data%20with%20EDITO%20STAC%20API&shared=false&autoLaunch=true&git.repository=https%3A%2F%2Fgithub.com%2Fmarine-data-institute%2Focean-tutorial&init.personalInit=https%3A%2F%2Fraw.githubusercontent.com%2Fmarine-data-institute%2FR_init_EDITO%2Fmain%2Ftools_init.sh&resources.limits.cpu=4000m&resources.requests.cpu=2000m&resources.limits.memory=7Gi&resources.requests.memory=3Gi"
  }
  </pre>

  <video src="../videos/addtutorialjson.mp4" controls width="800"></video>
</div>

---

# 🔁 Create a Merge Request

- [ ] Push your branch to your fork
- [ ] Go to GitLab → **New Merge Request**
- [ ] Create a Merge Requests against branch main
- ping @pub/edito-infra/codeowners to request code owners to review your proposal.

---

# ✅ Final Review Checklist

✔️ Tutorial `.Rmd` created and runs  
➡️ GitHub repo is public and clean  
🔗 Launch link tested  
✅ `tutorials.json` updated  
✔️ Merge Request submitted

---

# 🙌 Done!

Once your Merge Request is approved
🎉 You’ve contributed to EDITO Datalab!  
Your tutorial is now one click away from reproducible research!  

💬 Issues? Email [edito-infra-dev@mercator-ocean.eu](mailto:edito-infra-dev@mercator-ocean.eu)  
🔗 [Contribution Docs](https://pub.pages.mercator-ocean.fr/edito-infra/edito-tutorials-content/#/Contribution/tutorials)