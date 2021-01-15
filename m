Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182B2F8443
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:24:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0TmF-0002UI-HZ; Fri, 15 Jan 2021 18:24:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0TmD-0002UB-RY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GUIhXhSTKHLujeVY32Bcxkz8NhoXnqEarPK/5WwhCXE=; b=GEVB8xXjBcCxdBPowfDCEYsd4P
 6/cL8uBvtWD8xwRjQG3OP/UzxK/gY0a+tATkHh8XJiPd39wQcAG6JHg9kqGTNcMC5povGnOzt1xuD
 rRC8s66jrQSODkbBcstL7YOg0IiiFk+AhFzdzKIAxW6dkhOPKTeIMLN9Mu+K+/fGbK4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GUIhXhSTKHLujeVY32Bcxkz8NhoXnqEarPK/5WwhCXE=; b=nPKzDJzXxh6I0M/OUJl2c2u1ru
 ThTae/U/GsrV3U6rS+JqImKKz8Tuzv44TsmgDL758WfEQB+deRADp5A0UCdMHPLjF7VZ33h8YH45v
 Id/RIiINFTI1zxB/Qpn+uo5MYT0qAB/48vhDqtuKGVDdB6g4KMj8uY3orZSq3to2Yysc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0Tm5-005PlY-Nb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:24:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F9CE23359;
 Fri, 15 Jan 2021 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610735076;
 bh=XNHyURzeegVGJqOA0F0Z0GMFYwj9KfC+0LNtOIa5e5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TBomb3bdb9+qxBzXasiTSO7d1ujKX0BEpaqOokhkQSVTkn/o5YC1fkC7sLiP1vjpN
 tjNdsmjxtJ0lIVzLAjIDgu4UB/ZhcjCq7WSsvZmhnum4P3m5HkD9eHxJXlSxn2Zx8G
 qcUAcKGj3XZ3mcR6861HgdolC9IAjlyV/N2FHmrjMulgMpdDpLihKdKqgN44BwW7+c
 CzgNDQ+j5sYuc4SDIOaroCBiXKmvBlcF4j1zxeNF9R9wQ7GEuyJHx1dIMSUVHQZzqY
 iREVuLOGlIEz/KQVbDZNJCxTbJaD00Da++U+hO0jLXPU05IiugJs74kp9guuWEEnN5
 Dmo10UgwJqUgQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:24:02 -0800
Message-Id: <20210115182402.35691-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115182402.35691-1-ebiggers@kernel.org>
References: <20210115182402.35691-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: opensource.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0Tm5-005PlY-Nb
Subject: [f2fs-dev] [fsverity-utils RFC PATCH 2/2] programs/fsverity: Add
 dump_metadata subcommand
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Victor Hsieh <victorhsieh@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a 'fsverity dump_metadata' subcommand which calls
FS_IOC_READ_VERITY_METADATA on a file and prints the returned metadata
to stdout.  There are three subsubcommands, one for each type of
metadata that can be read using the ioctl:

	fsverity dump_metadata merkle_tree FILE
	fsverity dump_metadata descriptor FILE
	fsverity dump_metadata signature FILE

By default the whole metadata item is dumped.  --length and --offset can
be specified to dump only a particular range of the item.

This subcommand will be used by xfstests to test the
FS_IOC_READ_VERITY_METADATA ioctl.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Makefile                     |   1 +
 programs/cmd_dump_metadata.c | 167 +++++++++++++++++++++++++++++++++++
 programs/fsverity.c          |   6 ++
 programs/fsverity.h          |   6 ++
 4 files changed, 180 insertions(+)
 create mode 100644 programs/cmd_dump_metadata.c

diff --git a/Makefile b/Makefile
index 0354f62..fd28b06 100644
--- a/Makefile
+++ b/Makefile
@@ -160,6 +160,7 @@ FSVERITY_PROG_OBJ := $(PROG_COMMON_OBJ)		\
 		     programs/fsverity.o
 ifneq ($(MINGW),1)
 FSVERITY_PROG_OBJ += \
+		     programs/cmd_dump_metadata.o \
 		     programs/cmd_enable.o	\
 		     programs/cmd_measure.o
 endif
