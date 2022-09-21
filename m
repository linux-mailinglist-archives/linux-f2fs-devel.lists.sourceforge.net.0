Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0825BF855
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Sep 2022 09:54:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oauYp-0000mL-7s;
	Wed, 21 Sep 2022 07:54:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oauYk-0000m0-UL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 07:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q9yfUnf33cy+dYyL8ffNdNgP8hGTNO/WLENGqSVGZqA=; b=iAHA/6M9OIjizzMB5l8Lyfm1yo
 GQPiQ7IxZB2pKfHweCzZjz+Bc1kOWYHPu7TmnhaOzHuIaYmVhfhU29CH5QIugFvcmzg/y7+ffogOa
 7e8Ce4sCfBtiktMRoZF6xM7nBfbEstkUf4gboNyk7r6MykxJMOYKqT+jQJZwy2rNZyVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q9yfUnf33cy+dYyL8ffNdNgP8hGTNO/WLENGqSVGZqA=; b=RwSroCF2vI/wMHqoT+zQRBrngW
 P+rWa0NAyuDzlmJm1TgyBFRIGQQS0SsF3W7GrWSCE/D11SOLhK3q3HHoHxAsF115htJMkJpbMCWpl
 R4lsrcHZ4CwM6UvYLU60t9/89V2seEsISrTBjG0N9I4o9oydcqdHwADDgyePiy3jXKSw=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oauYi-00FFB4-FW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 07:54:18 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MXVxB3L1mzHpkL;
 Wed, 21 Sep 2022 15:51:58 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 15:54:07 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 15:54:07 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 21 Sep 2022 15:57:36 +0800
Message-ID: <20220921075737.36708-4-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220921075737.36708-1-zhangqilong3@huawei.com>
References: <20220921075737.36708-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_update_extent_tree_range_compressed caches both of
 compressed
 and no-compressed extent entry, so we should getting rid of the "compressed"
 word will be more appropriate. And we just rename it to [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oauYi-00FFB4-FW
Subject: [f2fs-dev] [PATCH -next 3/4] f2fs: rename
 f2fs_update_extent_tree_range_compressed
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

f2fs_update_extent_tree_range_compressed caches both of compressed
and no-compressed extent entry, so we should getting rid of the
"compressed" word will be more appropriate. And we just rename it to
f2fs_readonly_update_extent_tree_range.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/extent_cache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 7e39381edca0..c59a0ec41e69 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -663,7 +663,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-static void f2fs_update_extent_tree_range_compressed(struct inode *inode,
+static void f2fs_readonly_update_extent_tree_range(struct inode *inode,
 				pgoff_t fofs, block_t blkaddr, unsigned int llen,
 				unsigned int c_len)
 {
@@ -774,8 +774,8 @@ void f2fs_readonly_update_extent_cache(struct dnode_of_data *dn,
 		llen = f2fs_normal_blocks_are_contiguous(dn);
 	}
 
-	f2fs_update_extent_tree_range_compressed(dn->inode,
-				index, blkaddr, llen, c_len);
+	f2fs_readonly_update_extent_tree_range(dn->inode, index,
+						blkaddr, llen, c_len);
 }
 #endif
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
