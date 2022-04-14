Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 593DB500417
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Apr 2022 04:18:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nep3t-0005Zg-Kt; Thu, 14 Apr 2022 02:18:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nep3s-0005Za-Be
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 02:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TffoeTzw3do8CX5bbNfCh80oyQQs2Z9aWLgKbCQ61Yo=; b=hkmOzaL80iBC9D6PqgOuO0bHGA
 fXbnFVXvZR+P2gZbSGOY8UQJNrp8Y7fJ30KK/po3Z/72MXDhPiIa6N5zMGUWOMr649eDeHz+Uxv2X
 /hIDexmdQQygNuDuLTZUaNKYdaGZk/kirvasyRyelw8ZFkk915PjZ+0GcCRBwfVoZ0wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TffoeTzw3do8CX5bbNfCh80oyQQs2Z9aWLgKbCQ61Yo=; b=i8+oBiA9/lQEUBcMrqOM8C7yqv
 G+FRcm2754X2epSCrb7e12T6/W0g89UT/NYdod5jRF3lK1kTWqKpPT6AhBjT7QhTzIyTNHH12ayHQ
 rq+6RRndlYf9m5SKZWxIz8wY+5QLfl3dzzYtHsZoPgttBewxgcD6uBDkkcJ0voMtnA/E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nep3p-00030F-Dg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 02:18:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DBC97B818F1;
 Thu, 14 Apr 2022 02:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840E6C385A6;
 Thu, 14 Apr 2022 02:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649902686;
 bh=oJQm3BjV7RyxmmQy9mFaQn8UbhEC2En4eXb/DOl2Ca8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uP6iTIWJZsv534gVx6YLc37uQmxuVlUHRtN7e1+t64RElaBaiWBIg9WetZNK+iJT+
 wtzTvdtIJZea2u2/qeWgACH7caV2DwHBRU+o+ey9x4TDEbkxUnDU6z3ufhenBFZhWn
 zDHw6WhPLk1Y1fiMHM4g1LVc0DcuWRuCLgRmDBecMGtkYPn+V/VygPjuD6WG/9FmbY
 LF/F//d2B9YCogDVIo7eG7+NYBr0AviaTlJVd1JSFkjNNo3X8R+y16YFRsgSTCbzDE
 HKTqMemriN/Hk+IBf9BhICgOL2+VgQqLE4Kp0SjFM6ZCQo1hb6DRDUuQBaJNNBJBzT
 Yg5N18J+n5gLQ==
