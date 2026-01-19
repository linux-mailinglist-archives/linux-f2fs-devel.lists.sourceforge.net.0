Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE3BD3ACAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 15:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T7NDOoUcepHwrhspvUBN8lehBZ79D3Hmky+v7TKAkIs=; b=BSYOSZ7xJxz6P28VafjuyXa+1A
	16j16fRAYciEyHHEY9UzJtPyahmfXIx8njMDN+DJjxHkn7TL++jNYY6iMg6YEKtPiNziz4bmiagSr
	09EjHg1sqaHnJUvZgF0kJAIBTXTWo1Qd6B5Z9NPsFUWayk/g44PR9YdR37PjWrpTmayk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhqWw-00045y-GT;
	Mon, 19 Jan 2026 14:46:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vhqWv-00045p-3A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 14:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iD+hcZdggzL25y3HrNPg7R0i0js2N6/jL4sywdHPXGE=; b=b/KYKrWzen2oG31pN9JP/SDyXA
 z1KnmnHtrTBW3tOxpQgNXiu0yXxgxP2//0TS+tJa/ncvvjCL3eDfLrxtBrRPRm2privDtzsiA/HRE
 vY+mEY4zA7avWHWeUjBlwIbgQObxwLdKe+67KEYvizZZRX8j2xVI86e2vv3od+gKie7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iD+hcZdggzL25y3HrNPg7R0i0js2N6/jL4sywdHPXGE=; b=e
 FFjU+nVXGDhbvky0UYXroc7rjZBB4Va9TrBVXEk1V70O0CLOdkuA9ZjIsL5kewaTf5v4Ww1MunwyL
 Jp1cjH5FR9NdYy2/jy5KmxWiEDxZAe6wpHOiF67h7jYF0CIJ0JJrmX0JSPckbejcCgBV7gmYBLKuN
 qqB+ZN+O9fijFq/0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhqWu-0000EM-Fz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 14:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BEA3860127
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 14:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ECAC116C6;
 Mon, 19 Jan 2026 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768834010;
 bh=ukHCNUzs9mUD12QXntDw9IBqfK1oJXVfvPn00ZnNKhs=;
 h=From:To:Cc:Subject:Date:From;
 b=pBhOLHsn1mw28omOgidlAevjbgs7mOmlvFsPOgJ622DsWY9UYruUaVMeF7iymbyME
 Dxd2iOfPajMfkzV92D5OlO01biVrnGaOXLyZJ03uMYwZ9fqmoybTI4F1azlouxgdoM
 Io8k66ZzzvHMaqDWdmHAE/pHBRy4ojLBKJ35y06Asla7MG0fyHvIpWRWXPGPnWPXbd
 9mquN2KLRilH5Rq61UhdaUt63GTBM8lJC8IlCRz1pXAS/V8shRgy1v4LRlyURbs2T1
 iksL1/W78RMgq+k0mr6xhGL8qiRGeH+wS0FX38sRM+I/MrhLg9fzfEnLdLo5LSRgYx
 B7hvKw6PkmBfw==
To: jaegeuk@kernel.org
Date: Mon, 19 Jan 2026 21:32:29 +0800
Message-Id: <20260119133230.16481-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhqWu-0000EM-Fz
Subject: [f2fs-dev] [PATCH 1/2] f2fs: check skipped write in
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

This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to record any
skipped write during data flush in f2fs_enable_checkpoint().

So in the loop of data flush, if there is any skipped write in previous
flush, let's retry sync_inode_sb(), otherwise, all dirty data written
before f2fs_enable_checkpoint() should have been persisted, then break
the retry loop.

Signed-off-by: Chao Yu <chao@kernel.org>
---
Changelog:
- code is based on 'Revert "f2fs: add timeout in f2fs_enable_checkpoint()"'
 fs/f2fs/data.c  | 12 ++++++++++++
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c | 37 +++++++++++++++++++++++++++++++++----
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5b4832956196..00108d5881aa 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3500,6 +3500,15 @@ static inline void account_writeback(struct inode *inode, bool inc)
 	f2fs_up_read(&F2FS_I(inode)->i_sem);
 }
 
+static inline void update_skipped_write(struct f2fs_sb_info *sbi,
+						struct writeback_control *wbc)
+{
+	long skipped = wbc->pages_skipped;
+
+	if (skipped && is_sbi_flag_set(sbi, SBI_ENABLE_CHECKPOINT))
+		atomic_add(skipped, &sbi->nr_pages[F2FS_SKIPPED_WRITE]);
+}
+
 static int __f2fs_write_data_pages(struct address_space *mapping,
 						struct writeback_control *wbc,
 						enum iostat_type io_type)
@@ -3564,10 +3573,13 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	 */
 
 	f2fs_remove_dirty_inode(inode);
+
+	update_skipped_write(sbi, wbc);
 	return ret;
 
 skip_write:
 	wbc->pages_skipped += get_dirty_pages(inode);
+	update_skipped_write(sbi, wbc);
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
 	return 0;
 }
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
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
