Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GjzwNv/uPmqUNAkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 23:28:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8366D0410
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 23:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="je/WgQh4";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fAgbGsyL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="A i5YIOb";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="Xest/typ";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:MIME-Version:To:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vVrVqsZsfqfHHf/geqcawFOOymmPb6s/8fB2q8PiHGM=; b=je/WgQh4idUEiwhxEYrCGSHMmq
	8edSM3DN7I5YfU/uXZseLIbeg92lj1mCBd3Jem7r4dk6mzAcUc/EJM/7muTwjkG1sPEkOD5D2iZTo
	XnH7Qsrxgz5l7NsHTVh392CPkOI43CLbguKNLnRfgzruIT41u4SeetiuN0w23qEUtJgk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wdE64-0005OG-Bc;
	Fri, 26 Jun 2026 21:28:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sanan.hasanou@gmail.com>) id 1wdE62-0005OA-Vz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 21:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=From:MIME-Version:Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QgL504FovBntWDuvZXZlRMaKeEpOFyF0FTdvw+iqjas=; b=fAgbGsyLkmxX2kbt2ZzS4eKVqw
 FcDkURnB1yFVIRrl4MtAnFFiS3pybfqY7qobg2F57FXHi2zcgh+KG8JLObb138AaqrktVyzIuG+YL
 vDbrRZRQ8Cy7sgXN61bsk1S0DmxUvzmCdxaRbe1r7fycmQys9a6N6B2ZLHzPIgvnjyIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=From:MIME-Version:Content-Transfer-Encoding:Content-Type:Cc:To:Subject:
 Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QgL504FovBntWDuvZXZlRMaKeEpOFyF0FTdvw+iqjas=; b=A
 i5YIOblE7dAw1tpeLSHISWI/qN+85l1KKj86yBDXpc+tuUYDkxQiS0oTpmlveWNpEffJ98Tfgab0X
 paEO4H7Hbb7FbM7PaskqlWUtzNYgIYteQ4RTIFuHr8KQSAsHdoKlzcIuqTOwkdATPw/WKPeGkeqEv
 xPHP2uDo5W1rC5ow=;
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wdE5z-00043p-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 21:28:20 +0000
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5bd8c2cf5baso618e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jun 2026 14:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782509289; x=1783114089; darn=lists.sourceforge.net;
 h=from:mime-version:content-transfer-encoding:content-type:cc:to
 :subject:date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QgL504FovBntWDuvZXZlRMaKeEpOFyF0FTdvw+iqjas=;
 b=Xest/typbT2C/mTKz0+stSJhGJHLTHEFhw4kOCWTM0ZChUMglMLlovITmQ9URlAfMC
 kcvNt/z0VM4Ut5s28/9z9UE9B4PLqCxz+c8dNq/A1jlgxTfWkmXcd1brXI/xTpWOdVzH
 vKiN+Npsc+CbxGXM8KHYbfz64xt290A/jhMzwE9uGiJBpACO7XiqmS5zNVh1oB0kut5J
 dDgco1fdWBiu5hpZ6XhqmiiHvf4g8DQqNCLLjelQ5DjdyMdC8xDIX8D1LWbqfWsngzaH
 1R42oJTVVhK0mqGRxW3q14ZBrEqjqtHCUQxzj1zEbflcynkGsz+2bcSlmx9OutciHMw8
 DfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782509289; x=1783114089;
 h=from:mime-version:content-transfer-encoding:content-type:cc:to
 :subject:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QgL504FovBntWDuvZXZlRMaKeEpOFyF0FTdvw+iqjas=;
 b=Yq1YC/2TctzGj5k1JjCQ6kXmfC+Nio4P32N1dmrEwZBX3elD9S9k4p3d22HERHGjwM
 bTkx7a+bnxegRUChrisbABAutH/rTbTqdb5/ezex7u36Ie4NPpJXo2zg5mYlM9qeMCaO
 s6sxLUCYsk4jwoykT2fL4OU9QFNoqYFM0wLrGyagJv/jT3RQCht4nzMLgpsK+wGmpLuS
 eTWW2GKvkN/dMSNUWi7E/PJhSJhk4l4AFUJdadNp4mnmi4N2I4r0Tt6Xn74yhoo7p20H
 rlS/Je15/zo+9N4nPrI4FZi1/Q7qI1wfgRzOTHj49Im80b+FTHNR4oRbGx9z+iq6wmfp
 8VIQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYs8cg7TuSBS9V4W171tTF2fOPIcK5Z4soNcLp004RWsTbVyPGwvNHrpjg/AHhGw16NigT5jOH7jxrJsDFO1o/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwUPlMdFzvjRGGHA4H8OIlsztjrqmvPH9Oo3uzBzxMV/blMMoqu
 G9UX0YRfpAvuHCKGvL6dAU40aizfXSDLoO0zpO+IMwOR/+RZJy5R4Hb1fo5cn7yd
