Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA5CBAB070
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 04:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwixzXcpAZTPhSX1E3SJnFHaVBaCuAtBcfNuNWvYN3M=; b=D2ku/TP9jkqVC4g53ZVTk1KbSL
	9vDHkrwjvAJnyTH8RjZJn5nkK37OcbsyoNdRkBpyL3y9t9Z4BtQSkfkbJKOy4LAtfRKzepaa1/+3C
	zJPH+Zfa00sLSu4odORmro4LtZ9A22nQNcl6bIBKqPycybRvuh7+foUZvPHVqrQhkrsM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3QF3-0004ad-1d;
	Tue, 30 Sep 2025 02:37:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v3QF1-0004aX-IL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n9f9ptPT9IRYEMzhbIKBgn+XAdyBYa2hA3nH9TbmCQk=; b=CDETIIry8xivlY6aDQgum2CoBb
 tW4rZNpdft70CRvGWWfXygJ17G/h3HOcRl38j4xGVYlTiVDmbTMJGoxJG8nK49ptG6iu8ycPBXxiB
 mULEiIhyeUjOvtphkEbCM7Brr0AIrg1rWjhZX2V/tEIbrRTSuM1ZoWhRaRrVRTe8d6yQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n9f9ptPT9IRYEMzhbIKBgn+XAdyBYa2hA3nH9TbmCQk=; b=Cqw4qLXLPnpDkFFoPycZjIYmfF
 b4KOLw89h4Ttd+ITfzA2bFreTgrDTtzlyGRD5Vzz9vdHdXb5EceC/eyAWkX6jF4ZLwlYfrIOAbRqo
 2lIjWWvLC63S13W3mNiQuQ4Y2MerfklJ8u5M2GgYzfAkerMxX3ri+G2cnOGQNoWDRUAY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3QF1-0004T0-1N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE0F54350C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 02:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD27C4CEF4;
 Tue, 30 Sep 2025 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759199832;
 bh=Te8gIMaSfbpim9fYbkjjsQuokYFxEbX3ge6ZltHh1rE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C6+o6BHaR6HmQ60th2+ol7nSajSZ/OH9ivbkp5BeBG0a/JW0zvECnbhfXoFtl+h7g
 Wj9LsNZIvoHq3oQygdZlGZwLTWfz2OB9draj/FvKg/GUOp0GBMtFlRkG7Yxy3ISJvZ
 mMusG+Sxak6bZqr0AdqNDPzM4wMAhO753PHctEKtOIYgADlITR9oFmaS1+OwD43KwI
 jcTgLKYGJFC47V7M0p4zcR4P860E96hC9qa2hAu69Rjnuv6fVty/2+NT1vhJOuBsPr
 GlOk0dr/+xicPlrQDBLG7NaVeZXQ5y64DpQ/OeTbIbTFr2NNuTO8b60mCvE+ePuU9c
 FjXRUaGe5OHrg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Sep 2025 02:37:03 +0000
Message-ID: <20250930023704.3019074-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
In-Reply-To: <20250930023704.3019074-1-jaegeuk@kernel.org>
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It only measures the read performance. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- configure.ac | 1 + man/f2fs_io.8 | 3 +++
 tools/f2fs_io/f2fs_io.c
 | 19 ++++++++++++++++++- tools/f2fs_io/f2fs_io.h | 4 ++++ 4 files changed,
 26 inser [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3QF1-0004T0-1N
Subject: [f2fs-dev] [PATCH 4/5] f2fs_io: add dontcache to measure
 RWF_DONTCACHE speed
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

It only measures the read performance.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 configure.ac            |  1 +
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 19 ++++++++++++++++++-
 tools/f2fs_io/f2fs_io.h |  4 ++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index ddfc3b0f30e2..4d91605f8106 100644
--- a/configure.ac
+++ b/configure.ac
@@ -194,6 +194,7 @@ AC_CHECK_FUNCS_ONCE([
 	keyctl
 	memset
 	pread
+	preadv2
 	pwrite
 	setmntent
 ])
diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 8e54aa644a00..708a5831bba0 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -125,6 +125,9 @@ options can be:
 .B buffered
 buffered I/O
 .TP
+.B dontcache
+buffered I/O with RWF_DONTCACHE
+.TP
 .B dio
 direct I/O
 .TP
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 028ffe59d0c7..22f9968a35e9 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -24,6 +24,8 @@
 #include <linux/fs.h>
 #include <signal.h>
 #include <stdarg.h>
+#include <sys/uio.h>
+#include <stdarg.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -929,6 +931,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "Read data in file_path and print nbytes\n"		\
 "IO can be\n"						\
 "  buffered : buffered IO\n"				\
+"  dontcache: buffered IO + dontcache\n"		\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
 "  mlock    : mmap + mlock\n"				\
@@ -948,6 +951,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	int flags = 0;
 	int do_mmap = 0;
 	int do_mlock = 0;
+	int do_dontcache = 0;
 	int fd, advice;
 
 	if (argc != 8) {
@@ -972,6 +976,12 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		do_mmap = 1;
 	else if (!strcmp(argv[4], "mlock"))
 		do_mlock = 1;
+	else if (!strcmp(argv[4], "dontcache"))
+#ifdef HAVE_PREADV2
+		do_dontcache = 1;
+#else
+		die("Not support - preadv2");
+#endif
 	else if (strcmp(argv[4], "buffered"))
 		die("Wrong IO type");
 
@@ -1016,7 +1026,14 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		read_cnt = count * buf_size;
 	} else {
 		for (i = 0; i < count; i++) {
-			ret = pread(fd, buf, buf_size, offset + buf_size * i);
+			if (!do_dontcache) {
+				ret = pread(fd, buf, buf_size, offset + buf_size * i);
+			} else {
+#ifdef HAVE_PREADV2
+				struct iovec iov = { .iov_base = buf, .iov_len = buf_size };
+				ret = preadv2(fd, &iov, 1, offset + buf_size * i, RWF_DONTCACHE);
+#endif
+			}
 			if (ret != buf_size) {
 				printf("pread expected: %"PRIu64", readed: %"PRIu64"\n",
 						buf_size, ret);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 21fd3864a20d..b0d40996f302 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -226,6 +226,10 @@ enum {
 #define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #endif
 
+#ifndef RWF_DONTCACHE
+#define RWF_DONTCACHE			0x00000080 /* Uncached buffered IO.  */
+#endif
+
 struct f2fs_gc_range {
 	u32 sync;
 	u64 start;
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
