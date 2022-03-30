Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ADE4ECAE9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Mar 2022 19:42:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nZcDA-0006uU-OK; Wed, 30 Mar 2022 17:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <3hJZEYgkbANsPVWH7IIBO7MMFA.DLLDIBRPBO9LKQBKQ.9LJ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1nZcD9-0006uK-8a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Mar 2022 17:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v89tVw8ySyr98HqbPOA8KhBHppRaKTd45nWoytVaQ0U=; b=j6cO92qdzx8/MHWWMYv0c1FfmC
 l3hoTuqC86zXLCgkiWgcIU2F2kpnBwKWP1F4TBz3TSWKSJ1VVLzpOTk2oOzGQhS9wiS4fYlXhJNwE
 UpvEkbrDDeDjSvQmuW9N6QJqR1NEP9wIQCVXMaV35u4lIE5+zwbkL+kjjGx+V078Aicg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=v89tVw8ySyr98HqbPOA8KhBHppRaKTd45nWoytVaQ0U=; b=R
 BjOcGrc/Trm6bQAqq0v62BQABCgUlPcXMV4v0VGn6HDetDmE7BarDQrajKbcn+3wkqZ3L+pantJTJ
 1TiW4+U2YmEXb3lRBF2VGzuxE8VvJ0xs22UkcsXFYmfgq+bMFbBbLaSYn1l9oYXrL74N1FrttttND
 miTbTyl9NPKQE3Z4=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nZcL4-0007ai-5u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Mar 2022 17:42:34 +0000
Received: by mail-io1-f71.google.com with SMTP id
 g11-20020a056602072b00b00645cc0735d7so14908500iox.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Mar 2022 10:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=v89tVw8ySyr98HqbPOA8KhBHppRaKTd45nWoytVaQ0U=;
 b=CavWJCONNARQXZ2rwR1XPs/CzfJAaukTQQN8igorwOly8iPo0qfNo1FP104KvFu4Vw
 I2McfILrbw+35XvdB5C4vhIdI6Zb8hZXur+sqcA/s2RmI4d0MnNFvo2dTqyGTxIlrZZU
 en4DzOM1LR9IZyHvhA295/m0xgbDXAbWN+QQNRYBMy2jBUi28B3tUu7/BJcAFTXP3+WT
 UF87A1ECtGixaS5mS43GesyWl9IhD4MCEBRRixRZ7ohlFxWNS1xiSAyVNVqejZB9Etn7
 nebuM9qfNrvDl+pfbqaY35+SJ+lQHgSnYk+LoKNouYG95Hto9t7l5iIzB+l3vPnnuuGc
 K59A==
X-Gm-Message-State: AOAM532FKamHZetaDUbFa4E4+0sJfh7ekHflCbbQbs9WiEK2LqzJAFFs
 z+5HW8W66YhCT7MhaR/0OXlhEukCsrMtjsYRrvvBXaKRyAFu
X-Google-Smtp-Source: ABdhPJyiz50nZ2RWpGYPBTvfpWsTpAwBWqsfVFFK+b/4bOJNNcHpmERV4SikYJ2bYt+Yp6SYDg/ejepWPdxLAKCPQ7gkC/gl80c6
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1453:b0:319:c928:5ccd with SMTP id
 l19-20020a056638145300b00319c9285ccdmr543819jad.136.1648662148565; Wed, 30
 Mar 2022 10:42:28 -0700 (PDT)
Date: Wed, 30 Mar 2022 10:42:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b850b905db73117a@google.com>
From: syzbot <syzbot+9e29d4a176b24eaa4fc1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: ae085d7f9365
 mm: kfence: fix missing objcg housekeeping fo.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=12a11a77700000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
X-Headers-End: 1nZcL4-0007ai-5u
Subject: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in f2fs_update_meta_page (2)
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

HEAD commit:    ae085d7f9365 mm: kfence: fix missing objcg housekeeping fo..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a11a77700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91f0a0c422e301dd
dashboard link: https://syzkaller.appspot.com/bug?extid=9e29d4a176b24eaa4fc1
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9e29d4a176b24eaa4fc1@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 1ef8e067 P4D 1ef8e067 PUD 0 
Oops: 0010 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 3615 Comm: syz-executor.0 Tainted: G        W         5.17.0-syzkaller-11407-gae085d7f9365 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc9000400f818 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffffea0000c768c0 RCX: ffff88801a581d00
RDX: 0000000000000000 RSI: ffffea0000c768c0 RDI: ffff88802c0203b8
RBP: ffffc9000400faf0 R08: ffffffff81b497cb R09: fffff9400018ed19
R10: fffff9400018ed19 R11: 0000000000000000 R12: ffff88807bb85b10
R13: 0000000000000001 R14: ffff888040fea000 R15: ffff888058d74000
FS:  000055555607f400(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000000479d6000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_update_meta_page+0x45/0x60 fs/f2fs/segment.c:2484
 do_checkpoint fs/f2fs/checkpoint.c:1527 [inline]
 f2fs_write_checkpoint+0x3136/0x5b80 fs/f2fs/checkpoint.c:1689
 f2fs_issue_checkpoint+0x361/0x4e0
 sync_filesystem+0x1bc/0x220 fs/sync.c:66
 generic_shutdown_super+0x6b/0x300 fs/super.c:445
 kill_block_super+0x79/0xd0 fs/super.c:1394
 kill_f2fs_super+0x2f9/0x3c0 fs/f2fs/super.c:4546
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x462/0x510 fs/namespace.c:1186
 task_work_run+0x146/0x1c0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:190 [inline]
 exit_to_user_mode_prepare+0x1dd/0x200 kernel/entry/common.c:222
 __syscall_exit_to_user_mode_work kernel/entry/common.c:304 [inline]
 syscall_exit_to_user_mode+0x2e/0x70 kernel/entry/common.c:315
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f48a848a4b7
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd9c82d6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f48a848a4b7
RDX: 00007ffd9c82d7bc RSI: 000000000000000a RDI: 00007ffd9c82d7b0
RBP: 00007ffd9c82d7b0 R08: 00000000ffffffff R09: 00007ffd9c82d580
R10: 00005555560808b3 R11: 0000000000000246 R12: 00007f48a84e21ea
R13: 00007ffd9c82e870 R14: 0000555556080810 R15: 00007ffd9c82e8b0
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc9000400f818 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffffea0000c768c0 RCX: ffff88801a581d00
RDX: 0000000000000000 RSI: ffffea0000c768c0 RDI: ffff88802c0203b8
RBP: ffffc9000400faf0 R08: ffffffff81b497cb R09: fffff9400018ed19
R10: fffff9400018ed19 R11: 0000000000000000 R12: ffff88807bb85b10
R13: 0000000000000001 R14: ffff888040fea000 R15: ffff888058d74000
FS:  000055555607f400(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000000479d6000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
