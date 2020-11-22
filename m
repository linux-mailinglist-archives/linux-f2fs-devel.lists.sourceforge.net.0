Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D82BC3A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Nov 2020 06:01:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kghVP-00046b-3c; Sun, 22 Nov 2020 05:01:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1kghVN-00046L-9i
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Nov 2020 05:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iH1MpY1Rwn+liTqQR36JxS/07YdTa68h+G9Hlj0WA1E=; b=eCPA0kJcwrPiLJDaoPwVKyMDD
 08EYWiOFUCaeOkOBjiMLHIYN4bw+Y7+YOITGPJIfNLifKjW2V7rP4zEDADzUx5nNiHSTiO4hsELo1
 nKmbXnQyIegYoiPDlE+1CIkX6+4LBsjVopicREIfg7Y5Mr/daO6+n9QHlHp3UTucX+B3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iH1MpY1Rwn+liTqQR36JxS/07YdTa68h+G9Hlj0WA1E=; b=QeyOlj3iy+GAmyON6Re3yPk0YO
 /D0/XZtn9h7B4j9dxBWQIELGWISqbLr++VCahA6LPomgyQbtW81U9BVYQwoL9zTNlZgwFz/odQL2b
 W3SjBNdiTDTkSsSfX2n8W2cEM5gqZ5vz9IF6KxMHihH5qqw4Kih16FPQzEukFqvmIBdU=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kghVH-00EXnf-PN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Nov 2020 05:01:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 7B56E1F442EC
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
In-Reply-To: <20201119060904.463807-3-drosen@google.com> (Daniel Rosenberg's
 message of "Thu, 19 Nov 2020 06:09:03 +0000")
