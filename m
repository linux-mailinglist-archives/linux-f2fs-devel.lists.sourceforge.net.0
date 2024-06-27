Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A400791A031
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jun 2024 09:15:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMjM6-0006S9-DI;
	Thu, 27 Jun 2024 07:15:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sMjM5-0006S3-Rz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jun 2024 07:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ncdmrzn1UTivSbhN4R1ZyFbQdEY58Ne4VD9P5vwBcM=; b=hsZvMa6Aswz8W/ge+AXzJhjhcn
 dRf0RlclSsb3YV+kvTMKtWYEo/Df4qN9J5MBY8cmgjos9GVTUGI0tYol84Cmb5/hyqURfreJ2M3DF
 71wUr2dn1g9JQnY41nXlsYyd/RmIDiOSgh7TETVMm+qaX0weS+9mr1nNNKlF+EY71xFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4ncdmrzn1UTivSbhN4R1ZyFbQdEY58Ne4VD9P5vwBcM=; b=W
 sZ4Xjmw1cx/JQKTRWsjg01YawVEEOzDyVxtAKdStg4xXNplNhEp2ej5b5KcxgxDM3SO3+hGZQi2G5
 ab1m3HbhItNuFT5KqjosnFyl57H+35FgViA8I0YNLqJdA7mdK+aEeHX+C2XCansWKA1p07LJohwv1
 zLR5kDHnjFLHLDkw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sMjM6-0001JP-UQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jun 2024 07:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 79A06CE0B62
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jun 2024 07:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB8CC32786;
 Thu, 27 Jun 2024 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719472529;
 bh=vJTYGJ4aYXC9z7eTs4SAfiTyTPPHXRhEbhAa2JgUdbg=;
 h=From:To:Cc:Subject:Date:From;
 b=KPhMUtlzGjvaRXQjc2bknCW4E+BB67tKU3CHeehRuAUOypxQIyHEfLs9Im69pVWZz
 B1SGYfCH7cj/X7IZO6UQKOtNXcaWlBCPNEN8+V0pG+3naTTY+S0xyrQcY77+aBW8T5
 ueYx8VpyIryfzaC4LspGexGk49DLZ0uWy9/g2AzOg/HA6flwfpUW5P7XAaASQWp8Mz
 VdwqByLt7DwVeXDAsGknlzhceyhWqJeWfgwWiLnK/rSr9DmxR5/VCWVrvRxHhdUbY0
 luAjPCf1VLyny0L8yTz68iftdoeINc5O1AZ6EztR8mEKmGM+mKsd8oZ5ho2/Koe8yF
 JLO0s9e7HUDIA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 27 Jun 2024 15:15:21 +0800
Message-Id: <20240627071521.1557830-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sMjM6-0001JP-UQ
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to avoid racing in between read and
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

In LFS mode, if there is inflight dio, let's wait for its completion,
this policy won't cover all race cases, however it is a tradeoff which
avoids abusing lock around IO paths.

Fixes: f847c699cff3 ("f2fs: allow out-place-update for direct IO in LFS mode")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- wait for direct IO's completion before read IO.
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9e171e138943..76a6043caf27 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4608,6 +4608,10 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
 					iov_iter_count(to), READ);
 
+	/* In LFS mode, if there is inflight dio, wait for its completion */
+	if (f2fs_lfs_mode(F2FS_I_SB(inode)))
+		inode_dio_wait(inode);
+
 	if (f2fs_should_use_dio(inode, iocb, to)) {
 		ret = f2fs_dio_read_iter(iocb, to);
 	} else {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
