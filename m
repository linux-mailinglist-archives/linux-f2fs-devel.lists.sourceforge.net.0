Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAAA4D089
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 02:11:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpGoF-0005QN-Se;
	Tue, 04 Mar 2025 01:11:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tpGoB-0005QA-PI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 01:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u8ULkRbHOVTXxcf3BfZF+YiExF960mIdbk/EDS298Q0=; b=FGV1P1Wa+9lELj9PCDHESafNj/
 yMxmH6ZUKKIV2I/blJjTEcj5rQk+Z0KtIJ70lY0VF1fD05ceiyhG0m7GFnuZfRI1QxTF3Sz3hcF3S
 Ex7dgzQaLSONE+X0vLBDB/ixHeMdHn4s9AtStycPH3E9jjlsCWs3528V+Z0bF1VR4WGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u8ULkRbHOVTXxcf3BfZF+YiExF960mIdbk/EDS298Q0=; b=F
 tHY94oOUhKzRemPWzcsX+LNEQfIleHyWLiSs2WpwNgWqBmGxKbLl0sYhq4HOLPBgXDTRbmlatGIbM
 XLv4oZ6vpv2UYhTSLiUzI8NYMMk1FP7Vyn0AAH8P3BlT96Bx/Ofh9EB1sT9+leLRBqp3P7KWUtboK
 xOIPg/n0pYnu+CNM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpGo6-000793-0m for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 01:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D17A55C033D;
 Tue,  4 Mar 2025 01:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A1CC4CEE4;
 Tue,  4 Mar 2025 01:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741050639;
 bh=L+u3ObYR4WUHi7E8xafqujR291sNHOgOR8oWNtMru/U=;
 h=From:To:Cc:Subject:Date:From;
 b=MlRAAkJFrutL5oqEFWHWiUbkby++HSIUXzBZU3gYpb1BGAKs+sJO484iFegY6Mbt9
 GmIc/WqgysIRmQfHmJH2v1bxHnRKKYEEZFs1jUwFH46fl7MkNyvufAz3wFOc4M8rZb
 7KMKNprUTrsizEWFXxvUiOFbKZWM2dboX0dJroYJgf2/1Sc7ewYUpoTWh7+IcXHVSz
 XC4PP7/fa0JD966+/t8YP6LNEi3YDelT9uA5lmBh1Tba6mb7973V89xGwdv3j6YG6y
 dcY6pCyF8HRb12mfl8a0//CQb8Ttk0RC8M8HRTSW5GT9a3KgvB3R31S0HQ9xGMZOw9
 4rwPAGHMzDhYw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Mar 2025 01:10:36 +0000
Message-ID: <20250304011036.1373650-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@google.com> This adds a fragread
 command in f2fs_io, which is able to measure the read performance on fragmented
 data buffer. Signed-off-by: Jaegeuk Kim <jaegeuk@google.com> ---
 tools/f2fs_io/f2fs_io.c
 | 110 ++++++++++++++++++++++++++++++++++++++++ 1 file changed,
 110 insertions(+)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpGo6-000793-0m
Subject: [f2fs-dev] [PATCH] f2fs_io: add fragread command to evaluate
 fragmented buffer for reads
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@google.com>

