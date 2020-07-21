Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E472273DD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 02:38:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxgJ1-00034O-53; Tue, 21 Jul 2020 00:38:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jxgIy-00034F-RU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Hvjf5HKygyV8tOMoX1FuAwJqq13t26rkA10z2/hRtI=; b=ZSneMnafaJop4zGVdKupUwQjau
 das67SAzeRbqHbopMeykHTY1/89QoDrYK6QVqYEjGRx1T04bwTbGkbHD9FahRPuG8Vj+UXEe2ogoJ
 mi02YoHkrZjeFvWMKQY10MxJtQ8nGLEkcMgRz3tP/lUp+JRI12mG8bTz5FSQ6dUXRFyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Hvjf5HKygyV8tOMoX1FuAwJqq13t26rkA10z2/hRtI=; b=FHPbZwB1pcJZFpPx9gU9R1DgCS
 ytGyYxz29qfuz/i8vPj1KdBkXQnwm6gFNwdMGPR1vG7FvVvLFgC26+Cy5EPCDKTDOeXKvvONM6aWg
 w7N8CxTTNEwayAwc5WIVZHbzYHOb288FoHr1xMERDMxJuWwQ1+qKbdwi4+ZR8NZnKSKA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxgIx-00ERMJ-M0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:38:48 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EB5921702;
 Tue, 21 Jul 2020 00:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595291917;
 bh=6ek6ZwxKZwVe89KBB2SMuKPpwhN0QziEQpIeSfiBXtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkNbMGnr7Tj9YBuMr7yPyDygsQ4MfZ8zk/cEuCptF8NXKI7ByPe/NMNYKkLOp1m0P
 c8nZ5O2zGKSA7ECoUyy5ob1Sqf19bfY34HvyOb765ULFcmTHbv/pPM7zah7YlphnwH
 Q+b79QGang9oTWyPPIQoNdUYkCQphwvNgCZdGos4=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 20 Jul 2020 17:38:33 -0700
Message-Id: <20200721003834.2754992-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200721003834.2754992-1-jaegeuk@kernel.org>
References: <20200721003834.2754992-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jxgIx-00ERMJ-M0
Subject: [f2fs-dev] [PATCH 2/3] mkfs.f2fs: should initialize sparse file in
 Windows
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise it fails to format in Windows.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 55d3a5c..5937076 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1158,6 +1158,8 @@ int get_device_info(int i)
 	c.sectors_per_blk = F2FS_BLKSIZE / c.sector_size;
 	c.total_sectors += dev->total_sectors;
 
+	if (c.sparse_mode && f2fs_init_sparse_file())
+		return -1;
 	return 0;
 }
 #endif
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
