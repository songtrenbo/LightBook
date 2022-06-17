using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using lightbook_shared.Dtos.AuthorDtos;

namespace lightbook_backend_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorController : ControllerBase
    {
        private readonly IAuthorService _authorService;
        public AuthorController(IAuthorService authorService){
            _authorService = authorService;
        }
        [HttpGet]
        public async Task<ActionResult<PagedResponseModel<AuthorDto>>> GetAuthors([FromQuery] AuthorQueryCriteria authorQueryCriteria, CancellationToken cancellationToken)
        {
            var response = await _authorService.GetByPageAsync(authorQueryCriteria, cancellationToken);

            return Ok(response);
        }
        [HttpPost]
        [Authorize(Roles="Admin")]
        public async Task<ActionResult> CreateAuthor([FromBody]AuthorDto authorDto){
            if(authorDto ==null){
                return BadRequest();
            }
            else {
                var createAuthor = await _authorService.PostAuthor(authorDto);
                if(createAuthor==null){
                    return BadRequest();
                }
                return Ok(createAuthor);
            }
        }
        [HttpPut]
        [Authorize(Roles="Admin")]
        public async Task<ActionResult> EditAuthor([FromBody]AuthorDto authorDto){
            if(authorDto ==null){
                return BadRequest();
            }
            else {
                var createAuthor = await _authorService.PutAuthor(authorDto);
                if(createAuthor==null){
                    return BadRequest();
                }
                return Ok(createAuthor);
            }
        }
    }
}