Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49868B494
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 04:42:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOsPA-0006r3-Vr;
	Mon, 06 Feb 2023 03:42:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pOsP6-0006qx-53
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UAzJmxEBvtTWBoP7IWSqX47I973kIIa0Pfqw9RzjOkM=; b=hofTHWvlzseIYkmPs5DF3LYPcU
 byho7EfW9Q8r119NRx2+Ou+p+LEGI0FFeV7L9IgaWBHk2/calQe2SHg49Wh7plWJ6tgVXiOS3VF+f
 QL3Hrk7NqFQQh///9bd7+cfeEf4UnvzqIH6G3gsHyw+TS56Bn2qkJ/mCXuq069OLoXZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UAzJmxEBvtTWBoP7IWSqX47I973kIIa0Pfqw9RzjOkM=; b=f
 f02Y5SwtiZ3EyHXrr3dmlNm3L0C6zP7boFl+XqOD+KOxl3NQHPAO1X4S4OlIrhcPjrpVQqDeX15zY
 uce7He4PTCDf96mFdzpWBlhlJw639Jq7x0kf3nUv62FRtbR6zq8R2Hr3pTMu85webrIHVwmOHrqJD
 UNOAMtkyobB4W3V8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pOsP3-00CFUx-NJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:42:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7347AB80CD9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Feb 2023 03:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6E8C433EF;
 Mon,  6 Feb 2023 03:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675654962;
 bh=GSKlHn+e0BsEcSKMyv/8X3Wni0JBytYV+Opp851ULMw=;
 h=From:To:Cc:Subject:Date:From;
 b=fYrma1hVzA1VRPdLwLb6TmiE1oQCJOusGZpqFMBn4n+YRDoNGlcj3btakACbPMqrA
 wV2nphHYOFm8EWTZT1Yj+zc07O62U1c109QKiSsHCTZkUtC0OaruUWtupkSkW4pwdr
 kM0fmmebimB2QdA8dURKvd6ko7H1UnaAQ882Ww79tlp5SCQOiqCnetpo56fUa0aWRT
 Tt7/ZctqsWTARfXDJLj445LExXtht8/+lZkzPk45O4h4ppzmOKkF3WMBNW2LTo0nuG
 13VJ8ryflpzUpbgK6wV95V2Odu4DhlOEpBHvqx8VCNggW68XNcaDExaI7cz1ucxk+k
 26ZptfhilZ9Vg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun,  5 Feb 2023 19:42:34 -0800
Message-Id: <20230206034234.723684-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's remove this. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- .gitignore | 1 - tools/Makefile.am | 3 +- tools/f2fstat.c | 311 3 files
 changed, 1 insertion(+), 314 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pOsP3-00CFUx-NJ
Subject: [f2fs-dev] [PATCH] f2fs-tools: Remove deprecated f2fstat
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's remove this.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 .gitignore        |   1 -
 tools/Makefile.am |   3 +-
 tools/f2fstat.c   | 311 ----------------------------------------------
 3 files changed, 1 insertion(+), 314 deletions(-)
 delete mode 100644 tools/f2fstat.c

diff --git a/.gitignore b/.gitignore
index 9acac42bf331..49809446793d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,7 +46,6 @@ stamp-h1
 
 /mkfs/mkfs.f2fs
 /fsck/fsck.f2fs
-/tools/f2fstat
 /tools/fibmap.f2fs
 /tools/parse.f2fs
 /tools/f2fscrypt
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 8dd963a14144..6b03814463bc 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -2,11 +2,10 @@
 
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall
-sbin_PROGRAMS = f2fstat
+sbin_PROGRAMS =
 if !WINDOWS
 sbin_PROGRAMS += fibmap.f2fs parse.f2fs
 endif
-f2fstat_SOURCES = f2fstat.c
 fibmap_f2fs_SOURCES = fibmap.c
 parse_f2fs_SOURCES = f2fs_io_parse.c
 
