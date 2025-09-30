Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1EBAB06F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 04:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUZfNkQEu97UnPZfoLyB3RJuDRtqgbJOwKRv658s+lY=; b=ZF00WBNIwJT6pECvUY+IK4AP48
	DyjQqTQWdMDF8gMNKo+4pYauhsGBMJnibr7XRsQBW2gHxZjtXTBxN1bFLKucl7IB3IQOKrPEIeb7y
	6WrMxo3N293DnDTgbgJ9kx7zkJ2TN3WJdl4HTcy/g0iTn3EJ6mXBoGEmm3XPojBJ6KeA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3QF2-0005JO-RL;
	Tue, 30 Sep 2025 02:37:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v3QEz-0005JG-N3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VJIRto2wfEplTCqpvHZh+vd/5+qoX8bnz6uer0PAGx4=; b=kkSpZwphpR3p7KEh/HyaoPo1Yd
 9Jzg0QQCqHVvLvmurkN+N+pmL8xeYXurFfnVP1JBTLnjz4EL49dmxBCqFtv2lrdnCvR9cMBhjffyn
 t1uaddRFwgPcOlxdyW1kAgrlKMIp0M0Wy0Qei7VTjB9S+KUoFgK0FGimSyF3XdTSXZLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VJIRto2wfEplTCqpvHZh+vd/5+qoX8bnz6uer0PAGx4=; b=GPxfL8N6MP4ElAz8p6Dgk8PTbR
 FAPXp9n5uGTIDJwA0DNy+pTREAy1SyXkIVf26b4S1t6oRjpzF6TCQIUR41gz8zCp74YKVMUQmuA98
 Zq65N4CQZNS26B6Cv0/xQia74psuoG71aVAtbDrC609+j6N/uAJ38r1VFU9pDHIkye/s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3QEz-0004Sy-8o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E91D645B3D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 02:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7634C116C6;
 Tue, 30 Sep 2025 02:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759199830;
 bh=B8+dSZWGnM31jtS6BLhtWnr7abeLIk24WnGIpnF9JCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8SUE22fLpZVahbvQZoneOgnqoPkJyhqT7PUGfegbZ9pgxepWLRTPWTEsNLhWJ7xr
 DipZFhD/bJxhX6hp2beVLAWoRp9yMATACVpHgQELfRhwfnQrwjX6C4k0/nwemy5Glv
 dpkZSOQEQBytElCjncT99W+WMqfaHpJHzc5NP3N291iGt4SFX28mEsWrkrjdyRxQYK
 lPiemOKpunn0WUCHICfmQGSokO4PVtzHIXVSrgdIMC49h66yU7QaPKKnSA2JIXdOOt
 lH347+x431c8FhR55onp/1ipqOO6jt5/dD04/l4gAtxHh1aWj8jj58xbGlJb44L3OB
 3dpY8hdveI7pQ==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Sep 2025 02:37:01 +0000
Message-ID: <20250930023704.3019074-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
In-Reply-To: <20250930023704.3019074-1-jaegeuk@kernel.org>
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If we give a negative offset,
 let's do random writes. > f2fs_io
 write 1 -400 10 rand atomic_commit ./test conducts 10 random writes by picking
 addresses between 0 and 400 * 4KB. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3QEz-0004Sy-8o
Subject: [f2fs-dev] [PATCH 2/5] f2fs_io: measure atomic operation latency
 with random write
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If we give a negative offset, let's do random writes.

> f2fs_io write 1 -400 10 rand atomic_commit ./test

conducts 10 random writes by picking addresses between 0 and
400 * 4KB.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 1f6bfcfff556..b9bf9bc5f797 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -710,7 +710,8 @@ static void do_write_with_advice(int argc, char **argv,
 			const struct cmd_desc *cmd, bool with_advice)
 {
 	u64 buf_size = 0, inc_num = 0, written = 0;
-	u64 offset;
+	u64 offset, offset_byte;
+	bool random_offset = false;
 	char *buf = NULL;
 	unsigned bs, count, i;
 	int flags = 0;
@@ -727,7 +728,11 @@ static void do_write_with_advice(int argc, char **argv,
 
 	buf_size = bs * F2FS_DEFAULT_BLKSIZE;
 
-	offset = atoi(argv[2]) * buf_size;
+	offset = atoi(argv[2]);
+	if (atoi(argv[2]) < 0) {
+		random_offset = true;
+		offset = -offset;
+	}
 
 	buf = aligned_xalloc(F2FS_DEFAULT_BLKSIZE, buf_size);
 	count = atoi(argv[3]);
@@ -812,10 +817,14 @@ static void do_write_with_advice(int argc, char **argv,
 		else if (!strcmp(argv[4], "rand"))
 			*(int *)buf = rand();
 
+		offset_byte = (random_offset ? rand() % offset :
+				offset + i) * buf_size;
+
 		/* write data */
 		max_time_t = get_current_us();
-		ret = pwrite(fd, buf, buf_size, offset + buf_size * i);
+		ret = pwrite(fd, buf, buf_size, offset_byte);
 		max_time_t = get_current_us() - max_time_t;
+
 		if (max_time < max_time_t)
 			max_time = max_time_t;
 		if (ret != buf_size)
@@ -844,7 +853,7 @@ static void do_write_with_advice(int argc, char **argv,
 		}
 	}
 
-	printf("Written %"PRIu64" bytes with pattern=%s, total_time=%"PRIu64" us, max_latency=%"PRIu64" us\n",
+	printf("Written %"PRIu64" bytes with pattern = %s, total_time = %"PRIu64" us, max_latency = %"PRIu64" us\n",
 				written, argv[4],
 				get_current_us() - total_time,
 				max_time);
@@ -855,6 +864,8 @@ static void do_write_with_advice(int argc, char **argv,
 #define write_help					\
 "f2fs_io write [chunk_size in 4kb] [offset in chunk_size] [count] [pattern] [IO] [file_path] {delay}\n\n"	\
 "Write given patten data in file_path\n"		\
+"Offset can be a negative number which\n"		\
+"  indicates random write range for atomic operations.\n" \
 "pattern can be\n"					\
 "  zero          : zeros\n"				\
 "  inc_num       : incrementing numbers\n"		\
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
