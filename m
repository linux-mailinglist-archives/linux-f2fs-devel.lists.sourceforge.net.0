Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F664A5D8C8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 10:02:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsHyW-0001ZE-Py;
	Wed, 12 Mar 2025 09:02:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsHyD-0001Rx-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 09:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wgk3Wrr1XK1IULSGhVM4VAfbSkh1PjjJnbt4jeN1YGY=; b=WGFRNAhXatX0sFRr5VbMuAErrF
 claUeqaF8iDcbXMwCVap39idfEzJyvD5JEhW/DLoutAZFF7j69L0xJWDNrM7WHzq90cMqqVPS4DgS
 zO6SiuA4jwTw8XyexREAz7LEg890hATBfMA10LC9yWXZktoVFUHCtEKPhnoxZrLxAFEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Wgk3Wrr1XK1IULSGhVM4VAfbSkh1PjjJnbt4jeN1YGY=; b=g
 r+ci6qlayAW/iJuOiY/XxFo6mXLsuA8IDlyxxj3tNMUfq8a8NphIQ7ScKvsbtAxdykHzQKm3HW8Uo
 cXt1tRHpurmgJ0p5sUppR0mGGAlDuJUPxvJdMWUPmlMsVVPAUhR84fS68fBPmMd9S8Agw79PNu+AR
 hYIneVV64iRygspE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsHyD-0006Lp-4I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 09:01:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 78F39A46E0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Mar 2025 08:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5746C4CEE3;
 Wed, 12 Mar 2025 09:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741770094;
 bh=G93hOZvkeNxGPS2XIgjqVw8Ob92awPEw3CcYOqVE6c4=;
 h=From:To:Cc:Subject:Date:From;
 b=Dt+DtEI/BGMJ3YXHbQ2mwDitKcrND2sYa6535UOEieueRhYMkDGc7tDu6nYsv2XsB
 o5KHaXLSch+srvb3f3O9uB2L4lAhU9hept0pwg0HpLR7G6u5yI0SjqDCSx8YyJ8V8P
 ZdFvLP28XOTK3Bckmn80w6jycFp0ukM45wtWCJj7jCiMKIlE86BMGTAhCt9EMt44xK
 h4za0Ws4pSGZQxiBcBNGJkKXI2N4h9dAC5MoxRS4Q4t9AjA9Fn+Mfxv8J8FvDMLNkS
 c9JYAVL3Vos5JgZV+CuAKxnPNCwRisYuF7dfafGFVkEHP27IZko2uIXkwq6WsEDCpu
 eVVjCiJ+1F7Yw==
To: jaegeuk@kernel.org
Date: Wed, 12 Mar 2025 17:01:25 +0800
Message-ID: <20250312090125.4014447-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If checkpoint is disabled, GC can not reclaim any segments, 
 we need to detect such condition and bail out from fallocate() of a pinfile,
 rather than letting allocator running out of free segment, whic [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsHyD-0006Lp-4I
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid running out of free segments
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If checkpoint is disabled, GC can not reclaim any segments, we need
to detect such condition and bail out from fallocate() of a pinfile,
rather than letting allocator running out of free segment, which may
cause f2fs to be shutdown.

reproducer:
mkfs.f2fs -f /dev/vda 16777216
mount -o checkpoint=disable:10% /dev/vda /mnt/f2fs
for ((i=0;i<4096;i++)) do { dd if=/dev/zero of=/mnt/f2fs/$i bs=1M count=1; } done
sync
for ((i=0;i<4096;i+=2)) do { rm /mnt/f2fs/$i; } done
sync
touch /mnt/f2fs/pinfile
f2fs_io pinfile set /mnt/f2fs/pinfile
f2fs_io fallocate 0 0 4201644032 /mnt/f2fs/pinfile

cat /sys/kernel/debug/f2fs/status
output:
  - Free: 0 (0)

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2ddb93d1a10c..abbcbb5865a3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1838,6 +1838,18 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 next_alloc:
 		f2fs_down_write(&sbi->pin_sem);
 
+		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+			if (has_not_enough_free_secs(sbi, 0, 0)) {
+				f2fs_up_write(&sbi->pin_sem);
+				err = -ENOSPC;
+				f2fs_warn_ratelimited(sbi,
+					"ino:%lu, start:%lu, end:%lu, need to trigger GC to "
+					"reclaim enough free segment when checkpoint is enabled",
+					inode->i_ino, pg_start, pg_end);
+				goto out_err;
+			}
+		}
+
 		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
 			ZONED_PIN_SEC_REQUIRED_COUNT :
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
