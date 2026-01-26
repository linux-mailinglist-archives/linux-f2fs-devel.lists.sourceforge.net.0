Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMEpB4cKd2lebAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 07:32:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C09848D9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 07:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tY7ypJe7dCa8V6nhHPoJg+Q4URIeP6ZFFHZN1E+krVw=; b=Nhb38xx1SJl7o389JDGFYe+JYs
	29xn/VsTbeArAHLl+ecL+r5lx8v16tiv0ABpZuALwNEYxRiOgaHDOiuTmeloi94BSUxNg4qvVYLTt
	oVOvg+sXKN4EgmEuYTKLSKdOm7S7/BCCQVlzg5ZQgPHQWwv9KFVCCGxc+cxxzT3QwfY4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkG9G-00040Z-3s;
	Mon, 26 Jan 2026 06:32:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vkG9D-00040T-RN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 06:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fly4TrYaSDxL/EQaxznh5MLYAjFvJy1GathhZl1MI+Q=; b=QaXVfoNaq+o3cZX7vL3SIbD854
 SF9mmR0mpq4K7M9Ml++rh/JkQDd8+IFcRbSRxxz+7hQ0X6sbmANyStLTg5yIlKcMl9Fnj5n7Vc4nT
 wsvjyCk0CbBmzIXIPv/zJY6WZ11W7TLsKDgGIuq5GRSpYo0OVoRwgqwgLN/0dMUSXmzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fly4TrYaSDxL/EQaxznh5MLYAjFvJy1GathhZl1MI+Q=; b=e
 UDkztbRfkQXTMXOm1IZPnYEFtPjzoiMabCOB2yDjfXHcfSyxPcuu+mHUEaVKEND2GCl6fW+vxaM5d
 vBy5MYatXrnxC7PEVnXs4Aq4HontcVfj1dDwlDWqm6TjgOBQQhQwRKTu91jN3Gy5sJBQJUpksMu9R
 u9OcOHkxFWoUdXVw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkG9D-0005XO-9m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 06:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DCC794418D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Jan 2026 06:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D271C19422;
 Mon, 26 Jan 2026 06:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769409136;
 bh=PXX7h2KzrCDJdUP4xzjsQwYMg3oUCSesD9/lxOwHPJg=;
 h=From:To:Cc:Subject:Date:From;
 b=GirhOv4hF6LMjEDW7FVzzHILSYZHBJfdZt1zwblgaK5emZIu0zYQs6oN0DchMmvEu
 UxEhpWgb7xu4U5erVFOt3t2L0baw3jW+fH/Dzn8seSLnos9ojap6miLSGqi+CJJkdw
 OtnzMBRoaVSw3gcvB2YnTBPEjgVdTBvq7TKQkunfrAt4x6DcG5r1cD48Hl6tPdZoid
 Aa/ysRUwfE9c96A/+yyqVtilMhEzgOe5JuEruVkmyonB8GCRzarMwWXc88k7f0jvXA
 q/EfqFSTciRhrQe4riw+btwx3IbRcJpWSrcGzLCl4vCCxi07I5JOm5ZRV0ik10pIQM
 k2UU2jBrGKRhQ==
To: jaegeuk@kernel.org
Date: Mon, 26 Jan 2026 06:32:03 +0000
Message-ID: <20260126063203.1508295-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to
 record any skipped write during data flush in f2fs_enable_checkpoint(). So
 in the loop of data flush, if there is any skipped write in previous flush,
 let's retry sync_inode_sb(), otherwise,
 all dirty data written before f2fs_enable_checkpoint()
 should have been persisted [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkG9D-0005XO-9m
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: check skipped write in
 f2fs_enable_checkpoint()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 42C09848D9
X-Rspamd-Action: no action

This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to record any
skipped write during data flush in f2fs_enable_checkpoint().

So in the loop of data flush, if there is any skipped write in previous
flush, let's retry sync_inode_sb(), otherwise, all dirty data written
before f2fs_enable_checkpoint() should have been persisted, then break
the retry loop.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- fix to adjust s_flag[MAX_SBI_FLAG] to avoid compile warning
 fs/f2fs/data.c  | 19 +++++++++++++++++++
 fs/f2fs/debug.c |  1 +
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c | 37 +++++++++++++++++++++++++++++++++----
 4 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d509172b51df..25b4d3f21fa7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3495,6 +3495,16 @@ static inline void account_writeback(struct inode *inode, bool inc)
 	f2fs_up_read(&F2FS_I(inode)->i_sem);
 }
 
+static inline void update_skipped_write(struct f2fs_sb_info *sbi,
+						struct writeback_control *wbc)
+{
+	long skipped = wbc->pages_skipped;
+
+	if (is_sbi_flag_set(sbi, SBI_ENABLE_CHECKPOINT) && skipped &&
+		wbc->sync_mode == WB_SYNC_ALL)
+		atomic_add(skipped, &sbi->nr_pages[F2FS_SKIPPED_WRITE]);
+}
+
 static int __f2fs_write_data_pages(struct address_space *mapping,
 						struct writeback_control *wbc,
 						enum iostat_type io_type)
