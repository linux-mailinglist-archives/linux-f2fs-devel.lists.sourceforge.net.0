Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6F79270D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 09:45:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPH9F-0006r7-9r;
	Thu, 04 Jul 2024 07:44:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sPH9D-0006qq-VY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 07:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+6HIRjWqYgvdp7VHwYmuKx0DtKtBDnihclIeNci5B18=; b=hCShhuIVNRzod/mKwuBNF146Ad
 TaXM0ExxbQH+0tM1Y56+fI69T1o4p7tpbBgyJK6u/xTFXiZ6oVvl5hG6iLGAyliDlsbsfT3eN55Ja
 xLbwRz87fRjLbSRWVxmudD8YZ7rJqtAxHaAo6o6qsvwzulIuEIr9RgqpD+OEWJMgVdAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+6HIRjWqYgvdp7VHwYmuKx0DtKtBDnihclIeNci5B18=; b=BYF6qzF41ymmPjnXCWmZZRq0kY
 hZyRqD/leobInFN3KwIGW2iLrjbgNFWWrHK50nUwLkKf3esjn3YO7VQ/jcqSXq2XYMX2MGtNFbrnn
 SNjXIdEuJmFfBKxP199o2U35sv7CWEHZdOlo7IpkLWga9oar6olCmFNUsdQhazWK0QbI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPH9E-0005Ew-68 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 07:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14C2B62502;
 Thu,  4 Jul 2024 07:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE88C3277B;
 Thu,  4 Jul 2024 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720079084;
 bh=QMYeZL7iAENWFwunV2w3darPwFTKFzKYMy4cqGU95WY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dChIPkp1IP3UVuUqCvOBH4x1lxjcnH5EjrU5yKtjGlWkkjN+VYMB/JQG8gr9GiSU9
 CcDhsHnkTKWQLWmgUWBgc55898/Ks5bmp7J7tql3LrQIvVRyct0lh3ywT038+77O9m
 jVI9ZzGw6MYXrqGgCouhHh4D5QGms8ks/tCbkwqYNE2/IlFT0rf9D0rDGhDxFh3yUq
 AfT1C16DkdWhsvGea148AmHVPgUu5diX2OJcYkYbIchME3rBcMqs0cv2Mk6om1RLE0
 8k2MNFhwZQQMQv0fPeDJkqVdwVPGE+vlMVfV+i7FTWWqgPiQNdEsruEwQluQxhaRjr
 mWX9CthCcGq8Q==
Message-ID: <c9d66cc2-5990-450f-9ede-be8244c607a9@kernel.org>
Date: Thu, 4 Jul 2024 15:44:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org
References: <CGME20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb@epcas1p4.samsung.com>
 <20240702120636.476119-1-s_min.jeong@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240702120636.476119-1-s_min.jeong@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/2 20:06, Sunmin Jeong wrote: > In case of the COW
 file, new updates and GC writes are already > separated to page caches of
 the atomic file and COW file. As some cases > that use the meta in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPH9E-0005Ew-68
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: use meta inode for GC of COW file
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, daehojeong@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/2 20:06, Sunmin Jeong wrote:
> In case of the COW file, new updates and GC writes are already
> separated to page caches of the atomic file and COW file. As some cases
> that use the meta inode for GC, there are some race issues between a
> foreground thread and GC thread.
> 
> To handle them, we need to take care when to invalidate and wait
> writeback of GC pages in COW files as the case of using the meta inode.
> Also, a pointer from the COW inode to the original inode is required to
> check the state of original pages.
> 
> For the former, we can solve the problem by using the meta inode for GC
> of COW files. Then let's get a page from the original inode in
> move_data_block when GCing the COW file to avoid race condition.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org #v5.19+
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
> ---
>   fs/f2fs/data.c   |  2 +-
>   fs/f2fs/f2fs.h   |  7 ++++++-
>   fs/f2fs/file.c   |  3 +++
>   fs/f2fs/gc.c     | 12 ++++++++++--
>   fs/f2fs/inline.c |  2 +-
>   fs/f2fs/inode.c  |  3 ++-
>   6 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 05158f89ef32..90ff0f6f7f7f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2651,7 +2651,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>   		return true;
>   	if (IS_NOQUOTA(inode))
>   		return true;
> -	if (f2fs_is_atomic_file(inode))
> +	if (f2fs_used_in_atomic_write(inode))
>   		return true;
>   	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
>   	if (f2fs_compressed_file(inode) &&
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 59c5117e54b1..4f9fd1c1d024 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4267,9 +4267,14 @@ static inline bool f2fs_post_read_required(struct inode *inode)
>   		f2fs_compressed_file(inode);
>   }
>   
> +static inline bool f2fs_used_in_atomic_write(struct inode *inode)
> +{
> +	return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode);
> +}
> +
>   static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
>   {
> -	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
> +	return f2fs_post_read_required(inode) || f2fs_used_in_atomic_write(inode);
>   }
>   
>   /*
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 25b119cf3499..c9f0ba658cfd 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2116,6 +2116,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   
>   		set_inode_flag(fi->cow_inode, FI_COW_FILE);
>   		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> +
> +		/* Set the COW inode's cow_inode to the atomic inode */
> +		F2FS_I(fi->cow_inode)->cow_inode = inode;

How about adding a union fields as below for readability?

struct f2fs_inode_info {
...
	union {
		struct inode *cow_inode;	/* copy-on-write inode for atomic write */
		struct inode *atomic_inode;	/* point to atomic_inode, available only for cow_inode */
	};
...
};

Thanks,

>   	} else {
>   		/* Reuse the already created COW inode */
>   		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 136b9e8180a3..76854e732b35 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1188,7 +1188,11 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>   	};
>   	int err;
>   
> -	page = f2fs_grab_cache_page(mapping, index, true);
> +	if (f2fs_is_cow_file(inode))
> +		page = f2fs_grab_cache_page(F2FS_I(inode)->cow_inode->i_mapping,
> +						index, true);
> +	else
> +		page = f2fs_grab_cache_page(mapping, index, true);
>   	if (!page)
>   		return -ENOMEM;
>   
> @@ -1287,7 +1291,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
>   				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
>   
>   	/* do not read out */
> -	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> +	if (f2fs_is_cow_file(inode))
> +		page = f2fs_grab_cache_page(F2FS_I(inode)->cow_inode->i_mapping,
> +						bidx, false);
> +	else
> +		page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
>   	if (!page)
>   		return -ENOMEM;
>   
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index ac00423f117b..0186ec049db6 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -16,7 +16,7 @@
>   
>   static bool support_inline_data(struct inode *inode)
>   {
> -	if (f2fs_is_atomic_file(inode))
> +	if (f2fs_used_in_atomic_write(inode))
>   		return false;
>   	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
>   		return false;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index c26effdce9aa..c810304e2681 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -807,8 +807,9 @@ void f2fs_evict_inode(struct inode *inode)
>   
>   	f2fs_abort_atomic_write(inode, true);
>   
> -	if (fi->cow_inode) {
> +	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
>   		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> +		F2FS_I(fi->cow_inode)->cow_inode = NULL;
>   		iput(fi->cow_inode);
>   		fi->cow_inode = NULL;
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
