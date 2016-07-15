
@log = console.log.bind console

@isProductionMode = -> process.env.NODE_ENV == "production"
