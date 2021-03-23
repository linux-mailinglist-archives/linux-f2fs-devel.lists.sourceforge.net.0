Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CC345CEC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 12:32:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOfGm-0000Gj-Vq; Tue, 23 Mar 2021 11:32:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qiulaibin@huawei.com>) id 1lOfGl-0000GS-5K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 11:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kAisqsnPptiGfFx/MDJ5tHKluhE6e8lsKTeAwapoM1c=; b=XjMLMPdCxpzjFZulGP5L//GG/U
 cmJwv7dSgBqNkhA+BAqDIZLbb92CWcJQJidA1HM3WmXXYU05LIeL+0MDRx1TVStZiIPkqnLgCL4hn
 JZcBNzz8vjhiP62vHThMew8mVgCeoXtB+YKIVYphGfvozNAevsJOZPubV3BdfnaUx3CM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kAisqsnPptiGfFx/MDJ5tHKluhE6e8lsKTeAwapoM1c=; b=F
 bn+1mYlGXmm1KWffRwm28ShBSfES1Pzxd+yPoSonMMmanX5xD0jmB9OUO9iX/qmZ5yP32kmTrpYWp
 k82yeHKlXxN5QilNYZhve2bPjpBUg/hTQFvNSSruNbvl87S3s1LgJO67zyFGPq9Dei2fpDKQSf9zf
 Vquea/grOEnu+LOk=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOfGa-000nZq-Ij
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 11:32:19 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F4TfX4JfGznV8x;
 Tue, 23 Mar 2021 19:29:24 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Tue, 23 Mar 2021
 19:31:52 +0800
From: qiulaibin <qiulaibin@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 23 Mar 2021 19:41:30 +0800
Message-ID: <20210323114130.2288596-1-qiulaibin@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lOfGa-000nZq-Ij
Subject: [f2fs-dev] [PATCH -next] f2fs: fix wrong comment of nat_tree_lock
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Do trivial comment fix of nat_tree_lock.

Signed-off-by: qiulaibin <qiulaibin@huawei.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 165bfe2a5a0e..eb154d9cb063 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -865,7 +865,7 @@ struct f2fs_nm_info {
 	/* NAT cache management */
 	struct radix_tree_root nat_root;/* root of the nat entry cache */
 	struct radix_tree_root nat_set_root;/* root of the nat set cache */
-	struct rw_semaphore nat_tree_lock;	/* protect nat_tree_lock */
+	struct rw_semaphore nat_tree_lock;	/* protect nat entry tree */
 	struct list_head nat_entries;	/* cached nat entry list (clean) */
 	spinlock_t nat_list_lock;	/* protect clean nat entry list */
 	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
