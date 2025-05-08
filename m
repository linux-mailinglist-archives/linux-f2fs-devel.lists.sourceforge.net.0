Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC04AAF2B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwsGrPwvFyqrzn05RNucJoG1q++9mVg4XdzMTTzYDTk=; b=N3iBhV0mLOxChPBOe3xUAlXAt8
	ZkzTZFB73IugGA299KhoahJyXZ+ULTY7l0dtgGPstGb1FoJUbFOdbq4AuXHkGRO/ea9SDdvV/LMyf
	ZeNQkl1osnr2/Oeoou8mWTXqMOso4INfvviQoxysrSEBU7tqb0MBb5RHfHgFoSi08ilU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtbn-00060k-5z;
	Thu, 08 May 2025 05:15:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbl-00060c-DR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pqWJWBPSs4P/pAKs04mbwxvUo6WZ6kc2P9tPzwI5CAs=; b=RLbmJo8Bd/DNTokFDOhdHGEEIv
 69LADe4rP1Y+tT/eIEvcRwqWgQnF6WMyuAFAWFYTm5+J6ZM6gH14k1qC/xGWNy8VtZjt4xTst20Hw
 H7CxELj4FgL8KJ0nZ4jW3O7oSa3QdktX8GDYpp3gmzlMSDE5Gi/1c71TVDTJ+pW8kiNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pqWJWBPSs4P/pAKs04mbwxvUo6WZ6kc2P9tPzwI5CAs=; b=dFzl1Ddt7ZYre4oujernGobyKq
 BaNJMr+g8Tdf2ifrjJHbsjL6Cg3f3LNzZPF7PQE8q87ANeSeSRV76eOxa/7EVj4EcYRnseuiQ8/8k
 djlPWxytqVD+UbhFmwdIhVWsU9COCg6IYc6EgDCa8m2iNTo4JHkOotadpqgx4Oab4p1o=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbk-0003cm-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pqWJWBPSs4P/pAKs04mbwxvUo6WZ6kc2P9tPzwI5CAs=; b=K5PLsjS+fG/we46+q7A5vJeSGp
 HdJiDdnWx+Vq2WhA5hIZigYV94pcewyPTL8yDRXBWkdXGr/hO9koGZ2E+WHKsza22B4fIaEp2TcqW
 kWBsIvHUFTES5ZQlmvRyL5AkbMpcICm5m1PiU3RCiDsokGBbXzVxzC9AW4XPqFUOOhCa2/Eb6sEEq
 E+gWOU7ToF4NhDul3jYQGFiUfSb+0LSXJQUPanG9BcnmkORqlPWld1cCumIOIni6oRouBEhx6Pkay
 xwTul6zDhGTffyCg/k+WZ//0ho4t1Jq5dxT9EVkeB1yNRrVdyHSHB0JMqJb9r0SQ+T9R876gxZWAh
 BHmg5BOA==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbf-0000000HLgF-1BjE; Thu, 08 May 2025 05:15:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:30 +0200
Message-ID: <20250508051520.4169795-5-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Consolidate the code to unlock the page in
 f2fs_write_single_data_page
 instead of leaving it to the callers for the AOP_WRITEPAGE_ACTIVATE case.
 Replace AOP_WRITEPAGE_ACTIVATE with a positive return o [...] 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uCtbk-0003cm-UJ
Subject: [f2fs-dev] [PATCH 4/6] f2fs: always unlock the page in
 f2fs_write_single_data_page
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Consolidate the code to unlock the page in f2fs_write_single_data_page
instead of leaving it to the callers for the AOP_WRITEPAGE_ACTIVATE case.
Replace AOP_WRITEPAGE_ACTIVATE with a positive return of 1 as this case
now doesn't match the historic ->writepage special return code that is
on it's way out now that ->writepage has been removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/compress.c | 3 +--
 fs/f2fs/data.c     | 8 +++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e016b0f96313..1e62fdffda07 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1565,8 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 						NULL, NULL, wbc, io_type,
 						compr_blocks, false);
 		if (ret) {
-			if (ret == AOP_WRITEPAGE_ACTIVATE) {
-				folio_unlock(folio);
+			if (ret == 1) {
 				ret = 0;
 			} else if (ret == -EAGAIN) {
 				ret = 0;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 160c7b39d967..8d8018083c31 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2917,9 +2917,9 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	 * file_write_and_wait_range() will see EIO error, which is critical
 	 * to return value of fsync() followed by atomic_write failure to user.
 	 */
-	if (!err)
-		return AOP_WRITEPAGE_ACTIVATE;
 	folio_unlock(folio);
+	if (!err)
+		return 1;
 	return err;
 }
 
@@ -3133,8 +3133,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			ret = f2fs_write_single_data_page(folio,
 					&submitted, &bio, &last_block,
 					wbc, io_type, 0, true);
-			if (ret == AOP_WRITEPAGE_ACTIVATE)
-				folio_unlock(folio);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 result:
 #endif
@@ -3146,7 +3144,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				 * keep nr_to_write, since vfs uses this to
 				 * get # of written pages.
 				 */
-				if (ret == AOP_WRITEPAGE_ACTIVATE) {
+				if (ret == 1) {
 					ret = 0;
 					goto next;
 				} else if (ret == -EAGAIN) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
