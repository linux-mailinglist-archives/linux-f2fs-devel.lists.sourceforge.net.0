Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40036218DEF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 19:08:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtDYw-0003mh-RI; Wed, 08 Jul 2020 17:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtDYw-0003mY-AQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 17:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JF8lmBpFZ+l2SwtBQFsVHsMA4wvccQaTDPI6/Yninzo=; b=BuRaV+mqjG9MAr4hTOYoJjBkDh
 uhf3W8wCnPUtr4ch/gJ2OTOVrjMudMQGCJYbL2aJEw/IhZdB2x1abCUlq0Q2h5vEjDMNQpCuIfiKv
 gRJw6dj07/MAFcpLWUgKnO46HlPMiL1rWZc5X+eIsQV1NbZEwHOSULbHP5pOpsERuRz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JF8lmBpFZ+l2SwtBQFsVHsMA4wvccQaTDPI6/Yninzo=; b=D0SDGB6/FRfr4FksYLCZ16aR6z
 5YpUQgcpQGkoj2y1Lpf46kIPNTb0wizCZKsMDj2ov9n0vrmNmDlb1wJOZfhsqpA5BG52cDCPyNYdy
 uVwONAy63Oz7pxIE3oNwt5uE6Rf0YxyJjGtYBFvcAxZdvt0n0E20LhQY3aqKNVr3p6Rg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtDYu-00EMI6-Ho
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 17:08:50 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00288206DF;
 Wed,  8 Jul 2020 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594228123;
 bh=es+dte+fs80l4OQRqdcNPD42C4Sm0o2PqbKv2KtDdCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d3GWKIq5/HyRZWlJ4VxgeyII5e/D798Iesm9xRnpb7HwYZLUOoj1Jf09FYIVRwV0F
 2u7HOfWngMC0Y6/XH9O+6ybHHrdmSul5vk1FQ7c7wjDoLzyAHq96FLJqGoiKkKPpOZ
 tX2m2x9xiFskPJcsh1kdssgtQ5avHCWY2lAYqM3Q=
Date: Wed, 8 Jul 2020 10:08:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200708170842.GA4062395@google.com>
References: <20200708091237.3922153-1-drosen@google.com>
 <20200708091237.3922153-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708091237.3922153-4-drosen@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtDYu-00EMI6-Ho
