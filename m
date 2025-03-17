Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C7A66080
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 22:28:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuI0M-0008Fh-4a;
	Mon, 17 Mar 2025 21:28:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tuI0K-0008Fa-U4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 21:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wYhfViZJ8HpzAUcBgYBBe1BGDvBFAEvSVApC5rTIQAI=; b=AaVzqb3Q/AXK7oy1JGPuFAaOsK
 s/EHzSztZgYG/ytLHTPT0rpJGZrtTOzDeJeTPd58SX87tWTg/KpkqBwNFspE7pTxNCJuDH3w/fbqb
 llvgkYbyuukZWubNFj89fAATqpTeYtMdJrDtcrfFB0oloLGmllfrv6zFj+EtKF4G9Ios=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wYhfViZJ8HpzAUcBgYBBe1BGDvBFAEvSVApC5rTIQAI=; b=kWaLb7byIs4029pXxHfukkm4dP
 LkitOy5smwfUjErcmL2UuxRFZxJGEdYrmxpzg85nemPmGoQhQ0G19zxG/0s7gfGocbPE0kL3FMt0F
 aIYUE1d1kjyAt0TseEudSN6ehmscTjEGanKLTCnflguIq5dds85BwqtQuVzEMRLrlwwI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tuI0F-0001WE-Hg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 21:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2BA42A48D62
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Mar 2025 21:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605B9C4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Mar 2025 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742246876;
 bh=etcJgAJF4zW/ZcJF9PxrZJMC4ul5AcidlsJbaBd+pyY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=FohP4f0J6qkBRIAhgqJD1O82YJ/SSWLLCz72FICX0CYgNJlo6q5wwTcu6TWNUuTAP
 eJQf2YwhLb/UrZE0iME6Bl4kwEiUSsLKLNeujsazpkl0J4IazltX+xaQ2RQDrcbIqq
 7ANTsyPoRkmQRj2irAF99ef65A3Ciy9BITYorjcnTsLMLUm7Ksr/PgtKlTv5o5Ohk9
 RJsut9wdjJ8x4eoIRhqAZmA/ZogrcvMY0TFOon+wP9TBM3hqOXMK89OBTZHbodhRMS
 nyH8ZC7ZT0umfcFWR9PQw5Nii+jgiW3ZYIpWdhLFvmPt2FUeuIblkUJlVm/4ueeJ4n
 wDZTb+TCyfxaA==
Date: Mon, 17 Mar 2025 21:27:54 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Z9iT2mbav0SNUKO4@google.com>
References: <20250304011036.1373650-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304011036.1373650-1-jaegeuk@kernel.org>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This adds a fragread command in f2fs_io, which is able to
 measure the read performance on fragmented data buffer. Signed-off-by: Jaegeuk
 Kim <jaegeuk@google.com> --- Change log from v1: - add mlock 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tuI0F-0001WE-Hg
Subject: Re: [f2fs-dev] [f2fs-dev v2] [PATCH] f2fs_io: add fragread command
 to evaluate fragmented buffer for reads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a fragread command in f2fs_io, which is able to measure the
read performance on fragmented data buffer.

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---

 Change log from v1:
  - add mlock

 tools/f2fs_io/f2fs_io.c | 114 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 44d389dbd771..57a931d5769c 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1005,6 +1005,119 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
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
+	/* Pin the pages. */
+	if (mlock(buf, buf_size))
+		die_errno("mlock failed");
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
@@ -1989,6 +2102,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(write_advice),
 	CMD(read),
 	CMD(randread),
+	CMD(fragread),
 	CMD(fiemap),
 	CMD(gc_urgent),
 	CMD(defrag_file),
-- 
2.49.0.rc1.451.g8f38331e32-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
