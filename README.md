jcowie-magento Cookbook
=======================
Light weight Magento cookbook. It will install Magento and sample data

Requirements
------------
N98-magerun cookbook - Required so Magento can be installed

Attributes
----------

#### jcowie-magento::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jcowie-magento']['webapp']['name']</tt></td>
    <td>String</td>
    <td>Web application name / url</td>
    <td><tt>magento.local</tt></td>
  </tr>
  <tr>
    <td><tt>['jcowie-magento']['webapp']['server_alias']</tt></td>
    <td>String</td>
    <td>Web application server alias</td>
    <td><tt>magento.local</tt></td>
  </tr>

  <tr>
    <td><tt>['jcowie-magento']['magento']['sample_data']</tt></td>
    <td>String</td>
    <td>Install Magento with sample data</td>
    <td><tt>yes</tt></td>
  </tr>
  <tr>
    <td><tt>['jcowie-magento']['magento']['version']</tt></td>
    <td>String</td>
    <td>Install named version of Magento</td>
    <td><tt>magento-ce-1.7.0.2</tt></td>
  </tr>
</table>

Usage
-----
#### jcowie-magento::default

Just include `jcowie-magento` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jcowie-magento]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: James Cowie
