---
marp: true
paginate: true
theme: default
title: Accessing EDITO Data with the API
---

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

**STAC** = SpatioTemporal Asset Catalog

A community standard for:
- Describing Earth-observation data
- Providing metadata for geospatial assets

Used across satellites, models, and in-situ data.

📚 Learn more: [stacspec.org](https://stacspec.org)

---

# 🧱 STAC Structure

🔹 **Catalogs** – High-level groupings (e.g., "All CMEMS data")  
🔹 **Collections** – Thematic datasets (e.g., temperature, sea level)  
🔹 **Items** – Individual assets with time+space (e.g., file for 2024-01-01)  
🔹 **Assets** – Actual data files: GeoTIFF, Zarr, Parquet...

Each has consistent metadata (bbox, datetime, etc.)

---

# 📦 What is S3?

**Amazon S3** (Simple Storage Service):
- Object storage for files (Parquet, Zarr, GeoTIFF...)
- EDITO uses S3-compatible endpoints to store public datasets

🧪 Works with:
- Python: `s3fs`, `fsspec`, `rioxarray`, `zarr`
- R: `arrow`, `aws.s3`

Access via URLs: `https://...s3...`

---

# 🧬 What is ARCO Data?

**ARCO** = Advanced Research Computing Oceanography

EDITO adopts modern cloud-friendly formats:
- High performance
- Scalable access
- Efficient for machine learning, large analytics

Let's explore each format!

---

# 🧊 Zarr Format

Zarr is used for chunked N-dimensional arrays (like NetCDF but cloud-native)

✅ Ideal for model outputs, time series, climate reanalyses  
✅ Works well with `xarray`, `kerchunk`, `zarr-python`

🔗 [zarr.readthedocs.io](https://zarr.readthedocs.io)

```python
import zarr
import xarray as xr

xr.open_zarr("https://s3...zarr/", consolidated=True)
```

---

# 🗺️ COG: Cloud Optimized GeoTIFF

COG = regular GeoTIFF + internal tiling and indexing

✅ Works via HTTP range requests  
✅ Great for satellite images, raster maps

🔗 Tools: `rioxarray`, `rasterio`, `QGIS`

```python
import rioxarray
url = "https://...cog.tif"
da = rioxarray.open_rasterio(url)
```

---

# 🗃️ Parquet and GeoParquet

Parquet = columnar tabular format, very efficient  
GeoParquet = Parquet + geospatial metadata

✅ Good for point observations, events, tracks, etc.  
✅ Efficient for large queries and spatial joins

🔗 [parquet.apache.org](https://parquet.apache.org)  
🔗 [geoparquet.org](https://geoparquet.org)

```python
import pyarrow.dataset as ds
import s3fs

fs = s3fs.S3FileSystem(anon=True)
dataset = ds.dataset("s3://...parquet...", filesystem=fs)
df = dataset.to_table().to_pandas()
```

---

# 🔗 EDITO API Endpoints

Base URL for STAC:
```
https://api.dive.edito.eu/data/
```

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

# 🧪 Optional: Find Items in R

```r
library(rstac)

stac_endpoint <- "https://api.dive.edito.eu/data/"
collections <- stac(stac_endpoint) %>%
  rstac::collections() %>%
  get_request()

length(collections$collections)  # how many
```

👉 R packages like `arrow`, `sf`, `terra` also help with asset processing.

---

# 📁 Access Parquet/GeoParquet via Arrow (Python)

```python
import pyarrow.dataset as ds
import s3fs

fs = s3fs.S3FileSystem(anon=True)
dataset = ds.dataset("s3://...your-parquet-folder...",
                     filesystem=fs, format="parquet")

df = dataset.to_table().to_pandas()
print(df.head())
```

---

# 📌 Recap: What You Can Now Do

✅ Understand the EDITO API and data stack  
✅ Find and filter collections/items  
✅ Read Parquet or Zarr data with Python or R  
✅ Build workflows for marine data analysis

🧭 Go explore: [my-ocean.dive.edito.eu](https://my-ocean.dive.edito.eu)

💬 Questions?  
📧 Reach us at: edito-infra-dev@mercator-ocean.eu  
🔗 Docs: [docs.edito.eu](https://docs.edito.eu)  
🛠️ Workshop: [datalab.dive.edito.eu](https://datalab.dive.edito.eu)

🌊 Happy exploring!