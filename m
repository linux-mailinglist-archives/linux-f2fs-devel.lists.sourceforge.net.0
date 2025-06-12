Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250DAD6641
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 05:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fT71vrrj1ryU78pNaWNlwDJQy3XRfsiXp/FWdjNwEZw=; b=nOSRrdN+ZyGAgfdzNhgjjHIcsV
	ULj6ODJv+9Igqun/CAj5GpYkTRTZ+DwZREx2JJaQyb8chF1mzia3oyDgC5xvObhnP6X6ul114ZQCj
	vf+HVQqNUzrBLFFtYzu/ngi+dRASTmd02l+VHTMh7AH1Se+oWuZZW7/9hRc4bxtxSxUg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPYub-00086a-1S;
	Thu, 12 Jun 2025 03:47:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uPYuM-00086L-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 03:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bj6Yb/B0kxfBN84dDxcTkyX8ZTsX5mKiUyzvHVa6M1s=; b=gD4WLTBsKt3FeqLgS5QFkZecrr
 ChUSxJKcGwav/VRZCDEhGXgncs/3Juoc+IAuPaN7/JC7eqf2NgmUCC2nT4maOCBsjU6nr1xbiAwPj
 IQTlDzhjOzz22STt1CDHzCrIQhyQ+AiZ8SCCCBvGo8bZl2KIRGOctl4F6NTYUpY/ExYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Bj6Yb/B0kxfBN84dDxcTkyX8ZTsX5mKiUyzvHVa6M1s=; b=g
 HZ4CefBtyOn2cVt37eVfHTzElfwISRPTjeJ9L2jwjaXcP0+WhGBOZd8Qeq9XbWMCD5wLJuKhRqtcv
 x53yJXN4SlROFroJWPuFhpVOr0TkKjXxra5YIty8chujvidAvEBj/1UWm5Ev189/bJwnRfkRtbOZ+
 0Ni1lFkasgAuJT+4=;
Received: from mta22.honor.com ([81.70.192.198] helo=mta22.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPYuL-00064s-Ed for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 03:47:18 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bHnwp3n60zYlZl1;
 Thu, 12 Jun 2025 11:25:46 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 11:27:45 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 11:27:45 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 12 Jun 2025 11:27:42 +0800
Message-ID: <20250612032742.1734852-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Wu Bo once mentioned a fallocate fail scenario in this
 link[1].
 After commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for
 pinned files"), we cannot directly generate 4K size file and pi [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uPYuL-00064s-Ed
Subject: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section when
 gc happens EAGAIN
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wu Bo once mentioned a fallocate fail scenario in this link[1].
After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
for pinned files"), we cannot directly generate 4K size file and
pin it, but we can still generate non-segment aligned pinned file:

touch test_file
./f2fs_io pinfile set test_file
./f2fs_io fallocate 0 0 8192 test_file
truncate -s 4096 test_file

By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
enough spare space) may occurs.

From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sections
if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so we stop
allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic once 
fallocation fails for pinfile"), we have a way to avoid panic caused by
concurrent pinfile allocation run out of free section, so I think that we 
can continue to allocate pinned section when gc happens EAGAIN. Even if we
don't have free section, f2fs_allocate_pinning_section() can fail with ENOSPC.

[1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..05c80d2b5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
-			if (err && err != -ENODATA) {
+			if (err && err != -ENODATA && err != -EAGAIN) {
 				f2fs_up_write(&sbi->pin_sem);
 				goto out_err;
 			}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
