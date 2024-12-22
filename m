Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D407E9FA7A3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Dec 2024 20:14:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPROs-0004x3-1P;
	Sun, 22 Dec 2024 19:14:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <31WRoZwkbAIIy45qgrrkxgvvoj.muumrk0ykxiutzktz.ius@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tPRON-0004wO-MH for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 19:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XUnHXLellpxXfJVJ34ASXd3kwMDn7EDnrcdkuZlh+9E=; b=DtrzMxPpG05ttxKK4q9cLXNSCx
 eLoEMXa6wIP8q4zfEa8bgK/ibB/pU4/m1kNMVWs46CN1gIVQGwv5l4qQCNb9KXI0RtNbS8eNEcg20
 s0tbm9dbXiWqwxux02IMQ1VPe7QNvFWudVZjrr1ToM0+dLGah1RITFyY0s4l9KvtGUUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XUnHXLellpxXfJVJ34ASXd3kwMDn7EDnrcdkuZlh+9E=; b=Z
 G/MqTRePIVorMIRfCawzeXYjKo194vigUZ3TQrI74TNPZ84Vr8dWvDKWUbWIQLS0047acn3D7mWRZ
 xQkn4jfva5ne80966Jrv+AtC0dvtgp/gzJkihwE3kXWXw9mpzfKiyIvyrzE/kF47vUOnT+pSovkb2
 aiMVoQfWylD9SmY8=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tPROM-0001F0-RM for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 19:13:31 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3a812f562bbso74500195ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 Dec 2024 11:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734894805; x=1735499605;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XUnHXLellpxXfJVJ34ASXd3kwMDn7EDnrcdkuZlh+9E=;
 b=wvkRRYDMPM/iGTMM9mLToDXZNPg4R+lpZ8GqJkz4mOnmGaCqe1k/wOV0bDZf7upYq5
 pN+hoXR4OaiQXBWzNtss7XmoWsJ+tTxqa2T5uf4D3XDGVr+2JZz2bu3/0XzorNxQaV4x
 cMLKG1A+qEufduwb2ZoTru7ENczAlaJ52be3Je8TRMKMTHTFc/EdnJelEApmhcmQSJMI
 1TylSdHl/ZwNoRS+dxI8lhPufWi/H8CZt2tYUbHivZ8dldzL3qcwBvVHRYSDemKflJl3
 Nu/5XNC7D+p5nEeYYkYlT4Q4F//gu2h+uaYUh0E+/FBDsjkUKiylhRnij/3PYh0fwZ5d
 QOOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDq8T82MXJXqOLPfo599+APCamK584cCsOn9ilVw3u0G7XFl8jg8R5BSOTq/E9GLTsX2oilRnC+xo7/A7qxTQC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzW8BLvGYarJQSPkIYDcXwWPD6w8F42VuCOrHga7dgpO05K4XS2
 arKDUOr0HsZN7gA6hf+RQ5kWi325SxfByxo3XOMbPmjD7CU/qCYKMUwX/pL7wvPZkSnS9SGpioO
 XaQ90qu+fYUMiF9u6erW+jb57tz4krAXTJPgPJeVNVzT827LqjzpqpUg=
X-Google-Smtp-Source: AGHT+IHfYjtBAla6Dju0icxhJIz0UtiUbY8FgcltfTwTZ4qfzNIOkNHMtk0tklVq8RPqK564er2nxZ1fHKxNEz2ipBYlJ+sJO+P7
MIME-Version: 1.0
X-Received: by 2002:a92:b710:0:b0:3a7:e732:471b with SMTP id
 e9e14a558f8ab-3c4fd09b311mr47879635ab.11.1734894805111; Sun, 22 Dec 2024
 11:13:25 -0800 (PST)
Date: Sun, 22 Dec 2024 11:13:25 -0800
In-Reply-To: <674f4e7d.050a0220.17bd51.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676864d5.050a0220.226966.002c.GAE@google.com>
From: syzbot <syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: bcde95ce32b6 Merge tag 'devicetree-fixes-for-6.13-1' of gi..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=116c0adf980000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tPROM-0001F0-RM
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 read_inline_xattr
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

HEAD commit:    bcde95ce32b6 Merge tag 'devicetree-fixes-for-6.13-1' of gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=116c0adf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1234f097ee657d8b
dashboard link: https://syzkaller.appspot.com/bug?extid=69f5379a1717a0b982a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167f9f30580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142d7cf8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/be6d4de70f82/disk-bcde95ce.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/70993500a1e4/vmlinux-bcde95ce.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1018443184c5/bzImage-bcde95ce.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7e1b134be79c/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com

F2FS-fs (loop0): Failed to enable quota tracking (type=1, err=-22). Please run fsck to fix.
F2FS-fs (loop0): Cannot turn on quotas: error -22
F2FS-fs (loop0): Mounted with checkpoint version = 1b41e954
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
index 18446744073709500059 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
CPU: 0 UID: 0 PID: 5820 Comm: syz-executor178 Not tainted 6.13.0-rc3-syzkaller-00301-gbcde95ce32b6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 read_inline_xattr+0x273/0x280
 lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
 f2fs_getxattr+0x57b/0x13b0 fs/f2fs/xattr.c:533
 __vfs_getxattr+0x433/0x470 fs/xattr.c:423
 smk_fetch+0xb1/0x140 security/smack/smack_lsm.c:306
 smack_d_instantiate+0x749/0xa50 security/smack/smack_lsm.c:3615
 security_d_instantiate+0x107/0x1f0 security/security.c:4070
 d_splice_alias+0x6f/0x330 fs/dcache.c:3001
 f2fs_lookup+0x4ff/0x820 fs/f2fs/namei.c:523
 lookup_one_qstr_excl+0x11f/0x260 fs/namei.c:1692
 filename_create+0x297/0x540 fs/namei.c:4081
 do_mkdirat+0xbd/0x3a0 fs/namei.c:4326
 __do_sys_mkdir fs/namei.c:4354 [inline]
 __se_sys_mkdir fs/namei.c:4352 [inline]
 __x64_sys_mkdir+0x6c/0x80 fs/namei.c:4352
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5566117ad7
Code: ff ff 77 07 31 c0 c3 0f 1f 40 00 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff7eab6a58 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5566117ad7
RDX: 0000000000000000 RSI: 00000000000001ff RDI: 0000000020000180
RBP: 0000000020000180 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fff7eab6af0 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
---[ end trace ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
