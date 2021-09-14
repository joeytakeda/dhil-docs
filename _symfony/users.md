---
layout: default
title: User Management
---

# User Management

This document explains the process for adding, updating, and removing users
from a Symfony application.

Our project PIs do not have access to manage users. SFU IT's security policy 
requires all user management be done by IT staff or developers. 

In default, unstyled, Symfony applications the user menu is located in the
top-right corner of every web page. If you are not logged in, the menu will
be hidden and "Login" will be displayed in its place.

![screenshots/symfony/user-menu.png]({{ "assets/screenshots/symfony/user-menu.png" | relative_url }})

All users can access this menu to update your own profile and password, or to 
log out. If you have the appropriate permissions, you will also be able to 
manage users with the item at the bottom.

There are several fields associated with users in a symfony application. 

<table>
<tbody>
<tr><th>Active</th><td>Users with active accounts can log in to the site. Users with 
  inactive accounts cannot. This provides an alternative to removing a user 
  account. If the user leaves the project temporarily the account can be 
  made inactive.</td></tr>
<tr><th>Email</th><td>This is the only login identifier. It should be an sfu.ca email 
  address, but not all users have SFU affiliations.</td></tr>
<tr><th>Full name</th><td>We do not separate given names and family names in the 
  Symfony user management.</td></tr>
<tr><th>Affiliation</th><td>For DHIL staff, this should be DHIL. For faculty members 
  and PIs, this should be their department's name (English, History, etc). 
  For non-DHIL student staff, this should be the name of the project.</td></tr>
<tr><th>Roles</th><td>Each user has one or more roles. The roles determine what a 
  person can do in a project. The roles are defined below, although some 
  projects may define additional roles.</td></tr>
</tbody>
</table>

  
## User Roles
This is a non-exhaustive list of roles in a Symfony application. They can be 
combined to grant a user access to only the parts of the 
application required.
<table>
<tbody>
 <tr><th>ROLE_ADMIN</th><td> Unlimited access. Can do anything. Only DHIL staff should have this role.</td></tr>
 <tr><th>ROLE_USER_ADMIN</th><td> Able to manage user access.</td></tr>
 <tr><th>ROLE_CONTENT_ADMIN</th><td> Grants access to edit any of the normal database content.</td></tr>
 <tr><th>ROLE_DC_ADMIN</th><td> If the project uses Dublin Core, the user can add, edit, and delete terms.</td></tr>
 <tr><th>ROLE_BLOG_ADMIN</th><td> For applications with blogging enabled, this role grants full access to blog content editing. </td></tr>
 <tr><th>ROLE_COMMENT_ADMIN</th><td> Users who will vet comments must have this role.</td></tr>
</tbody>
</table>

## Adding Users

The User menu item links to a page that displays the list of users for an 
application.

Use the "New" button above the table of users to add a new user. Be sure to 
make the account active and select only the roles necessary for the user.

![screenshots/symfony/user-list.png]({{ "assets/screenshots/symfony/user-list.png" | relative_url }})

<div class="note">
Important: Only grant `ROLE_ADMIN` and `ROLE_USER` to DHIL staff. 
</div>

A newly added user will need to reset their password using the request link at the bottom of the login page.

![screenshots/symfony/user-new.png]({{ "assets/screenshots/symfony/user-new.png" | relative_url }})

## Updating User Information

Email addresses in the User List are linked to the user account details. The 
details page will show all the user information and also the last login 
timestamp. Use the Edit button to change a user's details or the Password 
button to change the password associated with the account.

![screenshots/symfony/user-details.png]({{"assets/screenshots/symfony/user-details.png" | relative_url }})

<div class="note">
Changing a password for a user should be a last resort. Users should try to 
reset their account password from the login screen first.
</div>

## Removing Users

The user details page described above also has a Delete button. Use it to 
permanently remove a user account. If the user account has any content 
associated with it, the deletion will fail. In this case, set the account to 
inactive instead of removing it. 

<div class="note">
If you really must delete a user account with content associated with it, 
you must change the content to be associated with a different user first.
</div>


## From the command line

All actions available in the web interface are also available via the shell. Log
into the DHIL server or run the commands locally in a project folder. 

<table>
<tbody>
<tr>
<th>Create a new account</th>
<td markdown="span">`./bin/console nines:user:create`</td>
</tr>
<tr><th>Activate an account</th><td markdown="span">`./bin/console nines:user:activate`</td></tr>
<tr><th>Deactivate an account</th><td markdown="span">`./bin/console nines:user:deactivate`</td></tr>
<tr><th>Grant a role</th><td markdown="span">`./bin/console nines:user:promote`</td></tr>
<tr><th>Remove a role</th><td markdown="span">`./bin/console nines:user:demote`</td></tr>
<tr><th>Send a password reset email</th><td markdown="span">`./bin/console nines:user:reset`</td></tr>
<tr><th>Change a password</th><td markdown="span">`./bin/console nines:user:password`</td></tr>
</tbody>
</table>


All arguments to the commands are optional. The commands will ask for any 
missing information. Try adding `--help` to a command to determine the 
arguments.