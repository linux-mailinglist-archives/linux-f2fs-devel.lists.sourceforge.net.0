Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B558C99AECA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Oct 2024 00:49:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1szORs-000724-Rr;
	Fri, 11 Oct 2024 22:49:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1szORr-00071t-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Oct 2024 22:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oT+NFL26PD4CXV7/ApRRBrTKeMGlB2R0MG6hxhbgq+o=; b=TLNbfGjDAFEcriy9KliFx/xdtl
 WpOthHZkPKIq9wpM6dpognCfLz5l30OpOYp2aBojJzWXyJRIyh5DK2y/bdPKNdJs2rm7dq4lXKm31
 9p6wtT34FUcQuWwJioHqCwxdHruq5wFAwwQcBV6V2qAQZ+m0XJwWQT72YF3B3tQwtFrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oT+NFL26PD4CXV7/ApRRBrTKeMGlB2R0MG6hxhbgq+o=; b=j
 6/vUoA/xw9Q0sFSPKgGkfXNRs8/gRctAAqQFGkGLYkbTFh1ZcCsM5P3d03fIZ7zXIkuYwUyqoY9q5
 nvmi10XmPd41QVE8r56iLFcQLqqpoGjKsFmo9gxrZ83s8JxYU1pzhfN2n4gHhZqV1mBfsa4y4oHHa
 iHfaKLDJEeVPK6UA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1szORr-00024M-2W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Oct 2024 22:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8FC40A45179
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Oct 2024 22:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDCFC4CED1;
 Fri, 11 Oct 2024 22:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728686961;
 bh=DxRZXqNLODkyf/maVnnefh/6722VNMphrmQdSpC63Xo=;
 h=From:To:Cc:Subject:Date:From;
 b=f1vILShhGRaU4QQ5drhKsbRqQL3Igqjpny8C6XVgHtCWVJ8K5UuVPAWelVa1ga9+X
 CN4mrIle4bYLWzaDOnURgFs3S2cisnImeAUueBsCORYNU4CPcFYn3DthrJszXc6VIZ
 BsIOFXXhsCwDF9weu3JV3dVS8MAEjWc7ma/1zSFKM0JmjZ3pSXidrc3Ac5AG8hC4ZV
 JIhWDcJrwIE+WgVSg8Eh7BcKwPyCr70PhuLG1dvGh08tBLZtdPflKVOO4xFyX378Pw
 CKql/RvLTwWL7eNFoGFxgwNlceGgepfoArnFDfFFMNbLu86XiZC5NNGAeh84eh93Gy
 GI9HjIJobLVzQ==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 11 Oct 2024 22:49:19 +0000
Message-ID: <20241011224919.1729312-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This adds a way to boost read performance by giving fadvise.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c
 | 27 ++++++++++++++++++++------- 1 file changed, 20 insertions(+),
 7 deletions(-)
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1szORr-00024M-2W
Subject: [f2fs-dev] [PATCH] f2fs_io: support fadvice for read
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

This adds a way to boost read performance by giving fadvise.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 8fbad3c8e563..5b67a92e0947 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -833,12 +833,15 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define read_desc "read data from file"
 #define read_help					\
-"f2fs_io read [chunk_size in 4kb] [offset in chunk_size] [count] [IO] [print_nbytes] [file_path]\n\n"	\
+"f2fs_io read [chunk_size in 4kb] [offset in chunk_size] [count] [IO] [advice] [print_nbytes] [file_path]\n\n"	\
 "Read data in file_path and print nbytes\n"		\
 "IO can be\n"						\
 "  buffered : buffered IO\n"				\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
+"advice can be\n"					\
+" 1 : set sequential|willneed\n"			\
+" 0 : none\n"						\
 
 static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -851,9 +854,9 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	u64 total_time = 0;
 	int flags = 0;
 	int do_mmap = 0;
-	int fd;
+	int fd, advice;
 
-	if (argc != 7) {
+	if (argc != 8) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
@@ -876,13 +879,22 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	else if (strcmp(argv[4], "buffered"))
 		die("Wrong IO type");
 
-	print_bytes = atoi(argv[5]);
+	print_bytes = atoi(argv[6]);
 	if (print_bytes > buf_size)
 		die("Print_nbytes should be less then chunk_size in kb");
 
 	print_buf = xmalloc(print_bytes);
 
-	fd = xopen(argv[6], O_RDONLY | flags, 0);
+	fd = xopen(argv[7], O_RDONLY | flags, 0);
+
+	advice = atoi(argv[5]);
+	if (advice) {
+		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_SEQUENTIAL) != 0)
+			die_errno("fadvise failed");
+		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_WILLNEED) != 0)
+			die_errno("fadvise failed");
+		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[7]);
+	}
 
 	total_time = get_current_us();
 	if (do_mmap) {
@@ -912,8 +924,9 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
 	}
-	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, print %u bytes:\n",
-		read_cnt, get_current_us() - total_time, print_bytes);
+	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s print %u bytes:\n",
+		read_cnt, get_current_us() - total_time,
+		((long double)read_cnt / (get_current_us() - total_time) * 1000/1024 * 1000/1024 ), print_bytes);
 	printf("%08"PRIx64" : ", offset);
 	for (i = 1; i <= print_bytes; i++) {
 		printf("%02x", print_buf[i - 1]);
-- 
2.47.0.rc1.288.g06298d1525-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
