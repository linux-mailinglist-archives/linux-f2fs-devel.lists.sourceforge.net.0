Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5ABAB069
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 04:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cy3eMGc7ntFPEu2NN/04XXDp5f4U+AW7iVSHfYkwPZs=; b=WaxMQBteReTDP4iEuyjGXsmqzG
	nW9FLKQ7feqaJvACdcCxwAD+3VNeh54zoKegq6nceWaXYSC+zZPDXK+kp6ZCqGyoJZWYrt+ZPHx9A
	eKV/YBEE2yP9qoiUQWda6UEUO0RUlIJaImC+CoE0pDESGlkRHTKLzetic9BHLaiQ0O5s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3QEw-0004ka-VU;
	Tue, 30 Sep 2025 02:37:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v3QEw-0004kU-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qv7YaSup9Hulu19lcLJNimECYVS5T1RBsI6LpiH11Cw=; b=bGygyUT1iqSd8W/cCd8k/jWWa1
 AOBY3eObb6qrjRr+zNEdfqJXt7IPZOMpF4MOJPPkb08a9OFbXlAbVkPy6Gh0S6k0A19dVKzfLgC9z
 okuoimcEBl9rYzp5CEPo2uOU/ms7NkqoTLO6uh8GXRp0FTQjbBfD2gDEtVxwzuGtjyIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qv7YaSup9Hulu19lcLJNimECYVS5T1RBsI6LpiH11Cw=; b=Fll615t7BtvxnKPlYt1qHyTlue
 kCdQvLPaP17oLkXwD5Cg27Rwb4drDKaacnun8FtkirXSP8VNB3UWF/3b1vSltO4rKdizRsmWSUca1
 sKzufGidMXrs+ctJ1LMmJcs4sq0ktEBHHMiIyWerPKB5aT5TfzAMdvNDVEjbu7KkwE9o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3QEv-0004Si-SS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 131C560334
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 02:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8105C116B1;
 Tue, 30 Sep 2025 02:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759199831;
 bh=yMng9dMYvfLmnxdsrXSdqrFDGeOWgX9dyvH+/0zYrDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WVYThWjTEdYg0/h8dGUtc23CPcRLYsEkSeyl9CdTSoM1nGSC4Bpr8zp4KygJOonLi
 HTqSyz9e2c66t9CLUPOlcZYQca/D+I9G5v7nGhjuAcJqbalsFSUeZnKBp/5sMqFZrl
 o2uWxqY4GR8giPmtQ3Ob0zOKBojKQAD5ziG2TocNcHMaUsDJ4vOVn+1tUkCjAXUM5d
 13NW1Xyeif2uIw08NxdggRK4YZijLFGFb+OrqufXUNmo1bfDEBsctHTuSkPS8DIXGd
 0cGvf2XTLOE5P9qGkfUZ0D6MnFgG5yotOoiUqPPXZgEkAo/icOC731x6ol42vVn5z8
 TfWX6WqrOHS0w==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Sep 2025 02:37:02 +0000
Message-ID: <20250930023704.3019074-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
In-Reply-To: <20250930023704.3019074-1-jaegeuk@kernel.org>
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add missing mmap mode in man page. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- man/f2fs_io.8 | 6 ++++++ tools/f2fs_io/f2fs_io.c
 | 34 +++++++++++++++++++++++++++------- 2 files changed, 33 insertions(+),
 7 deletions(-) 
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
X-Headers-End: 1v3QEv-0004Si-SS
Subject: [f2fs-dev] [PATCH 3/5] f2fs_io: add mlock to measure the read speed
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

Add missing mmap mode in man page.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 man/f2fs_io.8           |  6 ++++++
 tools/f2fs_io/f2fs_io.c | 34 +++++++++++++++++++++++++++-------
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 6f3e11e96ed6..8e54aa644a00 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -127,6 +127,12 @@ buffered I/O
 .TP
 .B dio
 direct I/O
+.TP
+.B mmap
+mmap(MAP_POPULATE)
+.TP
+.B mlock
+mmap() + mlock()
 .RE
 .TP
 \fBfiemap\fR \fI[offset in 4kb] [count] [file_path]\fR
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index b9bf9bc5f797..028ffe59d0c7 100644
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
@@ -940,12 +941,13 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	u64 buf_size = 0, ret = 0, read_cnt = 0;
 	u64 offset;
 	char *buf = NULL;
-	char *data;
+	char *data = NULL;
 	char *print_buf = NULL;
 	unsigned bs, count, i, print_bytes;
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
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
