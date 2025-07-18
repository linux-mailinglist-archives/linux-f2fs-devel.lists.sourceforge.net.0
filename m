Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76368B0A053
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jul 2025 12:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ju0CIvVCw/Sr5XUDHkRoFCdvrNiwFDVuFzjwclgIgZI=; b=OkC9W+5GnQVr2Nkj4wRyOBiQif
	+akQ9VTkkVl7lwJyMeF6/akyzwcrJUPsC6IYu3u0q8VGWEFQHcmEqRua2T2yURLu0Mu7wvC+2LkmV
	U+4dJjNOcDgUc7uBcS9fNAiHwZDWTHWuPqAnjuqRzdDkvi4fOiDCpm+C4rpzK/0zlYCY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uchzq-0005yg-VK;
	Fri, 18 Jul 2025 10:07:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uchzp-0005yZ-Fv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 10:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1dPaDRa5/OXdXWsPu12v6bsOVEqtCXo6RTkpdY2H+0Y=; b=kXZhMJ6FCylwgyW2HWcI5ngNsq
 Oxv302MkVUaj8XnH1CEW7T0Qdw8eorvkXa1nkzCvXcdtkEcudMOlszpYLxCG3rBSJZkJHbOkcjwge
 ImJyxUYgNrn6imItM74rUzIJiApFUv39mgEWKZJUyfKpy6HRxQhSni5/wgOyyoIApsNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1dPaDRa5/OXdXWsPu12v6bsOVEqtCXo6RTkpdY2H+0Y=; b=I
 87rsPiLbx2QJeTjNzJrvFvYVg/defUVCyLflakCVO7vb5E2QrlsrAw159L89kj6ZzNriQhv195nSP
 dxBqEsUPnbvyIGwkLuGVB9twLmkpzqT4bfLbwN1Tg8rBRHHEeEGvD4Oxg9yyN26RmiLA6L6h1bCHU
 Vk2i173fW2/Inn1s=;
Received: from mta22.honor.com ([81.70.192.198] helo=mta22.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uchzo-00007A-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 10:07:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=1dPaDRa5/OXdXWsPu12v6bsOVEqtCXo6RTkpdY2H+0Y=;
 b=HrCoUWr5JUsa1cB4eMqvHomOn4lNW3NvVE2Ixvxgb5UX8MBzI5tIWFDeHFFhYbUoqHcwr7zXF
 IDYCCziFGt06U8G8IKEdC/bAJtX764gXGLy1dcInAuw5HfppP6d16+PZDb0v4nq8fLTbd5BA8dz
 t0fYntOkaNPJH5gL9IyKKMg=
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bk54l5HbBzYl4K7;
 Fri, 18 Jul 2025 18:04:55 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 18 Jul
 2025 18:07:09 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 18 Jul
 2025 18:07:09 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 18 Jul 2025 18:07:05 +0800
Message-ID: <20250718100706.3948806-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __lookup_nat_cache follows LRU manner to move clean nat entry,
 when nat entries are going to be dirty, no need to move them to tail of lru
 list. Signed-off-by: wangzijie <wangzijie1@honor.com> --- fs/f2fs/node.c
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.192.198 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uchzo-00007A-Vo
Subject: [f2fs-dev] [PATCH 1/2] f2fs: avoid redundant clean nat entry move
 in lru list
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
 feng.han@honor.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__lookup_nat_cache follows LRU manner to move clean nat entry, when nat
entries are going to be dirty, no need to move them to tail of lru list.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4b3d9070e..b9fbc6bf7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -460,7 +460,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
 
 	f2fs_down_write(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, ni->nid);
+	e = radix_tree_lookup(&nm_i->nat_root, ni->nid);
 	if (!e) {
 		e = __init_nat_entry(nm_i, new, NULL, true);
 		copy_node_info(&e->ni, ni);
@@ -2926,7 +2926,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 
 		raw_ne = nat_in_journal(journal, i);
 
-		ne = __lookup_nat_cache(nm_i, nid);
+		ne = radix_tree_lookup(&nm_i->nat_root, nid);
 		if (!ne) {
 			ne = __alloc_nat_entry(sbi, nid, true);
 			__init_nat_entry(nm_i, ne, &raw_ne, true);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
