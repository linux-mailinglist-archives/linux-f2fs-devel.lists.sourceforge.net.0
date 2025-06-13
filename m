Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6FAD8208
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 06:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1NEVVK7fZKSsyGcM6mSlIXHawTJbwbE1YbAU/JuGpmo=; b=KH6xDNKJaTo93bfirY78ayTPdt
	vKOrWmLnhaTKzDHEC7AUq9pB8onc8bSbA4jAjwvX2YXvB1lVDRei/Zw4wS2WEvS/McUeMzifuEOzE
	QHPrexeNfHQQOjypNzEJXTu9gzgvF0spnM8IYl58XlDxwgAn3cz2ecE8yKE8h0w8Yhqk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPvcu-0007Xa-Dr;
	Fri, 13 Jun 2025 04:02:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <326JLaAcKAJg49MDD668GG8D6.4GE@flex--chullee.bounces.google.com>)
 id 1uPvcs-0007XL-UB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 04:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJ78zlq9Xfo2wTJv5Rszk2G4BOzdLRFN0XwAXcfIE1U=; b=IEsO5o2fzbEMOF/HIjZMlESw+9
 yESiCWjkjDc2l0c80JgP1kr2fW8a10GHdO1NwGcVRTxH4Xee5ypW8D5FyFkSFB5MsP/f5GJTgklKI
 1oo6PVY1eHAs155IBKkBjwP5SJH07n+CYdXcuSTuZsymf3LfZyAX5t1TrVtujtkrQYFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hJ78zlq9Xfo2wTJv5Rszk2G4BOzdLRFN0XwAXcfIE1U=; b=R
 cCogMEEDZ4EyClo86dt4xC4C1UP9/2Yl2fE6caGz3Fad3IUyUIKI+KXkrZL2HmcEa+2QfeISYlSam
 gQ6UTp8qcNo9QPyBHFfEEzPVnK4LdXXR669EHc+dbo3Kayqnyg8eUQsJzGPciEpPLZleywxYf6GVg
 5rvPmpmWUpRgaAJA=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPvcs-0000LS-Gf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 04:02:46 +0000
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2358de17665so15246315ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jun 2025 21:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749787356; x=1750392156;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hJ78zlq9Xfo2wTJv5Rszk2G4BOzdLRFN0XwAXcfIE1U=;
 b=Jv9QJtXXpTScwaGOZz0PCSR9lGbNJxsHQdFgUr5KqN/gyqU5ihVR2vGolGvfY3HKxo
 LPsna5R1+LArJOzh5upR2YtAGUJnNoWqo8dmRdfo3j85nw+NyW399gWDXGe6/xf0mh4/
 1Iw8h4aqeEsIWeAz+JGhLFMkpTVhYxw6GtFrT9EtwOb4uf3bZLHFqfCfoQYGiLjJVQJO
 tRMEIgdVJqJAZ+SVWFxELwDO1mBueEjSE5oD0Nt3q+rNSgIgSCs5Ta64Ss4ox7Py83Fg
 ZyiRO8MD4WxAR4hOGfk3bKKgm1zf7LgPEL4HkNuF9KfiCiFyJr8obCYhawFgOzZzdJ0S
 gszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749787356; x=1750392156;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJ78zlq9Xfo2wTJv5Rszk2G4BOzdLRFN0XwAXcfIE1U=;
 b=vaa/Fyl4ROxKSiLagZ64+IA2RtBbNjEXCNFh1dbGCciEbZoL3IUhOEyA+lS9MEDAoI
 7Z4KRFNUDilybnohjXE/Rxy1UXViYRo3unMhrmDcA/HViPg0jgoRbxbYnN3GsLJaN5za
 Do+90FsIx0DzjDBmaH4MkezZmu99GbHwTYE9/yXt9Y3ccAvXPx+fOMvVn4qHQ/TaZgRS
 tsdboMoGqQFkQGc7SeTkEhtV+m7tmO7iXBcxO1+KnPJ7/yHWuyz2SrDigxOnUd6uNa29
 9+asp+Va3U0f6h4UmZFDXPh9iVEPXlASvOmxB7c8eZIxytta55ed44S3wNNNEDHFSKLl
 7NAA==
X-Gm-Message-State: AOJu0YytmsY5I4vmbpKjkEzH5VbD3Zip5pC7lvuCbhzIwrdxheYtH2vq
 ihw+3hVAJ2HggA9Fd34XiZt1QdQYMxQoUctfBjUGaBh2VDjMxGi1IASf3zUoyiHXNieuYO4XeNi
 zIsp4EbBjBA==
X-Google-Smtp-Source: AGHT+IEcExSH3pH3LvqJOijS8gwSComi9Tj2qRnmNBxe1Af0Jfty6jAYrs0KYxHyjEMcCeYWxRSzpc9WI9RJ
X-Received: from plbjz16.prod.google.com ([2002:a17:903:4310:b0:234:c8e7:6fe2])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f682:b0:235:ef87:bd50
 with SMTP id d9443c01a7336-2365dd3d389mr21506985ad.45.1749787355858; Thu, 12
 Jun 2025 21:02:35 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:02:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613040231.170532-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  A new command 'create_speed', has been introduced to measure
 the performance of creating and deleting many files. Signed-off-by: Daniel
 Lee <chullee@google.com> --- tools/f2fs_io/f2fs_io.c | 112
 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+) 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uPvcs-0000LS-Gf
Subject: [f2fs-dev] [PATCH] f2fs_io: add create_speed command
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

A new command 'create_speed', has been introduced to measure
the performance of creating and deleting many files.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 tools/f2fs_io/f2fs_io.c | 112 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6531b55..ea6a3ff 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2092,6 +2092,117 @@ static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define create_speed_desc "create_speed a file"
+#define create_speed_help				\
+"f2fs_io create_speed [dir] [num_files] [size_kb]\n\n"	\
+"Measures file creation and deletion performance.\n"
+
+static void do_create_speed(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	if (argc != 4) {
+		fputs("Usage: f2fs_io create_latency <directory> <num_files> [size_kb]\n", stderr);
+	fputs(cmd->cmd_help, stderr);
+	exit(1);
+	}
+
+	const char *dir = argv[1];
+	int num_files = atoi(argv[2]);
+	int size_kb = atoi(argv[3]);
+	char *write_buffer = NULL;
+
+	if (num_files <= 0) {
+		fprintf(stderr, "Error: Number of files must be positive.\n");
+	exit(1);
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
+	printf("Starting test: Creating %d files of %dKB each in %s\n", num_files, size_kb, dir);
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
+		if (fsync(fd) < 0)
+			perror("Error fsyncing file");
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
@@ -2140,6 +2251,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_advise),
 	CMD(ioprio),
 	CMD(ftruncate),
+	CMD(create_speed),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
