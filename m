Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 544399FA5CE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Dec 2024 14:36:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPM7q-0005dU-El;
	Sun, 22 Dec 2024 13:36:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tPM7N-0005cp-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 13:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lp9q+dAV6OcYc32Mc2zrE8vTR3RnFdWnvTSDG37ML2g=; b=i/00C5RTYtb/8nLqTvlZdvQkN5
 euQhrDViOjB+F0cfDmNG6unxob8ErSyMu9L8BO3+EgBcqX8gl0iuD4gUHq4w4jCYgdU8ubu/ikBrV
 uFd1k1gdW+/SsAB0/fGgDmOGTMq4v6bA/aG1qwgIHyNVIXrcqxhPENUdBqYzB1PQ7SCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lp9q+dAV6OcYc32Mc2zrE8vTR3RnFdWnvTSDG37ML2g=; b=erCCDN4pFl8bo5yRT2qLHVO+bw
 osnv/WvaCFyXMENCOv9NAHpy7eXM4PZSt1LiJziXKEJPGJ08cAi636CsalQlE5JHLj/qzM6H/LEOz
 ytDIFwmbMLZJKXjR0npEHWoJX6U8/MKPcNTu3YSNYs+rrSjK+sVye/limVWinvz+M+u4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPM7L-0002Ju-95 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 13:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 073395C4AE2;
 Sun, 22 Dec 2024 13:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9EAC4CECD;
 Sun, 22 Dec 2024 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734874529;
 bh=0dsM31fJQKgcthSLK8YUfTa4nVPsUP8sWTs97urURj8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sIgfDueg+cpXr2muMdy7JDAopso+iVbZfqae/3YBt4Q/jtWDdrPYcQpM6nRKUbi6F
 aTQRB2w21UwRbb2gJQtbe+rQ6KxbWuz/EcAFEghQjIPLkZkFfcw1ClEu4PFpydPOIK
 +ETfJzPjM3v/XHf+oJxaVsTNuXp5XW1Bz85X2RECoJh3meFSX7Pakmqn3t2uqx4nzO
 31ef/hMcdk6/BwyT/CSQqLJ9opdyR/MPzF1gDfiOSviX0P3OwnbyfuzS4SkPOeJUL9
 gxJ+EYK/q+L2P5eqOytkaFHb4Y/6aitwVTRXHgGcHjv36GbRpkcvfYEGEePtlXGmB+
 wF1RseAq5G3cQ==
