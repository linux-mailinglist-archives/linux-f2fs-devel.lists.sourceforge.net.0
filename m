Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C595B2D0AD2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 07:44:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmAFd-0005YU-Hf; Mon, 07 Dec 2020 06:44:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kmAFc-0005YH-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 06:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+0MMu9Yk3xQcG9HlE8Z8gxjUFVtowgra6fXcfoBWksE=; b=JJbe3kbp6vqNhkwWfDgRv+/FWr
 iaZ3xWw1Mcn7ZqyXw4dwLHr2ROho1xgkrMKj4GE/z4pHI9qxOknrYpLfLt6f3Fq+mBqfPeOV+5z0g
 KJ7zs10Pz/L61ejzMAB5LXlCOOaqyE6cs+16JrOa2Grf27jfjlDtd0LV5fOX46/0I9S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+0MMu9Yk3xQcG9HlE8Z8gxjUFVtowgra6fXcfoBWksE=; b=kpH4dp7vYOjUIQVt2otdNLUN3d
 Lzx14msQ4+hgfHvV52axb2ZdCC80VydVtH8PZpj409yw54jyrFB7BLlcW4wbQrIv+rt8+PjzTa/53
 TQ3mMsHRpROS9byJ+uiqIWmvUT6KVTlUX3zUDxzkkOBml0GFXFhXhG0VUyIDZ9/40Zqc=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmAFV-001cDy-BP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 06:44:00 +0000
Received: by mail-pf1-f181.google.com with SMTP id q22so8804308pfk.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 06 Dec 2020 22:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0MMu9Yk3xQcG9HlE8Z8gxjUFVtowgra6fXcfoBWksE=;
 b=XxjlOKfzdJMUKs9UuOXp1StqdnVMa7aDufjQvNx3I5+kAUcWOTUsGRNAXzA1U/+vOq
 l8Z8bRAG1LjoKW3IuApzAmtMJzHte881k7Wv+pizngPLBiGLilPzpu6PgNciz03NZ2d2
 xzNmJUC6jEset3XQTkhYjZ8iiQk+DOTstq1SGydndrcupgPZ607k+IRSOsgE3y0Uw0rf
 W1PB7YS1tzdmlaTJXetS56jMZO/lhorYA++Oga/D0nJOdgAPfGXOeybR41OJyYX5AvqA
 DW9RpYHdTaeKwyz0/SMmbjAg/+B21MXHEkraCSK0q5BNQglRcG4AhWE9iWRWoNyzHT1F
 0udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0MMu9Yk3xQcG9HlE8Z8gxjUFVtowgra6fXcfoBWksE=;
 b=IEN/ysC2CW9Uge49hr7JOtHXpaBbSh68WtsKum2+nhN6m8bbg3C+owXEjuGETXfKED
 CDDtDaC6oRVqGHnEqWmQtwnDh8p05PrLtaW6PV4LZGIylbP9Bff0+1YEdwDAgNBREfSb
 9yspTSeVvh0UZ5u/wuAsdovW9GGOstw+nYCldpjog03y7KIb+YvXQZd0aGtWq6eW2BCc
 q4NpzesOKfxXE4jNE2AnFVppDlFad3FohjJQSoBE3bm66k+hKDsj2GpWMwryJwItaKzN
 IMaj5OIVP0+AB5OQIG/WgpMd59CHOzI3bIj+JSU47VuizrdEkztPxHmw/FzHdTbJ7eWt
 7ZDQ==
X-Gm-Message-State: AOAM530czF9tkpyJyyPT3Q143EEsiF18nsB3NxkEMRT4hBStHc6JPXVo
 Nzwlv9KG/dnJjEBZeoRdsSpRgr1vzrw=
X-Google-Smtp-Source: ABdhPJw7dVWANeb7KTlHpRirqOwFXQiqfpNiIFruT43UJjuxH/cGxobSBd/+BRZC43t2KHhYdrtZhg==
X-Received: by 2002:aa7:9698:0:b029:19d:d63f:d2d2 with SMTP id
 f24-20020aa796980000b029019dd63fd2d2mr8138101pfk.4.1607323419989; 
 Sun, 06 Dec 2020 22:43:39 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id o9sm9079984pjl.11.2020.12.06.22.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 22:43:39 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Mon,  7 Dec 2020 14:42:49 +0800
Message-Id: <20201207064250.272240-3-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201207064250.272240-1-robinh3123@gmail.com>
References: <20201207064250.272240-1-robinh3123@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmAFV-001cDy-BP
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs-tools:sload.f2fs compression support
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Add F2FS compression support for sload
* Support file extension filter, either default-accept or default-deny
  policy
* Support choice of compression algorithm, LZO (version 2) or LZ4
  (default)
* Support custom log of cluster size
* Support minimum number of compressed blocks per cluster (default 1).
  A cluster will not be compressed if the number can not be met.
* suuport -r (read-only) option

