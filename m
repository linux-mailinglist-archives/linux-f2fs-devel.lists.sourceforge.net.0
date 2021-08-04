Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637A3DF8FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Aug 2021 02:39:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mB4vy-0007Bg-Fd; Wed, 04 Aug 2021 00:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mB4vx-0007Ba-EJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 00:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ohxuz3ht2QeqNW98qI23kJQAvkSS4JCYrovzopJPTfA=; b=BJ0JOFGUBmN9DBhfyuv+GeNKdB
 VcJOXKfGnDKF/LeaDE5D3yjcqJn/4pgXy/zhaXluLLLFVmnP8889qUNSWxeFIVxGwbT4KwbZO1eGJ
 klPWZkIZdNnZSrFkAZcir9niXA2DsmKlEfuGMIe2J7azqByJx+3WuJAUYCQJ1zJ+n/Lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ohxuz3ht2QeqNW98qI23kJQAvkSS4JCYrovzopJPTfA=; b=D
 yfGjaRZLo7zslFVsoWc84EZ97eF8DaUPb+hkl2mwPdiIUPh5fuMZxWpqYWX6SRsOBCc2A90RqXPuB
 LCtsn4+bysdhPI5aqvJVLwVCB/LIr7+TvxY+L7bdNTgpzvYsmPyt2BgG8ieEHG7yoJF+zbvCZiauQ
 G91H5+8VAh4lGpcA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mB4vv-00Ba7F-La
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 00:38:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9517A60187;
 Wed,  4 Aug 2021 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628037524;
 bh=xSY+GAshPQV+RFL1RiNbZo4ejBBkBBXoMgB7zAVULyc=;
 h=From:To:Cc:Subject:Date:From;
 b=bSYbK53RP6MDVI88LeTswj+AChEFQ3hZoa7VbDajkYKxYmgiouPA2s9fNgErdRRvM
 pQFx2UtdQ5HEeLKkOccPXEO1PlnQ4SwVFiM8UNdWGchq8pQuSDQYvizfQyLJtfvqJP
 AD06vzDn2kZwopx2q6lOcEVs/okS3qy1ZWKEE79e0tfJs9mILgHPOCLhbHvbCfwWAL
 3OR4zEl/NOwBPkmkPmetq8tbnvKqS/XVCKg7nGeWhihC99Ia4RK9fevG8LMAan4Kqx
 q+vY01aBXGWNnCDnlbACeGcaccS9bQhNalKfsdmw1hO6Lb5k59609ON7yQ8iDmbrAu
 iT1FtUYKYJUSg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  4 Aug 2021 08:38:38 +0800
Message-Id: <20210804003838.1411425-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mB4vv-00Ba7F-La
Subject: [f2fs-dev] [PATCH v4] f2fs: fix to stop filesystem update once CP
 failed
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
Cc: Yangtao Li <frank.li@vivo.com>, Chao Yu <chao.yu@linux.dev>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During f2fs_write_checkpoint(), once we failed in
f2fs_flush_nat_entries() or do_checkpoint(), metadata of filesystem
such as prefree bitmap, nat/sit version bitmap won't be recovered,
it may cause f2fs image to be inconsistent, let's just set CP error
flag to avoid further updates until we figure out a scheme to rollback
all metadatas in such condition.

Reported-by: Yangtao Li <frank.li@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
- add congestion_wait() and f2fs_stop_checkpoint() in
f2fs_flush_device_cache
- use DEFAULT_RETRY_IO_COUNT
 fs/f2fs/checkpoint.c | 12 +++++++++---
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/segment.c    | 15 +++++++++++++--
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6c208108d69c..7f6745f4630e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1639,8 +1639,11 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* write cached NAT/SIT entries to NAT/SIT area */
 	err = f2fs_flush_nat_entries(sbi, cpc);
-	if (err)
+	if (err) {
+		f2fs_err(sbi, "f2fs_flush_nat_entries failed err:%d, stop checkpoint", err);
+		f2fs_bug_on(sbi, !f2fs_cp_error(sbi));
 		goto stop;
+	}
 
 	f2fs_flush_sit_entries(sbi, cpc);
 
@@ -1648,10 +1651,13 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_save_inmem_curseg(sbi);
 
 	err = do_checkpoint(sbi, cpc);
-	if (err)
+	if (err) {
+		f2fs_err(sbi, "do_checkpoint failed err:%d, stop checkpoint", err);
+		f2fs_bug_on(sbi, !f2fs_cp_error(sbi));
 		f2fs_release_discard_addrs(sbi);
-	else
+	} else {
 		f2fs_clear_prefree_segments(sbi, cpc);
+	}
 
 	f2fs_restore_inmem_curseg(sbi);
 stop:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c44fdad8495e..299ed8cb1bd3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -547,7 +547,7 @@ enum {
 					 */
 };
 
-#define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO count */
+#define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
 
 /* congestion wait timeout value, default: 20ms */
 #define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 80f26158e304..ca9876a6d396 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -776,11 +776,22 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 		return 0;
 
 	for (i = 1; i < sbi->s_ndevs; i++) {
+		int count = DEFAULT_RETRY_IO_COUNT;
+
 		if (!f2fs_test_bit(i, (char *)&sbi->dirty_device))
 			continue;
-		ret = __submit_flush_wait(sbi, FDEV(i).bdev);
-		if (ret)
+
+		do {
+			ret = __submit_flush_wait(sbi, FDEV(i).bdev);
+			if (ret)
+				congestion_wait(BLK_RW_ASYNC,
+						DEFAULT_IO_TIMEOUT);
+		} while (ret && --count);
+
+		if (ret) {
+			f2fs_stop_checkpoint(sbi, false);
 			break;
+		}
 
 		spin_lock(&sbi->dev_lock);
 		f2fs_clear_bit(i, (char *)&sbi->dirty_device);
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