This adds a fragread command in f2fs_io, which is able to measure the
read performance on fragmented data buffer.

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 tools/f2fs_io/f2fs_io.c | 110 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index b72c26648f56..8431262575e0 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1018,6 +1018,115 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define fragread_desc "read data with a fragmented buffer from file"
+#define fragread_help					\
+"f2fs_io fragread [chunk_size in 4kb] [offset in chunk_size] [count] [advice] [file_path]\n\n"	\
+"Read data in file_path and print nbytes\n"		\
+"advice can be\n"					\
+" 1 : set sequential|willneed\n"			\
+" 0 : none\n"						\
+
+#ifndef PAGE_SIZE
+#define PAGE_SIZE sysconf(_SC_PAGESIZE)
+#endif
+#define ALLOC_SIZE (2 * 1024 * 1024 - 4 * 1024) // 2MB - 4KB
+
+static void do_fragread(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	u64 buf_size = 0, ret = 0, read_cnt = 0;
+	u64 offset;
+	char *buf = NULL;
+	uintptr_t idx, ptr;
+	unsigned bs, count, i;
+	u64 total_time = 0;
+	int flags = 0, alloc_count = 0;
+	void *mem_hole, **mem_holes;
+	int fd, advice;
+
+	if (argc != 6) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	bs = atoi(argv[1]);
+	if (bs > 256 * 1024)
+		die("Too big chunk size - limit: 1GB");
+	buf_size = bs * F2FS_DEFAULT_BLKSIZE;
+
+	offset = atoi(argv[2]) * buf_size;
+	count = atoi(argv[3]);
+	advice = atoi(argv[4]);
+	mem_holes = xmalloc(sizeof(void *) * (buf_size / PAGE_SIZE));
+
+	/* 1. Allocate the buffer using mmap. */
+	buf = mmap(NULL, buf_size, PROT_READ | PROT_WRITE,
+				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	/* 2. Loop and touch each page. */
+	for (idx = (uintptr_t)buf; idx < (uintptr_t)buf + buf_size;
+						idx += PAGE_SIZE)
+	{
+		/* Touch the current page. */
+		volatile char *page = (volatile char *)idx;
+		*page;
+
+		/* 3. Allocate (2M - 4K) memory using mmap and touch all of it. */
+		mem_hole = mmap(NULL, ALLOC_SIZE, PROT_READ | PROT_WRITE,
+					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		if (mem_hole == MAP_FAILED)
+			die_errno("map failed");
+
+		/* Store the allocated memory pointer. */
+		mem_holes[alloc_count++] = mem_hole;
+
+		/* Touch all allocated memory. */
+		for (ptr = (uintptr_t)mem_hole;
+			ptr < (uintptr_t)mem_hole + ALLOC_SIZE;
+						ptr += PAGE_SIZE) {
+			volatile char *alloc_page = (volatile char *)ptr;
+			*alloc_page;
+		}
+	}
+	printf("Touched allocated memory: count = %u\n", alloc_count);
+	printf(" - allocated memory: = ");
+	for (idx = 0; idx < 5; idx++)
+		printf(" %p", mem_holes[idx]);
+	printf("\n");
+
+	fd = xopen(argv[5], O_RDONLY | flags, 0);
+
+	if (advice) {
+		if (posix_fadvise(fd, 0, F2FS_DEFAULT_BLKSIZE,
+				POSIX_FADV_SEQUENTIAL) != 0)
+			die_errno("fadvise failed");
+		if (posix_fadvise(fd, 0, F2FS_DEFAULT_BLKSIZE,
+				POSIX_FADV_WILLNEED) != 0)
+			die_errno("fadvise failed");
+		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[5]);
+	}
+
+	total_time = get_current_us();
+
+	for (i = 0; i < count; i++) {
+		ret = pread(fd, buf, buf_size, offset + buf_size * i);
+		if (ret != buf_size) {
+			printf("pread expected: %"PRIu64", readed: %"PRIu64"\n",
+					buf_size, ret);
+			if (ret > 0)
+				read_cnt += ret;
+			break;
+		}
+
+		read_cnt += ret;
+	}
+	printf("Fragmented_Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s\n",
+		read_cnt, get_current_us() - total_time,
+		((long double)read_cnt / (get_current_us() - total_time)));
+	printf("\n");
+	exit(0);
+}
+
 #define randread_desc "random read data from file"
 #define randread_help					\
 "f2fs_io randread [chunk_size in 4kb] [count] [IO] [advise] [file_path]\n\n"	\
@@ -2002,6 +2111,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(write_advice),
 	CMD(read),
 	CMD(randread),
+	CMD(fragread),
 	CMD(fiemap),
 	CMD(gc_urgent),
 	CMD(defrag_file),
-- 
2.48.1.711.g2feabab25a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
