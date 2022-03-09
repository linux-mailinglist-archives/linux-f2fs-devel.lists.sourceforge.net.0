Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7F4D2B75
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 10:09:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRsK9-0004aI-Bh; Wed, 09 Mar 2022 09:09:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jiayang5@huawei.com>) id 1nRsK7-0004aA-Nf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 09:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AYoS2KdMXoOq/kksJf4bsct93sv+Z2nI2CATlqTIF7o=; b=V87nkzf07kZteYDlIfsYBQszu8
 F3k2ou4Vf7iPYwu1IMuCQ9ItGNioGELV4fu3b7z9pEWta16R6QargK7s3TuCtUuJWReSf5cTP2z9z
 zq21fqEk3gXCcvVc6qRRDwxLo7+QsnSsLU+dNNOQ7F/qGolBFoB7VwqCHvoocQLFIOLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AYoS2KdMXoOq/kksJf4bsct93sv+Z2nI2CATlqTIF7o=; b=W
 61u4vF300ZSYxICJrGqeYpa9cM1a7tC9fsCjFK8StCEWyjixBC8clp7zlYoaqK0OogGEljyunfRbS
 CHp+6hyMXRnNf3F+IoAlnk3xruf6ByrJZCjZOoosBxpxV7hErJMlaVVKiEhpnDoM3STh/Y+I1d5NV
 zXZNCWbkaI3VrWnE=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRsK4-009aAn-2V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 09:09:34 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KD5qP4d7vzbc9R;
 Wed,  9 Mar 2022 17:04:33 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 17:09:22 +0800
Received: from huawei.com (10.175.124.27) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 9 Mar
 2022 17:09:22 +0800
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 9 Mar 2022 17:27:59 +0800
Message-ID: <20220309092759.1800236-1-jiayang5@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS_FITS_IN_INODE only cares the type of f2fs inode,
 so there
 is no need to read node page of f2fs inode. Signed-off-by: Jia Yang
 <jiayang5@huawei.com>
 --- v2: - initialize ri with NULL --- fs/f2fs/file.c | 15 ++++ 1 file changed, 
 4 insertions(+), 11 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nRsK4-009aAn-2V
Subject: [f2fs-dev] [PATCH -next v2] f2fs: remove unnecessary read for
 F2FS_FITS_IN_INODE
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
From: Jia Yang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jia Yang <jiayang5@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS_FITS_IN_INODE only cares the type of f2fs inode, so there
is no need to read node page of f2fs inode.

Signed-off-by: Jia Yang <jiayang5@huawei.com>
---
v2:
- initialize ri with NULL
---
 fs/f2fs/file.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cfdc41f87f5d..a8d9104d293c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -812,7 +812,7 @@ int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
 {
 	struct inode *inode = d_inode(path->dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct f2fs_inode *ri;
+	struct f2fs_inode *ri = NULL;
 	unsigned int flags;
 
 	if (f2fs_has_extra_attr(inode) &&
@@ -2999,7 +2999,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct page *ipage;
+	struct f2fs_inode *ri = NULL;
 	kprojid_t kprojid;
 	int err;
 
@@ -3023,17 +3023,10 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 	if (IS_NOQUOTA(inode))
 		return err;
 
-	ipage = f2fs_get_node_page(sbi, inode->i_ino);
-	if (IS_ERR(ipage))
-		return PTR_ERR(ipage);
 
-	if (!F2FS_FITS_IN_INODE(F2FS_INODE(ipage), fi->i_extra_isize,
-								i_projid)) {
-		err = -EOVERFLOW;
-		f2fs_put_page(ipage, 1);
-		return err;
+	if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid)) {
+		return -EOVERFLOW;
 	}
-	f2fs_put_page(ipage, 1);
 
 	err = f2fs_dquot_initialize(inode);
 	if (err)
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
