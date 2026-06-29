Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y5OUOwlbQmpE5QkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 13:46:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE9C6D99A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 13:46:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=GzyHC3fG;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=JK2wejXr;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=R9l7Y0IN;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="iM/nSZ28";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC0eMVRcGf90ssX6GOliiECHMC1WKLSuyPgm2r2DlTQ=; b=GzyHC3fGal8cM/GN8iwqxdso6R
	xBVdpnpUK2xIS/4OOKIMoo+CPCjvVcoQ8KmPonQb2CEoZ0HLunxzmKcCE2W+JLaG1XnG/xZ+jRTYL
	0n7+ZZ5R/tD7UBNU0hyXRQJmhuNJYVAIJx398jFBKSf1/p6v2H+dTwNHm2oMNo/SgSJ8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weARA-00022l-2p;
	Mon, 29 Jun 2026 11:46:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1weAR9-00022e-KH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 11:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nPZ7ws+62VWM6nyBb5IbKFldU/KuuDHoy39BQf2Yi3w=; b=JK2wejXrX/tjCJkl6pdV85dkBk
 mBOzXDRxWqlHGi8D0Nc+vtzS+JwIyx1nfx/8AfBO4lmh1HHOw5dlgXf/2m47NAv+QHHeaDBTlRrdC
 VocnPl7+dnpvE/mWmpzDg0iVtBSDe8oPdSCI/E0ePbWArLxYeR4Zs/wve7CENub5B7fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nPZ7ws+62VWM6nyBb5IbKFldU/KuuDHoy39BQf2Yi3w=; b=R9l7Y0INMOOMPqxcAz8iGplQTx
 DNwHM3khvcifG8hrEbKyIkGbYraLgqEKdlZ15OHr4omEt5xj6llEPxH/D/DxD6D1XVEu4kaeAxfvw
 lgrCo2apnD0+kazuY843VlBj3dQ5FqFBI5RBh8lyiSHc9dOhK2VnI+lhTAA/c7+2tWdQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weAR5-0008WC-UO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 11:46:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C989C6001D;
 Mon, 29 Jun 2026 11:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B8E1F000E9;
 Mon, 29 Jun 2026 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782733549;
 bh=nPZ7ws+62VWM6nyBb5IbKFldU/KuuDHoy39BQf2Yi3w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=iM/nSZ28Ljm38KlhloCU4xJ7VU25Nhmwp+dLqoe23lDLgTONh2O0MFkkwjnatjZjn
 mqlOl2wQIhQUswxRbTTEuC9qJfHvQm1mUQdon8ej5u5nPE4J2vxv5CFyJ8N9ATpFAL
 loHgq28mCdAEMj97ICsJ7nYRAw1kYjZekao/2l5TzsZC0VMoL7ct9ukNEMTrHhnLmC
 0GEb2I6v6/ON1cfHwwp1Me0HPwSijAiGOU304q0qnohfyp6AeS6og+kF38jtERvCJX
 RXpcxohlN5Gg3WX3JpJni33pDccbfVNpfAHp3nZiGjNOQ/b0aAd45sJyyPB1oqxHGd
 ekD8IKo1BS1jA==
Message-ID: <88af8af1-3eec-4e00-a829-24671f24c0ea@kernel.org>
Date: Mon, 29 Jun 2026 19:45:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sanan.hasanou@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <6a3eeee8.516c2524.21c3a2.ac0d@mx.google.com>
Content-Language: en-US
In-Reply-To: <6a3eeee8.516c2524.21c3a2.ac0d@mx.google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/27/26 05:28, sanan.hasanou@gmail.com wrote: > Good day, 
 dear maintainers, > > We found a bug using a modified version of syzkaller.
 > > Kernel Branch: 7.0-rc1 > Kernel Config: <https://drive.goog [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1weAR5-0008WC-UO
Subject: Re: [f2fs-dev] general protection fault in f2fs_in_warm_node_list
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: contact@pgazz.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:sanan.hasanou@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:contact@pgazz.com,m:syzkaller@googlegroups.com,m:sananhasanou@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.sourceforge.net,vger.kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EE9C6D99A1

On 6/27/26 05:28, sanan.hasanou@gmail.com wrote:
> Good day, dear maintainers,
> 
> We found a bug using a modified version of syzkaller.
> 
> Kernel Branch: 7.0-rc1
> Kernel Config: <https://drive.google.com/open?id=1SkS9U2y8MGrnaXhjJJI5n5SymSSMyYnS>
> Unfortunately, we don't have any reproducer for this bug yet.

Thanks for the report, I guess it should has been fix w/

2d9c4a4ed4ee ("f2fs: fix UAF caused by decrementing sbi->nr_pages[] in f2fs_write_end_io()")

Thanks,

