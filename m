Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445150A3E0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 17:20:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhYbm-0001Cm-0A; Thu, 21 Apr 2022 15:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nhYbk-0001Cg-LM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 15:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtii3fqpCaCA/0+L3jup3UOUpXLGV9jhU912UiowqsQ=; b=B4VJfqXYy20ZGOVl+nW1aSsqAW
 zji2L684eaxeAxTipgSag9P3DFog8JzI356UkqaGuYi7y3xmztxXwBcdYP9xsOi1qbxcpaSjxbBHz
 FIhmAkHwAd1FPMzDFBTReeQytCZ1NY1Csp2EOaHpsXaIyz2nCTb09uKv4vwPPsuXT/zI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gtii3fqpCaCA/0+L3jup3UOUpXLGV9jhU912UiowqsQ=; b=nOt9U+aaPOUH7ZnvTsfRDky8Zt
 e4x9XXM7o1C5VP5MBoSpt1zW9STDs0jmlzTE4Nr+5NEnyOcg08VvCgcB10MGlLnfqreplvsDNCO9E
 KwcrY7XwT8RAMrKfn74yuJ9cRjmbh5M4QPqLKZ+Hh9INFRcQt0O01/IlCRxF7fTGyPPw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhYbh-005fmo-0D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 15:20:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1BE4B82498;
 Thu, 21 Apr 2022 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9BEC385A5;
 Thu, 21 Apr 2022 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650554424;
 bh=VnXaPMca60V4eTXoLoQFkxHQy+dhTrGV+ZwQQzPOiT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XysGKFpao6X07LvtILT7MllAwXBLd5xWnzh76hpxd1VwqyvhtzCoodLy0v6Ac127h
 CNG7wi/4+At50gD1HtRlgEKwlZVvvyAXl5JbM2FzGOtE/p8fsmuOwv+WwQds7FHl7d
 nbGZ58O9qxYubWxvW6cLLvyQpLHdfqQcMq6lTKdtp+yoz8gQj6CgiQmUdyB65dUWUS
 I7CWrbkDYJS3sDuO7UrTB7EEU/ulZFSlsSTwBwEFZheezrfvkkojfIvVBSqIuH68On
 IknbDp33ZTlzhX332SMo3qYYx0LBjkYdYLIeNukQl9EEvdHztgOp/Qomfbjm8hLZ/C
 sJpwcvCjWf8Kg==
Date: Thu, 21 Apr 2022 08:20:22 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <YmF2Nqu8Rtc4cx52@google.com>
References: <20220419215703.1271395-1-jaegeuk@kernel.org>
 <42e10758-e50a-7aaa-dfa9-dcf6338ebaff@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42e10758-e50a-7aaa-dfa9-dcf6338ebaff@opensource.wdc.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/21, Damien Le Moal wrote: > On 4/20/22 06:57, Jaegeuk
 Kim wrote: > > The block layer for zoned disk can reorder the FUA'ed IOs.
 Let's use flush > > command to keep the write order. > > Stricktly [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nhYbh-005fmo-0D
Subject: Re: [f2fs-dev] [PATCH] f2fs: use flush command instead of FUA for
 zoned device
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

On 04/21, Damien Le Moal wrote:
> On 4/20/22 06:57, Jaegeuk Kim wrote:
> > The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
> > command to keep the write order.
> 
> Stricktly speaking, for a request that has data, the problem is triggered
> by REQ_PREFLUSH since in this case the request does not go through the
> scheduler and is processed through the blk-flush machinery. REQ_FUA on its
> own should not matter if the device supports it. If the device does not
> support FUA, then the same problem can happen due to POSTFLUSH (again no
> scheduler).

I think the problem is a piggy-backed data along with flush or fua whatever,
but this made me use a separate flush command.

> 
> Bypassing the scheduler leads to the write not write-locking the zone,
> which leads to reordering... Completely overlooked that case when the zone
> write locking was implemented.
> 
> Ideally, the FS should not have to care about this. blk-flush machinery
> should be a little more intelligent and process the write phase of the
> request using the scheduler. Need to look into that.

Please. I'm okay to revert this, once the block layer supports.

> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/file.c | 4 +++-
> >  fs/f2fs/node.c | 2 +-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index f08e6208e183..2aef0632f35b 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -372,7 +372,9 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> >  	f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
> >  	clear_inode_flag(inode, FI_APPEND_WRITE);
> >  flush_out:
> > -	if (!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER)
> > +	if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
> > +			(atomic && !test_opt(sbi, NOBARRIER) &&
> > +					f2fs_sb_has_blkzoned(sbi)))
> 
> Aligning the conditions and not breaking the second line would make this a
> lot easier to read...

Sure.

> 
> >  		ret = f2fs_issue_flush(sbi, inode->i_ino);
> >  	if (!ret) {
> >  		f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index c280f482c741..7224a980056f 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1633,7 +1633,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
> >  		goto redirty_out;
> >  	}
> >  
> > -	if (atomic && !test_opt(sbi, NOBARRIER))
> > +	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_sb_has_blkzoned(sbi))
> >  		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> 
> Is this really OK to do ? flush + write as different operations may not
> lead to the same result as a preflush+fua write.
> 
> Until the block layer is fixed to properly handle this, a simpler fix for
> f2fs would be to force enable the NOBARRIER option for zoned drives ? That
> would avoid these changes no ?

No, it will hurt the stability of FS metadata consistency.

> 
> Also, with all the testing we do on SMR disks and f2fs (smaller, older SMR
> disks due to the 16TB limit), we never have triggered this problem. How
> did you trigger it ?

This happens in Android only, since atomic_write for sqlite is taking this path.

> 
> >  
> >  	/* should add to global list before clearing PAGECACHE status */
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
