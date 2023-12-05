# Possible Classes / Objects needed
  # Farm
    # Farm has seeds
    # Run each seed thru gammet of conversions

    # seed-to-soil
    # soil-to-fertilizer
    # fertilizer-to-water
    # water-to-light
    # light-to-temperature
    # temperature-to-humidity
    # humidity-to-location

# MAPS

# seed-to-soil
  # Attribute of Farm??
  # Conversion Table??
    # An Array of Hashes
    # {
        # source: int,
        # destination: int,
        # range: int
    # }

  # Get seed number
  # Loop through each table, look for seed num between source / destination
    # Convert it if found
  # Else, soil num is SELF
  
  
  # Build Hash Map with values 0-100 as keys and values
  # 