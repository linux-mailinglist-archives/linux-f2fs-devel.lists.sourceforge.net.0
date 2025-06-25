Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B9AE73AA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 02:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6Rts6BXI1+1VWTdSxS/4A92hT2eds1dANCPdtIABeo=; b=jlKaW2b05w+/TrtL0Hy4HiQ5Su
	D/w+YMvQdXn9Pz/W4XYfQT2LYSN7XPzob4qbHaTmaLwLleUdppuwb4xRs39Xc7qMqJHxagjhOTd3Y
	XF0NprdSgIK7gIHACmZdKxBX2RMcDA54cyXIGKkvK10RK1LtE0bfKUI7Yt3/7MmVZirU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUDly-0005Uv-8I;
	Wed, 25 Jun 2025 00:13:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uUDlv-0005Up-OR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 00:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l78UkUTiR7nF3K2AC4hbncQqGOs4CK5AVmprOC5p9Ac=; b=Ig5NJsypzlg5FeZvsENfZbPQ/J
 lyDZsH8JYRtDVy+xPj0K4jQhnc51Px/hFCVAmQEZbf8bOaL1AgQM6/57DNJiZpFQYAqQ1R5uI+bqa
 uEWX6SRK2bKL5HCtDy6jXoH2U9v6kgZW5s3GVJbf47c7SQRbUbg6FrdQoBL6LVrxMouc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l78UkUTiR7nF3K2AC4hbncQqGOs4CK5AVmprOC5p9Ac=; b=D
 g86swCoxLVFypk6xM4FosvVVlAwaN8eX8JHyuKHBe+UL4qLZyjGOvYOscsYGV8/3688cVDFMavt11
 hI2Nz2CgJ3Ps2jZKng1uC/qlV9eSBx9rn7IYrba8IEoCKl2plJJu3tJ3b8WM7XfgXPKpUGrjlHsNR
 ZIAkY/P0m6Qjv0Fk=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uUDlv-0007f8-6G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 00:13:51 +0000
X-AuditID: a67dfc59-057ff7000000aab6-03-685b3f33380d
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 25 Jun 2025 09:13:35 +0900
Message-ID: <20250625001336.1937-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprILMWRmVeSWpSXmKPExsXC9ZZnka6xfXSGQe9EDovTU88yWTxZP4vZ
 4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4MlpOXWUvuMNacfvm
 R8YGxncsXYycHBICJhI/Fm1lgrEbr31nBbHZBDQk/vT2MoPYIgKaEkc6Z7J3MXJxMAu0MUq0
 H20CKxIW8JZ4f+0rI4jNIqAqMXnlcTYQm1fATOJJ012oBZoSO76cZ4KIC0qcnPkELM4sIC/R
 vHU2M8hQCYG7rBK/D61hhmiQlDi44gbLBEbeWUh6ZiHpWcDItIpRJDOvLDcxM8dYrzg7ozIv
 s0IvOT93EyMwoJbV/oncwfjtQvAhRgEORiUeXoPWqAwh1sSy4srcQ4wSHMxKIrzTzIFCvCmJ
 lVWpRfnxRaU5qcWHGKU5WJTEeY2+lacICaQnlqRmp6YWpBbBZJk4OKUaGC2aMn9NmFRczbtA
 ca5ZtUJL+bndjYz77HZOcT7zv6n+5NUZVdf5t+1b3sDnfTrYn6uxN7b6TdfEhuaVH3TcQvJK
 6j3CnziruPps7jrnO+nmgkUmZ9PLxTZnWzx0O1ipaOLi433+uJf1/jYt71aNz3xv49pnTP1Y
 UFLHnRx+/uaiEuPJB1dEKLEUZyQaajEXFScCAIhC9pMkAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFJMWRmVeSWpSXmKPExsXCNUNljq6RfXSGwY7P1hanp55lsniyfhaz
 xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
 2yVwZbScuspecIe14vbNj4wNjO9Yuhg5OSQETCQar31nBbHZBDQk/vT2MoPYIgKaEkc6Z7J3
 MXJxMAu0MUq0H20CKxIW8JZ4f+0rI4jNIqAqMXnlcTYQm1fATOJJ012ooZoSO76cZ4KIC0qc
 nPkELM4sIC/RvHU28wRGrllIUrOQpBYwMq1iFMnMK8tNzMwx0yvOzqjMy6zQS87P3cQIDJFl
 tX8m7WD8dtn9EKMAB6MSD2/EiqgMIdbEsuLK3EOMEhzMSiK808yBQrwpiZVVqUX58UWlOanF
 hxilOViUxHm9wlMThATSE0tSs1NTC1KLYLJMHJxSDYyTbsUXem5c8KPV6xPbr56I+4tSr6UV
 mkrNXLtJLejJpUZ1P7u2aZP7Zkey3DjKMsPgeotRUff+IO5y9/43hy8d1VLnPdV322r7sVdp
 jSvK3ELqhM7MK3CW/1e14Z0Xy9lVCunvrW13Cf5ILtyQFBe8LUnPeYqK+CFfK8v3XT+fJjzZ
 udjiMrsSS3FGoqEWc1FxIgDXfW8GDQIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: to allow users to dynamically tune the boost_zoned_gc_percent
 parameter Signed-off-by: yohan.joung <yohan.joung@sk.com> --- fs/f2fs/gc.h
 | 3 ++- 1 file changed, 2 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/gc.h
 b/fs/f2fs/gc.h index 5c1eaf55e127..11fba7636af7 100644 --- a/fs/f2fs/gc.h
 +++ b/fs/f2fs/gc.h @@ -194, 6 +194,
 7 @@ static inline bool has_enough_invalid_blocks(struct
 f2fs_sb_i [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uUDlv-0007f8-6G
Subject: [f2fs-dev] [PATCH v4] f2fs: enable tuning of boost_zoned_gc_percent
 via sysfs
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

to allow users to dynamically tune
the boost_zoned_gc_percent parameter

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/gc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..11fba7636af7 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+		return !has_enough_free_blocks(sbi,
+				sbi->gc_thread->boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