@@ -3559,10 +3569,19 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	 */
 
 	f2fs_remove_dirty_inode(inode);
+
+	/*
+	 * f2fs_write_cache_pages() has retry logic for EAGAIN case which is
+	 * common when racing w/ checkpoint, so only update skipped write
+	 * when ret is non-zero.
+	 */
+	if (ret)
+		update_skipped_write(sbi, wbc);
 	return ret;
 
 skip_write:
 	wbc->pages_skipped += get_dirty_pages(inode);
+	update_skipped_write(sbi, wbc);
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
 	return 0;
 }
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 032683835569..8e1040e375a7 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -423,6 +423,7 @@ static const char *s_flag[MAX_SBI_FLAG] = {
 	[SBI_IS_RESIZEFS]	= "resizefs",
 	[SBI_IS_FREEZING]	= "freezefs",
 	[SBI_IS_WRITABLE]	= "writable",
+	[SBI_ENABLE_CHECKPOINT]	= "enable_checkpoint",
 };
 
 static const char *ipu_mode_names[F2FS_IPU_MAX] = {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 035239758e33..52cec6b3ecf0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1238,6 +1238,7 @@ enum count_type {
 	F2FS_RD_META,
 	F2FS_DIO_WRITE,
 	F2FS_DIO_READ,
+	F2FS_SKIPPED_WRITE,	/* skip or fail during f2fs_enable_checkpoint() */
 	NR_COUNT_TYPE,
 };
 
@@ -1476,6 +1477,7 @@ enum {
 	SBI_IS_RESIZEFS,			/* resizefs is in process */
 	SBI_IS_FREEZING,			/* freezefs is in process */
 	SBI_IS_WRITABLE,			/* remove ro mountoption transiently */
+	SBI_ENABLE_CHECKPOINT,			/* indicate it's during f2fs_enable_checkpoint() */
 	MAX_SBI_FLAG,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 97c2264ec7fe..0afe9f829058 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2690,6 +2690,7 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	long long start, writeback, end;
 	int ret;
 	struct f2fs_lock_context lc;
+	long long skipped_write, dirty_data;
 
 	f2fs_info(sbi, "f2fs_enable_checkpoint() starts, meta: %lld, node: %lld, data: %lld",
 					get_pages(sbi, F2FS_DIRTY_META),
@@ -2698,17 +2699,45 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 
 	start = ktime_get();
 
+	set_sbi_flag(sbi, SBI_ENABLE_CHECKPOINT);
+
 	/* we should flush all the data to keep data consistency */
 	do {
+		skipped_write = get_pages(sbi, F2FS_SKIPPED_WRITE);
+		dirty_data = get_pages(sbi, F2FS_DIRTY_DATA);
+
 		sync_inodes_sb(sbi->sb);
 		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
-	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
+
+		f2fs_info(sbi, "sync_inode_sb done, dirty_data: %lld, %lld, "
+				"skipped write: %lld, %lld, retry: %d",
+				get_pages(sbi, F2FS_DIRTY_DATA),
+				dirty_data,
+				get_pages(sbi, F2FS_SKIPPED_WRITE),
+				skipped_write, retry);
+
+		/*
+		 * sync_inodes_sb() has retry logic, so let's check dirty_data
+		 * in prior to skipped_write in case there is no dirty data.
+		 */
+		if (!get_pages(sbi, F2FS_DIRTY_DATA))
+			break;
+		if (get_pages(sbi, F2FS_SKIPPED_WRITE) == skipped_write)
+			break;
+	} while (retry--);
+
+	clear_sbi_flag(sbi, SBI_ENABLE_CHECKPOINT);
 
 	writeback = ktime_get();
 
-	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA)))
-		f2fs_warn(sbi, "checkpoint=enable has some unwritten data: %lld",
-					get_pages(sbi, F2FS_DIRTY_DATA));
+	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA) ||
+			get_pages(sbi, F2FS_SKIPPED_WRITE)))
+		f2fs_warn(sbi, "checkpoint=enable unwritten data: %lld, skipped data: %lld, retry: %d",
+				get_pages(sbi, F2FS_DIRTY_DATA),
+				get_pages(sbi, F2FS_SKIPPED_WRITE), retry);
+
+	if (get_pages(sbi, F2FS_SKIPPED_WRITE))
+		atomic_set(&sbi->nr_pages[F2FS_SKIPPED_WRITE], 0);
 
 	f2fs_down_write_trace(&sbi->gc_lock, &lc);
 	f2fs_dirty_to_prefree(sbi);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
