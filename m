Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B993923227A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 18:22:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0oq8-0003Li-Dz; Wed, 29 Jul 2020 16:22:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k0oq7-0003La-6l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 16:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FjwOx/1YMnYWkBs5w+sbZtNz9UnliXhLhIMvmLD2uk0=; b=eSJZN0Zyfs3ANURBIBeAY9Anr4
 QiD9pZoKISYpuqKyVgkDSV0P6FDSKi6LMslNTIeckfKAuCigAEajvWyY0jQc+bQu8pMDjXlMfb9Ht
 AuDJCTnZtG9ViWxkG5eli9u/4VbkyWFGc2Y/YQsN5pL7VOvuj8tOkXtTMF9i1ioD0QYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FjwOx/1YMnYWkBs5w+sbZtNz9UnliXhLhIMvmLD2uk0=; b=WrQWEHD7V0GScBlEfvkNu/rEdD
 0JLi42a4l30majgQj2TNpbuANLjZiQSCoLCYmIztFpQ+5cmnFnqOA4X4M+3t/8Q0si9HROFWtxh5b
 oW9Nf/QS60d+36i9w/s/5jwJsZ+uaBIRsqqjf3cT/tumTt1TGlKUrmS39kkgtorKyfhs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0oq5-006KP1-UY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 16:21:59 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FA8F2075D;
 Wed, 29 Jul 2020 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596039705;
 bh=kU7UT3i0MXW7gqzbaCFlt/VbDV/ZBUwOIl76CXUqX2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Byo40t5PhbmfTgovNn4pTryjQyJPinICU2cOtioUZM9MofRtpmqMkeY+Cri6Gb+R9
 uKjxjiG4JQdUMbNG1WjF+crg9tQ8vQvJ0hDGyKOcWMtTP/Vy6nk9OYz2qE8gy+vo6Q
 z5/2p7KaXf1M0R8ovcuf5rS/UWswH3NSXXsA9NKI=
Date: Wed, 29 Jul 2020 09:21:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200729162144.GA1460954@google.com>
References: <20200729070244.584518-1-jaegeuk@kernel.org>
 <054f161c-05db-73b7-3d83-be7addcd6015@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <054f161c-05db-73b7-3d83-be7addcd6015@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k0oq5-006KP1-UY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix deadlock between quota writes and
 checkpoint
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/29, Chao Yu wrote:
> On 2020-7-29 15:02, Jaegeuk Kim wrote:
> > f2fs_write_data_pages(quota_mapping)
> >  __f2fs_write_data_pages             f2fs_write_checkpoint
> >   * blk_start_plug(&plug);
> >   * add bio in write_io[DATA]
> >                                       - block_operations
> >                                       - skip syncing quota by
> >                                                 >DEFAULT_RETRY_QUOTA_FLUSH_COUNT
> >                                       - down_write(&sbi->node_write);
> >   - f2fs_write_single_data_page
> 
> After commit 79963d967b49 ("f2fs: shrink node_write lock coverage"),
> node_write lock was moved to f2fs_write_single_data_page() and
> f2fs_write_compressed_pages().
> 
> So it needs to update the callstack.
> 
> - down_write(node_write)

Yeah, applied. :)

> 
> Otherwise it looks good to me.
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> >     - f2fs_do_write_data_page
> >       - f2fs_outplace_write_data
> >         - do_write_page
> >            - f2fs_allocate_data_block
> >             - down_write(node_write)
> >                                       - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA);
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/checkpoint.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 8c782d3f324f0..99c8061da55b9 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1269,6 +1269,8 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
> >  		if (type == F2FS_DIRTY_META)
> >  			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
> >  							FS_CP_META_IO);
> > +		else if (type == F2FS_WB_CP_DATA)
> > +			f2fs_submit_merged_write(sbi, DATA);
> >  		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
> >  	}
> >  	finish_wait(&sbi->cp_wait, &wait);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
