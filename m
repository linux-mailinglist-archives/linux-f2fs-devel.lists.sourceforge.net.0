Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB2110573
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 20:47:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icE8s-0006WS-GK; Tue, 03 Dec 2019 19:47:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1icE8r-0006WD-6H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 19:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U4H6KVpg86CpuGP69LTiXJl1tJliFfTfKDT0ElpYLY0=; b=I/0oSdh6zSxvxcZGQHsNnlG1bU
 X8nIpD78jNWyZRZ0UEdkip5TBtJCU75XOQhS4km+P/4+JruagimbB0+vuOhgT1jLgupGqJDP6vpqA
 tUtJ7pg/QUKjbuS1nbIgtmLOyaFasfpyb+/gUntAbpFbO1xTXljw/KoZkgl7EtlVJCmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U4H6KVpg86CpuGP69LTiXJl1tJliFfTfKDT0ElpYLY0=; b=Pf6d7W14DDx6kBqzOImWOdvuaj
 q1HPqHavCHVDT/yrHfhJpdUL5EqB7kJhm5ZNhvwiLptRMTo0vITCboxL/jw0PtVCkZejGUs8QZ1e/
 54hOrpHB/hAlO+js88e+Catr8ErT1jFdnVAqAkAu9Xg7HE532okyTJUdPu8Srpnt69rs=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icE8p-006IvP-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 19:47:25 +0000