diff --git a/programs/cmd_dump_metadata.c b/programs/cmd_dump_metadata.c
new file mode 100644
index 0000000..9b249ba
--- /dev/null
+++ b/programs/cmd_dump_metadata.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: MIT
+/*
+ * The 'fsverity dump_metadata' command
+ *
+ * Copyright 2021 Google LLC
+ *
+ * Use of this source code is governed by an MIT-style
+ * license that can be found in the LICENSE file or at
+ * https://opensource.org/licenses/MIT.
+ */
+
+#include "fsverity.h"
+
+#include <fcntl.h>
+#include <getopt.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+static const struct option longopts[] = {
+	{"offset",	required_argument, NULL, OPT_OFFSET},
+	{"length",	required_argument, NULL, OPT_LENGTH},
+	{NULL, 0, NULL, 0}
+};
+
+static const struct {
+	const char *name;
+	int val;
+} metadata_types[] = {
+	{"merkle_tree", FS_VERITY_METADATA_TYPE_MERKLE_TREE},
+	{"descriptor", FS_VERITY_METADATA_TYPE_DESCRIPTOR},
+	{"signature", FS_VERITY_METADATA_TYPE_SIGNATURE},
+};
+
+static bool parse_metadata_type(const char *name, __u64 *val_ret)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(metadata_types); i++) {
+		if (strcmp(name, metadata_types[i].name) == 0) {
+			*val_ret = metadata_types[i].val;
+			return true;
+		}
+	}
+	error_msg("unknown metadata type: %s", name);
+	fputs("       Expected", stderr);
+	for (i = 0; i < ARRAY_SIZE(metadata_types); i++) {
+		if (i != 0 && ARRAY_SIZE(metadata_types) > 2)
+			putc(',', stderr);
+		putc(' ', stderr);
+		if (i != 0 && i == ARRAY_SIZE(metadata_types) - 1)
+			fputs("or ", stderr);
+		fprintf(stderr, "\"%s\"", metadata_types[i].name);
+	}
+	fprintf(stderr, "\n");
+	return false;
+}
+
+/* Dump the fs-verity metadata of the given file. */
+int fsverity_cmd_dump_metadata(const struct fsverity_command *cmd,
+			       int argc, char *argv[])
+{
+	bool offset_specified = false;
+	bool length_specified = false;
+	struct filedes file = { .fd = -1 };
+	struct filedes stdout_filedes = { .fd = STDOUT_FILENO,
+					  .name = "stdout" };
+	/*
+	 * FS_VERITY_METADATA_TYPE_MERKLE_TREE requires Merkle tree block
+	 * alignment.  Use a 64K buffer which should always be enough.
+	 */
+	struct fsverity_read_metadata_arg arg = { .length = 65536 };
+	void *buf = NULL;
+	char *tmp;
+	int c;
+	int status;
+	int bytes_read;
+
+	while ((c = getopt_long(argc, argv, "", longopts, NULL)) != -1) {
+		switch (c) {
+		case OPT_OFFSET:
+			if (offset_specified) {
+				error_msg("--offset can only be specified once");
+				goto out_usage;
+			}
+			errno = 0;
+			arg.offset = strtoull(optarg, &tmp, 10);
+			if (errno || *tmp) {
+				error_msg("invalid value for --offset");
+				goto out_usage;
+			}
+			offset_specified = true;
+			break;
+		case OPT_LENGTH:
+			if (length_specified) {
+				error_msg("--length can only be specified once");
+				goto out_usage;
+			}
+			errno = 0;
+			arg.length = strtoull(optarg, &tmp, 10);
+			if (errno || *tmp || arg.length > SIZE_MAX) {
+				error_msg("invalid value for --length");
+				goto out_usage;
+			}
+			length_specified = true;
+			break;
+		default:
+			goto out_usage;
+		}
+	}
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc != 2)
+		goto out_usage;
+
+	if (!parse_metadata_type(argv[0], &arg.metadata_type))
+		goto out_usage;
+
+	if (length_specified && !offset_specified) {
+		error_msg("--length specified without --offset");
+		goto out_usage;
+	}
+	if (offset_specified && !length_specified) {
+		error_msg("--offset specified without --length");
+		goto out_usage;
+	}
+
+	buf = xzalloc(arg.length);
+	arg.buf_ptr = (uintptr_t)buf;
+
+	if (!open_file(&file, argv[1], O_RDONLY, 0))
+		goto out_err;
+
+	/*
+	 * If --offset and --length were specified, then do only the single read
+	 * requested.  Otherwise read until EOF.
+	 */
+	do {
+		bytes_read = ioctl(file.fd, FS_IOC_READ_VERITY_METADATA, &arg);
+		if (bytes_read < 0) {
+			error_msg_errno("FS_IOC_READ_VERITY_METADATA failed on '%s'",
+					file.name);
+			goto out_err;
+		}
+		if (bytes_read == 0)
+			break;
+		if (!full_write(&stdout_filedes, buf, bytes_read))
+			goto out_err;
+		arg.offset += bytes_read;
+	} while (!length_specified);
+
+	status = 0;
+out:
+	free(buf);
+	filedes_close(&file);
+	return status;
+
+out_err:
+	status = 1;
+	goto out;
+
+out_usage:
+	usage(cmd, stderr);
+	status = 2;
+	goto out;
+}
diff --git a/programs/fsverity.c b/programs/fsverity.c
index b911b2e..1168430 100644
--- a/programs/fsverity.c
+++ b/programs/fsverity.c
@@ -29,6 +29,12 @@ static const struct fsverity_command {
 "               [--hash-alg=HASH_ALG] [--block-size=BLOCK_SIZE] [--salt=SALT]\n"
 "               [--compact] [--for-builtin-sig]\n"
 #ifndef _WIN32
+	}, {
+		.name = "dump_metadata",
+		.func = fsverity_cmd_dump_metadata,
+		.short_desc = "Dump the fs-verity metadata of the given file",
+		.usage_str =
+"    fsverity dump_metadata TYPE FILE [--offset=OFFSET] [--length=LENGTH]\n"
 	}, {
 		.name = "enable",
 		.func = fsverity_cmd_enable,
diff --git a/programs/fsverity.h b/programs/fsverity.h
index 45c4fe1..9785013 100644
--- a/programs/fsverity.h
+++ b/programs/fsverity.h
@@ -27,6 +27,8 @@ enum {
 	OPT_FOR_BUILTIN_SIG,
 	OPT_HASH_ALG,
 	OPT_KEY,
+	OPT_LENGTH,
+	OPT_OFFSET,
 	OPT_SALT,
 	OPT_SIGNATURE,
 };
@@ -37,6 +39,10 @@ struct fsverity_command;
 int fsverity_cmd_digest(const struct fsverity_command *cmd,
 			int argc, char *argv[]);
 
+/* cmd_dump_metadata.c */
+int fsverity_cmd_dump_metadata(const struct fsverity_command *cmd,
+			       int argc, char *argv[]);
+
 /* cmd_enable.c */
 int fsverity_cmd_enable(const struct fsverity_command *cmd,
 			int argc, char *argv[]);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
