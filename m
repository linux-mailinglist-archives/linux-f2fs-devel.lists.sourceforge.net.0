Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84011709036
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 09:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzuJ4-0005AL-Ak;
	Fri, 19 May 2023 07:13:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <butterflyhuangxx@gmail.com>) id 1pzuJ2-0005AF-RL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 07:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=egSzj1GevLMUbPHUEJPsVJawKF57WYXztEr3RntCX4U=; b=AHpQt7zeJvl7CIUt9iaCCBZwmV
 5FvsYCwtAaSoKa55pwqChLbVDnnc/RCpFVOMzrOPzDoN1jaWf3omzuD46wihoe2XCBH51ybAKKgqN
 vyzVvbVCgfqnB64mNwCLHNAnNSldjo80H6xZ7IK4C02macJ6ciuVcRAZ78jDtkSG0KDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=egSzj1GevLMUbPHUEJPsVJawKF57WYXztEr3RntCX4U=; b=L
 uwIkQmy/dTGu06jyel4QiLu0BiXk30T2DiJOtNfcRJda4KDAicxh2h35N+mCDBJgT+n83qrr2NdfV
 qjGYBdIZqlAsPU8lP/I9HKCFj2pGU+JzsYfyoER/cwWtar8HP5riNx441Ign1YCM0Agw9U7N/qydr
 T41kw9bLjvJouIO0=;
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzuJ2-00D5fk-Q9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 07:13:41 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6ab2d14e999so2056479a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 May 2023 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684480415; x=1687072415;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=egSzj1GevLMUbPHUEJPsVJawKF57WYXztEr3RntCX4U=;
 b=bi+CyzjOeaeMIaBjkopMtvhqJHFRAggtf57TONQVSG8LlJa/4/Ddk1dpVvG255WIZL
 HL5GWIfBf6HD3dXEmiWoD/K8dTlvO4WMdhovhe5HhZrI1z9N6DA12V1owZOruNFyqUEY
 yuo4GgSrNEy6/QQ/rBhpVlDWKlhY/Uuy4ewX02UoG/bdKJnjXh0Mk1mBBCjwux4z9x9x
 0Ssice4/rrIAXzeXsbSDMhza5bO4bpsQ5+mDwPeAwxyETVOYizPHeXq/D2qHgaA8xX98
 A06DDthsqwi6iLtIbjC6Idyq6WNINDJJJPlbiNTWcRo+4FS1+Jbcl6ZvSxMlxEbLHA+s
 ujxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684480415; x=1687072415;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=egSzj1GevLMUbPHUEJPsVJawKF57WYXztEr3RntCX4U=;
 b=k2zYg9QdX/n3Bh30Ss2+0FEyJTW234qQkQOEW+48dw9tB3E3QbctFddxl/6xjIGhpw
 YhNedeN4EYNqkKenyUNZLRUj3I6V1mZ4N9A+Ev1+QQmYX3LL6GHCCSncMc46TFVhr6uR
 /PZebZe2xg2ql4HbbBOW/Pe/NPcjCMdhKFpUlYLTmuOAewTNGDOAPui2pO0gqYs81cqt
 Ir+oyMiah83IS0AY0BjUx9/AADCNPJdFrNWW8FD26jLbOcZ72Cui5hfOrAq24DInKiJX
 /giWSQe8L/PgHV6DgfyV/HQKCqB5birkm+cKCNudKTR+uXkLibJDzJVFZfh1XwstkJyt
 FlYw==
X-Gm-Message-State: AC+VfDxU1pu4BEkqZEIepj0u+gKe5Ea8COKIHtgwcpXeCv5ez1N9Qfbs
 Md3i0qIkr8/iA15pgT5/tLBh+F3MkjO2j/LUUwo=
X-Google-Smtp-Source: ACHHUZ5UXpBqr+hcH7v5FWkYUdqANhvm/PpRdWEm8OFW/juz4P7B+HEjMpbK52AGsK22EWA0M9XI9ddYvIPnE+xQo34=
X-Received: by 2002:a05:6808:3c5:b0:38d:1597:71f1 with SMTP id
 o5-20020a05680803c500b0038d159771f1mr768246oie.31.1684480414968; Fri, 19 May
 2023 00:13:34 -0700 (PDT)
