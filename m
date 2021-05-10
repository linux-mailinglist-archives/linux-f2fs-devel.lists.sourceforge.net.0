Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBD377F69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 11:30:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg2FV-0007XZ-6c; Mon, 10 May 2021 09:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lg2FT-0007XR-Ew
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLNLG7mijocPOx0PIpadveepFJMc9VlXHhgaltn+plI=; b=JDglbpWWHaV04qUXumcp/jj9kc
 D6GmAzFxnCtS/AItrm/BCI1pO4QLpZ32u9FfkPU6CKdJ62bFkYK6fZNMjPHWXa8Wme7wyIL2T/a2l
 Fdo7r+sKj1/CTD3bRWTzq2XvILmBVmKWuPAENfAdT4/szUxaX7pyCiybE6rZtM15Qj4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hLNLG7mijocPOx0PIpadveepFJMc9VlXHhgaltn+plI=; b=R
 Dgg+cKm4EeGNTKRBw/+nU55FLgAoKX9aCheKJYoUW0bBnBb9HieaUNvHttwy6FAeK5tdr6UOLMluO
 +O+I2sdVLSxFMMXLQ6hvQk95uFr9xhRakYAoOAlI7QdMkhJS+vd6aALZrqKRHirlFoAjXP2ompfDd
 T9YliDU06Qs9VL4g=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg2FT-0014h6-EW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:30:49 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdwgX42RmzqV1w;
 Mon, 10 May 2021 17:27:20 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 17:30:34 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 10 May 2021 17:30:30 +0800
Message-ID: <20210510093032.35466-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lg2FT-0014h6-EW
Subject: [f2fs-dev] [PATCH 1/3] f2fs: compress: fix to call f2fs_put_dnode()
 paired with f2fs_get_block()
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

f2fs_get_block() and f2fs_put_dnode() should be called as a pair,
add missing f2fs_put_dnode() in prepare_compress_overwrite().

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c208563eac28..d5cb0ba9a0e1 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1088,6 +1088,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 
 		for (i = cc->cluster_size - 1; i > 0; i--) {
 			ret = f2fs_get_block(&dn, start_idx + i);
+			f2fs_put_dnode(&dn);
 			if (ret) {
 				i = cc->cluster_size;
 				break;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
