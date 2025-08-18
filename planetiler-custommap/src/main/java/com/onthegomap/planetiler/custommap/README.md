# Maptiler Custom Map / Configured Map

## ConfiguredMapMain class

### main()

The program's `main` function when invoked in Custom Map / Configured Map mode.

1. Creaate a Java object of the schema from file or use one of the builtin eample schemas
2. Build a root context given the runtime parameters.
3. Create a Planetiler with that context
4. Create a ConfiguredProfile using the schema and the context
5. Set the Planetiler profile as that profile
6. Configure the Planetiler sources according to the profile/schema sources
7. UNCLEAR: `planetiler.overwriteOutput(Path.of("data", "output.mbtiles"))`
8. Run planetiler

### configureSource()

## ConfiguredProfile class

### ConfiguredProfile()

Parameters: schema and the context

1. Store schema layers in `layers` collection
2. Initialize `tagValueProducer`    [???]
3. Initialize an empty `configuredFeatureEntries` list
4. For each layer in the schema
   1. Store its definition in `layersById` map
   2. For each feature in the layer
      1. Create a `configuredFeature` using the schema's feature, layerId, root context and tagValueProducer
      2. Create an entry for the featurs's match expressions and add it to `configuredFeatureEntries` list
5. Create `featureLayerMatcher`

## processFeature()

Overides the Profile's default

Given a source feature
1. Create a new context that combined the root context with `tagValueProducer`
2. Using `tagValueProducer`, find all layer's `ConfiguredFeature`s that match
3. For each layer feature
   1. Create a post-match context
   2. Execute `processFeature` for the feature using the post-match context

## postProcessLayerFeatures()

Overides the Profile's default

Given a layer name, a zoom, and a list of tile features
Apply line merge and polygon merge post-processing, if applicable.

# [ConfiguredFeature class](./ConfiguredProfile.java)

A map feature, configured from a YML configuration file

## matchExpression()

Returns a filtering expression to limit input elements to ones this feature cares about

## processFeature()

Processes matching elements
