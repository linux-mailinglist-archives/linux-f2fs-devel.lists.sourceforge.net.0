Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9D5A5385
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Aug 2022 19:53:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSiwc-0001xr-UI;
	Mon, 29 Aug 2022 17:53:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oSiwb-0001xk-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bTyjkYcYW9M+EelMsJ7OugaRygDu6xAb7KZqdzCP0iM=; b=ceO6vznoWnC5P3PRyqDxuPPLGP
 haIoa5Pb8+jhrmXFA+/eSP3EDr1M0LO3p4utNpL9q5v+k6+CeASu3YjBHTviDZKsflDfLMydIJW5p
 iJtiq6hgqbarpAmBNn63zCvAnmjM1gXAWUPBBzZwRTgwN93HWOkQExBkkcHFHH/PpwMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bTyjkYcYW9M+EelMsJ7OugaRygDu6xAb7KZqdzCP0iM=; b=l3iW4ZfgPcnV1dm8lI3np4mMFM
 3DFYDJmn4kItB7U/sfzF29zTQWli04nF3RVl6GroEstncnBsnT//JL9nAOoleC5jdbIHnZXKw7GId
 2P1DbceR5ZYQ/4F6nMJwVpvzNfbUjYaIjj0MhRZIFFZnE6kCy1xpSlmccPWEHQ+b1DwE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSiwb-0004Hw-1E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:53:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 944F461300;
 Mon, 29 Aug 2022 17:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B1AC433C1;
 Mon, 29 Aug 2022 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661795579;
 bh=OFiWblrTg9bVEo5nez7Fqe6Tqh+QPil6BbmjGo6KOkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DydfPj8kqb2FrPMQSHDQR+tY4HvQuBtkf/2gHK1w/rMaTBaIkmxOfErDaa0xz1rT9
 b/pLRm9I4ztj3xfQY568OitsI7tGVsljUWKf7Y219wS1Alot7Kd6YVWzy0iqxk+Gmt
 iDeiNnR12RC47dbLqhDgcmzaWolz08krb2CwYYjrCGCEqa4joplMcb6CMSlpQmPbiv
 7kDGwEAyj0M0X/153MYRjgr0zg89o399RuL+gxvMNs+u9dmp3ZxY6ux8KmMEItHlCv
 W6+5tG9O/HaCVoQizduc0t3TUC103fLaszHg9Ajiko/JugH0+NTzMvF54MF4LCa6Io
 dFlBuF5GYYqcA==
Date: Mon, 29 Aug 2022 10:52:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <Ywz8+WUhypEiUfvk@google.com>
References: <000000000000d5b4fe05e7127662@google.com>
 <20220825183734.0b08ae10a2e9e1bd156a19cd@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825183734.0b08ae10a2e9e1bd156a19cd@linux-foundation.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/25, Andrew Morton wrote: > (cc fsf2 developers) > >
 On Thu, 25 Aug 2022 08:29:32 -0700 syzbot
 <syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com>
 wrote: > > > Hello, > > > > syzbot found the [...] 
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
X-Headers-End: 1oSiwb-0004Hw-1E
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in set_page_dirty
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org,
 syzbot <syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/25, Andrew Morton wrote:
> (cc fsf2 developers)
> 
> On Thu, 25 Aug 2022 08:29:32 -0700 syzbot <syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com> wrote:
> 
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    a41a877bc12d Merge branch 'for-next/fixes' into for-kernelci
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> > console output: https://syzkaller.appspot.com/x/log.txt?x=175def47080000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea15779c42821c
> > dashboard link: https://syzkaller.appspot.com/bug?extid=775a3440817f74fddb8c
> > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> > userspace arch: arm64
> > 
> > Unfortunately, I don't have any reproducer for this issue yet.
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > Mem abort info:
> >   ESR = 0x0000000086000005
> >   EC = 0x21: IABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> >   FSC = 0x05: level 1 translation fault
> > user pgtable: 4k pages, 48-bit VAs, pgdp=00000001249cc000
> > [0000000000000000] pgd=080000012ee65003, p4d=080000012ee65003, pud=0000000000000000
> > Internal error: Oops: 86000005 [#1] PREEMPT SMP
> > Modules linked in:
> > CPU: 0 PID: 3044 Comm: syz-executor.0 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/20/2022
> > pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : 0x0
> > lr : folio_mark_dirty+0xbc/0x208 mm/page-writeback.c:2748
> > sp : ffff800012803830
> > x29: ffff800012803830 x28: ffff0000d02c8000 x27: 0000000000000009
> > x26: 0000000000000001 x25: 0000000000000a00 x24: 0000000000000080
> > x23: 0000000000000000 x22: ffff0000ef276c00 x21: 05ffc00000000007
> > x20: ffff0000f14b83b8 x19: fffffc00036409c0 x18: fffffffffffffff5
> > x17: ffff80000dd7a698 x16: ffff80000dbb8658 x15: 0000000000000000
> > x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > x11: ff808000083e9814 x10: 0000000000000000 x9 : ffff8000083e9814
> > x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> > x5 : ffff0000d9028000 x4 : ffff0000d5c31000 x3 : ffff0000d9027f80
> > x2 : fffffffffffffff0 x1 : fffffc00036409c0 x0 : ffff0000f14b83b8
> > Call trace:
> >  0x0
> >  set_page_dirty+0x38/0xbc mm/folio-compat.c:62

2363 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
2364                                         void *src, block_t blk_addr)
2365 {       
2366         struct page *page = f2fs_grab_meta_page(sbi, blk_addr);

--> f2fs_grab_meta_page() gives a locked page by grab_cache_page().

2367                                                         
2368         memcpy(page_address(page), src, PAGE_SIZE);
2369         set_page_dirty(page);
2370         f2fs_put_page(page, 1);
2371 } 

Is there a change in folio?

> >  get_next_nat_page+0x198/0x300 fs/f2fs/node.c:154
> >  __flush_nat_entry_set fs/f2fs/node.c:3005 [inline]
> >  f2fs_flush_nat_entries+0x354/0x988 fs/f2fs/node.c:3109
> >  f2fs_write_checkpoint+0x350/0x568 fs/f2fs/checkpoint.c:1667
> >  f2fs_issue_checkpoint+0x1b0/0x234
> >  f2fs_sync_fs+0x8c/0xc8 fs/f2fs/super.c:1651
> >  sync_filesystem+0xe0/0x134 fs/sync.c:66
> >  generic_shutdown_super+0x38/0x190 fs/super.c:474
> >  kill_block_super+0x30/0x78 fs/super.c:1427
> >  kill_f2fs_super+0x140/0x184 fs/f2fs/super.c:4544
> >  deactivate_locked_super+0x70/0xd4 fs/super.c:332
> >  deactivate_super+0xb8/0xbc fs/super.c:363
> >  cleanup_mnt+0x1f8/0x234 fs/namespace.c:1186
> >  __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
> >  task_work_run+0xc4/0x208 kernel/task_work.c:177
> >  resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
> >  do_notify_resume+0x174/0x1d0 arch/arm64/kernel/signal.c:1127
> >  prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inline]
> >  exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
> >  el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:625
> >  el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:642
> >  el0t_64_sync+0x18c/0x190
> > Code: bad PC value
> > ---[ end trace 0000000000000000 ]---
> > 
> > 
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > 
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
