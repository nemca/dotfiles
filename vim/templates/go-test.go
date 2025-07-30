package %:t:r

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test(t *testing.T) {
	type args struct {
	}

	tests := []struct {
		name string
		args args
		want
	}{
		{
			name: "example 1",
			args: args{},
			want: ,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			assert.Equal(t, tt.want, CHANGEME(tt.args))
		})
	}
}
