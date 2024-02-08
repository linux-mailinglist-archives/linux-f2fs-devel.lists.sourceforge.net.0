Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381384E7C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 19:39:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rY9IU-0006cu-0p;
	Thu, 08 Feb 2024 18:38:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rY9IQ-0006ch-5w
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 18:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxyCzxouVGDBxxk7qAU+KiLGXbUeN/r+/hUstnS9Hy8=; b=jLTOKeeGN6n+olWcRnvxn7tpeL
 TyyXxy9+zxnm6ZAs1cLWCVuurhU+rzt1HNSvNKL0Atfja+649uueofg1Ev0TrTdK++l5QYznD6baq
 XF8CWh5W7df1Typx7Ei1vY+RO/AqHvcwVsGTMe/7CWSYV/n3dnFHop3Ms7Atln3UL93Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JxyCzxouVGDBxxk7qAU+KiLGXbUeN/r+/hUstnS9Hy8=; b=gy4gCIHQxf10Z+SbN+lk/Ln5Ww
 wAVcU9hqICWX0ZqMvGHlt3b8pZptoiwgMzVlse+/16POIKKP1ZWBrYm81ud8YgPfkMMJc1XaetY8u
 ziNn1rdAAU7PYxsXQnDn2Hw0VE8uZIOA1A+7CTnfxcbD7VSX2sejMp2Q9LWooTthSe44=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rY9IM-00024q-7m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 18:38:50 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3977122042;
 Thu,  8 Feb 2024 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707417515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxyCzxouVGDBxxk7qAU+KiLGXbUeN/r+/hUstnS9Hy8=;
 b=Cp1Ss3GCWoG0SwIvKr2u+ToGd8icmHzK77Lbr8PjQ1STlwx5z33v/kux/j617zHFSvC1QP
 YdBDKzE4ms45aTmasFe58fSdIAFhSXwmAFLGLn2424cWssgyxkq2SuSsgfSC2Eh9pFXKLH
 5ELQhsNBpA62YyOM3oP8/ZUijViZbAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707417515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxyCzxouVGDBxxk7qAU+KiLGXbUeN/r+/hUstnS9Hy8=;
 b=vLlp/3cxXdDlcwqR8dAHrDorHzLLkVjX5fcIZDiJCY1/l/KduPN62rKwFVI7Yezr5oJ7f5
 Z8NCUyqDwBWRF8Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707417515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxyCzxouVGDBxxk7qAU+KiLGXbUeN/r+/hUstnS9Hy8=;
 b=Cp1Ss3GCWoG0SwIvKr2u+ToGd8icmHzK77Lbr8PjQ1STlwx5z33v/kux/j617zHFSvC1QP
 YdBDKzE4ms45aTmasFe58fSdIAFhSXwmAFLGLn2424cWssgyxkq2SuSsgfSC2Eh9pFXKLH
 5ELQhsNBpA62YyOM3oP8/ZUijViZbAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707417515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxyCzxouVGDBxxk7qAU+KiLGXbUeN/r+/hUstnS9Hy8=;
 b=vLlp/3cxXdDlcwqR8dAHrDorHzLLkVjX5fcIZDiJCY1/l/KduPN62rKwFVI7Yezr5oJ7f5
 Z8NCUyqDwBWRF8Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE9FC1326D;
 Thu,  8 Feb 2024 18:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id S2IMMKofxWVpMQAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 08 Feb 2024 18:38:34 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240208064334.268216-2-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Thu, 8 Feb 2024 08:43:32 +0200")
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
 <20240208064334.268216-2-eugen.hristev@collabora.com>
