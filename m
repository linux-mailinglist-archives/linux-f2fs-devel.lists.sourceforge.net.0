Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201D9E3A1B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2024 13:39:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIoew-000058-C0;
	Wed, 04 Dec 2024 12:39:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1tIoeu-000052-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 12:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B1smXafqCFR1OyrMakm27WaUyOPh1KAgXsx8sFdR7sY=; b=W+/J9CcyHtn4jZr0Fb+LaJ4dqy
 KbmydJe4RfpWeJn1CiNhLoJItvnyrIqcYmj+2vGq+jJIKNILO7wSB3+xirM7zHTmYrn/6rIpVU4b+
 Qgqpqd++ToYbc1+Eu4xgS4gzqBk+uF7Q2ziu/cjBw7294cLo2Drhbvv4rEQdEQS1j0E8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B1smXafqCFR1OyrMakm27WaUyOPh1KAgXsx8sFdR7sY=; b=B
 u33WoP96yzdfEEZVUR+4HL9eQ8CZFXP9BsqPoFh+H9oFeviEDuxi1DLQepwa58cxpKUmHc2Dw0yQn
 yBoxi2qTuW5h80T6jDp6fzAtT4oMnHH0hFl3NGMB+v4KdSj0nkxwmkFXZEdaGNs6MBpPeRT2C/S/7
 ehLJCEqyOhuadKzs=;
Received: from mta22.honor.com ([81.70.192.198] helo=mta22.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIoet-0005CC-4K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 12:39:12 +0000
Received: from w003.hihonor.com (unknown [10.68.17.88])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4Y3GrZ3BkfzYkxX8;
 Wed,  4 Dec 2024 20:23:10 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Dec
 2024 20:23:19 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Dec
 2024 20:23:19 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 4 Dec 2024 20:23:17 +0800
Message-ID: <20241204122317.3042137-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When we check inode which just has inline xattr data, we copy
 inline xattr data from inode, check it(maybe fix it) and copy it again to
 inode. We can check and fix xattr inplace for this kind of inode [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.192.198 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.192.198 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [81.70.192.198 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tIoet-0005CC-4K
Subject: [f2fs-dev]  f2fs-tools: Check and fix inline xattr inplace
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When we check inode which just has inline xattr data, we copy
inline xattr data from inode, check it(maybe fix it) and copy
it again to inode. We can check and fix xattr inplace for this
kind of inode to reduce memcpy times.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fsck/fsck.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index aa3fb97..fd8b082 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -840,11 +840,18 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 	struct f2fs_xattr_entry *ent;
 	__u32 xattr_size = XATTR_SIZE(&inode->i);
 	bool need_fix = false;
+	bool has_xattr_node = false;
+	nid_t xnid = le32_to_cpu(inode->i.i_xattr_nid);
 
 	if (xattr_size == 0)
 		return 0;
 
-	xattr = read_all_xattrs(sbi, inode, false);
+	if (xattr_size <= inline_xattr_size(&inode->i) && !xnid)
+		xattr = inline_xattr_addr(&inode->i);
+	else {
+		xattr = read_all_xattrs(sbi, inode, false);
+		has_xattr_node = true;
+	}
 	ASSERT(xattr);
 
 	last_base_addr = (void *)xattr + xattr_size;
@@ -867,12 +874,15 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 	}
 	if (need_fix && c.fix_on) {
 		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
-		write_all_xattrs(sbi, inode, xattr_size, xattr);
+		if (has_xattr_node) {
+			write_all_xattrs(sbi, inode, xattr_size, xattr);
+			free(xattr);
+		}
 		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
-		free(xattr);
 		return 1;
 	}
-	free(xattr);
+	if (has_xattr_node)
+		free(xattr);
 	return 0;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
