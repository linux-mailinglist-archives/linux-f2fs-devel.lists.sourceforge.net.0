Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9097CB5D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 23:59:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsVc6-0007kf-Jy;
	Mon, 16 Oct 2023 21:59:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qsVc4-0007kR-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 21:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hIL2tY6Ya3vXaRYdpIXxGg5UF1TByOarqlrzQ1IPHw8=; b=LayMk+uAYT5FvMX3BWh98M9XhK
 A9sw3qnVmL3qlNJVCssx0b6Bt2bj+uvR9oSeF6G4cpb1rqWH0Y1yiRDx7ZOzHVpbrwrgjDi1nagPg
 fIvOx+XH5ZgpI2Evh2PFnb6jzEpXas4gC9YI1XmcRGdv6NqwWY5B/GfzMcDnpbeWSKxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hIL2tY6Ya3vXaRYdpIXxGg5UF1TByOarqlrzQ1IPHw8=; b=M7LIF7xdl2fw5e9e/rcAagMW8B
 dkca9/ZngzpgNUF4SRWh4dQB7o/19t3xYPYbdE2jrtJdmvfEEhKyLnCqMSiSdv+M0kVXJWWfN85nW
 xWuf0COmL/pKTWIxTg2WkgSAPAklxFtVOcZP0P0a5/g4zCmwbp24lKmRUBHpz+5dEK+4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsVc4-00HA6e-42 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 21:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B37E8611C3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Oct 2023 21:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56835C433C8;
 Mon, 16 Oct 2023 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697493534;
 bh=tPneTTHKFMRHD0Rybv8/aIBgzOJ0UU1S3RNxLEY6rEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FfXxOi6PNKCnL+r/nEnKEOr29udj5Yjo4qO+yaF2auO1GMGJSLFC5DsREEsXRNohq
 wOBMUQfqTlHFNxkRe1VxXIsFt3KzW0IMBhBplRT6SZaL+zXgvGan0RDft+ENITNmDP
 TspT9JZnJGMf+AbNwK4ARIjShln5RMtwyqVCGCUU9R9P5eKQ9b/A7J9kqELc0OyCNI
 DxfnpZ72iBw9fFN03Tod3sIESIURSAhCCE/vge4/yLPnK3jol+H3uSCwSB1V6H69LY
 GnH6pC1diMAZFKNJ1hwc2FT/fNYmdv16qL3vKpjJmHMkOpGjWtodqj8A4VQaYh7TKg
 ZFlsDBPD3yL4A==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 16 Oct 2023 14:58:49 -0700
Message-ID: <20231016215849.639313-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231016215849.639313-1-jaegeuk@kernel.org>
References: <20231016215849.639313-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The cache offset should have been considered multiple
 partitions
 per fd. Let's fix. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 lib/libf2fs_io.c
 | 45 +++++++++++++++++++++++++ 1 file changed, 25 insertions(+),
 20 deletions(-)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qsVc4-00HA6e-42
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix cache offset for multiple
 partitions
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

The cache offset should have been considered multiple partitions per fd.
Let's fix.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs_io.c | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 74e5f3ac49ba..39d377777259 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -246,7 +246,7 @@ static inline long dcache_relocate(long entry, int n)
 			dcache_config.num_cache_entry;
 }
 
-static long dcache_find(off_t blk)
+static long dcache_find(__u64 blk)
 {
 	register long n = dcache_config.num_cache_entry;
 	register unsigned m = dcache_config.max_hash_collision;
@@ -267,8 +267,13 @@ static long dcache_find(off_t blk)
 }
 
 /* Physical read into cache */
-static int dcache_io_read(int fd, long entry, off_t offset, off_t blk)
+static int dcache_io_read(long entry, __u64 offset, off_t blk)
 {
+	int fd = __get_device_fd(&offset);
+
+	if (fd < 0)
+		return fd;
+
 	if (lseek(fd, offset, SEEK_SET) < 0) {
 		MSG(0, "\n lseek fail.\n");
 		return -1;
@@ -297,12 +302,11 @@ static int dcache_io_read(int fd, long entry, off_t offset, off_t blk)
  *       1: cache not available (uninitialized)
  *      -1: error
  */
-static int dcache_update_rw(int fd, void *buf, off_t offset,
+static int dcache_update_rw(void *buf, __u64 offset,
 		size_t byte_count, bool is_write)
 {
-	off_t blk;
+	__u64 blk, start;
 	int addr_in_blk;
-	off_t start;
 
 	if (!dcache_initialized)
 		dcache_init(); /* auto initialize */
@@ -337,7 +341,7 @@ static int dcache_update_rw(int fd, void *buf, off_t offset,
 				if (dcache_valid[entry])
 					++dcache_rreplace;
 				/* read: physical I/O read into cache */
-				err = dcache_io_read(fd, entry, start, blk);
+				err = dcache_io_read(entry, start, blk);
 				if (err)
 					return err;
 			}
@@ -366,15 +370,15 @@ static int dcache_update_rw(int fd, void *buf, off_t offset,
  * return value: 1: cache not available
  *               0: success, -1: I/O error
  */
-int dcache_update_cache(int fd, void *buf, off_t offset, size_t count)
+int dcache_update_cache(void *buf, __u64 offset, size_t count)
 {
-	return dcache_update_rw(fd, buf, offset, count, true);
+	return dcache_update_rw(buf, offset, count, true);
 }
 
 /* handles read into cache + read into buffer  */
-int dcache_read(int fd, void *buf, off_t offset, size_t count)
+int dcache_read(void *buf, __u64 offset, size_t count)
 {
-	return dcache_update_rw(fd, buf, offset, count, false);
+	return dcache_update_rw(buf, offset, count, false);
 }
 
 /*
@@ -517,15 +521,15 @@ int dev_read(void *buf, __u64 offset, size_t len)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
 					len / F2FS_BLKSIZE, buf);
 
-	fd = __get_device_fd(&offset);
-	if (fd < 0)
-		return fd;
-
 	/* err = 1: cache not available, fall back to non-cache R/W */
 	/* err = 0: success, err=-1: I/O error */
-	err = dcache_read(fd, buf, (off_t)offset, len);
+	err = dcache_read(buf, offset, len);
 	if (err <= 0)
 		return err;
+
+	fd = __get_device_fd(&offset);
+	if (fd < 0)
+		return fd;
 	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(fd, buf, len) < 0)
@@ -561,16 +565,17 @@ int dev_write(void *buf, __u64 offset, size_t len)
 		return sparse_write_blk(offset / F2FS_BLKSIZE,
 					len / F2FS_BLKSIZE, buf);
 
-	fd = __get_device_fd(&offset);
-	if (fd < 0)
-		return fd;
-
 	/*
 	 * dcache_update_cache() just update cache, won't do I/O.
 	 * Thus even no error, we need normal non-cache I/O for actual write
 	 */
-	if (dcache_update_cache(fd, buf, (off_t)offset, len) < 0)
+	if (dcache_update_cache(buf, offset, len) < 0)
 		return -1;
+
+	fd = __get_device_fd(&offset);
+	if (fd < 0)
+		return fd;
+
 	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(fd, buf, len) < 0)
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