> Thank you!
> 
> Best regards,
> Sanan Hasanov
> 
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
> CPU: 0 UID: 0 PID: 3043 Comm: kworker/u8:10 Not tainted 7.0.0-rc1 #1 PREEMPT_{RT,(full)} 
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: bat_events batadv_tt_purge
> RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
> RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
> RIP: 0010:f2fs_in_warm_node_list+0xc5/0x2a0 fs/f2fs/node.c:330
> Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 19 09 07 fe 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 fc 08 07 fe 4d 3b 37 74 14 e8 b2
> RSP: 0018:ffffc9000e9af568 EFLAGS: 00010216
> RAX: 0000000000000006 RBX: ffffea0000ed41c0 RCX: ffff88802cf2b980
> RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
> RBP: ffffc9000e9af590 R08: ffff8880224bd66b R09: 1ffff11004497acd
> R10: dffffc0000000000 R11: ffffed1004497ace R12: ffff888050544780
> R13: dffffc0000000000 R14: ffff88803e405010 R15: 0000000000000030
> FS:  0000000000000000(0000) GS:ffff8880dc0a8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055a77139e428 CR3: 0000000033d4c000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  f2fs_write_end_io+0x785/0x1390 fs/f2fs/data.c:400
>  bio_endio+0x936/0x980 block/bio.c:1792
>  blk_update_request+0x5a5/0xe40 block/blk-mq.c:1016
>  blk_mq_end_request+0x4a/0x80 block/blk-mq.c:1178
>  blk_flush_complete_seq+0x667/0xd10 block/blk-flush.c:191
>  flush_end_io+0xc67/0xf40 block/blk-flush.c:251
>  __blk_mq_end_request+0x5bf/0x710 block/blk-mq.c:1168
>  blk_mq_end_request+0x5e/0x80 block/blk-mq.c:1180
>  lo_complete_rq+0xe3/0x260 drivers/block/loop.c:314
>  blk_complete_reqs block/blk-mq.c:1253 [inline]
>  blk_done_softirq+0x10e/0x160 block/blk-mq.c:1258
>  handle_softirqs+0x1c7/0x690 kernel/softirq.c:622
>  __do_softirq kernel/softirq.c:656 [inline]
>  __local_bh_enable_ip+0x16a/0x270 kernel/softirq.c:302
>  local_bh_enable include/linux/bottom_half.h:33 [inline]
>  spin_unlock_bh include/linux/spinlock_rt.h:116 [inline]
>  batadv_tt_global_purge net/batman-adv/translation-table.c:2250 [inline]
>  batadv_tt_purge+0x45c/0x9e0 net/batman-adv/translation-table.c:3510
>  process_one_work kernel/workqueue.c:3275 [inline]
>  process_scheduled_works+0xa5a/0x15e0 kernel/workqueue.c:3358
>  worker_thread+0xab9/0xff0 kernel/workqueue.c:3439
>  kthread+0x355/0x410 kernel/kthread.c:467
>  ret_from_fork+0x49c/0xa10 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
> RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
> RIP: 0010:f2fs_in_warm_node_list+0xc5/0x2a0 fs/f2fs/node.c:330
> Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 19 09 07 fe 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 fc 08 07 fe 4d 3b 37 74 14 e8 b2
> RSP: 0018:ffffc9000e9af568 EFLAGS: 00010216
> RAX: 0000000000000006 RBX: ffffea0000ed41c0 RCX: ffff88802cf2b980
> RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
> RBP: ffffc9000e9af590 R08: ffff8880224bd66b R09: 1ffff11004497acd
> R10: dffffc0000000000 R11: ffffed1004497ace R12: ffff888050544780
> R13: dffffc0000000000 R14: ffff88803e405010 R15: 0000000000000030
> FS:  0000000000000000(0000) GS:ffff8880dc0a8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055a77139e428 CR3: 0000000033d4c000 CR4: 00000000000006f0
> ----------------
> Code disassembly (best guess):
>    0:	00 00                	add    %al,(%rax)
>    2:	4d 03 3c 24          	add    (%r12),%r15
>    6:	4c 89 f8             	mov    %r15,%rax
>    9:	48 c1 e8 03          	shr    $0x3,%rax
>    d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
>   12:	74 08                	je     0x1c
>   14:	4c 89 ff             	mov    %r15,%rdi
>   17:	e8 19 09 07 fe       	call   0xfe070935
>   1c:	4d 8b 3f             	mov    (%r15),%r15
>   1f:	49 83 c7 30          	add    $0x30,%r15
>   23:	4c 89 f8             	mov    %r15,%rax
>   26:	48 c1 e8 03          	shr    $0x3,%rax
> * 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
>   2f:	74 08                	je     0x39
>   31:	4c 89 ff             	mov    %r15,%rdi
>   34:	e8 fc 08 07 fe       	call   0xfe070935
>   39:	4d 3b 37             	cmp    (%r15),%r14
>   3c:	74 14                	je     0x52
>   3e:	e8                   	.byte 0xe8
>   3f:	b2                   	.byte 0xb2
> 
> <<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
