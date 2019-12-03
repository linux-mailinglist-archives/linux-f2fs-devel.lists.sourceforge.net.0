Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D311066D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 22:21:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icFbh-0002Kp-04; Tue, 03 Dec 2019 21:21:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1icFbf-0002Kd-2g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 21:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2N9RcbRaasVFPkC9OTDVS6c1upG2Wq5nwyxLHbxnOQc=; b=jTkmRkaPw63OHolcHiOOuZg9jF
 EIviaZwzwLOhea2AFP+ZUwzjcyn5aKs8+ZfDZfK0Sf4LofubN2HErIi3FJSOil8fwtGu/r1CkJ425
 L+Sub6+tGdaO9vhpXxUSvh4RWM6OiV31kd7EdVvnVxUWd+8xjW2LAOOwqgFHy2gJQfug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2N9RcbRaasVFPkC9OTDVS6c1upG2Wq5nwyxLHbxnOQc=; b=mu2j/bV1NDfE9SC3oYvk1mWGwV
 lt3fVpHSilxvtLPvrzjOA6vbjHcJ1r3SSkEinx1Eta3PZU9FrbHW4c5ZIPWtwzA2bEYUGwsUYm51F
 dGatCH6dPcazl5BAd7m2wXqvemrydstBBF35qoPB/Aj6Xy3XTZdEGan2q9DqGsrtYh5I=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icFbc-006C2p-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 21:21:15 +0000
