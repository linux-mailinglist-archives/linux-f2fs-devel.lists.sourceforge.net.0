Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72B2D3C57
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 08:34:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmtzb-0002dT-8P; Wed, 09 Dec 2020 07:34:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <38X3QXwkbADQiopaQbbUhQffYT.WeeWbUkiUhSedjUdj.Sec@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kmtzZ-0002dL-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 07:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hu6iJbFDy3nFb70699PrdHaMHxEsAqLkKm9sMmsagYU=; b=eaR7/wf38kE6urDM9xw5oWz4nn
 MHHCkZ1LEyrKTfmibxjjVqANWluTy2J3PAvLauKY6/YTOf9JZaw3TIMEwMMK9s9hA+O2jCecOPjiW
 f3z1lMtIXP/vHRTNg16rLYIbNdmStk+8u2xK1BL+8EDK1pT2YUaUhlWUouVBOz2jbY2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hu6iJbFDy3nFb70699PrdHaMHxEsAqLkKm9sMmsagYU=; b=k
 iNZ+1nEihXPJn2H1wv/SmI0qqX0FPMq1WVH1cJZPdi99TeqUIumSXj/Di+NwjNz5yJ09wVR3dtKHe
 AUUC7b/NvLdJ07PTbKR1eTotAgwxjgVzDxfJFOMwVhplOHq3zhKA08Sv6Z2iZqHGHYuL5P1uHhp7/
 w50Gwk8B1Z5r+HEs=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmtzS-007TUN-JD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 07:34:29 +0000
Received: by mail-il1-f199.google.com with SMTP id q2so620091ilt.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Dec 2020 23:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=hu6iJbFDy3nFb70699PrdHaMHxEsAqLkKm9sMmsagYU=;
 b=GAZpQ4u9Lr6SVQmKgnRImYDeloy0+axC5NmcZvbUgLw/C/T/Nwje2fPCaTKKo0RGiB
 L7f/GcxEYCiRu61k+Qy5h2w40AuXrSI0zdczJD/nnG0UoOehzbbAx+8Se1BMfk+EORlj
 i0UrQx13QC2DQU6cx1vbSKjzw0QPnmc70gVQSPb5rHn5xAJLWBI1LdpV3NKi8XaXlmmh
 XQInpzTQCrPxLU6lsvDU7mcREFhtn2rhBxXXEPCuBtxfVaoUI7soQBuacSvMImWG6iaJ
 SJRsLu9BYuqcG9nJ/zRdDkC/CekcVkwC/FkmG6TOc1dAWbL5S1h8OY2+tCopwADXwVjR
 zoCw==
X-Gm-Message-State: AOAM532h6OWS9BThVtkGUCnf7nPErOLYHOAtI/Kr6gwIeAFDgXsV4ciZ
 4NJVUG8ldsUUtl1qLlmKkQsieb4+JbYoxIcId72HNWVDRDiW
X-Google-Smtp-Source: ABdhPJx3HLdEiYZhYSUuOOfSw9uk2euCuwTaO90+qYsbTXiba0NC/jMTnJJiPnYMSwH3jWN3udAKuW5PfMjCMq3Y24mCmupMnXDy
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:cb:: with SMTP id
 r11mr1125473ilq.11.1607499249912; 
 Tue, 08 Dec 2020 23:34:09 -0800 (PST)
Date: Tue, 08 Dec 2020 23:34:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c492d105b6031553@google.com>
From: syzbot <syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlegroups.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.199 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kmtzS-007TUN-JD
Subject: [f2fs-dev] UBSAN: shift-out-of-bounds in f2fs_fill_super
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

HEAD commit:    15ac8fdb Add linux-next specific files for 20201207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14ba4b37500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3696b8138207d24d
dashboard link: https://syzkaller.appspot.com/bug?extid=ca9a785f8ac472085994
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e17ccb500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c21287500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com

loop0: detected capacity change from 16384 to 0
================================================================================
UBSAN: shift-out-of-bounds in fs/f2fs/super.c:2812:16
shift exponent 59 is too large for 32-bit type 'int'
CPU: 0 PID: 8465 Comm: syz-executor962 Not tainted 5.10.0-rc6-next-20201207-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 sanity_check_raw_super fs/f2fs/super.c:2812 [inline]
 read_raw_super_block fs/f2fs/super.c:3267 [inline]
 f2fs_fill_super.cold+0x16c9/0x16f6 fs/f2fs/super.c:3519
 mount_bdev+0x34d/0x410 fs/super.c:1366
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1496
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3227
 do_mount fs/namespace.c:3240 [inline]
 __do_sys_mount fs/namespace.c:3448 [inline]
 __se_sys_mount fs/namespace.c:3425 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3425
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x446d4a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007fff137bba68 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fff137bbac0 RCX: 0000000000446d4a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fff137bba80
RBP: 00007fff137bba80 R08: 00007fff137bbac0 R09: 00007fff00000015
R10: 0000000000000000 R11: 0000000000000297 R12: 0000000000000002
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
================================================================================


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