X-Gm-Gg: AfdE7ckPgp9YagdUtAkIjzf3r/ptXGtcYCxSBLlu1dSZkytHDwqd4oWrLiM43ARsK1m
 rSyAfsGB8yy87DQJiHRzic2Txd7X/9e2+C5FUIfnAgPW/uVDlYTsWqdN+0QScrjmWz5N/WHJX4h
 KsO5ns6Nayjd6T8zBLiynQerd0WVKae6vUxDWUiN/d1wu1Wj8MWB8mO/slb22Za2QVwyiEL86rF
 DmMCuGqx8ShdwUSm4S0nX0XkeSgN3erOSN2/F/cjGqkmfVEaIIt8VWxJq7Ep7EaKu+9Q28l3uq2
 wyAfvdpLLc1Um+bFPN3VTlhyusQ0tKjVPtF1RqiX0Ad1LxKGdsTGGkpmxkx1uUfMToaIB0BJLbh
 vSbWawAh3IvPDjSrhne5W9GB5RHsheKe6E4Plme+1/b9NE1ZMSe4hbJlDoBc7byblh/6tpHLjpS
 vyHqyJSs6/Eg21SjXn8nxGAUYvbyyi6sMEwx/GMW8qbquVlJSTqZ3ZzCl9PZpH083hWHGMxLua/
 SSOeeyneiBG
X-Received: by 2002:ac5:c92d:0:b0:5bd:4143:6a8a with SMTP id
 71dfb90a1353d-5bd69c2ca69mr1235294e0c.1.1782509288971; 
 Fri, 26 Jun 2026 14:28:08 -0700 (PDT)
Received: from [192.168.10.115] ([132.170.207.48])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5bd7908a922sm1841418e0c.10.2026.06.26.14.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 14:28:08 -0700 (PDT)
Message-ID: <6a3eeee8.516c2524.21c3a2.ac0d@mx.google.com>
Date: Fri, 26 Jun 2026 14:28:08 -0700 (PDT)
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
MIME-Version: 1.0
From: sanan.hasanou@gmail.com
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good day, dear maintainers, We found a bug using a modified
 version of syzkaller. Kernel Branch: 7.0-rc1 Kernel Config:
 <https://drive.google.com/open?id=1SkS9U2y8MGrnaXhjJJI5n5SymSSMyYnS>
 Unfortunately, we don't have any reproducer for this bug yet. Thank you! 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [sanan.hasanou(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.176 listed in wl.mailspike.net]
X-Headers-End: 1wdE5z-00043p-Fw
Subject: [f2fs-dev] general protection fault in f2fs_in_warm_node_list
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
Cc: syzkaller@googlegroups.com, contact@pgazz.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,m:contact@pgazz.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sananhasanou@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sananhasanou@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E8366D0410

Good day, dear maintainers,

We found a bug using a modified version of syzkaller.

Kernel Branch: 7.0-rc1
Kernel Config: <https://drive.google.com/open?id=1SkS9U2y8MGrnaXhjJJI5n5SymSSMyYnS>
Unfortunately, we don't have any reproducer for this bug yet.
Thank you!

