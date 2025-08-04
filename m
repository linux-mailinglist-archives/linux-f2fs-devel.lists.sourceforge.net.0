Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59CB1A0A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 13:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhH9KvTOe+FazoMOtgAuPTujnaquOnMGy8jVU15N+bg=; b=KozjHCOma/U3jjus/EeHThH3pI
	7zTVbJevmP4DbRJrjlLS0Nob7XZSn2ugwbCDtKB5jP1XkMs83LVF3M2/tqv2BiQZbXZajQ8By3MjO
	8YDKKyt4CtRFXo+w1G3eybTbAZVFl377qSR7V2AqUZMKkFjgANnntH9jP8E1l9g/5PcU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uitYV-0002mn-Ap;
	Mon, 04 Aug 2025 11:40:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uitYT-0002md-BQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 11:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=da08AHNCLrKivYZRIjfYVJCDAYtsRWB+xX38Y4lTL6w=; b=YsJwtt+3T0xhv7cUIHl3GcNaRx
 8bO+rmRnLSRu3UtgTw3s9IsFLd+p+s7sj02PmDQJy4as3JYY9+XiDm0n/RbYTR3ayHHkjzaHwrTsi
 zXxpGAa7adeGkqoCGTQUJXJbQoL17W0t6m268Kdr5CdEVwiKu+LXzSU+GXk18xsoZcbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=da08AHNCLrKivYZRIjfYVJCDAYtsRWB+xX38Y4lTL6w=; b=am7rZVZ4D44IIV9fPAo4BuM3dq
 iX2J4lS5oTdUf81fs1BzCA+4hGMQobEWN7cxyIa5sjgVrslwASzLnOx5R1Q4PLkyi9x7UhPAJfep5
 iUF7R8Mr4Rkil4gIvgRxzx0gGqLg0r2xUsE4QW/XIwL1Go+UuuUvjrn1isiZsFE/AVC8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uitYS-0008GY-LY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 11:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4CD9D5C55AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Aug 2025 11:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CCDC4CEF0;
 Mon,  4 Aug 2025 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754307626;
 bh=x8xm9Hw27AwXkYqTrX/d1rvqsek/A2T33tvsNfwGJ64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bI3ZE5u600tNyK4GU2VAclveALX/6epNqsQfU38M8iRWA/e/aCiVawuqBjqrXWpHj
 pxoI3pbt65T+KmHX9TuZ/gMHTQsHWYl1GcmkXRa2q1dO8vSEvKdiMwnWs11ooqIxEt
 B45T8T8PZPhUIFQ+vOm7cHPM0Yz1Ax0DXttg359wicBhSJuo+pT47kLuchw6ryIOz0
 Q3NQb8LAnker9Igs5mIl1963KTpr7zWpqcG7+Kv61Q7RDI9AEJ1ocqhXT6/pQEVTRI
 gnPn0wbpieLARdA8PdqizlcLqZbg2t0YecVn0zj5nmbMU1I285quPVVK8Rvxlwz2vs
 nH9C8i1eFVlVg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  4 Aug 2025 19:40:15 +0800
Message-ID: <20250804114016.2734919-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804114016.2734919-1-chao@kernel.org>
References: <20250804114016.2734919-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs changes to use new mount APIs,
 let's add a new testcase
 to check mount result for all f2fs supported special mount options and their
 combinations, in order to detect any inconsistency during m [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uitYS-0008GY-LY
Subject: [f2fs-dev] [PATCH v3 2/3] f2fs/016: test special mount options
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As f2fs changes to use new mount APIs, let's add a new testcase
to check mount result for all f2fs supported special mount options
and their combinations, in order to detect any inconsistency during
mount.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/016     | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/016.out | 33 ++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100755 tests/f2fs/016
 create mode 100644 tests/f2fs/016.out

diff --git a/tests/f2fs/016 b/tests/f2fs/016
new file mode 100755
index 00000000..800f75fc
--- /dev/null
+++ b/tests/f2fs/016
@@ -0,0 +1,50 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/016
+#
+# This testcase tries to check stability of mount result
+# w/ f2fs special mount options and their combination.
+#
+. ./common/preamble
+_begin_fstest auto quick mount
+_require_kernel_config CONFIG_F2FS_FS_COMPRESSION
+_require_kernel_config CONFIG_F2FS_FS_LZO
+_require_kernel_config CONFIG_F2FS_FS_LZORLE
+_require_kernel_config CONFIG_F2FS_FS_LZ4
+_require_kernel_config CONFIG_F2FS_FS_LZ4HC
+_require_kernel_config CONFIG_F2FS_FS_ZSTD
+
+options=(
+#	mount_option			mkfs_option
+	"inline_xattr_size=400"		"extra_attr,flexible_inline_xattr"\
+	"compress_algorithm=lzo"	"extra_attr,compression"	\
+	"compress_algorithm=lz4"	"extra_attr,compression"	\
+	"compress_algorithm=zstd"	"extra_attr,compression"	\
+	"compress_algorithm=lzo-rle"	"extra_attr,compression"	\
+	"compress_algorithm=lz4:3"	"extra_attr,compression"	\
+	"compress_algorithm=zstd:1"	"extra_attr,compression"	\
+	"compress_log_size=8"		"extra_attr,compression"	\
+	"compress_extension=so"		"extra_attr,compression"	\
+	"nocompress_extension=so"	"extra_attr,compression"	\
+	"nocompress_extension=*"	"extra_attr,compression"	\
+	"compress_extension=so,nocompress_extension=so"			\
+					"extra_attr,compression"	\
+	"compress_chksum"		"extra_attr,compression"	\
+	"compress_mode=fs"		"extra_attr,compression"	\
+	"compress_mode=user"		"extra_attr,compression"	\
+	"compress_cache"		"extra_attr,compression"	\
+)
+
+for ((i=0;i<${#options[@]};i=i+2))
+do
+	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
+	_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full || _fail "mkfs failed"
+	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+	echo $?
+	_scratch_unmount >> $seqres.full 2>&1
+done
+
+status=0
+exit
diff --git a/tests/f2fs/016.out b/tests/f2fs/016.out
new file mode 100644
index 00000000..a8c96972
--- /dev/null
+++ b/tests/f2fs/016.out
@@ -0,0 +1,33 @@
+QA output created by 016
+Option#0: inline_xattr_size=400 : extra_attr,flexible_inline_xattr
+0
+Option#2: compress_algorithm=lzo : extra_attr,compression
+0
+Option#4: compress_algorithm=lz4 : extra_attr,compression
+0
+Option#6: compress_algorithm=zstd : extra_attr,compression
+0
+Option#8: compress_algorithm=lzo-rle : extra_attr,compression
+0
+Option#10: compress_algorithm=lz4:3 : extra_attr,compression
+0
+Option#12: compress_algorithm=zstd:1 : extra_attr,compression
+0
+Option#14: compress_log_size=8 : extra_attr,compression
+0
+Option#16: compress_extension=so : extra_attr,compression
+0
+Option#18: nocompress_extension=so : extra_attr,compression
+0
+Option#20: nocompress_extension=* : extra_attr,compression
+32
+Option#22: compress_extension=so,nocompress_extension=so : extra_attr,compression
+32
+Option#24: compress_chksum : extra_attr,compression
+0
+Option#26: compress_mode=fs : extra_attr,compression
+0
+Option#28: compress_mode=user : extra_attr,compression
+0
+Option#30: compress_cache : extra_attr,compression
+0
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
