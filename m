Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD09CB810F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 18:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao9JGkPzoRWPyZERI9Q6zh7x0RND+NzdDlBvPD5hhvw=; b=PgZ6TgEyhRRISr6za/WPVOQhP5
	GLszW5YQy6x7TuO20UQASsO+IoOkKRK8yeRnqRWvSNuZhj4YwxGvMpDv1DjkepNcu3/N52t4n6LRz
	/QsJMLzGwGxwnn2mdoEcMs9vEcwZzd7z8x6/h9oMpVkLqMV0Qim2wEJhDkQyfX1mHBZs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyvDH-0007e9-Rv;
	Wed, 17 Sep 2025 16:41:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uyvDF-0007dt-Q6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 16:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rF0BGPW4EgBlY6h86GReU1aE0ZfJo6GhquXvke9cY9k=; b=BYb7DEHIjiAXGqkcSU+HWWZzeg
 b8UYtlz6IafajN/CWNgcfjW736d0ZkB1rDOFwNdc0sGK5G/rxgNOipYaT/JRLB1ka1iIltW4xz23k
 LcXYTWGyxS7/acsXHCnmqhOQaObQTH8QDY4c5SPzQXpZnquDH/m13K08p8fqEzLYTXQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rF0BGPW4EgBlY6h86GReU1aE0ZfJo6GhquXvke9cY9k=; b=iR+WO4K11B5MbI8jnNz82/Etpw
 6i4PBCk4hdctw/S0WzJpRuP53QTpY2VZH03wwrXnuLvCvrRWP3R7tUlLKCYdHgbKHyAPX/7s9bgS0
 mU9A5zqU3Oea/E7hZLVd5D411UpuAwLHdkWzDbuN6ktjIGNQOM/KGbfvR0AEB4w/d5DM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyvDG-0003NB-7B for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 16:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E259040716;
 Wed, 17 Sep 2025 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A759C4CEE7;
 Wed, 17 Sep 2025 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758127247;
 bh=t265j7wNSfpNgOBxQuSzDaR6dcQPQOBwaaoIlTZ29HE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XHjgSOP0ShEtUf2XQIGYxRFK7jVnslydi9EFONQnBN9uirIzJDxAbujHSZpEPoiL+
 KxY/cnu8MsY0ss/w082BsG5l+gF64oF4ypnkmt4ghjgQKXjxFv3xloMQFeqx+3waGV
 N3JRrEs2Enm2qAjJTo8nQKLjBAtFomW1oQ4Prnih2fLjwe/J1d9D5m8OYiF6KM1X2c
 d+DeSqIISmfKze88Dh2u8u481fqgm/O9qoCr30L+Y3ZelIUkIm4zN3oEpOpfFgh3Y8
 hgQN2WRaQtjAkjk1xuYBRCBWDXIsRCFwExcNLjEXfhCKRY0hBkJ3eBwf1NZaHr5vtU
 +VB+MXb5ziTjA==
Date: Wed, 17 Sep 2025 16:40:45 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aMrkjSRJ0yyEfvfl@google.com>
References: <20250916085243.4165099-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916085243.4165099-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Do we need this? On 09/16,
 Chao Yu wrote: > Add a sanity check
 in __update_extent_tree_range() to detect any > zero-sized extent update.
 > > Signed-off-by: wangzijie <wangzijie1@honor.com> > Signed-off-by: Chao
 Yu <ch [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyvDG-0003NB-7B
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sanity check on ei.len in
 __update_extent_tree_range()
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Do we need this?

On 09/16, Chao Yu wrote:
> Add a sanity check in __update_extent_tree_range() to detect any
> zero-sized extent update.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/extent_cache.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 199c1e7a83ef..3070d1cb0676 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -664,6 +664,15 @@ static void __update_extent_tree_range(struct inode *inode,
>  	if (!et)
>  		return;
>  
> +	if (unlikely(len == 0)) {
> +		f2fs_err_ratelimited(sbi, "%s: extent len is zero, type: %d, "
> +			"extent [%u, %u, %u], age [%llu, %llu]",
> +			__func__, type, tei->fofs, tei->blk, tei->len,
> +			tei->age, tei->last_blocks);
> +		f2fs_bug_on(sbi, 1);
> +		return;
> +	}
> +
>  	if (type == EX_READ)
>  		trace_f2fs_update_read_extent_tree_range(inode, fofs, len,
>  						tei->blk, 0);
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
