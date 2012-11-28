require 'licenses/license'

module Licenses
  class GPL30 < License
    key :gpl_3_0
    name 'GNU General Public License v3.0'
    url 'http://www.gnu.org/licenses/gpl.html'
    approved_by OpenSourceInitiative, FreeSoftwareFoundation
    body "Copyright (C) <%= years %> <%= owners %>\n\nThis program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.\n\nThis program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n\nYou should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA."
  end
end
