Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E5AD9920
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Jun 2025 02:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w4ZPqKejkYPTxHXvKL4cgVyvq5pu1TaG2eyfIJhCpTk=; b=dcFqcG2tzKkj8oB1Ouc4F7MnPI
	dQ6TPECpF647UsnHEu9kY8SwmqB24lm3SfOCLNVipAcdYZyAc6Ra2E5GknGuBM/5NuLGGuex0rU1X
	FNncqOzCstwTiBkxPaE4FzE+UsoyXaYbdAt+LvhUFsFqmsOWAtALKWpZgcF07/t/itg0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQExo-0007WV-FI;
	Sat, 14 Jun 2025 00:41:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3tq5MaAcKAI8v0D44xxz77z4x.v75@flex--chullee.bounces.google.com>)
 id 1uQExn-0007WG-6F for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Jun 2025 00:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EDZ0GeGehA0Gll2nJsO8Q1m9PTkKCGGw9+fLLiuEewI=; b=MtSMLog2YtXYL6m8VeST1Fp4kY
 sFq3yGY2w1ixGFK5ux69gMMH6mBrCrI3+36XbNYaBlPYOzFW935tvcpgvTW0/LoSnqoBPcnk4VJOY
 BeujpZUZHBxikWnnyNeMBI3cAAokAGHiNdZz80LXDf8FM21g3p7zIKqosISANCu+K7C8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EDZ0GeGehA0Gll2nJsO8Q1m9PTkKCGGw9+fLLiuEewI=; b=b
 QKsTFGmvGJ2jy7RUGm63LLFfFo4TLiTrHWWKgqTsImBrwf39AC6YY5emAbuslhPZta4So6bksC00z
 smdAbN7PTtAd4RRqa4hMiJRdV+VOYB9DH6tQVdGxQgiBOEsCx57+E0amBS4oy73Q4TkMmgXjWHDPa
 Qn1SZuCz9+vgmO7s=;
