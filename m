Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF3E5A0750
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Aug 2022 04:37:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oR2kY-0007VY-He;
	Thu, 25 Aug 2022 02:37:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oR2kW-0007VS-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 02:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1tKm8EzLChXF6yDJBc4UUNbVvs4Dgg3vYpG6p7tSc4=; b=QiWuHt02zpgYY45tvt4YTqM9Au
 5Y3WmRb+ixsr6+gLm+FuasfIVSrTC+tO6WT+ExRn9rPxJy92xWNYUAv6PBfnQCnHpZ2wTyrY36R5Z
 eJwsypBD9SeckY9tRgVE7ypfNQkD5wlLvJWkoaKVfQC1Qa12yEIshr9a5DfzQnFI3OLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I1tKm8EzLChXF6yDJBc4UUNbVvs4Dgg3vYpG6p7tSc4=; b=h
 9h4fzsCKoQmFZJZVe5E+at1FxTMcIp/rTihgLRg0x1PMnxgj6iWyioCMTpu8A88AznmajhHiKc9yO
 d+S1n6HaTXJ+aMqi5yPexjLNka9VXo51DRmqWpX4SCcGNxoTgbZ0iofWnPMICYvtj+nuu9/+yLypq
 QOFj0WSjqqVx7/rk=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oR2kV-00Gf0u-He for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 02:37:40 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MCn9348QwzlWX1;
 Thu, 25 Aug 2022 10:34:15 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 25 Aug 2022 10:37:29 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 25 Aug
 2022 10:37:28 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 25 Aug 2022 10:41:02 +0800
Message-ID: <20220825024102.120651-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the written page was mapped more than twice, the written
 data here will not be seen by others. We add the flush_dcache_page to fix
 it. Fixes:0a2aa8fbb9693 ("f2fs: refactor __exchange_data_block for speed
 up") Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com> --- fs/f2fs/file.c
 | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oR2kV-00Gf0u-He
Subject: [f2fs-dev] [PATCH -next] f2fs: add flush_dcache_page after page was
 written
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

If the written page was mapped more than twice, the
written data here will not be seen by others. We add
the flush_dcache_page to fix it.

Fixes:0a2aa8fbb9693 ("f2fs: refactor __exchange_data_block for speed up")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ab9844eaa62c..b593e41dbfb3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1273,6 +1273,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				return PTR_ERR(pdst);
 			}
 			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
+			flush_dcache_page(pdst);
 			set_page_dirty(pdst);
 			f2fs_put_page(pdst, 1);
 			f2fs_put_page(psrc, 1);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
