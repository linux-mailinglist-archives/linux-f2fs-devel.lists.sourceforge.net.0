Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA96CB82E92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 06:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UNQddgeDnFQC14n9pUNF/JWr/QgNN6COCqKL2Gw46wQ=; b=QKweqNxzUyHcbBF7mbI2m3Jhwf
	G8CeploG127j7G3NIl9hXByF3GAF7UajZ+ZWrvgUbb71vJ1s9FkciEw0OKa4kkdllZyeyhIUG0970
	M71JExO0yVBIPC7fK2RE7jpzFE5puy9rdP/e2VFXUDl0kCjOt1f5nhbCurItIMB5QY9s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz6eD-0007s0-99;
	Thu, 18 Sep 2025 04:53:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uz6eC-0007rs-17
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q3BfTYk3JXvPysMiDS6HovnaLjPvCLbZyZGbCmSbx4Y=; b=fxay+42GIYew07KbjXtL6jx1eq
 kPY9GPbV0hyFfk3G/TifqtTFW4gYzyqa+CGdwPl6Ys1urP2pCNHI4jx3C9uuxlQU+xLsUBsEktD/u
 +ZwxB99Mu/C3hb86nW1Xs0rrk7aZDEe0vCQHWnFmB9H6X6Sd1AedK19oYMDgkbG6eZUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q3BfTYk3JXvPysMiDS6HovnaLjPvCLbZyZGbCmSbx4Y=; b=H
 v25p/kYxEdLvSsP9uPiIpkq/GUpRR1qjVZZ0GTF6T3Zvq1zT0eqnOUPqGhOF5+n5DGrauptIgIQ7X
 jZuiWK0qoqVmgf5vl9DE5SD4NHwBqPM4QlqowCK+/Gwg6vznXM+GmcYvLbLuPg0h5rQcCqx1fXBO+
 8K76SgseloxahcBU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz6eB-0006b5-HQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B22F360010
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Sep 2025 04:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C14C4CEE7;
 Thu, 18 Sep 2025 04:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758171200;
 bh=tRLpitw2rzSDMqM68vwW2SIr/wuWxcShXyZ/M7e8+M8=;
 h=From:To:Cc:Subject:Date:From;
 b=p35lC72r7lrrdSPSwbt9pSubXhXnjJrME2089HCl8hzoZeUySLh9WEI7Kp5zzy7uL
 +IMsaj90373L+oKb3WX7SmE8MdhkVXmbBs6IKGpNc/kUWGBrfrYLah26q6WWuPwf+s
 mDSKQdBTiapBuugxf/0a+XtSOxCorVoTNDWuFo/KHU+d1TiUrc9/RFaGsUwXZLf2XA
 qfghXGTl4qBZgTPvMpjjGtjW+zF4iYN1vOrJlyroZPDujiyI/hZFP+UN708Ed43wMN
 AhMgQ9wuTsr8xOUBOxzHvJxeOF6pC0JjlwjJGVdhjhj/8VQg07HK2Le4sOaP9IolTj
 +e4PMilxMyxoQ==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 18 Sep 2025 04:53:14 +0000
Message-ID: <20250918045316.714102-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c
 | 32 ++++++++++++++++++++++++++------ 1 file changed, 26 insertions(+), 6
 deletions(-) diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
 index b9bf9bc5f797..2d64eda81706 100644 --- a/tools/f2fs_io/f2fs_io.c +++
 b/tools/f2fs_io/f2fs_io.c @@ -931,6 +931,7 @@ static void do_wr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz6eB-0006b5-HQ
Subject: [f2fs-dev] [PATCH 1/3] f2fs_io: add mlock to measure the read speed
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index b9bf9bc5f797..2d64eda81706 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -931,6 +931,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "  buffered : buffered IO\n"				\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
+"  mlock    : mmap + mlock\n"				\
 "advice can be\n"					\
 " 1 : set sequential|willneed\n"			\
 " 0 : none\n"						\
@@ -946,6 +947,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	u64 total_time = 0;
 	int flags = 0;
 	int do_mmap = 0;
+	int do_mlock = 0;
 	int fd, advice;
 
 	if (argc != 8) {
@@ -968,6 +970,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		flags |= O_DIRECT;
 	else if (!strcmp(argv[4], "mmap"))
 		do_mmap = 1;
+	else if (!strcmp(argv[4], "mlock"))
+		do_mlock = 1;
 	else if (strcmp(argv[4], "buffered"))
 		die("Wrong IO type");
 
@@ -993,11 +997,24 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	total_time = get_current_us();
 	if (do_mmap) {
 		data = mmap(NULL, count * buf_size, PROT_READ,
-						MAP_SHARED | MAP_POPULATE, fd, offset);
+				MAP_SHARED | MAP_POPULATE, fd, offset);
 		if (data == MAP_FAILED)
 			die("Mmap failed");
-	}
-	if (!do_mmap) {
+
+		read_cnt = count * buf_size;
+		memcpy(print_buf, data, print_bytes);
+	} else if (do_mlock) {
+		data = mmap(NULL, count * buf_size, PROT_READ,
+				MAP_SHARED, fd, offset);
+		if (data == MAP_FAILED)
+			die("Mmap failed");
+		if (posix_fadvise(fd, offset, count * buf_size,
+					POSIX_FADV_WILLNEED) != 0)
+			die_errno("fadvise failed");
+		if (mlock(data, count * buf_size))
+			die_errno("mlock failed");
+		read_cnt = count * buf_size;
+	} else {
 		for (i = 0; i < count; i++) {
 			ret = pread(fd, buf, buf_size, offset + buf_size * i);
 			if (ret != buf_size) {
@@ -1014,9 +1031,6 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 			if (i == 0)
 				memcpy(print_buf, buf, print_bytes);
 		}
-	} else {
-		read_cnt = count * buf_size;
-		memcpy(print_buf, data, print_bytes);
 	}
 	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s print %u bytes:\n",
 		read_cnt, get_current_us() - total_time,
@@ -1029,6 +1043,12 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		else if (i % 2 == 0)
 			printf(" ");
 	}
+	if (do_mmap) {
+		munmap(data, count * buf_size);
+	} else if (do_mlock) {
+		munlock(data, count * buf_size);
+		munmap(data, count * buf_size);
+	}
 	printf("\n");
 	exit(0);
 }
-- 
2.51.0.470.ga7dc726c21-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
