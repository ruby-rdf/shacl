# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.w3.org/ns/shacl#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://www.w3.org/ns/shacl#>
  #   #
  #   # W3C Shapes Constraint Language (SHACL) Vocabulary
  #   #
  #   # This vocabulary defines terms used in SHACL, the W3C Shapes Constraint Language.
  #   class SHACL < RDF::StrictVocabulary
  #     # The base class of validation results, typically not instantiated directly.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :AbstractResult
  #
  #     # The class of constraint components.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ConstraintComponent
  #
  #     # The class of SHACL functions.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Function
  #
  #     # The class of constraints backed by a JavaScript function.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSConstraint
  #
  #     # Abstract base class of resources that declare an executable JavaScript.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSExecutable
  #
  #     # The class of SHACL functions that execute a JavaScript function when called.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSFunction
  #
  #     # Represents a JavaScript library, typically identified by one or more URLs of files to include.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSLibrary
  #
  #     # The class of SHACL rules expressed using JavaScript.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSRule
  #
  #     # The class of targets that are based on JavaScript functions.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSTarget
  #
  #     # The (meta) class for parameterizable targets that are based on JavaScript functions.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSTargetType
  #
  #     # A SHACL validator based on JavaScript. This can be used to declare SHACL constraint components that perform JavaScript-based validation when used.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSValidator
  #
  #     # The class of all node kinds, including sh:BlankNode, sh:IRI, sh:Literal or the combinations of these: sh:BlankNodeOrIRI, sh:BlankNodeOrLiteral, sh:IRIOrLiteral.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :NodeKind
  #
  #     # A node shape is a shape that specifies constraint that need to be met with respect to focus nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :NodeShape
  #
  #     # The class of parameter declarations, consisting of a path predicate and (possibly) information about allowed value type, cardinality and other characteristics.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Parameter
  #
  #     # Superclass of components that can take parameters, especially functions and constraint components.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Parameterizable
  #
  #     # The class of prefix declarations, consisting of pairs of a prefix with a namespace.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :PrefixDeclaration
  #
  #     # Instances of this class represent groups of property shapes that belong together.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :PropertyGroup
  #
  #     # A property shape is a shape that specifies constraints on the values of a focus node for a given property or path.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :PropertyShape
  #
  #     # A class of result annotations, which define the rules to derive the values of a given annotation property as extra values for a validation result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ResultAnnotation
  #
  #     # The class of SHACL rules. Never instantiated directly.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Rule
  #
  #     # The class of SPARQL executables that are based on an ASK query.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLAskExecutable
  #
  #     # The class of validators based on SPARQL ASK queries. The queries are evaluated for each value node and are supposed to return true if the given node conforms.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLAskValidator
  #
  #     # The class of constraints based on SPARQL SELECT queries.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLConstraint
  #
  #     # The class of SPARQL executables that are based on a CONSTRUCT query.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLConstructExecutable
  #
  #     # The class of resources that encapsulate a SPARQL query.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLExecutable
  #
  #     # A function backed by a SPARQL query - either ASK or SELECT.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLFunction
  #
  #     # The class of SHACL rules based on SPARQL CONSTRUCT queries.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLRule
  #
  #     # The class of SPARQL executables based on a SELECT query.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLSelectExecutable
  #
  #     # The class of validators based on SPARQL SELECT queries. The queries are evaluated for each focus node and are supposed to produce bindings for all focus nodes that do not conform.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLSelectValidator
  #
  #     # The class of targets that are based on SPARQL queries.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLTarget
  #
  #     # The (meta) class for parameterizable targets that are based on SPARQL queries.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLTargetType
  #
  #     # The class of SPARQL executables based on a SPARQL UPDATE.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLUpdateExecutable
  #
  #     # The class of validation result severity levels, including violation and warning levels.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Severity
  #
  #     # A shape is a collection of constraints that may be targeted for certain nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Shape
  #
  #     # The base class of targets such as those based on SPARQL queries.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Target
  #
  #     # The (meta) class for parameterizable targets. Instances of this are instantiated as values of the sh:target property.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :TargetType
  #
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :TripleRule
  #
  #     # The class of SHACL validation reports.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ValidationReport
  #
  #     # The class of validation results.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ValidationResult
  #
  #     # The class of validators, which provide instructions on how to process a constraint definition. This class serves as base class for the SPARQL-based validators and other possible implementations.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Validator
  #
  #     # The (single) value of this property must be a list of path elements, representing the elements of alternative paths.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :alternativePath
  #
  #     # RDF list of shapes to validate the value nodes against.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :and
  #
  #     # The annotation property that shall be set.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :annotationProperty
  #
  #     # The (default) values of the annotation property.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :annotationValue
  #
  #     # The name of the SPARQL variable from the SELECT clause that shall be used for the values.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :annotationVarName
  #
  #     # The SPARQL ASK query to execute.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ask
  #
  #     # The type that all value nodes must have.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :class
  #
  #     # If set to true then the shape is closed.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :closed
  #
  #     # The shapes that the focus nodes need to conform to before a rule is executed on them.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :condition
  #
  #     # True if the validation did not produce any validation results, and false otherwise.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :conforms
  #
  #     # The SPARQL CONSTRUCT query to execute.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :construct
  #
  #     # Specifies an RDF datatype that all value nodes must have.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :datatype
  #
  #     # If set to true then all nodes conform to this.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :deactivated
  #
  #     # Links a resource with its namespace prefix declarations.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :declare
  #
  #     # A default value for a property, for example for user interface tools to pre-populate input fields.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :defaultValue
  #
  #     # Human-readable descriptions for the property in the context of the surrounding shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :description
  #
  #     # Links a result with other results that provide more details, for example to describe violations against nested shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :detail
  #
  #     # Specifies a property where the set of values must be disjoint with the value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :disjoint
  #
  #     # An entailment regime that indicates what kind of inferencing is required by a shapes graph.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :entailment
  #
  #     # Specifies a property that must have the same values as the value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :equals
  #
  #     # The node expression that must return true for the value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :expression
  #
  #     # The shape that all input nodes of the expression need to conform to.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :filterShape
  #
  #     # An optional flag to be used with regular expression pattern matching.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :flags
  #
  #     # The focus node that was validated when the result was produced.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :focusNode
  #
  #     # Can be used to link to a property group to indicate that a property shape belongs to a group of related property shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :group
  #
  #     # Specifies a value that must be among the value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :hasValue
  #
  #     # An optional RDF list of properties that are also permitted in addition to those explicitly enumerated via sh:property/sh:path.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ignoredProperties
  #
  #     # Specifies a list of allowed values so that each value node must be among the members of the given list.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :in
  #
  #     # A list of node expressions that shall be intersected.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :intersection
  #
  #     # The (single) value of this property represents an inverse path (object to subject).
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :inversePath
  #
  #     # Constraints expressed in JavaScript.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :js
  #
  #     # The name of the JavaScript function to execute.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :jsFunctionName
  #
  #     # Declares which JavaScript libraries are needed to execute this.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :jsLibrary
  #
  #     # Declares the URLs of a JavaScript library. This should be the absolute URL of a JavaScript file. Implementations may redirect those to local files.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :jsLibraryURL
  #
  #     # Outlines how human-readable labels of instances of the associated Parameterizable shall be produced. The values can contain `{?paramName}` as placeholders for the actual values of the given parameter.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :labelTemplate
  #
  #     # Specifies a list of language tags that all value nodes must have.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :languageIn
  #
  #     # Specifies a property that must have smaller values than the value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :lessThan
  #
  #     # Specifies a property that must have smaller or equal values than the value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :lessThanOrEquals
  #
  #     # Specifies the maximum number of values in the set of value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :maxCount
  #
  #     # Specifies the maximum exclusive value of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :maxExclusive
  #
  #     # Specifies the maximum inclusive value of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :maxInclusive
  #
  #     # Specifies the maximum string length of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :maxLength
  #
  #     # A human-readable message (possibly with placeholders for variables) explaining the cause of the result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :message
  #
  #     # Specifies the minimum number of values in the set of value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :minCount
  #
  #     # Specifies the minimum exclusive value of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :minExclusive
  #
  #     # Specifies the minimum inclusive value of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :minInclusive
  #
  #     # Specifies the minimum string length of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :minLength
  #
  #     # Human-readable labels for the property in the context of the surrounding shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :name
  #
  #     # The namespace associated with a prefix in a prefix declaration.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :namespace
  #
  #     # Specifies the node shape that all value nodes must conform to.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :node
  #
  #     # Specifies the node kind (e.g. IRI or literal) each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :nodeKind
  #
  #     # The validator(s) used to evaluate a constraint in the context of a node shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :nodeValidator
  #
  #     # The node expression producing the input nodes of a filter shape expression.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :nodes
  #
  #     # Specifies a shape that the value nodes must not conform to.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :not
  #
  #     # An expression producing the nodes that shall be inferred as objects.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :object
  #
  #     # The (single) value of this property represents a path that is matched one or more times.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :oneOrMorePath
  #
  #     # Indicates whether a parameter is optional.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :optional
  #
  #     # Specifies a list of shapes so that the value nodes must conform to at least one of the shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :or
  #
  #     # Specifies the relative order of this compared to its siblings. For example use 0 for the first, 1 for the second.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :order
  #
  #     # The parameters of a function or constraint component.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :parameter
  #
  #     # Specifies the property path of a property shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :path
  #
  #     # Specifies a regular expression pattern that the string representations of the value nodes must match.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :pattern
  #
  #     # An expression producing the properties that shall be inferred as predicates.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :predicate
  #
  #     # The prefix of a prefix declaration.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :prefix
  #
  #     # The prefixes that shall be applied before parsing the associated SPARQL query.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :prefixes
  #
  #     # Links a shape to its property shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :property
  #
  #     # The validator(s) used to evaluate a constraint in the context of a property shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :propertyValidator
  #
  #     # The maximum number of value nodes that can conform to the shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :qualifiedMaxCount
  #
  #     # The minimum number of value nodes that must conform to the shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :qualifiedMinCount
  #
  #     # The shape that a specified number of values must conform to.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :qualifiedValueShape
  #
  #     # Can be used to mark the qualified value shape to be disjoint with its sibling shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :qualifiedValueShapesDisjoint
  #
  #     # The validation results contained in a validation report.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :result
  #
  #     # Links a SPARQL validator with zero or more sh:ResultAnnotation instances, defining how to derive additional result properties based on the variables of the SELECT query.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :resultAnnotation
  #
  #     # Human-readable messages explaining the cause of the result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :resultMessage
  #
  #     # The path of a validation result, based on the path of the validated property shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :resultPath
  #
  #     # The severity of the result, e.g. warning.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :resultSeverity
  #
  #     # The expected type of values returned by the associated function.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :returnType
  #
  #     # The rules linked to a shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :rule
  #
  #     # The SPARQL SELECT query to execute.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :select
  #
  #     # Defines the severity that validation results produced by a shape must have. Defaults to sh:Violation.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :severity
  #
  #     # Shapes graphs that should be used when validating this data graph.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :shapesGraph
  #
  #     # If true then the validation engine was certain that the shapes graph has passed all SHACL syntax requirements during the validation process.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :shapesGraphWellFormed
  #
  #     # The constraint that was validated when the result was produced.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :sourceConstraint
  #
  #     # The constraint component that is the source of the result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :sourceConstraintComponent
  #
  #     # The shape that is was validated when the result was produced.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :sourceShape
  #
  #     # Links a shape with SPARQL constraints.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :sparql
  #
  #     # An expression producing the resources that shall be inferred as subjects.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :subject
  #
  #     # Suggested shapes graphs for this ontology. The values of this property may be used in the absence of specific sh:shapesGraph statements.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :suggestedShapesGraph
  #
  #     # Links a shape to a target specified by an extension language, for example instances of sh:SPARQLTarget.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :target
  #
  #     # Links a shape to a class, indicating that all instances of the class must conform to the shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :targetClass
  #
  #     # Links a shape to individual nodes, indicating that these nodes must conform to the shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :targetNode
  #
  #     # Links a shape to a property, indicating that all all objects of triples that have the given property as their predicate must conform to the shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :targetObjectsOf
  #
  #     # Links a shape to a property, indicating that all subjects of triples that have the given property as their predicate must conform to the shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :targetSubjectsOf
  #
  #     # A list of node expressions that shall be used together.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :union
  #
  #     # Specifies whether all node values must have a unique (or no) language tag.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :uniqueLang
  #
  #     # The SPARQL UPDATE to execute.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :update
  #
  #     # The validator(s) used to evaluate constraints of either node or property shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :validator
  #
  #     # An RDF node that has caused the result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :value
  #
  #     # Specifies a list of shapes so that the value nodes must conform to exactly one of the shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :xone
  #
  #     # The (single) value of this property represents a path that is matched zero or more times.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :zeroOrMorePath
  #
  #     # The (single) value of this property represents a path that is matched zero or one times.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :zeroOrOnePath
  #
  #     # A constraint component that can be used to test whether a value node conforms to all members of a provided list of shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :AndConstraintComponent
  #
  #     # The node kind of all blank nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :BlankNode
  #
  #     # The node kind of all blank nodes or IRIs.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :BlankNodeOrIRI
  #
  #     # The node kind of all blank nodes or literals.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :BlankNodeOrLiteral
  #
  #     # A constraint component that can be used to verify that each value node is an instance of a given type.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ClassConstraintComponent
  #
  #     # A constraint component that can be used to indicate that focus nodes must only have values for those properties that have been explicitly enumerated via sh:property/sh:path.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ClosedConstraintComponent
  #
  #     # A constraint component that can be used to restrict the datatype of all value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :DatatypeConstraintComponent
  #
  #     # A constraint component that can be used to verify that the set of value nodes is disjoint with the the set of nodes that have the focus node as subject and the value of a given property as predicate.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :DisjointConstraintComponent
  #
  #     # A constraint component that can be used to verify that the set of value nodes is equal to the set of nodes that have the focus node as subject and the value of a given property as predicate.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :EqualsConstraintComponent
  #
  #     # A constraint component that can be used to verify that a given node expression produces true for all value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :ExpressionConstraintComponent
  #
  #     # A constraint component that can be used to verify that one of the value nodes is a given RDF node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :HasValueConstraintComponent
  #
  #     # The node kind of all IRIs.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :IRI
  #
  #     # The node kind of all IRIs or literals.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :IRIOrLiteral
  #
  #     # A constraint component that can be used to exclusively enumerate the permitted value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :InConstraintComponent
  #
  #     # The severity for an informational validation result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Info
  #
  #     # A constraint component with the parameter sh:js linking to a sh:JSConstraint containing a sh:script.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :JSConstraintComponent
  #
  #     # A constraint component that can be used to enumerate language tags that all value nodes must have.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :LanguageInConstraintComponent
  #
  #     # A constraint component that can be used to verify that each value node is smaller than all the nodes that have the focus node as subject and the value of a given property as predicate.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :LessThanConstraintComponent
  #
  #     # A constraint component that can be used to verify that every value node is smaller than all the nodes that have the focus node as subject and the value of a given property as predicate.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :LessThanOrEqualsConstraintComponent
  #
  #     # The node kind of all literals.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Literal
  #
  #     # A constraint component that can be used to restrict the maximum number of value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MaxCountConstraintComponent
  #
  #     # A constraint component that can be used to restrict the range of value nodes with a maximum exclusive value.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MaxExclusiveConstraintComponent
  #
  #     # A constraint component that can be used to restrict the range of value nodes with a maximum inclusive value.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MaxInclusiveConstraintComponent
  #
  #     # A constraint component that can be used to restrict the maximum string length of value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MaxLengthConstraintComponent
  #
  #     # A constraint component that can be used to restrict the minimum number of value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MinCountConstraintComponent
  #
  #     # A constraint component that can be used to restrict the range of value nodes with a minimum exclusive value.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MinExclusiveConstraintComponent
  #
  #     # A constraint component that can be used to restrict the range of value nodes with a minimum inclusive value.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MinInclusiveConstraintComponent
  #
  #     # A constraint component that can be used to restrict the minimum string length of value nodes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :MinLengthConstraintComponent
  #
  #     # A constraint component that can be used to verify that all value nodes conform to the given node shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :NodeConstraintComponent
  #
  #     # A constraint component that can be used to restrict the RDF node kind of each value node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :NodeKindConstraintComponent
  #
  #     # A constraint component that can be used to verify that value nodes do not conform to a given shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :NotConstraintComponent
  #
  #     # A constraint component that can be used to restrict the value nodes so that they conform to at least one out of several provided shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :OrConstraintComponent
  #
  #     # A constraint component that can be used to verify that every value node matches a given regular expression.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :PatternConstraintComponent
  #
  #     # A constraint component that can be used to verify that all value nodes conform to the given property shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :PropertyConstraintComponent
  #
  #     # A constraint component that can be used to verify that a specified maximum number of value nodes conforms to a given shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :QualifiedMaxCountConstraintComponent
  #
  #     # A constraint component that can be used to verify that a specified minimum number of value nodes conforms to a given shape.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :QualifiedMinCountConstraintComponent
  #
  #     # A constraint component that can be used to define constraints based on SPARQL queries.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :SPARQLConstraintComponent
  #
  #     # A constraint component that can be used to specify that no pair of value nodes may use the same language tag.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :UniqueLangConstraintComponent
  #
  #     # The severity for a violation validation result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Violation
  #
  #     # The severity for a warning validation result.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :Warning
  #
  #     # A constraint component that can be used to restrict the value nodes so that they conform to exactly one out of several provided shapes.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :XoneConstraintComponent
  #
  #     # A node expression that represents the current focus node.
  #     # @return [RDF::Vocabulary::Term]
  #     attr_reader :this
  #
  #   end
  SHACL = Class.new(RDF::StrictVocabulary("http://www.w3.org/ns/shacl#")) do

    # Ontology definition
    ontology :"http://www.w3.org/ns/shacl#",
      comment: {en: "This vocabulary defines terms used in SHACL, the W3C Shapes Constraint Language."},
      "http://www.w3.org/ns/shacl#declare": term(
          "http://www.w3.org/ns/shacl#namespace": "http://www.w3.org/ns/shacl#",
          "http://www.w3.org/ns/shacl#prefix": "sh"
        ),
      "http://www.w3.org/ns/shacl#suggestedShapesGraph": "http://www.w3.org/ns/shacl-shacl#",
      label: {en: "W3C Shapes Constraint Language (SHACL) Vocabulary"},
      type: "http://www.w3.org/2002/07/owl#Ontology"

    # Class definitions
    term :AbstractResult,
      comment: {en: "The base class of validation results, typically not instantiated directly."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Abstract result"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :ConstraintComponent,
      comment: {en: "The class of constraint components."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Constraint component"},
      subClassOf: "http://www.w3.org/ns/shacl#Parameterizable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Function,
      comment: {en: "The class of SHACL functions."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Function"},
      subClassOf: "http://www.w3.org/ns/shacl#Parameterizable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSConstraint,
      comment: {en: "The class of constraints backed by a JavaScript function."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript-based constraint"},
      subClassOf: "http://www.w3.org/ns/shacl#JSExecutable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSExecutable,
      comment: {en: "Abstract base class of resources that declare an executable JavaScript."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript executable"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSFunction,
      comment: {en: "The class of SHACL functions that execute a JavaScript function when called."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript function"},
      subClassOf: ["http://www.w3.org/ns/shacl#Function", "http://www.w3.org/ns/shacl#JSExecutable"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSLibrary,
      comment: {en: "Represents a JavaScript library, typically identified by one or more URLs of files to include."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript library"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSRule,
      comment: {en: "The class of SHACL rules expressed using JavaScript."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript rule"},
      subClassOf: ["http://www.w3.org/ns/shacl#JSExecutable", "http://www.w3.org/ns/shacl#Rule"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSTarget,
      comment: {en: "The class of targets that are based on JavaScript functions."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript target"},
      subClassOf: ["http://www.w3.org/ns/shacl#JSExecutable", "http://www.w3.org/ns/shacl#Target"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSTargetType,
      comment: {en: "The (meta) class for parameterizable targets that are based on JavaScript functions."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript target type"},
      subClassOf: ["http://www.w3.org/ns/shacl#JSExecutable", "http://www.w3.org/ns/shacl#TargetType"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :JSValidator,
      comment: {en: "A SHACL validator based on JavaScript. This can be used to declare SHACL constraint components that perform JavaScript-based validation when used."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript validator"},
      subClassOf: ["http://www.w3.org/ns/shacl#JSExecutable", "http://www.w3.org/ns/shacl#Validator"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :NodeKind,
      comment: {en: "The class of all node kinds, including sh:BlankNode, sh:IRI, sh:Literal or the combinations of these: sh:BlankNodeOrIRI, sh:BlankNodeOrLiteral, sh:IRIOrLiteral."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Node kind"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :NodeShape,
      comment: {en: "A node shape is a shape that specifies constraint that need to be met with respect to focus nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Node shape"},
      subClassOf: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Parameter,
      comment: {en: "The class of parameter declarations, consisting of a path predicate and (possibly) information about allowed value type, cardinality and other characteristics."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Parameter"},
      subClassOf: "http://www.w3.org/ns/shacl#PropertyShape",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Parameterizable,
      comment: {en: "Superclass of components that can take parameters, especially functions and constraint components."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Parameterizable"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :PrefixDeclaration,
      comment: {en: "The class of prefix declarations, consisting of pairs of a prefix with a namespace."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Prefix declaration"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :PropertyGroup,
      comment: {en: "Instances of this class represent groups of property shapes that belong together."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Property group"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :PropertyShape,
      comment: {en: "A property shape is a shape that specifies constraints on the values of a focus node for a given property or path."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Property shape"},
      subClassOf: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :ResultAnnotation,
      comment: {en: "A class of result annotations, which define the rules to derive the values of a given annotation property as extra values for a validation result."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Result annotation"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Rule,
      comment: {en: "The class of SHACL rules. Never instantiated directly."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Rule"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLAskExecutable,
      comment: {en: "The class of SPARQL executables that are based on an ASK query."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL ASK executable"},
      subClassOf: "http://www.w3.org/ns/shacl#SPARQLExecutable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLAskValidator,
      comment: {en: "The class of validators based on SPARQL ASK queries. The queries are evaluated for each value node and are supposed to return true if the given node conforms."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL ASK validator"},
      subClassOf: ["http://www.w3.org/ns/shacl#SPARQLAskExecutable", "http://www.w3.org/ns/shacl#Validator"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLConstraint,
      comment: {en: "The class of constraints based on SPARQL SELECT queries."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL constraint"},
      subClassOf: "http://www.w3.org/ns/shacl#SPARQLSelectExecutable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLConstructExecutable,
      comment: {en: "The class of SPARQL executables that are based on a CONSTRUCT query."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL CONSTRUCT executable"},
      subClassOf: "http://www.w3.org/ns/shacl#SPARQLExecutable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLExecutable,
      comment: {en: "The class of resources that encapsulate a SPARQL query."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL executable"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLFunction,
      comment: {en: "A function backed by a SPARQL query - either ASK or SELECT."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL function"},
      subClassOf: ["http://www.w3.org/ns/shacl#Function", "http://www.w3.org/ns/shacl#SPARQLAskExecutable", "http://www.w3.org/ns/shacl#SPARQLSelectExecutable"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLRule,
      comment: {en: "The class of SHACL rules based on SPARQL CONSTRUCT queries."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL CONSTRUCT rule"},
      subClassOf: ["http://www.w3.org/ns/shacl#Rule", "http://www.w3.org/ns/shacl#SPARQLConstructExecutable"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLSelectExecutable,
      comment: {en: "The class of SPARQL executables based on a SELECT query."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL SELECT executable"},
      subClassOf: "http://www.w3.org/ns/shacl#SPARQLExecutable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLSelectValidator,
      comment: {en: "The class of validators based on SPARQL SELECT queries. The queries are evaluated for each focus node and are supposed to produce bindings for all focus nodes that do not conform."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL SELECT validator"},
      subClassOf: ["http://www.w3.org/ns/shacl#SPARQLSelectExecutable", "http://www.w3.org/ns/shacl#Validator"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLTarget,
      comment: {en: "The class of targets that are based on SPARQL queries."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL target"},
      subClassOf: ["http://www.w3.org/ns/shacl#SPARQLAskExecutable", "http://www.w3.org/ns/shacl#SPARQLSelectExecutable", "http://www.w3.org/ns/shacl#Target"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLTargetType,
      comment: {en: "The (meta) class for parameterizable targets that are based on SPARQL queries."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL target type"},
      subClassOf: ["http://www.w3.org/ns/shacl#SPARQLAskExecutable", "http://www.w3.org/ns/shacl#SPARQLSelectExecutable", "http://www.w3.org/ns/shacl#TargetType"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :SPARQLUpdateExecutable,
      comment: {en: "The class of SPARQL executables based on a SPARQL UPDATE."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL UPDATE executable"},
      subClassOf: "http://www.w3.org/ns/shacl#SPARQLExecutable",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Severity,
      comment: {en: "The class of validation result severity levels, including violation and warning levels."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Severity"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Shape,
      comment: {en: "A shape is a collection of constraints that may be targeted for certain nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Shape"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Target,
      comment: {en: "The base class of targets such as those based on SPARQL queries."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Target"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :TargetType,
      comment: {en: "The (meta) class for parameterizable targets.\tInstances of this are instantiated as values of the sh:target property."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Target type"},
      subClassOf: ["http://www.w3.org/2000/01/rdf-schema#Class", "http://www.w3.org/ns/shacl#Parameterizable"],
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :TripleRule,
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "A rule based on triple (subject, predicate, object) pattern."},
      subClassOf: "http://www.w3.org/ns/shacl#Rule",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :ValidationReport,
      comment: {en: "The class of SHACL validation reports."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Validation report"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :ValidationResult,
      comment: {en: "The class of validation results."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Validation result"},
      subClassOf: "http://www.w3.org/ns/shacl#AbstractResult",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"
    term :Validator,
      comment: {en: "The class of validators, which provide instructions on how to process a constraint definition. This class serves as base class for the SPARQL-based validators and other possible implementations."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Validator"},
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/2000/01/rdf-schema#Class"

    # Property definitions
    property :alternativePath,
      comment: {en: "The (single) value of this property must be a list of path elements, representing the elements of alternative paths."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "alternative path"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :and,
      comment: {en: "RDF list of shapes to validate the value nodes against."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "and"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :annotationProperty,
      comment: {en: "The annotation property that shall be set."},
      domain: "http://www.w3.org/ns/shacl#ResultAnnotation",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "annotation property"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :annotationValue,
      comment: {en: "The (default) values of the annotation property."},
      domain: "http://www.w3.org/ns/shacl#ResultAnnotation",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "annotation value"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :annotationVarName,
      comment: {en: "The name of the SPARQL variable from the SELECT clause that shall be used for the values."},
      domain: "http://www.w3.org/ns/shacl#ResultAnnotation",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "annotation variable name"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :ask,
      comment: {en: "The SPARQL ASK query to execute."},
      domain: "http://www.w3.org/ns/shacl#SPARQLAskExecutable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "ask"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :class,
      comment: {en: "The type that all value nodes must have."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "class"},
      range: "http://www.w3.org/2000/01/rdf-schema#Class",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :closed,
      comment: {en: "If set to true then the shape is closed."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "closed"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :condition,
      comment: {en: "The shapes that the focus nodes need to conform to before a rule is executed on them."},
      domain: "http://www.w3.org/ns/shacl#Rule",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "condition"},
      range: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :conforms,
      comment: {en: "True if the validation did not produce any validation results, and false otherwise."},
      domain: "http://www.w3.org/ns/shacl#ValidationReport",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "conforms"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :construct,
      comment: {en: "The SPARQL CONSTRUCT query to execute."},
      domain: "http://www.w3.org/ns/shacl#SPARQLConstructExecutable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "construct"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :datatype,
      comment: {en: "Specifies an RDF datatype that all value nodes must have."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "datatype"},
      range: "http://www.w3.org/2000/01/rdf-schema#Datatype",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :deactivated,
      comment: {en: "If set to true then all nodes conform to this."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "deactivated"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :declare,
      comment: {en: "Links a resource with its namespace prefix declarations."},
      domain: "http://www.w3.org/2002/07/owl#Ontology",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "declare"},
      range: "http://www.w3.org/ns/shacl#PrefixDeclaration",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :defaultValue,
      comment: {en: "A default value for a property, for example for user interface tools to pre-populate input fields."},
      domain: "http://www.w3.org/ns/shacl#PropertyShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "default value"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :description,
      comment: {en: "Human-readable descriptions for the property in the context of the surrounding shape."},
      domain: "http://www.w3.org/ns/shacl#PropertyShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "description"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :detail,
      comment: {en: "Links a result with other results that provide more details, for example to describe violations against nested shapes."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "detail"},
      range: "http://www.w3.org/ns/shacl#AbstractResult",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :disjoint,
      comment: {en: "Specifies a property where the set of values must be disjoint with the value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "disjoint"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :entailment,
      comment: {en: "An entailment regime that indicates what kind of inferencing is required by a shapes graph."},
      domain: "http://www.w3.org/2002/07/owl#Ontology",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "entailment"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :equals,
      comment: {en: "Specifies a property that must have the same values as the value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "equals"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :expression,
      comment: {en: "The node expression that must return true for the value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "expression"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :filterShape,
      comment: {en: "The shape that all input nodes of the expression need to conform to."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "filter shape"},
      range: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :flags,
      comment: {en: "An optional flag to be used with regular expression pattern matching."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "flags"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :focusNode,
      comment: {en: "The focus node that was validated when the result was produced."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "focus node"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :group,
      comment: {en: "Can be used to link to a property group to indicate that a property shape belongs to a group of related property shapes."},
      domain: "http://www.w3.org/ns/shacl#PropertyShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "group"},
      range: "http://www.w3.org/ns/shacl#PropertyGroup",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :hasValue,
      comment: {en: "Specifies a value that must be among the value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "has value"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :ignoredProperties,
      comment: {en: "An optional RDF list of properties that are also permitted in addition to those explicitly enumerated via sh:property/sh:path."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "ignored properties"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :in,
      comment: {en: "Specifies a list of allowed values so that each value node must be among the members of the given list."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "in"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :intersection,
      comment: {en: "A list of node expressions that shall be intersected."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "intersection"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :inversePath,
      comment: {en: "The (single) value of this property represents an inverse path (object to subject)."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "inverse path"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :js,
      comment: "Constraints expressed in JavaScript.",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript constraint"},
      range: "http://www.w3.org/ns/shacl#JSConstraint",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :jsFunctionName,
      comment: {en: "The name of the JavaScript function to execute."},
      domain: "http://www.w3.org/ns/shacl#JSExecutable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript function name"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :jsLibrary,
      comment: {en: "Declares which JavaScript libraries are needed to execute this."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript library"},
      range: "http://www.w3.org/ns/shacl#JSLibrary",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :jsLibraryURL,
      comment: {en: "Declares the URLs of a JavaScript library. This should be the absolute URL of a JavaScript file. Implementations may redirect those to local files."},
      domain: "http://www.w3.org/ns/shacl#JSLibrary",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript library URL"},
      range: "http://www.w3.org/2001/XMLSchema#anyURI",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :labelTemplate,
      comment: {en: "Outlines how human-readable labels of instances of the associated Parameterizable shall be produced. The values can contain {?paramName} as placeholders for the actual values of the given parameter."},
      domain: "http://www.w3.org/ns/shacl#Parameterizable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "label template"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :languageIn,
      comment: {en: "Specifies a list of language tags that all value nodes must have."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "language in"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :lessThan,
      comment: {en: "Specifies a property that must have smaller values than the value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "less than"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :lessThanOrEquals,
      comment: {en: "Specifies a property that must have smaller or equal values than the value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "less than or equals"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :maxCount,
      comment: {en: "Specifies the maximum number of values in the set of value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "max count"},
      range: "http://www.w3.org/2001/XMLSchema#integer",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :maxExclusive,
      comment: {en: "Specifies the maximum exclusive value of each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "max exclusive"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :maxInclusive,
      comment: {en: "Specifies the maximum inclusive value of each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "max inclusive"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :maxLength,
      comment: {en: "Specifies the maximum string length of each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "max length"},
      range: "http://www.w3.org/2001/XMLSchema#integer",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :message,
      comment: {en: "A human-readable message (possibly with placeholders for variables) explaining the cause of the result."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "message"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :minCount,
      comment: {en: "Specifies the minimum number of values in the set of value nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "min count"},
      range: "http://www.w3.org/2001/XMLSchema#integer",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :minExclusive,
      comment: {en: "Specifies the minimum exclusive value of each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "min exclusive"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :minInclusive,
      comment: {en: "Specifies the minimum inclusive value of each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "min inclusive"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :minLength,
      comment: {en: "Specifies the minimum string length of each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "min length"},
      range: "http://www.w3.org/2001/XMLSchema#integer",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :name,
      comment: {en: "Human-readable labels for the property in the context of the surrounding shape."},
      domain: "http://www.w3.org/ns/shacl#PropertyShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "name"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :namespace,
      comment: {en: "The namespace associated with a prefix in a prefix declaration."},
      domain: "http://www.w3.org/ns/shacl#PrefixDeclaration",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "namespace"},
      range: "http://www.w3.org/2001/XMLSchema#anyURI",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :node,
      comment: {en: "Specifies the node shape that all value nodes must conform to."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "node"},
      range: "http://www.w3.org/ns/shacl#NodeShape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :nodeKind,
      comment: {en: "Specifies the node kind (e.g. IRI or literal) each value node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "node kind"},
      range: "http://www.w3.org/ns/shacl#NodeKind",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :nodeValidator,
      comment: {en: "The validator(s) used to evaluate a constraint in the context of a node shape."},
      domain: "http://www.w3.org/ns/shacl#ConstraintComponent",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "shape validator"},
      range: "http://www.w3.org/ns/shacl#Validator",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :nodes,
      comment: {en: "The node expression producing the input nodes of a filter shape expression."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "nodes"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :not,
      comment: {en: "Specifies a shape that the value nodes must not conform to."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "not"},
      range: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :object,
      comment: {en: "An expression producing the nodes that shall be inferred as objects."},
      domain: "http://www.w3.org/ns/shacl#TripleRule",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "object"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :oneOrMorePath,
      comment: {en: "The (single) value of this property represents a path that is matched one or more times."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "one or more path"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :optional,
      comment: {en: "Indicates whether a parameter is optional."},
      domain: "http://www.w3.org/ns/shacl#Parameter",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "optional"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :or,
      comment: {en: "Specifies a list of shapes so that the value nodes must conform to at least one of the shapes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "or"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :order,
      comment: {en: "Specifies the relative order of this compared to its siblings. For example use 0 for the first, 1 for the second."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "order"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :parameter,
      comment: {en: "The parameters of a function or constraint component."},
      domain: "http://www.w3.org/ns/shacl#Parameterizable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "parameter"},
      range: "http://www.w3.org/ns/shacl#Parameter",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :path,
      comment: {en: "Specifies the property path of a property shape."},
      domain: "http://www.w3.org/ns/shacl#PropertyShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "path"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :pattern,
      comment: {en: "Specifies a regular expression pattern that the string representations of the value nodes must match."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "pattern"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :predicate,
      comment: {en: "An expression producing the properties that shall be inferred as predicates."},
      domain: "http://www.w3.org/ns/shacl#TripleRule",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "predicate"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :prefix,
      comment: {en: "The prefix of a prefix declaration."},
      domain: "http://www.w3.org/ns/shacl#PrefixDeclaration",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "prefix"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :prefixes,
      comment: {en: "The prefixes that shall be applied before parsing the associated SPARQL query."},
      domain: "http://www.w3.org/ns/shacl#SPARQLExecutable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "prefixes"},
      range: "http://www.w3.org/2002/07/owl#Ontology",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :property,
      comment: {en: "Links a shape to its property shapes."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "property"},
      range: "http://www.w3.org/ns/shacl#PropertyShape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :propertyValidator,
      comment: {en: "The validator(s) used to evaluate a constraint in the context of a property shape."},
      domain: "http://www.w3.org/ns/shacl#ConstraintComponent",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "property validator"},
      range: "http://www.w3.org/ns/shacl#Validator",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :qualifiedMaxCount,
      comment: {en: "The maximum number of value nodes that can conform to the shape."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "qualified max count"},
      range: "http://www.w3.org/2001/XMLSchema#integer",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :qualifiedMinCount,
      comment: {en: "The minimum number of value nodes that must conform to the shape."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "qualified min count"},
      range: "http://www.w3.org/2001/XMLSchema#integer",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :qualifiedValueShape,
      comment: {en: "The shape that a specified number of values must conform to."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "qualified value shape"},
      range: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :qualifiedValueShapesDisjoint,
      comment: {en: "Can be used to mark the qualified value shape to be disjoint with its sibling shapes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "qualified value shapes disjoint"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :result,
      comment: {en: "The validation results contained in a validation report."},
      domain: "http://www.w3.org/ns/shacl#ValidationReport",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "result"},
      range: "http://www.w3.org/ns/shacl#ValidationResult",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :resultAnnotation,
      comment: {en: "Links a SPARQL validator with zero or more sh:ResultAnnotation instances, defining how to derive additional result properties based on the variables of the SELECT query."},
      domain: "http://www.w3.org/ns/shacl#SPARQLSelectValidator",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "result annotation"},
      range: "http://www.w3.org/ns/shacl#ResultAnnotation",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :resultMessage,
      comment: {en: "Human-readable messages explaining the cause of the result."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "result message"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :resultPath,
      comment: {en: "The path of a validation result, based on the path of the validated property shape."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "result path"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :resultSeverity,
      comment: {en: "The severity of the result, e.g. warning."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "result severity"},
      range: "http://www.w3.org/ns/shacl#Severity",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :returnType,
      comment: {en: "The expected type of values returned by the associated function."},
      domain: "http://www.w3.org/ns/shacl#Function",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "return type"},
      range: "http://www.w3.org/2000/01/rdf-schema#Class",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :rule,
      comment: {en: "The rules linked to a shape."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "rule"},
      range: "http://www.w3.org/ns/shacl#Rule",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :select,
      comment: {en: "The SPARQL SELECT query to execute."},
      domain: "http://www.w3.org/ns/shacl#SPARQLSelectExecutable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "select"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :severity,
      comment: {en: "Defines the severity that validation results produced by a shape must have. Defaults to sh:Violation."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "severity"},
      range: "http://www.w3.org/ns/shacl#Severity",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :shapesGraph,
      comment: {en: "Shapes graphs that should be used when validating this data graph."},
      domain: "http://www.w3.org/2002/07/owl#Ontology",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "shapes graph"},
      range: "http://www.w3.org/2002/07/owl#Ontology",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :shapesGraphWellFormed,
      comment: {en: "If true then the validation engine was certain that the shapes graph has passed all SHACL syntax requirements during the validation process."},
      domain: "http://www.w3.org/ns/shacl#ValidationReport",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "shapes graph well-formed"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :sourceConstraint,
      comment: {en: "The constraint that was validated when the result was produced."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "source constraint"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :sourceConstraintComponent,
      comment: {en: "The constraint component that is the source of the result."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "source constraint component"},
      range: "http://www.w3.org/ns/shacl#ConstraintComponent",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :sourceShape,
      comment: {en: "The shape that is was validated when the result was produced."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "source shape"},
      range: "http://www.w3.org/ns/shacl#Shape",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :sparql,
      comment: {en: "Links a shape with SPARQL constraints."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "constraint (in SPARQL)"},
      range: "http://www.w3.org/ns/shacl#SPARQLConstraint",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :subject,
      comment: {en: "An expression producing the resources that shall be inferred as subjects."},
      domain: "http://www.w3.org/ns/shacl#TripleRule",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "subject"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :suggestedShapesGraph,
      comment: {en: "Suggested shapes graphs for this ontology. The values of this property may be used in the absence of specific sh:shapesGraph statements."},
      domain: "http://www.w3.org/2002/07/owl#Ontology",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "suggested shapes graph"},
      range: "http://www.w3.org/2002/07/owl#Ontology",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :target,
      comment: {en: "Links a shape to a target specified by an extension language, for example instances of sh:SPARQLTarget."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "target"},
      range: "http://www.w3.org/ns/shacl#Target",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :targetClass,
      comment: {en: "Links a shape to a class, indicating that all instances of the class must conform to the shape."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "target class"},
      range: "http://www.w3.org/2000/01/rdf-schema#Class",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :targetNode,
      comment: {en: "Links a shape to individual nodes, indicating that these nodes must conform to the shape."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "target node"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :targetObjectsOf,
      comment: {en: "Links a shape to a property, indicating that all all objects of triples that have the given property as their predicate must conform to the shape."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "target objects of"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :targetSubjectsOf,
      comment: {en: "Links a shape to a property, indicating that all subjects of triples that have the given property as their predicate must conform to the shape."},
      domain: "http://www.w3.org/ns/shacl#Shape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "target subjects of"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :union,
      comment: {en: "A list of node expressions that shall be used together."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "union"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :uniqueLang,
      comment: {en: "Specifies whether all node values must have a unique (or no) language tag."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "unique languages"},
      range: "http://www.w3.org/2001/XMLSchema#boolean",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :update,
      comment: {en: "The SPARQL UPDATE to execute."},
      domain: "http://www.w3.org/ns/shacl#SPARQLUpdateExecutable",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "update"},
      range: "http://www.w3.org/2001/XMLSchema#string",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :validator,
      comment: {en: "The validator(s) used to evaluate constraints of either node or property shapes."},
      domain: "http://www.w3.org/ns/shacl#ConstraintComponent",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "validator"},
      range: "http://www.w3.org/ns/shacl#Validator",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :value,
      comment: {en: "An RDF node that has caused the result."},
      domain: "http://www.w3.org/ns/shacl#AbstractResult",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "value"},
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :xone,
      comment: {en: "Specifies a list of shapes so that the value nodes must conform to exactly one of the shapes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "exactly one"},
      range: "http://www.w3.org/1999/02/22-rdf-syntax-ns#List",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :zeroOrMorePath,
      comment: {en: "The (single) value of this property represents a path that is matched zero or more times."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "zero or more path"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"
    property :zeroOrOnePath,
      comment: {en: "The (single) value of this property represents a path that is matched zero or one times."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "zero or one path"},
      range: "http://www.w3.org/2000/01/rdf-schema#Resource",
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"

    # Extra definitions
    term :AndConstraintComponent,
      comment: {en: "A constraint component that can be used to test whether a value node conforms to all members of a provided list of shapes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#AndConstraintComponent-and",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "And constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"AndConstraintComponent-and",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#and",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :BlankNode,
      comment: {en: "The node kind of all blank nodes."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Blank node"},
      type: "http://www.w3.org/ns/shacl#NodeKind"
    term :BlankNodeOrIRI,
      comment: {en: "The node kind of all blank nodes or IRIs."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Blank node or IRI"},
      type: "http://www.w3.org/ns/shacl#NodeKind"
    term :BlankNodeOrLiteral,
      comment: {en: "The node kind of all blank nodes or literals."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Blank node or literal"},
      type: "http://www.w3.org/ns/shacl#NodeKind"
    term :ClassConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that each value node is an instance of a given type."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#ClassConstraintComponent-class",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Class constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"ClassConstraintComponent-class",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#IRI",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#class",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :ClosedConstraintComponent,
      comment: {en: "A constraint component that can be used to indicate that focus nodes must only have values for those properties that have been explicitly enumerated via sh:property/sh:path."},
      "http://www.w3.org/ns/shacl#parameter": ["http://www.w3.org/ns/shacl#ClosedConstraintComponent-closed", "http://www.w3.org/ns/shacl#ClosedConstraintComponent-ignoredProperties"],
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Closed constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"ClosedConstraintComponent-closed",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#boolean",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#closed",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :"ClosedConstraintComponent-ignoredProperties",
      "http://www.w3.org/ns/shacl#optional": "true",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#ignoredProperties",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :DatatypeConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the datatype of all value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#DatatypeConstraintComponent-datatype",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Datatype constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"DatatypeConstraintComponent-datatype",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#IRI",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#datatype",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :DisjointConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that the set of value nodes is disjoint with the the set of nodes that have the focus node as subject and the value of a given property as predicate."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#DisjointConstraintComponent-disjoint",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Disjoint constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"DisjointConstraintComponent-disjoint",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#IRI",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#disjoint",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :EqualsConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that the set of value nodes is equal to the set of nodes that have the focus node as subject and the value of a given property as predicate."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#EqualsConstraintComponent-equals",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Equals constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"EqualsConstraintComponent-equals",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#IRI",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#equals",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :ExpressionConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that a given node expression produces true for all value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#ExpressionConstraintComponent-expression",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Expression constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"ExpressionConstraintComponent-expression",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#expression",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :HasValueConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that one of the value nodes is a given RDF node."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#HasValueConstraintComponent-hasValue",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Has-value constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"HasValueConstraintComponent-hasValue",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#hasValue",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :IRI,
      comment: {en: "The node kind of all IRIs."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "IRI"},
      type: "http://www.w3.org/ns/shacl#NodeKind"
    term :IRIOrLiteral,
      comment: {en: "The node kind of all IRIs or literals."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "IRI or literal"},
      type: "http://www.w3.org/ns/shacl#NodeKind"
    term :InConstraintComponent,
      comment: {en: "A constraint component that can be used to exclusively enumerate the permitted value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#InConstraintComponent-in",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "In constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"InConstraintComponent-in",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#in",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :Info,
      comment: {en: "The severity for an informational validation result."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Info"},
      type: "http://www.w3.org/ns/shacl#Severity"
    term :"JSConstraint-js",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#js",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :JSConstraintComponent,
      comment: {en: "A constraint component with the parameter sh:js linking to a sh:JSConstraint containing a sh:script."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#JSConstraint-js",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "JavaScript constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :LanguageInConstraintComponent,
      comment: {en: "A constraint component that can be used to enumerate language tags that all value nodes must have."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#LanguageInConstraintComponent-languageIn",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Language-in constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"LanguageInConstraintComponent-languageIn",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#languageIn",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :LessThanConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that each value node is smaller than all the nodes that have the focus node as subject and the value of a given property as predicate."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#LessThanConstraintComponent-lessThan",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Less-than constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"LessThanConstraintComponent-lessThan",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#IRI",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#lessThan",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :LessThanOrEqualsConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that every value node is smaller than all the nodes that have the focus node as subject and the value of a given property as predicate."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#LessThanOrEqualsConstraintComponent-lessThanOrEquals",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "less-than-or-equals constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"LessThanOrEqualsConstraintComponent-lessThanOrEquals",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#IRI",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#lessThanOrEquals",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :Literal,
      comment: {en: "The node kind of all literals."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Literal"},
      type: "http://www.w3.org/ns/shacl#NodeKind"
    term :MaxCountConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the maximum number of value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MaxCountConstraintComponent-maxCount",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Max-count constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MaxCountConstraintComponent-maxCount",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#integer",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#maxCount",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MaxExclusiveConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the range of value nodes with a maximum exclusive value."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MaxExclusiveConstraintComponent-maxExclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Max-exclusive constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MaxExclusiveConstraintComponent-maxExclusive",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#Literal",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#maxExclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MaxInclusiveConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the range of value nodes with a maximum inclusive value."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MaxInclusiveConstraintComponent-maxInclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Max-inclusive constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MaxInclusiveConstraintComponent-maxInclusive",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#Literal",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#maxInclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MaxLengthConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the maximum string length of value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MaxLengthConstraintComponent-maxLength",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Max-length constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MaxLengthConstraintComponent-maxLength",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#integer",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#maxLength",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MinCountConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the minimum number of value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MinCountConstraintComponent-minCount",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Min-count constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MinCountConstraintComponent-minCount",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#integer",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#minCount",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MinExclusiveConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the range of value nodes with a minimum exclusive value."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MinExclusiveConstraintComponent-minExclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Min-exclusive constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MinExclusiveConstraintComponent-minExclusive",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#Literal",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#minExclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MinInclusiveConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the range of value nodes with a minimum inclusive value."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MinInclusiveConstraintComponent-minInclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Min-inclusive constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MinInclusiveConstraintComponent-minInclusive",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#nodeKind": "http://www.w3.org/ns/shacl#Literal",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#minInclusive",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :MinLengthConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the minimum string length of value nodes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#MinLengthConstraintComponent-minLength",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Min-length constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"MinLengthConstraintComponent-minLength",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#integer",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#minLength",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :NodeConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that all value nodes conform to the given node shape."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#NodeConstraintComponent-node",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Node constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"NodeConstraintComponent-node",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#node",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :NodeKindConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the RDF node kind of each value node."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#NodeKindConstraintComponent-nodeKind",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Node-kind constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"NodeKindConstraintComponent-nodeKind",
      "http://www.w3.org/ns/shacl#in": list("http://www.w3.org/ns/shacl#BlankNode", "http://www.w3.org/ns/shacl#IRI", "http://www.w3.org/ns/shacl#Literal", "http://www.w3.org/ns/shacl#BlankNodeOrIRI", "http://www.w3.org/ns/shacl#BlankNodeOrLiteral", "http://www.w3.org/ns/shacl#IRIOrLiteral"),
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#nodeKind",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :NotConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that value nodes do not conform to a given shape."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#NotConstraintComponent-not",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Not constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"NotConstraintComponent-not",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#not",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :OrConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the value nodes so that they conform to at least one out of several provided shapes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#OrConstraintComponent-or",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Or constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"OrConstraintComponent-or",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#or",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :PatternConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that every value node matches a given regular expression."},
      "http://www.w3.org/ns/shacl#parameter": ["http://www.w3.org/ns/shacl#PatternConstraintComponent-flags", "http://www.w3.org/ns/shacl#PatternConstraintComponent-pattern"],
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Pattern constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"PatternConstraintComponent-flags",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#string",
      "http://www.w3.org/ns/shacl#optional": "true",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#flags",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :"PatternConstraintComponent-pattern",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#string",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#pattern",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :PropertyConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that all value nodes conform to the given property shape."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#PropertyConstraintComponent-property",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Property constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"PropertyConstraintComponent-property",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#property",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :QualifiedMaxCountConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that a specified maximum number of value nodes conforms to a given shape."},
      "http://www.w3.org/ns/shacl#parameter": ["http://www.w3.org/ns/shacl#QualifiedMaxCountConstraintComponent-qualifiedMaxCount", "http://www.w3.org/ns/shacl#QualifiedMaxCountConstraintComponent-qualifiedValueShape", "http://www.w3.org/ns/shacl#QualifiedMaxCountConstraintComponent-qualifiedValueShapesDisjoint"],
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Qualified-max-count constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"QualifiedMaxCountConstraintComponent-qualifiedMaxCount",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#integer",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#qualifiedMaxCount",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :"QualifiedMaxCountConstraintComponent-qualifiedValueShape",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#qualifiedValueShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :"QualifiedMaxCountConstraintComponent-qualifiedValueShapesDisjoint",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#boolean",
      "http://www.w3.org/ns/shacl#optional": "true",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#qualifiedValueShapesDisjoint",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :QualifiedMinCountConstraintComponent,
      comment: {en: "A constraint component that can be used to verify that a specified minimum number of value nodes conforms to a given shape."},
      "http://www.w3.org/ns/shacl#parameter": ["http://www.w3.org/ns/shacl#QualifiedMinCountConstraintComponent-qualifiedMinCount", "http://www.w3.org/ns/shacl#QualifiedMinCountConstraintComponent-qualifiedValueShape", "http://www.w3.org/ns/shacl#QualifiedMinCountConstraintComponent-qualifiedValueShapesDisjoint"],
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Qualified-min-count constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"QualifiedMinCountConstraintComponent-qualifiedMinCount",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#integer",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#qualifiedMinCount",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :"QualifiedMinCountConstraintComponent-qualifiedValueShape",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#qualifiedValueShape",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :"QualifiedMinCountConstraintComponent-qualifiedValueShapesDisjoint",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#boolean",
      "http://www.w3.org/ns/shacl#optional": "true",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#qualifiedValueShapesDisjoint",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :SPARQLConstraintComponent,
      comment: {en: "A constraint component that can be used to define constraints based on SPARQL queries."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#SPARQLConstraintComponent-sparql",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "SPARQL constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"SPARQLConstraintComponent-sparql",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#sparql",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :UniqueLangConstraintComponent,
      comment: {en: "A constraint component that can be used to specify that no pair of value nodes may use the same language tag."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#UniqueLangConstraintComponent-uniqueLang",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Unique-languages constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"UniqueLangConstraintComponent-uniqueLang",
      "http://www.w3.org/ns/shacl#datatype": "http://www.w3.org/2001/XMLSchema#boolean",
      "http://www.w3.org/ns/shacl#maxCount": "1",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#uniqueLang",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :Violation,
      comment: {en: "The severity for a violation validation result."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Violation"},
      type: "http://www.w3.org/ns/shacl#Severity"
    term :Warning,
      comment: {en: "The severity for a warning validation result."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Warning"},
      type: "http://www.w3.org/ns/shacl#Severity"
    term :XoneConstraintComponent,
      comment: {en: "A constraint component that can be used to restrict the value nodes so that they conform to exactly one out of several provided shapes."},
      "http://www.w3.org/ns/shacl#parameter": "http://www.w3.org/ns/shacl#XoneConstraintComponent-xone",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "Exactly one constraint component"},
      type: "http://www.w3.org/ns/shacl#ConstraintComponent"
    term :"XoneConstraintComponent-xone",
      "http://www.w3.org/ns/shacl#path": "http://www.w3.org/ns/shacl#xone",
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      type: "http://www.w3.org/ns/shacl#Parameter"
    term :this,
      comment: {en: "A node expression that represents the current focus node."},
      isDefinedBy: "http://www.w3.org/ns/shacl#",
      label: {en: "this"},
      type: "http://www.w3.org/2000/01/rdf-schema#Resource"
  end
end
