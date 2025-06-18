Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09646ADE556
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 10:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WPb2+8tt1TS0Jq9QI+uNNikQjOWGnmG1/dpjjbq9L4=; b=h/SplQied0UJc3Wtg1pDbCxGDQ
	+KiAXGyqOcQkcbuoXXZJugsjmQRTwGgTQP+QrLlGnpN7ZAAyrkx3pDAnQTIhSFDWw4zdA2j8J/MRF
	d1ga3uk8zZvC+PgCqMPbchnkMZTvkhXkey8cnf/0IeHxMBYf1FNXRFS8VHWm2NOkBvpU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRnz3-000175-8G;
	Wed, 18 Jun 2025 08:17:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uRnyz-00015u-2k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 08:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZV3h0Uy6Niu28f8mCB0jH0Uu2un/q6NsRFZRNE/I1Us=; b=liO7coqqDwdia+togMUKSwTbsU
 cHekK9nky7zMHl6qCrprt/lPzWaS3NFnBiqbXL2JDLhyvjjAdnCwQ5xChQpfNVs7PvXAqSd7ZdhyQ
 9Xh+iVAZ3RmbcUUdyO10ThssuDNgKriOBTmpAK6ZsxlzNJ9wc34Vt8rx08OLr9qCDBEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZV3h0Uy6Niu28f8mCB0jH0Uu2un/q6NsRFZRNE/I1Us=; b=Hz9C1DwxpJ+FuWWUZXXKy85zGd
 BIVXSZ2GAwcKKGCTjTwUbc/B44TUeWWQFlAWOw/uyp/EqPBjK+qfALFNnI3H+S3LJ3gdRtev/xX2b
 JmloxnIeJgHMVcOrGGad0cO/nTRAPXWpULMJNm7KCxy1LUKvmEzpLtTBvxJbLeyy1/zk=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.123])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uRnyy-00046S-E1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 08:17:21 +0000
X-CSE-ConnectionGUID: 4R/02tS0QtCl8GseCaL78w==
X-CSE-MsgGUID: 5UFOyZgdShC6js6sQsxUPA==
X-IronPort-AV: E=Sophos;i="6.16,245,1744041600"; d="scan'208";a="143507967"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Wed, 18 Jun 2025 16:17:05 +0800
Message-ID: <20250618081705.260239-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617055542.218681-1-huangjianan@xiaomi.com>
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.163]
X-ClientProxiedBy: BJ-MBX06.mioffice.cn (10.237.8.126) To YZ-MBX05.mioffice.cn
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
 [207.226.244.123 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRnyy-00046S-E1
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid splitting bio when reading
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
Changes since v1:
- Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.

 fs/f2fs/data.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..2d948586fea0 100644
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
@@ -2370,12 +2370,18 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		.nr_cpages = 0,
 	};
 	pgoff_t nc_cluster_idx = NULL_CLUSTER;
-	pgoff_t index;
+	pgoff_t index = rac ? readahead_index(rac) : folio->index;
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_compressed_file(inode))
+		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
+				round_down(index, cc.cluster_size);
+#endif
+
 	map.m_pblk = 0;
 	map.m_lblk = 0;
 	map.m_len = 0;
@@ -2385,7 +2391,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
 
-	for (; nr_pages; nr_pages--) {
+	for (; nr_pages; nr_pages--, max_nr_pages--) {
 		if (rac) {
 			folio = readahead_folio(rac);
 			prefetchw(&folio->flags);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
