Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FBC66974
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 10:57:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlrMs-0003DU-7O; Fri, 12 Jul 2019 08:57:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hlrMq-0003D8-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 08:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P9pkeWe2ncrtGJM24R7RkXoWcXOoFrmhbNV2SEaO3sM=; b=HkzB2W2qB4QgycGvLSu0JRC6yg
 69Kxqh2jbvCuoKlwp6TJKgWTa9WFapi+oTvx0N/l+cXNfDlGwY5bsmg0xJhfr+3dDlGymfDhJGGpE
 TwQDnOJIW/10oheeT6BUwssWLZmh4728cT/7MkMRAtasezKd683zCIvxEyG0jLy9NJ08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P9pkeWe2ncrtGJM24R7RkXoWcXOoFrmhbNV2SEaO3sM=; b=P
 bUaD4rcIvWhaDQ3K7oqfDYGMpRuhzuVlZrMrcPKH8kTF54wodQKMowF+M+slTroRybOS879GCJzuf
 s8vZbPEh8fdpPAvxDdsiamoGu+NT1sOyw2HGS+Bm3U/2JCiI8hOE2bdT3mVzRJ5te7ehHOETxe5sL
 whckfM1AykEGsje8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlrMo-00Gqjc-KR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 08:57:24 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 48D8F5B8F6391BDF6638;
 Fri, 12 Jul 2019 16:57:15 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Fri, 12 Jul 2019 16:57:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 12 Jul 2019 16:57:00 +0800
Message-ID: <20190712085700.4239-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
X-Headers-End: 1hlrMo-00Gqjc-KR
Subject: [f2fs-dev] [PATCH] f2fs: disallow switching io_bits option during
 remount
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

If IO alignment feature is turned on after remount, we didn't
initialize mempool of it, it turns out we will encounter panic
during IO submission due to access NULL mempool pointer.

This feature should be set only at mount time, so simply deny
configuring during remount.

This fixes bug reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=204135

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 84e5a9bf4571..602a0791246d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1567,6 +1567,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool need_stop_gc = false;
 	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
 	bool disable_checkpoint = test_opt(sbi, DISABLE_CHECKPOINT);
+	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool checkpoint_changed;
 #ifdef CONFIG_QUOTA
 	int i, j;
@@ -1646,6 +1647,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+	if (no_io_align == !!F2FS_IO_ALIGNED(sbi)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch io_bits option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
