Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6EAB4B89
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 07:58:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tYZQ59w3tjTfh3/2s6JeyzRUofsCI2tOJM6WZZaSL10=; b=gVWPFIQztE4T4+Xtg4dKCFzX/L
	ffdmvTbmf8YBWdLIpP8u2yMAIq0sWBY8fNS76lE94m13pBKaQH+eSQe5BUkDWG17+6QzvbKuHstud
	CRYutBcS7VS5t4yj/nT+e3LESfn0hzNP0jpOrX2T7JyDWsifhRl9OUsnhr90CVLNsQHY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEieI-0005ZZ-1w;
	Tue, 13 May 2025 05:57:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEie6-0005Z8-Ub
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wAjIXUcs8/R96P2iv4f6IUOCVUWbw0g1uFyQAGZPoWA=; b=ibre5RIAwrbQFGYxonNTkjKzp8
 DrHzfeddoyhLTta70D9yyF97xsHCXPzGGNdImUoNO4dLWhj7v1gEHfmOi/2hXII0zP2T5JUYVXRb7
 sAfKXCPfuaxMUU+PgB+FLfWurv+ZThV5NxX7w0bz3syii/JDXqt8kEwD9V+kDaDnsVAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wAjIXUcs8/R96P2iv4f6IUOCVUWbw0g1uFyQAGZPoWA=; b=l
 NmZGnmwaNEEVP0CGfTi+t3FRRlUb5ByHw1ATBOqW7sDYYo6UYj1ftOx4skxZfFQPk+DUwa8UUhs/e
 UZeiJEcwXuvNt6azPebRwaPU3NN1MukzY4LUyjD6VAEmfKiy0eY4N8EYNOKhJouGIykwvmTIr1BfY
 AmhJD4byjug0f//g=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEie6-0007f7-AA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9761A614C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 05:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978D4C4CEE4;
 Tue, 13 May 2025 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747115851;
 bh=iq+7sAV+6RDxSZB8XPVBWlfciYrmYjDZSlRq1eox6e4=;
 h=From:To:Cc:Subject:Date:From;
 b=jR2208kOy0lCeh+X47FR2M8P9fE9KStEbZUUjbjlXlSv9LVScQ0jbyvuppU2Qcd3K
 iM+RVstu/TxTT7/W5Ontn+zw2rpev2eXY9XE1CEypXI9QsTlbhUnTiJNTfyKJAstGo
 UyfWiUxtPG1EBVLT/PVoqcFAZq78jkCH64UgrTNoY2FpCAU3XXCBoaq1U2oWrE8UVM
 X/rHAMWgnBxfHMb2Zlwxzy6KObNe8qSV+OZ8krk15ZAblldjCx8z6axCxZmfexF9DZ
 s3OupRs0x/BBPeTaueXzedqiWwLXwO36MYc1UrdisLtzX64GbNjhtalP9y/u/T106I
 VbhfVyMdPJzlw==
To: jaegeuk@kernel.org
Date: Tue, 13 May 2025 13:57:20 +0800
Message-ID: <20250513055721.2918793-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  .init_{, de}compress_ctx uses kvmalloc() to alloc memory, it
 will try to allocate physically continuous page first, it may cause more
 memory allocation pressure, let's use vmalloc instead to mitigate i [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEie6-0007f7-AA
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{, de}compress_ctx
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

.init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
to allocate physically continuous page first, it may cause more memory
allocation pressure, let's use vmalloc instead to mitigate it.

[Test]
cd /data/local/tmp
touch file
f2fs_io setflags compression file
f2fs_io getflags file
for i in $(seq 1 10); do sync; echo 3 > /proc/sys/vm/drop_caches;\
time f2fs_io write 512 0 4096 zero osync file; truncate -s 0 file;\
done

[Result]
Before		After		Delta
21.243		21.694		-2.12%

For compression, we recommend to use ioctl to compress file data in
background for workaround.

For decompression, only zstd will be affected.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 23 ++++++++++-------------
 fs/f2fs/f2fs.h     |  5 +++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1e62fdffda07..37d18e2a3327 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -180,8 +180,7 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
 #ifdef CONFIG_F2FS_FS_LZO
 static int lzo_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-				LZO1X_MEM_COMPRESS, GFP_NOFS);
+	cc->private = f2fs_vmalloc(LZO1X_MEM_COMPRESS);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -191,7 +190,7 @@ static int lzo_init_compress_ctx(struct compress_ctx *cc)
 
 static void lzo_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	vfree(cc->private);
 	cc->private = NULL;
 }
 
@@ -248,7 +247,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 		size = LZ4HC_MEM_COMPRESS;
 #endif
 
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);
+	cc->private = f2fs_vmalloc(size);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -263,7 +262,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 
 static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	vfree(cc->private);
 	cc->private = NULL;
 }
 
@@ -344,8 +343,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	params = zstd_get_params(level, cc->rlen);
 	workspace_size = zstd_cstream_workspace_bound(&params.cParams);
 
-	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-					workspace_size, GFP_NOFS);
+	workspace = f2fs_vmalloc(workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
@@ -353,7 +351,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	if (!stream) {
 		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
 				"%s zstd_init_cstream failed", __func__);
-		kvfree(workspace);
+		vfree(workspace);
 		return -EIO;
 	}
 
@@ -366,7 +364,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 
 static void zstd_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	vfree(cc->private);
 	cc->private = NULL;
 	cc->private2 = NULL;
 }
@@ -425,8 +423,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	workspace_size = zstd_dstream_workspace_bound(max_window_size);
 
-	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
-					workspace_size, GFP_NOFS);
+	workspace = f2fs_vmalloc(workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
@@ -434,7 +431,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 	if (!stream) {
 		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
 				"%s zstd_init_dstream failed", __func__);
-		kvfree(workspace);
+		vfree(workspace);
 		return -EIO;
 	}
 
@@ -446,7 +443,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 static void zstd_destroy_decompress_ctx(struct decompress_io_ctx *dic)
 {
-	kvfree(dic->private);
+	vfree(dic->private);
 	dic->private = NULL;
 	dic->private2 = NULL;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9432fd15766a..6e9615b5cdc3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3540,6 +3540,11 @@ static inline void *f2fs_kvzalloc(struct f2fs_sb_info *sbi,
 	return f2fs_kvmalloc(sbi, size, flags | __GFP_ZERO);
 }
 
+static inline void *f2fs_vmalloc(size_t size)
+{
+	return vmalloc(size);
+}
+
 static inline int get_extra_isize(struct inode *inode)
 {
 	return F2FS_I(inode)->i_extra_isize / sizeof(__le32);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
