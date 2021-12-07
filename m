Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAF46C6D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 22:39:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muiBO-0001JN-5m; Tue, 07 Dec 2021 21:39:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1muiBL-0001JH-P3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 21:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ea5M7+q3fJ5TRqfcalz4smg48mXgFfaRh7nk0n0PFNE=; b=hfx4U43P15OPEbO74kGvPF8d/H
 jpNiI9Nz4XT9I5EPqaj3Gd60KUGkSbhCoavg/CF7AHT+q4btrmxjBwZ1D4eTc1ooIS7lmAXhjOGCv
 ZZUfiI5EvHU91Ti2NaubrqdRsVQ4vnAtHbJM4wp/sIV5Bj1alTTMam6jA5HHOKTmyx1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ea5M7+q3fJ5TRqfcalz4smg48mXgFfaRh7nk0n0PFNE=; b=MAd7LRqMgoDXzIkN97nttqfKpm
 h57OitgE4sNGVOgOpdY3LBo3agmWmKGjVTLp82/OFmGJHBKt3xP3F0K4n2NLW/MBV8jygV8apPGrr
 oAgd0StzbEfEyjETlX9ISJYMbGhzhf3fI+6vGL9zd/nybCDxBggrJR4bFCzF3oj0ki7g=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muiBJ-0006vq-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 21:39:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1E857CE1E01;
 Tue,  7 Dec 2021 21:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE07CC341C3;
 Tue,  7 Dec 2021 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638913149;
 bh=NnwQjHANK8dxUU6iUVwzpSJCtCEZFuoDZCi0BOuKyd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcK/NzUzPE14JcztK81/qsDEkJz/OgUuSUDKqEIMXQb/QFnQ8C6Zen27O83uvQLWt
 6lc6yffxQDzli9iQMYqhM+K9/tWeBSal4vaqtS38b20xECKHC4lHQ4CE+Y+OtgqI5W
 jO/xyao5yU8XFm17xnnZ9mKODBOQ3xn9+onMHfgyjYk0aoYOpXcUmGDpma9zvpqe+H
 g4GsTt34gocGhqvSo5o/nDQVxTjzofjShL+qZYzDbqBi3wn6B4iPKw3aOBwInQi4hQ
 LK7Go7S1Dd2kGMb5xaV5w+w8ABMM2G3K7R+v9fvgw+0z9ASQBn+wL162mOIPl7YF9h
 KNptXyswe9N3w==
