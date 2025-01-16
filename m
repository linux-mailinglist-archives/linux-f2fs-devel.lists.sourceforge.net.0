Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC307A140D3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2025 18:24:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYTbu-0008Qc-Lb;
	Thu, 16 Jan 2025 17:24:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYTbt-0008QO-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 17:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fsoFT5N3EGIDpoxQ1t1agFOvuK1si4Ro7hleUnqQP04=; b=Vd+IwC5Vy2GgOa7tKI4Dukcgrc
 hK4c9VFeF8v4XlgBViVzT2xzdsOC1cleRd8mTa/uXGWfZSdJaiKc9Ov7FBpzCwUQdd+Ezb4M8Muea
 Ej2T/H/Ebu9zDSCClrZ5m9YwWKtPIFbitaUamWx7AUpvsAN5/gmyz1Dg7YKsk2EhHhYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fsoFT5N3EGIDpoxQ1t1agFOvuK1si4Ro7hleUnqQP04=; b=C1jvtuqe5qNkeVX5uh8/jDNPMG
 4mWCSIWfgWlif/zyQI2Bs6LJz0Smy0ZxUsUSPNAoa3FTHq0Mqrm4kAdxtkeme0dPy9XRc87Cujxrc
 RCHjeG6wSj2Z7Ir5mwC8Isq091CvojfepTjelVs/Sn9L6v9l4D+pUv5qZ/PG5rOojJgs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYTbs-0002qF-OZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 17:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EF9CA4252B;
 Thu, 16 Jan 2025 17:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97462C4AF09;
 Thu, 16 Jan 2025 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737048282;
 bh=FZHDVA07TuX/CpfIs82bSFvSPD6dz+VV672WlmDYwVo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W0eLJrMwWmk+t2Y35jcsjkPkmFHHQT8NN3AcJATjQwDfn5x1YDTmoMbNYfVlQRVFX
 iH+VUXG9jwSERdS61zxABG/cT/UQmK7Xc42ckYDkBgCh07Q0QCrslj0+4LGUINht0H
 x2OkE6vxO3qwXhbBBAzFhWPI5GpN9Givxw/A1ZB3Yl5aVPbFKS1JmLavear26oSZsh
 GuM84GZ9g/Vvkh/Cfm2U9uVEH6662qUSDk9OCTgG1t3/1VV/SaosqthcwTFlVrxrpM
 jcKQu9Zg8wDfQoBzT8rlglMx7MKL9ofs27WQfc3jW+z/QlrLKQCP1CV7sATaIZxkfo
 XHItPrRmScbTA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 16 Jan 2025 17:19:44 +0000
Message-ID: <20250116172438.2143971-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250116172438.2143971-1-jaegeuk@kernel.org>
References: <20250116172438.2143971-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yi Sun <yi.sun@unisoc.com> Function
 f2fs_invalidate_blocks()
 can process consecutive blocks at a time, so f2fs_truncate_data_blocks_range()
 is optimized to use the new functionality of f2fs_invalidate_blocks(). 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYTbs-0002qF-OZ
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Optimize
 f2fs_truncate_data_blocks_range()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Yi Sun <yi.sun@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yi Sun <yi.sun@unisoc.com>

Function f2fs_invalidate_blocks() can process consecutive
blocks at a time, so f2fs_truncate_data_blocks_range() is
optimized to use the new functionality of
f2fs_invalidate_blocks().

Add two variables @blkstart and @blklen, @blkstart records
the first address of the consecutive blocks, and @blkstart
records the number of consecutive blocks.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 902f8f50cc27..6572970a988a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -621,8 +621,11 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
+	block_t blkstart;
+	int blklen = 0;
 
 	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
+	blkstart = le32_to_cpu(*addr);
 
 	/* Assumption: truncation starts with cluster */
 	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
@@ -638,26 +641,44 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		}
 
 		if (blkaddr == NULL_ADDR)
-			continue;
+			goto next;
 
 		f2fs_set_data_blkaddr(dn, NULL_ADDR);
 
 		if (__is_valid_data_blkaddr(blkaddr)) {
 			if (time_to_inject(sbi, FAULT_BLKADDR_CONSISTENCE))
-				continue;
+				goto next;
 			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
 						DATA_GENERIC_ENHANCE))
-				continue;
+				goto next;
 			if (compressed_cluster)
 				valid_blocks++;
 		}
 
-		f2fs_invalidate_blocks(sbi, blkaddr, 1);
+		if (blkstart + blklen == blkaddr) {
+			blklen++;
+		} else {
+			f2fs_invalidate_blocks(sbi, blkstart, blklen);
+			blkstart = blkaddr;
+			blklen = 1;
+		}
 
 		if (!released || blkaddr != COMPRESS_ADDR)
 			nr_free++;
+
+		continue;
+
+next:
+		if (blklen)
+			f2fs_invalidate_blocks(sbi, blkstart, blklen);
+
+		blkstart = le32_to_cpu(*(addr + 1));
+		blklen = 0;
 	}
 
+	if (blklen)
+		f2fs_invalidate_blocks(sbi, blkstart, blklen);
+
 	if (compressed_cluster)
 		f2fs_i_compr_blocks_update(dn->inode, valid_blocks, false);
 
-- 
2.48.0.rc2.279.g1de40edade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