diff --git a/tools/f2fstat.c b/tools/f2fstat.c
deleted file mode 100644
index 5b4d68351756..000000000000
--- a/tools/f2fstat.c
+++ /dev/null
@@ -1,311 +0,0 @@
-#include <stdio.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <libgen.h>
-
-#ifdef DEBUG
-#define dbg(fmt, args...)	printf(fmt, __VA_ARGS__);
-#else
-#define dbg(fmt, args...)
-#endif
-
-/*
- * f2fs status
- */
-#define F2FS_STATUS	"/sys/kernel/debug/f2fs/status"
-
-#define KEY_NODE	0x00000001
-#define KEY_META	0x00000010
-
-unsigned long util;
-unsigned long used_node_blks;
-unsigned long used_data_blks;
-//unsigned long inline_inode;
-
-unsigned long free_segs;
-unsigned long valid_segs;
-unsigned long dirty_segs;
-unsigned long prefree_segs;
-
-unsigned long gc, bg_gc;
-unsigned long cp;
-unsigned long gc_data_blks;
-unsigned long gc_node_blks;
-
-//unsigned long extent_hit_ratio;
-
-unsigned long dirty_node, node_kb;
-unsigned long dirty_dents;
-unsigned long dirty_meta, meta_kb;
-unsigned long nat_caches;
-unsigned long dirty_sit;
-
-unsigned long free_nids;
-
-unsigned long ssr_blks;
-unsigned long lfs_blks;
-unsigned long memory_kb;
-
-struct options {
-	int delay;
-	int interval;
-	char partname[32];
-};
-
-struct mm_table {
-	const char *name;
-	unsigned long *val;
-	int flag;
-};
-
-static int compare_mm_table(const void *a, const void *b)
-{
-	dbg("[COMPARE] %s, %s\n", ((struct mm_table *)a)->name, ((struct mm_table *)b)->name);
-	return strcmp(((struct mm_table *)a)->name, ((struct mm_table *)b)->name);
-}
-
-static inline void remove_newline(char **head)
-{
-again:
-	if (**head == '\n') {
-		*head = *head + 1;
-		goto again;
-	}
-}
-
-void f2fstat(struct options *opt)
-{
-	int fd;
-	int ret;
-	char keyname[32];
-	char buf[4096];
-	struct mm_table key = { keyname, NULL, 0 };
-	struct mm_table *found;
-	int f2fstat_table_cnt;
-	char *head, *tail;
-	int found_cnt = 0;
-
-	static struct mm_table f2fstat_table[] = {
-		{ "  - Data",		&used_data_blks,	0 },
-		{ "  - Dirty",		&dirty_segs,		0 },
-		{ "  - Free",		&free_segs,		0 },
-		{ "  - NATs",		&nat_caches,		0 },
-		{ "  - Node",		&used_node_blks,	0 },
-		{ "  - Prefree",	&prefree_segs,		0 },
-		{ "  - SITs",		&dirty_sit,		0 },
-		{ "  - Valid",		&valid_segs,		0 },
-		{ "  - dents",		&dirty_dents,		0 },
-		{ "  - free_nids",	&free_nids,		0 },
-		{ "  - meta",		&dirty_meta,		KEY_META },
-		{ "  - nodes",		&dirty_node,		KEY_NODE },
-		{ "CP calls",		&cp,			0 },
-		{ "GC calls",		&gc,			0 },
-		{ "LFS",		&lfs_blks,		0 },
-		{ "Memory",		&memory_kb,		0 },
-		{ "SSR",		&ssr_blks,		0 },
-		{ "Utilization",	&util,			0 },
-	};
-
-	f2fstat_table_cnt = sizeof(f2fstat_table)/sizeof(struct mm_table);
-
-	fd = open(F2FS_STATUS, O_RDONLY);
-	if (fd < 0) {
-		perror("open " F2FS_STATUS);
-		exit(EXIT_FAILURE);
-	}
-
-	ret = read(fd, buf, 4096);
-	if (ret < 0) {
-		perror("read " F2FS_STATUS);
-		exit(EXIT_FAILURE);
-	}
-	buf[ret] = '\0';
-
-	head = buf;
-
-	if (opt->partname[0] != '\0') {
-		head = strstr(buf, opt->partname);
-		if (head == NULL)
-			exit(EXIT_FAILURE);
-	}
-
-	for (;;) {
-		remove_newline(&head);
-		tail = strchr(head, ':');
-		if (!tail)
-			break;
-		*tail = '\0';
-		if (strlen(head) >= sizeof(keyname)) {
-			dbg("[OVER] %s\n", head);
-			*tail = ':';
-			tail = strchr(head, '\n');
-			head = tail + 1;
-			continue;
-		}
-
-		strcpy(keyname, head);
-
-		found = bsearch(&key, f2fstat_table, f2fstat_table_cnt, sizeof(struct mm_table), compare_mm_table);
-		dbg("[RESULT] %s (%s)\n", head, (found) ? "O" : "X");
-		head = tail + 1;
-		if (!found)
-			goto nextline;
-
-		*(found->val) = strtoul(head, &tail, 10);
-		if (found->flag) {
-			int npages;
-			tail = strstr(head, "in");
-			head = tail + 2;
-			npages = strtoul(head, &tail, 10);
-			switch (found->flag & (KEY_NODE | KEY_META)) {
-			case KEY_NODE:
-				node_kb = npages * 4;
-				break;
-			case KEY_META:
-				meta_kb = npages * 4;
-				break;
-			}
-		}
-		if (++found_cnt == f2fstat_table_cnt)
-			break;
-nextline:
-		tail = strchr(head, '\n');
-		if (!tail)
-			break;
-		head =  tail + 1;
-	}
-
-	close(fd);
-}
-
-void usage(void)
-{
-	printf("Usage: f2fstat [option]\n"
-			"    -d    delay (secs)\n"
-			"    -i    interval of head info\n"
-			"    -p    partition name (e.g. /dev/sda3)\n");
-	exit(EXIT_FAILURE);
-}
-
-void parse_option(int argc, char *argv[], struct options *opt)
-{
-	int option;
-	const char *option_string = "d:i:p:h";
-
-	while ((option = getopt(argc, argv, option_string)) != EOF) {
-		switch (option) {
-		case 'd':
-			opt->delay = atoi(optarg);
-			break;
-		case 'i':
-			opt->interval = atoi(optarg);
-			break;
-		case 'p':
-			strcpy(opt->partname, basename(optarg));
-			break;
-		default:
-			usage();
-			break;
-		}
-	}
-}
-
-void __make_head(char *head, int index, int i, int len)
-{
-	char name_h[5][20] = {"main segments", "page/slab caches", "cp/gc", "blks", "memory"};
-	int half = (len - strlen(name_h[i])) / 2;
-
-	*(head + index) = '|';
-	index++;
-	memset(head + index, '-', half);
-	index += half;
-	strcpy(head + index, name_h[i]);
-	index += strlen(name_h[i]);
-	memset(head + index, '-', half);
-}
-
-void print_head(char *res)
-{
-	char *ptr, *ptr_buf;
-	char buf[1024], head[1024];
-	char name[20][10] = {"util", "node", "data", "free", "valid", "dirty", "prefree", "node", "dent", "meta",
-		"sit", "nat", "fnid", "cp", "gc", "ssr", "lfs", "total", "node", "meta"};
-	int i, len, prev_index = 0;
-
-	ptr_buf = buf;
-	memset(buf, ' ', 1024);
-	memset(head, ' ', 1024);
-
-	for (i = 0; i < 20; i++) {
-		ptr = (i == 0) ? strtok(res, " ") : strtok(NULL, " ");
-		strcpy(ptr_buf, name[i]);
-		if (i == 1) {
-			prev_index = ptr_buf - buf - 1;
-		} else if (i == 7) {
-			len = (ptr_buf - buf) - 1 - prev_index;
-			__make_head(head, prev_index, 0, len);
-			prev_index = ptr_buf - buf - 1;
-		} else if (i == 13) {
-			len = (ptr_buf - buf) - 1 - prev_index;
-			__make_head(head, prev_index, 1, len);
-			prev_index = ptr_buf - buf - 1;
-		} else if (i == 15) {
-			len = (ptr_buf - buf) - 1 - prev_index;
-			__make_head(head, prev_index, 2, len);
-			prev_index = ptr_buf - buf - 1;
-		} else if (i == 17) {
-			len = (ptr_buf - buf) - 1 - prev_index;
-			__make_head(head, prev_index, 3, len);
-			prev_index = ptr_buf - buf - 1;
-		}
-
-		len = strlen(ptr);
-		ptr_buf += (len > strlen(name[i]) ? len : strlen(name[i])) + 1;
-	}
-
-	len = (ptr_buf - buf) - 1 - prev_index;
-	__make_head(head, prev_index, 4, len);
-
-	*ptr_buf = 0;
-	*(head + (ptr_buf - buf - 1)) = '|';
-	*(head + (ptr_buf - buf)) = 0;
-	fprintf(stderr, "%s\n%s\n", head, buf);
-}
-
-int main(int argc, char *argv[])
-{
-	char format[] = "%4ld %4ld %4ld %4ld %5ld %5ld %7ld %4ld %4ld %4ld %3ld %3ld %4ld %2ld %2ld %3ld %3ld %5ld %4ld %4ld";
-	char buf[1024], tmp[1024];
-	int head_interval;
-	struct options opt = {
-		.delay = 1,
-		.interval = 20,
-		.partname = { 0, },
-	};
-
-	parse_option(argc, argv, &opt);
-	head_interval = opt.interval;
-
-	while (1) {
-		memset(buf, 0, 1024);
-		f2fstat(&opt);
-		sprintf(buf, format, util, used_node_blks, used_data_blks,
-			free_segs, valid_segs, dirty_segs, prefree_segs,
-			dirty_node, dirty_dents, dirty_meta, dirty_sit, nat_caches, free_nids,
-			cp, gc, ssr_blks, lfs_blks, memory_kb, node_kb, meta_kb);
-
-		strcpy(tmp, buf);
-		if (head_interval == opt.interval)
-			print_head(tmp);
-		if (head_interval-- == 0)
-			head_interval = opt.interval;
-
-		fprintf(stderr, "%s\n", buf);
-
-		sleep(opt.delay);
-	}
-
-	return 0;
-}
-- 
2.39.1.519.gcb327c4b5f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
