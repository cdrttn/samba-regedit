/*
 * Samba Unix/Linux SMB client library
 * Registry Editor
 * Copyright (C) Christopher Davis 2012
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "includes.h"
#include "lib/util/data_blob.h"
#include "lib/registry/registry.h"
#include "regedit.h"

int main()
{
	struct registry_context *ctx;
	struct registry_key *hklm;
	struct registry_key *smbconf;
	uint32_t n;
	WERROR rv;

	/* some simple tests */

	lp_load_global(get_dyn_CONFIGFILE());
	
	rv = reg_open_samba3(&ctx);
	SMB_ASSERT(W_ERROR_IS_OK(rv));

	rv = reg_get_predefined_key_by_name(ctx, "HKEY_LOCAL_MACHINE", &hklm);
	SMB_ASSERT(W_ERROR_IS_OK(rv));

	printf("contents of hklm/SOFTWARE/Samba/smbconf...\n");

	rv = reg_open_key(ctx, hklm, "SOFTWARE\\Samba\\smbconf", &smbconf);
	SMB_ASSERT(W_ERROR_IS_OK(rv));

	printf("subkeys...\n");

	for (n = 0; ;++n) {
		const char *name, *klass;
		NTTIME modified;

		rv = reg_key_get_subkey_by_index(ctx, smbconf, n, &name,
						&klass, &modified);
		if (!W_ERROR_IS_OK(rv)) {
			break;
		}

		printf("%u: %s\n", (unsigned)n, name);
	}	

	TALLOC_FREE(ctx);

	return 0;
}