Date: Tue, 7 Dec 2021 13:39:06 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Ya/Ueh7MWyvV2zdg@google.com>
References: <0000000000005f297e05d24f05f6@google.com>
 <20211206175631.5d0c3caefa96f0479f0fc2e8@linux-foundation.org>
 <Ya7jYRDwQqftGLtW@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ya7jYRDwQqftGLtW@casper.infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/07, Matthew Wilcox wrote: > On Mon, Dec 06, 2021 at
 05:56:31PM -0800, Andrew Morton wrote: > > On Sat, 04 Dec 2021 01:55:17 -0800
 syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com> w [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muiBJ-0006vq-Pn
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in folio_mark_dirty
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
Cc: syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/07, Matthew Wilcox wrote:
> On Mon, Dec 06, 2021 at 05:56:31PM -0800, Andrew Morton wrote:
> > On Sat, 04 Dec 2021 01:55:17 -0800 syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com> wrote:
> > 
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    58e1100fdc59 MAINTAINERS: co-maintain random.c
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1362881eb00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=e9ea28d2c3c2c389
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7cd473c2cac13fd2dd72
> > > compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2
> > > 
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com
> > > 
> > > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > 
> > cc linux-f2fs-devel@lists.sourceforge.net
> > 
> > And willy, who might help with diagnosing this.  But it does seem that
> > f2fs got itself a NULL page* then put it in places where it shouldn't have.
> 
> Oh -- it's not a NULL data pointer.  It's a NULL instruction pointer.
> 
> > > #PF: supervisor instruction fetch in kernel mode
> > > #PF: error_code(0x0010) - not-present page
> > > PGD 70764067 P4D 70764067 PUD 0 
> > > Oops: 0010 [#1] PREEMPT SMP KASAN
> > > CPU: 1 PID: 6541 Comm: syz-executor.3 Not tainted 5.16.0-rc3-syzkaller #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > RIP: 0010:0x0
> > > Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> > > RSP: 0018:ffffc900027ff7f8 EFLAGS: 00010246
> > > RAX: 1ffffffff14fef03 RBX: ffffffff8a7f7818 RCX: ffff88801b40d700
> > > RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffea0002790ec0
> > > RBP: dffffc0000000000 R08: ffffffff81b0fa16 R09: fffff940004f21d9
> > > R10: fffff940004f21d9 R11: 0000000000000000 R12: ffff88806c11c7b0
> > > R13: 0000000000000000 R14: 1ffffd40004f21d9 R15: ffffea0002790ec0
> > > FS:  0000555557165400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: ffffffffffffffd6 CR3: 0000000030d85000 CR4: 00000000003526e0
> > > Call Trace:
> > >  <TASK>
> > >  folio_mark_dirty+0x136/0x270 mm/page-writeback.c:2639
> 
>         if (likely(mapping)) {
> ...
>                 if (folio_test_reclaim(folio))
>                         folio_clear_reclaim(folio);
>                 return mapping->a_ops->set_page_dirty(&folio->page);
> 
> how do we get to a NULL ->set_page_dirty for a metadata page's
> mapping->a_ops?  This is definitely an f2fs expert question.

I can't find anything in f2fs, since that page was got by f2fs_grab_meta_page
along with grab_cache_page() that we never unlocked it.

  40 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
  41 {
  42         struct address_space *mapping = META_MAPPING(sbi);
  43         struct page *page;
  44 repeat:
  45         page = f2fs_grab_cache_page(mapping, index, false);

                    -> grab_cache_page(mapping, index);

  46         if (!page) {
  47                 cond_resched();
  48                 goto repeat;
  49         }
  50         f2fs_wait_on_page_writeback(page, META, true, true);
  51         if (!PageUptodate(page))
  52                 SetPageUptodate(page);
  53         return page;
  54 }


Suspecting something in folio wrt folio_mapping()?

 81 bool set_page_dirty(struct page *page)
 82 {
 83         return folio_mark_dirty(page_folio(page));
 84 }


> 
> > >  f2fs_update_meta_page+0x4b/0x380 fs/f2fs/segment.c:2485
> > >  do_checkpoint fs/f2fs/checkpoint.c:1513 [inline]
> > >  f2fs_write_checkpoint+0x31ad/0x5430 fs/f2fs/checkpoint.c:1674
> > >  f2fs_issue_checkpoint+0x361/0x4e0
> > >  sync_filesystem+0x19c/0x1f0 fs/sync.c:63
> > >  generic_shutdown_super+0x6b/0x300 fs/super.c:448
> > >  kill_block_super+0x79/0xd0 fs/super.c:1397
> > >  kill_f2fs_super+0x2f9/0x3c0 fs/f2fs/super.c:4478
> > >  deactivate_locked_super+0xa7/0xf0 fs/super.c:335
> > >  cleanup_mnt+0x462/0x510 fs/namespace.c:1137
> > >  task_work_run+0x146/0x1c0 kernel/task_work.c:164
> > >  tracehook_notify_resume include/linux/tracehook.h:189 [inline]
> > >  exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
> > >  exit_to_user_mode_prepare+0x209/0x220 kernel/entry/common.c:207
> > >  __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
> > >  syscall_exit_to_user_mode+0x2e/0x70 kernel/entry/common.c:300
> > >  do_syscall_64+0x53/0xd0 arch/x86/entry/common.c:86
> > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > RIP: 0033:0x7f6cfdd59f57
> > > Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
> > > RSP: 002b:00007fffcbddcad8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> > > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f6cfdd59f57
> > > RDX: 00007fffcbddcbac RSI: 000000000000000a RDI: 00007fffcbddcba0
> > > RBP: 00007fffcbddcba0 R08: 00000000ffffffff R09: 00007fffcbddc970
> > > R10: 0000555557166903 R11: 0000000000000246 R12: 00007f6cfddb2105
> > > R13: 00007fffcbdddc60 R14: 0000555557166810 R15: 00007fffcbdddca0
> > >  </TASK>
> > > Modules linked in:
> > > CR2: 0000000000000000
> > > ---[ end trace 08eda5a5e35b48a0 ]---
> > > RIP: 0010:0x0
> > > Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> > > RSP: 0018:ffffc900027ff7f8 EFLAGS: 00010246
> > > RAX: 1ffffffff14fef03 RBX: ffffffff8a7f7818 RCX: ffff88801b40d700
> > > RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffea0002790ec0
> > > RBP: dffffc0000000000 R08: ffffffff81b0fa16 R09: fffff940004f21d9
> > > R10: fffff940004f21d9 R11: 0000000000000000 R12: ffff88806c11c7b0
> > > R13: 0000000000000000 R14: 1ffffd40004f21d9 R15: ffffea0002790ec0
> > > FS:  0000555557165400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: ffffffffffffffd6 CR3: 0000000030d85000 CR4: 00000000003526e0
> > > 
> > > 
> > > ---
> > > This report is generated by a bot. It may contain errors.
> > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > 
> > > syzbot will keep track of this issue. See:
> > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
