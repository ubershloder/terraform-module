provider "aws" {
region = "eu-central-1"

}

module "webserver_module" {
source = ""
}