Date: Thu, 08 Feb 2024 13:38:33 -0500
Message-ID: <87ttmivm1i.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Cp1Ss3GC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="vLlp/3cx"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.51 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -6.51
X-Rspamd-Queue-Id: 3977122042
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > From:
 Gabriel Krisman Bertazi <krisman@collabora.com> > > generic_ci_match can
 be used by case-insensitive filesystems to compare > strings under lookup
 with dirents in a case-insensitive way. This [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rY9IM-00024q-7m
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

> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> generic_ci_match can be used by case-insensitive filesystems to compare
> strings under lookup with dirents in a case-insensitive way.  This
> function is currently reimplemented by each filesystem supporting
> casefolding, so this reduces code duplication in filesystem-specific
> code.
>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Hi Eugen,

Thanks for picking this up.  Please,  CC me in future versions.

> ---
>  fs/libfs.c         | 68 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  4 +++
>  2 files changed, 72 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index bb18884ff20e..f80cb982ac89 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1773,6 +1773,74 @@ static const struct dentry_operations generic_ci_dentry_ops = {
>  	.d_hash = generic_ci_d_hash,
>  	.d_compare = generic_ci_d_compare,
>  };
> +
> +/**
> + * generic_ci_match() - Match a name (case-insensitively) with a dirent.
> + * @parent: Inode of the parent of the dirent under comparison
> + * @name: name under lookup.
> + * @folded_name: Optional pre-folded name under lookup
> + * @de_name: Dirent name.
> + * @de_name_len: dirent name length.
> + *
> + *
> + * Test whether a case-insensitive directory entry matches the filename
> + * being searched.  If @folded_name is provided, it is used instead of
> + * recalculating the casefold of @name.

Can we add a note that this is a filesystem helper for comparison with
directory entries, and VFS' ->d_compare should use generic_ci_d_compare.

> + *
> + * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
> + * < 0 on error.
> + */
> +int generic_ci_match(const struct inode *parent,
> +		     const struct qstr *name,
> +		     const struct qstr *folded_name,
> +		     const u8 *de_name, u32 de_name_len)
> +{
> +	const struct super_block *sb = parent->i_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
> +	struct qstr dirent = QSTR_INIT(de_name, de_name_len);
> +	int res, match = false;

I know I originally wrote it this way, but match is an integer, so
let's use integers instead of false/true.

> +
> +	if (IS_ENCRYPTED(parent)) {
> +		const struct fscrypt_str encrypted_name =
> +			FSTR_INIT((u8 *) de_name, de_name_len);
> +
> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
> +			return -EINVAL;
> +
> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> +		if (!decrypted_name.name)
> +			return -ENOMEM;
> +		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
> +						&decrypted_name);
> +		if (res < 0)
> +			goto out;
> +		dirent.name = decrypted_name.name;
> +		dirent.len = decrypted_name.len;
> +	}
> +
> +	if (folded_name->name)
> +		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
> +	else
> +		res = utf8_strncasecmp(um, name, &dirent);

Similar to

  https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git/commit/?h=for-next&id=367122c529f35b4655acbe33c0cc4d6d3b32ba71

We should be checking for an exact-match first to avoid the utf8
comparison cost unnecessarily.  The only problem is that we need to
ensure we fail for an invalid utf-8 de_name in "strict mode".

Fortunately, if folded_name->name exists, we know the name-under-lookup
was validated when initialized, so an exact-match of de_name must also
be valid.  If folded_name is NULL, though, we might either have an
invalid utf-8 dentry-under-lookup or the allocation itself failed, so we
need to utf8_validate it.

Honestly, I don't care much about this !folded_name->name case, since
utf8_strncasecmp will do the right thing and an invalid utf8 on
case-insensitive directories should be an exception, not the norm.  but
the code might get simpler if we do both:

(untested)

if (folded_name->name) {
	if (dirent.len == folded_name->len &&
	    !memcmp(folded_name->name, dirent.name, dirent.len)) {
            	res = 1;
		goto out;
        }
	res = utf8_strncasecmp_folded(um, folded_name, &dirent);
} else {
	if (dirent.len == name->len &&
	    !memcmp(name->name, dirent.name, dirent.len) &&
            (!sb_has_strict_encoding(sb) || !utf8_validate(um, name))) {
            	res = 1;
		goto out;
        }
	res = utf8_strncasecmp(um, name, &dirent);
}

> +
> +	if (!res)
> +		match = true;
> +	else if (res < 0 && !sb_has_strict_encoding(sb)) {
> +		/*
> +		 * In non-strict mode, fallback to a byte comparison if
> +		 * the names have invalid characters.
> +		 */
> +		res = 0;
> +		match = ((name->len == dirent.len) &&
> +			 !memcmp(name->name, dirent.name, dirent.len));
> +	}

This goes away entirely.

> +
> +out:
> +	kfree(decrypted_name.name);
> +	return (res >= 0) ? match : res;

and this becomes:

return res;

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
