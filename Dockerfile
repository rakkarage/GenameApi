FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["GenameApi/GenameApi.csproj", "GenameApi/"]
RUN dotnet restore "GenameApi/GenameApi.csproj"
COPY . .
WORKDIR /src/GenameApi
RUN dotnet build "GenameApi.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "GenameApi.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "GenameApi.dll"]
