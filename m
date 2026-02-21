Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HJnMIoummm7ZQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Feb 2026 23:15:38 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E116E160
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Feb 2026 23:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f63zY88AgaGN6WwfHCGr3vezhBXZpi2lBWZeX9LdP0Q=; b=Rt9EXlB9rLnnfWQs726Adaf0O7
	ey8rHPoUOpVmcojHhKdJxH7JcGRsA5w50xZReo5DDDjYCoKUEWkZfs/uFJEDO3JHy87SU5ajuKA1V
	5JBVcyHFw2hPi+uXkvGx5xShFY9eHKvr0aLGEpaZI7wuctSunWBJUqA3pGLzbSBvumCE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vtvG5-0007YX-Pe;
	Sat, 21 Feb 2026 22:15:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Py6aaQkbAFgIOPA0BB4H0FF83.6EE6B4KI4H2EDJ4DJ.2EC@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vtvFC-0007XB-Uy for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Feb 2026 22:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X2o0ElPdIIndk4TigvwKqnKahz1bT2tnGAtngJU+WTo=; b=cpJuNG37uOD8Y9czHAI1qsrw0z
 5b53dqHLFvJhurjxgUhB3nTbLy7/mKdVZafHEL9L6plODhhK2YcCITz18r4Qc2kkMcP8qZXS/V5Go
 A9855hTC1iSBRALWfsDDLDnbTw9Mh+vrXHpJIZ57FkVwNd5e+RLRH+UfmB+tWdyl0nSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=X2o0ElPdIIndk4TigvwKqnKahz1bT2tnGAtngJU+WTo=; b=d
 OFV1WB1Zee7F0PL5HpclVUTyHZda2hMIhqBGR4wmHntRUt1NwkmZ/J+V3mIoO6J2WnGyKRSJojiyw
 C9D2ncj14kLlR+BYAvqxPFoyrYIstA+68X0OqUEhzMqJ839lsZOmnDGIQuLhJRVj7GVV4EHdPZZHq
 PVZW+1z3Z4zyoZfE=;
