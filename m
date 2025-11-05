Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E58C34187
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 07:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gz3BNGJHTh18QDYtKskGON+EruYQWTL7AoYcpMg8kqs=; b=Yvbhe5tZOcS7guJ7p2//OSZKIQ
	839XnkFpBeEphSeUuwmA6OWnkRGinqxVEULaS15tn0IzV1q/SDnBBDiWHmkETJyPZP7nkQDkEWyFf
	frd1kDjAq9rNKngMk5sljfex0TtYZ13IPCZYhtbqx0q/7Al4n3W43H/iyBN9Kzbx37qA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGXLw-0004BJ-NF;
	Wed, 05 Nov 2025 06:50:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGXLt-0004Ay-Bq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 06:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7U0CdMiMiWJ70WeWQ9C5rQ75PnEuHv6eYjIDKbRoCwk=; b=NMk0ay7LUXkoNt4f+ymlcjv6u2
 oTlz6fcnHtDDe/zTMr/uVnfLx9o8ogUqSNM6Xn2cxXmS3Mm6YgozA9yORWSf5/SiDdRh8jmmIaRn+
 IskWHHUdRedwYvnaTOveD2LbDreZ5DCpXKC9cQtp4VYzsLq4ud+k4EqGsral73ksmvPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7U0CdMiMiWJ70WeWQ9C5rQ75PnEuHv6eYjIDKbRoCwk=; b=H
 f6YHD4PS3dTeNPO6JsDH1DtzPT6ZWFuFmBJ9Z9QLreoV5vJWEfIk4JpaqCocc7VwUqtAfZ06W02om
 lx1w7omUdjxf5xzdrEp6S5kL/qjF6rX2liYKsMtvDGMLTrAPmEKJ65kMNsyvBz6i6joihp4Z6FZUo
 18hKDFPCCHvSNHI0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGXLt-0006iV-GI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 06:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 25DC04403D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Nov 2025 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE19AC4CEF8;
 Wed,  5 Nov 2025 06:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762325431;
 bh=zOjevuavXoiG4HR4C5SvsaUWivLa1l0J3fg1J1tkK/4=;
 h=From:To:Cc:Subject:Date:From;
 b=l3pq6pt0PJQKQ1XCwIuT/KM+fNfSLMffuloGLCeMGfuv6EVrvi5N1USxKtD9lFygt
 vAkcst1waQteooWo1/S4N+zLwLwOMHDvo1bvo0AGWLNpQkxHNE2BXELZpQv0FL+sHz
 0ZEYTBV7WZHSLCn5xRywb2I30VRtIUexNxNP0kOkeyBXz627SregOCwhIZ89HylHYx
 y6cYn1kvA09Ey0/3vaXIIPhlrZZITtsjv8azvO8Fd5wEaQygRne27Mb00GXCIR+S6G
 oLLYo8tU7KlPPsj1uSz8OGI1g0ox7M5jTTrZ7VFoyGz0sG0unnHQY6zjS2aLx8YRqt
 w785PaPYIQeBw==
To: jaegeuk@kernel.org
Date: Wed,  5 Nov 2025 14:50:22 +0800
Message-ID: <20251105065023.3656975-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.1006.ga50a493c49-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With below scripts, it will trigger panic in f2fs: mkfs.f2fs
 -f /dev/vdd mount /dev/vdd /mnt/f2fs touch /mnt/f2fs/foo sync echo 111 >>
 /mnt/f2fs/foo f2fs_io fsync /mnt/f2fs/foo f2fs_io shutdown 2 /mnt/f2fs umount
 /mnt/f2fs mount -o ro,norecovery /dev/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGXLt-0006iV-GI
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix return value of
 f2fs_recover_fsync_data()
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With below scripts, it will trigger panic in f2fs:

mkfs.f2fs -f /dev/vdd
mount /dev/vdd /mnt/f2fs
touch /mnt/f2fs/foo
sync
echo 111 >> /mnt/f2fs/foo
f2fs_io fsync /mnt/f2fs/foo
f2fs_io shutdown 2 /mnt/f2fs
umount /mnt/f2fs
mount -o ro,norecovery /dev/vdd /mnt/f2fs
or
mount -o ro,disable_roll_forward /dev/vdd /mnt/f2fs

F2FS-fs (vdd): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
F2FS-fs (vdd): Mounted with checkpoint version = 7f5c361f
F2FS-fs (vdd): Stopped filesystem due to reason: 0
F2FS-fs (vdd): f2fs_recover_fsync_data: recovery fsync data, check_only: 1
Filesystem f2fs get_tree() didn't set fc->root, returned 1
------------[ cut here ]------------
kernel BUG at fs/super.c:1761!
Oops: invalid opcode: 0000 [#1] SMP PTI
CPU: 3 UID: 0 PID: 722 Comm: mount Not tainted 6.18.0-rc2+ #721 PREEMPT(voluntary)
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:vfs_get_tree.cold+0x18/0x1a
Call Trace:
 <TASK>
 fc_mount+0x13/0xa0
 path_mount+0x34e/0xc50
 __x64_sys_mount+0x121/0x150
 do_syscall_64+0x84/0x800
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7fa6cc126cfe

The root cause is we missed to handle error number returned from
f2fs_recover_fsync_data() when mounting image w/ ro,norecovery or
ro,disable_roll_forward mount option, result in returning a positive
error number to vfs_get_tree(), fix it.

Cc: stable@kernel.org
Fixes: 6781eabba1bd ("f2fs: give -EINVAL for norecovery and rw mount")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0b0ef8ba243b..8cf98c40b160 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5211,11 +5211,15 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	} else {
 		err = f2fs_recover_fsync_data(sbi, true);
-
-		if (!f2fs_readonly(sb) && err > 0) {
-			err = -EINVAL;
-			f2fs_err(sbi, "Need to recover fsync data");
-			goto free_meta;
+		if (err > 0) {
+			if (!f2fs_readonly(sb)) {
+				f2fs_err(sbi, "Need to recover fsync data");
+				err = -EINVAL;
+				goto free_meta;
+			} else {
+				f2fs_info(sbi, "drop all fsynced data");
+				err = 0;
+			}
 		}
 	}
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
