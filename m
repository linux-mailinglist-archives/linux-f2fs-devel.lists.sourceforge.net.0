Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D664C5DC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 05:37:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdntJ-0005aR-Fj; Thu, 20 Jun 2019 03:37:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hdntI-0005aL-J7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 03:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xWEfR/+bcp5Mc5ITVP66bV8NY3Ojwcr4OjZdxGzXSwk=; b=fjAbV+1Czs0CR2xypu+4d7zYB3
 BGBKfVue3swD72QmFI+5ploRscebHObjKp/VvYGCU/5nxVJoZNxX84gNNHjHJ3S23j/F2eCt5fHXP
 q55tWqOvH+s4lHFSrlrRkPAMOAtjKS7XvXnubeva/dv2w4F/AMw/PyE82vhPAoNAYQoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xWEfR/+bcp5Mc5ITVP66bV8NY3Ojwcr4OjZdxGzXSwk=; b=cj3nO4PStmpMh5TJhmP7SVOe7o
 Mx6cqKGzXJgXqVQfuTu/Lr1694EAgPTH4vyym4eM0YeCdTrKDoxpao7uCXjQO98NwA74fqRGESU4n
 YfEjXYjh//u/CwrT5i1efy2zdoLYiq9nRbiuAJfEj9rF3s1dkaZOwPLm7/8sCXu622wM=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdntH-000pCN-AL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 03:37:37 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 5AC34836891678334CF5;
 Thu, 20 Jun 2019 11:37:26 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 20 Jun 2019 11:37:25 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 20 Jun 2019 11:37:25 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 20 Jun 2019 11:36:15 +0800
Message-ID: <20190620033615.32284-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190620033615.32284-1-yuchao0@huawei.com>
References: <20190620033615.32284-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ucw.cz]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdntH-000pCN-AL
Subject: [f2fs-dev] [PATCH 2/2] f2fs: set SBI_NEED_FSCK for xattr corruption
 case
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
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If xattr is corrupted, let's print kernel message and set SBI_NEED_FSCK
for further repair.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/xattr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 963242018663..b32c45621679 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -346,6 +346,9 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 
 	*xe = __find_xattr(cur_addr, last_txattr_addr, index, len, name);
 	if (!*xe) {
+		f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
+								inode->i_ino);
+		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		err = -EFSCORRUPTED;
 		goto out;
 	}
@@ -622,6 +625,9 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	/* find entry with wanted name. */
 	here = __find_xattr(base_addr, last_base_addr, index, len, name);
 	if (!here) {
+		f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
+								inode->i_ino);
+		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		error = -EFSCORRUPTED;
 		goto exit;
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
