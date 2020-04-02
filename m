Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B690019BB95
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Apr 2020 08:17:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJtAW-00068I-76; Thu, 02 Apr 2020 06:17:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yanaijie@huawei.com>) id 1jJtAU-000683-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 06:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OttPPWIF4yDjAbuyvNp+afaOQJ9Hbn9SWsVoOh3P9Sw=; b=PEcO20DxDRWrwz4D479Z6o1Njv
 3oAzGnAX9JnOb8kBGo0OeG0ISzqtW9NTjkOwSSRm9GsnpuHU322QcX37avltLssrsGRdIoumznnI5
 qCFXylbiEfeJZlm+H10YzKxfHpzNw8MU0+4GtvUbx0XsizRM93S3YVUtkpB5FSwOR67Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OttPPWIF4yDjAbuyvNp+afaOQJ9Hbn9SWsVoOh3P9Sw=; b=Q
 HPujbuvqE22IeCR6jDfhpfANlZFaIFU63IpfPT8kQAjEn8zAxK3v4kknfMEQaRj0NIOEaKQ/7kIbf
 bVfc41jDrTY6zIhn634ERQDRASwKG4vagJ6Dqj1JoE3RqOg8hxSfm2fEWuvRXo5DKBiVYc4RmhSBd
 ZCDyAGQcszkbzRzI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJtAP-00114Z-CP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 06:17:34 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5DA1D78E4EF831D79B48;
 Thu,  2 Apr 2020 14:17:15 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 14:17:08 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Thu, 2 Apr 2020 14:15:45 +0800
Message-ID: <20200402061545.23208-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJtAP-00114Z-CP
Subject: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'params'
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix the following gcc warning:

fs/f2fs/compress.c:375:18: warning: variable 'params' set but not used [-Wunused-but-set-variable]
  ZSTD_parameters params;
                  ^~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 fs/f2fs/compress.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index f05ecf4cb899..df7b2d15eacd 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -372,12 +372,10 @@ static int zstd_compress_pages(struct compress_ctx *cc)
 
 static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 {
-	ZSTD_parameters params;
 	ZSTD_DStream *stream;
 	void *workspace;
 	unsigned int workspace_size;
 
-	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, dic->clen, 0);
 	workspace_size = ZSTD_DStreamWorkspaceBound(MAX_COMPRESS_WINDOW_SIZE);
 
 	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
-- 
2.17.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