Date: Wed, 13 Apr 2022 19:18:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wu Yan <wu-yan@tcl.com>
Message-ID: <YleEXOHl1Vhlr3x3@google.com>
References: <660530eb62e71fb6520d3596704162e5@sslemail.net>
 <YlcBxSA5qYN4z1ia@google.com>
 <39c4ded0-09c0-3e38-85cb-5535099b177d@tcl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39c4ded0-09c0-3e38-85cb-5535099b177d@tcl.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/14, Wu Yan wrote: > On 4/14/22 01:00,
 Jaegeuk Kim wrote:
 > > On 04/13, Rokudo Yan wrote: > > > There is a potential deadlock in gc
 thread may happen > > > under low memory as below: > > > > > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nep3p-00030F-Dg
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid deadlock in gc thread under low
 memory
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
Cc: tang.ding@tcl.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/14, Wu Yan wrote:
> On 4/14/22 01:00, Jaegeuk Kim wrote:
> > On 04/13, Rokudo Yan wrote:
> > > There is a potential deadlock in gc thread may happen
> > > under low memory as below:
> > > 
> > > gc_thread_func
> > >   -f2fs_gc
> > >    -do_garbage_collect
> > >     -gc_data_segment
> > >      -move_data_block
> > >       -set_page_writeback(fio.encrypted_page);
> > >       -f2fs_submit_page_write
> > > as f2fs_submit_page_write try to do io merge when possible, so the
> > > encrypted_page is marked PG_writeback but may not submit to block
> > > layer immediately, if system enter low memory when gc thread try
> > > to move next data block, it may do direct reclaim and enter fs layer
> > > as below:
> > >     -move_data_block
> > >      -f2fs_grab_cache_page(index=?, for_write=false)
> > >       -grab_cache_page
> > >        -find_or_create_page
> > >         -pagecache_get_page
> > >          -__page_cache_alloc --  __GFP_FS is set
> > >           -alloc_pages_node
> > >            -__alloc_pages
> > >             -__alloc_pages_slowpath
> > >              -__alloc_pages_direct_reclaim
> > >               -__perform_reclaim
> > >                -try_to_free_pages
> > >                 -do_try_to_free_pages
> > >                  -shrink_zones
> > >                   -mem_cgroup_soft_limit_reclaim
> > >                    -mem_cgroup_soft_reclaim
> > >                     -mem_cgroup_shrink_node
> > >                      -shrink_node_memcg
> > >                       -shrink_list
> > >                        -shrink_inactive_list
> > >                         -shrink_page_list
> > >                          -wait_on_page_writeback -- the page is marked
> > >                         writeback during previous move_data_block call
> > > 
> > > the gc thread wait for the encrypted_page writeback complete,
> > > but as gc thread held sbi->gc_lock, the writeback & sync thread
> > > may blocked waiting for sbi->gc_lock, so the bio contain the
> > > encrypted_page may nerver submit to block layer and complete the
> > > writeback, which cause deadlock. To avoid this deadlock condition,
> > > we mark the gc thread with PF_MEMALLOC_NOFS flag, then it will nerver
> > > enter fs layer when try to alloc cache page during move_data_block.
> > > 
> > > Signed-off-by: Rokudo Yan <wu-yan@tcl.com>
> > > ---
> > >   fs/f2fs/gc.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > index e020804f7b07..cc71f77b98c8 100644
> > > --- a/fs/f2fs/gc.c
> > > +++ b/fs/f2fs/gc.c
> > > @@ -38,6 +38,12 @@ static int gc_thread_func(void *data)
> > >   	wait_ms = gc_th->min_sleep_time;
> > > +	/*
> > > +	 * Make sure that no allocations from gc thread will ever
> > > +	 * recurse to the fs layer to avoid deadlock as it will
> > > +	 * hold sbi->gc_lock during garbage collection
> > > +	 */
> > > +	memalloc_nofs_save();
> > 
> > I think this cannot cover all the f2fs_gc() call cases. Can we just avoid by:
> > 
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1233,7 +1233,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
> >                                  CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
> > 
> >          /* do not read out */
> > -       page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> > +       page = f2fs_grab_cache_page(inode->i_mapping, bidx, true);
> >          if (!page)
> >                  return -ENOMEM;
> > 
> > Thanks,
> > 
> > >   	set_freezable();
> > >   	do {
> > >   		bool sync_mode, foreground = false;
> > > -- 
> > > 2.25.1
> 
> Hi, Jaegeuk
> 
> I'm not sure if any other case may trigger the issue, but the stack traces I
> have caught so far are all the same as below:
> 
> f2fs_gc-253:12  D 226966.808196 572 302561 150976 0x1200840 0x0 572
> 237207473347056
> <ffffff889d88668c> __switch_to+0x134/0x150
> <ffffff889e764b6c> __schedule+0xd5c/0x1100
> <ffffff889e76554c> io_schedule+0x90/0xc0
> <ffffff889d9fb880> wait_on_page_bit+0x194/0x208
> <ffffff889da167b4> shrink_page_list+0x62c/0xe74
> <ffffff889da1d354> shrink_inactive_list+0x2c0/0x698
> <ffffff889da181f4> shrink_node_memcg+0x3dc/0x97c
> <ffffff889da17d44> mem_cgroup_shrink_node+0x144/0x218
> <ffffff889da6610c> mem_cgroup_soft_limit_reclaim+0x188/0x47c
> <ffffff889da17a40> do_try_to_free_pages+0x204/0x3a0
> <ffffff889da176c8> try_to_free_pages+0x35c/0x4d0
> <ffffff889da05d60> __alloc_pages_nodemask+0x7a4/0x10d0
> <ffffff889d9fc82c> pagecache_get_page+0x184/0x2ec

Is this deadlock trying to grab a lock, instead of waiting for writeback?
Could you share all the backtraces of the tasks?

For writeback above, looking at the code, f2fs_gc uses three mappings, meta,
node, and data, and meta/node inodes are masking GFP_NOFS in f2fs_iget(),
while data inode does not. So, the above f2fs_grab_cache_page() in
move_data_block() is actually calling w/o NOFS.

> <ffffff889dbf8860> do_garbage_collect+0xfe0/0x2828
> <ffffff889dbf7434> f2fs_gc+0x4a0/0x8ec
> <ffffff889dbf6bf4> gc_thread_func+0x240/0x4d4
> <ffffff889d8de9b0> kthread+0x17c/0x18c
> <ffffff889d88567c> ret_from_fork+0x10/0x18
> 
> Thanks
> yanwu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
