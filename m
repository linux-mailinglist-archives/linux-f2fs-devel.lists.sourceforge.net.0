Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A261A587EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jun 2019 19:05:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgXpf-0002q0-1N; Thu, 27 Jun 2019 17:05:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hgXpd-0002pa-32
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jun 2019 17:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6EYRpwIh3zFUAGBoGM/TbzUOLE3KJ6lFOkFt1xq7hho=; b=HglcAIwCqvoUJWcieJftmoah5z
 iiodVATRVO3hM0nl+Gn/UlBiyi041zex2jfCPidqcptOU9C/T9a7TBqpKcEpuT8TR/Zr5nxrTYJoc
 C1lPKxSEEHG/HbchIHMQFGNU8hffCwVO/NH1XNF+/N5OvhmtLs746CD4p/TTtK8HcHIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6EYRpwIh3zFUAGBoGM/TbzUOLE3KJ6lFOkFt1xq7hho=; b=j
 38xq10UmX2VfEL+OOwUJ9QbVpvCg24afyMBZrLQHOiGX1bjQeGAJzpTIYuArRopzRXsCXnaNMO/zi
 vEj1A0ANAifWrEs34IJQN+RKwZHepR8NEkaomLklo30nP/GaS75nd/5S1EPhHCr9WzEtqGafHpm+4
 x5G0silfp68a80us=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgXph-00Gv1M-Rx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jun 2019 17:05:14 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C257F20659;
 Thu, 27 Jun 2019 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561655105;
 bh=VtbDzrEliM8ZNaN7HaceyqdJC4IAY9HnrzQS56Uhm2A=;
 h=From:To:Cc:Subject:Date:From;
 b=zC1Ze2DpXm5s0+vhbpsM3KmvnE494N6tYjhLyy/LLyEY5Ssc3jod5fPxmSZKRGHSW
 63FMhpChlaD9x2wXpVODyZtPmbl8W+zmJfCT1+syTJ97E1LcNgiu4olbdPv/zfpsPi
 cSSyiXQkFSU14EbrEYw/WzxyZHHR4OeEYtlpVNkU=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 27 Jun 2019 10:05:04 -0700
Message-Id: <20190627170504.71700-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hgXph-00Gv1M-Rx
Subject: [f2fs-dev] [PATCH] f2fs: allocate blocks for pinned file
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

This patch allows fallocate to allocate physical blocks for pinned file.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e7c368db8185..cdfd4338682d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1528,7 +1528,12 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	if (off_end)
 		map.m_len++;
 
-	err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
+	if (f2fs_is_pinned_file(inode))
+		map.m_seg_type = CURSEG_COLD_DATA;
+
+	err = f2fs_map_blocks(inode, &map, 1, (f2fs_is_pinned_file(inode) ?
+						F2FS_GET_BLOCK_PRE_DIO :
+						F2FS_GET_BLOCK_PRE_AIO));
 	if (err) {
 		pgoff_t last_off;
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
