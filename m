Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB373204C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Feb 2021 10:39:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDOjB-0000Cc-Up; Sat, 20 Feb 2021 09:39:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lDOjB-0000CW-4c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Zc7D0MjyGxUpwE46jTGCQGEyd63ovf3oAdtCBT+4ng=; b=MMXHPZ1XiiQkPNrFdfp/G1A1Ef
 g3oL1cxB7ttKjJ9Iqj6+LPmXKI6aO2MeqpJj278aPiFFZIoBb9UKMo03D1Htrty0aGjIMaJh76exy
 Tqj61fb0qs8iOnhlFAdKEB7KRPn474w+R09ww05jLUw5dny3GX734pCLCsFqAzLmMJz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Zc7D0MjyGxUpwE46jTGCQGEyd63ovf3oAdtCBT+4ng=; b=A
 8hlVzVqBXH5OINM5lO9pd+93c5wFxccWpfhgBnpnE7REz+Rc7quvped5wrP2ZeOy6MnUCzFhqMmlo
 nHX1Xvxud/TPlj1kI1qPnZTldLj9ty456hEyTq1jTeglhf8sM509L43uGBVCaPJ0oVopRZDbhMRio
 gjbcZTsKAxCXkbGc=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lDOj4-00GO9F-IG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:39:05 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DjNdW0gdRzjMgl;
 Sat, 20 Feb 2021 17:37:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Sat, 20 Feb 2021 17:38:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 20 Feb 2021 17:38:41 +0800
Message-ID: <20210220093843.64379-1-yuchao0@huawei.com>
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lDOj4-00GO9F-IG
Subject: [f2fs-dev] [PATCH 1/3] f2fs: avoid unused
 f2fs_show_compress_options()
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

LKP reports:

   fs/f2fs/super.c:1516:20: warning: unused function 'f2fs_show_compress_options' [-Wunused-function]
   static inline void f2fs_show_compress_options(struct seq_file *seq,

Fix this issue by covering f2fs_show_compress_options() with
CONFIG_F2FS_FS_COMPRESSION macro.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78d9e54bc4f7..042925c6c2cb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1620,6 +1620,7 @@ static inline void f2fs_show_quota_options(struct seq_file *seq,
 #endif
 }
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 static inline void f2fs_show_compress_options(struct seq_file *seq,
 							struct super_block *sb)
 {
@@ -1665,6 +1666,7 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 	else if (F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER)
 		seq_printf(seq, ",compress_mode=%s", "user");
 }
+#endif
 
 static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 {
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
