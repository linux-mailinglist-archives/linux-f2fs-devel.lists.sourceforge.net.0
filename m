Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29E525776
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 23:57:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npGod-0007Pr-VR; Thu, 12 May 2022 21:57:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npGoc-0007Pl-LY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 21:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6VyvXO72eL12iY40tthMXZQ5WZSV341U3V824MC214=; b=Ogm1EdET8Ns4h/rAHWS2NljWMX
 DtUAZwxRQTWie1ZN/kjfYJ/QoQ03w8c0BFIr0bH5UIsjXdsMso1sARSxGqLgbeSkhkh9o4v3TVtxp
 YqV5/+TV4dzSSDYekHY011Au3Dh5v1lQS1sULcaMXtj/XxydURLeDoht011WA5Iv1imk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G6VyvXO72eL12iY40tthMXZQ5WZSV341U3V824MC214=; b=Mi2F3spTOl9rlAORbQaWFv27T8
 cGs1yjK7ZOPzUKWoRdLujDG/02p3WntCKzFj0ZLZW722K9bijh7nkjo+E6tUbObt60cq87iNTb0Bw
 RjSJEOmBAnKhtE7c6uNF05tmIpCMD1gXwjhocTaPh6vl3ZJaPePDfD7j8DSGyJwNVZQU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npGoZ-00027O-Dg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 21:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20440B82910;
 Thu, 12 May 2022 21:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80BCC385B8;
 Thu, 12 May 2022 21:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652392655;
 bh=yU6s+/+h1gRHCRJ83nqrVGKUBm1fWFm2gD7n/no4qEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OfRePn8vFReViGnjqaf4Nuft1lzf0vc4DKD3h+LbhvH6CM39JZSzNUPEntffy6ttr
 g6X8q5mMz1ISEEbjxJXT15mcjtbt8vm3zdrFTOfzVIH7h1o0o96np1souzIUJxNWw/
 kNjIwLU3cSe2ruxp8kQ6d6QSw9xQtjGToehOCDS8BNr0KKPRYXRiqpMx9INN3e3kkL
 R3HqBa/hYDEFwM/o38E8P8x7PVA7GTA/vifavMuEVY9nBZohrRq9dfrgkzVYf7aOw7
 U3DFUr3W2eifkwpn4rMCjzomDJEf0vqkRmwGhxxWt+DZlX5OL0Yx0hx7063xnULI4i
 TkghMnuhvOn7A==
Date: Thu, 12 May 2022 14:57:34 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yn2CztiJUY2UAjnd@google.com>
References: <20220512082116.2991611-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512082116.2991611-1-chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/12, Chao Yu wrote: > Pinning a file is heavy, because
 skipping pinned files make GC > running with heavy load or no effect. > >
 So that this patch proposes to separate nocow and pinfile semantic [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npGoZ-00027O-Dg
Subject: Re: [f2fs-dev] [PATCH] f2fs: separate NOCoW and pinfile semantics
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Chao Yu wrote:
> Pinning a file is heavy, because skipping pinned files make GC
> running with heavy load or no effect.
> 
> So that this patch proposes to separate nocow and pinfile semantics:
> - NOCoW flag can only be set on regular file.
> - NOCoW file will only trigger IPU at common writeback/flush.
> - NOCow file will do OPU during GC.
> 
> This flag can satisfying the demand of:
> 1) avoiding fragment of file's physical block
> 2) userspace doesn't want to pin file's physical address
> 
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
>  fs/f2fs/data.c |  3 ++-
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/file.c | 25 ++++++++++++++++++++++++-
>  3 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 54a7a8ad994d..c8eab78f7d89 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2495,7 +2495,8 @@ bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
>  	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>  		return false;
>  
> -	if (f2fs_is_pinned_file(inode))
> +	if (f2fs_is_pinned_file(inode) ||
> +			F2FS_I(inode)->i_flags & F2FS_NOCOW_FL)
>  		return true;
>  
>  	/* if this is cold file, we should overwrite to avoid fragmentation */
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 492af5b96de1..e91ece55f5e8 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2916,6 +2916,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
>  #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
>  #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
> +#define F2FS_NOCOW_FL			0x00800000 /* Do not cow file */
>  #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
>  #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 09287876dbb7..7f92a3a157f7 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1851,6 +1851,20 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  	if (IS_NOQUOTA(inode))
>  		return -EPERM;
>  
> +	if ((iflags ^ masked_flags) & F2FS_NOCOW_FL) {
> +		int ret;
> +
> +		if (!S_ISREG(inode->i_mode))
> +			return -EINVAL;
> +		if (f2fs_should_update_outplace(inode, NULL))
> +			return -EINVAL;
> +		if (f2fs_is_pinned_file(inode))
> +			return -EINVAL;
> +		ret = f2fs_convert_inline_inode(inode);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
>  		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>  			return -EOPNOTSUPP;
> @@ -1926,6 +1940,7 @@ static const struct {
>  	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
>  	{ F2FS_INDEX_FL,	FS_INDEX_FL },
>  	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
> +	{ F2FS_NOCOW_FL,	FS_NOCOW_FL },
>  	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
>  	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
>  };
> @@ -1957,7 +1972,8 @@ static const struct {
>  		FS_NOCOMP_FL |		\
>  		FS_DIRSYNC_FL |		\
>  		FS_PROJINHERIT_FL |	\
> -		FS_CASEFOLD_FL)
> +		FS_CASEFOLD_FL |	\
> +		FS_NOCOW_FL)
>  
>  /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
>  static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
> @@ -3081,6 +3097,13 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  
>  	inode_lock(inode);
>  
> +	if (F2FS_I(inode)->i_flags & F2FS_NOCOW_FL) {
> +		f2fs_info(F2FS_I_SB(inode), "inode (%lu) is already NOCOW one",
> +			inode->i_ino);
> +		ret = -EINVAL;

Why rejecting this? We can pin the file to get 2MB-aligned allocation on the
NOCOW file.

> +		goto out;
> +	}
> +
>  	if (!pin) {
>  		clear_inode_flag(inode, FI_PIN_FILE);
>  		f2fs_i_gc_failures_write(inode, 0);
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