Message-ID: <4f6e5f65-117d-4459-905e-94d8a71d36ff@kernel.org>
Date: Sun, 22 Dec 2024 21:35:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241220234131.1089833-1-chullee@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <20241220234131.1089833-1-chullee@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/21 7:41, Daniel Lee wrote: > This patch addresses
 an issue where some files in case-insensitive > directories become
 inaccessible
 due to changes in how the kernel function, > utf8_casefold( [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tPM7L-0002Ju-95
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: Introduce linear search for dentries
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/12/21 7:41, Daniel Lee wrote:
> This patch addresses an issue where some files in case-insensitive
> directories become inaccessible due to changes in how the kernel function,
> utf8_casefold(), generates case-folded strings from the commit 5c26d2f1d3f5
> ("unicode: Don't special case ignorable code points").
> 
> F2FS uses these case-folded names to calculate hash values for locating
> dentries and stores them on disk. Since utf8_casefold() can produce
> different output across kernel versions, stored hash values and newly
> calculated hash values may differ. This results in affected files no
> longer being found via the hash-based lookup.
> 
> To resolve this, the patch introduces a linear search fallback.
> If the initial hash-based search fails, F2FS will sequentially scan the
> directory entries.
> 
> Fixes: 5c26d2f1d3f5 ("unicode: Don't special case ignorable code points")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219586
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
> v3:
> - Fix the unused label warning
> v2:
> - Only update chash if use_hash is true
>   fs/f2fs/dir.c    | 42 +++++++++++++++++++++++++++++++-----------
>   fs/f2fs/f2fs.h   |  6 ++++--
>   fs/f2fs/inline.c |  5 +++--
>   3 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 47a5c806cf16..058b8be9a373 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -175,7 +175,8 @@ static unsigned long dir_block_index(unsigned int level,
>   static struct f2fs_dir_entry *find_in_block(struct inode *dir,
>   				struct page *dentry_page,
>   				const struct f2fs_filename *fname,
> -				int *max_slots)
> +				int *max_slots,
> +				bool use_hash)
>   {
>   	struct f2fs_dentry_block *dentry_blk;
>   	struct f2fs_dentry_ptr d;
> @@ -183,7 +184,7 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
>   	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
>   
>   	make_dentry_ptr_block(dir, &d, dentry_blk);
> -	return f2fs_find_target_dentry(&d, fname, max_slots);
> +	return f2fs_find_target_dentry(&d, fname, max_slots, use_hash);
>   }
>   
>   static inline int f2fs_match_name(const struct inode *dir,
> @@ -208,7 +209,8 @@ static inline int f2fs_match_name(const struct inode *dir,
>   }
>   
>   struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
> -			const struct f2fs_filename *fname, int *max_slots)
> +			const struct f2fs_filename *fname, int *max_slots,
> +			bool use_hash)
>   {
>   	struct f2fs_dir_entry *de;
>   	unsigned long bit_pos = 0;
> @@ -231,7 +233,7 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
>   			continue;
>   		}
>   
> -		if (de->hash_code == fname->hash) {
> +		if (!use_hash || de->hash_code == fname->hash) {
>   			res = f2fs_match_name(d->inode, fname,
>   					      d->filename[bit_pos],
>   					      le16_to_cpu(de->name_len));
> @@ -258,11 +260,12 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
>   static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>   					unsigned int level,
>   					const struct f2fs_filename *fname,
> -					struct page **res_page)
> +					struct page **res_page,
> +					bool use_hash)
>   {
>   	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
>   	unsigned int nbucket, nblock;
> -	unsigned int bidx, end_block;
> +	unsigned int bidx, end_block, bucket_no;
>   	struct page *dentry_page;
>   	struct f2fs_dir_entry *de = NULL;
>   	pgoff_t next_pgofs;
> @@ -272,8 +275,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>   	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
>   	nblock = bucket_blocks(level);
>   
> +	bucket_no = use_hash ? le32_to_cpu(fname->hash) % nbucket : 0;
> +
> +start_find_bucket:
>   	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
> -			       le32_to_cpu(fname->hash) % nbucket);
> +			       bucket_no);
>   	end_block = bidx + nblock;
>   
>   	while (bidx < end_block) {
> @@ -290,7 +296,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>   			}
>   		}
>   
> -		de = find_in_block(dir, dentry_page, fname, &max_slots);
> +		de = find_in_block(dir, dentry_page, fname, &max_slots, use_hash);
>   		if (IS_ERR(de)) {
>   			*res_page = ERR_CAST(de);
>   			de = NULL;
> @@ -307,7 +313,10 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>   		bidx++;
>   	}
>   
> -	if (!de && room && F2FS_I(dir)->chash != fname->hash) {
> +	if (!use_hash && !de && ++bucket_no < nbucket)
> +		goto start_find_bucket;
> +
> +	if (use_hash && !de && room && F2FS_I(dir)->chash != fname->hash) {
>   		F2FS_I(dir)->chash = fname->hash;
>   		F2FS_I(dir)->clevel = level;

What about cleaning up w/

	if (de)
		return de;

	if (use_hash) {
		if (room && F2FS_I(dir)->chash != fname->hash) {
			...
		}
	} else if (++bucket_no < nbucket)
		goto start_find_bucket;
	}
	return NULL;

Otherwise, it looks good to me, anyway,

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

>   	}
> @@ -323,11 +332,15 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>   	struct f2fs_dir_entry *de = NULL;
>   	unsigned int max_depth;
>   	unsigned int level;
> +	bool use_hash = true;
>   
>   	*res_page = NULL;
>   
> +#if IS_ENABLED(CONFIG_UNICODE)
> +start_find_entry:
> +#endif
>   	if (f2fs_has_inline_dentry(dir)) {
> -		de = f2fs_find_in_inline_dir(dir, fname, res_page);
> +		de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
>   		goto out;
>   	}
>   
> @@ -343,11 +356,18 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>   	}
>   
>   	for (level = 0; level < max_depth; level++) {
> -		de = find_in_level(dir, level, fname, res_page);
> +		de = find_in_level(dir, level, fname, res_page, use_hash);
>   		if (de || IS_ERR(*res_page))
>   			break;
>   	}
> +
>   out:
> +#if IS_ENABLED(CONFIG_UNICODE)
> +	if (IS_CASEFOLDED(dir) && !de && use_hash) {
> +		use_hash = false;
> +		goto start_find_entry;
> +	}
> +#endif
>   	/* This is to increase the speed of f2fs_create */
>   	if (!de)
>   		F2FS_I(dir)->task = current;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f523dd302bf6..1afebb9c4061 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3588,7 +3588,8 @@ int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
>   			struct f2fs_filename *fname);
>   void f2fs_free_filename(struct f2fs_filename *fname);
>   struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
> -			const struct f2fs_filename *fname, int *max_slots);
> +			const struct f2fs_filename *fname, int *max_slots,
> +			bool use_hash);
>   int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>   			unsigned int start_pos, struct fscrypt_str *fstr);
>   void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
> @@ -4224,7 +4225,8 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
>   int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
>   struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
>   					const struct f2fs_filename *fname,
> -					struct page **res_page);
> +					struct page **res_page,
> +					bool use_hash);
>   int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
>   			struct page *ipage);
>   int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index cbd2a0d34804..3e3c35d4c98b 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -352,7 +352,8 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
>   
>   struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
>   					const struct f2fs_filename *fname,
> -					struct page **res_page)
> +					struct page **res_page,
> +					bool use_hash)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
>   	struct f2fs_dir_entry *de;
> @@ -369,7 +370,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
>   	inline_dentry = inline_data_addr(dir, ipage);
>   
>   	make_dentry_ptr_inline(dir, &d, inline_dentry);
> -	de = f2fs_find_target_dentry(&d, fname, NULL);
> +	de = f2fs_find_target_dentry(&d, fname, NULL, use_hash);
>   	unlock_page(ipage);
>   	if (IS_ERR(de)) {
>   		*res_page = ERR_CAST(de);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
