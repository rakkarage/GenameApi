using Microsoft.AspNetCore.Mvc;
using ca.HenrySoftware;
namespace GenameApi.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class NamesController : ControllerBase
	{
		// GET api/values
		private Gename _gename = new Gename();
		public string Name => _gename.Name();
		[HttpGet]
		public ActionResult<string> Get()
		{
			return Name;
		}
		// GET api/values/5
		[HttpGet("{sex=.5}/{generated=.5}/{pre=.333}/{vowel=.8}/{middle0=.3}/{middle1=.1}/{post=.22}")]
		public ActionResult<string> Get(
			double sex = .5,
			double generated = .5,
			double pre = .333,
			double vowel = .8,
			double middle0 = .3,
			double middle1 = .1,
			double post = .22)
		{
			return _gename.Name(sex, generated, pre, vowel, middle0, middle1, post);
		}
	}
}