MIME-Version: 1.0
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Fri, 19 May 2023 15:13:23 +0800
Message-ID: <CAFcO6XMJC=u5aASRNCqfVi7tJwDJBYGCw5i13M-R8zXdB9-8Ew@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, chao@kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, there is a null-ptr-deref bug in f2fs_write_end_io in
 fs/f2fs/data.c, I reproduce it in the latest kernel too. #Quick description
 When a thread always calls F2FS_IOC_RESIZE_FS to resize fs, if resize fs
 is failed, f2fs kernel thread would invoke callback function to update f2fs
 io info, it would call f2fs_writ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [butterflyhuangxx[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pzuJ2-00D5fk-Q9
Subject: [f2fs-dev] A null-ptr-deref bug in f2fs_write_end_io
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, there is a null-ptr-deref  bug in f2fs_write_end_io in
fs/f2fs/data.c, I reproduce it in the latest kernel too.

#Quick description
When a thread always calls F2FS_IOC_RESIZE_FS to  resize fs, if resize
fs is failed, f2fs kernel thread would  invoke callback function to
update
f2fs io info, it would call  f2fs_write_end_io and may trigger
null-ptr-deref in NODE_MAPPING.
```
static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
{
return sbi->node_inode->i_mapping;
}
```
there is deref in sbi.

#crash log
----------------------------------------
general protection fault, probably for non-canonical address
0xdffffc0000000006: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 0 PID: 17 Comm: ksoftirqd/0 Not tainted 6.4.0-rc1 #18
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:1972 [inline]
RIP: 0010:f2fs_write_end_io+0x727/0x1050 fs/f2fs/data.c:370
Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f 85 b3 07 00 00 48 8b
44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89 f8 48 c1 e8 03 <80> 3c
18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 84 10 04 00 00 e8 10
RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
RAX: 0000000000000006 RBX: dffffc0000000000 RCX: 0000000000000100
RDX: ffff888013d18000 RSI: ffffffff83a93a4d RDI: 0000000000000030
RBP: ffffea00009e6900 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffea00009e6900
R13: 0000000000000000 R14: ffff88802a3cec48 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555faf194000 CR3: 00000000251bd000 CR4: 0000000000750ef0
PKRU: 55555554
Call Trace:
 <TASK>
 bio_endio+0x5af/0x6c0 block/bio.c:1608
 req_bio_endio block/blk-mq.c:761 [inline]
 blk_update_request+0x5cc/0x1690 block/blk-mq.c:906
 blk_mq_end_request+0x59/0x4c0 block/blk-mq.c:1023
 lo_complete_rq+0x1c6/0x280 drivers/block/loop.c:370
 blk_complete_reqs+0xad/0xe0 block/blk-mq.c:1101
 __do_softirq+0x1d4/0x8ef kernel/softirq.c:571
 run_ksoftirqd kernel/softirq.c:939 [inline]
 run_ksoftirqd+0x31/0x60 kernel/softirq.c:931
 smpboot_thread_fn+0x659/0x9e0 kernel/smpboot.c:164
 kthread+0x33e/0x440 kernel/kthread.c:379
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:1972 [inline]
RIP: 0010:f2fs_write_end_io+0x727/0x1050 fs/f2fs/data.c:370
Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f 85 b3 07 00 00 48 8b
44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89 f8 48 c1 e8 03 <80> 3c
18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 84 10 04 00 00 e8 10
RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
RAX: 0000000000000006 RBX: dffffc0000000000 RCX: 0000000000000100
RDX: ffff888013d18000 RSI: ffffffff83a93a4d RDI: 0000000000000030
RBP: ffffea00009e6900 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffea00009e6900
R13: 0000000000000000 R14: ffff88802a3cec48 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555faf194000 CR3: 00000000251bd000 CR4: 0000000000750ef0
PKRU: 55555554
-----------------------

# new crash log in latest kernel
---------------------
[  193.695164][ T8174] loop0: detected capacity change from 0 to 264192
[  193.696467][ T8174] F2FS-fs (loop0): Magic Mismatch,
valid(0xf2f52010) - read(0x0)
[  193.696875][ T8174] F2FS-fs (loop0): Can't find valid F2FS
filesystem in 2th superblock
[  193.698363][ T8174] F2FS-fs (loop0): invalid crc_offset: 0
[  193.700454][ T8174] F2FS-fs (loop0): Disable nat_bits due to
incorrect cp_ver (4542359912962316977, 0)
[  193.716594][ T8174] F2FS-fs (loop0): Try to recover 2th superblock, ret: 0
[  193.717102][ T8174] F2FS-fs (loop0): Mounted with checkpoint
version = 3e17dab1
[  193.743330][ T8174] F2FS-fs (loop0): For resize: curseg of type 0: 46 ==> 4
[  193.743904][ T8174] F2FS-fs (loop0): For resize: curseg of type 3: 52 ==> 6
[  193.745690][ T8174] F2FS-fs (loop0): For resize: curseg of type 4: 50 ==> 8
[  193.746108][ T8174] F2FS-fs (loop0): For resize: curseg of type 5: 48 ==> 10
[  193.751857][ T8174] F2FS-fs (loop0): resize_fs failed, should run
fsck to repair!
[  193.780283][    C0] general protection fault, probably for
non-canonical address 0xdffffc0000000006: 0000 [#1] PREEMPT SMP KASAN
[  193.781027][    C0] KASAN: null-ptr-deref in range
[0x0000000000000030-0x0000000000000037]
[  193.781572][    C0] CPU: 0 PID: 17 Comm: ksoftirqd/0 Not tainted
6.4.0-rc2-00163-g2d1bcbc6cd70-dirty #17
[  193.782201][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX,
1996), BIOS 1.15.0-1 04/01/2014
[  193.782727][    C0] RIP: 0010:f2fs_write_end_io+0x727/0x1050
[  193.783083][    C0] Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f
85 b3 07 00 00 48 8b 44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89
f8 48 c1 e8 03 <80> 3c 18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 0
[  193.784268][    C0] RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
[  193.784629][    C0] RAX: 0000000000000006 RBX: dffffc0000000000
RCX: 0000000000000100
[  193.785109][    C0] RDX: ffff888013d18000 RSI: ffffffff83a9588d
RDI: 0000000000000030
[  193.785576][    C0] RBP: ffffea000143e740 R08: 0000000000000001
R09: 0000000000000000
[  193.786051][    C0] R10: 0000000000000000 R11: 0000000000000000
R12: ffffea000143e740
[  193.786571][    C0] R13: 0000000000000000 R14: ffff888041423738
R15: 0000000000000000
[  193.787055][    C0] FS:  0000000000000000(0000)
GS:ffff88802ca00000(0000) knlGS:0000000000000000
[  193.787620][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  193.787997][    C0] CR2: 000056056fd87000 CR3: 000000001b546000
CR4: 00000000000006f0
[  193.788585][    C0] Call Trace:
[  193.788863][    C0]  <TASK>
[  193.789115][    C0]  ? bio_uninit+0x1b7/0x410
[  193.789509][    C0]  ? f2fs_write_end+0xa80/0xa80
[  193.790053][    C0]  bio_endio+0x5af/0x6c0
[  193.790522][    C0]  blk_update_request+0x5cc/0x1690
[  193.791171][    C0]  blk_mq_end_request+0x59/0x4c0
[  193.791695][    C0]  lo_complete_rq+0x1c6/0x280
[  193.792247][    C0]  blk_complete_reqs+0xad/0xe0
[  193.792759][    C0]  __do_softirq+0x1d4/0x8ef
[  193.793312][    C0]  ? __irq_exit_rcu+0x190/0x190
[  193.793805][    C0]  run_ksoftirqd+0x31/0x60
[  193.794183][    C0]  smpboot_thread_fn+0x659/0x9e0
[  193.794576][    C0]  ? sort_range+0x30/0x30
[  193.794900][    C0]  kthread+0x33e/0x440
[  193.795263][    C0]  ? kthread_complete_and_exit+0x40/0x40
[  193.795907][    C0]  ret_from_fork+0x1f/0x30
[  193.796324][    C0]  </TASK>
[  193.796689][    C0] Modules linked in:
[  193.797189][    C0] ---[ end trace 0000000000000000 ]---
[  193.797635][    C0] RIP: 0010:f2fs_write_end_io+0x727/0x1050
[  193.798182][    C0] Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f
85 b3 07 00 00 48 8b 44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89
f8 48 c1 e8 03 <80> 3c 18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 0
[  193.799559][    C0] RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
[  193.799945][    C0] RAX: 0000000000000006 RBX: dffffc0000000000
RCX: 0000000000000100
[  193.800329][    C0] RDX: ffff888013d18000 RSI: ffffffff83a9588d
RDI: 0000000000000030
[  193.800666][    C0] RBP: ffffea000143e740 R08: 0000000000000001
R09: 0000000000000000
[  193.801047][    C0] R10: 0000000000000000 R11: 0000000000000000
R12: ffffea000143e740
[  193.801503][    C0] R13: 0000000000000000 R14: ffff888041423738
R15: 0000000000000000
[  193.802069][    C0] FS:  0000000000000000(0000)
GS:ffff88802ca00000(0000) knlGS:0000000000000000
[  193.802804][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  193.803356][    C0] CR2: 000056056fd87000 CR3: 000000001b546000
CR4: 00000000000006f0
[  193.804046][    C0] Kernel panic - not syncing: Fatal exception in interrupt
[  193.804748][    C0] Kernel Offset: disabled
[  193.805086][    C0] Rebooting in 86400 seconds..
----------------------------

If needed, I would provide reproduce.

Regards,
 butt3rflyh4ck.



-- 
Active Defense Lab of Venustech


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
