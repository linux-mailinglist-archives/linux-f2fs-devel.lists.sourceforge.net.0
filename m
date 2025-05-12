Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 575DEAB3C0B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 17:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32Xqt4MKX47zZf4FlM62oCQLTyCqbGaXd4OVd4wvcMY=; b=CqK8Q3n7ESMwVSepgLIkZrVT4d
	4NCqCLLNZWWhhElu38A6ov84+ESrA9yJlmi7cIEsQEA5GtQSVwPJYnGYyQw3JEJ3WRbwctLH6ZF0u
	Ny4yxkvK/hLzQ9GVl9BtNem4AwihAKyhLDNrrF+TifBc8oM7ZzqXpurwSX80ESxgUv/Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEV3I-0005ka-Fc;
	Mon, 12 May 2025 15:26:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uEV34-0005kM-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 15:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3LjZ9lAkmT3W7biNhQcYsH6C5EX5HO4Ju2LfsmwGQLU=; b=KSlZiiv1en0FJbPGkwDzDSLzno
 GOiqPPeybijwu34M7bB47+MkQQK/0PyM5D9r7EMx+piErcdNEMCALbZUN92U1hDhub47OW/RhhJJv
 E+I7UEvM9SzvHmQYPfetfT55ylFzzVHY1qbSc50rgHI/ERQLpyt6UpNmxoYo90IVcdRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3LjZ9lAkmT3W7biNhQcYsH6C5EX5HO4Ju2LfsmwGQLU=; b=davdKs+bKfJEjHuSIRxFoV9KZ3
 sxEPJyT4Be4prWrT8sBu5cPqkRbPa9Wp6uEDdsZ+JBmZtcd1RAc9TU2RfMZj1eKN7idLVG1eeW7K7
 yCEWoADI33Fe2YIPbXZ+1PuTVS6+KM4CaisFFIRzc51oGQVNeubqThcCgPjQCKh7G4Tg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEV33-0001Yp-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 15:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 69D1C43A5E;
 Mon, 12 May 2025 15:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17310C4CEE7;
 Mon, 12 May 2025 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747063583;
 bh=pA0ZG+zMDkePkd5inej7Sm0/oAMcF9hcpf+JeNoh9PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LT7z55GVIECZDNL37DY79rQa1ewwJDH/PViw+7T4GWdVpfmcHO65Bj4WVsK+GVXya
 GIkaYlr9QnFVkZ4gCFN5vb03P8oAgZgzwgCtc3Tp2hHqTPbFT8FCg/1stEv74MASLY
 BkCa4GbffdLUGtt/GKXFOyxMYlSLZFiaQ0y+N/Uocpjw0+iG69sPKTE+4oZd4eGqMK
 jmLe5vwdaQwix0XDXawQmbM8GZpOIajkZtDnFsjZQorsDFSmH+Bu+KC9bvPuZ+zayF
 6t4DFFllQPm5Bk75iHMvQvivcktkr0GMdUysC08zFz2YuUbApNPeYG0ykvpijBnFMt
 UUExfzp6QIjaw==
Date: Mon, 12 May 2025 15:26:21 +0000
To: Chao Yu <chao@kernel.org>, g@google.com
Message-ID: <aCITHczkYs49uBSc@google.com>
References: <20250512115442.2640895-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512115442.2640895-1-chao@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/12, Chao Yu wrote: > Add f2fs_bug_on() to check whether
 memory preallocation will fail or > not after radix_tree_preload(GFP_NOFS
 | __GFP_NOFAIL). Are we getting a bug? > > Signed-off-by: Chao Yu
 <chao@kernel.org>
 > --- > fs/f2fs/checkpoint.c | 4 +++- > fs/f2fs/node.c | 7 +++++-- > 2 files
 changed, 8 insertions(+), 3 deletions(-) > > diff --git a/fs/f2fs/checkpoint.c
 [...] Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEV33-0001Yp-Pa
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add f2fs_bug_on() to detect
 potential bug
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Chao Yu wrote:
> Add f2fs_bug_on() to check whether memory preallocation will fail or
> not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).

Are we getting a bug?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 4 +++-
>  fs/f2fs/node.c       | 7 +++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index e7907858eb70..3f223bade520 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -504,6 +504,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>  {
>  	struct inode_management *im = &sbi->im[type];
>  	struct ino_entry *e = NULL, *new = NULL;
> +	int ret;
>  
>  	if (type == FLUSH_INO) {
>  		rcu_read_lock();
> @@ -516,7 +517,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>  		new = f2fs_kmem_cache_alloc(ino_entry_slab,
>  						GFP_NOFS, true, NULL);
>  
> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	f2fs_bug_on(sbi, ret);
>  
>  	spin_lock(&im->ino_lock);
>  	e = radix_tree_lookup(&im->ino_root, ino);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 3f6b8037d25f..88d3032236cb 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2309,7 +2309,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>  	struct free_nid *i, *e;
>  	struct nat_entry *ne;
> -	int err = -EINVAL;
> +	int err;
>  	bool ret = false;
>  
>  	/* 0 nid should not be used */
> @@ -2323,7 +2323,10 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>  	i->nid = nid;
>  	i->state = FREE_NID;
>  
> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	err = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	f2fs_bug_on(sbi, err);
> +
> +	err = -EINVAL;
>  
>  	spin_lock(&nm_i->nid_list_lock);
>  
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