Organization: Collabora
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Sat, 21 Nov 2020 23:45:41 -0500
Message-ID: <87y2iuj8y2.fsf@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kghVH-00EXnf-PN
Subject: Re: [f2fs-dev] [PATCH v4 2/3] fscrypt: Have filesystems handle
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> This shifts the responsibility of setting up dentry operations from
> fscrypt to the individual filesystems, allowing them to have their own
> operations while still setting fscrypt's d_revalidate as appropriate.
>
> Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> they have their own specific dentry operations as well. That operation
> will set the minimal d_ops required under the circumstances.
>
> Since the fscrypt d_ops are set later on, we must set all d_ops there,
> since we cannot adjust those later on. This should not result in any
> change in behavior.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Acked-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fname.c           | 4 ----
>  fs/crypto/fscrypt_private.h | 1 -
>  fs/crypto/hooks.c           | 1 -
>  fs/ext4/dir.c               | 7 -------
>  fs/ext4/ext4.h              | 4 ----
>  fs/ext4/namei.c             | 1 +
>  fs/ext4/super.c             | 5 -----
>  fs/f2fs/dir.c               | 7 -------
>  fs/f2fs/f2fs.h              | 3 ---
>  fs/f2fs/namei.c             | 1 +
>  fs/f2fs/super.c             | 1 -
>  fs/ubifs/dir.c              | 1 +
>  include/linux/fscrypt.h     | 7 +++++--
>  13 files changed, 8 insertions(+), 35 deletions(-)
>
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 1fbe6c24d705..cb3cfa6329ba 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -570,7 +570,3 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  	return valid;
>  }
>  EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
> -
> -const struct dentry_operations fscrypt_d_ops = {
> -	.d_revalidate = fscrypt_d_revalidate,
> -};
> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index 4f5806a3b73d..df9c48c1fbf7 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -294,7 +294,6 @@ int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
>  bool fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
>  				  u32 orig_len, u32 max_len,
>  				  u32 *encrypted_len_ret);
> -extern const struct dentry_operations fscrypt_d_ops;
>  
>  /* hkdf.c */
>  
> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> index 20b0df47fe6a..9006fa983335 100644
> --- a/fs/crypto/hooks.c
> +++ b/fs/crypto/hooks.c
> @@ -117,7 +117,6 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
>  		spin_lock(&dentry->d_lock);
>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
>  		spin_unlock(&dentry->d_lock);
> -		d_set_d_op(dentry, &fscrypt_d_ops);
>  	}
>  	return err;
>  }
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index ca50c90adc4c..e757319a4472 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -667,10 +667,3 @@ const struct file_operations ext4_dir_operations = {
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
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index bf9429484462..ad77f01d9e20 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3380,10 +3380,6 @@ static inline void ext4_unlock_group(struct super_block *sb,
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
> index 33509266f5a0..12a417ff5648 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
>  	struct buffer_head *bh;
>  
>  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> +	generic_set_encrypted_ci_d_ops(dentry);
>  	if (err == -ENOENT)
>  		return NULL;
>  	if (err)
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 6633b20224d5..0288bedf46e1 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto failed_mount4;
>  	}
>  
> -#ifdef CONFIG_UNICODE
> -	if (sb->s_encoding)
> -		sb->s_d_op = &ext4_dentry_ops;
> -#endif

This change has the side-effect of removing the capability of the root
directory from being case-insensitive.  It is not a backward
incompatible change because there is no way to make the root directory
CI at the moment (it is never empty). But this restriction seems
artificial. Is there a real reason to prevent the root inode from being
case-insensitive?

> -
>  	sb->s_root = d_make_root(root);
>  	if (!sb->s_root) {
>  		ext4_msg(sb, KERN_ERR, "get root dentry failed");
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 4b9ef8bbfa4a..71fdf5076461 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -1099,10 +1099,3 @@ const struct file_operations f2fs_dir_operations = {
>  	.compat_ioctl   = f2fs_compat_ioctl,
>  #endif
>  };
> -
> -#ifdef CONFIG_UNICODE
> -const struct dentry_operations f2fs_dentry_ops = {
> -	.d_hash = generic_ci_d_hash,
> -	.d_compare = generic_ci_d_compare,
> -};
> -#endif
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index cb700d797296..62b4f31d30e2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3767,9 +3767,6 @@ static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
>  #endif
>  
>  extern const struct file_operations f2fs_dir_operations;
> -#ifdef CONFIG_UNICODE
> -extern const struct dentry_operations f2fs_dentry_ops;
> -#endif
>  extern const struct file_operations f2fs_file_operations;
>  extern const struct inode_operations f2fs_file_inode_operations;
>  extern const struct address_space_operations f2fs_dblock_aops;
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 8fa37d1434de..6edb1ab579a1 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -497,6 +497,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>  	}
>  
>  	err = f2fs_prepare_lookup(dir, dentry, &fname);
> +	generic_set_encrypted_ci_d_ops(dentry);
>  	if (err == -ENOENT)
>  		goto out_splice;
>  	if (err)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 00eff2f51807..f51d52591c99 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3427,7 +3427,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
>  
>  		sbi->sb->s_encoding = encoding;
>  		sbi->sb->s_encoding_flags = encoding_flags;
> -		sbi->sb->s_d_op = &f2fs_dentry_ops;
>  	}
>  #else
>  	if (f2fs_sb_has_casefold(sbi)) {
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 155521e51ac5..7a920434d741 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -203,6 +203,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
>  
>  	err = fscrypt_prepare_lookup(dir, dentry, &nm);
> +	generic_set_encrypted_ci_d_ops(dentry);
>  	if (err == -ENOENT)
>  		return d_splice_alias(NULL, dentry);
>  	if (err)
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index a8f7a43f031b..e72f80482671 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -741,8 +741,11 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>   * directory's encryption key is available, then the lookup is assumed to be by
>   * plaintext name; otherwise, it is assumed to be by no-key name.
>   *
> - * This also installs a custom ->d_revalidate() method which will invalidate the
> - * dentry if it was created without the key and the key is later added.
> + * This will set DCACHE_NOKEY_NAME on the dentry if the lookup is by no-key
> + * name.  In this case the filesystem must assign the dentry a dentry_operations
> + * which contains fscrypt_d_revalidate (or contains a d_revalidate method that
> + * calls fscrypt_d_revalidate), so that the dentry will be invalidated if the
> + * directory's encryption key is later added.
>   *
>   * Return: 0 on success; -ENOENT if the directory's key is unavailable but the
>   * filename isn't a valid no-key name, so a negative dentry should be created;

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
