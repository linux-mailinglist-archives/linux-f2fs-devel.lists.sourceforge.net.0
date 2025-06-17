Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA1ADCFAC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 16:27:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=otF/BMmBx9rH1wAFxHnPt2y6QzxZnPYciYyJT2FbSzo=; b=FTS2EbDZYrjzqt3RphnuX9DNel
	OXXc7fhBdu3IggHqg/A0Qf65+GZbvsQ00JQ3PjfxfBzaqd8LLb2n9MmPj6fbG+Ab/sW09by9YoKVb
	MaM4GW6UX+n5ARSEuauO3XI2cWtIqJwf8hXCByfHaW2zcigkL1k+TIXHx2/o9P1tASSg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRXHv-0007VF-B5;
	Tue, 17 Jun 2025 14:27:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3DnZRaAcKAIkpu7yyrrt11tyr.p1z@flex--chullee.bounces.google.com>)
 id 1uRXHu-0007V2-2x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 14:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=beBXh8Gm6W511kwaz/7I7kF7IaNDlWH3azd0MTeqQeE=; b=P75TvD5lc2TYPREYq8s4tZlBPS
 5actDl8aNpAH5awI5d47sYtPqHrynvDIcOn5VvWJHfGhVzGaleQOXP269gIpzg9H6lpNlju+EVRTI
 QUp8dNjyPcYbvwgWeTCbO8HCAfrKX4YDJPujzOlh1V5cIaYPjNqJOK+hNeO/Q7kYyqZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=beBXh8Gm6W511kwaz/7I7kF7IaNDlWH3azd0MTeqQeE=; b=I
 EmZgY0oli7TjQK+rUGs1ABJq0mG6eueiTAKgfK5/U44/qjhZhMq5i99XaSHHXvhtS36GKR98YO1Cd
 o2WtTzQrlEr7ViocuU2HAqpElEZ5O9w4TlCtwqlJBfgCMh5qbiiQ9Z5aQg/SEjxuY2oDME7wRUumU
 vcj9VKsD6ajiMMRc=;
Received: from mail-qv1-f73.google.com ([209.85.219.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRXHt-0004Mf-KL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 14:27:46 +0000
Received: by mail-qv1-f73.google.com with SMTP id
 6a1803df08f44-6fad2a25b65so98350936d6.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jun 2025 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750170460; x=1750775260;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=beBXh8Gm6W511kwaz/7I7kF7IaNDlWH3azd0MTeqQeE=;
 b=cV7pgRvJFdDbkI/iYafHHnYt1W0syQ5/o62gNSB74UfMmHRrJyCqor0k4hDXpKhrKs
 MFFd/tdjDm3e2PervSzgmAPFKRdUw6HtU8f5u/VZwpooe+ohkbMNpGkkeWSUuAIGzLuN
 U7AAp6cX94EXiARVcjzKtPTOKQtV0Z9vSl0D2QlrJoaRZQxsqtoKQxC4q8VtHsY5GGHf
 rihSkAl+mRItOt/YtM1b9F/EVG6/GWxwI9zyu+j6oervRwv3xFwqvJsUypgeMvPtAnOC
 /b7a6Jgoq0Iy3JMBVyxJ+bzr4+HGqqL8UZv08p01PoBcB8M96h8G+znuQC4N0U6QbQTa
 LyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750170460; x=1750775260;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=beBXh8Gm6W511kwaz/7I7kF7IaNDlWH3azd0MTeqQeE=;
 b=bRnK2rTH+rifMysDCvuGB9oO2fm5N0uCRQRCoDj+fkA/xo4bg5hc8vWKHFQ8RfFRUB
 A4FdSvcQmH4fJxdkuSdTVrM12dVdBy0NB3V+HsimP3itjePAycDJSx5UxEDIYPLwClAq
 LO6hIPz6J5R42pX6XbD+rXjIw3ijF08N4hSy31ae0bOSNbK/+XLyAZxJ2BYaFoO/eFCB
 Gsbl1xy7aFSIav2qu+4HepMDD96izGYDqPVHh1yXhFo6SdePsP9eUCzDfxmQM/f8YlGE
 QsTbZJ74z7hEFh1pMDSgPY0In0GAR9+xV77Ex06GLcsKLuHQ0a7WqjRfFupkjtztL+b4
 DP+w==
X-Gm-Message-State: AOJu0Yw0vWZdjcORfKAKvgmnByy5WkYOtOwR2pbUVHht9M47JRN4pYnz
 v2khvQ3HBuYbhcocJiKSYQakjDGrFgrqxy4k0vkvfwPrs8rP9o/66LEhTP1CDWcJmtNE+KgtZef
 kt1HPpbYbyA==
X-Google-Smtp-Source: AGHT+IGBaxK1Xgfe4H8CzHx+3nREtHcuhTqM6DSPuuuskfSrKCbFXW4gfICY6MNR2P/gWRyHEFTgeNw1Jeal
X-Received: from pjvb12.prod.google.com ([2002:a17:90a:d88c:b0:312:f31a:af55])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2801:b0:30c:540b:9ba
 with SMTP id 98e67ed59e1d1-313f1c0311emr22603337a91.10.1750169102774; Tue, 17
 Jun 2025 07:05:02 -0700 (PDT)
Date: Tue, 17 Jun 2025 07:04:57 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250617140457.2358846-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  A new command 'test_create_perf',
 has been introduced to measure
 the performance of creating and deleting many files. Signed-off-by: Daniel
 Lee <chullee@google.com> --- v3: make sync optional for deletion phase v2:
 Rename command and make fsync optional --- tools/f2fs_io/f2fs_io.c | 146
 ++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.73 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uRXHt-0004Mf-KL
Subject: [f2fs-dev] [PATCH v3] f2fs_io: add test_create_perf command
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
v3: make sync optional for deletion phase
v2: Rename command and make fsync optional
---
 tools/f2fs_io/f2fs_io.c | 146 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6531b55..f6649f1 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2092,6 +2092,151 @@ static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define test_create_perf_desc "measure file creation speed"
+#define test_create_perf_help						\
+"f2fs_io test_create_perf [-s] [-S] <dir> <num_files> <size_kb>\n\n"	\
+"Measures file creation and deletion performance.\n"			\
+"  <dir>          The target directory where files will be created.\n"	\
+"  <num_files>    The total number of files to create and delete.\n"	\
+"  <size_kb>      The size of each file in kb.\n"			\
+"  [-s]           Call fsync() after each file creation.\n"		\
+"  [-S]           Call sync() after deleting all files.\n"
+
+static void do_test_create_perf(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	bool do_fsync = false, do_sync = false;
+	int opt;
+	char *dir;
+	int num_files;
+	int size_kb;
+	char *write_buffer = NULL;
+
+	while ((opt = getopt(argc, argv, "sS")) != -1) {
+		switch (opt) {
+		case 's':
+			do_fsync = true;
+			break;
+		case 'S':
+			do_sync = true;
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
+	printf("Deleting %d created files (sync: %s)\n", num_files,
+		do_sync ? "Enabled" : "Disabled");
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
+
+	if (do_sync)
+		sync();
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
@@ -2140,6 +2285,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_advise),
 	CMD(ioprio),
 	CMD(ftruncate),
+	CMD(test_create_perf),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.50.0.rc2.692.g299adb8693-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
