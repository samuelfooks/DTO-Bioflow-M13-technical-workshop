---
marp: true
theme: rose-pine-dawn
paginate: true
title: Contributing an R Tutorial to EDITO Datalab
description: From R Markdown to Pull Request in 20 minutes
---


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
✅ Register it using `tutorials.json`  
✅ Submit a **merge request**

🕐 Estimated time: **~20 minutes**


---

# 🧱 Make Your R Markdown

✔️ Open **RStudio**
➡️ Create a new `.Rmd` file:
  - Go to `File → New File → R Markdown...`
  - Choose a title, author, and output format (e.g., HTML)
🖋️ Add content to your `.Rmd` file:
  - Write text using Markdown syntax
  - Insert code chunks with R code using ```` ```{r}`````
  - Add visualizations, tables, or outputs
🔄 Test your `.Rmd` file:
  - Click the **Knit** button to render the file into HTML or Notebook format
  - Fix any errors in your code or formatting

📹 *[Show screencast or screenshots of creating and knitting an `.Rmd` file]*

---


# 📂 Recommended Folder Structure

Organize your files like this:

```
my-tutorial/
├── my_tutorial.Rmd
├── data/
├── README.md
└── images/
```

---

# 🌐 Create a GitHub Repository

-  Go to [github.com](https://github.com)
- Click **New repository**
- Choose a name like `sst-r-tutorial`
- Set it to **Public**

---

# 💻 Push Your Local Code

```bash
# Initialize Git in your local directory (if not already initialized)
git init

# Add all files to the staging area
git add .

# Commit the changes
git commit -m "Initial commit"

# Add the remote origin
git remote add origin https://github.com/username/repo-name.git

# Push the changes to GitHub
git branch -M main
git push -u origin main
```

Replace `username` and `repo-name` with your GitHub username and repository name.

📹 *[Demo pushing to GitHub]*

---

# 🔗 Test in EDITO

- Visit **https://datalab.dive.edito.eu/**
- Choose a service from 'Service Catalog' for R (ex. R Studio)
- Launch the Service
➡️ Pas
📂 Choose the default file to open
🔗 Copy the launch link

**Example link**:  
`https://launcher.edito-datalab.eu/...`

📹 *[Show launch page]*

---

# 🛠️ Step 5 – Fork & Edit `tutorials.json`

- [ ] Go to GitLab:  
  `gitlab.mercator-ocean.fr/.../edito-tutorials-content`
- [ ] Fork the repo
- [ ] Edit `tutorials.json`
- [ ] Add your tutorial:

```json
{
  "title": "My R Tutorial",
  "description": "Visualize SST data using R",
  "authors": ["Your Name"],
  "launch_url": "https://launcher.edito-datalab.eu/...",
  "tags": ["R", "Ocean"]
}
```

✅ Validate the JSON!  

📹 *[Demo editing JSON]*

---

# 🧪 Step 6 – Test Your Tutorial

Before submitting:  

✔️ Open the **launch link**
➡️ Confirm the file runs correctly
🔧 Fix any broken links, libraries, or chunks

📹 *[Show working tutorial in EDITO]*

---

# 🔁 Step 7 – Create a Merge Request

- [ ] Push your branch to your fork
- [ ] Go to GitLab → **New Merge Request**
- [ ] Set:
  - **Source** = your branch
  - **Target** = `main` of upstream
- [ ] Add a title + description

📹 *[Show GitLab merge request page]*

---

# ✅ Final Review Checklist

✔️ Tutorial `.Rmd` created and runs  
➡️ GitHub repo is public and clean  
🔗 Launch link tested  
✅ `tutorials.json` updated  
✔️ Merge Request submitted  

📹 *[Quick walk-through recap]*

---

# 🙌 Done!

🎉 You’ve contributed to EDITO Datalab!  
Your tutorial is now one click away from reproducible research!  

💬 Questions?  
🔗 Contribution Docs