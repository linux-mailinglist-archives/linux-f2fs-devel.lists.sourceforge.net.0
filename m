Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD7C9F7C51
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2024 14:29:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOGae-00038A-Jq;
	Thu, 19 Dec 2024 13:29:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tOGad-000381-Bh
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 13:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rzJX5QMBCx7r9btLaJzXLJ54NxcYtJ9So7VQUjwGfaU=; b=Yq9mBG8nHe3M2iVf0hVYPrrpiO
 ZI1MTy3i2xjimEjJOeGGAKQ8lwW54azJdoRkPYV/TBn0vz3aCBJgNQJFlXLvgWyPa96+YMRAPgyKn
 jmd9BlqeAe52uBKTv6ksIDaNYyXIxoly88BTTtfVGS7tOHZT30kuUZOg4fI6MDfzFHNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rzJX5QMBCx7r9btLaJzXLJ54NxcYtJ9So7VQUjwGfaU=; b=az5VLYDHNVEAYO3VRddiACMuPW
 rSP03qDsqZEC8bdCwQqgsfYbRp9uNJxjqrDTgLjxBlwZEXhcJXlnNFIj24lq+Cbs1up3heraRha3x
 asLMzM06Fdpbwy1AVfL9OS/OitZNpwHBVoozST5GfGw4jP2pY5CLwgMNyEikav88+ytc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOGab-0006KT-Po for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 13:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C4B55C48EA;
 Thu, 19 Dec 2024 13:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6E9C4CED0;
 Thu, 19 Dec 2024 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734614947;
 bh=7WUNTbFDqFvgrpqNjFRokUfM8y1E12dGmPZWJmDuTeE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZYJCqndzMxbdDAqchZWAhhO2UPJM/ZyZVz68iqXniQH9ZSdDxkm4rp/VtAlzlaNDE
 mjqaEndjXmh4nJgq730anDadzmfjCoU9/9rHdLUMLkNgfPWjN1DN0eWMqtnjMs6WZ8
 Tgcsim88mFfunqiswQDFYs2mYFzW2+lsu3socllzmLTICqIyzScOSRgH7CFJdvOL8R
 VCLSYFI4LVh647YkT53SI92jXlcf0wQbB6s8qBbLiaWHUTftyLQwpnf+HQD1D0uz5G
 I8608aQg9F/QvauYA+YgyiyG9qQ6GZN8g4uYABRHTU+D8BbOBi+qJWS7zGgCqL0gH9
 xkIkH5e2bvicA==
Message-ID: <31e9c60b-0fd1-4d98-baf9-cf02e44c367d@kernel.org>
Date: Thu, 19 Dec 2024 21:29:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241217075552.1167994-1-chullee@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <20241217075552.1167994-1-chullee@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, On 2024/12/17 15:55,
 Daniel Lee wrote: > This patch
 addresses an issue where some files in case-insensitive > directories become
 inaccessible due to changes in how the kernel function, > utf8_casefold [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOGab-0006KT-Po
Subject: Re: [f2fs-dev] [PATCH] f2fs: Introduce linear search for dentries
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

Hi Daniel,

On 2024/12/17 15:55, Daniel Lee wrote:
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

Need a fixes line?

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219586
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>   fs/f2fs/dir.c    | 38 ++++++++++++++++++++++++++++----------
>   fs/f2fs/f2fs.h   |  6 ++++--
>   fs/f2fs/inline.c |  5 +++--
>   3 files changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 47a5c806cf16..a85d19b4e178 100644
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
> @@ -307,6 +313,9 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>   		bidx++;
>   	}
>   
> +	if (!use_hash && !de && ++bucket_no < nbucket)
> +		goto start_find_bucket;
> +
>   	if (!de && room && F2FS_I(dir)->chash != fname->hash) {

Do we need to avoid accessing or assigning hash if use_hash is false?

Thanks,

>   		F2FS_I(dir)->chash = fname->hash;
>   		F2FS_I(dir)->clevel = level;
> @@ -323,11 +332,13 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>   	struct f2fs_dir_entry *de = NULL;
>   	unsigned int max_depth;
>   	unsigned int level;
> +	bool use_hash = true;
>   
>   	*res_page = NULL;
>   
> +start_find_entry:
>   	if (f2fs_has_inline_dentry(dir)) {
> -		de = f2fs_find_in_inline_dir(dir, fname, res_page);
> +		de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
>   		goto out;
>   	}
>   
> @@ -343,11 +354,18 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
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
