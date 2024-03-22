Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB788874BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 23:11:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnn6u-0006CU-1Q;
	Fri, 22 Mar 2024 22:11:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rnn6r-0006CM-TZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 22:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XTUdfRCQAps7aKrlDcH+625uZVzNEW70NMJGlSkqA9c=; b=Of9bZF+0XOC1avsQQAI5SdVvAS
 2m/dnCxLIbWywQ5JHSRKS3Qk7JyNafE5bRGPxWu8AJDGsOkECC1iCqHPktKnyIuVxfirMJOyG5Nsp
 xuQzbUxpl7zJ8TvjvpaHRK6vSYSwCfVMnRDH6bg2lF7x6BxninEtdhJ/+LQnqUy3WdnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XTUdfRCQAps7aKrlDcH+625uZVzNEW70NMJGlSkqA9c=; b=ZNyY/fmewlYoQcB9fYq90FNnIV
 CC4jTq+Xv+9CXQzFSbEcOGcFZu9JH6vi76H6QAAG8wQrPXnwpYZb0PHwapiGOLnysPigjIGvfOtnE
 g0kNwNlRLtJV9zbEL1JCUtUfm18Qix6AoT4E/T2kH5P78cldv+IMDxvtL8vEWFpVAg4Q=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rnn6o-0006e0-Ch for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 22:11:34 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B51738A8F;
 Fri, 22 Mar 2024 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711145483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XTUdfRCQAps7aKrlDcH+625uZVzNEW70NMJGlSkqA9c=;
 b=mlWXzpqSp56PPijFJe6COkSKNB8a6IvOHhByz+nqzSZG5h2PFv+YYk8P1rVIJmGK3VZcrX
 YuvsbNrF3cbGhZRVLcyWV1y3NLOV62uIt8HYNLZDj940SiikmZ6fuVR4rErAofmi8IJ+Yq
 cSkoBC/3NqQMmwBH5SPgDa7BYUVpbFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711145483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XTUdfRCQAps7aKrlDcH+625uZVzNEW70NMJGlSkqA9c=;
 b=BB6nITdGi/cLdIrnCnqtyuO9mnPFUZSVQksBaCdjk476VJtLYKazhreI6eyv4N4WYhvKO4
 MjYL0yxXVozUZ7Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711145483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XTUdfRCQAps7aKrlDcH+625uZVzNEW70NMJGlSkqA9c=;
 b=mlWXzpqSp56PPijFJe6COkSKNB8a6IvOHhByz+nqzSZG5h2PFv+YYk8P1rVIJmGK3VZcrX
 YuvsbNrF3cbGhZRVLcyWV1y3NLOV62uIt8HYNLZDj940SiikmZ6fuVR4rErAofmi8IJ+Yq
 cSkoBC/3NqQMmwBH5SPgDa7BYUVpbFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711145483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XTUdfRCQAps7aKrlDcH+625uZVzNEW70NMJGlSkqA9c=;
 b=BB6nITdGi/cLdIrnCnqtyuO9mnPFUZSVQksBaCdjk476VJtLYKazhreI6eyv4N4WYhvKO4
 MjYL0yxXVozUZ7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28DE0132FF;
 Fri, 22 Mar 2024 22:11:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /ubiAwsC/mXxHQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 22 Mar 2024 22:11:23 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240320084622.46643-8-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Wed, 20 Mar 2024 10:46:20 +0200")
Organization: SUSE
References: <20240320084622.46643-1-eugen.hristev@collabora.com>
 <20240320084622.46643-8-eugen.hristev@collabora.com>
Date: Fri, 22 Mar 2024 18:11:21 -0400
Message-ID: <87v85d9at2.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -3.76
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.76 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.25)[73.35%];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mlWXzpqS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BB6nITdG
X-Rspamd-Queue-Id: 6B51738A8F
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > If the
 volume is in strict mode, generi c_ci_compare can report a broken > encoding
 name. This will not trigger on a bad lookup, which is caught > earlier, only
 if the actual disk name is bad. > > S [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rnn6o-0006e0-Ch
Subject: Re: [f2fs-dev] [PATCH v14 7/9] f2fs: Log error when lookup of
 encoded dentry fails
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> If the volume is in strict mode, generi c_ci_compare can report a broken
> encoding name.  This will not trigger on a bad lookup, which is caught
> earlier, only if the actual disk name is bad.
>
> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/f2fs/dir.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 88b0045d0c4f..3b0003e8767a 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -192,11 +192,22 @@ static inline int f2fs_match_name(const struct inode *dir,
>  	struct fscrypt_name f;
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
> -	if (fname->cf_name.name)
> -		return generic_ci_match(dir, fname->usr_fname,
> -					&fname->cf_name,
> -					de_name, de_name_len);
> -
> +	if (fname->cf_name.name) {
> +		int ret = generic_ci_match(dir, fname->usr_fname,
> +					   &fname->cf_name,
> +					   de_name, de_name_len);
> +		if (ret < 0) {
> +			/*
> +			 * Treat comparison errors as not a match.  The
> +			 * only case where it happens is on a disk
> +			 * corruption or ENOMEM.
> +			 */
> +			if (ret == -EINVAL)
> +				f2fs_warn(F2FS_SB(dir->i_sb),
> +					"Directory contains filename that is invalid UTF-8");
> +		}
> +		return ret;

No point in checking ret < 0 and then ret == -EINVAL. just check for
-EINVAL.  That was ok in ext4 because we actually need to change ret to
false.

> +	}
>  #endif
>  	f.usr_fname = fname->usr_fname;
>  	f.disk_name = fname->disk_name;

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
