Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926D84323A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 01:47:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUylL-0000II-JG;
	Wed, 31 Jan 2024 00:47:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rUylK-0000IC-91
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 00:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nH5PMZOJ3HAEPCU6dRr90IDAHi7df2Lyb481mba0emk=; b=ivP+s5a7eYsIKcuU8rGVC2+Oim
 AMmT7fUUssHcnMjtsRItRe00LbxrVJ1rfwek1LmTvrosMwmGNGOM3dPXAXx4+CPIszthI7BSbD7jY
 k5tPCILUuBJMJN8mp/DEI6t0eoWLwaE+0CMl32FwlhuCBvVQFveveL7QSTNfZ3AH9PZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nH5PMZOJ3HAEPCU6dRr90IDAHi7df2Lyb481mba0emk=; b=fJHiXP5rV89FVSwLY1P3hKVH5H
 6FrXM/FxajA49V+k6xuUhSveEjKE4qtXc1xHMfZmnuwZ0+dMfLBxeCieX6N0P58VOclIOSMu/Fpop
 K/xh4GhHUWJ7AmPIYrETxQPJZGby61MwBPJoM0NqDIzCfQ83ygC0v3Zy1QfAVkldPWp8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUylJ-00031l-3u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 00:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 13AD9CE1D65;
 Wed, 31 Jan 2024 00:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D39C433C7;
 Wed, 31 Jan 2024 00:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706662046;
 bh=rV7wK+L19fmxaxl/W1mi4BvAypDvQMbo6pwGGFaxUL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LmoHVBiqwCOGoG4zg2ywsClj7kFrRUiadSDvkIO+nq5XGRfbwNXui5F6nJ2FJ5oyx
 V6h44ZwDx9QmuPII0gfaSGSJ7Zx4H5POiGm3TNg4zugezD2TR0ym/1sXQfPdINZcOH
 gyXRTipbVQCso0rzE1WEh5AHq1Z7/Xpwgdu+yA2rAn6iCzqdqKOlvSk9vhh+QHNrin
 KqxQkPIy6wB9ciYAxOJpzM/2r7dgIa1nmNbXnGAB1OaC8qaoWyjSaM3B7AhSL42B4+
 iVDusfCjBzxuf+7b5gg4rpu/1omDGxtOmIHi5kKSngQdtQLumhQx9nrJwtptpEX+G7
 rMDIgk+pIAbcA==
Date: Tue, 30 Jan 2024 16:47:24 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240131004724.GC2020@sol.localdomain>
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-5-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129204330.32346-5-krisman@suse.de>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 29, 2024 at 05:43:22PM -0300, Gabriel Krisman
 Bertazi wrote: > Unencrypted and encrypted-dentries where the key is available
 don't need > to be revalidated with regards to fscrypt, since t [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUylJ-00031l-3u
Subject: Re: [f2fs-dev] [PATCH v5 04/12] fscrypt: Drop d_revalidate for
 valid dentries during lookup
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 29, 2024 at 05:43:22PM -0300, Gabriel Krisman Bertazi wrote:
> Unencrypted and encrypted-dentries where the key is available don't need
> to be revalidated with regards to fscrypt, since they don't go stale
> from under VFS and the key cannot be removed for the encrypted case
> without evicting the dentry.  Mark them with d_set_always_valid, to

"d_set_always_valid" doesn't appear in the diff itself.

> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 4aaf847955c0..a22997b9f35c 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -942,11 +942,22 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>  static inline void fscrypt_prepare_lookup_dentry(struct dentry *dentry,
>  						 bool is_nokey_name)
>  {
> -	if (is_nokey_name) {
> -		spin_lock(&dentry->d_lock);
> +	spin_lock(&dentry->d_lock);
> +
> +	if (is_nokey_name)
>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
> -		spin_unlock(&dentry->d_lock);
> +	else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
> +		 dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
> +		/*
> +		 * Unencrypted dentries and encrypted dentries where the
> +		 * key is available are always valid from fscrypt
> +		 * perspective. Avoid the cost of calling
> +		 * fscrypt_d_revalidate unnecessarily.
> +		 */
> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
>  	}
> +
> +	spin_unlock(&dentry->d_lock);

This makes lookups in unencrypted directories start doing the
spin_lock/spin_unlock pair.  Is that really necessary?

These changes also make the inline function fscrypt_prepare_lookup() very long
(when including the fscrypt_prepare_lookup_dentry() that's inlined into it).
The rule that I'm trying to follow is that to the extent that the fscrypt helper
functions are inlined, the inline part should be a fast path for unencrypted
directories.  Encrypted directories should be handled out-of-line.

So looking at the original fscrypt_prepare_lookup():

	static inline int fscrypt_prepare_lookup(struct inode *dir,
						 struct dentry *dentry,
						 struct fscrypt_name *fname)
	{
		if (IS_ENCRYPTED(dir))
			return __fscrypt_prepare_lookup(dir, dentry, fname);

		memset(fname, 0, sizeof(*fname));
		fname->usr_fname = &dentry->d_name;
		fname->disk_name.name = (unsigned char *)dentry->d_name.name;
		fname->disk_name.len = dentry->d_name.len;
		return 0;
	}

If you could just add the DCACHE_OP_REVALIDATE clearing for dentries in
unencrypted directories just before the "return 0;", hopefully without the
spinlock, that would be good.  Yes, that does mean that
__fscrypt_prepare_lookup() will have to handle it too, for the case of dentries
in encrypted directories, but that seems okay.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
