/*
 * url_helpers.h
 *
 * Copyright (C) 2012		OpenTech Labs
 *				Andrew Clayton <andrew@opentechlabs.co.uk>
 *
 * Released under the GNU Affero General Public License version 3
 * See AGPL-3.0.txt
 */

#ifndef _URL_HELPERS_H_
#define _URL_HELPERS_H_

char *username_to_name(const char *username);
bool is_logged_in(void);
int check_auth(void);
void set_user_session(void);
char *create_session_id(void);
char *generate_csrf_token(void);
void add_csrf_token(TMPL_varlist *varlist);
bool valid_csrf_token(void);
void display_last_login(TMPL_varlist *varlist);
void create_session(unsigned long long sid);
void send_template(const char *template, TMPL_varlist *varlist,
		   TMPL_fmtlist *fmtlist);
bool match_uri(const char *request_uri, const char *match);

#endif /* _URL_HELPERS_H_ */