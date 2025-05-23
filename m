Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CABAC18F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 02:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vMHKGhrrs2wEj7eFArLitMxysTd/YRZR0gD/l8K3iHo=; b=RDUtoM2yt3VV82ijkCppUwOXPp
	9dgYzu5UrNcDr0udC5h3Z7wPtch0y/ZSDGbc4gZsyuXpqQ9HLMMHXi1MSkBJqQXQn7bXGjCyWxiVt
	XhOuyo6vuWQPTr4JX825djAS3oL4TKoaZChxD+qVBoXFZIsupb1KDIUqqQinx91ZX/D4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIGAm-0007fs-Ed;
	Fri, 23 May 2025 00:22:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uIGAk-0007fk-EJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 00:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T9XD6TxxpUQyzJpzoOm7Ogn+pXxSouVMkBH6H1nFzeo=; b=WAS5L6HqigH1/ihX32fgp9hHBK
 LUDyTbnteS+fk9Gk+uYrPJSGfOH5viMFNNO5pmXm++ztYiB8rwwsE33YAHDvJS2I0GWk31x5b9ToW
 Ma7/1OAl9EWohu54cGLPCHx7UKWNzHBBLgSZDZNyYuB4hiNbX3cNZ7FK1GoacOAaohWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T9XD6TxxpUQyzJpzoOm7Ogn+pXxSouVMkBH6H1nFzeo=; b=l
 h18svncS5AQO2hE3/GCIVlAIoProXpqvVeGbaaSHVjUh1bOiJR32jGMgCvZ8Vj5yMggXuAaRBnX4p
 KRnL+CJRQYuMpTmoUmst7M9pTJNZYbDCYlEy9SIfZbOZfxqMT/oFzIoul36gX2Vi+PDezKQn94vcU
 JXVyD0HlHUeRLWOI=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uIGAf-0001NK-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 00:22:02 +0000
X-AuditID: a67dfc59-03fff7000000aab6-f6-682fbf9d8325
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Fri, 23 May 2025 09:21:45 +0900
Message-ID: <20250523002146.763-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnke7c/foZBk2TjCxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErowp
 q9UKprFVTFzL18A4n7WLkZNDQsBE4uanNjj7x8wjjCA2m4CGxJ/eXmYQW0TASeL/jXb2LkYu
 DmaBNkaJ9qNNYA3CAh4SqzevBmtgEVCV6D50nA3E5hUwlfj39zoLxFBNiR1fzjNBxAUlTs58
 AhZnFpCXaN46mxlkqITAS1aJ3ds3s0M0SEocXHGDZQIj7ywkPbOQ9CxgZFrFKJKZV5abmJlj
 rFecnVGZl1mhl5yfu4kRGF7Lav9E7mD8diH4EKMAB6MSD+9BQf0MIdbEsuLK3EOMEhzMSiK8
 R5/pZQjxpiRWVqUW5ccXleakFh9ilOZgURLnNfpWniIkkJ5YkpqdmlqQWgSTZeLglGpgVO/+
 2/Zo0XS3S483X2fZvMcz+0msXMaFpXL7A9+mb7BpOJfieqjLNPsMa4b9Pz+bhYs6HGesjgy+
 1pQ/a+LzKUEzpNjNN02ffT3qZxjz4wtXHjz+POEih5Zt4O3X4vsbHXRYSyeFxy96vfDoiyL2
 ZV/up17tqKvWSq7jzW1KDPskzGOf5m/DqMRSnJFoqMVcVJwIAGtLgVgrAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LhmqEyR3fufv0Mg0er1S1OTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
 LpuU1JzMstQifbsErowpq9UKprFVTFzL18A4n7WLkZNDQsBE4sfMI4wgNpuAhsSf3l5mEFtE
 wEni/4129i5GLg5mgTZGifajTWANwgIeEqs3rwZrYBFQleg+dJwNxOYVMJX49/c6C8RQTYkd
 X84zQcQFJU7OfAIWZxaQl2jeOpt5AiPXLCSpWUhSCxiZVjGKZOaV5SZm5pjpFWdnVOZlVugl
 5+duYgQGzLLaP5N2MH677H6IUYCDUYmHdweXfoYQa2JZcWXuIUYJDmYlEd6jz/QyhHhTEiur
 Uovy44tKc1KLDzFKc7AoifN6hacmCAmkJ5akZqemFqQWwWSZODilGhi7RFsDam7x3b5j+Ty8
 Y3Xfwk1bO955PJeade/huQnCoRqbWotvy9XeV73WtcTtaOmVFZIuD7IDWzf92Pf6bPRh5d0z
 Xvjt/b9FuDXB1d7084XQBZ72F9bMnHjSd63Ml5k/OzsNk0TbD25mtHhkrzrjK5NTy2M+cZHW
 528PZ/c+OL1RflnD3dZYJZbijERDLeai4kQAwyugphQCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: to allow users to dynamically tune the boost_zoned_gc_percent
 parameter Signed-off-by: yohan.joung <yohan.joung@sk.com> --- fs/f2fs/gc.h
 | 4 +++- 1 file changed, 3 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/gc.h
 b/fs/f2fs/gc.h index 5c1eaf55e127..f9ff68dc2bcc 100644 --- a/fs/f2fs/gc.h
 +++ b/fs/f2fs/gc.h @@ -194, 6 +194,
 8 @@ static inline bool has_enough_invalid_blocks(struct
 f2fs_sb_i [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uIGAf-0001NK-Fw
Subject: [f2fs-dev] [PATCH] f2fs: enable tuning of boost_zoned_gc_percent
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
 fs/f2fs/gc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..f9ff68dc2bcc 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -194,6 +194,8 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+		return !has_enough_free_blocks(sbi,
+			sbi->gc_thread->boost_zoned_gc_percent < 100
+			? sbi->gc_thread->boost_zoned_gc_percent : 100);
 	return has_enough_invalid_blocks(sbi);
 }
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