Received: from localhost (unknown [IPv6:2610:98:8005::647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BAB152904A2;
 Tue,  3 Dec 2019 19:31:19 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-5-drosen@google.com>
Date: Tue, 03 Dec 2019 14:31:16 -0500
In-Reply-To: <20191203051049.44573-5-drosen@google.com> (Daniel Rosenberg's
 message of "Mon, 2 Dec 2019 21:10:45 -0800")
Message-ID: <851rtlcikb.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icE8p-006IvP-Dq
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> Ext4 and F2fs are both using casefolding, and they, along with any other
> filesystem that adds the feature, will be using identical dentry_ops.
> Additionally, those dentry ops interfere with the dentry_ops required
> for fscrypt once we add support for casefolding and encryption.
> Moving this into the vfs removes code duplication as well as the
> complication with encryption.
>
> Currently this is pretty close to just moving the existing f2fs/ext4
> code up a level into the vfs, although there is a lot of room for
> improvement now.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/dcache.c        | 35 +++++++++++++++++++++++++++++++++++
>  fs/namei.c         | 43 ++++++++++++++++++++++++++++++++++++++++---
>  include/linux/fs.h | 12 ++++++++++++
>  3 files changed, 87 insertions(+), 3 deletions(-)
>
> diff --git a/fs/dcache.c b/fs/dcache.c
> index f7931b682a0d..575f3c2c3f77 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -32,6 +32,7 @@
>  #include <linux/bit_spinlock.h>
>  #include <linux/rculist_bl.h>
>  #include <linux/list_lru.h>
> +#include <linux/unicode.h>
>  #include "internal.h"
>  #include "mount.h"
>  
> @@ -228,6 +229,13 @@ static inline int dentry_string_cmp(const unsigned char *cs, const unsigned char
>  
>  #endif
>  
> +bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
> +}
> +EXPORT_SYMBOL(needs_casefold);
> +
>  static inline int dentry_cmp(const struct dentry *dentry, const unsigned char *ct, unsigned tcount)
>  {
>  	/*
> @@ -247,7 +255,19 @@ static inline int dentry_cmp(const struct dentry *dentry, const unsigned char *c
>  	 * be no NUL in the ct/tcount data)
>  	 */
>  	const unsigned char *cs = READ_ONCE(dentry->d_name.name);
> +#ifdef CONFIG_UNICODE
> +	struct inode *parent = dentry->d_parent->d_inode;
>  
> +	if (unlikely(needs_casefold(parent))) {
> +		const struct qstr n1 = QSTR_INIT(cs, tcount);
> +		const struct qstr n2 = QSTR_INIT(ct, tcount);
> +		int result = utf8_strncasecmp(dentry->d_sb->s_encoding,
> +						&n1, &n2);
> +
> +		if (result >= 0 || sb_has_enc_strict_mode(dentry->d_sb))
> +			return result;
> +	}
> +#endif
>  	return dentry_string_cmp(cs, ct, tcount);
>  }
>  
> @@ -2404,7 +2424,22 @@ struct dentry *d_hash_and_lookup(struct dentry *dir, struct qstr *name)
>  	 * calculate the standard hash first, as the d_op->d_hash()
>  	 * routine may choose to leave the hash value unchanged.
>  	 */
> +#ifdef CONFIG_UNICODE
> +	unsigned char *hname = NULL;
> +	int hlen = name->len;
> +
> +	if (IS_CASEFOLDED(dir->d_inode)) {
> +		hname = kmalloc(PATH_MAX, GFP_ATOMIC);
> +		if (!hname)
> +			return ERR_PTR(-ENOMEM);
> +		hlen = utf8_casefold(dir->d_sb->s_encoding,
> +					name, hname, PATH_MAX);
> +	}
> +	name->hash = full_name_hash(dir, hname ?: name->name, hlen);
> +	kfree(hname);
> +#else
>  	name->hash = full_name_hash(dir, name->name, name->len);
> +#endif
>  	if (dir->d_flags & DCACHE_OP_HASH) {
>  		int err = dir->d_op->d_hash(dir, name);
>  		if (unlikely(err < 0))
> diff --git a/fs/namei.c b/fs/namei.c
> index 2dda552bcf7a..b8d5cb0994ec 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -39,6 +39,7 @@
>  #include <linux/bitops.h>
>  #include <linux/init_task.h>
>  #include <linux/uaccess.h>
> +#include <linux/unicode.h>
>  
>  #include "internal.h"
>  #include "mount.h"
> @@ -2062,6 +2063,10 @@ static inline u64 hash_name(const void *salt, const char *name)
>  static int link_path_walk(const char *name, struct nameidata *nd)
>  {
>  	int err;
> +#ifdef CONFIG_UNICODE
> +	char *hname = NULL;
> +	int hlen = 0;
> +#endif
>  
>  	if (IS_ERR(name))
>  		return PTR_ERR(name);
> @@ -2078,9 +2083,21 @@ static int link_path_walk(const char *name, struct nameidata *nd)
>  		err = may_lookup(nd);
>  		if (err)
>  			return err;
> -
> +#ifdef CONFIG_UNICODE
> +		if (needs_casefold(nd->path.dentry->d_inode)) {
> +			struct qstr str = QSTR_INIT(name, PATH_MAX);
> +
> +			hname = kmalloc(PATH_MAX, GFP_ATOMIC);
> +			if (!hname)
> +				return -ENOMEM;
> +			hlen = utf8_casefold(nd->path.dentry->d_sb->s_encoding,
> +						&str, hname, PATH_MAX);
> +		}
> +		hash_len = hash_name(nd->path.dentry, hname ?: name);
> +		kfree(hname);

It would be nice to reuse the memory allocation for the entire path walk
instead of allocating and freeing several times in a row.  Still not
ideal, but I don't see how we could not have at least one allocation here.

> +#else
>  		hash_len = hash_name(nd->path.dentry, name);
> -
> +#endif
>  		type = LAST_NORM;
>  		if (name[0] == '.') switch (hashlen_len(hash_len)) {
>  			case 2:
> @@ -2452,9 +2469,29 @@ EXPORT_SYMBOL(vfs_path_lookup);
>  static int lookup_one_len_common(const char *name, struct dentry *base,
>  				 int len, struct qstr *this)
>  {
> +#ifdef CONFIG_UNICODE
> +	char *hname = NULL;
> +	int hlen = len;
> +
> +	if (needs_casefold(base->d_inode)) {
> +		struct qstr str = QSTR_INIT(name, len);
> +
> +		hname = kmalloc(PATH_MAX, GFP_ATOMIC);
> +		if (!hname)
> +			return -ENOMEM;
> +		hlen = utf8_casefold(base->d_sb->s_encoding,
> +					&str, hname, PATH_MAX);
> +	}
> +	this->hash = full_name_hash(base, hname ?: name, hlen);
> +	kvfree(hname);
> +#else
> +	this->hash = full_name_hash(base, name, len);
> +#endif
>  	this->name = name;
>  	this->len = len;
> -	this->hash = full_name_hash(base, name, len);
> +#ifdef CONFIG_UNICODE
> +	kfree(hname);
> +#endif
>  	if (!len)
>  		return -EACCES;
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index c159a8bdee8b..38d1c20f3e6f 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
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
> @@ -1449,6 +1455,10 @@ struct super_block {
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
> @@ -2044,6 +2054,8 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
>  #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
>  				 (inode)->i_rdev == WHITEOUT_DEV)
>  
> +extern bool needs_casefold(const struct inode *dir);
> +
>  static inline bool HAS_UNMAPPED_ID(struct inode *inode)
>  {
>  	return !uid_valid(inode->i_uid) || !gid_valid(inode->i_gid);

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
