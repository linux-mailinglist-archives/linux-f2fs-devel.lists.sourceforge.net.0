Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996A1B6A3D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Apr 2020 02:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jRm17-0007hu-AP; Fri, 24 Apr 2020 00:16:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jRm15-0007hf-Cw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Apr 2020 00:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YFmTtUdmMYJPTdqj/yLJw5DeThCcpTgDoj8tl5Btgcw=; b=H2wqk6YuEBWTtrPX3GHGEQir/d
 Nn4SxjgUTsKrvufWFCG7BGN/v3Gf+cIkE4+XHfL/pRLfrm4T/X/6swyW5z7juBJ1nuJ8Y2hbQNuTN
 Ta+9t/xue90sroODVh7OSdCp3uSko46wYyw96U0jtTfuJZUMUBKXNbbesj0G3v6Ts3Hw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YFmTtUdmMYJPTdqj/yLJw5DeThCcpTgDoj8tl5Btgcw=; b=J0jky0lprdPPEgqMBXTvlEyFiw
 ec5aQHwbRmFrNpKdfH4xO8kJ+ML31Kh/04ApktkqY35776CcOtLKe6nWfuhOnzpd8OZDuy2dWCTe1
 uSSKknvXORT05XYz2UQVMqxgA1Aomm5BDXiLO/J/zU/mHJuelMDYw5BjqLXi6qeyVCUM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jRm13-00Bsyu-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Apr 2020 00:16:27 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A21CC20CC7;
 Fri, 24 Apr 2020 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587687379;
 bh=OdoPiLVtyTKEI0DuaHYOuft8FO03Y+aJmEEYHn2bTyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYF725AwD7DGwMZo/fuDIwPQ7x4nFOxEvpuA8iC+U/+4jJu0ce5FhHgLfUjjUvNXV
 iht7mfch5R3y+2mN/H/kJe4VPyA6VKaobvvTmdQI0l2a6PaBw7DHqR+9cgUnMNkUnt
 4M3+H3+QQqfEoQFQ9rufRlQ4HXp2N1NjbIuS9lDA=
Date: Thu, 23 Apr 2020 17:16:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sayali Lokhande <sayalil@codeaurora.org>
Message-ID: <20200424001619.GA109617@google.com>
References: <1587636832-17939-1-git-send-email-sayalil@codeaurora.org>
 <20200423201922.GB99191@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423201922.GB99191@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jRm13-00Bsyu-Aq
Subject: Re: [f2fs-dev] [PATCH] f2fs: Avoid double lock for cp_rwsem
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

On 04/23, Jaegeuk Kim wrote:
> On 04/23, Sayali Lokhande wrote:
> > Call stack :
> > f2fs_write_checkpoint()
> > -> block_operations(sbi)
> >     f2fs_lock_all(sbi);
> >      down_write(&sbi->cp_rwsem); => write lock held
> > <>
> > -> f2fs_sync_node_pages()
> >     if (is_inline_node(page))
> >      flush_inline_data()
> > 	page = f2fs_pagecache_get_page()
> >          if (!page)
> >            goto iput_out;
> > 	iput_out:
> > 	 iput(inode);
> >           -> f2fs_evict_inode()
> > 	      f2fs_truncate_blocks()
> > 	       f2fs_lock_op()
> > 	        down_read(&sbi->cp_rwsem); => read lock fail
> 
> How about this, since we don't actually need to flush inline_data?

Hmm, nvm. This causes no space panic regressed during xfstests.

> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 4da0d8713df5c..9af8d5319fdd3 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1871,7 +1871,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>                         }
> 
>                         /* flush inline_data */
> -                       if (is_inline_node(page)) {
> +                       if (is_inline_node(page) && io_type != FS_CP_NODE_IO) {
>                                 clear_inline_node(page);
>                                 unlock_page(page);
>                                 flush_inline_data(sbi, ino_of_node(page));
> 
> > 
> > Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> > ---
> >  fs/f2fs/checkpoint.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 5ba649e..5c504cf 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1219,21 +1219,19 @@ static int block_operations(struct f2fs_sb_info *sbi)
> >  		goto retry_flush_quotas;
> >  	}
> >  
> > -retry_flush_nodes:
> >  	down_write(&sbi->node_write);
> >  
> >  	if (get_pages(sbi, F2FS_DIRTY_NODES)) {
> >  		up_write(&sbi->node_write);
> > +		f2fs_unlock_all(sbi);
> >  		atomic_inc(&sbi->wb_sync_req[NODE]);
> >  		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
> >  		atomic_dec(&sbi->wb_sync_req[NODE]);
> > -		if (err) {
> > -			up_write(&sbi->node_change);
> > -			f2fs_unlock_all(sbi);
> > +		up_write(&sbi->node_change);
> > +		if (err)
> >  			goto out;
> > -		}
> >  		cond_resched();
> > -		goto retry_flush_nodes;
> > +		goto retry_flush_quotas;
> >  	}
> >  
> >  	/*
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
