Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C28E2D0D73
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 10:55:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmDEk-0001Bx-13; Mon, 07 Dec 2020 09:55:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmDEg-0001Bm-J2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KJFe1QaHxCFRHE5sUFO0KIASBofWpnyneME0Cl6sH1s=; b=E0hgR158zn0+JsLuK9wJJABUul
 lgQq8jMjJl3lEOgn4EuFeM5QpkzPhpn9+iboegfypbiNGt0xWjDiSpZ+44KFTFweL00noNo3FX3YH
 0GBECNTwOLKG5kgHkqwaH5p5aUYAvrOMYgRGzgBS0smmUTd0Th5yqtvuvD/wnV0NHDQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KJFe1QaHxCFRHE5sUFO0KIASBofWpnyneME0Cl6sH1s=; b=F
 IVX1riqV0GbM8d3aPqPcSuSSik6obEsvr8oIAhC5R+RNfjqDrhfzzHRw7ht8luC0qgOGAHUY89LN6
 XLfOoBuSidBeWQKFpQ6A6oe4diy9SQaLjVfYP5mCuF7giB9siknEFpdkqzHHEpSyKjfrPWuFr1Lp6
 h71LHUAAzhb65TXQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmDEc-001mj6-PS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:55:14 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqJYr4FQMzkltR;
 Mon,  7 Dec 2020 17:54:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 17:54:55 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 7 Dec 2020 17:54:41 +0800
Message-ID: <20201207095441.73567-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmDEc-001mj6-PS
Subject: [f2fs-dev] [PATCH] f2fs: fix to account inline xattr correctly
 during recovery
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

During recovery, we may missed to update inline xattr count correctly,
fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/node.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e65d73293a3f..3a24423ac65f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2594,9 +2594,15 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
 
 	ri = F2FS_INODE(page);
 	if (ri->i_inline & F2FS_INLINE_XATTR) {
-		set_inode_flag(inode, FI_INLINE_XATTR);
+		if (!f2fs_has_inline_xattr(inode)) {
+			set_inode_flag(inode, FI_INLINE_XATTR);
+			stat_inc_inline_xattr(inode);
+		}
 	} else {
-		clear_inode_flag(inode, FI_INLINE_XATTR);
+		if (f2fs_has_inline_xattr(inode)) {
+			stat_dec_inline_xattr(inode);
+			clear_inode_flag(inode, FI_INLINE_XATTR);
+		}
 		goto update_inode;
 	}
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
