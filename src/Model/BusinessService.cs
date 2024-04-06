
public class BusinessService
{
    private List<Business> _businesses;

    public BusinessService()
    {
        _businesses = new List<Business>();
        // Initialize businesses from data source - call a method to load data from file.
    }

    public List<Business> GetAllBusinesses()
    {
        return _businesses;
    }

    public Business GetBusinessById(int id)
    {
        return _businesses.FirstOrDefault(b => b.Id == id);
    }

    public void AddBusiness(string name, string description, string category, string logo, string banner, string phoneNumber, string email, string website, string address, DateTime createdAt)
    {
        BusinessModel business = new BusinessModel(_getNextId(), name, description, category, logo, banner, phoneNumber, email, website, address, createdAt);
        _businesses.Add(business);
    }

    public void UpdateBusiness(BusinessModel business)
    {
        var existingBusiness = _businesses.FirstOrDefault(b => b.Id == business.Id);
        if (existingBusiness != null)
        {
            existingBusiness.SetName(business.Name);
            existingBusiness.SetDescription(business.Description);
            existingBusiness.SetCategory(business.Category);
            existingBusiness.SetLogo(business.Logo);
            existingBusiness.SetBanner(business.Banner);
            existingBusiness.SetPhoneNumber(business.PhoneNumber);
            existingBusiness.SetEmail(business.Email);
            existingBusiness.SetWebsite(business.Website);
            existingBusiness.SetAddress(business.Address);

        }
    }

    public void DeleteBusiness(int id)
    {
        var businessToRemove = _businesses.FirstOrDefault(b => b.Id == id);
        if (businessToRemove != null)
        {
            _businesses.Remove(businessToRemove);
        }
    }

    private int _getNextId()
    {
        return _businesses.Count > 0 ? _businesses.Max(b => b.Id) + 1 : 1;
    }
}
