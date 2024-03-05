Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DD8728EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Mar 2024 21:48:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhbiS-0005iN-3b;
	Tue, 05 Mar 2024 20:48:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rhbiQ-0005iG-Rf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 20:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pG2M6thpR2fxv/cCgdOBLkXzlO1KJ8VJ0xaAc50m5DM=; b=CqK+Q4hnUjboJEjREADyYDBgdj
 akuZsIUbH03PlAzXnbpbNpCNT/6LjNb8I3h3F92bFkOsPgdfGRuwbSvUyDRGCR4DeUdBnzRXtKtjf
 Ev0ysHysr7v2DDgalZbpUR3e/zTxNRyn0pcK2pi7t0Qob3RwPywB2rqFQ6NLi+u5DS4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pG2M6thpR2fxv/cCgdOBLkXzlO1KJ8VJ0xaAc50m5DM=; b=a
 IHXI+smMu6RSq9e5EEA794rTQv2VqRGEkmgFvSifPdUG2hx5Ut+DJZbte/vJCqrWHpSaP4bk8ObGg
 fiIvEyaoa2FnO5EnlqD8sagqQZlMAeSngVpNNJkhrAgyNKLnX99zuL8stcPtYLvgkomqIdbcJ5ZZW
 ddBpY/pRKrVpKwHE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhbiL-00034e-2z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 20:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C70A461881
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Mar 2024 20:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64531C433C7;
 Tue,  5 Mar 2024 20:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709671716;
 bh=c725NZ+JXAH0HO2pzrmB9FWlT0zD3VuNnZ/S7Dr1ZGs=;
 h=From:To:Cc:Subject:Date:From;
 b=OacZULvyg98zFsHZ4YRp4FNuU+Tx++LqtlssKy+ZQCMSjlYrdHFbbt8mnjR/UgLYT
 g5pEZHLQHJRuF1mL+v5/T2usaZkEEp6N+s3htxFAlm/a4UaKR0JQQ9mH6FdgvsW1M4
 5vNEuITslYZbnrMKMUko3EKsgArIbnojj9JjWaANjw/fPUzWaniN0C+PDbkhKsQp5t
 DDGXUedmapWBpWm4ztKMHlIIm1ipcUxtZsz4aDtm8/m9asdBgYwi2GhWOsmvDDJEio
 Fjzf+pNbqrWRI6sLpHoUsA+GH83SbRA85nkzfxsWc0w3KVzCglqmkOhmU+aPfEevJV
 m29p8Nf44FUEA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  5 Mar 2024 12:48:34 -0800
Message-ID: <20240305204834.101697-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This fixes some android build failures due to the missing
 permission when checking the loop device. Until we get a better solution,
 let's ignore the error with warnings. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- lib/libf2fs.c | 12 +++++++++--- 1 file changed, 9 insertions(+),
 3 deletions(-)
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhbiL-00034e-2z
Subject: [f2fs-dev] [PATCH] f2fs-tools: deal with permission denial on
 non-root user
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

This fixes some android build failures due to the missing permission when
checking the loop device. Until we get a better solution, let's ignore
the error with warnings.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d51e485361ee..1cfbf31a9c85 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -854,9 +854,15 @@ int f2fs_dev_is_umounted(char *path)
 
 			loop_fd = open(mnt->mnt_fsname, O_RDONLY);
 			if (loop_fd < 0) {
+				/* non-root users have no permission */
+				if (errno == EPERM || errno == EACCES) {
+					MSG(0, "Info: open %s failed errno:%d - be careful to overwrite a mounted loopback file.\n",
+							mnt->mnt_fsname, errno);
+					return 0;
+				}
 				MSG(0, "Info: open %s failed errno:%d\n",
-					mnt->mnt_fsname, errno);
-				return -1;
+							mnt->mnt_fsname, errno);
+				return -errno;
 			}
 
 			err = ioctl(loop_fd, LOOP_GET_STATUS64, &loopinfo);
@@ -864,7 +870,7 @@ int f2fs_dev_is_umounted(char *path)
 			if (err < 0) {
 				MSG(0, "\tError: ioctl LOOP_GET_STATUS64 failed errno:%d!\n",
 					errno);
-				return -1;
+				return -errno;
 			}
 
 			if (st_buf.st_dev == loopinfo.lo_device &&
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
