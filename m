Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF2861E2D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 21:53:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdcXV-0002PV-0Z;
	Fri, 23 Feb 2024 20:53:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rdcXP-0002PB-3i
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0u9clDddRLi9RIwSmx2nJe0xUU8jjC81Dqb6SJulUZU=; b=PIZXcsZIajm7qKfkTkEZNJlFem
 wA2iLRbHl3a3XXK42p/Vh8WIQQmdAeKVHZ8n9OKrzFSUfXo5oUO9+AsvqbtjEv1dWexqUEysqIGAk
 0UnRAJA/K2gKa+8am5B5sQqOr/dq3PhkeYL+MUF20Pek4vAKmvSV4P5R+StpUsJch7iE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0u9clDddRLi9RIwSmx2nJe0xUU8jjC81Dqb6SJulUZU=; b=NHrbz/x9kVCONtjBod7t2DldfQ
 HmvI5/nJmq3lHx81NI9Tp/86gnKuNkwebhuXWoX9SHw0az6+3Tv6jeAUC/hOeMJFmDUcXFOgkMb38
 YGQrz8gx5wP8IncIYCqXktJOzkwQuOK0tKpf6/kN8XgabBr4mQ4ijxm0KwEfqeRvl6Dc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdcXL-0002fV-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32576615AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Feb 2024 20:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF4FC433C7;
 Fri, 23 Feb 2024 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708721565;
 bh=q7R6IgPxIsCPMj1t4tCxec6CBo+3s7llxTM3no8YXIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mMzxHdcl+hB2M5VyoTwKgnxDrAxFH6ZYh9bZSaw1usySdggmS6VNgqi0JGXtBBx4A
 Fm7B+DaDx/Hewu+nBTgYy1iewHDuhy88fenANA/j/adwft+L4hQJfxdMm+yzY4Of1N
 k9v5OaDY7jjLWHTdTBWKsZgY4IpvGSXTmSOxzMc6MTbcssm3HDEMAGWuuQE6mVlPXm
 AzkpP8m1VIpkYpl6Bd1XkH1NPdyxycNoztFMGA14PVX6Xe3/+5ZIvHzckbQECR4eS8
 +RXvVwBfoS/UmvpUhPJZnHH+R0JWJ/0+ifPrI2kTULjqpUTdZlNgRbijiAbNdwpOfP
 IckR3cOZA8Nkw==
Date: Fri, 23 Feb 2024 12:52:44 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZdkFnLirvxRdenX0@google.com>
References: <20240223025403.1180558-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223025403.1180558-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/23,
 Chao Yu wrote: > @type in f2fs_allocate_data_block()
 indicates log header's type,
 it > can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, 
 rather than > type of data/node, however IS_DAT [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdcXL-0002fV-Kl
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use correct segment type in
 f2fs_allocate_data_block()
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

On 02/23, Chao Yu wrote:
> @type in f2fs_allocate_data_block() indicates log header's type, it
> can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than
> type of data/node, however IS_DATASEG()/IS_NODESEG() only accept later
> one, fix it.
> 
> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/segment.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index d0209ea77dd2..76422f50e6cc 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3505,12 +3505,12 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
>  	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
>  
> -	if (IS_DATASEG(type))
> +	if (IS_DATASEG(se->type))

We have se only when type is CURSEG_ALL_DATA_ATGC. We may need to change
IS_DATASEG()?

>  		atomic64_inc(&sbi->allocated_data_blocks);
>  
>  	up_write(&sit_i->sentry_lock);
>  
> -	if (page && IS_NODESEG(type)) {
> +	if (page && IS_NODESEG(se->type)) {
>  		fill_node_footer_blkaddr(page, NEXT_FREE_BLKADDR(sbi, curseg));
>  
>  		f2fs_inode_chksum_set(sbi, page);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
