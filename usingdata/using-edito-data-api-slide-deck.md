---
marp: true
paginate: true
title: Using the EDITO Data API
description: Accessing and Querying Data from the EDITO Data Lake
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

# 🌊 Welcome!

## Hands-On with the EDITO Data API

Learn to explore, search, and use marine data from the EDITO Data Lake using the API.

👨‍🏫 Presented by Samuel Fooks (VLIZ)

---

# 🚀 Goals for Today

✅ Understand what STAC and S3 are  
✅ Discover ARCO data formats  
✅ Query the API using R or Python  
✅ Find and use public marine datasets

---

# 🌐 What is STAC?

**STAC** (SpatioTemporal Asset Catalog) is a standard for:
- Cataloging geospatial assets (raster, vector, tabular)
- Structuring metadata by collections, items, and assets

🧩 STAC Hierarchy:
- **Catalog** → **Collection** → **Item** → **Asset**

📚 Learn more: [stacspec.org](https://stacspec.org)

---

# 📦 What is S3?

**Amazon S3** (Simple Storage Service):
- Cloud storage for files (e.g. CSV, GeoTIFF, Parquet, Zarr)
- Used in EDITO to host datasets for fast remote access

🪄 Benefits:
- Serverless and scalable
- Access via URLs like `https://...s3...`
- Compatible with `arrow`, `zarr`, `rioxarray`, etc.

---

# 🧬 What is ARCO Data?

**ARCO** = Advanced Research Computing Oceanography data

🔹 Uses modern formats:
- `Zarr`: chunked, compressed N-dimensional arrays
- `GeoParquet`: tabular + geospatial columns
- `COG`: optimized GeoTIFFs

🔹 Enables faster, scalable access for analysis

Resources:  
[parquet.apache.org](https://parquet.apache.org)  
[zarr.readthedocs.io](https://zarr.readthedocs.io)  
[geoparquet.org](https://geoparquet.org)

---

# 🔗 EDITO API Endpoints

Base URL for STAC:

https://api.dive.edito.eu/data/
📖 Docs: [docs.edito.eu](https://docs.edito.eu)  
🔐 No auth needed for public data

Try browsing with a tool like [stacindex.org](https://stacindex.org)

---

# 🔍 Explore Collections (Python)

```python
import requests

url = "https://api.dive.edito.eu/data/collections"
response = requests.get(url)
data = response.json()

print("Found collections:", len(data['collections']))
for col in data['collections'][:5]:
    print(col['id'], ":", col['title'])
```

---


# 🧱 Querying the STAC API with R

✔️ Open **RStudio**  
➡️ Install required packages: `rstac`, `sf`, `terra`, `arrow`  
➡️ Use the following R script to query the API:

```r
# Define the root STAC API endpoint
stac_endpoint <- "https://api.dive.edito.eu/data/"

# Query the root STAC API to get collections
collections_query <- stac(stac_endpoint) %>%
  rstac::collections() %>%
  get_request()

# Display the number of collections
cat("Number of collections:", length(collections_query$collections), "\n")
```

---

# 🔍 Filtering Collections

```r
# Filter collections with 'occurrence' in their name or description directly
occurrence_collections <- Filter(function(collection) {
  grepl("occurrence", collection$title, ignore.case = TRUE)
}, collections_query$collections)

# Display the occurrence collections
print(occurrence_collections)
```

---

# 📂 Accessing Data Items

```r
# Query the items in the occurrence collection
if (exists("occurrence_collection")) {
  items_query <- stac(stac_endpoint) %>%
    stac_search(collections = occurrence_collection) %>%
    get_request()

  # Display the items query results
  print(items_query)
}
```

---

# 🗂️ Working with Parquet Data

```r
# Define a function to open a Parquet dataset from an S3 URL
open_my_parquet <- function(s3_url) {
  temp <- strsplit(s3_url, "//")[[1]][2]  # Remove 'https://'
  endpoint <- strsplit(temp, "/")[[1]][1]  # Extract endpoint
  data_path <- sub(paste0(endpoint, "/"), "", temp)  # Extract path

  data_lake <- S3FileSystem$create(anonymous = TRUE, 
                                   scheme = "https",
                                   endpoint_override = endpoint)

  dataset <- NULL
  tryCatch({
    dataset <- arrow::open_dataset(data_path, filesystem = data_lake, format = "parquet")
  }, error = function(e) {
    cat("Error loading dataset:", e$message, "\n")
  })

  return(dataset)
}
```

---

# 🔄 Visualizing Data

```r
# Convert the Parquet dataset to a dataframe and display it
if (!is.null(parquet_data)) {
  parquet_df <- as.data.frame(parquet_data[1:100000, ])

  # Display the first few rows of the dataframe
  print(head(parquet_df))
}
```

---

# ✅ Final Review Checklist

✔️ API endpoint accessed  
✔️ Data queried and filtered  
✔️ Parquet data processed  
✔️ Data visualized in R  

---

# 🙌 Done!

🎉 You’ve successfully accessed and queried data from the EDITO Data Lake!  

💬 Issues? Email [edito-infra-dev@mercator-ocean.eu](mailto:edito-infra-dev@mercator-ocean.eu)  
🔗 [API Documentation](https://docs.edito.eu)
