Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA1CCE69B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 05:05:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oOxeDD2yyNjR5f3suubuIvBMov5DgYdccIdsLj8FVuI=; b=LLxJhm5DgrsMBCNplulZw1NlYt
	pEFvDQ+qvHDJ21CIehPrBz3nge2iWlxxYpyNEs4pwki9LU+bHtrmHOHkYyZV6LC0vOUw8zY7dHRmr
	hNeH/TjOLlnTQLGPDWxAe7fguH7obNLZrKxT7RC8oGVV7D2atJLVxeyXIbmLPqvpdEKM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWRjk-00043t-Ie;
	Fri, 19 Dec 2025 04:05:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vWRji-00043b-2a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 04:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHFddfBXvB5cT8991YXc+6QU9Nmv6MRIEhtyJRGbuyg=; b=P7ZOL7kWr6UVr1f86dLicWpy38
 3nFZ7w53k98rkfUuVpd1zqSxs/Xkem1GDGwG25M8gsgDaepDJoKrV2U0PKHKZjbec3rHegttpr8fc
 IcAhWUEifNiS+wlgCWANJUl/g977CHe33Y4pNkysCstVeXXPNV7iXBfvO9HkDTsKpO7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aHFddfBXvB5cT8991YXc+6QU9Nmv6MRIEhtyJRGbuyg=; b=D
 m1d67Ci2J9FH7ZaaicjQW++DfbC7fUIOrTyIUb173WZ6jx2/ER25olynGIebDnrcFih+RyiKfxnpl
 wzb+RxiFkre4Lf9762U3JEgPZYQ3DpknAl9IJpn8uZ23gSSVcK0zJ2zlZ2F9DBzmbgySfCEs5QBbp
 c1q+R21CJ58u38zs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWRjf-00069G-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 04:05:01 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 5BJ43or8020659;
 Fri, 19 Dec 2025 12:03:50 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dXYgk4Lylz2Lk7mr;
 Fri, 19 Dec 2025 11:59:14 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 19 Dec 2025 12:03:47 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 19 Dec 2025 12:03:11 +0800
Message-ID: <1766116991-2910-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 5BJ43or8020659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1766117034;
 bh=aHFddfBXvB5cT8991YXc+6QU9Nmv6MRIEhtyJRGbuyg=;
 h=From:To:CC:Subject:Date;
 b=NEzGQM3ehlzh4e9p2UE+Uqr5QeT6SFcB0U/0vEh7oUb4FGrOmRFF2SOV8kRqr6xTb
 q67coOlk9z0yHvuoN66lZzqWQCiMXZ6EV1SVPSAXj3CSkrl56b53M/LAkoOfy9AEns
 ZYXaNpsl+BZ/0tKjRfEAGwl6Z+60kaYkl8aoVGghWknS002zNv6nmZnSZUnKLC9PH0
 FPBZmeBjpAI0irrgy7ILNwbaWiDIfktSdjbnWSkvv38UEbSpR7YFqYUeDJZYhSfoOs
 /qL9RrTCfC3FTYZxR6MALN9nepD28WQW9oFN/Vb5ziYYrgWMxqQHlRbO/Lln/OrlTN
 hGcaXOWfhIkWw==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It missed the stat count in f2fs_gc_range. Cc:
 stable@kernel.org
 Fixes: 2f0209f579d1 ("f2fs: separate f2fs_gc_range() to use GC for a range")
 Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> --- V2: add Cc and Fixes
 tags --- fs/f2fs/gc.c | 1 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vWRjf-00069G-Ug
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to add gc count stat in
 f2fs_gc_range
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It missed the stat count in f2fs_gc_range.

Cc: stable@kernel.org
Fixes: 2f0209f579d1 ("f2fs: separate f2fs_gc_range() to use GC for a range")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
V2: add Cc and Fixes tags
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6afd57f..58b291d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2096,6 +2096,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
+	stat_inc_gc_call_count(sbi, FOREGROUND);
 	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
 		struct gc_inode_list gc_list = {
 			.ilist = LIST_HEAD_INIT(gc_list.ilist),
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
