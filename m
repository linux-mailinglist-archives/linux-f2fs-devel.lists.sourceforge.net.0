Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1BADA758
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 07:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5fk5IgA5z4rKX0VCdfp5bZatdalNtAuTJ8DxgpqLxsY=; b=WSz6pGrs0UmB3gFjKzz8ZSsyBM
	cQVUAIVkFYrgPzz0KvL0x56D6mfo60DOdpVjyEhP8n1t+mGZXDGWpnzVnc5JKQXkqzYxzOii4O9ib
	yH0Y1akVOWvoXwSPQPkepzP5Bc8j+TPj5QY9gNKEJhLC+CL6RsDz+7c8D96BZUX6i9uY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uR21p-0004CR-NT;
	Mon, 16 Jun 2025 05:05:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uR21n-0004CG-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 05:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LJ9kQ4cxT1AC0HMVi9ljzPsXGfUmrbsoegcwE9I3S8Y=; b=JDvwl/Euk9EAVEc8LCCYNPfYud
 E/ao/0iZPbVauv8l9TK/ZmJ9KsL+3ZvDPnHIgz0VumW8X8UZCtBc3jQxfDL6OXJ2C+XQFpy8POpIp
 /3UHGxfy+c4xpw5c+UJQKz8umTazmRWpDADFgGkBzOKN5Z3qG3jfNwEtALhLS/Ruk1E8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LJ9kQ4cxT1AC0HMVi9ljzPsXGfUmrbsoegcwE9I3S8Y=; b=H
 qnkmRDZVqHYypbtDVgE/69JuIjroE9MUinTP0KY4LTcIq7ATYooQC/C9FfW86lRCRHbg5G50+5AtR
 uhj5XDArCIdh8MeJHqNoyWY/c6eSrRrsZm0eCdRtknngCqK5S4hDUVIVuvTRZY+oPaMWmsJTPKKkw
 g4mojkdbem/AFHtA=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uR21n-0003e6-6R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 05:05:03 +0000
X-AuditID: a67dfc59-03fff7000000aab6-65-684fa5f8c482
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 16 Jun 2025 14:04:44 +0900
Message-ID: <20250616050445.1492-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXC9ZZnoe6Ppf4ZBlcOClicnnqWyeLJ+lnM
 FpcWuVtc3jWHzYHFY9OqTjaP3Qs+M3l83iQXwBzFZZOSmpNZllqkb5fAlbHrzzmWgp2cFavP
 9rI0MH5i72Lk5JAQMJG4u6mZGcZu/fSaBcRmE9CQ+NPbCxYXEdCUONI5E6iei4NZoI1Rov1o
 EytIQljAW2LCulYmEJtFQFVi7pHNYM28AmYSC3YfYYEYqimx48t5Joi4oMTJmU/A4swC8hLN
 W2dDLb7LKtH82QDClpQ4uOIGywRG3llIWmYhaVnAyLSKUSQzryw3MTPHWK84O6MyL7NCLzk/
 dxMjMJyW1f6J3MH47ULwIUYBDkYlHt4DW/0yhFgTy4orcw8xSnAwK4nwLj4BFOJNSaysSi3K
 jy8qzUktPsQozcGiJM5r9K08RUggPbEkNTs1tSC1CCbLxMEp1cAYdugiN1/9r1/zmMzSfN9e
 P3s96Ni1HRs+rebrW6W9RqHbbvX5/YfmZU3Wu6NqsPym4LYfIgtS7vvK3zr2uEPleovalBnB
 N05kZIo7GCRw1S/U+Zn8/Na5J/elMt/eXyD9+t/Om9ZGMuEvebI/+cnPW/WdRUru9vtjPn1N
 VXsTfnxyCZPhW/j+uhJLcUaioRZzUXEiAOffXNIjAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFJMWRmVeSWpSXmKPExsXCNUNlju6Ppf4ZBvceMVmcnnqWyeLJ+lnM
 FpcWuVtc3jWHzWLC3KtMFu+33mN0YPPYtKqTzWP3gs9MHt9ue3h83iQXwBLFZZOSmpNZllqk
 b5fAlbHrzzmWgp2cFavP9rI0MH5i72Lk5JAQMJFo/fSaBcRmE9CQ+NPbywxiiwhoShzpnAlU
 w8XBLNDGKNF+tIkVJCEs4C0xYV0rE4jNIqAqMffIZrBmXgEziQW7j7BADNWU2PHlPBNEXFDi
 5MwnYHFmAXmJ5q2zmScwcs1CkpqFJLWAkWkVo0hmXlluYmaOmV5xdkZlXmaFXnJ+7iZGYIgs
 q/0zaQfjt8vuhxgFOBiVeHgPbPXLEGJNLCuuzD3EKMHBrCTCu/gEUIg3JbGyKrUoP76oNCe1
 +BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTqoFR4Og8/fAd5sfmBSguKPFb86La5dZZ
 SfG0hLUb3nlMKpp7yP/CPjd+6/amPyfieIXXcF5SKd/DzGbY+NLUdkF/z4M7z/0jV27WEptl
 dJL1k7S/Snucmo5HlRX3FuVso/91Jxbr1ucmnN7zKb90x+Z594oeqRqvOBhYJFrE5nR346qM
 FvbUwsNKLMUZiYZazEXFiQCNihNPDQIAAA==
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
 | 3 ++- fs/f2fs/sysfs.c | 5 +++++ 2 files changed, 7 insertions(+),
 1 deletion(-)
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uR21n-0003e6-6R
Subject: [f2fs-dev] [PATCH v2] f2fs: enable tuning of boost_zoned_gc_percent
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
 fs/f2fs/gc.h    | 3 ++-
 fs/f2fs/sysfs.c | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..6c26b5e10c8f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -628,6 +628,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
+		if (t > 100)
+			return -EINVAL;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