Received: from mail-vk1-f201.google.com ([209.85.221.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQExm-0000uF-K3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Jun 2025 00:41:39 +0000
Received: by mail-vk1-f201.google.com with SMTP id
 71dfb90a1353d-5313d3a3cccso968833e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Jun 2025 17:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749861692; x=1750466492;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EDZ0GeGehA0Gll2nJsO8Q1m9PTkKCGGw9+fLLiuEewI=;
 b=X1Lfli/HYd2QAXlqVy7SGHsEAFhWVMTwuk1l80gwZf5Wft0BbH4gDyj77nIOkHie24
 YO22tx2z5oPBVllCW6fp8ziezkWOueeu60iSi/c+I249A69O/H4TnDKv3bmsCIzc6z+b
 h67XSMHsaLEtv12p4BG4Naq2BOcaZ6zmFfUM/SbxT1rOeZGyl6PrkTQ6COeNdyQAGGDu
 jlvQAHEnRB+e6nntsXdv1Zuc0Ua9WGAf3K7jrxylveKIGendUOSZ9HAYIffmL6Gt8YL0
 NUtv86JAsEWa4O5qAtqZhDUOTsuGn+n71g2+/tO1J7H/nRgz8M9ogE1+1RA3sFllrho4
 UOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749861692; x=1750466492;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EDZ0GeGehA0Gll2nJsO8Q1m9PTkKCGGw9+fLLiuEewI=;
 b=UkZonIZv7Js7r4oKK3foTU1VEOf41vv0qyTVwqzhW7Up5O4ZnDBvqRNgl6J07JAsHn
 XVPDThCa0QOXTr4cqjEDhgvK0xj5jR/i7eYPC276hRRpsQ5Yy2hzbd+oot8gpC1MnFNQ
 MQwkJM42hEUlyIxfx1J5/VS6G3KCUgoLzIA0//PfGBP84fpHm9q8K4nA4FNet3UJPqKH
 xiOSQWHfvVh0Iw8+eb4LocbSiQPo90Vb9dXZGlqVQhs3s11ZpCXcaPqtbxUgOAy1eI2C
 qMsp2cvrhdqj9boNOVeTSJhWBVyUC7gQne/B4UWb2+sMecAI6OdxT0sWKf9DUpfwMW79
 PvLA==
X-Gm-Message-State: AOJu0Yzq/YfEyq5d4/SbUnuxOF9eUDqln9GDZBGPB5zWHgu8eFQVwCcX
 hXpNUVX9FraSj00PWw+3YCdNx1rnXVMdTDa+ZFdLqMjxnZ5j35UXEAu/b49iyoRPxmtPbDwAI40
 PynNCLGq8MQ==
X-Google-Smtp-Source: AGHT+IH6cHbeuVomBubEU/H5/k3iTI9tm1PNsNpEwLxJnwJmStbefK/4qTee7UH7cNA7cacHbL9vu2hmaOWg
X-Received: from pfbdi6.prod.google.com ([2002:a05:6a00:4806:b0:747:cffb:bb21])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2411:b0:73d:ff02:8d83
 with SMTP id d2e1a72fcca58-7489cdebf2dmr1430818b3a.3.1749855926367; Fri, 13
 Jun 2025 16:05:26 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:05:22 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613230522.380370-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  A new command 'test_create_perf',
 has been introduced to measure
 the performance of creating and deleting many files. Signed-off-by: Daniel
 Lee <chullee@google.com> --- v2: Rename command and make fsync optional ---
 tools/f2fs_io/f2fs_io.c | 139 ++++++++++++++++++++++++++++++++++++++++ 1
 file changed, 139 insertions( [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.201 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uQExm-0000uF-K3
Subject: [f2fs-dev] [PATCH v2] f2fs_io: add test_create_perf command
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A new command 'test_create_perf', has been introduced to measure
the performance of creating and deleting many files.

Signed-off-by: Daniel Lee <chullee@google.com>
---
v2: Rename command and make fsync optional
---
 tools/f2fs_io/f2fs_io.c | 139 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6531b55..6831e78 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2092,6 +2092,144 @@ static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define test_create_perf_desc "measure file creation speed"
+#define test_create_perf_help						\
+"f2fs_io test_create_perf [-s] <dir> <num_files> <size_kb>\n\n"		\
+"Measures file creation and deletion performance.\n"			\
+"  <dir>          The target directory where files will be created.\n"	\
+"  <num_files>    The total number of files to create and delete.\n"	\
+"  <size_kb>      The size of each file in kb.\n"			\
+"  [-s]           Call fsync() after each file creation to measure\n"
+
+static void do_test_create_perf(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	bool do_fsync = false;
+	int opt;
+	char *dir;
+	int num_files;
+	int size_kb;
+	char *write_buffer = NULL;
+
+	while ((opt = getopt(argc, argv, "s")) != -1) {
+		switch (opt) {
+		case 's':
+			do_fsync = true;
+			break;
+		default:
+			fputs(cmd->cmd_help, stderr);
+			exit(1);
+		}
+	}
+
+	argc -= optind;
+	argv += optind;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	dir = argv[0];
+	num_files = atoi(argv[1]);
+	size_kb = atoi(argv[2]);
+
+	if (num_files <= 0) {
+		fprintf(stderr, "Error: Number of files must be positive.\n");
+		exit(1);
+	}
+
+	if (size_kb > 0) {
+		write_buffer = malloc(size_kb * 1024);
+		if (!write_buffer) {
+			perror("Failed to allocate write buffer");
+			exit(1);
+		}
+		memset(write_buffer, 'a', size_kb * 1024);
+	}
+
+	// Creation Phase
+	printf("Starting test: Creating %d files of %dKB each in %s (fsync: %s)\n",
+		num_files, size_kb, dir,
+		do_fsync ? "Enabled" : "Disabled");
+
+	struct timespec create_start, create_end;
+
+	clock_gettime(CLOCK_MONOTONIC, &create_start);
+
+	for (int i = 0; i < num_files; i++) {
+		char path[1024];
+
+		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
+
+		int fd = open(path, O_WRONLY | O_CREAT, 0644);
+
+		if (fd < 0) {
+			perror("Error opening file");
+			continue;
+		}
+		if (size_kb > 0) {
+			if (write(fd, write_buffer, size_kb * 1024) < 0)
+				perror("Error writing to file");
+		}
+
+		if (do_fsync)
+			fsync(fd);
+
+		close(fd);
+	}
+
+	clock_gettime(CLOCK_MONOTONIC, &create_end);
+
+
+	// Deletion Phase
+	printf("Deleting %d created files...\n", num_files);
+
+	struct timespec del_start, del_end;
+
+	clock_gettime(CLOCK_MONOTONIC, &del_start);
+
+	for (int i = 0; i < num_files; i++) {
+		char path[1024];
+
+		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
+		if (unlink(path) != 0)
+			perror("Error unlinking file");
+	}
+	sync();
+
+	clock_gettime(CLOCK_MONOTONIC, &del_end);
+
+	long create_seconds = create_end.tv_sec - create_start.tv_sec;
+	long create_ns = create_end.tv_nsec - create_start.tv_nsec;
+	double create_time_s = (double)create_seconds + (double)create_ns / 1000000000.0;
+	double create_throughput = (create_time_s > 0) ? (num_files / create_time_s) : 0;
+
+	long del_seconds = del_end.tv_sec - del_start.tv_sec;
+	long del_ns = del_end.tv_nsec - del_start.tv_nsec;
+	double del_time_s = (double)del_seconds + (double)del_ns / 1000000000.0;
+	double del_throughput = (del_time_s > 0) ? (num_files / del_time_s) : 0;
+
+	printf("Operation,total_files,file_size_kb,total_time_s,throughput_files_per_sec\n");
+
+	printf("CREATE,%d,%d,%.4f,%.2f\n",
+		   num_files,
+		   size_kb,
+		   create_time_s,
+		   create_throughput);
+
+	printf("DELETE,%d,%d,%.4f,%.2f\n",
+		   num_files,
+		   size_kb,
+		   del_time_s,
+		   del_throughput);
+
+	if (write_buffer)
+		free(write_buffer);
+
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -2140,6 +2278,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_advise),
 	CMD(ioprio),
 	CMD(ftruncate),
+	CMD(test_create_perf),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
