Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C5916A33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 16:25:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM76y-0005p0-DA;
	Tue, 25 Jun 2024 14:25:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sM76w-0005ol-Va
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 14:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sWwRbphQxNkhlWnvN2g4StYXDd5ozpCxSQVYCCN61CU=; b=TvxwR4JTrDuoWPzAvVM87Dxcvq
 NzOUo0wK8jYQ0E4csaT+QC+NV4T9cyWuUBwzAaHrD0L4PqML1wT/RNbQ9x2CZMQ86s1dqwmm26ONU
 Kr3sym63zoLw90qxL2WTUEPHjw8YzFudZFOgjsjo5JoojCNj2pVY+YBFl8KmMLz811fU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sWwRbphQxNkhlWnvN2g4StYXDd5ozpCxSQVYCCN61CU=; b=e
 xpFZr/1jJYwSCrOkjsMVtp/HvtwFhEKPuu47f9fyFOTKR+C3kRqZ5itgdVoPuw91bVH9s2basa1zu
 Bd89RV86g68CpBGun0f1Q4DwzzynU/0aYz4yJkw57HVP21Vu0N3fbdx4MUAx3PQf07Y6Qh6cGeAZ/
 bsMTBfmFljn01P+A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM76x-0007xz-E5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 14:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 521AC6147B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 14:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D219CC32786;
 Tue, 25 Jun 2024 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719325520;
 bh=KCiRHdEYUu5KhYIjzP1/grjHbsL7+5UhfKsfbxFLVBM=;
 h=From:To:Cc:Subject:Date:From;
 b=R2R/5hMO+8nyXlR2C1cnBmTaeuCpRGBVUp7sW/IVnPrWbxcbjA7EFBQ7XLRF3VD8Q
 vaXyPyotbIEjoMEsuzvkLTYieLSG3U35uTQ2/ywoIk9WcnWC9EUh5AAyvi1cZBAOAR
 wLXGKheFw4bwHjwaMqS7HcPBCfobqB1l56iYt/0gWZ7dMgJmwhsU64Oro57FJlekph
 a0JVFGLtZx1+FYctUwzZzaOcwC7MS+vP/FQf7PtRu+mOGbIWYDV+mQQxw+w1U4rlRR
 7FC55fYrIB+y5e0ikHJkl7/gjaQ3y2ulU7iN6muDj0GCdkIpxKsmwCYW7LwGNT/BLC
 U8vscqIKtDRkQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 22:25:12 +0800
Message-Id: <20240625142512.3916063-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If lfs mode is on, buffered read may race w/ OPU dio write
 as below, it may cause buffered read hits unwritten data unexpectly, and
 for dio read,
 the race condition exists as well. Thread A Thread B - f2fs_file_write_iter
 - f2fs_dio_write_iter - __iomap_dio_rw - f2fs_iomap_begin - f2fs_map_blocks
 - __allocate_data_block - allocated blkaddr #x - iomap_dio_submit_bio -
 f2fs_file_r [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sM76x-0007xz-E5
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read and
 OPU dio write
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If lfs mode is on, buffered read may race w/ OPU dio write as below,
it may cause buffered read hits unwritten data unexpectly, and for
dio read, the race condition exists as well.

Thread A			Thread B
- f2fs_file_write_iter
 - f2fs_dio_write_iter
  - __iomap_dio_rw
   - f2fs_iomap_begin
    - f2fs_map_blocks
     - __allocate_data_block
      - allocated blkaddr #x
       - iomap_dio_submit_bio
				- f2fs_file_read_iter
				 - filemap_read
				  - f2fs_read_data_folio
				   - f2fs_mpage_readpages
				    - f2fs_map_blocks
				     : get blkaddr #x
				    - f2fs_submit_read_bio
				IRQ
				- f2fs_read_end_io
				 : read IO on blkaddr #x complete
IRQ
- iomap_dio_bio_end_io
 : direct write IO on blkaddr #x complete

In LFS mode, if there is inflight dio, let's force read to buffered
IO, this policy won't cover all race cases, however it is a tradeoff
which avoids abusing lock around IO paths.

Fixes: f847c699cff3 ("f2fs: allow out-place-update for direct IO in LFS mode")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 278573974db4..866f1a34e92b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -882,6 +882,10 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 		return true;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		return true;
+	/* In LFS mode, if there is inflight dio, force read to buffered IO */
+	if (rw == READ && f2fs_lfs_mode(sbi) &&
+			atomic_read(&inode->i_dio_count))
+		return false;
 
 	return false;
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
