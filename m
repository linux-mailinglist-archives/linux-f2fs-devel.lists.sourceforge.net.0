Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99890500467
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Apr 2022 04:43:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nepRg-0001dF-Tt; Thu, 14 Apr 2022 02:42:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nepRf-0001d9-So
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 02:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LuwzxAU98bSfdptKZvAuTIVJdPRhrCy3SYmCNU7Fx/I=; b=nPq3f9j9bPPGtPTfb1TSeEcw5q
 RfxZNx0W6jxSONBxCLJtM4HAd/t2DE88aaFFqcFTgwZsWIoDEdMeEsR543rDHjl5AIpbJM7YDbbUy
 qU8VipAI0fPqaRud+SZDaFLCewsss1O1WTk96TAXd6O10dLvNGPSQxsMiOFwcHCgAY04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LuwzxAU98bSfdptKZvAuTIVJdPRhrCy3SYmCNU7Fx/I=; b=GJHqlgTUwrVpb9NVjF75iIVv6Q
 LfzEhid0gprsBoXONCOEQMVriI17slVxnUK8QlZmETifgT2cYwp9OpvzWCKDi4f1Ol1PcmuM2brbb
 UpRb60DihC6nCtO6ic+NIFXfohE8BnbpG4Q1+8p+2lJf0jkl3mDsNE/uM0k/GNf6GRQw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nepRf-0003xf-QL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 02:42:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82CD761CAB;
 Thu, 14 Apr 2022 02:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12E1C385A3;
 Thu, 14 Apr 2022 02:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649904168;
 bh=36DzzE0zFDY0+1eEpGlav//54lccCGWjd8+KNiyp/0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DUJay3KuNMjYKs3umQ64L2QtcGkKJDk81kuC0XTjgOd+8MJB3EliCD1FpByvEInaF
 7ni4Ssghq79zqEwoUr1q2NKPrnG5jx1I6Fca1eR3vFKpUkFZcSKvPxecO7Ilb5uaC0
 3eHH8HNY+vv/fQ1yY+K2eKFn1Can0F1D4QmOkNAwkJmmB21FgQFBDoXo6DOmMwhenU
 pmcCd9paycCmONEWoKDpD8bBLksOPNagmfxclGyPsu9tKqXvuqRknYck3h0K//tAZn
 MC3noDTXIakBd25BKB1/R061hsZsJZe1OFU72nZIHoFV05i41+cre04/VbgVwHtndn
 JsaA1m2taWiaw==
