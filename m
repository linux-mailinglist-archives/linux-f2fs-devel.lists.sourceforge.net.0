Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A090BD4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Aug 2019 03:03:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyn8B-0002ln-9f; Sat, 17 Aug 2019 01:03:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hyn8A-0002le-Vu
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Aug 2019 01:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yztsGLqxehLgnkdVZ8BCW+33XSukbLZRiFEk4Nd9kxs=; b=hjtOAegpc9Ejfh3yRBuT0Tv2z+
 sUHOKtppWd5bOJDxYOj2Sg/Komb+rFW66cSa+laqzlkEjHxAuioTy5WbFU8ESZoqgjeYzC717rpiM
 1z3VboVyyOgkzIES/F8sO0dlbKHILpAn/ceCFylQoCXg1dVG7GDf8KTxJmzlwxTwOc0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yztsGLqxehLgnkdVZ8BCW+33XSukbLZRiFEk4Nd9kxs=; b=I
 WH1U3iERsBClkuX6IJ+6dkOlpsiSg5A9ZqERodjOpNlO3Su6rOhY1P0sTnDSaXpj8iCnm9Af0bA8y
 f1aDjrVJY62nCf7e9jIinY2ryIPs/LIryOd98cF5RmHZuzSMbLZ2Y5REGM29FUZYoEiXFYofGwuF0
 jMvpdYWI1YrvPrNk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyn80-008xxT-KI
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Aug 2019 01:03:42 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9B5E2077C;
 Sat, 17 Aug 2019 01:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566003807;
 bh=QBFFL/SHbo+UhA75igny1+g1F36ODanpVH8hj8R9+XU=;
 h=From:To:Cc:Subject:Date:From;
 b=bbB69qDsxY7qlqdxYbIDBFyF/GrTti8KwKJtCUizP2gnd+iE5jWs3mqgtzTXkskFU
 +N9D0Wfms52I3/pAYf1swLe76aX5Mn4pevnwgcGxl5kAkOtIyi0jAsrmXF1LSq8axy
 guQESlusXpspDZF4cdMFoG6T0+fc/Ox8M3TQ5VvE=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Aug 2019 18:03:25 -0700
Message-Id: <20190817010325.36501-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyn80-008xxT-KI
Subject: [f2fs-dev] [PATCH] fsck.f2fs: check only max extra_isize
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

If we use later kernel having larger extra_isize, old fsck will delete
entire old files.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 1708abe..b4e53db 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -731,7 +731,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	if (f2fs_has_extra_isize(&node_blk->i)) {
 		if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
 			if (node_blk->i.i_extra_isize >
-				cpu_to_le16(F2FS_TOTAL_EXTRA_ATTR_SIZE)) {
+						4 * DEF_ADDRS_PER_INODE) {
 				FIX_MSG("ino[0x%x] recover i_extra_isize "
 					"from %u to %u",
 					nid,
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