Bug: 161486536
Test: Tested on Android & Ubuntu PC
Signed-off-by: Robin Hsu <robinhsu@google.com>
Change-Id: I67f1a40df92a31b7c3d4383c49839359cc534b56
---
 fsck/compress_wrapper.c | 102 ++++++++++++++++++++
 fsck/compress_wrapper.h |  22 +++++
 fsck/fsck.h             |  15 +++
 fsck/main.c             | 141 +++++++++++++++++++++++++++-
 fsck/segment.c          | 202 +++++++++++++++++++++++++++++++++++++---
 fsck/sload.c            |  67 +++++++++++++
 include/f2fs_fs.h       |  76 ++++++++++++++-
 lib/libf2fs_io.c        |  33 +++++++
 8 files changed, 644 insertions(+), 14 deletions(-)
 create mode 100644 fsck/compress_wrapper.c
 create mode 100644 fsck/compress_wrapper.h

diff --git a/fsck/compress_wrapper.c b/fsck/compress_wrapper.c
new file mode 100644
index 0000000..2cdc4fd
--- /dev/null
+++ b/fsck/compress_wrapper.c
@@ -0,0 +1,102 @@
+/**
+ * compress_wrapper.c
+ *
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *   : initial created, for sload compression support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include "f2fs.h" /* for config.h for general environment (non-Android) */
+
+#include "compress_wrapper.h"
+#ifdef HAVE_LIBLZO2
+#include <lzo/lzo1x.h> /* for lzo1x_1_15_compress() */
+#endif
+#ifdef HAVE_LIBLZ4
+#include <lz4.h> /* for LZ4_compress_fast_extState() */
+#endif
+
+/*
+ * macro/constants borrowed from kernel header (GPL-2.0):
+ * include/linux/lzo.h, and include/linux/lz4.h
+ */
+#ifdef HAVE_LIBLZO2
+#define lzo1x_worst_compress(x)		((x) + (x) / 16 + 64 + 3 + 2)
+#define LZO_WORK_SIZE			ALIGN_UP(LZO1X_1_15_MEM_COMPRESS, 8)
+#endif
+#ifdef HAVE_LIBLZ4
+#define LZ4_MEMORY_USAGE		14
+#define LZ4_MAX_INPUT_SIZE		0x7E000000 /* 2 113 929 216 bytes */
+#define LZ4_STREAMSIZE			(LZ4_STREAMSIZE_U64 * sizeof(long long))
+#define LZ4_MEM_COMPRESS		LZ4_STREAMSIZE
+#define LZ4_ACCELERATION_DEFAULT	1
+#define LZ4_WORK_SIZE			ALIGN_UP(LZ4_MEM_COMPRESS, 8)
+#endif
+
+#ifdef HAVE_LIBLZO2
+static void lzo_compress_init(struct compress_ctx *cc)
+{
+	size_t size = cc->cluster_size * F2FS_BLKSIZE;
+	size_t alloc = size + lzo1x_worst_compress(size)
+			+ COMPRESS_HEADER_SIZE + LZO_WORK_SIZE;
+	ASSERT((cc->private = qbuf_alloc(alloc)) != NULL);
+	cc->rbuf = (char *) cc->private + LZO_WORK_SIZE;
+	cc->cbuf = (struct compress_data *)((char *) cc->rbuf + size);
+}
+
+static int lzo_compress(struct compress_ctx *cc)
+{
+	int ret = lzo1x_1_15_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
+			(lzo_uintp)(&cc->clen), cc->private);
+	cc->cbuf->clen = cpu_to_le32(cc->clen);
+	return ret;
+}
+#endif
+
+#ifdef HAVE_LIBLZ4
+static void lz4_compress_init(struct compress_ctx *cc)
+{
+	size_t size = cc->cluster_size * F2FS_BLKSIZE;
+	size_t alloc = size + LZ4_COMPRESSBOUND(size)
+			+ COMPRESS_HEADER_SIZE + LZ4_WORK_SIZE;
+	ASSERT((cc->private = qbuf_alloc(alloc)) != NULL);
+	cc->rbuf = (char *) cc->private + LZ4_WORK_SIZE;
+	cc->cbuf = (struct compress_data *)((char *) cc->rbuf + size);
+}
+
+static int lz4_compress(struct compress_ctx *cc)
+{
+	cc->clen = LZ4_compress_fast_extState(cc->private, cc->rbuf,
+			(char *)cc->cbuf->cdata, cc->rlen,
+			cc->rlen - F2FS_BLKSIZE * c.sldc_min_cbpc,
+			LZ4_ACCELERATION_DEFAULT);
+
+	if (!cc->clen)
+		return 1;
+
+	cc->cbuf->clen = cpu_to_le32(cc->clen);
+	return 0;
+}
+#endif
+
+const char *ca_names[] = {
+	"LZO",
+	"LZ4",
+	"", /* end of the name list */
+};
+
+compress_ops compr_ops[] = {
+#ifdef HAVE_LIBLZO2
+	{lzo_compress_init, lzo_compress},
+#else
+	{NULL, NULL},
+#endif
+#ifdef HAVE_LIBLZ4
+	{lz4_compress_init, lz4_compress},
+#else
+	{NULL, NULL},
+#endif
+};
diff --git a/fsck/compress_wrapper.h b/fsck/compress_wrapper.h
new file mode 100644
index 0000000..ec33d43
--- /dev/null
+++ b/fsck/compress_wrapper.h
@@ -0,0 +1,22 @@
+/**
+ * compress_wrapper.h
+ *
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *   : initial created, for sload compression support
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add sload compression support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef COMPRESS_WRAPPER_H
+#define COMPRESS_WRAPPER_H
+
+#include "f2fs_fs.h"
+extern compress_ops compr_ops[]; /* [0]: LZO, [1]: LZ4, */
+
+#endif /* COMPRESS_WRAPPER_H */
diff --git a/fsck/fsck.h b/fsck/fsck.h
index c5e85fe..4e866ec 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -3,6 +3,9 @@
  *
  * Copyright (c) 2013 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add sload compression support
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -266,6 +269,9 @@ int f2fs_resize(struct f2fs_sb_info *);
 
 /* sload.c */
 int f2fs_sload(struct f2fs_sb_info *);
