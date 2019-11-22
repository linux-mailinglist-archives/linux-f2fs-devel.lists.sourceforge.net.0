Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED12107609
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2019 17:53:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iYCBp-0006Mu-8Z; Fri, 22 Nov 2019 16:53:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iYCBn-0006Mn-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 16:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GVyP3qohTM4ZcHOJFrXk4YIsWCiqJCVX3D6C+EpUpJ0=; b=OKXILgweArHQiHCMcxANxbimLk
 o8z1RLV67RU4/4uMQg+SgYZ6KadnHSsZ158ahiH2LMEbo2zbS7Yi6rgFKctj74sKCDzvbyN3dPjvD
 Mv5BGH7Fs/+dVxZ3ko4RrNo163Fk7pNzFzda0JQtPj+c7GjGyiJnVymtu/mtWpUXt7CA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GVyP3qohTM4ZcHOJFrXk4YIsWCiqJCVX3D6C+EpUpJ0=; b=jzeeXb3m5MVVEQbn0fC+b13WX4
 XafgbWGmWi1ZDKz8dfNDjvMcoI/I3S1Uz8pPbfHnkLkKp+0T+/xsBYZ9DPAzGH5M6cyEBNJWLFr73
 2DVTny6Z6EjT3TS9aEPPEYRynbmMfBSt6YBogEQTNJvEVgMAMVDBnJOCjN+zyTORS6+k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iYCBl-000gyn-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 16:53:47 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3102320672;
 Fri, 22 Nov 2019 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574441610;
 bh=JQc+KsF5lzYeruxmK9jO7TjWnowAWT5i/fC5nqNh9ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BxYNl3gOYcqHLHgxDw4SbW5djxQLCNTFdwfPdsxPK6/g+yjSx35G1d/ade4NlhvJO
 3cx1Ze3kd0wePIUlDcplMgcxiE73WnQG82V0APZ+6a9njWyp6h34pdJ1cJf66T/vV9
 uo3T2Le8MANxKTaxOC2SP8iFvn9+Jc6Gu0YIy9NM=
Date: Fri, 22 Nov 2019 08:53:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20191122165328.GA74621@jaegeuk-macbookpro.roam.corp.google.com>
References: <1573641063-21232-1-git-send-email-stummala@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573641063-21232-1-git-send-email-stummala@codeaurora.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1iYCBl-000gyn-Fx
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix deadlock in f2fs_gc() context
 during atomic files handling
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

On 11/13, Sahitya Tummala wrote:
> The FS got stuck in the below stack when the storage is almost
> full/dirty condition (when FG_GC is being done).
> 
> schedule_timeout
> io_schedule_timeout
> congestion_wait
> f2fs_drop_inmem_pages_all
> f2fs_gc
> f2fs_balance_fs
> __write_node_page
> f2fs_fsync_node_pages
> f2fs_do_sync_file
> f2fs_ioctl
> 
> The root cause for this issue is there is a potential infinite loop
> in f2fs_drop_inmem_pages_all() for the case where gc_failure is true
> and when there an inode whose i_gc_failures[GC_FAILURE_ATOMIC] is
> not set. Fix this by keeping track of the total atomic files
> currently opened and using that to exit from this condition.
> 
> Fix-suggested-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
> v2:
> - change fix as per Chao's suggestion
> - decrement sbi->atomic_files protected under sbi->inode_lock[ATOMIC_FILE] and
>   only when atomic flag is cleared for the first time, otherwise, the count
>   goes to an invalid/high value as f2fs_drop_inmem_pages() can be called from
>   two contexts at the same time.
> 
>  fs/f2fs/f2fs.h    |  1 +
>  fs/f2fs/file.c    |  1 +
>  fs/f2fs/segment.c | 21 +++++++++++++++------
>  3 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c681f51..e04a665 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1297,6 +1297,7 @@ struct f2fs_sb_info {
>  	unsigned int gc_mode;			/* current GC state */
>  	unsigned int next_victim_seg[2];	/* next segment in victim section */
>  	/* for skip statistic */
> +	unsigned int atomic_files;              /* # of opened atomic file */
>  	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
>  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f6c038e..22c4949 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1919,6 +1919,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>  	if (list_empty(&fi->inmem_ilist))
>  		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
> +	sbi->atomic_files++;
>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>  
>  	/* add inode in inmem_list first and set atomic_file */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index da830fc..0b7a33b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -288,6 +288,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
>  	struct list_head *head = &sbi->inode_list[ATOMIC_FILE];
>  	struct inode *inode;
>  	struct f2fs_inode_info *fi;
> +	unsigned int count = sbi->atomic_files;
> +	unsigned int looped = 0;
>  next:
>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>  	if (list_empty(head)) {
> @@ -296,22 +298,26 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
>  	}
>  	fi = list_first_entry(head, struct f2fs_inode_info, inmem_ilist);
>  	inode = igrab(&fi->vfs_inode);
> +	if (inode)
> +		list_move_tail(&fi->inmem_ilist, head);
>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>  
>  	if (inode) {
>  		if (gc_failure) {
> -			if (fi->i_gc_failures[GC_FAILURE_ATOMIC])
> -				goto drop;
> -			goto skip;
> +			if (!fi->i_gc_failures[GC_FAILURE_ATOMIC])
> +				goto skip;
>  		}
> -drop:
>  		set_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
>  		f2fs_drop_inmem_pages(inode);
> +skip:
>  		iput(inode);
>  	}
> -skip:
>  	congestion_wait(BLK_RW_ASYNC, HZ/50);
>  	cond_resched();
> +	if (gc_failure) {
> +		if (++looped >= count)

There is a race condition when handling sbi->atomic_files?

> +			return;
> +	}
>  	goto next;
>  }
>  
> @@ -327,13 +333,16 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>  		mutex_unlock(&fi->inmem_lock);
>  	}
>  
> -	clear_inode_flag(inode, FI_ATOMIC_FILE);
>  	fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
>  	stat_dec_atomic_write(inode);
>  
>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>  	if (!list_empty(&fi->inmem_ilist))
>  		list_del_init(&fi->inmem_ilist);
> +	if (f2fs_is_atomic_file(inode)) {
> +		clear_inode_flag(inode, FI_ATOMIC_FILE);
> +		sbi->atomic_files--;
> +	}
>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>  }
>  
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
