Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B91BBD614
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 10:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h2/aeDrOxaA2SfUZcJO9w+6csGJar6DqZsd4xCv4QXs=; b=iPfY1vxJNoAMn1SLXASl/vi/gT
	xBlFYAxVh//TbU5Gy9M97nrGi17j0yu/yI8IwIR2TpDA4GanWcPR95rDXOwdTauimfk2MhvKZXeuQ
	UPds/ornoLEyuywcsFJ4DacywDMvIgPor+JtwEFMwfnRa7ke7G7u5vmxZKVHe843E7YI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5grl-0000Fr-Qm;
	Mon, 06 Oct 2025 08:46:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <36IHjaAwKAMcw2475nx195xvt11tyr.p1z@flex--jprusakowski.bounces.google.com>)
 id 1v5grk-0000Fg-RY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 08:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJXxaJbkSA/3Xb5uNqWTj3oIOQXZmPEn5IRJe3cfIGg=; b=gX1tYhfacGqXyJ+Sw3/b/fekZn
 fHyHeZ5Scjc/AbPtCT773STzkcE+gXpIYf1XYTUm/QmX7m0g1cK3mZHuYT3nhJpnH0Wj/Qjaq1lS+
 dqM3DUe0uSAF/7iS2XwI5p6jm9a4YROiftSj57YnnaT28C87TKc/I2WXxMCzbhDm7Gxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CJXxaJbkSA/3Xb5uNqWTj3oIOQXZmPEn5IRJe3cfIGg=; b=O
 HNwEVP8sYrja5sijLfbEJ5OKwWfqkqmEGt8J+16p/t4B1xXe7ZHgJg9dRicKbSD40CuZ7iTee5q8i
 yx779ba+oJrpG8IEtwsF2h9tHOb9ojejnL4qDvrYSr6Al0VgcOy2ZUOMW25bOfMGNurT/qtpu9sLA
 K0AQnjJuEBwPbs3o=;
Received: from mail-ej1-f73.google.com ([209.85.218.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v5grk-0007Y3-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 08:46:45 +0000
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-afcb7338319so508455466b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Oct 2025 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759740393; x=1760345193;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CJXxaJbkSA/3Xb5uNqWTj3oIOQXZmPEn5IRJe3cfIGg=;
 b=28eNF4AChgXob/XCtOwUVt8/8n/KiwI0wCHoUPy0HARTydeUwq6OMJDCviVsv3I6JQ
 q/lcbA2PYzXDUouisviD0IuZLn5xLMcw1IL8BP3+x0nOnHyG1REkeFw2o8h7N5AP0E8g
 Fc6eT6gjwhZwL5V9YKMbA3s0F7XRdupDLhCYFl/aHVj9tVw5kPX/ns9KdbiJuvnQaDM9
 AbcRg0CuGKztz+OrBd1mgYEnG2rnGlnxzIAb6FBp//pVuRZa5JsibCBdYlliHNXm/Y8T
 /DyKSRr5D6tFWuvYN4ocnyCvXM84geHKR6tQCYOSKTKwbNA1mfPdgK6qpn9l10JVJyO8
 /CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759740393; x=1760345193;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CJXxaJbkSA/3Xb5uNqWTj3oIOQXZmPEn5IRJe3cfIGg=;
 b=gG2nxDmcMSMsUt149awnKX7e8iphgou3COu1YmSFDaJXLwY0TrYmSdoV2lqcvWAXL8
 Z2XEG4PyLIpo22BnIbJo9SvV1lXKYJ8/HtSJe+lJUImgM2RWCocPzJqmPaQOQ2E/qs2T
 4itDshdr2ijsQtwn7PhsLJf+owJf4kPaIKDbvmBceP+qmZ795lNZPwCSxViKFKhoV68y
 5tZZO9CD0YDUkvgCwDGYOYHc0229LRGJLC4/E7ljluDghdfXFQcP5wawmc1BB6WCvAXi
 lytaQSPvyWU+eJd+ML/URWRAMyfBvvjkZdupvFO4Ot8UddeX3gWUZlIl+Nbs4Eh5sMyy
 lf9A==
X-Gm-Message-State: AOJu0Yzgog67nDtwZVnbUyPotSI9nzU9xAvRzXFy/HZ4lR+Bw3aQw+eV
 X8VB/bHjPRxCICi9UAyJnCMkTQ7kLVmdsFlj1FzkuEsDIN1TCmcSMVvn0MDHFJ3HHBFPd2Xf+dh
 Qr2dexeMaryXpSPjB/mpFOPRLU17mJQ==
X-Google-Smtp-Source: AGHT+IG3L0nTzCEE3SV4kT0ZjhvKBhiX0rWparm4WD7kJhXXQ2yTr43Zwy/HZZQHhpAowp7zp90/DyaNjwbO2AKpPho=
X-Received: from ejdbw9.prod.google.com ([2002:a17:907:fd89:b0:b3f:de21:e9ef])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e93:b0:b45:c0cc:2fe9 with SMTP id
 a640c23a62f3a-b49c393a5eemr1610665866b.46.1759740392721; 
 Mon, 06 Oct 2025 01:46:32 -0700 (PDT)
Date: Mon,  6 Oct 2025 10:46:15 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006084615.2585252-1-jprusakowski@google.com>
To: jaegeuk@kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Xfstests generic/335, generic/336 sometimes crash with the
 following message: F2FS-fs (dm-0): detect filesystem reference count leak
 during umount, type: 9,
 count: 1 [ cut here ] kernel BUG at fs/f2fs/super.c:1939!
 Oops: invalid opcode: 0000 [#1] SMP NOP [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v5grk-0007Y3-B9
Subject: [f2fs-dev] [PATCH] f2fs: ensure node page reads complete before
 f2fs_put_super() finishes
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Xfstests generic/335, generic/336 sometimes crash with the following message:

F2FS-fs (dm-0): detect filesystem reference count leak during umount, type: 9, count: 1
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:1939!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 1 UID: 0 PID: 609351 Comm: umount Tainted: G        W           6.17.0-rc5-xfstests-g9dd1835ecda5 #1 PREEMPT(none)
Tainted: [W]=WARN
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:f2fs_put_super+0x3b3/0x3c0
Call Trace:
 <TASK>
 generic_shutdown_super+0x7e/0x190
 kill_block_super+0x1a/0x40
 kill_f2fs_super+0x9d/0x190
 deactivate_locked_super+0x30/0xb0
 cleanup_mnt+0xba/0x150
 task_work_run+0x5c/0xa0
 exit_to_user_mode_loop+0xb7/0xc0
 do_syscall_64+0x1ae/0x1c0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
 </TASK>
---[ end trace 0000000000000000 ]---

It appears that sometimes it is possible that f2fs_put_super() is called before
all node page reads are completed.
Adding a call to f2fs_wait_on_all_pages() for F2FS_RD_NODE fixes the problem.

Fixes: bf22c3cc8ce7 ("f2fs: fix the panic in do_checkpoint()")

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1e0678e37a30..5c94bc42b8a1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1976,6 +1976,7 @@ static void f2fs_put_super(struct super_block *sb)
 	f2fs_flush_merged_writes(sbi);
 
 	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
+	f2fs_wait_on_all_pages(sbi, F2FS_RD_NODE);
 
 	if (err || f2fs_cp_error(sbi)) {
 		truncate_inode_pages_final(NODE_MAPPING(sbi));
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
