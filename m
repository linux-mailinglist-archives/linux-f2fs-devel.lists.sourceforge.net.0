Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF592262F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 May 2019 07:06:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSE1n-0004Nd-Br; Sun, 19 May 2019 05:06:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hSE1m-0004NW-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 05:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HYAZdcrrn5bAJfePKAQXriX1mG8/fQ1QXO12b97DscA=; b=RYBnRKG7sJwFxFLv4KOhjZtiHf
 R++9VP025uxXU7YD75CIJc4x5mMi0xpk2AGVgXdjNlkxWTm3FGqI41EAFOVyOuwXsHv7rS7znrWkz
 sPP1jVMBG/sVRalr6pKEANAO+ldFkDnhsCUbYjIBLiFt86gQPEMf5sZ39fV51tlYYD+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HYAZdcrrn5bAJfePKAQXriX1mG8/fQ1QXO12b97DscA=; b=OICSGvqlZZRrWeEtsSFx4Yyk+2
 cit1W6r+J2NSE457hP8l4EVQtcD56NR5gYuQGG94OqriN/37Xyl0aV7d78wZzjSet7YianwnPSVI4
 a0ZuC7nN2LQI+zViDLTkpokt571P3VhFJr2el0vnKd3sx6mdYmCM7AWjIscWkytehAQM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSE1l-007ByR-9W
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 05:06:30 +0000
Received: from localhost.localdomain (unknown [49.74.66.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95FF020848;
 Sun, 19 May 2019 05:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558242382;
 bh=Bzxj0lcjhW5D/Y7xENk/Ctr5kc8rvP/elTdnfKwCkH0=;
 h=From:To:Cc:Subject:Date:From;
 b=EX493F0cJJn1qkmKUULcmth/yRvSQnHDwiQO1wa+QVlDQtlyZYkzXK7UFjzifjFF7
 BfrrUVdnw/rxxAmRfbgwCDWpW8sCYzt288SKZl/+SuF3U5GoUrWyeQYla1SE7fCzTn
 UjqeiQw5QxEJDWau75hGwdu2T5cAVE6vRTzas6zk=
From: Chao Yu <chao@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 19 May 2019 13:05:52 +0800
Message-Id: <20190519050552.6333-1-chao@kernel.org>
X-Mailer: git-send-email 2.18.0
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSE1l-007ByR-9W
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix to repair cp_loads blocks at
 correct position
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
Cc: jaegeuk@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

Let's fix the wrong start offset of cp_payload blocks in
fix_checkpoint().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6075d22..10a62fd 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2104,8 +2104,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 
 	for (i = 0; i < get_sb(cp_payload); i++) {
-		ret = dev_write_block(((unsigned char *)cp) + i * F2FS_BLKSIZE,
-								cp_blk_no++);
+		ret = dev_write_block(((unsigned char *)cp) +
+					(i + 1) * F2FS_BLKSIZE, cp_blk_no++);
 		ASSERT(ret >= 0);
 	}
 
-- 
2.18.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
