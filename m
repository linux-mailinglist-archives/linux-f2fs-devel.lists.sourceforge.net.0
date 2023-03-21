Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA5A6C2628
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 01:00:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pePQL-00031N-VS;
	Tue, 21 Mar 2023 00:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pePQI-00031G-AI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 00:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Unz6Ep/J+KkWQe6KYaGo6V146kFAdWL/OZVFaGtTt8=; b=d3XxZxok/ysJs23XzF05w6ocgT
 JvlzzPB13RcHsBk2a1JSI92GpY2foYASqwI2Xze4mzOUnbQx+FGIskudXfWdhXViR2jpzt+6KTqrM
 kabGJPpdjBC7uSlH6adpuKCKyY/2Cn34sZ0pnDCwffi2FBqa8t1h2lHfhoEmContEteo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/Unz6Ep/J+KkWQe6KYaGo6V146kFAdWL/OZVFaGtTt8=; b=a
 M2iGqR5y8NUf/13GmxERikraCJOW+NBqI0Ra5YMdKiwPL5zFbZK169NVZM4x2qmFtgx2bTiQ2JL3g
 I/8SoX2Ny7+IPruA/UNZMNGFTzgkh5rLFuAPZTTEW5VwKIgTB0le5UYqzaqY+vffzOoT9k16Hg/P0
 tGTMU3LaXq6/1AfM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pePQD-00EhVx-G7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 00:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEE9B61839
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 00:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E00AC433EF;
 Tue, 21 Mar 2023 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679356803;
 bh=MZ3GC9ZAZ5iqR7vJLDt1Ui1LAXId1OikJ19AfHXKvvc=;
 h=From:To:Cc:Subject:Date:From;
 b=fXjdgUPrjL85FxzhHUvslXXWvfaPqVNc8CoAN+3IJS2nlYs0OM4LcOrpmmAfhM/Sn
 N5mLEr5hbeD3UWZsKHzZ9qbQe6bndVT8WYnWqDanTefNLZ9CubHemuVrwanQvpJR96
 2A9zerEqV928WJww4Z+nuF+6cMFIWWUDOxbcUGhH5BfJX0UoLEOPlojcrZpcIGlHvs
 Vz8U5+WltjST3dOFUvwO5bNai98fPnehEdkNx63rseviSzhHFu3L3+/i4N0ZRKXJV3
 1d6rrhsUP/dKqhkcOISiGfvchJxIH0HgH+swRAjEM1BA6N/IX5Ub6jide4NEcR3U3A
 mS6/pNsUGi8jA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 20 Mar 2023 17:00:01 -0700
Message-Id: <20230321000001.1793472-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Report_zone is not supported on normal partition.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/fsck.c | 3 +++ 1 file changed,
 3 insertions(+) diff --git a/fsck/fsck.c b/fsck/fsck.c index
 1b6f2c20b2b3..324c3d5d9304
 100644 --- a/fsck/fsck.c +++ b/fsck/fsck.c @@ -2462,6 +2462,9 @@ static int
 check_curseg_write_pointer(struct f2fs_sb_info *sbi, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pePQD-00EhVx-G7
Subject: [f2fs-dev] [PATCH] fsck.f2fs: don't call report_zone on normal
 partition
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

Report_zone is not supported on normal partition.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 1b6f2c20b2b3..324c3d5d9304 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2462,6 +2462,9 @@ static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (i >= MAX_DEVICES)
 		return -EINVAL;
 
+	if (c.devices[i].zoned_model != F2FS_ZONED_HM)
+		return 0;
+
 	/* get write pointer position of the zone the curseg points to */
 	cs_sector = (cs_block - c.devices[i].start_blkaddr)
 		<< log_sectors_per_block;
-- 
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
