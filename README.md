# Connected App Case Study

## Connected Country Feature Specs

### Story: Customer should be able to view the country list and detailed informations

### Narrative #1

```
As a Connected customer 
I want the app to display information about countries around the world.
```

#### Scenarios (Acceptance criteria)

```
Given the customer has connectivity
 When the customer requests to see the countries
 Then the app should display the countries from remote,
 and it, let the user to show the detail,
  of the selected country with more detailed informations 
```

## Use Cases

### Load Countries From Remote Use Case

#### Data:
- URL

#### Primary course (happy path):
1. Execute "Load Countries" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates country from valid data.
5. System delivers country image.

#### Invalid data – error course (sad path):
1. System delivers invalid data error.

#### No connectivity – error course (sad path):
1. System delivers connectivity error.

---

## Model Specs

### Country 

| Property          | Type                    |
|-------------------|-------------------------|
| `name`            | `CountryName`           |
| `independent`     | `Bool`   (optional)     |
| `unMember`        | `Bool`   (optional)     |
| `capital`         | `Array<String>`         |
| `continents`      | `Array<String>`         |
| `flags`           | `CountryFlag`           |
| `region`          | `String` (optional)     |
| `subregion`       | `String` (optional)     |
| `population`      | `Int64`  (optional)     |

### Country Name

| Property          | Type                    |
|-------------------|-------------------------|
| `common`          | `String`                |
| `official`        | `String` (optional)     |

### Country Flag

| Property          | Type                    |
|-------------------|-------------------------|
| `png`             | `String` (optional)     |
| `svg`             | `String` (optional)     |
| `alt`             | `String` (optional)     |

### Payload contract

```
GET restcountries.com/v3.1/name/usa

200 RESPONSE

{
    "name": {
            "common": "United States",
            "official": "United States of America"
        },
        "independent": true,
        "unMember": true,
        "currencies": {
            "USD": {
                "name": "United States dollar",
                "symbol": "$"
            }
        },
        "capital": [
            "Washington, D.C."
        ],
        "region": "Americas",
        "subregion": "North America",
        "languages": {
            "eng": "English"
        },
        "borders": [
            "CAN",
            "MEX"
        ],
        "area": 9372610.0,
        "flag": "🇺🇸",
        "maps": {
            "googleMaps": "https://goo.gl/maps/e8M246zY4BSjkjAv6",
            "openStreetMaps": "https://www.openstreetmap.org/relation/148838#map=2/20.6/-85.8"
        },
        "population": 329484123,
        "timezones": [
            "UTC-12:00",
            "UTC-11:00",
            "UTC-10:00"
        ],
        "continents": [
            "North America"
        ],
        "flags": {
            "png": "https://flagcdn.com/w320/us.png",
            "svg": "https://flagcdn.com/us.svg",
            "alt": "The flag of the United States of America is composed of thirteen equal horizontal bands of red alternating with white. A blue rectangle, bearing fifty small five-pointed white stars arranged in nine rows where rows of six stars alternate with rows of five stars, is superimposed in the canton."
        },
        "startOfWeek": "sunday",
        "capitalInfo": {
            "latlng": [
                38.89,
                -77.05
            ]
        },
        "postalCode": {
            "format": "#####-####",
            "regex": "^\\d{5}(-\\d{4})?$"
        },
        ...
}
```

---

## App Architecture

### TBD

---

## Get in Touch

[![X](https://img.shields.io/badge/X-Nicolò_Curioni-darkgrey.svg)](https://bit.ly/3KHu7Kk)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Nicolò_Curioni-blue.svg)](https://bit.ly/42AsPXY) 
[![YouTube](https://img.shields.io/badge/YouTube-Nicolò_Curioni-red.svg)](https://bit.ly/3P0ASa8) 
[![TikTok](https://img.shields.io/badge/TikTok-Nicolò_Curioni-darkgrey.svg)](https://bit.ly/45LlPZY)
[![Instagram](https://img.shields.io/badge/Instagram-Nicolò_Curioni-purple.svg)](https://bit.ly/3Uk9ln8)