Received: from localhost (unknown [IPv6:2610:98:8005::647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E95F128C59C;
 Tue,  3 Dec 2019 21:21:04 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-5-drosen@google.com>
 <20191203074154.GA216261@architecture4> <85wobdb3hp.fsf@collabora.com>
 <20191203203414.GA727@sol.localdomain>
Date: Tue, 03 Dec 2019 16:21:02 -0500
In-Reply-To: <20191203203414.GA727@sol.localdomain> (Eric Biggers's message of
 "Tue, 3 Dec 2019 12:34:14 -0800")
Message-ID: <85zhg96r7l.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icFbc-006C2p-Gg
Subject: Re: [f2fs-dev] [PATCH 4/8] vfs: Fold casefolding into vfs
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Tue, Dec 03, 2019 at 02:42:10PM -0500, Gabriel Krisman Bertazi wrote:
>> Gao Xiang <gaoxiang25@huawei.com> writes:

>> I think Daniel's approach of moving this into VFS is the simplest way to
>> actually solve the issue, instead of extending and duplicating a lot of
>> functionality into filesystem hooks to support the possible mixes of
>> case-insensitive, overlayfs and fscrypt.
>> 
>
> I think we can actually get everything we want using dentry_operations only,
> since the filesystem can set ->d_op during ->lookup() (like what is done for
> encrypted filenames now) rather than at dentry allocation time.  And fs/crypto/
> can export fscrypt_d_revalidate() rather than setting ->d_op itself.

Problem is, differently from fscrypt, case-insensitive uses the d_hash()
hook and for a lookup, we actually use
dentry->d_parent->d_ops->d_hash().  Which works well, until you are flipping the
casefold flag.  Then the dentry already exists and you need to modify
the d_ops on the fly, which I couldn't find precedent anywhere.  I tried
invalidating the dentry whenever we flip the flag, but then if it has
negative dentries as children,I wasn't able to reliably invalidate it,
and that's when I reached the limit of my knowledge in VFS.  In
particular, in every attempt I made to implement it like this, I was
able to race and do a case-insensitive lookup on a directory that was
just made case sensitive.

I'm not saying there isn't a way.  But it is a bit harder than this
proposal. I tried it already and still didn't manage to make it work.
Maybe someone who better understands vfs.

> It's definitely ugly to have to handle the 3 cases of encrypt, casefold, and
> encrypt+casefold separately -- and this will need to be duplicated for each
> filesystem.  But we do have to weigh that against adding additional complexity
> and overhead to the VFS for everyone.  If we do go with the VFS changes, please
> try to make them as simple and unobtrusive as possible.

Well, it is just not case-insensitive+fscrypt. Also overlayfs
there. Probably more.  So we have much more cases.  I understand the VFS
changes need to be very well thought, but when I worked on this it
started to look a more correct solution than using the hooks.

> diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> index 3719efa546c6..cfa44adff2b3 100644
> --- a/fs/crypto/crypto.c
> +++ b/fs/crypto/crypto.c
> @@ -290,7 +290,7 @@ EXPORT_SYMBOL(fscrypt_decrypt_block_inplace);
>   * Validate dentries in encrypted directories to make sure we aren't potentially
>   * caching stale dentries after a key has been added.
>   */
> -static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
> +int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  {
>  	struct dentry *dir;
>  	int err;
> @@ -329,10 +329,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  
>  	return valid;
>  }
> -
> -const struct dentry_operations fscrypt_d_ops = {
> -	.d_revalidate = fscrypt_d_revalidate,
> -};
> +EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
>  
>  /**
>   * fscrypt_initialize() - allocate major buffers for fs encryption.
> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index 130b50e5a011..4420670ac40a 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -233,7 +233,6 @@ extern int fscrypt_crypt_block(const struct inode *inode,
>  			       unsigned int len, unsigned int offs,
>  			       gfp_t gfp_flags);
>  extern struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags);
> -extern const struct dentry_operations fscrypt_d_ops;
>  
>  extern void __printf(3, 4) __cold
>  fscrypt_msg(const struct inode *inode, const char *level, const char *fmt, ...);
> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> index bb3b7fcfdd48..ec81b6a597aa 100644
> --- a/fs/crypto/hooks.c
> +++ b/fs/crypto/hooks.c
> @@ -116,7 +116,6 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
>  		spin_lock(&dentry->d_lock);
>  		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
>  		spin_unlock(&dentry->d_lock);
> -		d_set_d_op(dentry, &fscrypt_d_ops);
>  	}
>  	return err;
>  }
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index 9fdd2b269d61..bd3c14e6b24a 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -704,9 +704,47 @@ static int ext4_d_hash(const struct dentry *dentry, struct qstr *str)
>  	kfree(norm);
>  	return ret;
>  }
> +#endif /* !CONFIG_UNICODE */
>  
> -const struct dentry_operations ext4_dentry_ops = {
> +#ifdef CONFIG_UNICODE
> +static const struct dentry_operations ext4_ci_dentry_ops = {
> +	.d_hash = ext4_d_hash,
> +	.d_compare = ext4_d_compare,
> +};
> +#endif
> +
> +#ifdef CONFIG_FS_ENCRYPTION
> +static const struct dentry_operations ext4_encrypted_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
> +static const struct dentry_operations ext4_encrypted_ci_dentry_ops = {
>  	.d_hash = ext4_d_hash,
>  	.d_compare = ext4_d_compare,
> +	.d_revalidate = fscrypt_d_revalidate,
>  };
>  #endif
> +
> +void ext4_set_d_ops(struct inode *dir, struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
> +#ifdef CONFIG_UNICODE
> +		if (IS_CASEFOLDED(dir)) {
> +			d_set_d_op(dentry, &ext4_encrypted_ci_dentry_ops);
> +			return;
> +		}
> +#endif
> +		d_set_d_op(dentry, &ext4_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (IS_CASEFOLDED(dir)) {
> +		d_set_d_op(dentry, &ext4_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index f8578caba40d..00a10015a53c 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -2499,6 +2499,8 @@ static inline  unsigned char get_dtype(struct super_block *sb, int filetype)
>  extern int ext4_check_all_de(struct inode *dir, struct buffer_head *bh,
>  			     void *buf, int buf_size);
>  
> +void ext4_set_d_ops(struct inode *dir, struct dentry *dentry);
> +
>  /* fsync.c */
>  extern int ext4_sync_file(struct file *, loff_t, loff_t, int);
>  
> @@ -3097,10 +3099,6 @@ static inline void ext4_unlock_group(struct super_block *sb,
>  /* dir.c */
>  extern const struct file_operations ext4_dir_operations;
>  
> -#ifdef CONFIG_UNICODE
> -extern const struct dentry_operations ext4_dentry_ops;
> -#endif
> -
>  /* file.c */
>  extern const struct inode_operations ext4_file_inode_operations;
>  extern const struct file_operations ext4_file_operations;
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index a856997d87b5..4df1d074b393 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1608,6 +1608,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
>  	struct buffer_head *bh;
>  
>  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> +	ext4_set_d_ops(dir, dentry);
>  	if (err == -ENOENT)
>  		return NULL;
>  	if (err)
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 1d82b56d9b11..ac593e9af270 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4498,11 +4498,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto failed_mount4;
>  	}
>  
> -#ifdef CONFIG_UNICODE
> -	if (sbi->s_encoding)
> -		sb->s_d_op = &ext4_dentry_ops;
> -#endif
> -
>  	sb->s_root = d_make_root(root);
>  	if (!sb->s_root) {
>  		ext4_msg(sb, KERN_ERR, "get root dentry failed");
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 1a7bffe78ed5..0de461f2225a 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -120,6 +120,8 @@ static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
>  
>  extern void fscrypt_free_bounce_page(struct page *bounce_page);
>  
> +extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
> +
>  /* policy.c */
>  extern int fscrypt_ioctl_set_policy(struct file *, const void __user *);
>  extern int fscrypt_ioctl_get_policy(struct file *, void __user *);

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
