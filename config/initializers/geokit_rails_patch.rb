module Geokit::ActsAsMappable
  module ClassMethods
    # Overwrite Geokit `within`
    def within(distance, options = {})
      options[:within] = distance

      # Have to copy the options because `build_distance_sql` will delete them.
      conditions = distance_conditions(options.dup)
      sql = build_distance_sql(options)
      self.select(
        "#{sql} AS #{self.distance_column_name}, #{table_name}.*"
      ).where(conditions)
    end

    # Overwrite Geokit `by_distance`
    def by_distance(options = {})
      sql = build_distance_sql(options)
      self.select("#{sql} AS #{self.distance_column_name}, #{table_name}.*"
      ).order("#{self.distance_column_name} ASC")
    end

    private

    # Copied from geokit-rails/lib/geokit-rails/acts_as_mappable.rb
    # Extract distance_sql building to method `build_distance_sql`.
    def build_distance_sql(options)
      origin  = extract_origin_from_options(options)
      units   = extract_units_from_options(options)
      formula = extract_formula_from_options(options)

      distance_sql(origin, units, formula)
    end
  end
end
