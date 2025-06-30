Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C8AEDDB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 14:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2cji8ekqCa0E9SmibdancEiWUvmao+CNNFfrUMKpeA=; b=CNY6QIHwKM2rU/48wMWrHJbABJ
	lDHLHDQ2cGylbs9gxkK6rf7Boq32XdSBhgeMWFMQacc71opWRYe9V6T4TGfzJMsdw3VS8hBus6+n6
	R4FCLyg1rxT8iOQEsmI1xjKhtgDaENTLg7+xWCeFsrpL7h2Zpxg5tlraKpzRhDl+xpPw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWE5F-0007bq-D8;
	Mon, 30 Jun 2025 12:58:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uWE5D-0007bj-KZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 12:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IWb6eggVTt0d4HoTFjAxweaNHT1guFo4vuhs+Mq8Zt0=; b=KKlY7CBmyFQDt4V59xx7xJB8yO
 AkXUjH6PR8t0AWWGo3N3dBxqYE19cGUnFZuSHIQAhZAAWQWJJ21VXpZsGdeordzMfYJQ16srTxsRA
 vNuTabN0QSf6C/mIflFPKTemZH9WZUVd832LrExNQ12G9LQKt4zQocqgeNGCjECC5tI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IWb6eggVTt0d4HoTFjAxweaNHT1guFo4vuhs+Mq8Zt0=; b=F
 QK/z50CFnUy0pA0u4wKOwbvbqc36ucasOezxjIQ0Lw/FXyvMKXxbinKoiiVKabZMhtotNtYeeouub
 zVxT5g9wHdKYxbtjLHMo36VQbt9gAcEEvsx9F5zYI0Hf74FP8BqpxoPfT0/8yiVsU5Hr1tsFDrGeV
 0lzG0HyHavMtQXlE=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uWE5D-0003FV-0d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 12:58:03 +0000
X-CSE-ConnectionGUID: 5LBxny4CRvOsaSC/c5fhuw==
X-CSE-MsgGUID: GT6SKkc9Sr6P7+8g5QAp1g==
X-IronPort-AV: E=Sophos;i="6.16,277,1744041600"; d="scan'208";a="119068307"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Mon, 30 Jun 2025 20:57:53 +0800
Message-ID: <20250630125753.650630-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.237.8.167]
X-ClientProxiedBy: BJ-MBX17.mioffice.cn (10.237.8.137) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When fewer pages are read,
 nr_pages may be smaller than nr_cpages.
 Due to the nr_vecs limit, the compressed pages will be split into multiple
 bios and then merged at the block level. In this case, nr_ [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [118.143.206.90 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uWE5D-0003FV-0d
Subject: [f2fs-dev] [PATCH v4] f2fs: avoid splitting bio when reading
 multiple pages
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
From: Jianan Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jianan Huang <huangjianan@xiaomi.com>
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
to the nr_vecs limit, the compressed pages will be split into multiple
bios and then merged at the block level. In this case, nr_cpages should
be used to pre-allocate bvecs.
To handle this case, align max_nr_pages to cluster_size, which should be
enough for all compressed pages.

Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
Changes since v3:
- Keep max_nr_pages unchanged across multiple reads.
Changes since v2:
- Initialize index only for compressed files.
Changes since v1:
- Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.

 fs/f2fs/data.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..40292e4ad341 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		}
 
 		if (!bio) {
-			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
+			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
 					f2fs_ra_op_flags(rac),
 					folio->index, for_write);
 			if (IS_ERR(bio)) {
@@ -2376,6 +2376,14 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_compressed_file(inode)) {
+		index = rac ? readahead_index(rac) : folio->index;
+		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
+				round_down(index, cc.cluster_size);
+	}
+#endif
+
 	map.m_pblk = 0;
 	map.m_lblk = 0;
 	map.m_len = 0;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
