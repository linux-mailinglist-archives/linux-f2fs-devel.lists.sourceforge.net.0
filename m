Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 563618C124A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 May 2024 17:53:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5655-00058e-Dr;
	Thu, 09 May 2024 15:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1s5654-00058X-AC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 May 2024 15:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ThZkXguEyN1vvxqOgIvMYOR0ltr7SZkHgg5yGR0mQmo=; b=Dg+/u7wdOacU1Mgn9aeUbUSnvx
 lAdsfkTrtBdewKKty785rSLKYc3ww5ivjfpcgMuKJxA4z69uEqx8NDgWtfdqx4BjxAsK4uBp9EGem
 46yuhGKiGIEciEIzDpIAfZDfQfxgOhNHEr9j2rR6Kt0Pn/A6nFpz2PfHDGeRGnQvpJtk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ThZkXguEyN1vvxqOgIvMYOR0ltr7SZkHgg5yGR0mQmo=; b=DLDntwaW7h2fs3elWjM/0Upm1O
 oueozRkxZqn2+oiP7zGPKsw3n/qL8OEW8Mhb3eAeX1VF65uceQLAz8Wu2VOxssOeFd1iFfJ7Z66xf
 iqfaAzrwtxLDGifPk8datptjUyLBqwjWGqSzf0WNK1x0JjwC+aKasBha9ORS1cDmEbS8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5653-00084G-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 May 2024 15:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CD3B8CE1B27;
 Thu,  9 May 2024 15:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57E6C116B1;
 Thu,  9 May 2024 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715269980;
 bh=EyTwGmTH6PChSbRLYLFE7d/gisUiJhHgzpqM5Qc1hCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fmxnUoNQ0HMljqxekQNwpiEU3pr0qzZotqFdeU4FWe3sUCVO+IoCENO4XfPH8b1Ul
 yogZ/YJVL48PLj6Ap7nnQAwUbF5OXNS9AznxxtHWMK3uGWbhAi4ba0JNNgrfCOgM2L
 WyCNt4Vxs8xQOEEJqm5jHhevpo6XNievOB+5oq7kEFKQkHTTpKzXLUe+XeJ17403wd
 mMkD4nphS0bsjc58yKG+4w2yerBPmBx0Q/D9U8WJAy+mbKo35/IZ/YHmk3ZMRh0anG
 jxCadXoIv7wLGBL7onfgPHfs/ppPgUWGk0Hl10u8yVivifSP3jY9Os6iPvLvYMipY7
 9FSyB/GP8xfVw==
Date: Thu, 9 May 2024 15:52:58 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZjzxWp4-wmpCzBeB@google.com>
References: <20240506103313.773503-1-chao@kernel.org>
 <20240506103313.773503-3-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506103313.773503-3-chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/06,
 Chao Yu wrote: > syzbot reports a f2fs bug as below:
 > > [ cut here ] > kernel BUG at fs/f2fs/inline.c:258! > CPU: 1 PID: 34 Comm:
 kworker/u8:2 Not tainted 6.9.0-rc6- [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5653-00084G-Bc
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to do sanity check on i_nid
 for inline_data inode
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/06, Chao Yu wrote:
> syzbot reports a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inline.c:258!
> CPU: 1 PID: 34 Comm: kworker/u8:2 Not tainted 6.9.0-rc6-syzkaller-00012-g9e4bc4bcae01 #0
> RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
> Call Trace:
>  f2fs_write_single_data_page+0xb65/0x1d60 fs/f2fs/data.c:2834
>  f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
>  __f2fs_write_data_pages fs/f2fs/data.c:3288 [inline]
>  f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3315
>  do_writepages+0x35b/0x870 mm/page-writeback.c:2612
>  __writeback_single_inode+0x165/0x10b0 fs/fs-writeback.c:1650
>  writeback_sb_inodes+0x905/0x1260 fs/fs-writeback.c:1941
>  wb_writeback+0x457/0xce0 fs/fs-writeback.c:2117
>  wb_do_writeback fs/fs-writeback.c:2264 [inline]
>  wb_workfn+0x410/0x1090 fs/fs-writeback.c:2304
>  process_one_work kernel/workqueue.c:3254 [inline]
>  process_scheduled_works+0xa12/0x17c0 kernel/workqueue.c:3335
>  worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
>  kthread+0x2f2/0x390 kernel/kthread.c:388
>  ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> The root cause is: inline_data inode can be fuzzed, so that there may
> be valid blkaddr in its direct node, once f2fs triggers background GC
> to migrate the block, it will hit f2fs_bug_on() during dirty page
> writeback.
> 
> Let's add sanity check on i_nid field for inline_data inode, meanwhile,
> forbid to migrate inline_data inode's data block to fix this issue.
> 
> Reported-by: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000d103ce06174d7ec3@google.com
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h   |  2 +-
>  fs/f2fs/gc.c     |  6 ++++++
>  fs/f2fs/inline.c | 17 ++++++++++++++++-
>  fs/f2fs/inode.c  |  2 +-
>  4 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index fced2b7652f4..c876813b5532 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4146,7 +4146,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
>   * inline.c
>   */
>  bool f2fs_may_inline_data(struct inode *inode);
> -bool f2fs_sanity_check_inline_data(struct inode *inode);
> +bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage);
>  bool f2fs_may_inline_dentry(struct inode *inode);
>  void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
>  void f2fs_truncate_inline_inode(struct inode *inode,
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index e86c7f01539a..041957750478 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1563,6 +1563,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  				continue;
>  			}
>  
> +			if (f2fs_has_inline_data(inode)) {
> +				iput(inode);
> +				set_sbi_flag(sbi, SBI_NEED_FSCK);
> +				continue;

Any race condtion to get this as false alarm?

> +			}
> +
>  			err = f2fs_gc_pinned_control(inode, gc_type, segno);
>  			if (err == -EAGAIN) {
>  				iput(inode);
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index ac00423f117b..067600fed3d4 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -33,11 +33,26 @@ bool f2fs_may_inline_data(struct inode *inode)
>  	return !f2fs_post_read_required(inode);
>  }
>  
> -bool f2fs_sanity_check_inline_data(struct inode *inode)
> +static bool has_node_blocks(struct inode *inode, struct page *ipage)
> +{
> +	struct f2fs_inode *ri = F2FS_INODE(ipage);
> +	int i;
> +
> +	for (i = 0; i < DEF_NIDS_PER_INODE; i++) {
> +		if (ri->i_nid[i])
> +			return true;
> +	}
> +	return false;
> +}
> +
> +bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage)
>  {
>  	if (!f2fs_has_inline_data(inode))
>  		return false;
>  
> +	if (has_node_blocks(inode, ipage))
> +		return false;
> +
>  	if (!support_inline_data(inode))
>  		return true;
>  
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index c26effdce9aa..1423cd27a477 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -343,7 +343,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		}
>  	}
>  
> -	if (f2fs_sanity_check_inline_data(inode)) {
> +	if (f2fs_sanity_check_inline_data(inode, node_page)) {
>  		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
>  			  __func__, inode->i_ino, inode->i_mode);
>  		return false;
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
