Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BCB858230
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Feb 2024 17:13:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rb0ph-0004xb-R7;
	Fri, 16 Feb 2024 16:13:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rb0pf-0004xI-QW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 16:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pi8lq9P+ufiU0YNIcnckIE4t9aHDgpwD+S7gt0Xq2s4=; b=nJbElfBFfne4/h8cRb5OGObVnI
 RWsLlEQQ4+bnTypMvPGYmfYk9mgdbfg2G9iZarVE8nS2Of64SMPRTYVesSv+dduCIJWxwJQR+USD/
 VlIHmVUQ5+Sejb05+dQikG5sFnFPvyNnCvhy7okAn9xyTFOt/BNlgxyleTKmci9xSL7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pi8lq9P+ufiU0YNIcnckIE4t9aHDgpwD+S7gt0Xq2s4=; b=GQeN9OSe/wL7/bsvcbwdGUNQ+J
 pXDqagIGUsx+FvmygGAYCVdjbhUZ8ia8GeoI/4/UuqzlkMBzvGqJ9yAsbrOrS8gICPFedgd1VpK66
 If7CefQ/RdNsqYsz4O1NSeGW/Y3XAwue8rLm7/ekirbG7SDF2ls2iDmoTzTpiwXHWnA8=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rb0pd-0001Zp-4M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 16:12:59 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04DBF21EEA;
 Fri, 16 Feb 2024 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708099969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pi8lq9P+ufiU0YNIcnckIE4t9aHDgpwD+S7gt0Xq2s4=;
 b=cmjAfG3uCC0B6no8s5ahqc0GqQwbgBLS2EGp2wLZETvfD0cUAU/0zzPPj1E4MCUh24mySu
 aDo200WwtaLp910GBLSi5TWn+iVDRPkczpOQv36l07N/RQcZPrqtJmcD3mN++65oCC6Tth
 Ou51/4OBZ18I60osPmsZpknDk0ldQ4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708099969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pi8lq9P+ufiU0YNIcnckIE4t9aHDgpwD+S7gt0Xq2s4=;
 b=UNdzAoQfC/VU4ARaHWRQuekDZJDf0iw5JMlz1yNJjdfak51TioV4KeQqCAslZBjOGeNLyj
 y8/MsARRjGfvNZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708099967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pi8lq9P+ufiU0YNIcnckIE4t9aHDgpwD+S7gt0Xq2s4=;
 b=sarZ3cqXpjCZrzZ23HlNVm1ClShtyUcmnuwYxvbs1l3X9YSU9hlt8EeAPZCjd3ZnSADAwm
 0qyzw1UDXbODTV0gxooMv3T3ykLxOkrtq353Ecpzf58b1v/j7sm1dmxAxk99ND1r96IGet
 fR5OsDED6qFW7/gjvrBMu2Ug+7vnWIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708099967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pi8lq9P+ufiU0YNIcnckIE4t9aHDgpwD+S7gt0Xq2s4=;
 b=IsUGT/inEDt8w5Z61VyEU4xzBI6VXq02w2tTaI6lApYrYQJGevjuqb6Run8B6jSB+Rl59g
 ca4Q7pudp7yjfEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCF8D13A39;
 Fri, 16 Feb 2024 16:12:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yfX+KH6Jz2U9TAAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 16 Feb 2024 16:12:46 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240215042654.359210-4-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Thu, 15 Feb 2024 06:26:49 +0200")
Organization: SUSE
References: <20240215042654.359210-1-eugen.hristev@collabora.com>
 <20240215042654.359210-4-eugen.hristev@collabora.com>
Date: Fri, 16 Feb 2024 11:12:37 -0500
Message-ID: <87zfw0bd6y.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sarZ3cqX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="IsUGT/in"
X-Spamd-Result: default: False [-3.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[14]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 04DBF21EEA
X-Spam-Level: 
X-Spam-Score: -3.31
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rb0pd-0001Zp-4M
Subject: Re: [f2fs-dev] [PATCH v10 3/8] libfs: Introduce case-insensitive
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
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> [eugen.hristev@collabora.com: rework to first test the exact match]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/libfs.c         | 80 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  4 +++
>  2 files changed, 84 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index bb18884ff20e..82871fa1b066 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1773,6 +1773,86 @@ static const struct dentry_operations generic_ci_dentry_ops = {
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
> + *

Since this need a respin, mind dropping the extra empty line here?

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
> +	int res;
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
> +	 *


> +	 * This comparison is safe under RCU because the caller
> +	 * guarantees the consistency between str and len. See
> +	 * __d_lookup_rcu_op_compare() for details.
> +	 */

This paragraph doesn't really make sense here.  It is originally from
the d_compare hook, which can be called under RCU, but there is no RCU
here.  Also, here we are comparing the dirent with the
name-under-lookup, name which is already safe.


> +	if (folded_name->name) {
> +		if (dirent.len == folded_name->len &&
> +		    !memcmp(folded_name->name, dirent.name, dirent.len)) {
> +			res = 1;
> +			goto out;
> +		}
> +		res = !utf8_strncasecmp_folded(um, folded_name, &dirent);

Hmm, second thought on this.  This will ignore errors from utf8_strncasecmp*,
which CAN happen for the first time here, if the dirent itself is
corrupted on disk (exactly why we have patch 6).  Yes, ext4_match will drop the
error, but we want to propagate it from here, such that the warning on
patch 6 can trigger.

This is why I did that match dance on the original submission.  Sorry
for suggesting it.  We really want to get the error from utf8 and
propagate it if it is negative. basically:

        res > 0: match
        res == 0: no match.
        res < 0: propagate error and let the caller handle it


> +	} else {
> +		if (dirent.len == name->len &&
> +		    !memcmp(name->name, dirent.name, dirent.len) &&
> +		    (!sb_has_strict_encoding(sb) || !utf8_validate(um, name))) {
> +			res = 1;
> +			goto out;
> +		}
> +		res = !utf8_strncasecmp(um, name, &dirent);
> +	}
> +
> +out:
> +	kfree(decrypted_name.name);
> +	return res;
> +}
> +EXPORT_SYMBOL(generic_ci_match);
>  #endif
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
