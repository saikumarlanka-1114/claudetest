## Build & test
- Build: dotnet build <solution>.sln
- Test: dotnet test --filter "FullyQualifiedName~<Namespace>"
- Run: <how you run it locally>

## Conventions
- .NET version: <net6 / net8 ...>
- async/await everywhere; no .Result / .Wait()
- DI via <framework>; tests use <xUnit/NUnit/MSTest> + <Moq/NSubstitute>
- Don't hand-edit generated code, migrations or *.Designer.cs
- Branch naming / commit style: <yours>
