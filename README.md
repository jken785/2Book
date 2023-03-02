# flutter_test_task

A new Flutter project.

## Task

- Implement a page that fetches all businesses by selected location.
- Define available category types and build a filter dropdown from API response
- Add ability to filter business collection based on category type

## API example

`https://www.massagebook.com/nxt/pu-api/v1/businesses?limit=100&offset=0&includes=service_categories&filters=latitude=={latitudeValue},longitude=={longitudeValue}`

### Businesses

```json
{
  "meta": {
    "total": 84,
    "limit": 1,
    "offset": 0
  },
  "included": [],
  "data": [
    {
      "id": "49561",
      "type": "pu-businesses",
      "attributes": {
        "business_name": "Test Businesses",
        "description": "test",
        "tagline": "test",
        "friendly_url": "testbusiness",
        "website_url": "http://www.test.com",
        "twitter": "",
        "facebook": "426397114089072",
        "instagram": "",
        "establishment_license": "1234321",
        "show_address": true,
        "country": "US",
        "address_1": "115 King St. ",
        "address_2": null,
        "city": "Charleston",
        "state": "SC",
        "zip": "29403",
        "timezone": "America/Chicago",
        "distance": 3.18518,
        "yelp_id": "bistro-daniel-island",
        "google_place_id": null,
        "pixel_id": null,
        "should_display_google_reviews": false,
        "should_show_contact_form": true,
        "is_reviews_feature_enabled": true,
        "offers_mobile_services": false,
        "offers_gift_certificates": true,
        "offers_deals": false,
        "is_featured": false,
        "coordinates": {
          "latitude": 32.7767224,
          "longitude": -79.9327804
        },
        "working_hours": {
          "monday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          },
          "tuesday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          },
          "wednesday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          },
          "thursday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          },
          "friday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          },
          "saturday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          },
          "sunday": {
            "by_appointment_only": false,
            "open": null,
            "close": null
          }
        },
        "website_settings": {
          "theme_name": "colortheme--default",
          "background_photo": "https://images.massagebook.com/mbhome/default-03-1200-min.jpg",
          "background_transparency": 0.97,
          "theme_hex": "#1E1B21"
        },
        "booking_rules": {
          "is_online_booking_allowed_for_existing_clients": false,
          "is_online_booking_allowed_for_new_clients": false,
          "is_online_booking_allowed_for_new_clients_from_mb": false,
          "is_booking_request_enabled": false,
          "how_far_in_advance_must_appointments_be_booked": 0,
          "appointments_interval": 30,
          "how_far_in_future_appointments_can_be_booked": 90
        },
        "payment_rules": {
          "accepts_gift_certificates": false,
          "accepts_mb_gift_certificates": false,
          "is_tip_allowed": true,
          "new_clients": {
            "require_prepayment": false,
            "is_partial_prepayment_enabled": false,
            "is_full_prepayment_allowed": true,
            "partial_prepayment_amount": null,
            "partial_prepayment_percent": null
          },
          "existing_clients": {
            "require_prepayment": false,
            "is_partial_prepayment_enabled": false,
            "is_full_prepayment_allowed": true,
            "partial_prepayment_amount": null,
            "partial_prepayment_percent": null
          }
        },
        "rating": {
          "rating": 0,
          "ambiance": 0,
          "professionalism": 0,
          "reviews_count": 0
        },
        "sorting_scores": {
          "recent_login": 1,
          "rating": 0
        },
        "phone": null,
        "payment_processor": {
          "type": "square",
          "location_id": "46C2JGVKB3D7K"
        }
      },
      "relationships": {
        "baseline_service": {
          "data": {
            "id": "2098",
            "type": "pu-service-durations"
          }
        },
        "primary_photo": {
          "data": {
            "id": "46132",
            "type": "pu-photos"
          }
        },
        "photos": {
          "data": [
            {
              "id": "46132",
              "type": "pu-photos"
            }
          ]
        },
        "popular_services": {
          "data": [
            {
              "id": "2096",
              "type": "pu-service-durations"
            },
            {
              "id": "2097",
              "type": "pu-service-durations"
            },
            {
              "id": "2098",
              "type": "pu-service-durations"
            }
          ]
        },
        "service_categories": {
          "data": [
            {
              "id": "7",
              "type": "service-categories"
            },
            {
              "id": "19",
              "type": "service-categories"
            },
            {
              "id": "1281",
              "type": "service-categories"
            }
          ]
        },
        "best_deal_service": {
          "data": null
        }
      },
      "links": {
        "self": {
          "href": "/nxt/pu-api/v1/businesses/49561"
        }
      }
    }
  ]
}
```

### Service categories (include)

```json
{
  "id": "5",
  "type": "service-categories",
  "attributes": {
    "name": "Craniosacral Therapy",
    "category_type": "Bodywork",
    "description": "Craniosacral therapy uses gentle touch manipulation of your head, neck, and the bottom of your spine. Your neck, back, and hips will feel looser and freer.",
    "is_approved": true,
    "slug": "craniosacral-therapy"
  },
  "links": {
    "self": {
      "href": "/nxt/pu-api/v1/service-categories/5"
    }
  }
}
```


