Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7744BAED30B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 05:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3F/5w3+1ju6drmKEchBSdj3KTl/wfz81bHmogf1Dk4=; b=BrNNaQ2M3R20z2D7ejRemYB6p0
	ogduFZCfCb7lHj0Ot7OuI8cSuv0C5BQ18ivoZVxFp1J4VcGyNAHFUu9mTuyZfrosSySiBxeqWnFJa
	7e91lMKnSrWqbypDz0mV0VjWf38xamd3hrEpWm6rx+N4Wt5tZfdczq0L3Q7kWDYXApt4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uW5VQ-0000gU-2g;
	Mon, 30 Jun 2025 03:48:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uW5VP-0000gN-8u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 03:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OREl2Kaq2lmaT+lDN6tfUpP50AbhpukvdrWwfU9VPts=; b=Z10/5fwsV2XY6aRGCbz00r4kzd
 MZLKEvErsBLkAmg+YZWeTpDwgwgPfRAQj3nSc60Nvqp4xoaMpocox8PVhw4pESh5oTuLXzjY8Yg0e
 0W8rZxQ3bsDqGjmOagH5YvuUG28ROEEX1XgWjJoXZocpNLmyMx/9nsqnCMGKYpmjGZPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OREl2Kaq2lmaT+lDN6tfUpP50AbhpukvdrWwfU9VPts=; b=f
 x1aDHecWJkVixX10ZEHBPlc8KuC027h8vIpmxVLkkd/d9J2ISWFZaMFGXJBqy+cDmWvjyMMqmhqP/
 snEceRlS35TFqgLObxIsQl9ACcz/fPDJ6cZ6E1Huml6telKEIWVdFMLIHQHadl6UWf3P0EYIqGPy0
 mlQ6rllOvsMc5754=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uW5VO-0008Q7-KS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 03:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E3B9BA52F46
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jun 2025 03:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9920C4CEF1;
 Mon, 30 Jun 2025 03:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751255299;
 bh=6GZ9gKtl3vBY30QPSWIMc+2Wm+7zjP6ADClsPSHJRHM=;
 h=From:To:Cc:Subject:Date:From;
 b=KoiXX6n8KPiAgHu7qNocPWs582eRifyju/Q0EuDc6SSYf7uxrGs+LidBQ9hh5j08m
 TBs2+pImi4qcz1Yx6twyU/ECNx1wq96jNdZ0Gd9ZMfmP+mEbE4ReFXCz2GqiHZSiXk
 faFyFFz9R+6q/SYxbCyINuFeJ3mEqwC+lILZjtalkSmyMLTuesvSdMyzpu4d546Es0
 Ta/0aT15edkZqgGf3DGZ2TH8ejMZxJJza4frTJcmtjFyeQoBv5bI2eHcKWlDG03qi2
 BavpAglbGqZUMHy+kKvqr1CWDwT1ACmyVAZAXAnCGLCFwW01GaNYQ2C2D1JEqhpBYf
 +KcVK+9HjjC9w==
To: jaegeuk@kernel.org
Date: Mon, 30 Jun 2025 11:48:04 +0800
Message-ID: <20250630034804.48994-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: - mkdir dir - f2fs_io test_lookup_perf -i /mnt/f2fs/dir 50000
 - sync - echo 3 > /proc/sys/vm/drop_caches - f2fs_io test_lookup_perf
 /mnt/f2fs/dir
 Output: Measure readdir performance Measure stat performance Operation:
 total_files, 
 total_time_s, throughput_files_per_sec readdir: 50000, 1.7781, 28120.08 stat:
 50000, 2.1665, 23079.19 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uW5VO-0008Q7-KS
Subject: [f2fs-dev] [PATCH] f2fs_io: measure readdir/stat performance
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

- mkdir dir
- f2fs_io test_lookup_perf -i /mnt/f2fs/dir 50000
- sync
- echo 3 > /proc/sys/vm/drop_caches
- f2fs_io test_lookup_perf /mnt/f2fs/dir

Output:
Measure readdir performance
Measure stat performance
Operation: total_files, total_time_s, throughput_files_per_sec
readdir: 50000, 1.7781, 28120.08
stat: 50000, 2.1665, 23079.19

- f2fs_io test_lookup_perf -v /mnt/f2fs/dir 50000

Output:
inode    file type  d_reclen  d_off    d_name
6176     directory  24        1        .
3        directory  24        2        ..
6276     regular    32        4        test_file_0
6285     regular    32        6        test_file_1
6291     regular    32        8        test_file_2
6295     regular    32        10       test_file_3
....

Signed-off-by: Chao Yu <chao@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 163 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index f6649f1..4f8d66a 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -36,6 +36,8 @@
 #include <time.h>
 #include <unistd.h>
 #include <sys/xattr.h>
+#define _GNU_SOURCE
+#include <dirent.h>
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
@@ -2237,6 +2239,166 @@ static void do_test_create_perf(int argc, char **argv, const struct cmd_desc *cm
 	exit(0);
 }
 
