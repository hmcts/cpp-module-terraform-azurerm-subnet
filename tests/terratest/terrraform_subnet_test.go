package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)


func TestTerraformSubnet(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./example",
		VarFiles: []string{"subnet.tfvars"},
		Upgrade: true,
	}

	// Defer the destroy to cleanup all created resources
    defer terraform.Destroy(t, terraformOptions)

	// This will init and apply the resources and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Verify configurations
    string := terraform.Output(t, terraformOptions, "subnet_id")
	if len(string) <= 0 {
		t.Fatal("Wrong output")
	}
}