+void sldc_erase_bufs(struct compress_ctx *cc);
+void sload_countblk(void);
+extern struct ext_tbl_op ext_filter;
 
 /* segment.c */
 int reserve_new_block(struct f2fs_sb_info *, block_t *,
@@ -282,7 +288,16 @@ block_t new_node_block(struct f2fs_sb_info *,
 struct quota_file;
 u64 f2fs_quota_size(struct quota_file *);
 u64 f2fs_read(struct f2fs_sb_info *, nid_t, u8 *, u64, pgoff_t);
+enum wr_addr_type {
+	WR_NORMAL = 1,
+	WR_COMPRESS_DATA = 2,
+	WR_NULL_ADDR = NULL_ADDR,  /* 0 */
+	WR_NEW_ADDR = NEW_ADDR, /* -1U */
+	WR_COMPRESS_ADDR = COMPRESS_ADDR, /* -2U */
+};
 u64 f2fs_write(struct f2fs_sb_info *, nid_t, u8 *, u64, pgoff_t);
+u64 f2fs_write_compress_data(struct f2fs_sb_info *, nid_t, u8 *, u64, pgoff_t);
+u64 f2fs_write_addrtag(struct f2fs_sb_info *, nid_t, pgoff_t, unsigned int);
 void f2fs_filesize_update(struct f2fs_sb_info *, nid_t, u64);
 
 int get_dnode_of_data(struct f2fs_sb_info *, struct dnode_of_data *,
diff --git a/fsck/main.c b/fsck/main.c
index b20498f..001eed0 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -13,6 +13,9 @@
  * Copyright (c) 2019 Google Inc.
  *   Robin Hsu <robinhsu@google.com>
  *  : add cache layer
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add sload compression support
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -25,6 +28,7 @@
 #include <getopt.h>
 #include <stdbool.h>
 #include "quotaio.h"
+#include "compress_wrapper.h"
 
 struct f2fs_fsck gfsck;
 
@@ -134,6 +138,17 @@ void sload_usage()
 	MSG(0, "  -S sparse_mode\n");
 	MSG(0, "  -t mount point [prefix of target fs path, default:/]\n");
 	MSG(0, "  -T timestamp\n");
+	MSG(0, "  -c enable compression (default allow policy)\n");
+	MSG(0, "    ------------ Compression sub-options -----------------\n");
+	MSG(0, "    -L <log-of-blocks-per-cluster>, default 2\n");
+	MSG(0, "    -a <algorithm> compression algorithm, default LZ4\n");
+	MSG(0, "    -x <ext> compress files except for these extensions.\n");
+	MSG(0, "    -i <ext> compress files with these extensions only.\n");
+	MSG(0, "    * -i or -x: use it many times for multiple extensions.\n");
+	MSG(0, "    * -i and -x cannot be used together..\n");
+	MSG(0, "    -m <num> min compressed blocks per cluster\n");
+	MSG(0, "    -r readonly (IMMUTABLE) for compressed files\n");
+	MSG(0, "    ------------------------------------------------------\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -V print the version number and exit\n");
 	exit(1);
@@ -534,7 +549,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("sload.f2fs", prog)) {
 #ifdef WITH_SLOAD
-		const char *option_string = "C:d:f:p:s:St:T:V";
+		const char *option_string = "cL:a:i:x:m:rC:d:f:p:s:St:T:V";
 #ifdef HAVE_LIBSELINUX
 		int max_nr_opt = (int)sizeof(c.seopt_file) /
 			sizeof(c.seopt_file[0]);
@@ -543,8 +558,82 @@ void f2fs_parse_options(int argc, char *argv[])
 		char *p;
 
 		c.func = SLOAD;
+		c.sldc_cc.log_cluster_size = 2;
+		c.sldc_ca = CA_LZ4;
+		c.sldc_min_cbpc = 1;
+		c.sldc_ef = &ext_filter;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
+			unsigned int i;
+			int val;
+
 			switch (option) {
+			case 'c': /* compression support */
+				c.sldc_en = true;
+				break;
+			case 'L': /* compression: log of blocks-per-cluster */
+				c.sldc_got_opt = true;
+				val = atoi(optarg);
+				if (val < MIN_COMPRESS_LOG_SIZE ||
+						val > MAX_COMPRESS_LOG_SIZE) {
+					MSG(0, "\tError: log of blocks per"
+						" cluster must be in the range"
+						" of %d .. %d.\n",
+						MIN_COMPRESS_LOG_SIZE,
+						MAX_COMPRESS_LOG_SIZE);
+					error_out(prog);
+				}
+				c.sldc_cc.log_cluster_size = val;
+				break;
+			case 'a': /* compression: choose algorithm */
+				c.sldc_got_opt = true;
+				c.sldc_ca = (u8)-1;
+				for (i = 0; ca_names[i][0] != 0; i++) {
+					if (!strcmp(ca_names[i], optarg)) {
+						c.sldc_ca = i;
+						break;
+					}
+				}
+				if (c.sldc_ca == (u8)-1) {
+					MSG(0, "\tError: Unknown compression"
+						" algorithm %s\n", optarg);
+					error_out(prog);
+				}
+				break;
+			case 'i': /* compress only these extensions */
+				c.sldc_got_opt = true;
+				if (c.sldc_policy == FP_ALLOW) {
+					MSG(0, "\tError: could not mix option"
+							" -i and -x\n");
+					error_out(prog);
+				}
+				c.sldc_policy = FP_DENY;
+				c.sldc_ef->add(optarg);
+				break;
+			case 'x': /* compress except for these extensions */
+				c.sldc_got_opt = true;
+				if (c.sldc_policy == FP_DENY) {
+					MSG(0, "\tError: could not mix option"
+							" -i and -x\n");
+					error_out(prog);
+				}
+				c.sldc_policy = FP_ALLOW;
+				c.sldc_ef->add(optarg);
+				break;
+			case 'm': /* minimum compressed blocks per cluster */
+				c.sldc_got_opt = true;
+				val = atoi(optarg);
+				if (val <= 0) {
+					MSG(0, "\tError: minimum compressed"
+						" blocks per cluster must be"
+						" positive.\n");
+					error_out(prog);
+				}
+				c.sldc_min_cbpc = val;
+				break;
+			case 'r': /* compress file to set IMMUTABLE */
+				c.sldc_got_opt = true;
+				c.sldc_immutable = true;
+				break;
 			case 'C':
 				c.fs_config_file = absolute_path(optarg);
 				break;
@@ -602,6 +691,27 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+		if (c.sldc_got_opt && !c.sldc_en) {
+			MSG(0, "\tError: compression sub-options are used"
+				" without the compression enable (-c) option\n"
+			);
+			error_out(prog);
+		}
+		if (err == NOERROR && c.sldc_en) {
+			c.sldc_cc.cluster_size = 1
+				<< c.sldc_cc.log_cluster_size;
+			if (c.sldc_policy == FP_UNASSIGNED)
+				c.sldc_policy = FP_ALLOW;
+			if (c.sldc_min_cbpc >= c.sldc_cc.cluster_size) {
+				MSG(0, "\tError: minimum reduced blocks by"
+					" compression per cluster must be at"
+					" most one less than blocks per"
+					" cluster, i.e. %d\n",
+					c.sldc_cc.cluster_size - 1);
+				error_out(prog);
+			}
+			qbuf_init();
+		}
 #endif /* WITH_SLOAD */
 	}
 
@@ -812,6 +922,27 @@ static int do_resize(struct f2fs_sb_info *sbi)
 #endif
 
 #ifdef WITH_SLOAD
+int init_compr(struct f2fs_sb_info *sbi)
+{
+	if (!(sbi->raw_super->feature
+			& cpu_to_le32(F2FS_FEATURE_COMPRESSION))) {
+		MSG(0, "Error: Compression (-c) was requested "
+			"but the file system is not created "
+			"with such feature.\n");
+		return -1;
+	}
+	if (compr_ops[c.sldc_ca].init == NULL) {
+		MSG(0, "Error: The selected compression algorithm is not"
+				" supported\n");
+		return -1;
+	}
+	c.sldc_compr = compr_ops + c.sldc_ca;
+	c.sldc_compr->init(&c.sldc_cc);
+	sldc_erase_bufs(&c.sldc_cc);
+	c.sldc_cc.rlen = c.sldc_cc.cluster_size * F2FS_BLKSIZE;
+	return 0;
+}
+
 static int do_sload(struct f2fs_sb_info *sbi)
 {
 	if (!c.from_dir) {
@@ -821,6 +952,11 @@ static int do_sload(struct f2fs_sb_info *sbi)
 	if (!c.mount_point)
 		c.mount_point = "/";
 
+	if (c.sldc_en) {
+		if (init_compr(sbi))
+			return -1;
+	}
+
 	return f2fs_sload(sbi);
 }
 #endif
@@ -971,6 +1107,9 @@ retry:
 		return ret2;
 	}
 
+	if (c.func == SLOAD)
+		c.sldc_ef->destroy();
+
 	printf("\nDone: %lf secs\n", (get_boottime_ns() - start) / 1000000000.0);
 	return ret;
 
diff --git a/fsck/segment.c b/fsck/segment.c
index 0487f41..e4c8cea 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -8,6 +8,9 @@
  *   Hou Pengyang <houpengyang@huawei.com>
  *   Liu Shuoran <liushuoran@huawei.com>
  *   Jaegeuk Kim <jaegeuk@kernel.org>
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add sload compression support
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -16,6 +19,7 @@
 #include "fsck.h"
 #include "node.h"
 #include "quotaio.h"
+#include "compress_wrapper.h"
 
 int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 			struct f2fs_summary *sum, int type, bool is_inode)
@@ -228,8 +232,14 @@ u64 f2fs_read(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 	return read_count;
 }
 
-u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
-					u64 count, pgoff_t offset)
+/*
+ * Do not call this function directly.  Instead, call one of the following:
+ *     u64 f2fs_write();
+ *     u64 f2fs_write_compress_data();
+ *     u64 f2fs_write_addrtag();
+ */
+static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
+		u64 count, pgoff_t offset, enum wr_addr_type addr_type)
 {
 	struct dnode_of_data dn;
 	struct node_info ni;
@@ -243,6 +253,19 @@ u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 	void* index_node = NULL;
 	int idirty = 0;
 	int err;
+	bool has_data = (addr_type == WR_NORMAL
+			|| addr_type == WR_COMPRESS_DATA);
+
+	if (count == 0)
+		return 0;
+
+	/*
+	 * Enforce calling from f2fs_write(), f2fs_write_compress_data(),
+	 * and f2fs_write_addrtag().   Beside, check if is properly called.
+	 */
+	ASSERT((!has_data && buffer == NULL) || (has_data && buffer != NULL));
+	if (addr_type != WR_NORMAL)
+		ASSERT(offset % F2FS_BLKSIZE == 0); /* block boundary only */
 
 	/* Memory allocation for block buffer and inode. */
 	blk_buffer = calloc(BLOCK_SZ, 2);
@@ -265,15 +288,26 @@ u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 			if (err)
 				break;
 			idirty |= dn.idirty;
-			if (index_node)
-				free(index_node);
+			free(index_node);
 			index_node = (dn.node_blk == dn.inode_blk) ?
-							NULL : dn.node_blk;
+					NULL : dn.node_blk;
 			remained_blkentries = ADDRS_PER_PAGE(sbi,
-						dn.node_blk, dn.inode_blk);
+					dn.node_blk, dn.inode_blk) -
+					dn.ofs_in_node;
 		}
 		ASSERT(remained_blkentries > 0);
 
