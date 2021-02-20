Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AE3204C2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Feb 2021 10:39:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDOjG-0006Xf-Mw; Sat, 20 Feb 2021 09:39:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lDOjE-0006XF-7B
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/v0cwuG0ILIPLuSAOt1BSoLx/Db5cQkrAQlWGSva2Qs=; b=PD9RiSSrkbTk+Rq48zHDiSpAtI
 ZGFil0dSraWOzw645FGF7brZFN8j4/C+ZfoMZI6oLlBxER1lxKSP4MHpXrpiCWqyDABWTjFKEoSNQ
 GfKag+oZvQTabl4MxBWu09Thea6zfe+MjbaTYeriicwhMiic6SQItYo1x6+mo9k/dCcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/v0cwuG0ILIPLuSAOt1BSoLx/Db5cQkrAQlWGSva2Qs=; b=INrqAcVUrPsm265cLZ8fRlazZM
 MPJZk+ZAvYC8GWdoCiDmTJ4KXcZ4FEDLYE9CvNkquyiDFNfRPQZ0ogDcnT0us60bBsT0FhYnpXEqe
 iSdOwQeSGHTq5maJnTAE0J/T0dwT7ohpXm3bvZkoVeOc6VEStWY+DBiidzRUtTqwzULo=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lDOj9-00GO9N-NL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:39:08 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DjNdc0V3Dz1695F;
 Sat, 20 Feb 2021 17:37:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Sat, 20 Feb 2021 17:38:46 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 20 Feb 2021 17:38:43 +0800
Message-ID: <20210220093843.64379-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220093843.64379-1-yuchao0@huawei.com>
References: <20210220093843.64379-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lDOj9-00GO9N-NL
Subject: [f2fs-dev] [PATCH 3/3] f2fs: update comments for explicit memory
 barrier
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

Add more detailed comments for explicit memory barrier used by
f2fs, in order to enhance code readability.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c | 6 +++++-
 fs/f2fs/segment.c    | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 174a0819ad96..c75866cd72fa 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1818,7 +1818,11 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
 	llist_add(&req.llnode, &cprc->issue_list);
 	atomic_inc(&cprc->queued_ckpt);
 
-	/* update issue_list before we wake up issue_checkpoint thread */
+	/*
+	 * update issue_list before we wake up issue_checkpoint thread,
+	 * this smp_mb() pairs with another barrier in ___wait_event(),
+	 * see more details in comments of waitqueue_active().
+	 */
 	smp_mb();
 
 	if (waitqueue_active(&cprc->ckpt_wait_queue))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2190910c68b0..2d5a82c4ca15 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -663,7 +663,11 @@ int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino)
 
 	llist_add(&cmd.llnode, &fcc->issue_list);
 
-	/* update issue_list before we wake up issue_flush thread */
+	/*
+	 * update issue_list before we wake up issue_flush thread, this
+	 * smp_mb() pairs with another barrier in ___wait_event(), see
+	 * more details in comments of waitqueue_active().
+	 */
 	smp_mb();
 
 	if (waitqueue_active(&fcc->flush_wait_queue))
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
