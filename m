Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C43FF352895
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Apr 2021 11:23:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lSG1A-0003Aq-Fo; Fri, 02 Apr 2021 09:23:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lSG19-0003Af-A8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 09:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=22elreEL9N2PKC0SckUm8FllUlO9fcnn8GcNUIy7VAI=; b=bOmB71cqr9cdPJ8zTbiu3DYkuH
 TYiTgdzD2Nqvdw7wZ1pBiFn9gIfsge3GkPqNM41TBaxNSuZo5yzw3hEHDqO32qRlstyZd1isARC3z
 CzVWdkurRE7zcOMLMksdREeACgRriki27rFRP4HLv7ZDUgV+J0LldazUA1lbk0Muc5EA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=22elreEL9N2PKC0SckUm8FllUlO9fcnn8GcNUIy7VAI=; b=j
 vN7ABUZLoUmM+I4Axacqrsq57ifbvnY/yMTNUxx4rvsSMLhgyXYGaTnMdR4VnYWdskKji2vDN/xvU
 k60rMk2UF0uCEsOhmohNntWItfVpLamilEVLOQLQ9WRxNzQxi01+arLzaHGtFapSPJe2fQXoJRKH+
 mtiqcW505/N2LlVU=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lSG12-006Cs9-Fm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 09:23:03 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FBZJh5mfnzNsL8;
 Fri,  2 Apr 2021 17:20:04 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 17:22:39 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 2 Apr 2021 17:22:23 +0800
Message-ID: <20210402092223.115515-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lSG12-006Cs9-Fm
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to avoid accessing invalid fio in
 f2fs_allocate_data_block()
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

Callers may pass fio parameter with NULL value to f2fs_allocate_data_block(),
so we should make sure accessing fio's field after fio's validation check.

Fixes: f608c38c59c6 ("f2fs: clean up parameter of f2fs_allocate_data_block()")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- relocate fio->retry assignment to avoid race condition.
 fs/f2fs/segment.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c517e689a9a3..44897cfecb1e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3417,12 +3417,12 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		f2fs_inode_chksum_set(sbi, page);
 	}
 
-	if (F2FS_IO_ALIGNED(sbi))
-		fio->retry = false;
-
 	if (fio) {
 		struct f2fs_bio_info *io;
 
+		if (F2FS_IO_ALIGNED(sbi))
+			fio->retry = false;
+
 		INIT_LIST_HEAD(&fio->list);
 		fio->in_list = true;
 		io = sbi->write_io[fio->type] + fio->temp;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
