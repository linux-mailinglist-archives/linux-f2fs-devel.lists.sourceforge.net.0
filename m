Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743674094C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jun 2023 07:53:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEO77-0003tR-VS;
	Wed, 28 Jun 2023 05:53:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qEO76-0003tD-8a
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 05:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kwM4E7fj10dgg1KsyowvyJ8xn3AoW4S1VO+63NiM8eM=; b=GvK2JPHOEEDjGo/D1VixTrG3Fj
 0S+1M2o5rOXIYc16k4m1Ecw/D99MWdNVpbye6276YmXGyabQx3Ryu8qXBGDYm3+aLf5jTfyfUYVKw
 p9lgHtB6bneT8oYQXusQZPUQd6y/3b3rHR+KSZtXJc9Ff+3vMdkG4kCmgIiWPOCDZBAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kwM4E7fj10dgg1KsyowvyJ8xn3AoW4S1VO+63NiM8eM=; b=Z3oRNv8sZTIfc781PZ+b+AT017
 jX1rmrg+BGwfAzErICzWHrm45YHXD51sF99BW8tVJSkWQgwq3RevUu7UwP73V3YEZjuiVeyI8eQLo
 ameOD4bvD58vPyjEL59vI75DMcHRKRklYJmsIB41rlEKBBCqtbQ6mxI04v/ppOabySao=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEO70-00H5PG-W8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 05:53:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28774612D8;
 Wed, 28 Jun 2023 05:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF05C433C0;
 Wed, 28 Jun 2023 05:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687931573;
 bh=PPV5gFBUM+cLvTsnfUr0wCzl2695GOcuHmjuhb1pj24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBpuumsnAWP8myDiXNDsmwsMUtxg5NoppaXFXDdBSjkhjck8TUBEgUhtmyPJbB/Pa
 cvAV6FTrWfoVgZloADtlRbNkbxFN83upW3iQCqBY+3xfzCLHl3oph/JZepjO+oOQiV
 G6zYZoL10K8nIrW6JSi5TYzWhVSNRelzJnzuvhnCz6XH/uli+f0jrTYBz7+7ghsK/F
 OPR2K8IXJ9MO8D+FWW5ln8H0HteyDnEuiRksR0w66R0WOMuvnct8pGzX5wLcGc5MsU
 zwFN8wNRGYlCUoN8AfHSZMEycFEsRONnfitjFbA2YNVDRy+AcvjWFzphcv/LTIRKQ1
 B04+mw/5BhZ0Q==
Date: Tue, 27 Jun 2023 22:52:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: syzbot <syzbot+b67b270114065129f12b@syzkaller.appspotmail.com>
Message-ID: <20230628055251.GB1908@sol.localdomain>
References: <0000000000003b764f05ff09c1e2@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000003b764f05ff09c1e2@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 26, 2023 at 08:10:45AM -0700, syzbot wrote: >
 Hello, > > syzbot found the following issue on: > > HEAD commit: c87d46a9e8eb
 Add linux-next specific files for 20230622 > git tree: linux-nex [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEO70-00H5PG-W8
Subject: Re: [f2fs-dev] [syzbot] [mm?] possible deadlock in
 f2fs_file_write_iter
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 26, 2023 at 08:10:45AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c87d46a9e8eb Add linux-next specific files for 20230622
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=129edf4b280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d8ac8dd33677e8e0
> dashboard link: https://syzkaller.appspot.com/bug?extid=b67b270114065129f12b
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/bdf5ea2db527/disk-c87d46a9.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/3201e576e2ad/vmlinux-c87d46a9.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d011d9fa4e63/bzImage-c87d46a9.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b67b270114065129f12b@syzkaller.appspotmail.com
> 
> F2FS-fs (loop5): Mounted with checkpoint version = 48b305e5
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.4.0-rc7-next-20230622-syzkaller #0 Not tainted
> ------------------------------------------------------
> syz-executor.5/16876 is trying to acquire lock:
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: percpu_ref_put include/linux/percpu-refcount.h:351 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: put_dev_pagemap include/linux/memremap.h:251 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: gup_pte_range mm/gup.c:2583 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: gup_pmd_range mm/gup.c:2950 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: gup_pud_range mm/gup.c:2978 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: gup_p4d_range mm/gup.c:3003 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: gup_pgd_range mm/gup.c:3031 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: lockless_pages_from_mm mm/gup.c:3084 [inline]
> ffff88802a033120 (&mm->mmap_lock){++++}-{3:3}, at: internal_get_user_pages_fast+0x135f/0x3370 mm/gup.c:3133
> 
> but task is already holding lock:
> ffff88808b20ea30 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2107 [inline]
> ffff88808b20ea30 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_dio_write_iter fs/f2fs/file.c:4643 [inline]
> ffff88808b20ea30 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_file_write_iter+0x1161/0x2500 fs/f2fs/file.c:4766
> 

This was caused by the patch
"f2fs: fix to avoid mmap vs set_compress_option case"
(https://lore.kernel.org/linux-f2fs-devel/20230529104709.2560779-1-chao@kernel.org/)
which has been dropped.

#syz set subsystems: f2fs
#syz invalid

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
