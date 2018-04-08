# DemoGraphQL
If you don't know about [GraphQL](http://graphql.org/), you might have some reseach about it. Because I think It's a future tech.
Of course you can easy to find how to install and run it in office website. But if you follow my instruction. It should be easier.

# Resources
1. Schema file (You can ask backend developer who will provide you this file)

# Installation
I used the Apollo framework for this demo

## Add Apollo framework by Cocoapods
```
pod "Apollo"
```

## Adding a code generation build step

This is most important step. 
> The script above will invoke apollo-codegen through the check-and-run-apollo-codegen.sh wrapper script, which is actually contained in the Apollo.framework bundle. The main reason for this is to check whether the version of apollo-codegen installed on your system is compatible with the framework version installed in your project, and to warn you if it isn’t. Without this check, you could end up generating code that is incompatible with the runtime code contained in the framework.

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script, change its name to “Generate Apollo GraphQL API” and drag it just above “Compile Sources”. Then add the following contents to the script area below the shell:

```
APOLLO_FRAMEWORK_PATH="$(eval find $FRAMEWORK_SEARCH_PATHS -name "Apollo.framework" -maxdepth 1)"

if [ -z "$APOLLO_FRAMEWORK_PATH" ]; then
  echo "error: Couldn't find Apollo.framework in FRAMEWORK_SEARCH_PATHS; make sure to add the framework to your project."
  exit 1
fi

cd "${SRCROOT}/${TARGET_NAME}"
$APOLLO_FRAMEWORK_PATH/check-and-run-apollo-codegen.sh generate $(find . -name '*.graphql') --schema schema.json --output API.swift
```

## Adding a schema file

Apollo iOS requires a GraphQL schema file as input to the code generation process. A schema file is a JSON file that contains the results of an an introspection query. Conventionally this file is called schema.json.

If you haven't schema file, you will get a build error such as:

```
Cannot find GraphQL schema file […]
```

## Build

## Adding the generated API file to your target

Drag the generated API.swift file to your target.

## Create .graphql files with your queries or mutations

Apollo iOS generates code from queries and mutations contained in .graphql files in your target.

A useful convention is to colocate queries, mutations or fragments with the Swift code that uses them by creating <name>.graphql next to <name>.swift.

If you have the Xcode add-ons installed, you can use the Xcode companion view to show a .swift file and the corresponding .graphql file side by side.
