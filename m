Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D665E95074E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHt-0008Fu-Ls;
	Tue, 13 Aug 2024 14:14:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHs-0008Fi-4G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GALEBg6QTn4diRzzk+xHggmwIgCVRve5iXWh4Fx33uw=; b=EdGQ6jPNUNd2JcPgpa6BbrOsuc
 JqcRzR4AX62L+lGnfbRI6diK/l42jPOQAsESTknBv/lb/l2vweiU7YRN3YvIw4DcOm9K8UIaIN/N/
 NbtSRy5wnuhi/vgnFFnVwIWPW+/zHwZxaX69r7Mos9sXlekIjASndvEd2ESiZ+KZGxWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GALEBg6QTn4diRzzk+xHggmwIgCVRve5iXWh4Fx33uw=; b=dzAsBSBcWzkcPbFHqmaWyaAE5R
 VEo0hxhZDDBK4gdrkPsrmA9lml+c/g0Zyp2BUN4yDSiul4txPe5nGHbcVT/zXwT2P2AmAe49mkfam
 0jauomjXmy2hUGA9ekJyXsUSGHXwZedjc5A8cUEVwHPfHdpncXN7crM9v90ZT0zPtLE4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHq-0001Di-SV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 776B96172F;
 Tue, 13 Aug 2024 14:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF9DC4AF11;
 Tue, 13 Aug 2024 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558440;
 bh=+Rahtg2CIbqQVDwx0J+IxStkz1u33ze7GCP87Z5bhDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=azkwPqRfL6kB75jA+pqe+ygYJJV/FrIXp79ryh2MjDe6l9aF+7/8bbWxzpTHMQFm2
 7RFyhMAzw2BHCVZNj78tyeVGZzzP5CGKx+QXsLuZAsOOPOcJQgomYIqhqkxHa3zFKo
 w2me4nsj27Tbom/J9J16Tom96uQagm2Avj1KsxT9wuHZWSwemdPkgZ59l+KbGcS8JW
 SqYW/r+LmwSIDyj5a77se9l2UghPwZcqqOI45l6HXB1JR+rL1l/LXSaImKvPFX0FfE
 5dEDxiTJOI8g2hJYucr/KDKj4P1lMR1p3U8wAQrshzW4t259xs4wkVxyk5xEIXLO1P
 ZRuY/bcCD+bjQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:31 +0800
Message-Id: <20240813141331.417067-9-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/checkpoint.c | 2 +- fs/f2fs/f2fs.h | 6 ++++-- fs/f2fs/node.c
 | 2 +- 3 files changed, 6 insertions(+), 4 de [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHq-0001Di-SV
Subject: [f2fs-dev] [PATCH 9/9] f2fs: convert f2fs_handle_page_eio() to use
 folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 2 +-
 fs/f2fs/f2fs.h       | 6 ++++--
 fs/f2fs/node.c       | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index ffaf295a198a..7f76460b721f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -99,7 +99,7 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 	}
 
 	if (unlikely(!PageUptodate(page))) {
-		f2fs_handle_page_eio(sbi, page->index, META);
+		f2fs_handle_page_eio(sbi, page_folio(page), META);
 		f2fs_put_page(page, 1);
 		return ERR_PTR(-EIO);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c29ed8b6eea6..28b6246e07f9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4666,9 +4666,11 @@ static inline void f2fs_io_schedule_timeout(long timeout)
 	io_schedule_timeout(timeout);
 }
 
-static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
-					enum page_type type)
+static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
+				struct folio *folio, enum page_type type)
 {
+	pgoff_t ofs = folio->index;
+
 	if (unlikely(f2fs_cp_error(sbi)))
 		return;
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2b764c86aacc..7beaa3690e03 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1492,7 +1492,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 out_put_err:
 	/* ENOENT comes from read_node_page which is not an error. */
 	if (err != -ENOENT)
-		f2fs_handle_page_eio(sbi, page->index, NODE);
+		f2fs_handle_page_eio(sbi, page_folio(page), NODE);
 	f2fs_put_page(page, 1);
 	return ERR_PTR(err);
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