Subject: Re: [f2fs-dev] [PATCH v12 3/4] f2fs: Use generic casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/08, Daniel Rosenberg wrote:
> This switches f2fs over to the generic support provided in
> the previous patch.
> 
> Since casefolded dentries behave the same in ext4 and f2fs, we decrease
> the maintenance burden by unifying them, and any optimizations will
> immediately apply to both.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/dir.c           | 84 +++++------------------------------------
>  fs/f2fs/f2fs.h          |  4 --
>  fs/f2fs/super.c         | 10 ++---
>  fs/f2fs/sysfs.c         | 10 +++--
>  include/linux/f2fs_fs.h |  3 --
>  5 files changed, 20 insertions(+), 91 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index d35976785e8c..ff61f3a9c11d 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -75,21 +75,22 @@ int f2fs_init_casefolded_name(const struct inode *dir,
>  			      struct f2fs_filename *fname)
>  {
>  #ifdef CONFIG_UNICODE
> -	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
> +	struct super_block *sb = dir->i_sb;
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  
>  	if (IS_CASEFOLDED(dir)) {
>  		fname->cf_name.name = f2fs_kmalloc(sbi, F2FS_NAME_LEN,
>  						   GFP_NOFS);
>  		if (!fname->cf_name.name)
>  			return -ENOMEM;
> -		fname->cf_name.len = utf8_casefold(sbi->s_encoding,
> +		fname->cf_name.len = utf8_casefold(sb->s_encoding,
>  						   fname->usr_fname,
>  						   fname->cf_name.name,
>  						   F2FS_NAME_LEN);
>  		if ((int)fname->cf_name.len <= 0) {
>  			kfree(fname->cf_name.name);
>  			fname->cf_name.name = NULL;
> -			if (f2fs_has_strict_mode(sbi))
> +			if (sb_has_strict_encoding(sb))
>  				return -EINVAL;
>  			/* fall back to treating name as opaque byte sequence */
>  		}
> @@ -215,8 +216,8 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
>  static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
>  			       const u8 *de_name, u32 de_name_len)
>  {
> -	const struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
> -	const struct unicode_map *um = sbi->s_encoding;
> +	const struct super_block *sb = dir->i_sb;
> +	const struct unicode_map *um = sb->s_encoding;
>  	struct qstr entry = QSTR_INIT(de_name, de_name_len);
>  	int res;
>  
> @@ -226,7 +227,7 @@ static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
>  		 * In strict mode, ignore invalid names.  In non-strict mode,
>  		 * fall back to treating them as opaque byte sequences.
>  		 */
> -		if (f2fs_has_strict_mode(sbi) || name->len != entry.len)
> +		if (sb_has_strict_encoding(sb) || name->len != entry.len)
>  			return false;
>  		return !memcmp(name->name, entry.name, name->len);
>  	}
> @@ -1107,75 +1108,8 @@ const struct file_operations f2fs_dir_operations = {
>  };
>  
>  #ifdef CONFIG_UNICODE
> -static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
> -			  const char *str, const struct qstr *name)
> -{
> -	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> -	const struct inode *dir = READ_ONCE(parent->d_inode);
> -	const struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
> -	struct qstr entry = QSTR_INIT(str, len);
> -	char strbuf[DNAME_INLINE_LEN];
> -	int res;
> -
> -	if (!dir || !IS_CASEFOLDED(dir))
> -		goto fallback;
> -
> -	/*
> -	 * If the dentry name is stored in-line, then it may be concurrently
> -	 * modified by a rename.  If this happens, the VFS will eventually retry
> -	 * the lookup, so it doesn't matter what ->d_compare() returns.
> -	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
> -	 * string.  Therefore, we have to copy the name into a temporary buffer.
> -	 */
> -	if (len <= DNAME_INLINE_LEN - 1) {
> -		memcpy(strbuf, str, len);
> -		strbuf[len] = 0;
> -		entry.name = strbuf;
> -		/* prevent compiler from optimizing out the temporary buffer */
> -		barrier();
> -	}
> -
> -	res = utf8_strncasecmp(sbi->s_encoding, name, &entry);
> -	if (res >= 0)
> -		return res;
> -
> -	if (f2fs_has_strict_mode(sbi))
> -		return -EINVAL;
> -fallback:
> -	if (len != name->len)
> -		return 1;
> -	return !!memcmp(str, name->name, len);
> -}
> -
> -static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
> -{
> -	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
> -	const struct unicode_map *um = sbi->s_encoding;
> -	const struct inode *inode = READ_ONCE(dentry->d_inode);
> -	unsigned char *norm;
> -	int len, ret = 0;
> -
> -	if (!inode || !IS_CASEFOLDED(inode))
> -		return 0;
> -
> -	norm = f2fs_kmalloc(sbi, PATH_MAX, GFP_ATOMIC);
> -	if (!norm)
> -		return -ENOMEM;
> -
> -	len = utf8_casefold(um, str, norm, PATH_MAX);
> -	if (len < 0) {
> -		if (f2fs_has_strict_mode(sbi))
> -			ret = -EINVAL;
> -		goto out;
> -	}
> -	str->hash = full_name_hash(dentry, norm, len);
> -out:
> -	kvfree(norm);
> -	return ret;
> -}
> -
>  const struct dentry_operations f2fs_dentry_ops = {
> -	.d_hash = f2fs_d_hash,
> -	.d_compare = f2fs_d_compare,
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
>  };
>  #endif
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b35a50f4953c..d11ffe26bfde 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1402,10 +1402,6 @@ struct f2fs_sb_info {
>  	int valid_super_block;			/* valid super block no */
>  	unsigned long s_flag;				/* flags for sbi */
>  	struct mutex writepages;		/* mutex for writepages() */
> -#ifdef CONFIG_UNICODE
> -	struct unicode_map *s_encoding;
> -	__u16 s_encoding_flags;
> -#endif
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 20e56b0fa46a..cca7a83ffa08 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1257,7 +1257,7 @@ static void f2fs_put_super(struct super_block *sb)
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>  		kvfree(sbi->write_io[i]);
>  #ifdef CONFIG_UNICODE
> -	utf8_unload(sbi->s_encoding);
> +	utf8_unload(sb->s_encoding);
>  #endif
>  	kvfree(sbi);
>  }
> @@ -3278,7 +3278,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
>  {
>  #ifdef CONFIG_UNICODE
> -	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
> +	if (f2fs_sb_has_casefold(sbi) && !sbi->sb->s_encoding) {
>  		const struct f2fs_sb_encodings *encoding_info;
>  		struct unicode_map *encoding;
>  		__u16 encoding_flags;
> @@ -3309,8 +3309,8 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
>  			 "%s-%s with flags 0x%hx", encoding_info->name,
>  			 encoding_info->version?:"\b", encoding_flags);
>  
> -		sbi->s_encoding = encoding;
> -		sbi->s_encoding_flags = encoding_flags;
> +		sbi->sb->s_encoding = encoding;
> +		sbi->sb->s_encoding_flags = encoding_flags;
>  		sbi->sb->s_d_op = &f2fs_dentry_ops;
>  	}
>  #else
> @@ -3806,7 +3806,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		kvfree(sbi->write_io[i]);
>  
>  #ifdef CONFIG_UNICODE
> -	utf8_unload(sbi->s_encoding);
> +	utf8_unload(sb->s_encoding);
>  #endif
>  free_options:
>  #ifdef CONFIG_QUOTA
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index e877c59b9fdb..8bee99ab3978 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -176,12 +176,14 @@ static ssize_t encoding_show(struct f2fs_attr *a,
>  		struct f2fs_sb_info *sbi, char *buf)
>  {
>  #ifdef CONFIG_UNICODE
> +	struct super_block *sb = sbi->sb;
> +
>  	if (f2fs_sb_has_casefold(sbi))
>  		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
> -			sbi->s_encoding->charset,
> -			(sbi->s_encoding->version >> 16) & 0xff,
> -			(sbi->s_encoding->version >> 8) & 0xff,
> -			sbi->s_encoding->version & 0xff);
> +			sb->s_encoding->charset,
> +			(sb->s_encoding->version >> 16) & 0xff,
> +			(sb->s_encoding->version >> 8) & 0xff,
> +			sb->s_encoding->version & 0xff);
>  #endif
>  	return sprintf(buf, "(none)");
>  }
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 3c383ddd92dd..a5dbb57a687f 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -38,9 +38,6 @@
>  #define F2FS_MAX_QUOTAS		3
>  
>  #define F2FS_ENC_UTF8_12_1	1
> -#define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
> -#define f2fs_has_strict_mode(sbi) \
> -	(sbi->s_encoding_flags & F2FS_ENC_STRICT_MODE_FL)
>  
>  #define F2FS_IO_SIZE(sbi)	(1 << F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
>  #define F2FS_IO_SIZE_KB(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 2)) /* KB */
> -- 
> 2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
