Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5029206BC1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 07:33:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jny2k-000830-BQ; Wed, 24 Jun 2020 05:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1jny2j-00082t-DH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 05:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8OduFUiTO3R2ov5W1O+gB1wqF3ds2aLKvhHc24yLMF4=; b=Pgqv46lSkFUU/mtegIftEKUtBd
 fkoy6I7n5F/NuLmHRbs1gUXWoUEsi3sNtgLbRyqgggr+CsCyV8yFviaMT/GOBTn/DhR+31FLqRAHg
 xlyRaMBXv42Ubc/hDJv10bId8BdNNfcYOI5y3P1zJ8Ow8mw5aqAebJLibjngMX/EDwY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8OduFUiTO3R2ov5W1O+gB1wqF3ds2aLKvhHc24yLMF4=; b=UCNGHn1Ba0Jquy+8c9bdsbGRKu
 5wPNsT2EI0xH9LWh7vlomY4LLghJuTO9AzPKH4hnccf1bRANLYV75CK9qvlBr1AXsIOQKKeILXitf
 EGhu+5IkYPHnrRUo9pDnP42likIfPUwQroYEjceI6eTJX8Rv+0+Y6MotWkG77n3U+lQU=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jny2h-00DiQz-Up
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 05:33:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id B24E02A384C
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
Date: Wed, 24 Jun 2020 01:33:36 -0400
In-Reply-To: <20200624043341.33364-3-drosen@google.com> (Daniel Rosenberg's
 message of "Tue, 23 Jun 2020 21:33:39 -0700")
Message-ID: <87bll9gh8v.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jny2h-00DiQz-Up
Subject: Re: [f2fs-dev] [PATCH v9 2/4] fs: Add standard casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
>
> Ext4 and F2fs will switch to these common implementations.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/libfs.c         | 101 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  22 ++++++++++
>  2 files changed, 123 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 4d08edf19c782..f7345a5ed562f 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -20,6 +20,8 @@
>  #include <linux/fs_context.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/fsnotify.h>
> +#include <linux/unicode.h>
> +#include <linux/fscrypt.h>
>  
>  #include <linux/uaccess.h>
>  
> @@ -1363,3 +1365,102 @@ bool is_empty_dir_inode(struct inode *inode)
>  	return (inode->i_fop == &empty_dir_operations) &&
>  		(inode->i_op == &empty_dir_inode_operations);
>  }
> +
> +#ifdef CONFIG_UNICODE
> +/**
> + * needs_casefold - generic helper to determine if a filename should be casefolded
> + * @dir: Parent directory
> + *
> + * Generic helper for filesystems to use to determine if the name of a dentry
> + * should be casefolded. It does not make sense to casefold the no-key token of
> + * an encrypted filename.
> + *
> + * Return: if names will need casefolding
> + */
> +bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
> +}
> +EXPORT_SYMBOL(needs_casefold);
> +
> +/**
> + * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are checking against
> + * @len:	len of name of dentry
> + * @str:	str pointer to name of dentry
> + * @name:	Name to compare against
> + *
> + * Return: 0 if names match, 1 if mismatch, or -ERRNO
> + */
> +int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +			  const char *str, const struct qstr *name)
> +{
> +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +	const struct inode *inode = READ_ONCE(parent->d_inode);
> +	const struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	struct qstr qstr = QSTR_INIT(str, len);
> +	char strbuf[DNAME_INLINE_LEN];
> +	int ret;
> +
> +	if (!inode || !needs_casefold(inode))
> +		goto fallback;
> +	/*
> +	 * If the dentry name is stored in-line, then it may be concurrently
> +	 * modified by a rename.  If this happens, the VFS will eventually retry
> +	 * the lookup, so it doesn't matter what ->d_compare() returns.
> +	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
> +	 * string.  Therefore, we have to copy the name into a temporary buffer.
> +	 */
> +	if (len <= DNAME_INLINE_LEN - 1) {
> +		memcpy(strbuf, str, len);
> +		strbuf[len] = 0;
> +		qstr.name = strbuf;
> +		/* prevent compiler from optimizing out the temporary buffer */
> +		barrier();
> +	}
> +	ret = utf8_strncasecmp(um, name, &qstr);
> +	if (ret >= 0)
> +		return ret;
> +
> +	if (sb_has_enc_strict_mode(sb))
> +		return -EINVAL;
> +fallback:
> +	if (len != name->len)
> +		return 1;
> +	return !!memcmp(str, name->name, len);
> +}
> +EXPORT_SYMBOL(generic_ci_d_compare);
> +
> +/**
> + * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are hashing
> + * @str:	qstr of name whose hash we should fill in
> + *
> + * Return: 0 if hash was successful, or -ERRNO
> + */
> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	int ret = 0;
> +
> +	if (!inode || !needs_casefold(inode))
> +		return 0;
> +
> +	ret = utf8_casefold_hash(um, dentry, str);
> +	if (ret < 0)
> +		goto err;
> +
> +	return 0;
> +err:
> +	if (sb_has_enc_strict_mode(sb))
> +		ret = -EINVAL;
> +	else
> +		ret = 0;
> +	return ret;
> +}

Maybe drop the err label and simplify:

  ret = utf8_casefold_hash(um, dentry, str);
  if (ret < 0 && sb_has_enc_strict_mode(sb))
     return -EINVAL;
  return 0;


> +EXPORT_SYMBOL(generic_ci_d_hash);
> +#endif
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 3f881a892ea74..261904e06873b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1392,6 +1392,12 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_ACTIVE	(1<<30)
>  #define SB_NOUSER	(1<<31)
>  
> +/* These flags relate to encoding and casefolding */
> +#define SB_ENC_STRICT_MODE_FL	(1 << 0)
> +
> +#define sb_has_enc_strict_mode(sb) \
> +	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
> +
>  /*
>   *	Umount options
>   */
> @@ -1461,6 +1467,10 @@ struct super_block {
>  #endif
>  #ifdef CONFIG_FS_VERITY
>  	const struct fsverity_operations *s_vop;
> +#endif
> +#ifdef CONFIG_UNICODE
> +	struct unicode_map *s_encoding;
> +	__u16 s_encoding_flags;
>  #endif
>  	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
>  	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
> @@ -3385,6 +3395,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
>  
>  extern int generic_check_addressable(unsigned, u64);
>  
> +#ifdef CONFIG_UNICODE
> +extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
> +extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +				const char *str, const struct qstr *name);
> +extern bool needs_casefold(const struct inode *dir);
> +#else
> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_MIGRATION
>  extern int buffer_migrate_page(struct address_space *,
>  				struct page *, struct page *,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
