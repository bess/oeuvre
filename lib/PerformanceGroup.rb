require 'sparql/client'
require 'sparql'
# docs at https://github.com/ruby-rdf/sparql-client

# concept query
# q = "select distinct ?Concept where {[] a ?Concept} LIMIT 100 OFFSET 500"

class PerformanceGroup
  attr_accessor :dbpedia_uri # a uri to a dbpedia endpoint for a performance group
  attr_reader :sparql_endpoint

  def initialize
    @sparql_endpoint = SPARQL::Client.new("http://dbpedia.org/sparql")
  end

  def get_albums
    #     SELECT DISTINCT ?album_title
    # WHERE {
    #        dbpedia:The_Beatles foaf:made ?album .
    #        ?album dc:title ?album_title .
    #        ?release event:factor ?album ;
    #                 mo:record ?record .
    #        ?record mo:track ?track ;
    #                dc:title ?track_title .
    #        ?track mo:track_number ?trackNum .
    #        FILTER (?trackNum > 1)
    #       }\\
  end

  def execute_query
    # SELECT * WHERE { ?s ?p ?o } OFFSET 100 LIMIT 10

    # subject = RDF::URI.new("http://dbpedia.org/page/The_Beatles")

    q = "select distinct ?Concept where {[] a ?Concept} LIMIT 100 OFFSET 500"
    solutions = @sparql_endpoint.query(q)
    puts solutions.inspect
    solutions.each_solution do |s|
      uri = s.first[1]
      q2 = "select * where {?s ?p <#{uri.to_uri}>}"
      solutions2 = @sparql_endpoint.query(q2)
      solutions2.each_solution do |s|
        puts s.inspect
      end
    end

  end
end