+#define test_lookup_perf_desc "measure readdir/stat speed"
+#define test_lookup_perf_help						\
+"f2fs_io test_lookup_perf [-s] [-S] <dir> <num_files>\n\n"		\
+"Measures readdir/stat performance.\n"				\
+"  <dir>          The target directory in where it will test on.\n"	\
+"  <num_files>    The total number of files the test will initialize or test.\n"\
+"  [-i]           Initialized to create files only.\n"\
+"  [-v]           Verbose mode.\n"
+
+static void do_test_lookup_perf(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct timespec readdir_start, readdir_end;
+	struct timespec stat_start, stat_end;
+	int opt;
+	char *dir;
+	int num_files;
+	bool need_initialize = false;
+	bool verb = false;
+	int i;
+	int fd;
+
+	while ((opt = getopt(argc, argv, "iv")) != -1) {
+		switch (opt) {
+		case 'i':
+			need_initialize = true;
+			break;
+		case 'v':
+			verb = true;
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
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	dir = argv[0];
+	num_files = atoi(argv[1]);
+
+	if (num_files <= 0) {
+		fprintf(stderr, "Error: Number of files must be positive.\n");
+		exit(1);
+	}
+
+	if (need_initialize) {
+		// Initialization Phase
+		printf("Starting test: Creating %d files in %s\n", num_files, dir);
+
+		for (i = 0; i < num_files; i++) {
+			char path[1024];
+
+			snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
+
+			fd = xopen(path, O_WRONLY | O_CREAT, 0644);
+			if (fd < 0)
+				exit(1);
+			close(fd);
+		}
+
+		exit(0);
+	}
+
+	// Measure readdir performance
+	printf("Measure readdir performance\n");
+	clock_gettime(CLOCK_MONOTONIC, &readdir_start);
+
+	fd = xopen(dir, O_DIRECTORY | O_RDONLY, 0644);
+	if (fd < 0)
+		exit(1);
+
+	if (verb)
+		printf("inode    file type  d_reclen  d_off    d_name\n");
+
+	while (1) {
+		char buf[1024];
+		long nr, pos;
+
+		nr = getdents64(fd, buf, 1024);
+		if (nr < 0) {
+			printf("getdents failed, errno:%d\n", errno);
+			break;
+		}
+		if (!nr)
+			break;
+
+		for (pos = 0; pos < nr;) {
+			struct dirent *d;
+
+			d = (struct dirent *)(buf + pos);
+			pos += d->d_reclen;
+
+			if (!verb)
+				continue;
+
+			printf("%-8lu %-10s %-9d %-8jd %s\n",
+				d->d_ino,
+				(d->d_type == DT_REG) ?  "regular" :
+				(d->d_type == DT_DIR) ?  "directory" :
+				(d->d_type == DT_FIFO) ? "FIFO" :
+				(d->d_type == DT_SOCK) ? "socket" :
+				(d->d_type == DT_LNK) ?  "symlink" :
+				(d->d_type == DT_BLK) ?  "block dev" :
+				(d->d_type == DT_CHR) ?  "char dev" : "unknown",
+				d->d_reclen, d->d_off, d->d_name);
+		}
+	}
+
+	close(fd);
+
+	clock_gettime(CLOCK_MONOTONIC, &readdir_end);
+
+	// Measure stat performance
+	printf("Measure stat performance\n");
+
+	clock_gettime(CLOCK_MONOTONIC, &stat_start);
+
+	for (i = 0; i < num_files; i++) {
+		char path[1024];
+		struct stat st;
+
+		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
+		if (stat(path, &st) != 0)
+			die_errno("stat failed");
+	}
+
+	clock_gettime(CLOCK_MONOTONIC, &stat_end);
+
+	long readdir_seconds = readdir_end.tv_sec - readdir_start.tv_sec;
+	long readdir_ns = readdir_end.tv_nsec - readdir_start.tv_nsec;
+	double readdir_time_s = (double)readdir_seconds + (double)readdir_ns / 1000000000.0;
+	double readdir_throughput = (readdir_time_s > 0) ? (num_files / readdir_time_s) : 0;
+
+	long stat_seconds = stat_end.tv_sec - stat_start.tv_sec;
+	long stat_ns = stat_end.tv_nsec - stat_start.tv_nsec;
+	double stat_time_s = (double)stat_seconds + (double)stat_ns / 1000000000.0;
+	double stat_throughput = (stat_time_s > 0) ? (num_files / stat_time_s) : 0;
+
+	printf("Operation: total_files, total_time_s, throughput_files_per_sec\n");
+
+	printf("readdir: %d, %.4f, %.2f\n",
+		   num_files,
+		   readdir_time_s,
+		   readdir_throughput);
+
+	printf("stat: %d, %.4f, %.2f\n",
+		   num_files,
+		   stat_time_s,
+		   stat_throughput);
+
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -2286,6 +2448,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(ioprio),
 	CMD(ftruncate),
 	CMD(test_create_perf),
+	CMD(test_lookup_perf),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