+		if (!has_data) {
+			dn.data_blkaddr = addr_type;
+			set_data_blkaddr(&dn);
+			idirty |= dn.idirty;
+			if (dn.ndirty)
+				ASSERT(dev_write_block(dn.node_blk,
+						dn.node_blkaddr) >= 0);
+			written_count = 0;
+			break;
+		}
+
 		blkaddr = datablock_addr(dn.node_blk, dn.ofs_in_node);
 		if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR) {
 			err = new_data_block(sbi, blk_buffer,
@@ -281,6 +315,7 @@ u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 			if (err)
 				break;
 			blkaddr = dn.data_blkaddr;
+			idirty |= dn.idirty;
 		}
 
 		off_in_blk = offset % BLOCK_SZ;
@@ -305,9 +340,10 @@ u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 
 		dn.ofs_in_node++;
 		if ((--remained_blkentries == 0 || count == 0) && (dn.ndirty))
-			ASSERT(dev_write_block(dn.node_blk, dn.node_blkaddr) >= 0);
+			ASSERT(dev_write_block(dn.node_blk, dn.node_blkaddr)
+					>= 0);
 	}
-	if (offset > le64_to_cpu(inode->i.i_size)) {
+	if (addr_type == WR_NORMAL && offset > le64_to_cpu(inode->i.i_size)) {
 		inode->i.i_size = cpu_to_le64(offset);
 		idirty = 1;
 	}
@@ -315,13 +351,33 @@ u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 		ASSERT(inode == dn.inode_blk);
 		ASSERT(write_inode(inode, ni.blk_addr) >= 0);
 	}
