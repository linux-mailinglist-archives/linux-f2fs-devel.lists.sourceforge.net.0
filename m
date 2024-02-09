Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23ED84F7BC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Feb 2024 15:41:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYS3q-0007BT-ON;
	Fri, 09 Feb 2024 14:41:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rYS3p-0007BN-3u
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 14:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pCpdUnMf8dHC2jO7IQm6xTmkZXEGVeDSlQYqvB/gkX8=; b=dcOtRExnI09dYu5xl7H4rVKxnJ
 vYN3ztx5OLUlo82g+lMur1UhMn6kLPIHp30UaR8q/+02ofmQKMsoT9fWhq+BoGQYd+NwoQt6vZ70l
 f7Kv8gG5+7RyJPwiT2JFyXw8Apm5AuRKUT3pWTykrydf3Tet5dJO0BnEFWK5xmmaoOb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pCpdUnMf8dHC2jO7IQm6xTmkZXEGVeDSlQYqvB/gkX8=; b=mNKdMa63JO0VSo59JCw4yJgybm
 6kSwfcWk+b6rTRrgwZDLlAb7nGnmzbSYEtdYu4FFNOVhZJfP5IsWmd6j9TpGZpIqBR1G3K0YrHZyi
 0JH1bzML8Mx2rDwNoQITL2fztuTAE3SQnLLdVVyzdznoKx0lKkDZTRZv9PGRdzzIJjpg=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rYS3m-0004hl-Pb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 14:41:01 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B97C3220BC;
 Fri,  9 Feb 2024 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707489652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCpdUnMf8dHC2jO7IQm6xTmkZXEGVeDSlQYqvB/gkX8=;
 b=rik195BuEiJ+54TW0+5DiHxcPCpP+UXXjqQn0U5gu74mMSOnaHJIf65yLAxdUjvgQJeako
 68k5Ed0LGf0VnO5SFtI3eHHKfLjwJz788fj/GkrOSMdNDuSfmLLRs5nPqIzQa+SfWw0aAS
 GIWDJxS99CgrfK+YAHSbwFEMr8X0tG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707489652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCpdUnMf8dHC2jO7IQm6xTmkZXEGVeDSlQYqvB/gkX8=;
 b=sAgMlvIs3EvhP/uvQTD6I/2QJW4IZSk2RxR/87b+F7h6Jb7Z8vOBGQgBOt6komTg9z7pf7
 0S98BxqgTp0LNWAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707489652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCpdUnMf8dHC2jO7IQm6xTmkZXEGVeDSlQYqvB/gkX8=;
 b=rik195BuEiJ+54TW0+5DiHxcPCpP+UXXjqQn0U5gu74mMSOnaHJIf65yLAxdUjvgQJeako
 68k5Ed0LGf0VnO5SFtI3eHHKfLjwJz788fj/GkrOSMdNDuSfmLLRs5nPqIzQa+SfWw0aAS
 GIWDJxS99CgrfK+YAHSbwFEMr8X0tG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707489652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCpdUnMf8dHC2jO7IQm6xTmkZXEGVeDSlQYqvB/gkX8=;
 b=sAgMlvIs3EvhP/uvQTD6I/2QJW4IZSk2RxR/87b+F7h6Jb7Z8vOBGQgBOt6komTg9z7pf7
 0S98BxqgTp0LNWAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7573B1326D;
 Fri,  9 Feb 2024 14:40:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id s5yiFnQ5xmXjdQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 09 Feb 2024 14:40:52 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <ff492e0f-3760-430e-968a-8b2adab13f3f@collabora.com> (Eugen
 Hristev's message of "Fri, 9 Feb 2024 12:30:47 +0200")
Organization: SUSE
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
 <20240208064334.268216-2-eugen.hristev@collabora.com>
 <87ttmivm1i.fsf@mailhost.krisman.be>
 <ff492e0f-3760-430e-968a-8b2adab13f3f@collabora.com>
Date: Fri, 09 Feb 2024 09:40:51 -0500
Message-ID: <87plx5u2do.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rik195Bu;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sAgMlvIs
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.78 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[15]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.27)[74.12%]
X-Spam-Score: -3.78
X-Rspamd-Queue-Id: B97C3220BC
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > On
 2/8/24
 20:38, Gabriel Krisman Bertazi wrote: >> (untested) > > I implemented your
 suggestion, but any idea about testing ? I ran smoke on xfstests > and it
 appears to be fine, but maybe some specific test case might try the > different
 paths her [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rYS3m-0004hl-Pb
Subject: Re: [f2fs-dev] [RESEND PATCH v9 1/3] libfs: Introduce
 case-insensitive string comparison helper
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 Eric Biggers <ebiggers@google.com>, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> On 2/8/24 20:38, Gabriel Krisman Bertazi wrote:

>> (untested)
>
> I implemented your suggestion, but any idea about testing ? I ran smoke on xfstests
> and it appears to be fine, but maybe some specific test case might try the
> different paths here ?

Other than running the fstests quick group for each affected filesystems
looking for regressions, the way I'd do it is create a few files and
look them up with exact and inexact name matches.  While doing that,
observe through bpftrace which functions got called and what they
returned.

Here, since you are testing the uncached lookup, you want to make sure
to drop the cached version prior to each lookup.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
