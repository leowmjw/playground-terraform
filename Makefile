# build config
# Courtesy of: https://www.cmcrossroads.com/article/setting-makefile-variable-outside-makefile
TF_VERSION=0.11.7
TF_VERSION_TERRAGRUNT=0.16.5
# TF_VERSION_TERRATEST=

setup:
	# Binaries are here ...
	# https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_darwin_amd64.zip
	# https://github.com/gruntwork-io/terragrunt/releases/download/v0.16.5/terragrunt_darwin_amd64
	echo "Setting up Terraform + Terragrunt `pwd`!!!"

	echo "Downloading Terraform ${TF_VERSION}"
	cd bin && touch terraform && rm terraform* && \
	  curl -L -O "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_darwin_amd64.zip" && \
	  unzip terraform_${TF_VERSION}_darwin_amd64.zip

	echo "Downloading Terragrunt ${TF_VERSION_TERRAGRUNT}"
	cd bin && touch terragrunt && rm terragrunt* && \
	  curl -L -O "https://github.com/gruntwork-io/terragrunt/releases/download/v${TF_VERSION_TERRAGRUNT}/terragrunt_${TF_VERSION_TERRAGRUNT}_darwin_amd64" && \
	  mv terragrunt_${TF_VERSION_TERRAGRUNT}_darwin_amd64 terragrunt && chmod +x terragrunt

	# echo "Downloading Terratest ${NOMAD_BOX_VERSION_TERRAFORM}"
	# cd bin && touch terraform && rm terraform* && \
	#   curl -L -O "https://releases.hashicorp.com/terraform/${NOMAD_BOX_VERSION_TERRAFORM}/terraform_${NOMAD_BOX_VERSION_TERRAFORM}_linux_amd64.zip" && \
	#   unzip terraform_${NOMAD_BOX_VERSION_TERRAFORM}_linux_amd64.zip

.PHONY: setup
