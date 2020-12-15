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
  #     # The (meta) class for parameterizable targets.	Instances of this are instantiated as values of the sh:target property.
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
      comment: "This vocabulary defines terms used in SHACL, the W3C Shapes Constraint Language.".freeze,
      label: "W3C Shapes Constraint Language (SHACL) Vocabulary".freeze,
      "shacl:declare": term(
          "shacl:namespace": "http://www.w3.org/ns/shacl#".freeze,
          "shacl:prefix": "sh".freeze
        ),
      "shacl:suggestedShapesGraph": "http://www.w3.org/ns/shacl-shacl#".freeze,
      type: "owl:Ontology".freeze

    # Class definitions
    term :AbstractResult,
      comment: "The base class of validation results, typically not instantiated directly.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Abstract result".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :ConstraintComponent,
      comment: "The class of constraint components.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Constraint component".freeze,
      subClassOf: "shacl:Parameterizable".freeze,
      type: "rdfs:Class".freeze
    term :Function,
      comment: "The class of SHACL functions.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Function".freeze,
      subClassOf: "shacl:Parameterizable".freeze,
      type: "rdfs:Class".freeze
    term :JSConstraint,
      comment: "The class of constraints backed by a JavaScript function.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript-based constraint".freeze,
      subClassOf: "shacl:JSExecutable".freeze,
      type: "rdfs:Class".freeze
    term :JSExecutable,
      comment: "Abstract base class of resources that declare an executable JavaScript.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript executable".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :JSFunction,
      comment: "The class of SHACL functions that execute a JavaScript function when called.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript function".freeze,
      subClassOf: ["shacl:Function".freeze, "shacl:JSExecutable".freeze],
      type: "rdfs:Class".freeze
    term :JSLibrary,
      comment: "Represents a JavaScript library, typically identified by one or more URLs of files to include.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript library".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :JSRule,
      comment: "The class of SHACL rules expressed using JavaScript.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript rule".freeze,
      subClassOf: ["shacl:JSExecutable".freeze, "shacl:Rule".freeze],
      type: "rdfs:Class".freeze
    term :JSTarget,
      comment: "The class of targets that are based on JavaScript functions.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript target".freeze,
      subClassOf: ["shacl:JSExecutable".freeze, "shacl:Target".freeze],
      type: "rdfs:Class".freeze
    term :JSTargetType,
      comment: "The (meta) class for parameterizable targets that are based on JavaScript functions.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript target type".freeze,
      subClassOf: ["shacl:JSExecutable".freeze, "shacl:TargetType".freeze],
      type: "rdfs:Class".freeze
    term :JSValidator,
      comment: "A SHACL validator based on JavaScript. This can be used to declare SHACL constraint components that perform JavaScript-based validation when used.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript validator".freeze,
      subClassOf: ["shacl:JSExecutable".freeze, "shacl:Validator".freeze],
      type: "rdfs:Class".freeze
    term :NodeKind,
      comment: "The class of all node kinds, including sh:BlankNode, sh:IRI, sh:Literal or the combinations of these: sh:BlankNodeOrIRI, sh:BlankNodeOrLiteral, sh:IRIOrLiteral.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Node kind".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :NodeShape,
      comment: "A node shape is a shape that specifies constraint that need to be met with respect to focus nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Node shape".freeze,
      subClassOf: "shacl:Shape".freeze,
      type: "rdfs:Class".freeze
    term :Parameter,
      comment: "The class of parameter declarations, consisting of a path predicate and (possibly) information about allowed value type, cardinality and other characteristics.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Parameter".freeze,
      subClassOf: "shacl:PropertyShape".freeze,
      type: "rdfs:Class".freeze
    term :Parameterizable,
      comment: "Superclass of components that can take parameters, especially functions and constraint components.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Parameterizable".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :PrefixDeclaration,
      comment: "The class of prefix declarations, consisting of pairs of a prefix with a namespace.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Prefix declaration".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :PropertyGroup,
      comment: "Instances of this class represent groups of property shapes that belong together.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Property group".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :PropertyShape,
      comment: "A property shape is a shape that specifies constraints on the values of a focus node for a given property or path.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Property shape".freeze,
      subClassOf: "shacl:Shape".freeze,
      type: "rdfs:Class".freeze
    term :ResultAnnotation,
      comment: "A class of result annotations, which define the rules to derive the values of a given annotation property as extra values for a validation result.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Result annotation".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :Rule,
      comment: "The class of SHACL rules. Never instantiated directly.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Rule".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :SPARQLAskExecutable,
      comment: "The class of SPARQL executables that are based on an ASK query.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL ASK executable".freeze,
      subClassOf: "shacl:SPARQLExecutable".freeze,
      type: "rdfs:Class".freeze
    term :SPARQLAskValidator,
      comment: "The class of validators based on SPARQL ASK queries. The queries are evaluated for each value node and are supposed to return true if the given node conforms.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL ASK validator".freeze,
      subClassOf: ["shacl:SPARQLAskExecutable".freeze, "shacl:Validator".freeze],
      type: "rdfs:Class".freeze
    term :SPARQLConstraint,
      comment: "The class of constraints based on SPARQL SELECT queries.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL constraint".freeze,
      subClassOf: "shacl:SPARQLSelectExecutable".freeze,
      type: "rdfs:Class".freeze
    term :SPARQLConstructExecutable,
      comment: "The class of SPARQL executables that are based on a CONSTRUCT query.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL CONSTRUCT executable".freeze,
      subClassOf: "shacl:SPARQLExecutable".freeze,
      type: "rdfs:Class".freeze
    term :SPARQLExecutable,
      comment: "The class of resources that encapsulate a SPARQL query.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL executable".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :SPARQLFunction,
      comment: "A function backed by a SPARQL query - either ASK or SELECT.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL function".freeze,
      subClassOf: ["shacl:Function".freeze, "shacl:SPARQLAskExecutable".freeze, "shacl:SPARQLSelectExecutable".freeze],
      type: "rdfs:Class".freeze
    term :SPARQLRule,
      comment: "The class of SHACL rules based on SPARQL CONSTRUCT queries.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL CONSTRUCT rule".freeze,
      subClassOf: ["shacl:Rule".freeze, "shacl:SPARQLConstructExecutable".freeze],
      type: "rdfs:Class".freeze
    term :SPARQLSelectExecutable,
      comment: "The class of SPARQL executables based on a SELECT query.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL SELECT executable".freeze,
      subClassOf: "shacl:SPARQLExecutable".freeze,
      type: "rdfs:Class".freeze
    term :SPARQLSelectValidator,
      comment: "The class of validators based on SPARQL SELECT queries. The queries are evaluated for each focus node and are supposed to produce bindings for all focus nodes that do not conform.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL SELECT validator".freeze,
      subClassOf: ["shacl:SPARQLSelectExecutable".freeze, "shacl:Validator".freeze],
      type: "rdfs:Class".freeze
    term :SPARQLTarget,
      comment: "The class of targets that are based on SPARQL queries.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL target".freeze,
      subClassOf: ["shacl:SPARQLAskExecutable".freeze, "shacl:SPARQLSelectExecutable".freeze, "shacl:Target".freeze],
      type: "rdfs:Class".freeze
    term :SPARQLTargetType,
      comment: "The (meta) class for parameterizable targets that are based on SPARQL queries.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL target type".freeze,
      subClassOf: ["shacl:SPARQLAskExecutable".freeze, "shacl:SPARQLSelectExecutable".freeze, "shacl:TargetType".freeze],
      type: "rdfs:Class".freeze
    term :SPARQLUpdateExecutable,
      comment: "The class of SPARQL executables based on a SPARQL UPDATE.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL UPDATE executable".freeze,
      subClassOf: "shacl:SPARQLExecutable".freeze,
      type: "rdfs:Class".freeze
    term :Severity,
      comment: "The class of validation result severity levels, including violation and warning levels.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Severity".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :Shape,
      comment: "A shape is a collection of constraints that may be targeted for certain nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Shape".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :Target,
      comment: "The base class of targets such as those based on SPARQL queries.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Target".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :TargetType,
      comment: "The (meta) class for parameterizable targets.\tInstances of this are instantiated as values of the sh:target property.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Target type".freeze,
      subClassOf: ["rdfs:Class".freeze, "shacl:Parameterizable".freeze],
      type: "rdfs:Class".freeze
    term :TripleRule,
      isDefinedBy: "shacl:".freeze,
      label: "A rule based on triple (subject, predicate, object) pattern.".freeze,
      subClassOf: "shacl:Rule".freeze,
      type: "rdfs:Class".freeze
    term :ValidationReport,
      comment: "The class of SHACL validation reports.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Validation report".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :ValidationResult,
      comment: "The class of validation results.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Validation result".freeze,
      subClassOf: "shacl:AbstractResult".freeze,
      type: "rdfs:Class".freeze
    term :Validator,
      comment: "The class of validators, which provide instructions on how to process a constraint definition. This class serves as base class for the SPARQL-based validators and other possible implementations.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Validator".freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze

    # Property definitions
    property :alternativePath,
      comment: "The (single) value of this property must be a list of path elements, representing the elements of alternative paths.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "alternative path".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :and,
      comment: "RDF list of shapes to validate the value nodes against.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "and".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :annotationProperty,
      comment: "The annotation property that shall be set.".freeze,
      domain: "shacl:ResultAnnotation".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "annotation property".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :annotationValue,
      comment: "The (default) values of the annotation property.".freeze,
      domain: "shacl:ResultAnnotation".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "annotation value".freeze,
      type: "rdf:Property".freeze
    property :annotationVarName,
      comment: "The name of the SPARQL variable from the SELECT clause that shall be used for the values.".freeze,
      domain: "shacl:ResultAnnotation".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "annotation variable name".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :ask,
      comment: "The SPARQL ASK query to execute.".freeze,
      domain: "shacl:SPARQLAskExecutable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "ask".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :class,
      comment: "The type that all value nodes must have.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "class".freeze,
      range: "rdfs:Class".freeze,
      type: "rdf:Property".freeze
    property :closed,
      comment: "If set to true then the shape is closed.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "closed".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :condition,
      comment: "The shapes that the focus nodes need to conform to before a rule is executed on them.".freeze,
      domain: "shacl:Rule".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "condition".freeze,
      range: "shacl:Shape".freeze,
      type: "rdf:Property".freeze
    property :conforms,
      comment: "True if the validation did not produce any validation results, and false otherwise.".freeze,
      domain: "shacl:ValidationReport".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "conforms".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :construct,
      comment: "The SPARQL CONSTRUCT query to execute.".freeze,
      domain: "shacl:SPARQLConstructExecutable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "construct".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :datatype,
      comment: "Specifies an RDF datatype that all value nodes must have.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "datatype".freeze,
      range: "rdfs:Datatype".freeze,
      type: "rdf:Property".freeze
    property :deactivated,
      comment: "If set to true then all nodes conform to this.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "deactivated".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :declare,
      comment: "Links a resource with its namespace prefix declarations.".freeze,
      domain: "owl:Ontology".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "declare".freeze,
      range: "shacl:PrefixDeclaration".freeze,
      type: "rdf:Property".freeze
    property :defaultValue,
      comment: "A default value for a property, for example for user interface tools to pre-populate input fields.".freeze,
      domain: "shacl:PropertyShape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "default value".freeze,
      type: "rdf:Property".freeze
    property :description,
      comment: "Human-readable descriptions for the property in the context of the surrounding shape.".freeze,
      domain: "shacl:PropertyShape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "description".freeze,
      type: "rdf:Property".freeze
    property :detail,
      comment: "Links a result with other results that provide more details, for example to describe violations against nested shapes.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "detail".freeze,
      range: "shacl:AbstractResult".freeze,
      type: "rdf:Property".freeze
    property :disjoint,
      comment: "Specifies a property where the set of values must be disjoint with the value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "disjoint".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :entailment,
      comment: "An entailment regime that indicates what kind of inferencing is required by a shapes graph.".freeze,
      domain: "owl:Ontology".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "entailment".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze
    property :equals,
      comment: "Specifies a property that must have the same values as the value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "equals".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :expression,
      comment: "The node expression that must return true for the value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "expression".freeze,
      type: "rdf:Property".freeze
    property :filterShape,
      comment: "The shape that all input nodes of the expression need to conform to.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "filter shape".freeze,
      range: "shacl:Shape".freeze,
      type: "rdf:Property".freeze
    property :flags,
      comment: "An optional flag to be used with regular expression pattern matching.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "flags".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :focusNode,
      comment: "The focus node that was validated when the result was produced.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "focus node".freeze,
      type: "rdf:Property".freeze
    property :group,
      comment: "Can be used to link to a property group to indicate that a property shape belongs to a group of related property shapes.".freeze,
      domain: "shacl:PropertyShape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "group".freeze,
      range: "shacl:PropertyGroup".freeze,
      type: "rdf:Property".freeze
    property :hasValue,
      comment: "Specifies a value that must be among the value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "has value".freeze,
      type: "rdf:Property".freeze
    property :ignoredProperties,
      comment: "An optional RDF list of properties that are also permitted in addition to those explicitly enumerated via sh:property/sh:path.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "ignored properties".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :in,
      comment: "Specifies a list of allowed values so that each value node must be among the members of the given list.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "in".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :intersection,
      comment: "A list of node expressions that shall be intersected.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "intersection".freeze,
      type: "rdf:Property".freeze
    property :inversePath,
      comment: "The (single) value of this property represents an inverse path (object to subject).".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "inverse path".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze
    property :js,
      comment: "Constraints expressed in JavaScript.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript constraint".freeze,
      range: "shacl:JSConstraint".freeze,
      type: "rdf:Property".freeze
    property :jsFunctionName,
      comment: "The name of the JavaScript function to execute.".freeze,
      domain: "shacl:JSExecutable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript function name".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :jsLibrary,
      comment: "Declares which JavaScript libraries are needed to execute this.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript library".freeze,
      range: "shacl:JSLibrary".freeze,
      type: "rdf:Property".freeze
    property :jsLibraryURL,
      comment: "Declares the URLs of a JavaScript library. This should be the absolute URL of a JavaScript file. Implementations may redirect those to local files.".freeze,
      domain: "shacl:JSLibrary".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript library URL".freeze,
      range: "xsd:anyURI".freeze,
      type: "rdf:Property".freeze
    property :labelTemplate,
      comment: "Outlines how human-readable labels of instances of the associated Parameterizable shall be produced. The values can contain {?paramName} as placeholders for the actual values of the given parameter.".freeze,
      domain: "shacl:Parameterizable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "label template".freeze,
      type: "rdf:Property".freeze
    property :languageIn,
      comment: "Specifies a list of language tags that all value nodes must have.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "language in".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :lessThan,
      comment: "Specifies a property that must have smaller values than the value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "less than".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :lessThanOrEquals,
      comment: "Specifies a property that must have smaller or equal values than the value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "less than or equals".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :maxCount,
      comment: "Specifies the maximum number of values in the set of value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "max count".freeze,
      range: "xsd:integer".freeze,
      type: "rdf:Property".freeze
    property :maxExclusive,
      comment: "Specifies the maximum exclusive value of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "max exclusive".freeze,
      type: "rdf:Property".freeze
    property :maxInclusive,
      comment: "Specifies the maximum inclusive value of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "max inclusive".freeze,
      type: "rdf:Property".freeze
    property :maxLength,
      comment: "Specifies the maximum string length of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "max length".freeze,
      range: "xsd:integer".freeze,
      type: "rdf:Property".freeze
    property :message,
      comment: "A human-readable message (possibly with placeholders for variables) explaining the cause of the result.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "message".freeze,
      type: "rdf:Property".freeze
    property :minCount,
      comment: "Specifies the minimum number of values in the set of value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "min count".freeze,
      range: "xsd:integer".freeze,
      type: "rdf:Property".freeze
    property :minExclusive,
      comment: "Specifies the minimum exclusive value of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "min exclusive".freeze,
      type: "rdf:Property".freeze
    property :minInclusive,
      comment: "Specifies the minimum inclusive value of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "min inclusive".freeze,
      type: "rdf:Property".freeze
    property :minLength,
      comment: "Specifies the minimum string length of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "min length".freeze,
      range: "xsd:integer".freeze,
      type: "rdf:Property".freeze
    property :name,
      comment: "Human-readable labels for the property in the context of the surrounding shape.".freeze,
      domain: "shacl:PropertyShape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "name".freeze,
      type: "rdf:Property".freeze
    property :namespace,
      comment: "The namespace associated with a prefix in a prefix declaration.".freeze,
      domain: "shacl:PrefixDeclaration".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "namespace".freeze,
      range: "xsd:anyURI".freeze,
      type: "rdf:Property".freeze
    property :node,
      comment: "Specifies the node shape that all value nodes must conform to.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "node".freeze,
      range: "shacl:NodeShape".freeze,
      type: "rdf:Property".freeze
    property :nodeKind,
      comment: "Specifies the node kind (e.g. IRI or literal) each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "node kind".freeze,
      range: "shacl:NodeKind".freeze,
      type: "rdf:Property".freeze
    property :nodeValidator,
      comment: "The validator(s) used to evaluate a constraint in the context of a node shape.".freeze,
      domain: "shacl:ConstraintComponent".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "shape validator".freeze,
      range: "shacl:Validator".freeze,
      type: "rdf:Property".freeze
    property :nodes,
      comment: "The node expression producing the input nodes of a filter shape expression.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "nodes".freeze,
      type: "rdf:Property".freeze
    property :not,
      comment: "Specifies a shape that the value nodes must not conform to.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "not".freeze,
      range: "shacl:Shape".freeze,
      type: "rdf:Property".freeze
    property :object,
      comment: "An expression producing the nodes that shall be inferred as objects.".freeze,
      domain: "shacl:TripleRule".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "object".freeze,
      type: "rdf:Property".freeze
    property :oneOrMorePath,
      comment: "The (single) value of this property represents a path that is matched one or more times.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "one or more path".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze
    property :optional,
      comment: "Indicates whether a parameter is optional.".freeze,
      domain: "shacl:Parameter".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "optional".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :or,
      comment: "Specifies a list of shapes so that the value nodes must conform to at least one of the shapes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "or".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :order,
      comment: "Specifies the relative order of this compared to its siblings. For example use 0 for the first, 1 for the second.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "order".freeze,
      type: "rdf:Property".freeze
    property :parameter,
      comment: "The parameters of a function or constraint component.".freeze,
      domain: "shacl:Parameterizable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "parameter".freeze,
      range: "shacl:Parameter".freeze,
      type: "rdf:Property".freeze
    property :path,
      comment: "Specifies the property path of a property shape.".freeze,
      domain: "shacl:PropertyShape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "path".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze
    property :pattern,
      comment: "Specifies a regular expression pattern that the string representations of the value nodes must match.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "pattern".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :predicate,
      comment: "An expression producing the properties that shall be inferred as predicates.".freeze,
      domain: "shacl:TripleRule".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "predicate".freeze,
      type: "rdf:Property".freeze
    property :prefix,
      comment: "The prefix of a prefix declaration.".freeze,
      domain: "shacl:PrefixDeclaration".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "prefix".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :prefixes,
      comment: "The prefixes that shall be applied before parsing the associated SPARQL query.".freeze,
      domain: "shacl:SPARQLExecutable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "prefixes".freeze,
      range: "owl:Ontology".freeze,
      type: "rdf:Property".freeze
    property :property,
      comment: "Links a shape to its property shapes.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "property".freeze,
      range: "shacl:PropertyShape".freeze,
      type: "rdf:Property".freeze
    property :propertyValidator,
      comment: "The validator(s) used to evaluate a constraint in the context of a property shape.".freeze,
      domain: "shacl:ConstraintComponent".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "property validator".freeze,
      range: "shacl:Validator".freeze,
      type: "rdf:Property".freeze
    property :qualifiedMaxCount,
      comment: "The maximum number of value nodes that can conform to the shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "qualified max count".freeze,
      range: "xsd:integer".freeze,
      type: "rdf:Property".freeze
    property :qualifiedMinCount,
      comment: "The minimum number of value nodes that must conform to the shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "qualified min count".freeze,
      range: "xsd:integer".freeze,
      type: "rdf:Property".freeze
    property :qualifiedValueShape,
      comment: "The shape that a specified number of values must conform to.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "qualified value shape".freeze,
      range: "shacl:Shape".freeze,
      type: "rdf:Property".freeze
    property :qualifiedValueShapesDisjoint,
      comment: "Can be used to mark the qualified value shape to be disjoint with its sibling shapes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "qualified value shapes disjoint".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :result,
      comment: "The validation results contained in a validation report.".freeze,
      domain: "shacl:ValidationReport".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "result".freeze,
      range: "shacl:ValidationResult".freeze,
      type: "rdf:Property".freeze
    property :resultAnnotation,
      comment: "Links a SPARQL validator with zero or more sh:ResultAnnotation instances, defining how to derive additional result properties based on the variables of the SELECT query.".freeze,
      domain: "shacl:SPARQLSelectValidator".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "result annotation".freeze,
      range: "shacl:ResultAnnotation".freeze,
      type: "rdf:Property".freeze
    property :resultMessage,
      comment: "Human-readable messages explaining the cause of the result.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "result message".freeze,
      type: "rdf:Property".freeze
    property :resultPath,
      comment: "The path of a validation result, based on the path of the validated property shape.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "result path".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze
    property :resultSeverity,
      comment: "The severity of the result, e.g. warning.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "result severity".freeze,
      range: "shacl:Severity".freeze,
      type: "rdf:Property".freeze
    property :returnType,
      comment: "The expected type of values returned by the associated function.".freeze,
      domain: "shacl:Function".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "return type".freeze,
      range: "rdfs:Class".freeze,
      type: "rdf:Property".freeze
    property :rule,
      comment: "The rules linked to a shape.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "rule".freeze,
      range: "shacl:Rule".freeze,
      type: "rdf:Property".freeze
    property :select,
      comment: "The SPARQL SELECT query to execute.".freeze,
      domain: "shacl:SPARQLSelectExecutable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "select".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :severity,
      comment: "Defines the severity that validation results produced by a shape must have. Defaults to sh:Violation.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "severity".freeze,
      range: "shacl:Severity".freeze,
      type: "rdf:Property".freeze
    property :shapesGraph,
      comment: "Shapes graphs that should be used when validating this data graph.".freeze,
      domain: "owl:Ontology".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "shapes graph".freeze,
      range: "owl:Ontology".freeze,
      type: "rdf:Property".freeze
    property :shapesGraphWellFormed,
      comment: "If true then the validation engine was certain that the shapes graph has passed all SHACL syntax requirements during the validation process.".freeze,
      domain: "shacl:ValidationReport".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "shapes graph well-formed".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :sourceConstraint,
      comment: "The constraint that was validated when the result was produced.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "source constraint".freeze,
      type: "rdf:Property".freeze
    property :sourceConstraintComponent,
      comment: "The constraint component that is the source of the result.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "source constraint component".freeze,
      range: "shacl:ConstraintComponent".freeze,
      type: "rdf:Property".freeze
    property :sourceShape,
      comment: "The shape that is was validated when the result was produced.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "source shape".freeze,
      range: "shacl:Shape".freeze,
      type: "rdf:Property".freeze
    property :sparql,
      comment: "Links a shape with SPARQL constraints.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "constraint (in SPARQL)".freeze,
      range: "shacl:SPARQLConstraint".freeze,
      type: "rdf:Property".freeze
    property :subject,
      comment: "An expression producing the resources that shall be inferred as subjects.".freeze,
      domain: "shacl:TripleRule".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "subject".freeze,
      type: "rdf:Property".freeze
    property :suggestedShapesGraph,
      comment: "Suggested shapes graphs for this ontology. The values of this property may be used in the absence of specific sh:shapesGraph statements.".freeze,
      domain: "owl:Ontology".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "suggested shapes graph".freeze,
      range: "owl:Ontology".freeze,
      type: "rdf:Property".freeze
    property :target,
      comment: "Links a shape to a target specified by an extension language, for example instances of sh:SPARQLTarget.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "target".freeze,
      range: "shacl:Target".freeze,
      type: "rdf:Property".freeze
    property :targetClass,
      comment: "Links a shape to a class, indicating that all instances of the class must conform to the shape.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "target class".freeze,
      range: "rdfs:Class".freeze,
      type: "rdf:Property".freeze
    property :targetNode,
      comment: "Links a shape to individual nodes, indicating that these nodes must conform to the shape.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "target node".freeze,
      type: "rdf:Property".freeze
    property :targetObjectsOf,
      comment: "Links a shape to a property, indicating that all all objects of triples that have the given property as their predicate must conform to the shape.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "target objects of".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :targetSubjectsOf,
      comment: "Links a shape to a property, indicating that all subjects of triples that have the given property as their predicate must conform to the shape.".freeze,
      domain: "shacl:Shape".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "target subjects of".freeze,
      range: "rdf:Property".freeze,
      type: "rdf:Property".freeze
    property :union,
      comment: "A list of node expressions that shall be used together.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "union".freeze,
      type: "rdf:Property".freeze
    property :uniqueLang,
      comment: "Specifies whether all node values must have a unique (or no) language tag.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "unique languages".freeze,
      range: "xsd:boolean".freeze,
      type: "rdf:Property".freeze
    property :update,
      comment: "The SPARQL UPDATE to execute.".freeze,
      domain: "shacl:SPARQLUpdateExecutable".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "update".freeze,
      range: "xsd:string".freeze,
      type: "rdf:Property".freeze
    property :validator,
      comment: "The validator(s) used to evaluate constraints of either node or property shapes.".freeze,
      domain: "shacl:ConstraintComponent".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "validator".freeze,
      range: "shacl:Validator".freeze,
      type: "rdf:Property".freeze
    property :value,
      comment: "An RDF node that has caused the result.".freeze,
      domain: "shacl:AbstractResult".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "value".freeze,
      type: "rdf:Property".freeze
    property :xone,
      comment: "Specifies a list of shapes so that the value nodes must conform to exactly one of the shapes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "exactly one".freeze,
      range: "rdf:List".freeze,
      type: "rdf:Property".freeze
    property :zeroOrMorePath,
      comment: "The (single) value of this property represents a path that is matched zero or more times.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "zero or more path".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze
    property :zeroOrOnePath,
      comment: "The (single) value of this property represents a path that is matched zero or one times.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "zero or one path".freeze,
      range: "rdfs:Resource".freeze,
      type: "rdf:Property".freeze

    # Extra definitions
    term :AndConstraintComponent,
      comment: "A constraint component that can be used to test whether a value node conforms to all members of a provided list of shapes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "And constraint component".freeze,
      "shacl:parameter": "shacl:AndConstraintComponent-and".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"AndConstraintComponent-and",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:and".freeze,
      type: "shacl:Parameter".freeze
    term :BlankNode,
      comment: "The node kind of all blank nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Blank node".freeze,
      type: "shacl:NodeKind".freeze
    term :BlankNodeOrIRI,
      comment: "The node kind of all blank nodes or IRIs.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Blank node or IRI".freeze,
      type: "shacl:NodeKind".freeze
    term :BlankNodeOrLiteral,
      comment: "The node kind of all blank nodes or literals.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Blank node or literal".freeze,
      type: "shacl:NodeKind".freeze
    term :ClassConstraintComponent,
      comment: "A constraint component that can be used to verify that each value node is an instance of a given type.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Class constraint component".freeze,
      "shacl:parameter": "shacl:ClassConstraintComponent-class".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"ClassConstraintComponent-class",
      isDefinedBy: "shacl:".freeze,
      "shacl:nodeKind": "shacl:IRI".freeze,
      "shacl:path": "shacl:class".freeze,
      type: "shacl:Parameter".freeze
    term :ClosedConstraintComponent,
      comment: "A constraint component that can be used to indicate that focus nodes must only have values for those properties that have been explicitly enumerated via sh:property/sh:path.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Closed constraint component".freeze,
      "shacl:parameter": ["shacl:ClosedConstraintComponent-closed".freeze, "shacl:ClosedConstraintComponent-ignoredProperties".freeze],
      type: "shacl:ConstraintComponent".freeze
    term :"ClosedConstraintComponent-closed",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:boolean".freeze,
      "shacl:path": "shacl:closed".freeze,
      type: "shacl:Parameter".freeze
    term :"ClosedConstraintComponent-ignoredProperties",
      isDefinedBy: "shacl:".freeze,
      "shacl:optional": "true".freeze,
      "shacl:path": "shacl:ignoredProperties".freeze,
      type: "shacl:Parameter".freeze
    term :DatatypeConstraintComponent,
      comment: "A constraint component that can be used to restrict the datatype of all value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Datatype constraint component".freeze,
      "shacl:parameter": "shacl:DatatypeConstraintComponent-datatype".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"DatatypeConstraintComponent-datatype",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:nodeKind": "shacl:IRI".freeze,
      "shacl:path": "shacl:datatype".freeze,
      type: "shacl:Parameter".freeze
    term :DisjointConstraintComponent,
      comment: "A constraint component that can be used to verify that the set of value nodes is disjoint with the the set of nodes that have the focus node as subject and the value of a given property as predicate.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Disjoint constraint component".freeze,
      "shacl:parameter": "shacl:DisjointConstraintComponent-disjoint".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"DisjointConstraintComponent-disjoint",
      isDefinedBy: "shacl:".freeze,
      "shacl:nodeKind": "shacl:IRI".freeze,
      "shacl:path": "shacl:disjoint".freeze,
      type: "shacl:Parameter".freeze
    term :EqualsConstraintComponent,
      comment: "A constraint component that can be used to verify that the set of value nodes is equal to the set of nodes that have the focus node as subject and the value of a given property as predicate.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Equals constraint component".freeze,
      "shacl:parameter": "shacl:EqualsConstraintComponent-equals".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"EqualsConstraintComponent-equals",
      isDefinedBy: "shacl:".freeze,
      "shacl:nodeKind": "shacl:IRI".freeze,
      "shacl:path": "shacl:equals".freeze,
      type: "shacl:Parameter".freeze
    term :ExpressionConstraintComponent,
      comment: "A constraint component that can be used to verify that a given node expression produces true for all value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Expression constraint component".freeze,
      "shacl:parameter": "shacl:ExpressionConstraintComponent-expression".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"ExpressionConstraintComponent-expression",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:expression".freeze,
      type: "shacl:Parameter".freeze
    term :HasValueConstraintComponent,
      comment: "A constraint component that can be used to verify that one of the value nodes is a given RDF node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Has-value constraint component".freeze,
      "shacl:parameter": "shacl:HasValueConstraintComponent-hasValue".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"HasValueConstraintComponent-hasValue",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:hasValue".freeze,
      type: "shacl:Parameter".freeze
    term :IRI,
      comment: "The node kind of all IRIs.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "IRI".freeze,
      type: "shacl:NodeKind".freeze
    term :IRIOrLiteral,
      comment: "The node kind of all IRIs or literals.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "IRI or literal".freeze,
      type: "shacl:NodeKind".freeze
    term :InConstraintComponent,
      comment: "A constraint component that can be used to exclusively enumerate the permitted value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "In constraint component".freeze,
      "shacl:parameter": "shacl:InConstraintComponent-in".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"InConstraintComponent-in",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:in".freeze,
      type: "shacl:Parameter".freeze
    term :Info,
      comment: "The severity for an informational validation result.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Info".freeze,
      type: "shacl:Severity".freeze
    term :"JSConstraint-js",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:js".freeze,
      type: "shacl:Parameter".freeze
    term :JSConstraintComponent,
      comment: "A constraint component with the parameter sh:js linking to a sh:JSConstraint containing a sh:script.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "JavaScript constraint component".freeze,
      "shacl:parameter": "shacl:JSConstraint-js".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :LanguageInConstraintComponent,
      comment: "A constraint component that can be used to enumerate language tags that all value nodes must have.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Language-in constraint component".freeze,
      "shacl:parameter": "shacl:LanguageInConstraintComponent-languageIn".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"LanguageInConstraintComponent-languageIn",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:languageIn".freeze,
      type: "shacl:Parameter".freeze
    term :LessThanConstraintComponent,
      comment: "A constraint component that can be used to verify that each value node is smaller than all the nodes that have the focus node as subject and the value of a given property as predicate.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Less-than constraint component".freeze,
      "shacl:parameter": "shacl:LessThanConstraintComponent-lessThan".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"LessThanConstraintComponent-lessThan",
      isDefinedBy: "shacl:".freeze,
      "shacl:nodeKind": "shacl:IRI".freeze,
      "shacl:path": "shacl:lessThan".freeze,
      type: "shacl:Parameter".freeze
    term :LessThanOrEqualsConstraintComponent,
      comment: "A constraint component that can be used to verify that every value node is smaller than all the nodes that have the focus node as subject and the value of a given property as predicate.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "less-than-or-equals constraint component".freeze,
      "shacl:parameter": "shacl:LessThanOrEqualsConstraintComponent-lessThanOrEquals".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"LessThanOrEqualsConstraintComponent-lessThanOrEquals",
      isDefinedBy: "shacl:".freeze,
      "shacl:nodeKind": "shacl:IRI".freeze,
      "shacl:path": "shacl:lessThanOrEquals".freeze,
      type: "shacl:Parameter".freeze
    term :Literal,
      comment: "The node kind of all literals.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Literal".freeze,
      type: "shacl:NodeKind".freeze
    term :MaxCountConstraintComponent,
      comment: "A constraint component that can be used to restrict the maximum number of value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Max-count constraint component".freeze,
      "shacl:parameter": "shacl:MaxCountConstraintComponent-maxCount".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MaxCountConstraintComponent-maxCount",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:integer".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:maxCount".freeze,
      type: "shacl:Parameter".freeze
    term :MaxExclusiveConstraintComponent,
      comment: "A constraint component that can be used to restrict the range of value nodes with a maximum exclusive value.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Max-exclusive constraint component".freeze,
      "shacl:parameter": "shacl:MaxExclusiveConstraintComponent-maxExclusive".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MaxExclusiveConstraintComponent-maxExclusive",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:nodeKind": "shacl:Literal".freeze,
      "shacl:path": "shacl:maxExclusive".freeze,
      type: "shacl:Parameter".freeze
    term :MaxInclusiveConstraintComponent,
      comment: "A constraint component that can be used to restrict the range of value nodes with a maximum inclusive value.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Max-inclusive constraint component".freeze,
      "shacl:parameter": "shacl:MaxInclusiveConstraintComponent-maxInclusive".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MaxInclusiveConstraintComponent-maxInclusive",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:nodeKind": "shacl:Literal".freeze,
      "shacl:path": "shacl:maxInclusive".freeze,
      type: "shacl:Parameter".freeze
    term :MaxLengthConstraintComponent,
      comment: "A constraint component that can be used to restrict the maximum string length of value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Max-length constraint component".freeze,
      "shacl:parameter": "shacl:MaxLengthConstraintComponent-maxLength".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MaxLengthConstraintComponent-maxLength",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:integer".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:maxLength".freeze,
      type: "shacl:Parameter".freeze
    term :MinCountConstraintComponent,
      comment: "A constraint component that can be used to restrict the minimum number of value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Min-count constraint component".freeze,
      "shacl:parameter": "shacl:MinCountConstraintComponent-minCount".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MinCountConstraintComponent-minCount",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:integer".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:minCount".freeze,
      type: "shacl:Parameter".freeze
    term :MinExclusiveConstraintComponent,
      comment: "A constraint component that can be used to restrict the range of value nodes with a minimum exclusive value.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Min-exclusive constraint component".freeze,
      "shacl:parameter": "shacl:MinExclusiveConstraintComponent-minExclusive".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MinExclusiveConstraintComponent-minExclusive",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:nodeKind": "shacl:Literal".freeze,
      "shacl:path": "shacl:minExclusive".freeze,
      type: "shacl:Parameter".freeze
    term :MinInclusiveConstraintComponent,
      comment: "A constraint component that can be used to restrict the range of value nodes with a minimum inclusive value.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Min-inclusive constraint component".freeze,
      "shacl:parameter": "shacl:MinInclusiveConstraintComponent-minInclusive".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MinInclusiveConstraintComponent-minInclusive",
      isDefinedBy: "shacl:".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:nodeKind": "shacl:Literal".freeze,
      "shacl:path": "shacl:minInclusive".freeze,
      type: "shacl:Parameter".freeze
    term :MinLengthConstraintComponent,
      comment: "A constraint component that can be used to restrict the minimum string length of value nodes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Min-length constraint component".freeze,
      "shacl:parameter": "shacl:MinLengthConstraintComponent-minLength".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"MinLengthConstraintComponent-minLength",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:integer".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:minLength".freeze,
      type: "shacl:Parameter".freeze
    term :NodeConstraintComponent,
      comment: "A constraint component that can be used to verify that all value nodes conform to the given node shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Node constraint component".freeze,
      "shacl:parameter": "shacl:NodeConstraintComponent-node".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"NodeConstraintComponent-node",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:node".freeze,
      type: "shacl:Parameter".freeze
    term :NodeKindConstraintComponent,
      comment: "A constraint component that can be used to restrict the RDF node kind of each value node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Node-kind constraint component".freeze,
      "shacl:parameter": "shacl:NodeKindConstraintComponent-nodeKind".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"NodeKindConstraintComponent-nodeKind",
      isDefinedBy: "shacl:".freeze,
      "shacl:in": list("shacl:BlankNode".freeze, "shacl:IRI".freeze, "shacl:Literal".freeze, "shacl:BlankNodeOrIRI".freeze, "shacl:BlankNodeOrLiteral".freeze, "shacl:IRIOrLiteral".freeze),
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:nodeKind".freeze,
      type: "shacl:Parameter".freeze
    term :NotConstraintComponent,
      comment: "A constraint component that can be used to verify that value nodes do not conform to a given shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Not constraint component".freeze,
      "shacl:parameter": "shacl:NotConstraintComponent-not".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"NotConstraintComponent-not",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:not".freeze,
      type: "shacl:Parameter".freeze
    term :OrConstraintComponent,
      comment: "A constraint component that can be used to restrict the value nodes so that they conform to at least one out of several provided shapes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Or constraint component".freeze,
      "shacl:parameter": "shacl:OrConstraintComponent-or".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"OrConstraintComponent-or",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:or".freeze,
      type: "shacl:Parameter".freeze
    term :PatternConstraintComponent,
      comment: "A constraint component that can be used to verify that every value node matches a given regular expression.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Pattern constraint component".freeze,
      "shacl:parameter": ["shacl:PatternConstraintComponent-flags".freeze, "shacl:PatternConstraintComponent-pattern".freeze],
      type: "shacl:ConstraintComponent".freeze
    term :"PatternConstraintComponent-flags",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:string".freeze,
      "shacl:optional": "true".freeze,
      "shacl:path": "shacl:flags".freeze,
      type: "shacl:Parameter".freeze
    term :"PatternConstraintComponent-pattern",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:string".freeze,
      "shacl:path": "shacl:pattern".freeze,
      type: "shacl:Parameter".freeze
    term :PropertyConstraintComponent,
      comment: "A constraint component that can be used to verify that all value nodes conform to the given property shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Property constraint component".freeze,
      "shacl:parameter": "shacl:PropertyConstraintComponent-property".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"PropertyConstraintComponent-property",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:property".freeze,
      type: "shacl:Parameter".freeze
    term :QualifiedMaxCountConstraintComponent,
      comment: "A constraint component that can be used to verify that a specified maximum number of value nodes conforms to a given shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Qualified-max-count constraint component".freeze,
      "shacl:parameter": ["shacl:QualifiedMaxCountConstraintComponent-qualifiedMaxCount".freeze, "shacl:QualifiedMaxCountConstraintComponent-qualifiedValueShape".freeze, "shacl:QualifiedMaxCountConstraintComponent-qualifiedValueShapesDisjoint".freeze],
      type: "shacl:ConstraintComponent".freeze
    term :"QualifiedMaxCountConstraintComponent-qualifiedMaxCount",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:integer".freeze,
      "shacl:path": "shacl:qualifiedMaxCount".freeze,
      type: "shacl:Parameter".freeze
    term :"QualifiedMaxCountConstraintComponent-qualifiedValueShape",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:qualifiedValueShape".freeze,
      type: "shacl:Parameter".freeze
    term :"QualifiedMaxCountConstraintComponent-qualifiedValueShapesDisjoint",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:boolean".freeze,
      "shacl:optional": "true".freeze,
      "shacl:path": "shacl:qualifiedValueShapesDisjoint".freeze,
      type: "shacl:Parameter".freeze
    term :QualifiedMinCountConstraintComponent,
      comment: "A constraint component that can be used to verify that a specified minimum number of value nodes conforms to a given shape.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Qualified-min-count constraint component".freeze,
      "shacl:parameter": ["shacl:QualifiedMinCountConstraintComponent-qualifiedMinCount".freeze, "shacl:QualifiedMinCountConstraintComponent-qualifiedValueShape".freeze, "shacl:QualifiedMinCountConstraintComponent-qualifiedValueShapesDisjoint".freeze],
      type: "shacl:ConstraintComponent".freeze
    term :"QualifiedMinCountConstraintComponent-qualifiedMinCount",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:integer".freeze,
      "shacl:path": "shacl:qualifiedMinCount".freeze,
      type: "shacl:Parameter".freeze
    term :"QualifiedMinCountConstraintComponent-qualifiedValueShape",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:qualifiedValueShape".freeze,
      type: "shacl:Parameter".freeze
    term :"QualifiedMinCountConstraintComponent-qualifiedValueShapesDisjoint",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:boolean".freeze,
      "shacl:optional": "true".freeze,
      "shacl:path": "shacl:qualifiedValueShapesDisjoint".freeze,
      type: "shacl:Parameter".freeze
    term :SPARQLConstraintComponent,
      comment: "A constraint component that can be used to define constraints based on SPARQL queries.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "SPARQL constraint component".freeze,
      "shacl:parameter": "shacl:SPARQLConstraintComponent-sparql".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"SPARQLConstraintComponent-sparql",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:sparql".freeze,
      type: "shacl:Parameter".freeze
    term :UniqueLangConstraintComponent,
      comment: "A constraint component that can be used to specify that no pair of value nodes may use the same language tag.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Unique-languages constraint component".freeze,
      "shacl:parameter": "shacl:UniqueLangConstraintComponent-uniqueLang".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"UniqueLangConstraintComponent-uniqueLang",
      isDefinedBy: "shacl:".freeze,
      "shacl:datatype": "xsd:boolean".freeze,
      "shacl:maxCount": "1".freeze,
      "shacl:path": "shacl:uniqueLang".freeze,
      type: "shacl:Parameter".freeze
    term :Violation,
      comment: "The severity for a violation validation result.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Violation".freeze,
      type: "shacl:Severity".freeze
    term :Warning,
      comment: "The severity for a warning validation result.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Warning".freeze,
      type: "shacl:Severity".freeze
    term :XoneConstraintComponent,
      comment: "A constraint component that can be used to restrict the value nodes so that they conform to exactly one out of several provided shapes.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "Exactly one constraint component".freeze,
      "shacl:parameter": "shacl:XoneConstraintComponent-xone".freeze,
      type: "shacl:ConstraintComponent".freeze
    term :"XoneConstraintComponent-xone",
      isDefinedBy: "shacl:".freeze,
      "shacl:path": "shacl:xone".freeze,
      type: "shacl:Parameter".freeze
    term :this,
      comment: "A node expression that represents the current focus node.".freeze,
      isDefinedBy: "shacl:".freeze,
      label: "this".freeze,
      type: "rdfs:Resource".freeze
  end
end
