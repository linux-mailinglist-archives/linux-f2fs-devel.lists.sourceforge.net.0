Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC515A02D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 05:33:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1jiI-0002xr-Oi; Wed, 12 Feb 2020 04:33:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1jiH-0002xk-6V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 04:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/iI1/xB0u2oMOFv6hCODQG6rIgPm4Jbs5ikvpDowTas=; b=Z3/nPmwOWDYUestPx0DtmSkp3Y
 c1Ig1WQ6agRPR3aKaUR0kF1sN3py95teyxpL5PjKIUsZIRULGNTSvzoOLze+BjNsbwvyh5ctUPYV7
 JuQ/kUWJgKb0Fhq+wC4h1D85GfFForVOGeE2ykF8bvHymrdvu7ZlHbu3eJtwReILN6S8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/iI1/xB0u2oMOFv6hCODQG6rIgPm4Jbs5ikvpDowTas=; b=SCpzHutrHohJtsto1YbA0YDSO9
 1GJ34nvfYzuB5GAE0XeulNqfleEOdXZZkgWnNZqNQnSYHwCwwnezM9oBwe7+m3ay/mDaRfdm1wkl0
 IDHnLADQitmGmx848UhHBylwQnyCNQulMj18xviEgWlxtzO9sw6XWcE/8ar2Oo3ZJWEk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1jiF-009Eg9-On
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 04:33:25 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92CBC2073C;
 Wed, 12 Feb 2020 04:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581481998;
 bh=4SOoc2Nbh2rSNo2yGq926YQp0lIyS9cGIkfQQ1oG+mU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O60NQdE8jAFyNF0SAHQT8GR+UMl7E2lJIOTWf8Uo/Tqha4pAxCK/D+fPznAVrKxgW
 v/xNQyc8BMHN38UxW2hJ+x1WBpgq6IO1oRgS14ekunkSDN0yLDKtXkbOlPBnm+nbnw
 13/CfytNLoUG3c+VUrkutq90C8PsQ2IALQrHN+5k=
Date: Tue, 11 Feb 2020 20:33:16 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200212043316.GF870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-6-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-6-drosen@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1jiF-009Eg9-On
Subject: Re: [f2fs-dev] [PATCH v7 5/8] fscrypt: Have filesystems handle
 their d_ops
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 07, 2020 at 05:35:49PM -0800, Daniel Rosenberg wrote:
> This shifts the responsibility of setting up dentry operations from
> fscrypt to the individual filesystems, allowing them to have their own
> operations while still setting fscrypt's d_revalidate as appropriate.
> 
> Also added helper function to libfs to unify ext4 and f2fs
> implementations.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/crypto/fname.c           |  7 ++----
>  fs/crypto/fscrypt_private.h |  1 -
>  fs/crypto/hooks.c           |  1 -
>  fs/ext4/dir.c               |  7 ------
>  fs/ext4/namei.c             |  1 +
>  fs/ext4/super.c             |  5 ----
>  fs/f2fs/dir.c               |  7 ------
>  fs/f2fs/f2fs.h              |  3 ---
>  fs/f2fs/namei.c             |  1 +
>  fs/f2fs/super.c             |  1 -
>  fs/libfs.c                  | 50 +++++++++++++++++++++++++++++++++++++
>  fs/ubifs/dir.c              | 18 +++++++++++++
>  include/linux/fs.h          |  2 ++
>  include/linux/fscrypt.h     |  6 +++--
>  14 files changed, 78 insertions(+), 32 deletions(-)

This patch is hard to review because it does a lot of different things and
touches a lot of different kernel subsystems.  Can you please split it up?
At least you could do:

1. Export fscrypt_d_revalidate()
2. Add the libfs functions
3. The rest

But maybe you can think of a way to split up (3) too.  (It might not be possible
because d_set_d_op() can't be called again to override the dentry_operations
that __fscrypt_prepare_lookup() sets, until that part is removed.)

> 
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index 128198ed1a96f..18b8da7ba92f6 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -665,10 +665,3 @@ const struct file_operations ext4_dir_operations = {
>  	.open		= ext4_dir_open,
>  	.release	= ext4_release_dir,
>  };
> -
> -#ifdef CONFIG_UNICODE
> -const struct dentry_operations ext4_dentry_ops = {
> -	.d_hash = generic_ci_d_hash,
> -	.d_compare = generic_ci_d_compare,
> -};
> -#endif

