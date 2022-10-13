Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 422775FD5C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 09:54:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oit3G-00032l-4k;
	Thu, 13 Oct 2022 07:54:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3O8RHYwkbAAQw23oeppivettmh.ksskpiywivgsrxirx.gsq@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1oit3E-00032d-54 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 07:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pBB2JfHD6BC1GAkdvMOikiHG2EgwxF6IhXOcrtnyG/E=; b=T8vjjtZ+mgntN/Pz1hQRO+zwLO
 P/m2Zm5RC2h1r8tH42dhG2NNi/lLNE1caIvoeF8nFNML4aarkG7Y+6ld2SwXx2PexwaKih3gXw8XS
 yq7+GPDOfVNCSdIeOFmYg9ytkjfj4gB36pbv9abn4k9FyWQHSI1rYb/xmJnON3/SZ56g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pBB2JfHD6BC1GAkdvMOikiHG2EgwxF6IhXOcrtnyG/E=; b=N
 tWrPKAinjuUFxrGi97V1HocUqUmQ1W/C3hTSfIeSfCHtL2aW61TxVjNsCgwlvqu1dVXaZ3VYCN6m+
 P+XjJA4pdlfLwA7lAfBLToKDujrQy+gvavO/rOboo4aFsNWZqTie/GEjERjPHOWh4dx/WDTYZGque
 4+UxF8Kh10ohkOZ4=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oit39-0004a8-Vv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 07:54:44 +0000
Received: by mail-il1-f197.google.com with SMTP id
 a17-20020a921a11000000b002fadf952565so964207ila.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Oct 2022 00:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pBB2JfHD6BC1GAkdvMOikiHG2EgwxF6IhXOcrtnyG/E=;
 b=AyZZpWkJ4jZHtGQirdDFT0a6mYGF7zx0VD4xfvjMbk8Q8Ly0Cq/98N6Zff+QVTtI37
 jAd6R8khG0glL+nCG5bXxFCNRUoFQpGEUqg2TVEPYGQ29/WAZhfWXuxAxXumctUsrWUZ
 OWkHqj1z6CU8E7jyNgB7qrZNhbPf7TtRcKazRojyKldJ95P67ljl5s5kdV8On8Loej1x
 z6BElCGUz+Ta46OlidxFWx6hM200WDi5ra6u17rm52X9jBWJRWIdzYV/nq3lrivPIy3P
 R6hdK4xs7fn5hQA2Gj1jypHWdF2cAOmYePMWqgbUNzldQ9u0DKewsnKxmw7Q6zLMTXe+
 e2rA==
X-Gm-Message-State: ACrzQf1O6jgz8miSApXpAE/6zxZDMVM+nQ1m3BuPIrBfEsoQbgZt7G25
 PhnX1Ln6rlmsgheJiy2BDokhySD8B79by6QNcTmP6go0bDaO
X-Google-Smtp-Source: AMsMyM5BbBlIIjS2Mees0N/qPO9/79u+sdFa9hsrt87xuSU3KkvAUltoXw2DrhLqjg6r2hBsRGHVoxNPaAwfL2fjfANm5ftOXdwE
MIME-Version: 1.0
X-Received: by 2002:a92:c265:0:b0:2f9:ec63:2e3e with SMTP id
 h5-20020a92c265000000b002f9ec632e3emr16809676ild.275.1665647675034; Thu, 13
 Oct 2022 00:54:35 -0700 (PDT)
Date: Thu, 13 Oct 2022 00:54:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fdd5dc05eae5d1af@google.com>
From: syzbot <syzbot+729c925c2d9fc495ddee@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 493ffd6605b2
 Merge tag 'ucount-rlimits-cleanups-for-v5.19'.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=15fc0252880000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oit39-0004a8-Vv
Subject: [f2fs-dev] [syzbot] KASAN: null-ptr-deref Write in kill_f2fs_super
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

Hello,

syzbot found the following issue on:

HEAD commit:    493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15fc0252880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
dashboard link: https://syzkaller.appspot.com/bug?extid=729c925c2d9fc495ddee
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15714978880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1152f7cc880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1ff6481e26f/disk-493ffd66.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/101bd3c7ae47/vmlinux-493ffd66.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dd1108445544/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+729c925c2d9fc495ddee@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 264192
F2FS-fs (loop0): invalid crc_offset: 0
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Mounted with checkpoint version = 3651456e
==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read_write include/linux/instrumented.h:101 [inline]
BUG: KASAN: null-ptr-deref in atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:116 [inline]
BUG: KASAN: null-ptr-deref in __refcount_add include/linux/refcount.h:193 [inline]
BUG: KASAN: null-ptr-deref in __refcount_inc include/linux/refcount.h:250 [inline]
BUG: KASAN: null-ptr-deref in refcount_inc include/linux/refcount.h:267 [inline]
BUG: KASAN: null-ptr-deref in get_task_struct include/linux/sched/task.h:110 [inline]
BUG: KASAN: null-ptr-deref in kthread_stop+0x2a/0x210 kernel/kthread.c:703
Write of size 4 at addr 000000000000001c by task syz-executor364/3613

CPU: 1 PID: 3613 Comm: syz-executor364 Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 print_report+0xf1/0x1f0 mm/kasan/report.c:436
 kasan_report+0xc3/0xf0 mm/kasan/report.c:495
 kasan_check_range+0x2a7/0x2e0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:101 [inline]
 atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:116 [inline]
 __refcount_add include/linux/refcount.h:193 [inline]
 __refcount_inc include/linux/refcount.h:250 [inline]
 refcount_inc include/linux/refcount.h:267 [inline]
 get_task_struct include/linux/sched/task.h:110 [inline]
 kthread_stop+0x2a/0x210 kernel/kthread.c:703
 kill_f2fs_super+0xe6/0x3c0 fs/f2fs/super.c:4522
 deactivate_locked_super+0xa7/0xf0 fs/super.c:331
 cleanup_mnt+0x4ce/0x560 fs/namespace.c:1186
 task_work_run+0x146/0x1c0 kernel/task_work.c:177
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x6b2/0x2280 kernel/exit.c:813
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:943
 __do_sys_exit_group kernel/exit.c:954 [inline]
 __se_sys_exit_group kernel/exit.c:952 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:952
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f8264e76359
Code: Unable to access opcode bytes at 0x7f8264e7632f.
RSP: 002b:00007fffe8489448 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f8264eee410 RCX: 00007f8264e76359
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 0000000000000000
R10: 0000000000180020 R11: 0000000000000246 R12: 00007f8264eee410
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
