Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD0C99133
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 21:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeODunYM8uykAryAMmMz+e63V+kfo5R/BTMdnCaPOUw=; b=fOzFuweXihLJtkBvHOBh1Xa68G
	818ZQMfOKwuONaCBECQR2eXs82xlH34hXMGCXJQveM2o14Vb8aPkslTpv53Nua2KqsMS/KiPA0046
	ISE832+ZUx5NDufBXQdH5TieQc2OcyrvmcCTK7VoGqw6En1JwAsVjr02fHkA6e87QsTg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQAn4-0003E6-Ku;
	Mon, 01 Dec 2025 20:46:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQAn3-0003Dy-9V
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5CjG2mb6wi7qen6CgSXGDulBSxmtAumuCxe926IEPlo=; b=ha1UBLuFRC4PYjBnSqYtXjUnOk
 If3sy7w1Q0yB2IhTUmxy4WZYzZznklJsmfaCb6vcPY4pQOD3y/TLWtUs7gazKKuDx/19SqZ+kqBzE
 BAtOyNu8npHr3WkKw4kX1mtaxSuwbIqOnlym7XNJ0YBnXweFvQZv7fv7zCILGNGqKCLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5CjG2mb6wi7qen6CgSXGDulBSxmtAumuCxe926IEPlo=; b=FGjdOvd9P0ivUIzu6JqKNzsDUh
 K9E+WlihuSw6YmKLRcQ2DGiUOKQ/aruCd9hgraRlF4nYZSlViVMcHM0K8ARefvMD0Iz/gE086LNWX
 fa775scTa4wluGod77ELmPNOxcrdrGIzBRHAdJi1lDQWElOVI3Hiyz7VXpa5ycGoxsck=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQAn2-0000tr-Q4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 813A1437ED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 20:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B74C4CEF1;
 Mon,  1 Dec 2025 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764621987;
 bh=/DukttgQq+fnd7sr4F+v+pnvBseFz/+BLRtfeAdQZ3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GeRQmrpqhtZZK/TU8bDtAbVtJlfpIr1AgfP27HjrPhAs6L7Bad6vwMRwcZRJ/odB7
 MFw8JifBHt33LCMp6BE0xxbz4sWZVeSH9pFypsVnCHnTzwwiEsiX8V2rwGdEuD0XeL
 rAygT3zWP2yPqv9lBKmFX9GzvxQI06f0J1rRAWxZIkXgIzugb/ciGI5bZFHPvrqj0/
 NdM5+vfw3CGXqebNd+wBa7US1xRpwRGjaVz/gdqBJp6I1IOoCLB6sYSRv4uaLZlWxy
 VcuH/HGk7IlHo/7e4pllClmvot8NFfDC6w3l/XdabF9u++j7M5ZI1VdhYrR/mC9CDb
 FedfbBNgQKryA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  1 Dec 2025 20:46:19 +0000
Message-ID: <20251201204620.905318-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201204620.905318-1-jaegeuk@kernel.org>
References: <20251201204620.905318-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add a method to read out pages into unevictable mapping by
 mmap(), mlock2(), and madvise() Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- tools/f2fs_io/f2fs_io.c | 24 +++++++++++++++++++++++- 1 file changed,
 23 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQAn2-0000tr-Q4
Subject: [f2fs-dev] [PATCH 2/3] f2fs_io: add read test with mlock2 and
 madvise
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

Add a method to read out pages into unevictable mapping by mmap(), mlock2(),
and madvise()

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index bc2e014d3911..d5e103f7b833 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "  dontcache: buffered IO + dontcache\n"		\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
+"  madvise  : mmap + mlock2 + madvise\n"		\
 "  mlock    : mmap + mlock\n"				\
 "advice can be\n"					\
 " 1 : set sequential|willneed\n"			\
@@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	int flags = 0;
 	int do_mmap = 0;
 	int do_mlock = 0;
+	int do_madvise = 0;
 	int do_dontcache = 0;
 	int fd, advice;
 
@@ -979,6 +981,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		flags |= O_DIRECT;
 	else if (!strcmp(argv[4], "mmap"))
 		do_mmap = 1;
+	else if (!strcmp(argv[4], "madvise"))
+		do_madvise = 1;
 	else if (!strcmp(argv[4], "mlock"))
 		do_mlock = 1;
 	else if (!strcmp(argv[4], "dontcache"))
@@ -1021,6 +1025,24 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		if (mlock(data, count * buf_size))
 			die_errno("mlock failed");
 		mlock_time_end = get_current_us();
+		read_cnt = count * buf_size;
+		memcpy(print_buf, data, print_bytes);
+	} else if (do_madvise) {
+		data = mmap(NULL, count * buf_size, PROT_READ,
+				MAP_SHARED, fd, offset);
+		if (data == MAP_FAILED)
+			die("Mmap failed");
+
+		mlock_time_start = get_current_us();
+		if (mlock2(data, count * buf_size, MLOCK_ONFAULT))
+			die_errno("mlock2 failed");
+		mlock_time_end = get_current_us();
+
+		io_time_start = get_current_us();
+		if (madvise(data, count * buf_size, MADV_POPULATE_READ) != 0)
+			die_errno("madvise failed");
+		io_time_end = get_current_us();
+
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
 	} else if (do_mlock) {
@@ -1085,7 +1107,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	}
 	if (do_mmap) {
 		munmap(data, count * buf_size);
-	} else if (do_mlock) {
+	} else if (do_mlock || do_madvise) {
 		munlock(data, count * buf_size);
 		munmap(data, count * buf_size);
 	}
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
