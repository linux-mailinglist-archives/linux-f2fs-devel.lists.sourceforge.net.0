Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C2AE73AC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 02:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlNhWTsYNElt37T7kiT/WT3cRGhlHYrlbdysSgBydVg=; b=S8yZDpG7vuYnuD1D1UGbZkgqCj
	VPGYqOFyWVRetYIvt1GaJOM8mbUxh+jehY6ZrQ+GC5/y5ZsdqTz+mULx+/1FPX+0/uSKlrIt1YOnY
	ezKnPECfTfuKuZKNQh/uiJNv7+MfUsqfj7PfIiZm5Aj2duClGc/ghlxKW0LUlLSS/M/4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUDmR-0004Wm-Dc;
	Wed, 25 Jun 2025 00:14:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uUDmQ-0004Wg-8g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 00:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXvM6N9OKpKWE8xFzVnVjxE2Lxy9g/G6ZCVBY5y5oWI=; b=O6bSSwZ65HOeRQ6mWpXxoH9GiI
 aAwjkXzLCW8uxwbTK9azY1Yqkva/dXyoo+fvBk7lkEir9zo8ageFOlSmxFhMlYKetlYzA8GoAIhPv
 xZ0eBNQH+eDPhkke9DptdpVMTy764k9mqwe7zjUQQg03jq2A9oje/xb1+tFOMK/5MX1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lXvM6N9OKpKWE8xFzVnVjxE2Lxy9g/G6ZCVBY5y5oWI=; b=e
 hjDbs3jLJrHlV2jGf1mE1ElBFl2IYjtrJB3NS1DokrANDGSuIkyQyW+zHIkyPfLz/Yr+FhsnOncrg
 +1qfzrIV/J5zWLXQn6FjbY7zwXsx2mVoMBs8+fPb/C+koncbojjpoDON+f7fL+HclENS2qS2Qp8Iv
 O/6Tq5Qz3yglLvEE=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uUDmP-0007mO-RO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 00:14:22 +0000
X-AuditID: a67dfc59-057ff7000000aab6-9e-685b3f52cc9f
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 25 Jun 2025 09:14:07 +0900
Message-ID: <20250625001408.1961-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzUDfYPjrD4PUFZovTU88yWTxZP4vZ
 4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4Mq6t3sNcsJ214s9K
 9gbGLSxdjJwcEgImErd6HjDD2LP2NbGD2GwCGhJ/envB4iICmhJHOmcCxbk4mAXaGCXajzax
 djFycAgLREocfFgMUsMioCpxb+tSsJm8AmYSy/c9Z4eYqSmx48t5Joi4oMTJmU/AapgF5CWa
 t86G2nuXVeLkRU8IW1Li4IobLBMYeWchaZmFpGUBI9MqRpHMvLLcxMwcY73i7IzKvMwKveT8
 3E2MwFBaVvsncgfjtwvBhxgFOBiVeHgNWqMyhFgTy4orcw8xSnAwK4nwTjMHCvGmJFZWpRbl
 xxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamAsnKga0Veye9JW61kFr2x3
 5lvPaN3L4Lfo9pxi06Q5Jt0pGjpvi+0XpfUW7YhnCQs1nPJh45ciu4v6EgZ3/p253n6mNYLJ
 kdH+cKPr85DGI6uEGu3d1cusLCOZLDJS9czsamI/1Uw4FFnU5WGaPHVBvlv6Q5V75iomll1l
 S1LMrGq+8jbOUmIpzkg01GIuKk4EAAOOVCAhAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJMWRmVeSWpSXmKPExsXCNUNljm6QfXSGwaFpVhanp55lsniyfhaz
 xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
 2yVwZVxbvYe5YDtrxZ+V7A2MW1i6GDk5JARMJGbta2IHsdkENCT+9PYyg9giApoSRzpnAsW5
 OJgF2hgl2o82sXYxcnAIC0RKHHxYDFLDIqAqcW/rUrA5vAJmEsv3PWeHmKkpsePLeSaIuKDE
 yZlPwGqYBeQlmrfOZp7AyDULSWoWktQCRqZVjCKZeWW5iZk5ZnrF2RmVeZkVesn5uZsYgeGx
 rPbPpB2M3y67H2IU4GBU4uGNWBGVIcSaWFZcmXuIUYKDWUmEd5o5UIg3JbGyKrUoP76oNCe1
 +BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTChggN7J4FvqcjBWK2D+lP6wtSLfNf8Xu
 J6JGs2UOr1r2UmKr65uegzYVIWdyxO+p3l5RmsdkxrL/2QO3uYdL2msmH5i0Tej4g6niOsK3
 7hRkb/4vxxuSPH9C8+ZjFutVXYXmGTtPmPTgV9Xn/f/fLY85KhRjVpiw75k569bpsxYZ3WtJ
 rU/+6H5SiaU4I9FQi7moOBEABodZnwsCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: to check the upper boundary when setting
 gc_boost_zoned_gc_percent
 Signed-off-by: yohan.joung <yohan.joung@sk.com> --- fs/f2fs/sysfs.c | 7
 +++++++
 1 file changed, 7 insertions(+) diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
 index 51be7ffb38c5..2b5c35ce7b8c 100644 --- a/fs/f2fs/sysfs.c +++
 b/fs/f2fs/sysfs.c
 @@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a, [...]
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uUDmP-0007mO-RO
Subject: [f2fs-dev] [PATCH] f2fs: fix to check upper boundary for value of
 gc_boost_zoned_gc_percent
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

to check the upper boundary when setting gc_boost_zoned_gc_percent

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 51be7ffb38c5..2b5c35ce7b8c 100644
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
