Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE19B9B4D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 00:53:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t71SP-0007QG-5q;
	Fri, 01 Nov 2024 23:53:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t71SJ-0007Q7-IZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 23:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6m1Cg8+srcyoHTkXflAdS83GO0c6b0LTlMJZqsQdws=; b=FJ4N00pEc9+/ZKR0bVDiGyL1jM
 2gRmhA9CX1xrIUn8C73wm5jbi3ai/mEeQLS/nMFYBpKoufDqX9thoEeyaQ+bGsKRW6t+7KArV5XrQ
 1mAiOh77RhqCs/MZJTTXooFnE3UslGJjyovTlVxMTpDOow6/8rHy3gESTYUfW9/p2Lkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a6m1Cg8+srcyoHTkXflAdS83GO0c6b0LTlMJZqsQdws=; b=fLcnVKKz6VFoSFH3ZY9v9Pc5oM
 T6JvhLHVyovDMOJ5pKSQB9ThMMCC54NRQnHnqdVEhjYWinVjU7G1rqAySTIQ1PREcaH7ummoVbqeM
 YBD3N4XUOou0tT/bXRYokApHkMfIJXrF8rqkzg7T7zs+V5m7fiZySVLVoIHinAwmut14=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t71SJ-0003fK-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 23:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31A55A44ADA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  1 Nov 2024 23:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A538C4CECD;
 Fri,  1 Nov 2024 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730505201;
 bh=S1FsvhBTTTYkhDmy+R7LlzmAuuN/KCc/5g+IjZDiuMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EnJCxb53ka8Azp6cwCSokbRj/2PF3tYPqvZ6KkmzvE7pTer05g/6ffH2Sdw3C8Ami
 UOoCtRTMtDGJu2QBQTbdVJUrFwYaLLD2PBgBkZ5vB9I5fdFPfDXaEhQx2KJ/mJpnfP
 yDczY8OQKpco6y3rJL/DXAlM23+peG4l9hTUPPwdEk8B4nmSd5xw0RF4bBWv0hueUj
 tgol7VtWSWQOIqsQOk3Q7AyKA8QdW8LG+YNTSbu9Mrq8q1L1csot/Jwm11kwQ+BUQr
 Q4fHDq98kHSWO5BMyxGuEvKhmmxVvMlC75J7MX0s88ry0xUjYCawz459hUeYGPAIMp
 F5Dop5kAnxrEA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 Nov 2024 23:53:18 +0000
Message-ID: <20241101235318.300320-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241101235318.300320-1-jaegeuk@kernel.org>
References: <20241101235318.300320-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch improves the randread test: - add mmap - add
 fadvise
 option - show performance results Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- tools/f2fs_io/f2fs_io.c | 60 +++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 11 deletions(-) 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t71SJ-0003fK-Gy
Subject: [f2fs-dev] [PATCH 2/2] f2fs_io: add more options for randread test
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

This patch improves the randread test:
 - add mmap
 - add fadvise option
 - show performance results

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 60 +++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 487040ad21d4..fa01f8fd4809 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -952,24 +952,31 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define randread_desc "random read data from file"
 #define randread_help					\
-"f2fs_io randread [chunk_size in 4kb] [count] [IO] [file_path]\n\n"	\
+"f2fs_io randread [chunk_size in 4kb] [count] [IO] [advise] [file_path]\n\n"	\
 "Do random read data in file_path\n"		\
 "IO can be\n"						\
 "  buffered : buffered IO\n"				\
 "  dio      : direct IO\n"				\
+"  mmap     : mmap IO\n"				\
+"advice can be\n"					\
+" 1 : set random|willneed\n"				\
+" 0 : none\n"						\
 
 static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 {
 	u64 buf_size = 0, ret = 0, read_cnt = 0;
 	u64 idx, end_idx, aligned_size;
 	char *buf = NULL;
-	unsigned bs, count, i;
+	char *data;
+	unsigned bs, count, i, j;
+	u64 total_time = 0, elapsed_time = 0;
 	int flags = 0;
-	int fd;
+	int do_mmap = 0;
+	int fd, advice;
 	time_t t;
 	struct stat stbuf;
 
-	if (argc != 5) {
+	if (argc != 6) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
@@ -985,10 +992,21 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	count = atoi(argv[2]);
 	if (!strcmp(argv[3], "dio"))
 		flags |= O_DIRECT;
+	else if (!strcmp(argv[3], "mmap"))
+		do_mmap = 1;
 	else if (strcmp(argv[3], "buffered"))
 		die("Wrong IO type");
 
-	fd = xopen(argv[4], O_RDONLY | flags, 0);
+	fd = xopen(argv[5], O_RDONLY | flags, 0);
+
+	advice = atoi(argv[4]);
+	if (advice) {
+		if (posix_fadvise(fd, 0, stbuf.st_size, POSIX_FADV_RANDOM) != 0)
+			die_errno("fadvise failed");
+		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_WILLNEED) != 0)
+			die_errno("fadvise failed");
+		printf("fadvise RANDOM|WILLNEED to a file: %s\n", argv[5]);
+	}
 
 	if (fstat(fd, &stbuf) != 0)
 		die_errno("fstat of source file failed");
@@ -998,18 +1016,38 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 		die("File is too small to random read");
 	end_idx = (u64)(aligned_size - buf_size) / (u64)F2FS_DEFAULT_BLKSIZE + 1;
 
+	if (do_mmap) {
+		data = mmap(NULL, stbuf.st_size, PROT_READ, MAP_SHARED, fd, 0);
+		if (data == MAP_FAILED)
+			die("Mmap failed");
+		if (madvise((void *)data, stbuf.st_size, MADV_RANDOM) != 0)
+			die_errno("madvise failed");
+	}
+
 	srand((unsigned) time(&t));
 
+	total_time = get_current_us();
+
 	for (i = 0; i < count; i++) {
 		idx = rand() % end_idx;
 
-		ret = pread(fd, buf, buf_size, F2FS_DEFAULT_BLKSIZE * idx);
-		if (ret != buf_size)
-			break;
-
-		read_cnt += ret;
+		if (!do_mmap) {
+			ret = pread(fd, buf, buf_size, 4096 * idx);
+			if (ret != buf_size)
+				break;
+		} else {
+			for (j = 0; j < bs; j++)
+				*buf = data[4096 * (idx + j)];
+		}
+		read_cnt += buf_size;
 	}
-	printf("Read %"PRIu64" bytes\n", read_cnt);
+	elapsed_time = get_current_us() - total_time;
+
+	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, avg. latency = %.Lf us, IOPs= %.Lf, BW = %.Lf MB/s\n",
+		read_cnt, elapsed_time,
+		(long double)elapsed_time / count,
+		(long double)count * 1000 * 1000 / elapsed_time,
+		(long double)read_cnt / elapsed_time);
 	exit(0);
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
