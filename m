Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E65805A2F87
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Aug 2022 21:02:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRebO-0007xx-He;
	Fri, 26 Aug 2022 19:02:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3yhgJYwkbAD8tz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1oRebN-0007xr-6s for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Aug 2022 19:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dq5VkqjfDnwWLl/bsXasVEegglasUUDpYrJ8qiZGvfU=; b=kVIm65pBij9MpIQAdy+aI04h0W
 LT9Jrx4Co6YULk+CWEt00BAOrdmxz6NxhbufzZYVnKlkMt7ICteJYglvpy3/C4f1lbnxrCfe82Xe4
 V2wm59bwLXZcenFfZZ1ehRaWnIgDELiwWM2yC54cTsaKT65RfWFcZEGlEJuIDm+FqHA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dq5VkqjfDnwWLl/bsXasVEegglasUUDpYrJ8qiZGvfU=; b=f
 lmbOfCE/lRUOcVjppMDM6sNjn/Qz96zIE4xWPcOstQynZU360Q76xVZhJi4mwtG0AP2jn5zrJYjMD
 Vl8Qzf1BWV4vV0g9P7ZHbUnIgRdgH5d9xUajvXqZX49dRVeDlrfJdfc9z5LKgEwZgbGd6eH+ukwMA
 PSclmJBlMrvUmX6o=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oRebI-0002RI-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Aug 2022 19:02:45 +0000
Received: by mail-io1-f69.google.com with SMTP id
 v14-20020a6b5b0e000000b0067bc967a6c0so1414011ioh.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Aug 2022 12:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc;
 bh=dq5VkqjfDnwWLl/bsXasVEegglasUUDpYrJ8qiZGvfU=;
 b=YJClm0t50jMVa5GB18qBy21RFFcxhaRo6+f8EVpryBQvbKhO77PqSljoC80GE2mtju
 rBeeXJCj3f5P7hOVdOz3pE4BWvr52uCA0gqXlwGkr8NsbeXQkx1Qf6mOU3nvazBT4mDG
 wmdYpWkTPGLJh3aVUyG5b+Pl8dUqPJbKqKPz8P4E3RN0MUtPwVAxfzZkYb4+a3TaarsC
 KeEoJasg4E0KR96J9B9e/h1FBLz0kDPJfdnoRj6jEJwKNYb+Z37a4u+8BtVCFEwS6AB+
 NdSU0dSFEV/DxRDAZ2I+jpRbNt1tYR3iA1zzojAhUsvuvzDMAbQK9067gTL+59c5Mgxd
 lzCA==
X-Gm-Message-State: ACgBeo08wxoKRwacLpA5uDx4fHvbAx2Vv2aKazYIARncGvUF+JL9V1nU
 g9p7EKrw2vDNEXgMctLzyVPJaQgs2XEprALhnDhZlZmKR81c
X-Google-Smtp-Source: AA6agR7sf7ZBSqvlIc2tOb7t/wHMmhB/lfBoygiWWaHxWN7e36f0wmiKls7yee9YOFkHWyaDrSb2MeNbK2RPW4n+4wvc/RgZ6rR0
MIME-Version: 1.0
X-Received: by 2002:a92:cd8f:0:b0:2df:ff82:2e5f with SMTP id
 r15-20020a92cd8f000000b002dfff822e5fmr4777330ilb.72.1661540554818; Fri, 26
 Aug 2022 12:02:34 -0700 (PDT)
Date: Fri, 26 Aug 2022 12:02:34 -0700
In-Reply-To: <000000000000d5b4fe05e7127662@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008cccea05e7298e1f@google.com>
From: syzbot <syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 syzkaller-bugs@googlegroups.com, willy@infradead.org
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: a41a877bc12d Merge branch 'for-next/fixes' into for-kernelci
 git tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1oRebI-0002RI-Bj
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot has found a reproducer for the following issue on:

HEAD commit:    a41a877bc12d Merge branch 'for-next/fixes' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=104eb875080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea15779c42821c
dashboard link: https://syzkaller.appspot.com/bug?extid=775a3440817f74fddb8c
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15aebce7080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167b5e33080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000086000004
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000109ee4000
[0000000000000000] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 86000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3045 Comm: syz-executor330 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : 0x0
lr : folio_mark_dirty+0xbc/0x208 mm/page-writeback.c:2748
sp : ffff800012783970
x29: ffff800012783970 x28: 0000000000000000 x27: ffff800012783b08
x26: 0000000000000001 x25: 0000000000000400 x24: 0000000000000001
x23: ffff0000c736e000 x22: 0000000000000045 x21: 05ffc00000000015
x20: ffff0000ca7403b8 x19: fffffc00032ec600 x18: 0000000000000181
x17: ffff80000c04d6bc x16: ffff80000dbb8658 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: ff808000083e9814 x10: 0000000000000000 x9 : ffff8000083e9814
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff0000cbb19000 x4 : ffff0000cb3d2000 x3 : ffff0000cbb18f80
x2 : fffffffffffffff0 x1 : fffffc00032ec600 x0 : ffff0000ca7403b8
Call trace:
 0x0
 set_page_dirty+0x38/0xbc mm/folio-compat.c:62
 f2fs_update_meta_page+0x80/0xa8 fs/f2fs/segment.c:2369
 do_checkpoint+0x794/0xea8 fs/f2fs/checkpoint.c:1522
 f2fs_write_checkpoint+0x3b8/0x568 fs/f2fs/checkpoint.c:1679
 f2fs_issue_checkpoint+0x1b0/0x234
 f2fs_sync_fs+0x8c/0xc8 fs/f2fs/super.c:1651
 sync_filesystem+0xe0/0x134 fs/sync.c:66
 generic_shutdown_super+0x38/0x190 fs/super.c:474
 kill_block_super+0x30/0x78 fs/super.c:1427
 kill_f2fs_super+0x140/0x184 fs/f2fs/super.c:4544
 deactivate_locked_super+0x70/0xd4 fs/super.c:332
 deactivate_super+0xb8/0xbc fs/super.c:363
 cleanup_mnt+0x1f8/0x234 fs/namespace.c:1186
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
 task_work_run+0xc4/0x208 kernel/task_work.c:177
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 do_notify_resume+0x174/0x1d0 arch/arm64/kernel/signal.c:1127
 prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
 el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:625
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:642
 el0t_64_sync+0x18c/0x190
Code: bad PC value
---[ end trace 0000000000000000 ]---



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