-	if (index_node)
-		free(index_node);
+
+	free(index_node);
 	free(blk_buffer);
 
 	return written_count;
 }
 
+u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
+					u64 count, pgoff_t offset)
+{
+	return f2fs_write_ex(sbi, ino, buffer, count, offset, WR_NORMAL);
+}
+
+u64 f2fs_write_compress_data(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
+					u64 count, pgoff_t offset)
+{
+	return f2fs_write_ex(sbi, ino, buffer, count, offset, WR_COMPRESS_DATA);
+}
+
+u64 f2fs_write_addrtag(struct f2fs_sb_info *sbi, nid_t ino, pgoff_t offset,
+		unsigned int addrtag)
+{
+	ASSERT(addrtag == COMPRESS_ADDR || addrtag == NEW_ADDR
+			|| addrtag == NULL_ADDR);
+	return f2fs_write_ex(sbi, ino, NULL, F2FS_BLKSIZE, offset, addrtag);
+}
+
 /* This function updates only inode->i.i_size */
 void f2fs_filesize_update(struct f2fs_sb_info *sbi, nid_t ino, u64 filesize)
 {
@@ -342,11 +398,59 @@ void f2fs_filesize_update(struct f2fs_sb_info *sbi, nid_t ino, u64 filesize)
 	free(inode);
 }
 
