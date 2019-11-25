Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7F108B60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 11:09:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZBIg-000738-4x; Mon, 25 Nov 2019 10:08:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <0101016ea208bba5-3f551272-77ae-4a4c-8fff-afb947374bbf-000000@us-west-2.amazonses.com>)
 id 1iZBIa-00072m-4z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 10:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/GhtkUSnbi47bjaIsSSrfNIy0nMmqUCkfkyml8WbIhs=; b=KhRoTZAVTyY9EBNh+z+iW0QLqd
 /ghJYnkp4W+H/Hw/tW0xJ363Q+xSQ5KoOz3OSTnTGthCCIkCzdR1UqmmrSxbTtWSo9F19pXSxegEL
 dRJzDTuDpaXtQaHXonYc9Wivn/WzNxPj+TAwCnnx2YAWAIASwAVUamrY6kjw8mRNnThs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/GhtkUSnbi47bjaIsSSrfNIy0nMmqUCkfkyml8WbIhs=; b=bEvafkG5kSRksLUfXyhcek5Mn4
 kMWC9SWv+PTrYTOqTEZyNv3baUHAdJRKNImHsdMmzJA0moWz+Lbb5aUQcqJmlgkB4NtySazIj2JJK
 6lob/4hgZ5bzS7t2WGlw90S6O+vXqTdI6mujh0Ketpq9PM0jDLoao44OX1Hu55bHU3ps=;
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.92.2)
 id 1iZBIO-00DCx8-UR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 10:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574676511;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=EL2996yTjmZweOQGwmsqTd/z5X3XZPc7Z11fozUUOn4=;
 b=dN63DBxi0skt809++2jbfK5n8ydBkgyQDb43Vrh99xiPwrrN/o97dV8e6sFEst0y
 6HTotJ82lrQbWcYZZxzwCA7bhG3mwRVKyD0ZM6780MyyLctd0HoJJp4QEu3Gc8U4sS7
 UtltRz2CtoY2VwWk6QWv0tsJYzvpf9QXUwjzK7Oc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574676511;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
 bh=EL2996yTjmZweOQGwmsqTd/z5X3XZPc7Z11fozUUOn4=;
 b=MUBYzS2QwnB7OSgjOX33TkQkphzWQaTmViVYwlFszRbo50swH2s+eAD9upyNcduy
 59pTF7R6d7Dgr6b4XaG3vU9w2VrT5MGTdZjBmCwmR4bix+qvIgl1p4vmNQ04I70kt8w
 1q4CJo3x5dPSQx/fDsH6cddjoivB0o8Mmxm47OW4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1D21C447B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 25 Nov 2019 10:08:31 +0000
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <0101016ea208bba5-3f551272-77ae-4a4c-8fff-afb947374bbf-000000@us-west-2.amazonses.com>
References: <1573641063-21232-1-git-send-email-stummala@codeaurora.org>
 <20191122165328.GA74621@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122165328.GA74621@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SES-Outgoing: 2019.11.25-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [54.240.27.21 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iZBIO-00DCx8-UR
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

Hi Jaegeuk,

On Fri, Nov 22, 2019 at 08:53:28AM -0800, Jaegeuk Kim wrote:
> On 11/13, Sahitya Tummala wrote:
> > The FS got stuck in the below stack when the storage is almost
> > full/dirty condition (when FG_GC is being done).
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
> > The root cause for this issue is there is a potential infinite loop
> > in f2fs_drop_inmem_pages_all() for the case where gc_failure is true
> > and when there an inode whose i_gc_failures[GC_FAILURE_ATOMIC] is
> > not set. Fix this by keeping track of the total atomic files
> > currently opened and using that to exit from this condition.
> > 
> > Fix-suggested-by: Chao Yu <yuchao0@huawei.com>
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> > v2:
> > - change fix as per Chao's suggestion
> > - decrement sbi->atomic_files protected under sbi->inode_lock[ATOMIC_FILE] and
> >   only when atomic flag is cleared for the first time, otherwise, the count
> >   goes to an invalid/high value as f2fs_drop_inmem_pages() can be called from
> >   two contexts at the same time.
> > 
> >  fs/f2fs/f2fs.h    |  1 +
> >  fs/f2fs/file.c    |  1 +
> >  fs/f2fs/segment.c | 21 +++++++++++++++------
> >  3 files changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index c681f51..e04a665 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1297,6 +1297,7 @@ struct f2fs_sb_info {
> >  	unsigned int gc_mode;			/* current GC state */
> >  	unsigned int next_victim_seg[2];	/* next segment in victim section */
> >  	/* for skip statistic */
> > +	unsigned int atomic_files;              /* # of opened atomic file */
> >  	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
> >  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> >  
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index f6c038e..22c4949 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1919,6 +1919,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
> >  	if (list_empty(&fi->inmem_ilist))
> >  		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
> > +	sbi->atomic_files++;
> >  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> >  
> >  	/* add inode in inmem_list first and set atomic_file */
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index da830fc..0b7a33b 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -288,6 +288,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
> >  	struct list_head *head = &sbi->inode_list[ATOMIC_FILE];
> >  	struct inode *inode;
> >  	struct f2fs_inode_info *fi;
> > +	unsigned int count = sbi->atomic_files;
> > +	unsigned int looped = 0;
> >  next:
> >  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
> >  	if (list_empty(head)) {
> > @@ -296,22 +298,26 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
> >  	}
> >  	fi = list_first_entry(head, struct f2fs_inode_info, inmem_ilist);
> >  	inode = igrab(&fi->vfs_inode);
> > +	if (inode)
> > +		list_move_tail(&fi->inmem_ilist, head);
> >  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> >  
> >  	if (inode) {
> >  		if (gc_failure) {
> > -			if (fi->i_gc_failures[GC_FAILURE_ATOMIC])
> > -				goto drop;
> > -			goto skip;
> > +			if (!fi->i_gc_failures[GC_FAILURE_ATOMIC])
> > +				goto skip;
> >  		}
> > -drop:
> >  		set_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
> >  		f2fs_drop_inmem_pages(inode);
> > +skip:
> >  		iput(inode);
> >  	}
> > -skip:
> >  	congestion_wait(BLK_RW_ASYNC, HZ/50);
> >  	cond_resched();
> > +	if (gc_failure) {
> > +		if (++looped >= count)
> 
> There is a race condition when handling sbi->atomic_files?
> 
There is no concern here in this function w.r.t sbi->atomic_files value.
Since when we loop over all the atomic files, the looped counter will increment
and will exit when all the files are looped at least once.

There is an issue with f2fs_drop_inmem_pages() which is actually decrementing
the sbi->atomic_files and that was handled below.

Thanks,
Sahitya.

> > +			return;
> > +	}
> >  	goto next;
> >  }
> >  
> > @@ -327,13 +333,16 @@ void f2fs_drop_inmem_pages(struct inode *inode)
> >  		mutex_unlock(&fi->inmem_lock);
> >  	}
> >  
> > -	clear_inode_flag(inode, FI_ATOMIC_FILE);
> >  	fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
> >  	stat_dec_atomic_write(inode);
> >  
> >  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
> >  	if (!list_empty(&fi->inmem_ilist))
> >  		list_del_init(&fi->inmem_ilist);
> > +	if (f2fs_is_atomic_file(inode)) {
> > +		clear_inode_flag(inode, FI_ATOMIC_FILE);
> > +		sbi->atomic_files--;
> > +	}
> >  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> >  }
> >  
> > -- 
> > Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
