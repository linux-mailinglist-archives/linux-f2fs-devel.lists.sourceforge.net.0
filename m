Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B0117F8B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2020 13:50:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBeLG-0000y7-Ly; Tue, 10 Mar 2020 12:50:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jBeLE-0000xX-BX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 12:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+dk68FRn+nIsT6PsnjgyGamjsTSfiSfc30LYaPSxrD8=; b=ZSaov/qikSDAAzrRRNxHY/B6NO
 h1QeaErKz0skwJucWXV2OSjp4F05s6bwSXdOD0ZTvABXksqzUuNf+UxjZzXaM1iEMyLZGTvm3aEYY
 LlvbX0Ua3X/vp+YUPFaK45z14QTUkFnhSUM7zrV0ZeB5TapLpDpCjooCfik4xeTSBidE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+dk68FRn+nIsT6PsnjgyGamjsTSfiSfc30LYaPSxrD8=; b=BIKd8jGd8uaE0rE1/wfn/gaony
 HUsso3IDMlPZTm+dSJiFfttRP6STrEpS2M3eIyEGKBd2522kdko16L3VpG3voL9T/cnMtYB0074Mz
 yWund7XotkIaBWaekFLm7Uf9tg1ZZQ0VwEZgdZ4NrcuFCp+jRGh7Ogk7vekQfYj7nPes=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBeL9-003wpJ-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 12:50:36 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7B8B0322FAE80E6DD4EA;
 Tue, 10 Mar 2020 20:50:21 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Mar 2020 20:50:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 10 Mar 2020 20:50:06 +0800
Message-ID: <20200310125009.12966-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200310125009.12966-1-yuchao0@huawei.com>
References: <20200310125009.12966-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jBeL9-003wpJ-Mo
Subject: [f2fs-dev] [PATCH 2/5] f2fs: force compressed data into warm area
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

Generally, data shows better continuity in warm data area as its
default allocation direction is right, in order to enhance
sequential read/write performance of compress inode, let's force
compress data into warm area.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 601d67e72c50..ab1bc750712a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3037,9 +3037,10 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 	if (fio->type == DATA) {
 		struct inode *inode = fio->page->mapping->host;
 
-		if (is_cold_data(fio->page) || file_is_cold(inode) ||
-				f2fs_compressed_file(inode))
+		if (is_cold_data(fio->page) || file_is_cold(inode))
 			return CURSEG_COLD_DATA;
+		if (f2fs_compressed_file(inode))
+			return CURSEG_WARM_DATA;
 		if (file_is_hot(inode) ||
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
 				f2fs_is_atomic_file(inode) ||
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
