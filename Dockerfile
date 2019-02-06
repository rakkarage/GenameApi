FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /app

COPY ./GenameApi.sln ./
COPY ./GenameApi/GenameApi.csproj ./GenameApi/
COPY ./Gename/Gename.csproj ./Gename/
RUN dotnet restore ./GenameApi/TestGename.csproj

COPY . ./
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.2-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/GenameApi/out ./
ENTRYPOINT ["dotnet", "GenameApi.dll"]