Received: from mail-oo1-f71.google.com ([209.85.161.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vtvFC-0008IE-EC for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Feb 2026 22:14:34 +0000
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-677d92bb88dso50384545eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 21 Feb 2026 14:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771712064; x=1772316864;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2o0ElPdIIndk4TigvwKqnKahz1bT2tnGAtngJU+WTo=;
 b=A2ekBYpfq1Naw88cuCe7k0nXQhi7u9euZ/wHP124D1U/94mrSeLZqnJCHu3RePaN6S
 v1NJ1nXAyqWNrhNkY79ioGbUPZTni1s9mMnOz7VyfrBJg3ms3o3Ah4VipmIalosObTUU
 iWXgnunB0h8ynLpISc1n0/ePZN+PQmvji4Nv+XGqfkD+eZV+WWNCss4KYyENF5uHvCRD
 /a2VuSKJHmM9mFhSL7wF9ws4qc4hTlGIJF1A6Twy3UF1OHUYz6P8bkVCUGfHdyf3EZN4
 8k/ZJx4sgCf+VH10fof6xRw/5i8bVJixXIX42llFoUkrlIyE2iU5aNBPJOobHBQsI7eK
 xx8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTNr9SQodx+TTFMbX/bxKkzGyOSF7XhlIhvNe6LkyXjl661hSjmXy9PzBuBQmxhHUolbBPYvwIzvm/E/h6HKhi@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxpKnmodkn6+BBB+qZrvYQXdXU38CiMds6c+mNU4vrQGOH0gbNC
 ntt/2hD9CUCdJEi4GHwJIxYeAw1J5IlP1o93UsjCKArAEW8cSkZeS8LPM2WIKc1I3+utxbyIoV/
 R2t6IT30CJlRa2yxpW2BWC+GBDd11uM7CkJp/tEKP9DWLmUj2MYWkKPE7ZpQ=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160c:b0:66e:466d:8ddc with SMTP id
 006d021491bc7-679b1036444mr4716675eaf.21.1771712063916; Sat, 21 Feb 2026
 14:14:23 -0800 (PST)
Date: Sat, 21 Feb 2026 14:14:23 -0800
In-Reply-To: <69959446.050a0220.2eeac1.014d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <699a2e3f.050a0220.340abe.0d2a.GAE@google.com>
From: syzbot <syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: d79526b89571 Merge tag 'spi-fix-v7.0-merge-window' of git:..
 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=16898f3a580000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.71 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vtvFC-0008IE-EC
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_in_warm_node_list
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=abe4fa590468dbfb];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[6e4cb1cac5efc96ea0ca];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,storage.googleapis.com:url,syzkaller.appspot.com:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: EF8E116E160
X-Rspamd-Action: no action

syzbot has found a reproducer for the following issue on:

HEAD commit:    d79526b89571 Merge tag 'spi-fix-v7.0-merge-window' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16898f3a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=abe4fa590468dbfb
dashboard link: https://syzkaller.appspot.com/bug?extid=6e4cb1cac5efc96ea0ca
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1230d722580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11638152580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/44c805790970/disk-d79526b8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1ce6fb543c09/vmlinux-d79526b8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e59b179ab15c/bzImage-d79526b8.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6c7449a54d18/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16e5255a580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 1 UID: 0 PID: 30 Comm: ksoftirqd/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
RIP: 0010:f2fs_in_warm_node_list+0xbd/0x290 fs/f2fs/node.c:330
Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 31 ab fd fd 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 14 ab fd fd 4d 3b 37 74 19 e8 4a
RSP: 0018:ffffc90000a4f9a8 EFLAGS: 00010206
RAX: 0000000000000006 RBX: ffffea0000c14dc0 RCX: ffff88801d2b9e40
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: ffffea0000c14dd8 R08: ffff88803746002b R09: 1ffff11006e8c005
R10: dffffc0000000000 R11: ffffed1006e8c006 R12: ffff88803471e798
R13: dffffc0000000000 R14: ffff888045f67750 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff888126442000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffda58b1c70 CR3: 000000003ab1a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 f2fs_write_end_io+0x7ab/0xff0 fs/f2fs/data.c:400
 blk_update_request+0x57e/0xe60 block/blk-mq.c:1016
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1178
 blk_flush_complete_seq+0x687/0xce0 block/blk-flush.c:191
 flush_end_io+0xc40/0xf30 block/blk-flush.c:251
 __blk_mq_end_request+0x4a9/0x680 block/blk-mq.c:1168
 blk_complete_reqs block/blk-mq.c:1253 [inline]
 blk_done_softirq+0x10a/0x160 block/blk-mq.c:1258
 handle_softirqs+0x1de/0x6f0 kernel/softirq.c:622
 run_ksoftirqd+0x52/0x180 kernel/softirq.c:1063
 smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:467
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
RIP: 0010:f2fs_in_warm_node_list+0xbd/0x290 fs/f2fs/node.c:330
Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 31 ab fd fd 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 14 ab fd fd 4d 3b 37 74 19 e8 4a
RSP: 0018:ffffc90000a4f9a8 EFLAGS: 00010206
RAX: 0000000000000006 RBX: ffffea0000c14dc0 RCX: ffff88801d2b9e40
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: ffffea0000c14dd8 R08: ffff88803746002b R09: 1ffff11006e8c005
R10: dffffc0000000000 R11: ffffed1006e8c006 R12: ffff88803471e798
R13: dffffc0000000000 R14: ffff888045f67750 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff888126442000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffda58b1c70 CR3: 000000003ab1a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	4d 03 3c 24          	add    (%r12),%r15
   6:	4c 89 f8             	mov    %r15,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
  12:	74 08                	je     0x1c
  14:	4c 89 ff             	mov    %r15,%rdi
  17:	e8 31 ab fd fd       	call   0xfdfdab4d
  1c:	4d 8b 3f             	mov    (%r15),%r15
  1f:	49 83 c7 30          	add    $0x30,%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 14 ab fd fd       	call   0xfdfdab4d
  39:	4d 3b 37             	cmp    (%r15),%r14
  3c:	74 19                	je     0x57
  3e:	e8                   	.byte 0xe8
  3f:	4a                   	rex.WX


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