Date: Wed, 13 Apr 2022 19:42:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wu Yan <wu-yan@tcl.com>
Message-ID: <YleKJySnkWZ1eh/O@google.com>
References: <660530eb62e71fb6520d3596704162e5@sslemail.net>
 <YlcBxSA5qYN4z1ia@google.com>
 <39c4ded0-09c0-3e38-85cb-5535099b177d@tcl.com>
 <YleEXOHl1Vhlr3x3@google.com>
 <ba76460f-4e22-634a-d46f-78e1fd4ac10e@tcl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba76460f-4e22-634a-d46f-78e1fd4ac10e@tcl.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/14, Wu Yan wrote: > On 4/14/22 10:18,
 Jaegeuk Kim wrote:
 > > On 04/14, Wu Yan wrote: > > > On 4/14/22 01:00, Jaegeuk Kim wrote: >
 > > > On 04/13, Rokudo Yan wrote: > > > > > There is a potential [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nepRf-0003xf-QL
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
> On 4/14/22 10:18, Jaegeuk Kim wrote:
> > On 04/14, Wu Yan wrote:
> > > On 4/14/22 01:00, Jaegeuk Kim wrote:
> > > > On 04/13, Rokudo Yan wrote:
> > > > > There is a potential deadlock in gc thread may happen
> > > > > under low memory as below:
> > > > > 
> > > > > gc_thread_func
> > > > >    -f2fs_gc
> > > > >     -do_garbage_collect
> > > > >      -gc_data_segment
> > > > >       -move_data_block
> > > > >        -set_page_writeback(fio.encrypted_page);
> > > > >        -f2fs_submit_page_write
> > > > > as f2fs_submit_page_write try to do io merge when possible, so the
> > > > > encrypted_page is marked PG_writeback but may not submit to block
> > > > > layer immediately, if system enter low memory when gc thread try
> > > > > to move next data block, it may do direct reclaim and enter fs layer
> > > > > as below:
> > > > >      -move_data_block
> > > > >       -f2fs_grab_cache_page(index=?, for_write=false)
> > > > >        -grab_cache_page
> > > > >         -find_or_create_page
> > > > >          -pagecache_get_page
> > > > >           -__page_cache_alloc --  __GFP_FS is set
> > > > >            -alloc_pages_node
> > > > >             -__alloc_pages
> > > > >              -__alloc_pages_slowpath
> > > > >               -__alloc_pages_direct_reclaim
> > > > >                -__perform_reclaim
> > > > >                 -try_to_free_pages
> > > > >                  -do_try_to_free_pages
> > > > >                   -shrink_zones
> > > > >                    -mem_cgroup_soft_limit_reclaim
> > > > >                     -mem_cgroup_soft_reclaim
> > > > >                      -mem_cgroup_shrink_node
> > > > >                       -shrink_node_memcg
> > > > >                        -shrink_list
> > > > >                         -shrink_inactive_list
> > > > >                          -shrink_page_list
> > > > >                           -wait_on_page_writeback -- the page is marked
> > > > >                          writeback during previous move_data_block call
> > > > > 
> > > > > the gc thread wait for the encrypted_page writeback complete,
> > > > > but as gc thread held sbi->gc_lock, the writeback & sync thread
> > > > > may blocked waiting for sbi->gc_lock, so the bio contain the
> > > > > encrypted_page may nerver submit to block layer and complete the
> > > > > writeback, which cause deadlock. To avoid this deadlock condition,
> > > > > we mark the gc thread with PF_MEMALLOC_NOFS flag, then it will nerver
> > > > > enter fs layer when try to alloc cache page during move_data_block.
> > > > > 
> > > > > Signed-off-by: Rokudo Yan <wu-yan@tcl.com>
> > > > > ---
> > > > >    fs/f2fs/gc.c | 6 ++++++
> > > > >    1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > > > index e020804f7b07..cc71f77b98c8 100644
> > > > > --- a/fs/f2fs/gc.c
> > > > > +++ b/fs/f2fs/gc.c
> > > > > @@ -38,6 +38,12 @@ static int gc_thread_func(void *data)
> > > > >    	wait_ms = gc_th->min_sleep_time;
> > > > > +	/*
> > > > > +	 * Make sure that no allocations from gc thread will ever
> > > > > +	 * recurse to the fs layer to avoid deadlock as it will
> > > > > +	 * hold sbi->gc_lock during garbage collection
> > > > > +	 */
> > > > > +	memalloc_nofs_save();
> > > > 
> > > > I think this cannot cover all the f2fs_gc() call cases. Can we just avoid by:
> > > > 
> > > > --- a/fs/f2fs/gc.c
> > > > +++ b/fs/f2fs/gc.c
> > > > @@ -1233,7 +1233,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
> > > >                                   CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
> > > > 
> > > >           /* do not read out */
> > > > -       page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> > > > +       page = f2fs_grab_cache_page(inode->i_mapping, bidx, true);
> > > >           if (!page)
> > > >                   return -ENOMEM;
> > > > 
> > > > Thanks,
> > > > 
> > > > >    	set_freezable();
> > > > >    	do {
> > > > >    		bool sync_mode, foreground = false;
> > > > > -- 
> > > > > 2.25.1
> > > 
> > > Hi, Jaegeuk
> > > 
> > > I'm not sure if any other case may trigger the issue, but the stack traces I
> > > have caught so far are all the same as below:
> > > 
> > > f2fs_gc-253:12  D 226966.808196 572 302561 150976 0x1200840 0x0 572
> > > 237207473347056
> > > <ffffff889d88668c> __switch_to+0x134/0x150
> > > <ffffff889e764b6c> __schedule+0xd5c/0x1100
> > > <ffffff889e76554c> io_schedule+0x90/0xc0
> > > <ffffff889d9fb880> wait_on_page_bit+0x194/0x208
> > > <ffffff889da167b4> shrink_page_list+0x62c/0xe74
> > > <ffffff889da1d354> shrink_inactive_list+0x2c0/0x698
> > > <ffffff889da181f4> shrink_node_memcg+0x3dc/0x97c
> > > <ffffff889da17d44> mem_cgroup_shrink_node+0x144/0x218
> > > <ffffff889da6610c> mem_cgroup_soft_limit_reclaim+0x188/0x47c
> > > <ffffff889da17a40> do_try_to_free_pages+0x204/0x3a0
> > > <ffffff889da176c8> try_to_free_pages+0x35c/0x4d0
> > > <ffffff889da05d60> __alloc_pages_nodemask+0x7a4/0x10d0
> > > <ffffff889d9fc82c> pagecache_get_page+0x184/0x2ec
> > 
> > Is this deadlock trying to grab a lock, instead of waiting for writeback?
> > Could you share all the backtraces of the tasks?
> > 
> > For writeback above, looking at the code, f2fs_gc uses three mappings, meta,
> > node, and data, and meta/node inodes are masking GFP_NOFS in f2fs_iget(),
> > while data inode does not. So, the above f2fs_grab_cache_page() in
> > move_data_block() is actually calling w/o NOFS.
> > 
> > > <ffffff889dbf8860> do_garbage_collect+0xfe0/0x2828
> > > <ffffff889dbf7434> f2fs_gc+0x4a0/0x8ec
> > > <ffffff889dbf6bf4> gc_thread_func+0x240/0x4d4
> > > <ffffff889d8de9b0> kthread+0x17c/0x18c
> > > <ffffff889d88567c> ret_from_fork+0x10/0x18
> > > 
> > > Thanks
> > > yanwu
> 
> Hi, Jaegeuk
> 
> The gc thread is blocked on wait_on_page_writeback(encrypted page submit
> before) when it try grab data inode page, the parsed stack traces as below:
> 
> ppid=572 pid=572 D cpu=1 prio=120 wait=378s f2fs_gc-253:12
>    Native callstack:
> 	vmlinux  wait_on_page_bit_common(page=0xFFFFFFBF7D2CD700, state=2,
> lock=false) + 304                                <mm/filemap.c:1035>
> 	vmlinux  wait_on_page_bit(page=0xFFFFFFBF7D2CD700, bit_nr=15) + 400
> 
>                             <mm/filemap.c:1074>
> 	vmlinux  wait_on_page_writeback(page=0xFFFFFFBF7D2CD700) + 36
> 
>                             <include/linux/pagemap.h:557>
> 	vmlinux  shrink_page_list(page_list=0xFFFFFF8011E83418,
> pgdat=contig_page_data, sc=0xFFFFFF8011E835B8, ttu_flags=0,
> stat=0xFFFFFF8011E833F0, force_reclaim=false) + 1576  <mm/vmscan.c:1171>
> 	vmlinux  shrink_inactive_list(lruvec=0xFFFFFFE003C304C0,
> sc=0xFFFFFF8011E835B8, lru=LRU_INACTIVE_FILE) + 700
> <mm/vmscan.c:1966>
> 	vmlinux  shrink_list(lru=LRU_INACTIVE_FILE, lruvec=0xFFFFFF8011E834B8,
> sc=0xFFFFFF8011E835B8) + 128                            <mm/vmscan.c:2350>
> 	vmlinux  shrink_node_memcg(pgdat=contig_page_data,
> memcg=0xFFFFFFE003C1A300, sc=0xFFFFFF8011E835B8,
> lru_pages=0xFFFFFF8011E835B0) + 984 <mm/vmscan.c:2726>
> 	vmlinux  mem_cgroup_shrink_node(memcg=0xFFFFFFE003C1A300,
> gfp_mask=21102794, noswap=false, pgdat=contig_page_data,
> nr_scanned=0xFFFFFF8011E836A0) + 320                   <mm/vmscan.c:3416>
> 	vmlinux  mem_cgroup_soft_reclaim(root_memcg=0xFFFFFFE003C1A300,
> pgdat=contig_page_data) + 164
> <mm/memcontrol.c:1643>
> 	vmlinux  mem_cgroup_soft_limit_reclaim(pgdat=contig_page_data, order=0,
> gfp_mask=21102794, total_scanned=0xFFFFFF8011E83720) + 388
> <mm/memcontrol.c:2913>
> 	vmlinux  shrink_zones(zonelist=contig_page_data + 14784,
> sc=0xFFFFFF8011E83790) + 352
> <mm/vmscan.c:3094>
> 	vmlinux  do_try_to_free_pages(zonelist=contig_page_data + 14784,
> sc=0xFFFFFF8011E83790) + 512
> <mm/vmscan.c:3164>
> 	vmlinux  try_to_free_pages(zonelist=contig_page_data + 14784, order=0,
> gfp_mask=21102794, nodemask=0) + 856
> <mm/vmscan.c:3370>
> 	vmlinux  __perform_reclaim(gfp_mask=300431548, order=0,
> ac=0xFFFFFF8011E83900) + 60
> <mm/page_alloc.c:3831>
> 	vmlinux  __alloc_pages_direct_reclaim(gfp_mask=300431548, order=0,
> alloc_flags=300431604, ac=0xFFFFFF8011E83900) + 60
> <mm/page_alloc.c:3853>
> 	vmlinux  __alloc_pages_slowpath(gfp_mask=300431548, order=0,
> ac=0xFFFFFF8011E83900) + 1244
> <mm/page_alloc.c:4240>
> 	vmlinux  __alloc_pages_nodemask() + 1952
> 
>                             <mm/page_alloc.c:4463>
> 	vmlinux  __alloc_pages(gfp_mask=21102794, order=0, preferred_nid=0) + 16
> <include/linux/gfp.h:515>
> 	vmlinux  __alloc_pages_node(nid=0, gfp_mask=21102794, order=0) + 16
> 
>                             <include/linux/gfp.h:528>
> 	vmlinux  alloc_pages_node(nid=0, gfp_mask=21102794, order=0) + 16
> 
>                             <include/linux/gfp.h:542>
> 	vmlinux  __page_cache_alloc(gfp=21102794) + 16
> 
>                             <include/linux/pagemap.h:226>
> 	vmlinux  pagecache_get_page() + 384
> 
>                             <mm/filemap.c:1520>
> 	vmlinux  find_or_create_page(offset=209) + 112
> 
>                             <include/linux/pagemap.h:333>
> 	vmlinux  grab_cache_page(index=209) + 112
> 
>                             <include/linux/pagemap.h:399>
> 	vmlinux  f2fs_grab_cache_page(index=209, for_write=false) + 112

Ok, I think this should be enough.

--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1233,7 +1233,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
                                  CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;

          /* do not read out */
-       page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
+       page = f2fs_grab_cache_page(inode->i_mapping, bidx, true);
          if (!page)
                  return -ENOMEM;

> 
>                             <fs/f2fs/f2fs.h:2429>
> 	vmlinux  move_data_block(inode=0xFFFFFFDFD578EEA0, gc_type=300432152,
> segno=21904, off=145) + 3584                             <fs/f2fs/gc.c:1119>
> 	vmlinux  gc_data_segment(sbi=0xFFFFFFE007C03000, sum=0xFFFFFF8011E83B10,
> gc_list=0xFFFFFF8011E83AB8, segno=21904, gc_type=300432152) + 3644
> <fs/f2fs/gc.c:1475>
> 	vmlinux  do_garbage_collect(sbi=0xFFFFFFE007C03000, start_segno=21904,
> gc_list=0xFFFFFF8011E83CF0, gc_type=0) + 4060
> <fs/f2fs/gc.c:1592>
> 	vmlinux  f2fs_gc(sbi=0xFFFFFFE007C03000, background=true, segno=4294967295)
> + 1180                                         <fs/f2fs/gc.c:1684>
> 	vmlinux  gc_thread_func(data=0xFFFFFFE007C03000) + 572
> 
>                             <fs/f2fs/gc.c:118>
> 	vmlinux  kthread() + 376
> 
>                             <kernel/kthread.c:232>
> 	vmlinux  ret_from_fork() +
> 
> Thanks
> yanwu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
