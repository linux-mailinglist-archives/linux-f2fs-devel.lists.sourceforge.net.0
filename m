Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF5ADE35E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 08:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9W9ChgMN+bWaoLckXexKZdDANMgrNmB0qYoU4PsVcZw=; b=iRCfD9PG8VFg3SAC+s+8mF6BKe
	mx9/oFL9cDz1eB6eSK6WwAL7Hk27N/KkkZ5yJ6rtL8qK0Srf+0/h1xkKdDI79cw/HaxveXl4UOG/l
	Z6H5UxW5zHrmZKmTsxmUl+G/5vDd+1N5hYH01asIypT+3KubsdUbGqmMyQQSjAQg5duI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRluU-0003cP-93;
	Wed, 18 Jun 2025 06:04:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uRluS-0003cC-W1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 06:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qnGxCT3LCsmvodlW5m32VyBudG27YqFBLBEbCaCNt+s=; b=X/uEaGlOOyBQFIjNG3NXWMGTve
 4WjHU6rJb/uuyZainatWMYO75dDOzTXFsnLY63ow4gMeWGwSYzqA4/wqa74XjvErFM/suJGJOHJVl
 jE71t3m3oEydFRuOXx3MR+8KMYf22AMzEY6PR5VIUviRzvNbosiBYJMv7r3jxup7Yf6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qnGxCT3LCsmvodlW5m32VyBudG27YqFBLBEbCaCNt+s=; b=m
 B1W5NYcCu/fqu4sWVB8YCtI6zMDBYp4KIZce9sYiGKraLeen1dEtxAY8bcyjQjlIYPl6akDxnbbf3
 mr+qcu+0nTlFNXkUmz5xUVRYNg298gYiwRas1zOaF/5W+IBVdjAmDbAjT387XRM7pQ4P0OBYN9il+
 73qUlGB1O3//y3Kw=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uRluS-00057H-De for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 06:04:32 +0000
X-AuditID: a67dfc59-057ff7000000aab6-51-685256e95ae4
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 18 Jun 2025 15:04:13 +0900
Message-ID: <20250618060414.97-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LhesuzUPdlWFCGwetOVYvTU88yWTxZP4vZ
 4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4Mh5NeMJa8IKz4uCC
 5AbGqRxdjJwcEgImEq9XNrDD2EtWfGcCsdkENCT+9PYyg9giApoSRzpnAtVwcTALtDFKtB9t
 YgVJCAt4S/Sv3QJUxMHBIqAqsX6iOUiYF2jOypZTUDM1JXZ8Oc8EEReUODnzCQuIzSwgL9G8
 dTYzyEwJgYesEjObdjJDNEhKHFxxg2UCI+8sJD2zkPQsYGRaxSiSmVeWm5iZY6xXnJ1RmZdZ
 oZecn7uJERhMy2r/RO5g/HYh+BCjAAejEg/vBq/ADCHWxLLiytxDjBIczEoivItP+GUI8aYk
 VlalFuXHF5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKanZpakFoEk2Xi4JRqYOxc/3vmEk8/i99l
 Mg/vtFj9ntCRuWHnnMCU2oLzD8S0uHbdVL5/ZqIw1xoG8YuWlnJfg4SM1WztbW77z1wkIba1
 c5KwU4TQ7LW75rEem8HyxVVx/uQNX2abrvLsKvt34JHm7+1mL9rNWy/eueT54LHLq5mfuY6b
 zNkaPzPes5rhbueNGZ8vW+YosRRnJBpqMRcVJwIAM2ejqSICAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJMWRmVeSWpSXmKPExsXCNUNlju7LsKAMgzs/pSxOTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgyng04QlrwQvOioMLkhsYp3J0MXJySAiYSCxZ8Z0JxGYT0JD409vLDGKLCGhKHOmcyd7F
 yMXBLNDGKNF+tIkVJCEs4C3Rv3YLUBEHB4uAqsT6ieYgYV6gOStbTrFDzNSU2PHlPBNEXFDi
 5MwnLCA2s4C8RPPW2cwTGLlmIUnNQpJawMi0ilEkM68sNzEzx0yvODujMi+zQi85P3cTIzA8
 ltX+mbSD8dtl90OMAhyMSjy8G7wCM4RYE8uKK3MPMUpwMCuJ8C4+4ZchxJuSWFmVWpQfX1Sa
 k1p8iFGag0VJnNcrPDVBSCA9sSQ1OzW1ILUIJsvEwSnVwNj8X0pjxmcl+9fvGqZfCd7EOfFP
 lSLvtYY/ChO/u9gFdVfZ9lkemV33+yp3ktnDF9/U15jc2Ri4YZ/G27obcZfTyo7OCeVIy1nG
 Y2MxS+rFwZqpUxllNt9bcLml28CBQVVQ9MqN2EPrf9qwFk5f/8qXO6VGXUpTTVHg7599Uwr8
 Ds1SSZ1Ww6TEUpyRaKjFXFScCABKlo6eCwIAAA==
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
 | 3 ++- fs/f2fs/sysfs.c | 7 +++++++ 2 files changed, 9 insertions(+),
 1 deletion(-)
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uRluS-00057H-De
Subject: [f2fs-dev] [PATCH v3] f2fs: enable tuning of boost_zoned_gc_percent
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
 fs/f2fs/sysfs.c | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index 75134d69a0bd..d0ec9963ff1b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
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
