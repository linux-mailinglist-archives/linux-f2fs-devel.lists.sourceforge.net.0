Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGvAOtNr/mkgqgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 01:03:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3604FC90E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 01:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OsF3UzstDNMI6oYCMGygGD5mvyUyF0gylKsLyJBvKVs=; b=XediFHrpJEvq/1HdNTVynnS7Nw
	rolWlVrzgMBj0iu0DA8q5MhHJ2BD7HQ9MDE2m/z+ssarzJ1pfyZyetiXVeb74jBjuYtU2o9vTSPV3
	wX+bvivbcrPcZxewPAPHH4EKzd32Bp5fr94u0KbVFrplGGm3eL5TSszNOxpqxsfWGA1M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLUEO-0007KB-UD;
	Fri, 08 May 2026 23:03:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3umv-aQkbAOEVbcNDOOHUDSSLG.JRRJOHXVHUFRQWHQW.FRP@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wLUEM-0007K3-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 May 2026 23:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I15xJCCUjxuemBNwgUxoW1Pol1NtT3Mxp32OUx/m3Vw=; b=aFe9VU+Cd6nzVgwvQRS3YYh10p
 f9h3p+p3IYtOvBxX9/3Ea8Ln4LjQo0U9HeUjls/ptkYe2vEbgzW1iao3vOpLuMkjvToZxrb+8Wsbs
 um+g/7xIe+8VTigJqATVl0jH5Fa3IZevTufciaP0UCD7PM/TYJz/SSOL/J7FNAUCFiyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I15xJCCUjxuemBNwgUxoW1Pol1NtT3Mxp32OUx/m3Vw=; b=m
 BKY8tQt8yiLkBxxfDwDQijsy7QIkW5A6FA/1sZnf6GGu72C8j6YhG4uRh7EkW3NZhCsZuf2pvJ3Jw
 Kc7wZNMP1jovNg2tpbvGoAk51ZoohMcNTrU93agWxkZmdsaxtIBAzLuvoVu5+1dU4s2BppAwvTJuc
 8zqKA1RV70U7NT48=;
Received: from mail-ot1-f79.google.com ([209.85.210.79])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wLUEH-0001hY-E2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 May 2026 23:03:36 +0000
Received: by mail-ot1-f79.google.com with SMTP id
 46e09a7af769-7dcdcacd141so4172797a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 May 2026 16:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778281403; x=1778886203;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I15xJCCUjxuemBNwgUxoW1Pol1NtT3Mxp32OUx/m3Vw=;
 b=cfxKQOTiMBr7KUCeAv0BJJ47GLUOxfWN1ER8Qy12AXpPqdN9hyoWLHFsnHVbVQq1Zm
 Udx2kzxlrozoK5WsES/qR1JvOobj8qjgfRw1rV8I9I3fS3MG6OlcdnyVsA+V/MtNiytH
 W7oLlqoz2Ycl/M0WS0TaO/eI1G0xPC+oWD2t35kT/ZDJCHG1yavEHyur6q0MrnK0L5YY
 yehNFx6MksHUSFblwRCSfVim5FHoWnxjnZH0dum7OBCoNT9AiO2u9gvftl+xmvlvIYTB
 oXwCEz0x1syUaIGjBxV7113Q8GeOu0rMg9HQ2bSgTqoyqXSRgAL82z01YShpJl5vU1N4
 3F1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/m0l9XlYsVvpyZO33DlVCZr5nG+e4xaD+jEl/WBUZ+35LCBZA7kY1ThfSzOoZ1+wf8+j1lLPDSjA106saGtd4O@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyPkNqSCP0jWOYdjdEbmmDaqUGGItYWEM8agKLjZ8KkfWsbRKEC
 8POr/KTz/xoTClPjWhf4k/nqApr7IlbXJb5e5X6NT3nR83oWPjUVSnkhhI9iQeVJQ1jevHlPf65
 rj6MBOt3p2b2AoM4XCrLfT22OBtBbTinaMj5ypnZzPmwPodqt8izhUn40A84=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2902:b0:696:2cdf:15e2 with SMTP id
 006d021491bc7-69998c95d7emr8847064eaf.7.1778281402847; Fri, 08 May 2026
 16:03:22 -0700 (PDT)
Date: Fri, 08 May 2026 16:03:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69fe6bba.050a0220.1036b8.0004.GAE@google.com>
From: syzbot <syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9d0d467c3572
 Add linux-next specific files for 20260504 git tree: linux-next console
 output:
 https://syzkaller.appspot.com/x/log.txt?x=1654656a580000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.79 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wLUEH-0001hY-E2
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: trying to register non-static key
 in f2fs_exist_written_data
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
X-Rspamd-Queue-Id: 2F3604FC90E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=ef1c15606892fce1];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[eec8f2693d71386bd600];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,goo.gl:url,googlegroups.com:email,storage.googleapis.com:url,appspotmail.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    9d0d467c3572 Add linux-next specific files for 20260504
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1654656a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ef1c15606892fce1
dashboard link: https://syzkaller.appspot.com/bug?extid=eec8f2693d71386bd600
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157331ce580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161b4a73980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a19ae01a3069/disk-9d0d467c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29f12fe616bd/vmlinux-9d0d467c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eea74c667054/bzImage-9d0d467c.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/45693b275dc4/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=117331ce580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com

F2FS-fs (loop0): Image doesn't support compression
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Failed to get valid F2FS checkpoint
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 5928 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:986
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1301
 __lock_acquire+0xad/0x2d10 kernel/locking/lockdep.c:5114
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5870
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 f2fs_exist_written_data+0x53/0x90 fs/f2fs/checkpoint.c:787
 f2fs_drop_inode+0xda/0xbf0 fs/f2fs/super.c:1852
 iput_final fs/inode.c:1926 [inline]
 iput+0x651/0xe80 fs/inode.c:2009
 f2fs_fill_super+0x6047/0x7850 fs/f2fs/super.c:5461
 get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1694
 vfs_get_tree+0x92/0x2a0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3758 [inline]
 do_new_mount+0x341/0xd30 fs/namespace.c:3834
 do_mount fs/namespace.c:4167 [inline]
 __do_sys_mount fs/namespace.c:4383 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4360
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f39fca4e04a
Code: 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcfe531b98 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcfe531c20 RCX: 00007f39fca4e04a
RDX: 0000200000000140 RSI: 00002000000000c0 RDI: 00007ffcfe531be0
RBP: 0000200000000140 R08: 00007ffcfe531c20 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00002000000000c0
R13: 00007ffcfe531be0 R14: 0000000000005553 R15: 00002000000003c0
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
