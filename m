Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4CAB4B87
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 07:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/0NdhHR/MPVAMxzwQBZD/CXy2B/podNqN7vygcE/vY=; b=B/ai/N4FLpkIkHBJo3/w/mJxoV
	mrswa+nBQuvEZN5rmsCs5mJ94VXxZZbodsqehud5o5WtmFxRLhC49FyxTwDRX9S5/jHMythmcmYEL
	TC5OZ9ThCzMyyred+pESo618AB5zd1iLEu/VUEui57ay278HBblGucNJQR5CwUUxRgHk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEieF-0004iO-CD;
	Tue, 13 May 2025 05:57:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEie3-0004iC-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OEOHA2KQxNaknaZKDbuBn7ZPm2RXG7agNh9T9YWYsv4=; b=aWTH0QlzJyyqBCaqnZU5+uU3Wj
 Xsu+3nwgj6qsWJsNbydLe8D8mnSHclq3X4sfulEK9BTltX1sTMSWqI+AN1OSB58fnwodJdWMs2pkr
 KtYQgy2nALWjUSaWmNqhvEQr1ANvcAb9nB2b6UrfwGpJ4BsQ1mb+n8BvmoxlDau9VE/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OEOHA2KQxNaknaZKDbuBn7ZPm2RXG7agNh9T9YWYsv4=; b=bkaBdjufRoLPWW2jUw62qeCSrH
 ri8tyi8PFR3vC/PlmT6aQL9QRBRYIjBP+XF+83VCS/Bw0KdkWn9DvnJNJS9b/XLXzJljA/5ZV46fU
 mz6SMisVu+SwE0Vkw6/PAYAyhMop3cLrFOCXoSA0rtCDhcwsEVgK6iaFiDCOU2t/uyPM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEie2-0007f2-US for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:57:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54C58614C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 05:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D13C4CEEF;
 Tue, 13 May 2025 05:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747115853;
 bh=6JdgKPvcId4fCWzb6BG+UUXHnkY1ko2PixZoQLW9HDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=abvSqW+yGARp0WlPZZp1A7KWCPolmDsob66HnuAcjSJhvdTWNIWA16VxXx6liEkbA
 0WHASlMZFtFiJ5Sl7nOiX7ix4sYmNjGfOeMjOzP2kHsyCkcyEYGyl1rBaSPYJEmLfp
 R7vRqgZ9eDM8YPj29i1Az6b6Hf2tNGROFzJIEA8UaQvo7vEknra9V0U4nN5uR7V4lS
 6i5JZdvZFYIrjAQFXF0ePUkO7ZxPAlp3yUTZSzU1LbxPD3MHHuwpbcrVoNDgAPNwJc
 PfQBq4YqeZ8qm3PHWWBY9VcN9QCGR2uUgdjdjYw2FMFBggxIGrvpevAx1ucPSIzFQ+
 S5l1M7f4e0HUA==
To: jaegeuk@kernel.org
Date: Tue, 13 May 2025 13:57:21 +0800
Message-ID: <20250513055721.2918793-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250513055721.2918793-1-chao@kernel.org>
References: <20250513055721.2918793-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce a new fault type FAULT_VMALLOC to simulate no
 memory
 error in f2fs_vmalloc(). Signed-off-by: Chao Yu <chao@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 1 + Documentation/filesystems/f2fs.rst | 1 + fs/f2fs/compress.c | 9
 +++++---- fs/f2fs/f2fs.h | 6 +++++- fs/f2fs/s [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEie2-0007f2-US
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce FAULT_VMALLOC
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

Introduce a new fault type FAULT_VMALLOC to simulate no memory error in
f2fs_vmalloc().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/compress.c                      | 9 +++++----
 fs/f2fs/f2fs.h                          | 6 +++++-
 fs/f2fs/super.c                         | 1 +
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index e060798f9fc1..bf03263b9f46 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -736,6 +736,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_NO_SEGMENT                 0x00100000
 		FAULT_INCONSISTENT_FOOTER        0x00200000
 		FAULT_TIMEOUT                    0x00400000 (1000ms)
+		FAULT_VMALLOC                    0x00800000
 		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 724fc5e2889a..440e4ae74e44 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -208,6 +208,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_NO_SEGMENT                 0x00100000
 			 FAULT_INCONSISTENT_FOOTER        0x00200000
 			 FAULT_TIMEOUT                    0x00400000 (1000ms)
+			 FAULT_VMALLOC                    0x00800000
 			 ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 37d18e2a3327..2a9f7b68a6c6 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -180,7 +180,8 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
 #ifdef CONFIG_F2FS_FS_LZO
 static int lzo_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_vmalloc(LZO1X_MEM_COMPRESS);
+	cc->private = f2fs_vmalloc(F2FS_I_SB(cc->inode),
+					LZO1X_MEM_COMPRESS);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -247,7 +248,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 		size = LZ4HC_MEM_COMPRESS;
 #endif
 
-	cc->private = f2fs_vmalloc(size);
+	cc->private = f2fs_vmalloc(F2FS_I_SB(cc->inode), size);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -343,7 +344,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	params = zstd_get_params(level, cc->rlen);
 	workspace_size = zstd_cstream_workspace_bound(&params.cParams);
 
-	workspace = f2fs_vmalloc(workspace_size);
+	workspace = f2fs_vmalloc(F2FS_I_SB(cc->inode), workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
@@ -423,7 +424,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	workspace_size = zstd_dstream_workspace_bound(max_window_size);
 
-	workspace = f2fs_vmalloc(workspace_size);
+	workspace = f2fs_vmalloc(F2FS_I_SB(dic->inode), workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6e9615b5cdc3..bf6056aa09d8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -64,6 +64,7 @@ enum {
 	FAULT_NO_SEGMENT,
 	FAULT_INCONSISTENT_FOOTER,
 	FAULT_TIMEOUT,
+	FAULT_VMALLOC,
 	FAULT_MAX,
 };
 
@@ -3540,8 +3541,11 @@ static inline void *f2fs_kvzalloc(struct f2fs_sb_info *sbi,
 	return f2fs_kvmalloc(sbi, size, flags | __GFP_ZERO);
 }
 
-static inline void *f2fs_vmalloc(size_t size)
+static inline void *f2fs_vmalloc(struct f2fs_sb_info *sbi, size_t size)
 {
+	if (time_to_inject(sbi, FAULT_VMALLOC))
+		return NULL;
+
 	return vmalloc(size);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1860edc2a8fb..32f2abac19cf 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -68,6 +68,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_NO_SEGMENT]		= "no free segment",
 	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
 	[FAULT_TIMEOUT]			= "timeout",
+	[FAULT_VMALLOC]			= "vmalloc",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