Please remove the declaration of ext4_dentry_ops from ext4.h too.

> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 53ce3c331528e..e4715c154b60f 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
>  	struct buffer_head *bh;
>  
>  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> +	generic_set_encrypted_ci_d_ops(dir, dentry);
>  	if (err == -ENOENT)
>  		return NULL;
>  	if (err)
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 9717c802d889d..4d866c3b8bdbf 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4542,11 +4542,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto failed_mount4;
>  	}
>  
> -#ifdef CONFIG_UNICODE
> -	if (sb->s_encoding)
> -		sb->s_d_op = &ext4_dentry_ops;
> -#endif

This changes the place that the dentry operations for casefolding are set, but
that's not mentioned in the commit message.  In fact, the commit message doesn't
mention casefolding at all.  Can you please explain it?  Does this result in any
behavior change?

Likewise for f2fs.

> diff --git a/fs/libfs.c b/fs/libfs.c
> index 433c283df3099..75dcf1e1a0488 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1437,4 +1437,54 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	return ret;
>  }
>  EXPORT_SYMBOL(generic_ci_d_hash);
> +
> +static const struct dentry_operations generic_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +};
> +#endif
> +
> +#ifdef CONFIG_FS_ENCRYPTION
> +static const struct dentry_operations generic_encrypted_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
> +static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +/**
> + * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
> + * @dir:	parent of dentry whose ops to set
> + * @dentry:	detnry to set ops on

Typo: "detnry" 

> + *
> + * This function sets the dentry ops for the given dentry to handle both
> + * casefolding and encryption of the dentry name.
> + */

It would be helpful if this comment explained why the two features are handled
differently.  For encryption the dentry_operations are only set for certain
dentries, while for casefolding they're set for all dentries on the filesystem.

> +void generic_set_encrypted_ci_d_ops(struct inode *dir, struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
> +#ifdef CONFIG_UNICODE
> +		if (dir->i_sb->s_encoding) {
> +			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +			return;
> +		}
>  #endif
> +		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (dir->i_sb->s_encoding) {
> +		d_set_d_op(dentry, &generic_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index ef85ec167a843..f3c96d99c0514 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -196,6 +196,7 @@ static int dbg_check_name(const struct ubifs_info *c,
>  	return 0;
>  }
>  
> +static void ubifs_set_d_ops(struct inode *dir, struct dentry *dentry);
>  static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  				   unsigned int flags)
>  {
> @@ -209,6 +210,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
>  
>  	err = fscrypt_prepare_lookup(dir, dentry, &nm);
> +	ubifs_set_d_ops(dir, dentry);
>  	if (err == -ENOENT)
>  		return d_splice_alias(NULL, dentry);
>  	if (err)
> @@ -1655,3 +1657,19 @@ const struct file_operations ubifs_dir_operations = {
>  	.compat_ioctl   = ubifs_compat_ioctl,
>  #endif
>  };
> +
> +#ifdef CONFIG_FS_ENCRYPTION
> +static const struct dentry_operations ubifs_encrypted_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +static void ubifs_set_d_ops(struct inode *dir, struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
> +		d_set_d_op(dentry, &ubifs_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +}

Why can't UBIFS just use the new helper function you're adding to libfs.c?
UBIFS doesn't support casefolding, but that just means that the ci_dentry_ops
won't be used; only the generic_encrypted_dentry_ops will be.

> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 556f4adf5dc58..340ef5b88772f 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -134,6 +134,7 @@ static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
>  }
>  
>  extern void fscrypt_free_bounce_page(struct page *bounce_page);
> +extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);

When possible, can you please keep the order of declarations in line with the
definitions?  That means putting the declaration of fscrypt_d_revalidate() in
the "fname.c" section after fscrypt_fname_siphash(), not here.

>  
>  /* policy.c */
>  extern int fscrypt_ioctl_set_policy(struct file *, const void __user *);
> @@ -595,8 +596,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>   * filenames are presented in encrypted form.  Therefore, we'll try to set up
>   * the directory's encryption key, but even without it the lookup can continue.
>   *
> - * This also installs a custom ->d_revalidate() method which will invalidate the
> - * dentry if it was created without the key and the key is later added.
> + * After calling this function, a filesystem should ensure that it's dentry
> + * operations contain fscrypt_d_revalidate if DCACHE_ENCRYPTED_NAME was set,
> + * so that the dentry can be invalidated if the key is later added.

"it's" => "its"

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
