FROM inwt/r-shiny:3.5.1

ADD . .

RUN installPackage

CMD ["Rscript", "-e", "library(shiny);INWTdbMonitor::startApplication()"]