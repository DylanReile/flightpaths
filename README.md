## API Specs
The API accepts a json-encoded post request to its /flightpaths endpoint. The post body must include an array of ticket arrays that each contain two strings, an airport source and an airport destination. The response will be a json-encoded array containing two strings, the initial departure airport and the final arrival airport.

The following curl would return `["SFO","EWR"]`:

`curl -H "Content-type: application/json" -d '{"tickets": [["IND", "EWR"], ["SFO", "ATL"], ["GSO", "IND"], ["ATL", "GSO"]]}' localhost:3000/flightpaths`

## Estimation
This project took an hour to write including documentation and tests.

## Story

 There are over 100,000 flights a day, with millions of people and cargo being transferred around the world. With so many people, and different carrier/agency groups it can be hard to track where a person might be. In order to determine the flight path of a person, we must sort through all of their flight records.

## Goal
To create a microservice API that can help us understand and track how a particular person flight path. The API should accept a request that includes a list of flights, which are defined by a source and destination airport code. These flights may not be listed in order and will need to be sorted to find the total flight paths starting and ending airports.

## Examples
[['SFO', 'EWR']] => ['SFO', 'EWR']

[['ATL', 'EWR'], ['SFO', 'ATL']] => ['SFO', 'EWR']

[['IND', 'EWR'], ['SFO', 'ATL'], ['GSO', 'IND'], ['ATL', 'GSO']] => ['SFO', 'EWR']
