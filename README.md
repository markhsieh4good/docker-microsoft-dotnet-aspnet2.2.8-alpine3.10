# microsoft-dotnet-aspnet
```bash
6.0.15-alpine3.17-amd64
```
## install packages
```bash 
--no-cache:
  procps net-tools bash tzdata git
--upgrade: 
  supervisor
```

## default CMD & Expose
```bash
EXPOSE 

CMD [supervisord]

```