+#define MAX_BULKR_RETRY 5
+int bulkread(int fd, void *rbuf, size_t rsize, bool *eof)
+{
+	int n = 0;
+	int retry = MAX_BULKR_RETRY;
+	int cur;
+
+	if (!rsize)
+		return 0;
+
+	if (eof != NULL)
+		*eof = false;
+	while (rsize && (cur = read(fd, rbuf, rsize)) != 0) {
+		if (cur == -1) {
+			if (errno == EINTR && retry--)
+				continue;
+			return -1;
+		}
+		retry = MAX_BULKR_RETRY;
+
+		rsize -= cur;
+		n += cur;
+	}
+	if (eof != NULL)
+		*eof = (cur == 0);
+	return n;
+}
+
+u64 f2fs_fix_mutable(struct f2fs_sb_info *sbi, nid_t ino, pgoff_t offset,
+		unsigned int compressed)
+{
+	unsigned int i;
+	u64 wlen;
+
+	if (c.sldc_immutable)
+		return 0;
+
+	for (i = 0; i < compressed - 1; i++) {
+		wlen = f2fs_write_addrtag(sbi, ino,
+				offset + (i << F2FS_BLKSIZE_BITS), NEW_ADDR);
+		if (wlen)
+			return wlen;
+	}
+	return 0;
+}
+
 int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 {
 	int fd, n;
 	pgoff_t off = 0;
 	u8 buffer[BLOCK_SZ];
+	struct node_info ni;
+	struct f2fs_node *node_blk;
 
 	if (de->ino == 0)
 		return -1;
@@ -359,8 +463,6 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 
 	/* inline_data support */
 	if (de->size <= DEF_MAX_INLINE_DATA) {
-		struct node_info ni;
-		struct f2fs_node *node_blk;
 		int ret;
 
 		get_node_info(sbi, de->ino, &ni);
@@ -385,6 +487,82 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		node_blk->i.i_size = cpu_to_le64(de->size);
 		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
 		free(node_blk);
+#ifdef WITH_SLOAD
+	} else if (c.func == SLOAD && c.sldc_en &&
+			c.sldc_ef->filter(de->full_path)) {
+		bool eof = false;
+		u8 *rbuf = c.sldc_cc.rbuf;
+		unsigned int cblocks = 0;
+
+		node_blk = calloc(BLOCK_SZ, 1);
+		ASSERT(node_blk);
+
+		/* read inode */
+		get_node_info(sbi, de->ino, &ni);
+		ASSERT(dev_read_block(node_blk, ni.blk_addr) >= 0);
+		/* update inode meta */
+		node_blk->i.i_compress_algrithm = c.sldc_ca;
+		node_blk->i.i_log_cluster_size =
+				c.sldc_cc.log_cluster_size;
+		node_blk->i.i_flags = cpu_to_le32(
+				F2FS_COMPR_FL |
+				(c.sldc_immutable ? FS_IMMUTABLE_FL : 0));
+		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
+
+		while (!eof && (n = bulkread(fd, rbuf, c.sldc_cc.rlen,
+				&eof)) > 0) {
+			int ret = c.sldc_compr->compress(&c.sldc_cc);
+			u64 wlen;
+			u32 csize = ALIGN_UP(c.sldc_cc.clen +
+					COMPRESS_HEADER_SIZE, BLOCK_SZ);
+			unsigned int cur_cblk;
+
+			if (ret || n < (int)(csize + BLOCK_SZ *
+						c.sldc_min_cbpc)) {
+				wlen = f2fs_write(sbi, de->ino, rbuf, n, off);
+				ASSERT((int)wlen == n);
+			} else {
+				wlen = f2fs_write_addrtag(sbi, de->ino, off,
+						WR_COMPRESS_ADDR);
+				ASSERT(!wlen);
+				wlen = f2fs_write_compress_data(sbi, de->ino,
+						(u8 *)c.sldc_cc.cbuf,
+						csize, off + BLOCK_SZ);
+				ASSERT(wlen == csize);
+				sldc_erase_bufs(&c.sldc_cc);
+				cur_cblk = (c.sldc_cc.rlen - csize) / BLOCK_SZ;
+				cblocks += cur_cblk;
+				wlen = f2fs_fix_mutable(sbi, de->ino,
+						off + BLOCK_SZ + csize,
+						cur_cblk);
+				ASSERT(!wlen);
+			}
+			off += n;
+		}
+		if (n == -1) {
+			fprintf(stderr, "Load file '%s' failed: ",
+					de->full_path);
+			perror(NULL);
+		}
+		/* read inode */
+		get_node_info(sbi, de->ino, &ni);
+		ASSERT(dev_read_block(node_blk, ni.blk_addr) >= 0);
+		/* update inode meta */
+		node_blk->i.i_size = cpu_to_le64(off);
+		if (!c.sldc_immutable)
+			node_blk->i.i_compr_blocks = cpu_to_le64(cblocks);
+		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
+		free(node_blk);
+
+		if (!c.sldc_immutable) {
+			sbi->total_valid_block_count += cblocks;
+			if (sbi->total_valid_block_count >=
+					sbi->user_block_count) {
+				ERR_MSG("Not enough space\n");
+				ASSERT(0);
+			}
+		}
+#endif
 	} else {
 		while ((n = read(fd, buffer, BLOCK_SZ)) > 0) {
 			f2fs_write(sbi, de->ino, buffer, n, off);
diff --git a/fsck/sload.c b/fsck/sload.c
index 14012fb..13e523a 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -6,6 +6,9 @@
  *   Hou Pengyang <houpengyang@huawei.com>
  *   Liu Shuoran <liushuoran@huawei.com>
  *   Jaegeuk Kim <jaegeuk@kernel.org>
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add sload compression support
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -317,6 +320,70 @@ skip:
 	return 0;
 }
 
+typedef struct _ext_tbl {
+	const char *ext;
+	struct _ext_tbl *next; /* linked list */
+} ext_tbl_t;
+static ext_tbl_t *ext_tbl;
+
+static bool ext_found(const char *ext)
+{
+	ext_tbl_t *p = ext_tbl;
+
+	while (p != NULL && strcmp(ext, p->ext))
+		p = p->next;
+	return (p != NULL);
+}
+
+static const char *get_ext(const char *path)
+{
+	char *p = strrchr(path, '.');
+	return p == NULL ? path + strlen(path) : p + 1;
+}
+
+static bool ext_do_filter(const char *path)
+{
+	return (ext_found(get_ext(path)) == true) ^ (c.sldc_policy == FP_ALLOW);
+}
+
+static void ext_filter_add(const char *ext)
+{
+	ext_tbl_t *node;
+
+	ASSERT(ext != NULL);
+	if (ext_found(ext))
+		return; /* ext was already registered */
+	node = malloc(sizeof(ext_tbl_t));
+	ASSERT(node != NULL);
+	node->ext = ext;
+	node->next = ext_tbl;
+	ext_tbl = node;
+}
+
+static void ext_filter_destroy(void)
+{
+	ext_tbl_t *p;
+
+	while (ext_tbl != NULL) {
+		p = ext_tbl;
+		ext_tbl = p->next;
+		free(p);
+	}
+}
+
+struct ext_tbl_op ext_filter = {
+	.add = ext_filter_add,
+	.destroy = ext_filter_destroy,
+	.filter = ext_do_filter,
+};
+
+void sldc_erase_bufs(struct compress_ctx *cc)
+{
+	memset(cc->rbuf, 0, cc->cluster_size * F2FS_BLKSIZE);
+	memset(cc->cbuf->cdata, 0, cc->cluster_size * F2FS_BLKSIZE
+			- F2FS_BLKSIZE);
+}
+
 int f2fs_sload(struct f2fs_sb_info *sbi)
 {
 	int ret = 0;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1348e39..2a2dc15 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -5,6 +5,9 @@
  *             http://www.samsung.com/
  * Copyright (c) 2019 Google Inc.
  *             http://www.google.com/
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add sload compression support
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  *
@@ -68,6 +71,10 @@ typedef uint16_t u_int16_t;
 typedef uint8_t u_int8_t;
 #endif
 
+/* codes from kernel's f2fs.h, GPL-v2.0 */
+#define MIN_COMPRESS_LOG_SIZE	2
+#define MAX_COMPRESS_LOG_SIZE	8
+
 typedef u_int64_t	u64;
 typedef u_int32_t	u32;
 typedef u_int16_t	u16;
@@ -93,6 +100,31 @@ typedef u32	__be32;
 typedef u64	__be64;
 #endif
 
+/*
+ * code borrowed from kernel f2fs dirver: f2fs.h, GPL-2.0
+ *  : definitions of COMPRESS_DATA_RESERVED_SIZE,
+ *    struct compress_data, COMPRESS_HEADER_SIZE,
+ *    and struct compress_ctx
+ */
+#define COMPRESS_DATA_RESERVED_SIZE		4
+struct compress_data {
+	__le32 clen;			/* compressed data size */
+	__le32 chksum;			/* checksum of compressed data */
+	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
+	u8 cdata[];			/* compressed data */
+};
+#define COMPRESS_HEADER_SIZE	(sizeof(struct compress_data))
+/* compress context */
+struct compress_ctx {
+	unsigned int cluster_size;	/* page count in cluster */
+	unsigned int log_cluster_size;	/* log of cluster size */
+	void *rbuf;			/* compression input buffer */
+	struct compress_data *cbuf;	/* comprsssion output header + data */
+	size_t rlen;			/* valid data length in rbuf */
+	size_t clen;			/* valid data length in cbuf */
+	void *private;			/* work buf for compress algorithm */
+};
+
 #if HAVE_BYTESWAP_H
 #include <byteswap.h>
 #else
@@ -345,6 +377,25 @@ typedef struct {
 	bool dbg_en;
 } dev_cache_config_t;
 
+/* f2fs_configration: sldc_ca, the sload compress algorithm */
+enum {CA_LZO, CA_LZ4};
+extern const char *ca_names[];
+
+typedef struct  {
+	void (*init)(struct compress_ctx *cc);
+	int (*compress)(struct compress_ctx *cc);
+} compress_ops;
+
+#define ALIGN_UP(value, size) ((value) + ((value) % (size) > 0 ? \
+		(size) - (value) % (size) : 0))
+
+enum filter_policy {FP_UNASSIGNED = 0, FP_ALLOW, FP_DENY};
+struct ext_tbl_op {
+	void (*add)(const char *);
+	void (*destroy)(void);
+	bool (*filter)(const char *);
+};
+
 struct f2fs_configuration {
 	u_int32_t reserved_segments;
 	u_int32_t new_reserved_segments;
@@ -441,6 +492,24 @@ struct f2fs_configuration {
 
 	/* cache parameters */
 	dev_cache_config_t cache_config;
+
+	/* quick dynamic buffer */
+	bool qbuf_initialized;
+	size_t qbufsize;
+	void *qbuf;
+
+	/* sldc: sload compression support */
+	bool sldc_en;
+	bool sldc_use_allow_list;  /* default false to use the deny list */
+	struct compress_ctx sldc_cc;
+	u8 sldc_ca; /* compress algorithm: 0 = LZO, 1 = LZ4 */
+	compress_ops *sldc_compr;
+	enum filter_policy sldc_policy;
+	/* max_cppc can used to specify minimum compression rate */
+	unsigned int sldc_min_cbpc; /* min compressed pages per cluster */
+	bool sldc_got_opt;
+	bool sldc_immutable;
+	struct ext_tbl_op *sldc_ef; /* extension filter */
 };
 
 #ifdef CONFIG_64BIT
@@ -1226,6 +1295,11 @@ extern void f2fs_release_sparse_resource(void);
 extern int f2fs_finalize_device(void);
 extern int f2fs_fsync_device(void);
 
+/* quick (shared) buffer */
+extern void qbuf_free(void);
+extern void *qbuf_alloc(size_t size);
+extern void qbuf_init(void);
+
 extern void dcache_init(void);
 extern void dcache_release(void);
 
@@ -1377,7 +1451,7 @@ int f2fs_reset_zone(int, void *);
 extern int f2fs_reset_zones(int);
 extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
 
-#define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
+#define SIZE_ALIGN(val, size)	(((val) + (size) - 1) / (size))
 #define SEG_ALIGN(blks)		SIZE_ALIGN(blks, c.blks_per_seg)
 #define ZONE_ALIGN(blks)	SIZE_ALIGN(blks, c.blks_per_seg * \
 					c.segs_per_zone)
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 138285d..0280896 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -5,6 +5,9 @@
  *             http://www.samsung.com/
  * Copyright (c) 2019 Google Inc.
  *             http://www.google.com/
+ * Copyright (c) 2020 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add quick-buffer for sload compression support
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
@@ -106,6 +109,36 @@ static long dcache_relocate_offset0[] = {
 };
 static int dcache_relocate_offset[16];
 
+/* quick (shared) buffer */
+static bool qbuf_initialized;
+static void *qbuf;
+static size_t qbufsize;
+void qbuf_free(void)
+{
+	ASSERT(qbuf_initialized);
+	if (qbuf != NULL) {
+		free(qbuf);
+		qbuf = NULL;
+		qbufsize = 0;
+	}
+}
+void *qbuf_alloc(size_t size)
+{
+	ASSERT(qbuf_initialized);
+	if (size > qbufsize) {
+		qbuf_free();
+		qbuf = malloc(size);
+	}
+	return qbuf;
+}
+void qbuf_init(void)
+{
+	if (qbuf_initialized)
+		return;
+	atexit(qbuf_free);
+	qbuf_initialized = true;
+}
+
 static void dcache_print_statistics(void)
 {
 	long i;
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
