Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6385A7A79
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Aug 2022 11:45:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTKHz-0000x9-2W;
	Wed, 31 Aug 2022 09:45:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oTKHQ-0000wf-H1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 09:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+YdxLJ2ZsphTXPm5TvGIHIizH4GKONAQEzSoENv3NIc=; b=JGuKFH+xSCRDRoPsK7X2wm8+j3
 KM3J51PzKrl/OExyaqGt6k4xxK/D/Pj0t1CDEZEYlFfmSTUjJWAZsCPg9XCNoNTvMYrRr9dx5zbI3
 hFCPNQDzuRGBdfuK0SOoiyxEiowzLZby8+TqiHfsNBmZaopvlUuej7ircXQFo9SVuH1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+YdxLJ2ZsphTXPm5TvGIHIizH4GKONAQEzSoENv3NIc=; b=G
 y/jSxskRRFRjQxzCRttukfKKBQzeS+83XkqkuIdqGRDBN8ewgZpIQDiARAuTnivG6cksXi2J14UbQ
 MymCHF9ZTS+9urP0mR389NdBOsfEdSZerVZYZOjsXWGnuUAzKqyjk3HtObteMW1Es6fK3K5S4J3Im
 CWLkIEh4UfAbAOVw=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTKHL-008dCH-2O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 09:45:04 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MHfP13yznzHnXc;
 Wed, 31 Aug 2022 17:43:01 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 17:44:48 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 17:44:41 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 31 Aug 2022 17:48:15 +0800
Message-ID: <20220831094815.25002-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We can use a inner function to init the disk time of
 f2fs_inode_info
 for cleaning redundant code. Signed-off-by: Zhang Qilong
 <zhangqilong3@huawei.com>
 --- fs/f2fs/inode.c | 21 ++++++++++++--------- 1 file changed, 12 insertions(+),
 9 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oTKHL-008dCH-2O
Subject: [f2fs-dev] [PATCH -next] f2fs: add static init_idisk_time function
 to reduce the code
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

We can use a inner function to init the disk time
of f2fs_inode_info for cleaning redundant code.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/inode.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1feb0a8a699e..57669f51be83 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -333,6 +333,16 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 	return true;
 }
 
+static void init_idisk_time(struct inode *inode)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+
+	fi->i_disk_time[0] = inode->i_atime;
+	fi->i_disk_time[1] = inode->i_ctime;
+	fi->i_disk_time[2] = inode->i_mtime;
+	fi->i_disk_time[3] = fi->i_crtime;
+}
+
 static int do_read_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -465,10 +475,7 @@ static int do_read_inode(struct inode *inode)
 		}
 	}
 
-	fi->i_disk_time[0] = inode->i_atime;
-	fi->i_disk_time[1] = inode->i_ctime;
-	fi->i_disk_time[2] = inode->i_mtime;
-	fi->i_disk_time[3] = fi->i_crtime;
+	init_idisk_time(inode);
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
@@ -679,11 +686,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 	if (inode->i_nlink == 0)
 		clear_page_private_inline(node_page);
 
-	F2FS_I(inode)->i_disk_time[0] = inode->i_atime;
-	F2FS_I(inode)->i_disk_time[1] = inode->i_ctime;
-	F2FS_I(inode)->i_disk_time[2] = inode->i_mtime;
-	F2FS_I(inode)->i_disk_time[3] = F2FS_I(inode)->i_crtime;
-
+	init_idisk_time(inode);
 #ifdef CONFIG_F2FS_CHECK_FS
 	f2fs_inode_chksum_set(F2FS_I_SB(inode), node_page);
 #endif
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
