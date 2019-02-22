require('pg')

class SqlRunner

def self.run(sql, values = [])
  begin
    db = PG.connect({dbname: 'ddbpf7sl3adq9f', host: 'ec2-23-21-165-188.compute-1.amazonaws.com', port: 5432, user: 'obinftxyopqusx', password: '6a9dcbe03b474e65cf880cdb411752d5adc20a7568907ecadacf7d3a3b2733ab'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", values)
  ensure
    db.close() if db != nil
  end

  # begin
  #   db = PG.connect({dbname: 'dc_sport', host: 'localhost'})
  #   db.prepare("query", sql)
  #   result = db.exec_prepared("query", values)
  # ensure
  #   db.close() if db != nil
  # end
  return result
end

end
