Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DB5A8F8F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Sep 2022 09:16:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTeR6-00078F-57;
	Thu, 01 Sep 2022 07:16:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oTeR4-000789-SG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 07:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGai79fbhkQFtVDbGBGxT1l5lMB4vGCNhHu5GMGoGa0=; b=k/+CFKzSIgPg4KHyXs/bbE/fzh
 ti05bGlyyP/7xbWs2OukA8hV9k77Pz7xbxZdD26yvwTVy9rtSgJRd1ne8EXIUB8goNluCApG+kh2h
 +HmuQIRhFlJVxyZKveidQ9ODYI9geWZ0H7W1VSVyfuOTKd0ZLGXzlusKj2CYSkygYUSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RGai79fbhkQFtVDbGBGxT1l5lMB4vGCNhHu5GMGoGa0=; b=d
 K+oH0360Fjwxu5QsIjhbxSNrX1lZFpW3a5TkQwb09JDRqaJIgb89IYbOYVq95cB8K/Iz+lZexYBf7
 b+brG4K7WiZ52PYe9cCw9p1j6bleMr5Su8B7LBsyXRqmakDxmOzgO25NMDrV1zGVtZPHsRRV1rgua
 VAmvDvOtNg2gAxGc=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTeQx-00065B-CR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 07:16:22 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJC0p00yQzkWm9;
 Thu,  1 Sep 2022 15:12:25 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 15:16:06 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 15:16:05 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 1 Sep 2022 15:19:37 +0800
Message-ID: <20220901071937.93945-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It have checked "compressed" at the entry of
 f2fs_sanity_check_cluster, 
 just remove the redundant check for better performance here. Signed-off-by:
 Zhang Qilong <zhangqilong3@huawei.com> --- fs/f2fs/compress.c | 20 +++++++++
 1 file changed, 9 insertions(+), 11 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oTeQx-00065B-CR
Subject: [f2fs-dev] [PATCH -next] f2fs: remove redundant check in
 f2fs_sanity_check_cluster
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It have checked "compressed" at the entry of
f2fs_sanity_check_cluster, just remove the
redundant check for better performance here.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/compress.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6baaff4c52ba..c16bab5bd600 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -912,17 +912,15 @@ bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
 			reason = "[C|*|C|*]";
 			goto out;
 		}
-		if (compressed) {
-			if (!__is_valid_data_blkaddr(blkaddr)) {
-				if (!cluster_end)
-					cluster_end = i;
-				continue;
-			}
-			/* [COMPR_ADDR, NULL_ADDR or NEW_ADDR, valid_blkaddr] */
-			if (cluster_end) {
-				reason = "[C|N|N|V]";
-				goto out;
-			}
+		if (!__is_valid_data_blkaddr(blkaddr)) {
+			if (!cluster_end)
+				cluster_end = i;
+			continue;
+		}
+		/* [COMPR_ADDR, NULL_ADDR or NEW_ADDR, valid_blkaddr] */
+		if (cluster_end) {
+			reason = "[C|N|N|V]";
+			goto out;
 		}
 	}
 	return false;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
