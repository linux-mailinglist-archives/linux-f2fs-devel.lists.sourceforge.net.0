Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14153896A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 03:08:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nvqN0-0003n6-Ft; Tue, 31 May 2022 01:08:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jack.qiu@huawei.com>) id 1nvqMz-0003n0-7M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 01:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9PVsc8Z7NFxY5JZvPXJiMF79AKZc1tgJXA4hcDWC4K4=; b=CJgqUIYnmYBBTAjmt25h0nCtiq
 N4swEwrb6g7w2n5PSxIc+up0UV/dB5gFuEYciGfmDvzjG9fAyk9YsmoShqHq3Ua7X1Z+toqhH8U3f
 bi7foyiecaiC8zivfWZ1UNwkqTTN5Pe4eJHswRScwpE/obEeqCrtgAsyMhdcLkidNpBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9PVsc8Z7NFxY5JZvPXJiMF79AKZc1tgJXA4hcDWC4K4=; b=B
 OFpp/q1gsCrsVkfKHSmIg9q21IEFbJeTiEdZXVeuOLNBd2kZsU1XAMysV9FltDZ8rKHHkPTT96xug
 TuNv7/w30Hn/N84ov+1YRpT/sBdvZ6uqF/EXhQUXmTwk5tU13vFnEm8ZxycBXj6AadzMhQsi0oU98
 1cfumkVts3UC9Ah8=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nvqMt-0007YL-O5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 01:08:25 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LBvFn67g0zQkCM
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 May 2022 09:05:01 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 31 May 2022 09:07:45 +0800
Received: from huawei.com (10.175.101.6) by dggpemm500008.china.huawei.com
 (7.185.36.136) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 31 May
 2022 09:07:45 +0800
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 31 May 2022 09:16:56 +0800
Message-ID: <20220531011656.608641-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500008.china.huawei.com (7.185.36.136)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Current error handling is at risk of page leaks. However,
 we dot't seek any failure scenarios, just use f2fs_bug_on. Signed-off-by:
 Jack Qiu <jack.qiu@huawei.com> --- fs/f2fs/file.c | 8 ++++---- 1 file changed, 
 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nvqMt-0007YL-O5
Subject: [f2fs-dev] [PATCH] f2fs: optimize error handling in redirty_blocks
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
From: Jack Qiu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jack Qiu <jack.qiu@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Current error handling is at risk of page leaks. However, we dot't seek
any failure scenarios, just use f2fs_bug_on.

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/file.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 100637b1adb3..edb03945ad36 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3968,10 +3968,10 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)

 	for (i = 0; i < page_len; i++, redirty_idx++) {
 		page = find_lock_page(mapping, redirty_idx);
-		if (!page) {
-			ret = -ENOMEM;
-			break;
-		}
+
+		/* It will never fail, when page has pinned above */
+		f2fs_bug_on(sbi, !page);
+
 		set_page_dirty(page);
 		f2fs_put_page(page, 1);
 		f2fs_put_page(page, 0);
--
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
