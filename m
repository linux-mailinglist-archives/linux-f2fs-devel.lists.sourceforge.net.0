Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BCC5BD8EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Sep 2022 02:53:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaRVU-0008OT-TN;
	Tue, 20 Sep 2022 00:53:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oaRVT-0008ON-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 00:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JdPGBGHsT6T/iieMF9xpHvkWGDhzRJirbHhFCq+aQrk=; b=kA8e6kGqroEl5U80zDRNgjHKsc
 mz/R21vlUZgXFCFBkZHrA3MM3Cf8TK7k95NyXLgXErTI5zQyvuFdSG0tOEzS6PNNRIqbM8Ue4g+Xw
 k5f4GCS0f6JWDpgvhzG/cx7faGWyCRXWbw+bHN/Rr+e5OLuuEwR4T0G4REtS9CEkeAaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JdPGBGHsT6T/iieMF9xpHvkWGDhzRJirbHhFCq+aQrk=; b=CCzi9GBAqjIuded/XxTh3rJdub
 irTUF255G2jc6wcXAPvLqYCL98+o0xGXyEnoMjGKreg9VEkazQeqPJaII4zWzoM0JFOKeFEGVvAgq
 ucsnxBLMbuQ4uuVOzK5kTv1oqb6hFrXGKtZxdMv46kVdwc5j84ok/4QD+y9wkwODunmo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaRVS-00Du5r-7g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 00:52:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34072619B9;
 Tue, 20 Sep 2022 00:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60489C433C1;
 Tue, 20 Sep 2022 00:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663635166;
 bh=XV7ScCsYr/iAiSgS3hiM+wY6RG+AHfEZq9VC6e6C5l4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rGJjWQ2kWxJJkbOId/DAaZYGqn6P9gj8JE8bXE8SQuWbr9Y3n2e3g8qO6UuLU8BC6
 WdyW20KYOSIAb1hiWspc96PDjVYb+0aUPI8tET/2PdDIf60pFE04ii42/IMhYCRVbV
 li90ecU4QSHlBcFdzdQsV8ZNDnNYG8XQGsnc7mf3Rq1OTWuuoVjzeQ52exJbuMoCmC
 b0+W+GAD83Z6pfnwqG2uR8elRhidK6q6QbI9p2sw9KEAIa82qJeQ/o3EfV1t2azS23
 pqjXjbg7I3CxLkzEo9Rm+YHyFPBtp2uyoUPeKSrkY1c0tZqr9Eqe4QBX4NEeV4Iq6O
 QjDUEFuMg3xeA==
Date: Mon, 19 Sep 2022 17:52:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Philippe De Muyter <phdm@macq.eu>
Message-ID: <YykO3Fh9Q20n36dk@google.com>
References: <20220914080839.GA19067@172.21.0.10>
 <20220915071004.23550-1-bo.wu@vivo.com>
 <20220916145906.GA6753@172.21.0.10>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220916145906.GA6753@172.21.0.10>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Philippe, Kernel 4.1 is really old one, so is there any
 chance to upgrade the kernel at least 4.14? You can find all the backports
 from below.
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oaRVS-00Du5r-7g
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix to check space of current
 segment journal
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Philippe,

Kernel 4.1 is really old one, so is there any chance to upgrade the kernel
at least 4.14? You can find all the backports from below.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git

