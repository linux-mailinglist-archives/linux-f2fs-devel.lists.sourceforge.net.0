Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7B86A3BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 00:33:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf6wo-0000Yi-3R;
	Tue, 27 Feb 2024 23:33:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rf6wn-0000Yc-2O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 23:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1XcCT6OIixHhjBjRbIEMhs9CTkZAbGq3CBxIJeInpl0=; b=U0M4wiAVETa2oK/NNyihhkR2D0
 85R4eCnI+vOb072Ccymi3IlncmeGotp7ke2dm/2uEMyw8hmLpCcAtkLVYzfLQpWAup0ZBtrGbIZm2
 IZ/umOtK+xMvy5is24zthhMku2+hHqO2S2Kk9LF02uOh9mr8b67N8XzYtwAOo/dQcQh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1XcCT6OIixHhjBjRbIEMhs9CTkZAbGq3CBxIJeInpl0=; b=egACm21B07SvQwso+7i9XPgVKg
 zNSnYTOVz1hY7AHkH1IQe5b+ZDqcPrHu3pR2kEFgsPmtwjeUJoHD/W0rO+m80N5fjlu2zb5cY2Fb9
 EmIeprDgI7ckS3LmeTkPphCRtqX4QWu/16IY9JLws93C6Xomp73kdwRedtWRcmyp3DQY=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rf6wl-0000fY-Dw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 23:33:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7055022299;
 Tue, 27 Feb 2024 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709076783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1XcCT6OIixHhjBjRbIEMhs9CTkZAbGq3CBxIJeInpl0=;
 b=xQ8f1Ns3iGPxbm0Sj6jv30DtRJppv+f317F+9awYDiAjwjn6FnIlWRA+vNCxa1HCGUxm3s
 yJX0sbF3PYVO+9O7EZE3/moFHfstEPKxL2U0wA8RpMg+JeGc6f3fwppTTVwaq0vTJbZ4s8
 Ubz4zZTKdqnPkfmJ+w0spkoaKiY/nUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709076783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1XcCT6OIixHhjBjRbIEMhs9CTkZAbGq3CBxIJeInpl0=;
 b=L0Kim+WTB0aMM3EOz4MBC7ESAUEX7JhLQSDLvgTuYYlWjODdBE2wVs3fpr1RIkTGn+dn5H
 pbN0FK3QlGkx17Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709076783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1XcCT6OIixHhjBjRbIEMhs9CTkZAbGq3CBxIJeInpl0=;
 b=xQ8f1Ns3iGPxbm0Sj6jv30DtRJppv+f317F+9awYDiAjwjn6FnIlWRA+vNCxa1HCGUxm3s
 yJX0sbF3PYVO+9O7EZE3/moFHfstEPKxL2U0wA8RpMg+JeGc6f3fwppTTVwaq0vTJbZ4s8
 Ubz4zZTKdqnPkfmJ+w0spkoaKiY/nUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709076783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1XcCT6OIixHhjBjRbIEMhs9CTkZAbGq3CBxIJeInpl0=;
 b=L0Kim+WTB0aMM3EOz4MBC7ESAUEX7JhLQSDLvgTuYYlWjODdBE2wVs3fpr1RIkTGn+dn5H
 pbN0FK3QlGkx17Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32DF213ABA;
 Tue, 27 Feb 2024 23:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DCM3Bi9x3mUnNgAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 27 Feb 2024 23:33:03 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240220085235.71132-4-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Tue, 20 Feb 2024 10:52:30 +0200")
Organization: SUSE
References: <20240220085235.71132-1-eugen.hristev@collabora.com>
 <20240220085235.71132-4-eugen.hristev@collabora.com>
Date: Tue, 27 Feb 2024 18:32:58 -0500
Message-ID: <875xy95vpx.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.19)[-0.965]; RCPT_COUNT_TWELVE(0.00)[14];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rf6wl-0000fY-Dw
Subject: Re: [f2fs-dev] [PATCH v12 3/8] libfs: Introduce case-insensitive
 string comparison helper
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
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
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

Just a note that this conflicts with the other patchset to generic
helpers that I just applied.  The conflict is trivial, If you could base
the next iteration on top of my for-next, it would be helpful.

>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> [eugen.hristev@collabora.com: rework to first test the exact match]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/libfs.c         | 85 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  4 +++
>  2 files changed, 89 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index bb18884ff20e..65e2fb17a2b6 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1773,6 +1773,91 @@ static const struct dentry_operations generic_ci_dentry_ops = {
>  	.d_hash = generic_ci_d_hash,
>  	.d_compare = generic_ci_d_compare,
>  };
> +
> +/**
> + * generic_ci_match() - Match a name (case-insensitively) with a dirent.
> + * This is a filesystem helper for comparison with directory entries.
> + * generic_ci_d_compare should be used in VFS' ->d_compare instead.
> + *
> + * @parent: Inode of the parent of the dirent under comparison
> + * @name: name under lookup.
> + * @folded_name: Optional pre-folded name under lookup
> + * @de_name: Dirent name.
> + * @de_name_len: dirent name length.
> + *
> + * Test whether a case-insensitive directory entry matches the filename
> + * being searched.  If @folded_name is provided, it is used instead of
> + * recalculating the casefold of @name.
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
> +	int res, match = 0;
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
> +	/*
> +	 * Attempt a case-sensitive match first. It is cheaper and
> +	 * should cover most lookups, including all the sane
> +	 * applications that expect a case-sensitive filesystem.

> +	 * This comparison is safe under RCU because the caller
> +	 * guarantees the consistency between str and len. See
> +	 * __d_lookup_rcu_op_compare() for details.

As I mentioned in the previous review, there's no RCU here. This comment
makes no sense here.

> +	 */
> +	if (folded_name->name) {
> +		if (dirent.len == folded_name->len &&
> +		    !memcmp(folded_name->name, dirent.name, dirent.len)) {
> +			match = 1;
> +			goto out;
> +		}
> +		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
> +	} else {
> +		if (dirent.len == name->len &&
> +		    !memcmp(name->name, dirent.name, dirent.len) &&
> +		    (!sb_has_strict_encoding(sb) || !utf8_validate(um, name))) {
> +			match = 1;
> +			goto out;
> +		}
> +		res = utf8_strncasecmp(um, name, &dirent);
> +	}
> +
> +out:

> +	kfree(decrypted_name.name);
> +	if (match) /* matched by direct comparison */
> +		return 1;
> +	else if (!res) /* matched by utf8 comparison */
> +		return 1;
> +	else if (res < 0) /* error on utf8 comparison */
> +		return res;
> +	return 0; /* no match */
> +}

It can be simplified to

if (res < 0)
   return res;
return (match || !res);

>  
>  #ifdef CONFIG_FS_ENCRYPTION
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 820b93b2917f..7af691ff8d44 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3296,6 +3296,10 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
>  extern int generic_check_addressable(unsigned, u64);
>  
>  extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
> +extern int generic_ci_match(const struct inode *parent,
> +			    const struct qstr *name,
> +			    const struct qstr *folded_name,
> +			    const u8 *de_name, u32 de_name_len);
>  
>  static inline bool sb_has_encoding(const struct super_block *sb)
>  {

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
