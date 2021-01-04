# Entailment regimes used for test files. For normal usage, the RDF::Reasoner entailment is expected.
#
# Extends an RDF::Mutable to entail statements defined within the Mutable
module SHACL::Entailment
  ##
  # Execute entailment rules on self
  # @return [RDF::Mutable]
  def entail!
    old_count = 0

    # Continue as long as new statements are added
    while old_count < (count = self.count)
      #add_debug("entailment") {"old: #{old_count} count: #{count}"}
      old_count = count
      to_add = []

      RULES.each do |rule|
        rule.execute(self) do |statement|
          #add_debug("entailment(#{rule.name})") {statement.inspect}
          to_add << statement
        end
      end

      insert(*to_add)
    end
  end

  ##
  # An entailment rule
  #
  # Takes a list of antecedent patterns used to find solutions against a queryable
  # object. Yields each consequent with bindings from the solution
  class Rule
    # @!attribute [r] antecedents
    # @return [Array<RDF::Query::Pattern>]
    attr_reader :antecedents

    # @!attribute [r] consequents
    # @return [Array<RDF::Query::Pattern>]
    attr_reader :consequents

    # @!attribute [r] deletions
    # @return [Array<RDF::Query::Pattern>]
    attr_reader :deletions

    # @!attribute [r] name
    # @return [String]
    attr_reader :name

    ##
    # @example
    #   r = Rule.new("scm-spo") do
    #     antecedent :p1, RDF::RDFS.subPropertyOf, :p2
    #     antecedent :p2, RDF::RDFS.subPropertyOf, :p3
    #     consequent :p1, RDF::RDFS.subPropertyOf, :p3, "t-box"
    #   end
    #
    #   r.execute(queryable) {|statement| puts statement.inspect}
    #
    # @param [String] name
    def initialize(name, &block)
      @antecedents = []
      @consequents = []
      @name = name

      if block_given?
        case block.arity
          when 1 then block.call(self)
          else instance_eval(&block)
        end
      end
    end

    def antecedent(subject, prediate, object)
      antecedents << RDF::Query::Pattern.new(subject, prediate, object)
    end

    def consequent(subject, prediate, object)
      consequents << RDF::Query::Pattern.new(subject, prediate, object)
    end

    ##
    # Execute the rule against queryable, yielding each consequent with bindings
    #
    # @param [RDF::Queryable] queryable
    # @yield [statement]
    # @yieldparam [RDF::Statement] statement
    def execute(queryable)
      RDF::Query.new(antecedents).execute(queryable).each do |solution|
        nodes = {}
        consequents.each do |consequent|
          terms = {}
          [:subject, :predicate, :object].each do |r|
            terms[r] = case o = consequent.send(r)
            when RDF::Node            then nodes[o] ||= RDF::Node.new
            when RDF::Query::Variable then solution[o]
            else                           o
            end
          end

          yield RDF::Statement.from(terms)
        end
      end
    end
  end

  private

  RULES = [
    #Rule.new("prp-spo1") do
    #  antecedent :p1, RDF::RDFS.subPropertyOf, :p2
    #  antecedent :x, :p1, :y
    #  consequent :x, :p2, :y
    #end,
    Rule.new("cax-sco") do
      antecedent :c1, RDF::RDFS.subClassOf, :c2
      antecedent :x, RDF.type, :c1
      consequent :x, RDF.type, :c2
    end,
  ]
end
