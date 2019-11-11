Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E2F6D60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 04:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iU0ZJ-0002Ge-Ng; Mon, 11 Nov 2019 03:40:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1iU0ZI-0002GX-S0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 03:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cg1JqKPIV/dPjDheS8NxSoihbXZIuWShz1wZdZbFa6A=; b=CEr4MQYixrhcnmt7NREJlSzlr8
 T2J1GvQYiarnw/+c17PLWHy++5+2s4W1WTMmE8qe3b0mKjYEsY8ZR03lJ6xyu6B9WzUHZ+D3tZTF+
 ZUNu/OwJkV6TJOrKGLD7BQkRDgBLKRoSihBguRkv/DOyD5ZyOfnOtntzavVmY/Fmj+iw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cg1JqKPIV/dPjDheS8NxSoihbXZIuWShz1wZdZbFa6A=; b=BGJHOLjbLuNcuUa8cMH2y8uond
 QgrmKTzhwzZ93D619hZ87YDbT/cAeMg4x3pMuZYGKQ+bGdmO+2ZmqE9mMOM2X0CPAdeLDJMGo699+
 zCb9+QrkYL+0hhlc1xn+AlaannABfPYlcfM3oj30wqqshkQZ+KMwegGVt7qsEjWIY3LQ=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iU0ZH-00BPS6-Fu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 03:40:44 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4166160AD7; Mon, 11 Nov 2019 03:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1573443632;
 bh=VoCqpZZXU+TD/E9dWol0mbo7gHobw0MXsVNk3M7Cy80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtsmLR0RJu1xWkbg/WF5av1vzVST5PNnmvAVxeMTXNzXRUkIy6BEpqJf9RbIxkyWS
 MQUpVjeXshnPS8O9VA37M9BcRdUuXEiBls1SbEDQwvwV1CH5IHZ0I4byZ4rO03Fpo2
 DCFk59rQxZiVGBQy965pEMFTrvlHvA4azNJNNHEY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C6B8060A44;
 Mon, 11 Nov 2019 03:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1573443631;
 bh=VoCqpZZXU+TD/E9dWol0mbo7gHobw0MXsVNk3M7Cy80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEHgty6qk/Mfkkc+2Pp6a01exzvM0lQDuEHQBL6y+8bPWJY2nOhL1r6IkJBWO9eMS
 EZc29bGAEwLm4CcHhnGdwmVBnd341YDh6YaqLEFIWBA4RoUjMjYXR9ug11Lq76jefa
 sG7nHIMBxRHwHq9nboitHJjyYMEK4bQIgJYoLD+o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6B8060A44
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 11 Nov 2019 09:10:26 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191111034026.GA15669@codeaurora.org>
References: <1573211027-30785-1-git-send-email-stummala@codeaurora.org>
 <5c491884-91d3-5b85-6d49-569a8d06f3a3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c491884-91d3-5b85-6d49-569a8d06f3a3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-Headers-End: 1iU0ZH-00BPS6-Fu
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix deadlock under storage almost
 full/dirty condition
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Mon, Nov 11, 2019 at 10:51:10AM +0800, Chao Yu wrote:
> On 2019/11/8 19:03, Sahitya Tummala wrote:
> > There could be a potential deadlock when the storage capacity
> > is almost full and theren't enough free segments available, due
> > to which FG_GC is needed in the atomic commit ioctl as shown in
> > the below callstack -
> > 
> > schedule_timeout
> > io_schedule_timeout
> > congestion_wait
> > f2fs_drop_inmem_pages_all
> > f2fs_gc
> > f2fs_balance_fs
> > __write_node_page
> > f2fs_fsync_node_pages
> > f2fs_do_sync_file
> > f2fs_ioctl
> > 
> > If this inode doesn't have i_gc_failures[GC_FAILURE_ATOMIC] set,
> > then it waits forever in f2fs_drop_inmem_pages_all(), for this
> > atomic inode to be dropped. And the rest of the system is stuck
> > waiting for sbi->gc_mutex lock, which is acquired by f2fs_balance_fs()
> > in the stack above.
> 
> I think the root cause of this issue is there is potential infinite loop in
> f2fs_drop_inmem_pages_all() for the case of gc_failure is true, because once the
> first inode in inode_list[ATOMIC_FILE] list didn't suffer gc failure, we will
> skip dropping its in-memory cache and calling iput(), and traverse the list
> again, most possibly there is the same inode in the head of that list.
> 

I thought we are expecting for those atomic updates (without any gc failures) to be
committed by doing congestion_wait() and thus retrying again. Hence, I just
fixed only if we are ending up waiting for commit to happen in the atomic
commit path itself, which will be a deadlock.

> Could you please check below fix:
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 7bf7b0194944..8a3a35b42a37 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1395,6 +1395,7 @@ struct f2fs_sb_info {
>  	unsigned int gc_mode;			/* current GC state */
>  	unsigned int next_victim_seg[2];	/* next segment in victim section */
>  	/* for skip statistic */
> +	unsigned int atomic_files;		/* # of opened atomic file */
>  	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
>  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ecd063239642..79f4b348951a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>  	if (list_empty(&fi->inmem_ilist))
>  		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
> +	sbi->atomic_files++;
>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> 
>  	/* add inode in inmem_list first and set atomic_file */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8b977bbd6822..6aa0bb693697 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -288,6 +288,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi,
> bool gc_failure)
>  	struct list_head *head = &sbi->inode_list[ATOMIC_FILE];
>  	struct inode *inode;
>  	struct f2fs_inode_info *fi;
> +	unsigned int count = sbi->atomic_files;

If the sbi->atomic_files decrements just after this, then the below exit condition
may not work. In that case, looped will never be >= count.

> +	unsigned int looped = 0;
>  next:
>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>  	if (list_empty(head)) {
> @@ -296,22 +298,29 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi,
> bool gc_failure)
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

Does this result into f2fs_evict_inode() in this context for this inode?

thanks,

>  	}
> -skip:
> +
>  	congestion_wait(BLK_RW_ASYNC, HZ/50);
>  	cond_resched();
> +
> +	if (gc_failure) {
> +		if (++looped >= count)
> +			return;
> +	}
> +
>  	goto next;
>  }
> 
> @@ -334,6 +343,7 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>  	if (!list_empty(&fi->inmem_ilist))
>  		list_del_init(&fi->inmem_ilist);
> +	sbi->atomic_files--;
>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>  }
> 
> Thanks,

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