On 09/16, Philippe De Muyter wrote:
> Tnank you for your patch.
> 
> I have applied it and also applied f2fs patches from 4.1.54 to my driver
> which was in the 4.1.5 state, but I still get sometimes 
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 2333 at fs/f2fs/node.c:1863 flush_nat_entries+0x74c/0x7d8()
> Modules linked in:
> CPU: 0 PID: 2333 Comm: python3 Not tainted 4.1.15-02187-g7bc7275 #173
> Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [<80015f58>] (unwind_backtrace) from [<80012020>] (show_stack+0x10/0x14)
> [<80012020>] (show_stack) from [<80733454>] (dump_stack+0x68/0xb8)
> [<80733454>] (dump_stack) from [<8002b694>] (warn_slowpath_common+0x74/0xac)
> [<8002b694>] (warn_slowpath_common) from [<8002b6e8>] (warn_slowpath_null+0x1c/0x24)
> [<8002b6e8>] (warn_slowpath_null) from [<8024fef8>] (flush_nat_entries+0x74c/0x7d8)
> [<8024fef8>] (flush_nat_entries) from [<80244b6c>] (write_checkpoint+0x208/0xe68)
> [<80244b6c>] (write_checkpoint) from [<80240138>] (f2fs_sync_fs+0x50/0x70)
> [<80240138>] (f2fs_sync_fs) from [<8010436c>] (sync_fs_one_sb+0x28/0x2c)
> [<8010436c>] (sync_fs_one_sb) from [<800df9e0>] (iterate_supers+0xac/0xd4)
> [<800df9e0>] (iterate_supers) from [<80104414>] (sys_sync+0x48/0x98)
> [<80104414>] (sys_sync) from [<8000f440>] (ret_fast_syscall+0x0/0x3c)
> ---[ end trace a1c261161013ae57 ]---
> 
> even after a almost silent fsck :
> 
> Info: Force to fix corruption
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 7372800 (3600 MB)
> Info: MKFS version
>   ""
> Info: FSCK version
>   from ""
>     to "Linux version 4.1.15-02187-g7bc7275 (phdm@perdita) (gcc version 4.6.2 20110630 (prerelease) (Freescale MAD -- Linaro 2011.07 -- Built at 2011/08/10 09:20) ) #173 SMP PREEMPT Thu Sep 15 18:15:41 CEST 2022"
> Info: superblock features = 0 : 
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 7372800 (3600 MB)
> Info: CKPT version = c68
> Info: Corrupted valid nat_bits in checkpoint
> Info: Write valid nat_bits in checkpoint
> Info: checkpoint state = 284 :  allow_nocrc nat_bits compacted_summary sudden-power-off
> [FSCK] Check node 1 / 97426 (0.00%)
> random: nonblocking pool is initialized
> [FSCK] Check node 9743 / 97426 (10.00%)
> [FIX] (fsck_chk_inode_blk:1141)  --> Regular: 0x2387d reset i_gc_failures from 0x1 to 0x00
> [FSCK] Check node 19485 / 97426 (20.00%)
> [FSCK] Check node 29227 / 97426 (30.00%)
> [FSCK] Check node 38969 / 97426 (40.00%)
> [FSCK] Check node 48711 / 97426 (50.00%)
> [FSCK] Check node 58453 / 97426 (60.00%)
> [FSCK] Check node 68195 / 97426 (70.00%)
> [FSCK] Check node 77937 / 97426 (80.00%)
> [FSCK] Check node 87679 / 97426 (90.00%)
> [FSCK] Check node 97421 / 97426 (100.00%)
> [FIX] (fsck_chk_inode_blk:1141)  --> Regular: 0x23880 reset i_gc_failures from 0x1 to 0x00
> [FIX] (fsck_chk_inode_blk:1141)  --> Regular: 0x23898 reset i_gc_failures from 0x1 to 0x00
> 
> [FSCK] Max image size: 3588 MB, Free space: 277 MB
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0xa61]
> [FSCK] valid_block_count matching with CP             [Ok..] [0xbccff]
> [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x17c92]
> [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x17c92]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x17ac4]
> [FSCK] free segment_count matched with CP             [Ok..] [0x10b]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Ok..]
> Info: Duplicate valid checkpoint to mirror position 1024 -> 512
> Info: Write valid nat_bits in checkpoint
> Info: Write valid nat_bits in checkpoint
> 
> Done: 47.791824 secs
> 
> And here is the current fs/f2fs/node.c:
> 
>         /* flush dirty nats in nat entry set */
>         list_for_each_entry_safe(ne, cur, &set->entry_list, list) {
>                 struct f2fs_nat_entry *raw_ne;
>                 nid_t nid = nat_get_nid(ne);
>                 int offset;
> 
>                 if (nat_get_blkaddr(ne) == NEW_ADDR)
>                         continue;
> 
>                 if (to_journal) {
>                         offset = lookup_journal_in_cursum(sum,
>                                                         NAT_JOURNAL, nid, 1);
> LINE 1863               f2fs_bug_on(sbi, offset < 0);
>                         raw_ne = &nat_in_journal(sum, offset);
>                         nid_in_journal(sum, offset) = cpu_to_le32(nid);
>                 } else {
>                         raw_ne = &nat_blk->entries[nid - start_nid];
>                 }
>                 raw_nat_from_node_info(raw_ne, &ne->ni);
> 
>                 down_write(&NM_I(sbi)->nat_tree_lock);
>                 nat_reset_flag(ne);
>                 __clear_nat_cache_dirty(NM_I(sbi), ne);
>                 up_write(&NM_I(sbi)->nat_tree_lock);
> 
>                 if (nat_get_blkaddr(ne) == NULL_ADDR)
>                         add_free_nid(sbi, nid, false);
>         }
> 
> Best Regards
> 
> Philippe
> 
> On Thu, Sep 15, 2022 at 03:10:04PM +0800, Wu Bo wrote:
> > On 2022/9/14 16:08, Philippe De Muyter wrote:
> > 
> > > Hello Wu Bo,
> > >
> > > On Wed, Sep 14, 2022 at 12:04:23PM +0800, Wu Bo wrote:
> > >> As Philippe De Muyter reported:
> > >> https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
> > >>
> > >> The warning log showed that when finding a new space for nat the journal
> > >> space turned out to be full. This because the journal_rwsem is not
> > >> locked before the journal space checking. The journal space may become
> > >> full just after we check it.
> > >>
> > >> Reported-by: Philippe De Muyter <phdm@macq.eu>
> > >> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> > >> ---
> > >>  fs/f2fs/node.c    |  6 +++---
> > >>  fs/f2fs/segment.c | 10 +++++-----
> > >>  2 files changed, 8 insertions(+), 8 deletions(-)
> > >>
> > >
> > > Thank you for your patch.
> > >
> > > Unfortunately it does not apply to my 4.1.15 or newer 4.1.y sources,
> > > and I do not have the knowledge of f2fs internals to modify your
> > > patch myself.  E.g. 4.1.y lacks the '.journal' field in the
> > > 'struct curseg_info'.
> > >
> > > Could you make a version suitable for 4.1.y ?
> > 
> > My patch is just try to fix the 'offset < 0' warning you have meet. The
> > probability of this is very low.
> > 
> > 
> > 
> > To the fsck fixed report you found when doing fsck.f2fs, 'reset
> > i_gc_failures' log seems normal. And 'Unreachable nat entries' maybe
> > caused by the 'offset < 0' exception.
> > 
> > If your filesystem doesn't report fsck failures after these 2 cases, I
> > think you don't need to worry about it too much.
> > 
> > Here is the patch for v4.1.y:
> > 
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 8ab0cf1930bd..fc4d87a1ddf0 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1837,12 +1837,12 @@ static void __flush_nat_entry_set(struct f2fs_sb_info *sbi,
> >          * #1, flush nat entries to journal in current hot data summary block.
> >          * #2, flush nat entries to nat page.
> >          */
> > +       mutex_lock(&curseg->curseg_mutex);
> >         if (!__has_cursum_space(sum, set->entry_cnt, NAT_JOURNAL))
> >                 to_journal = false;
> > 
> > -       if (to_journal) {
> > -               mutex_lock(&curseg->curseg_mutex);
> > -       } else {
> > +       if (!to_journal) {
> > +               mutex_unlock(&curseg->curseg_mutex);
> >                 page = get_next_nat_page(sbi, start_nid);
> >                 nat_blk = page_address(page);
> >                 f2fs_bug_on(sbi, !nat_blk);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
