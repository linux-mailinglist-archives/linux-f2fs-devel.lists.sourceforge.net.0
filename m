Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC32CF0819
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lh602R2mLJ3UmFS6b/0lkdV1vqIZ2pp8dpVedr+EGJE=; b=fzGW9zMHvZF7v0ccTQjHJBUoLh
	TMkdXunjEeHknbe3tNfnUmHHgrPRwnVFMd8ODRvmlcrLqtpeDlgx+pyRpOXZkXTdAhkFQ71Ev5CMY
	erA9C6kB5gR8eebXtacxzzg8guc5zS3W8k6kMV7KQBiZv77IsSwVHZ9bZ0Yru4MyuXKI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXZ-0000Ig-GV;
	Sun, 04 Jan 2026 02:08:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXY-0000IX-D9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1+7+lDHzZXhxV3XZ6ZzJ6jCZ/EGtpo2RrgoZVMEPxc=; b=d8S87vjEqEHzTQOSFEIo0a5pNP
 4y3n2xsec4LsLHMjqVzzl1vxNILbiOvMLABn6l4Ro6kRxTbfSF7qgktdPuBHDYlVSLpuMuaVmRYs1
 Fhf8LJSGyBjCgN3uKda32Ve5AcwkO0+OB1qcg3Sngw6UkbFxJiVVnrua1oovNK/ZenVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l1+7+lDHzZXhxV3XZ6ZzJ6jCZ/EGtpo2RrgoZVMEPxc=; b=NoSO0qCi4LBRZUqcAUZAjB20cV
 tjl94m/wxdfWLWNd1deQasaPjrbevUNwu6KtVT9v/tTIOafi7tpS889BnHvg/fTb5OXrSJkQuYheV
 v5j7CZAUET9ibK3+3z10NzGzmk7RvtdSGnEpS3a+5Nf2ovzJjUbS2f7sB9YfYdHK8qlQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXX-0005ni-U3 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A47BE4435C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9B7C113D0;
 Sun,  4 Jan 2026 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492494;
 bh=8zLFMaibD9G+3ikVEMFJ0AfRrJDHoPsUZ+l/9DR/1eM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SktH6TN5mkTYmABbR3J5cNP6kEj7q04BkXPOww0uWwnQJMRjbePxu8O0oobEU8TvM
 vvGYHp0uU0BF8rbl59QKZ/dSMt+OW2Y4rBKpEe9zHPOF+0DCqLvwrvhuHJBqhM+6TB
 l4dAmLiLszq9Izm77lVOlaIL3cK4hRtLdWRtFQeQfqGnueJJP1vf0OPkuk+251g2IC
 mzNS88htkZkua9yqNuzaTjffSwW8TLzXnb3x+foUDE383f84OCfke+RMdlPDGVKo1M
 cy/Hu2QteoFNpt/Z9XoEtIWvw/ThCqefOrg6uuPdlIEwAnFHzeULHeTNxBFf99zlFH
 igfzQB0lXG2hg==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:23 +0800
Message-ID: <20260104020729.1064529-8-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use f2fs_{down, up}_{read, write}_trace for io_rwsem to trace
 lock elapsed time. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/data.c
 | 18 +++++++++++------- fs/f2fs/f2fs.h | 1 + include/trace/events/f2fs.h
 | 3 ++- 3 files changed, 14 insertions(+), 8 deletions(-) 
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
X-Headers-End: 1vcDXX-0005ni-U3
Subject: [f2fs-dev] [PATCH 08/14] f2fs: trace elapsed time for io_rwsem lock
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

Use f2fs_{down,up}_{read,write}_trace for io_rwsem to trace lock elapsed time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c              | 18 +++++++++++-------
 fs/f2fs/f2fs.h              |  1 +
 include/trace/events/f2fs.h |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 79455d7acba5..7dee58fbfc0b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -620,7 +620,8 @@ int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi)
 		for (j = HOT; j < n; j++) {
 			struct f2fs_bio_info *io = &sbi->write_io[i][j];
 
-			init_f2fs_rwsem(&io->io_rwsem);
+			init_f2fs_rwsem_trace(&io->io_rwsem, sbi,
+						LOCK_NAME_IO_RWSEM);
 			io->sbi = sbi;
 			io->bio = NULL;
 			io->last_block_in_bio = 0;
@@ -644,8 +645,9 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 {
 	enum page_type btype = PAGE_TYPE_OF_BIO(type);
 	struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
+	struct f2fs_lock_context lc;
 
-	f2fs_down_write(&io->io_rwsem);
+	f2fs_down_write_trace(&io->io_rwsem, &lc);
 
 	if (!io->bio)
 		goto unlock_out;
@@ -659,7 +661,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 	}
 	__submit_merged_bio(io);
 unlock_out:
-	f2fs_up_write(&io->io_rwsem);
+	f2fs_up_write_trace(&io->io_rwsem, &lc);
 }
 
 static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
@@ -674,10 +676,11 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 		if (!force)	{
 			enum page_type btype = PAGE_TYPE_OF_BIO(type);
 			struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
+			struct f2fs_lock_context lc;
 
-			f2fs_down_read(&io->io_rwsem);
+			f2fs_down_read_trace(&io->io_rwsem, &lc);
 			ret = __has_merged_page(io->bio, inode, folio, ino);
-			f2fs_up_read(&io->io_rwsem);
+			f2fs_up_read_trace(&io->io_rwsem, &lc);
 		}
 		if (ret) {
 			__f2fs_submit_merged_write(sbi, type, temp);
@@ -987,11 +990,12 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
 	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
 	struct folio *bio_folio;
+	struct f2fs_lock_context lc;
 	enum count_type type;
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
-	f2fs_down_write(&io->io_rwsem);
+	f2fs_down_write_trace(&io->io_rwsem, &lc);
 next:
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META && io->zone_pending_bio) {
@@ -1073,7 +1077,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
 				!f2fs_is_checkpoint_ready(sbi))
 		__submit_merged_bio(io);
-	f2fs_up_write(&io->io_rwsem);
+	f2fs_up_write_trace(&io->io_rwsem, &lc);
 }
 
 static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index baaae854c74f..59615f590d79 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -180,6 +180,7 @@ enum f2fs_lock_name {
 	LOCK_NAME_NODE_WRITE,
 	LOCK_NAME_GC_LOCK,
 	LOCK_NAME_CP_GLOBAL,
+	LOCK_NAME_IO_RWSEM,
 };
 
 /*
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 859de7c8d1c7..c3b6b509472f 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -190,7 +190,8 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 		{ LOCK_NAME_NODE_CHANGE,	"node_change" },	\
 		{ LOCK_NAME_NODE_WRITE,		"node_write" },		\
 		{ LOCK_NAME_GC_LOCK,		"gc_lock" },		\
-		{ LOCK_NAME_CP_GLOBAL,		"cp_global" })
+		{ LOCK_NAME_CP_GLOBAL,		"cp_global" },		\
+		{ LOCK_NAME_IO_RWSEM,		"io_rwsem" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