Best regards,
Sanan Hasanov

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 0 UID: 0 PID: 3043 Comm: kworker/u8:10 Not tainted 7.0.0-rc1 #1 PREEMPT_{RT,(full)} 
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: bat_events batadv_tt_purge
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
RIP: 0010:f2fs_in_warm_node_list+0xc5/0x2a0 fs/f2fs/node.c:330
Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 19 09 07 fe 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 fc 08 07 fe 4d 3b 37 74 14 e8 b2
RSP: 0018:ffffc9000e9af568 EFLAGS: 00010216
RAX: 0000000000000006 RBX: ffffea0000ed41c0 RCX: ffff88802cf2b980
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: ffffc9000e9af590 R08: ffff8880224bd66b R09: 1ffff11004497acd
R10: dffffc0000000000 R11: ffffed1004497ace R12: ffff888050544780
R13: dffffc0000000000 R14: ffff88803e405010 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff8880dc0a8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a77139e428 CR3: 0000000033d4c000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 f2fs_write_end_io+0x785/0x1390 fs/f2fs/data.c:400
 bio_endio+0x936/0x980 block/bio.c:1792
 blk_update_request+0x5a5/0xe40 block/blk-mq.c:1016
 blk_mq_end_request+0x4a/0x80 block/blk-mq.c:1178
 blk_flush_complete_seq+0x667/0xd10 block/blk-flush.c:191
 flush_end_io+0xc67/0xf40 block/blk-flush.c:251
 __blk_mq_end_request+0x5bf/0x710 block/blk-mq.c:1168
 blk_mq_end_request+0x5e/0x80 block/blk-mq.c:1180
 lo_complete_rq+0xe3/0x260 drivers/block/loop.c:314
 blk_complete_reqs block/blk-mq.c:1253 [inline]
 blk_done_softirq+0x10e/0x160 block/blk-mq.c:1258
 handle_softirqs+0x1c7/0x690 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 __local_bh_enable_ip+0x16a/0x270 kernel/softirq.c:302
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 spin_unlock_bh include/linux/spinlock_rt.h:116 [inline]
 batadv_tt_global_purge net/batman-adv/translation-table.c:2250 [inline]
 batadv_tt_purge+0x45c/0x9e0 net/batman-adv/translation-table.c:3510
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xa5a/0x15e0 kernel/workqueue.c:3358
 worker_thread+0xab9/0xff0 kernel/workqueue.c:3439
 kthread+0x355/0x410 kernel/kthread.c:467
 ret_from_fork+0x49c/0xa10 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
RIP: 0010:f2fs_in_warm_node_list+0xc5/0x2a0 fs/f2fs/node.c:330
Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 19 09 07 fe 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 fc 08 07 fe 4d 3b 37 74 14 e8 b2
RSP: 0018:ffffc9000e9af568 EFLAGS: 00010216
RAX: 0000000000000006 RBX: ffffea0000ed41c0 RCX: ffff88802cf2b980
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: ffffc9000e9af590 R08: ffff8880224bd66b R09: 1ffff11004497acd
R10: dffffc0000000000 R11: ffffed1004497ace R12: ffff888050544780
R13: dffffc0000000000 R14: ffff88803e405010 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff8880dc0a8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a77139e428 CR3: 0000000033d4c000 CR4: 00000000000006f0
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	4d 03 3c 24          	add    (%r12),%r15
   6:	4c 89 f8             	mov    %r15,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
  12:	74 08                	je     0x1c
  14:	4c 89 ff             	mov    %r15,%rdi
  17:	e8 19 09 07 fe       	call   0xfe070935
  1c:	4d 8b 3f             	mov    (%r15),%r15
  1f:	49 83 c7 30          	add    $0x30,%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 fc 08 07 fe       	call   0xfe070935
  39:	4d 3b 37             	cmp    (%r15),%r14
  3c:	74 14                	je     0x52
  3e:	e8                   	.byte 0xe8
  3f:	b2                   	.byte 0xb2

<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
