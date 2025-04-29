using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace WebApplication1.Filters
{
    public class FileUploadOperationFilter : IOperationFilter
    {
        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            if (context.ApiDescription.ActionDescriptor.Parameters
                .Any(p => p.ParameterType == typeof(IFormFile)))
            {
                operation.RequestBody = new OpenApiRequestBody
                {
                    Content = { ["multipart/form-data"] = new OpenApiMediaType
                {
                    Schema = new OpenApiSchema { Type = "object" }
                }}
                };
            }
        }
    }
}
