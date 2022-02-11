Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C02EB4B1E52
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 07:13:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIPBi-0004Ki-5H; Fri, 11 Feb 2022 06:13:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nIPBg-0004KO-4O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rf6QTlP77Kweu3uJRo9Rphkt9DZCQKZc+Hho8D6cktE=; b=fhKbcvbuz3LRG5QYYT3V6BtRtZ
 JBpCeym978b2R/HlW9fxK99Fd2lgR/yYrLVmvtTD7jbBrVLVA91d8+N4gK89uzm4S/n2FXeRqRPjp
 5o+FzkkZrkmg9vOHXZpmG67RVs3j4iZoQVIqVEzaP5Sy7nVDtPCi2/+2RmNhs7WtgUGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rf6QTlP77Kweu3uJRo9Rphkt9DZCQKZc+Hho8D6cktE=; b=SECG0Ip3jFsoHqwC4u4GHYSYwS
 JjtFKNwvFB8QTH3Xx3n4e6k22knpse03VWpk26+55EE/vYa9lnSNKLitcRZkfkn7ehIHaS9y3UTFH
 7rvpVvoN2ZgUcfvF3uWP7SE5Ax6VRHWk9kzTddbpnVaGNlvhr0ir2yLoA3N4pZaXIP0w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nIPBb-00Eztt-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:13:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E598B82460
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Feb 2022 06:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE1CC340EF;
 Fri, 11 Feb 2022 06:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644560009;
 bh=vhM6qsL6M2MiDMhTx+WrvUJcU5c9VPUqlvPhmVlMB+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nlhToVCVIAu6n0s9QL9NidGb0US62yeO8QvDLndGbWocnvKOkVBeOZuQ5yHenv3LL
 DBYF3OePtkqa862dgWcAbI/b5X9MV2PY3CMwiZJl8wBFksXv4AElpu3UYxMU3b4nRF
 eXYn3sLmzQB14zD0C+laCyVS0VlcbiV/7FvH1YV2lM7vMOlQwR+nfbgxjjd78IzHoQ
 2afo3yCNI5o2kyfZVZVVO/8jauLSpxjNGq7vYCHGBiPIQAQpmW6gnIOIn7dPTRWFz2
 8AWX/2+i1prF/Rv8Pv/PtTuoXA4iKpCZ5nXKBFOJ3z+2WCVo8ucAQjfsHFmF1X1PHm
 6vvOESB5FFmng==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 10 Feb 2022 22:11:57 -0800
Message-Id: <20220211061158.227688-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211061158.227688-1-ebiggers@kernel.org>
References: <20220211061158.227688-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> f2fs only allows
 direct I/O that is aligned to the filesystem block size. Given that fact,
 simplify f2fs_force_buffered_io() by removing the redundant call to
 block_unaligned_IO().
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nIPBb-00Eztt-Pi
Subject: [f2fs-dev] [RFC PATCH 6/7] f2fs: simplify f2fs_force_buffered_io()
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

f2fs only allows direct I/O that is aligned to the filesystem block
size.  Given that fact, simplify f2fs_force_buffered_io() by removing
the redundant call to block_unaligned_IO().

This makes it easier to reuse this code for STATX_IOALIGN.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 61ff0fc16e160..9cc985258f17e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -807,19 +807,7 @@ int f2fs_truncate(struct inode *inode)
 	return 0;
 }
 
-static int block_unaligned_IO(struct inode *inode, struct kiocb *iocb,
-			      struct iov_iter *iter)
-{
-	unsigned int i_blkbits = READ_ONCE(inode->i_blkbits);
-	unsigned int blocksize_mask = (1 << i_blkbits) - 1;
-	loff_t offset = iocb->ki_pos;
-	unsigned long align = offset | iov_iter_alignment(iter);
-
-	return align & blocksize_mask;
-}
-
-static inline bool f2fs_force_buffered_io(struct inode *inode,
-				struct kiocb *iocb, struct iov_iter *iter)
+static bool f2fs_force_buffered_io(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
@@ -839,12 +827,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	 */
 	if (f2fs_sb_has_blkzoned(sbi))
 		return true;
-	if (f2fs_lfs_mode(sbi)) {
-		if (block_unaligned_IO(inode, iocb, iter))
-			return true;
-		if (F2FS_IO_ALIGNED(sbi))
-			return true;
-	}
+	if (f2fs_lfs_mode(sbi) && F2FS_IO_ALIGNED(sbi))
+		return true;
 	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
 		return true;
 
@@ -4280,7 +4264,7 @@ static bool f2fs_should_use_dio(struct inode *inode, struct kiocb *iocb,
 	if (!(iocb->ki_flags & IOCB_DIRECT))
 		return false;
 
-	if (f2fs_force_buffered_io(inode, iocb, iter))
+	if (f2fs_force_buffered_io(inode))
 		return false;
 
 	/*
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
