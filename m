Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 622709C1399
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 02:26:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9Dlg-0001ME-Q3;
	Fri, 08 Nov 2024 01:26:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t9DlX-0001Ly-6X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=neTN4lGL3K7M3Ix99fDivQNDmNmPPZGRs5/+lD3nNVU=; b=gov6vQ3ytnzcGoMYOeC2AOe4an
 4aOmDV64RucCAM8pUCu1UDV8nn8DxooDzvaAkaSvlzLMBhZlsA7cJ9VceBmrjUt7P0tSSdzRfmXJf
 k5bFBB4uFa2C3S10qsWVaqWVuZ4x0pmAC1/vgpBnRlfRvBSTzoDrI9vUolgyBFDglbO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=neTN4lGL3K7M3Ix99fDivQNDmNmPPZGRs5/+lD3nNVU=; b=DFhMRl1v/aU1w2DgWBzmNJ2X1K
 TPm5L/NqLbn8Q2+3hisVXNnWMEQ1K+qjpXOcJXuyfXhS0qTjOnRleRfJRj4uTX9CsOscSfl0F4C8z
 ojAa0f3sllRTI1WYhiQKIJYdQbb4rsHcvJtchFkq4grXBhPBxPo5PgwGzSp/0KEV8CRY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9DlS-0006BQ-GL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 755245C576D;
 Fri,  8 Nov 2024 01:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D6DC4CECC;
 Fri,  8 Nov 2024 01:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731029167;
 bh=Xc48J3j8pFGdmACryyspUFhTaTgH3SnsHmTKA1qPrKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=otscWSYftslmbZj1FnDbIZDhsQ6dNd7/oQ++yHRWDXVzW7v+xJpgSd0uuC6tDgoLb
 IQgjQAr17xXj2A25Z+DSWgeDQslE51A3D6AsqyRkV2F3KyuZ4RmiX5fFDMbgUi/XXd
 H79a/qsrcgFoUHeNgSKhfGkDpNWOcbXNQ3V8G0zfWdbdQFZrmYqAqnB4sHWTdNqg8w
 mmvEncIEQw8HysLmfZA7E2XaovX+b7EHy1Hfexrko97uyjD0gfFSJcvrNesRM4yEno
 NJUJ2HzoGUWX97eu0Hiu5FE7AkCIvI7gQH27xWjc4h84Fq80P3AfgQIJyBAgr9Nc7Q
 xtP6FbL+PEUIQ==
To: jaegeuk@kernel.org
Date: Fri,  8 Nov 2024 09:25:56 +0800
Message-Id: <20241108012557.572782-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241108012557.572782-1-chao@kernel.org>
References: <20241108012557.572782-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Zhiguo Niu <zhiguo.niu@unisoc.com> If user give a file
 size as "length" parameter for fiemap operations, but if this size is non-block
 size aligned, it will show 2 segments fiemap results even this whole file
 is contiguous on disk, suc [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9DlS-0006BQ-GL
Subject: [f2fs-dev] [PATCH 3/4] f2fs: fix to adjust appropriate length for
 fiemap
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhiguo Niu <zhiguo.niu@unisoc.com>

If user give a file size as "length" parameter for fiemap
operations, but if this size is non-block size aligned,
it will show 2 segments fiemap results even this whole file
is contiguous on disk, such as the following results:

 ./f2fs_io fiemap 0 19034 ylog/analyzer.py
Fiemap: offset = 0 len = 19034
        logical addr.    physical addr.   length           flags
0       0000000000000000 0000000020baa000 0000000000004000 00001000
1       0000000000004000 0000000020bae000 0000000000001000 00001001

after this patch:
./f2fs_io fiemap 0 19034 ylog/analyzer.py
Fiemap: offset = 0 len = 19034
    logical addr.    physical addr.   length           flags
0    0000000000000000 00000000315f3000 0000000000005000 00001001

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/data.c          | 6 +++---
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0e8390cbdb5b..69f1cb0490ee 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1938,12 +1938,12 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			goto out;
 	}
 
-	if (F2FS_BYTES_TO_BLK(len) == 0)
-		len = F2FS_BLKSIZE;
-
 	start_blk = F2FS_BYTES_TO_BLK(start);
 	last_blk = F2FS_BYTES_TO_BLK(start + len - 1);
 
+	if (len & F2FS_BLKSIZE_MASK)
+		len = round_up(len, F2FS_BLKSIZE);
+
 next:
 	memset(&map, 0, sizeof(map));
 	map.m_lblk = start_blk;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 3b2ad444c002..c24f8bc01045 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -24,6 +24,7 @@
 #define NEW_ADDR		((block_t)-1)	/* used as block_t addresses */
 #define COMPRESS_ADDR		((block_t)-2)	/* used as compressed data flag */
 
+#define F2FS_BLKSIZE_MASK		(F2FS_BLKSIZE - 1)
 #define F2FS_BYTES_TO_BLK(bytes)	((unsigned long long)(bytes) >> F2FS_BLKSIZE_BITS)
 #define F2FS_BLK_TO_BYTES(blk)		((unsigned long long)(blk) << F2FS_BLKSIZE_BITS)
 #define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
