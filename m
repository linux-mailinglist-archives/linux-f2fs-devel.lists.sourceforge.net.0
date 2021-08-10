Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8703E5B8D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Aug 2021 15:27:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDRmz-0006Hp-Nn; Tue, 10 Aug 2021 13:27:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mDRmt-0006He-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 13:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N927YcdXf9hle5XN4OHDTiWwc+jdIbiPrckL9ngM/9w=; b=UYiEwqr4CoqN8GEHjwNqdoEEUy
 ga+dFJtukuVWQdiXqlHBhCwVYFe4eUjQz8iiM3MAYIKgXfBCPGI0losULkDp9Wsc28cw+N6Nr/Exz
 UvRdyKzxegcGwKc5XYBTCnlca9O1V366UWBli/cw4qC0iskGJYw39E2ixl4pYZnLr33E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N927YcdXf9hle5XN4OHDTiWwc+jdIbiPrckL9ngM/9w=; b=O
 D+nFSfoBWFJauapK5elIQRerJPaHnJE5KslAYA8pkXnEwXjFary/aS+ibAqE8SKdxM0ynJINlB1At
 X38nRa+07qDejTtDPyVaDribSQLTgoL6QK7Pb7xAIjCeW9CmqehicX0amvBS/J7OgTqWdee/TFber
 Y/RFbpPvGznIbPAI=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDRmp-001tpU-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 13:27:23 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 94FD3C40070;
 Tue, 10 Aug 2021 21:27:08 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Aug 2021 21:27:06 +0800
Message-Id: <20210810132707.349147-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJPGR5WQhlNGh5MHU5MGh
 9CVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pz46Lio5Ej9NTCwpOhVWHgoT
 E0gwCQJVSlVKTUlDTUtJS0lCTUlKVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUpDS003Bg++
X-HM-Tid: 0a7b303ed2d5d996kuws94fd3c40070
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mDRmp-001tpU-Fv
Subject: [f2fs-dev] [PATCH] f2fs: correct comment in segment.h
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

s/two/three

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 050230c70a53..89fff258727d 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -142,7 +142,7 @@ enum {
 };
 
 /*
- * In the victim_sel_policy->alloc_mode, there are two block allocation modes.
+ * In the victim_sel_policy->alloc_mode, there are three block allocation modes.
  * LFS writes data sequentially with cleaning operations.
  * SSR (Slack Space Recycle) reuses obsolete space without cleaning operations.
  * AT_SSR (Age Threshold based Slack Space Recycle) merges fragments into
@@ -155,7 +155,7 @@ enum {
 };
 
 /*
- * In the victim_sel_policy->gc_mode, there are two gc, aka cleaning, modes.
+ * In the victim_sel_policy->gc_mode, there are three gc, aka cleaning, modes.
  * GC_CB is based on cost-benefit algorithm.
  * GC_GREEDY is based on greedy algorithm.
  * GC_AT is based on age-threshold algorithm.
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
