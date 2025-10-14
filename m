Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BABD7CC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 09:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxwfDZ2a/81F7tNMBnuezuQaiG9crJ3Tz4cKYSkTV9s=; b=lCsgCyiB4EztXZk2YzFNzb8Nqj
	7U9AiSqzTLrB/9nno1OtCzQNwmUzImp0dX89SRmMNqg7FCVbQMP6AmqUOXzntIkWMp25bA6OivkdL
	WOeYJeEeVJXCVQN5i/4mgO2beuNTWRVRrGRRd5MD+zSh8H2MnJXxHvkl0ddMutVFpKEM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8Z51-0002St-G5;
	Tue, 14 Oct 2025 07:04:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8Z4z-0002Sk-Rp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 07:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wpjg2r0o9d17ItoUaZfHIoClm9Q8U9Rp5jp6gN+86JQ=; b=OVGhXF/yCGyGHMlxkB3D8CjjJL
 vFdDZZyJM8x3gXZgolZCdSdIeGXxVSHHjiGjx8uvb18JAURduGte1PEk9grhc53ijJ832Z98/dvWi
 OryEN1g9prMZoPeQTTSHhFl3yVab4WXlLbgD7MK9tqJvre4u5BPN0N6WhXuj6YGE73oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wpjg2r0o9d17ItoUaZfHIoClm9Q8U9Rp5jp6gN+86JQ=; b=EWfc5ROOLbB9fe6yPxp2dDQGpe
 zPPdLPKDItEY+I7qPETJyg/Ae1lEWte22KIprzuJm+ByyRccbzh532zyPwVC5QfOrnken0a9tzlyf
 xCw6aLt24ciqPnBv3xXhwxDVBxO8WRHRk5PR0pUUq6GjKoztCAkWQo0A5KooyJi5C0Yk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8Z4z-0004ma-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 07:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E643621C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 06:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297DEC4CEF9;
 Tue, 14 Oct 2025 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760423231;
 bh=mhmcwvYdTGSyFXiE7H2iuIIiTE95XA+Y91wY01ZQRvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=soXLsB1tl41Hle0k9/FSjI9UiCsWF3ZNjDb9GgRidAGq/eGChNysISzzcXy3kIvvt
 ewsAoF8UsEqlfb0Cv5bF5wRgkRJPYc+HpEbsMQIqlna8r7unae48Z5x3L4co20Zs18
 GzJ5qAhNJNVJ8H/1jJQMpQ4MTT1oZRN4GHrULyV6XW4DHyZJPrrlP6shAWo1wwmRzM
 S1Ge3ui8POkL0Uw1OGKXy/YMHX8WRsgl0gOIalqkFMjXYujjJDAmR0HKSQ+UYc67yR
 cGpCf+b1YjYqxac3dIG+PRe4fWCEBvvQcQFo2nsD0qpyYa/MKE6W5YqBhpJHiLvKgL
 XwFOgTQikNsgQ==
To: jaegeuk@kernel.org
Date: Tue, 14 Oct 2025 14:27:02 +0800
Message-ID: <20251014062704.1734984-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
In-Reply-To: <20251014062704.1734984-1-chao@kernel.org>
References: <20251014062704.1734984-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/data.c | 7 +++---- 1 file changed, 3 insertions(+), 4 deletions(-)
 diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c index 50538c26c1a1..0279340336be
 100644 --- a/fs/f2fs/data.c +++ b/fs/f2fs/data.c @@ -775,7 +775,7 @@ static
 void del_bio_entry(struct bio_entry *be) } 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8Z4z-0004ma-Ek
Subject: [f2fs-dev] [PATCH 2/4] f2fs: convert add_ipu_page() to use folio
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 50538c26c1a1..0279340336be 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -775,7 +775,7 @@ static void del_bio_entry(struct bio_entry *be)
 }
 
 static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
-							struct page *page)
+							struct folio *folio)
 {
 	struct folio *fio_folio = fio->folio;
 	struct f2fs_sb_info *sbi = fio->sbi;
@@ -801,8 +801,7 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 			if (f2fs_crypt_mergeable_bio(*bio,
 					fio_folio->mapping->host,
 					fio_folio->index, fio) &&
-			    bio_add_page(*bio, page, PAGE_SIZE, 0) ==
-					PAGE_SIZE) {
+			    bio_add_folio(*bio, folio, folio_size(folio), 0)) {
 				ret = 0;
 				break;
 			}
@@ -905,7 +904,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 		add_bio_entry(fio->sbi, bio, data_folio, fio->temp);
 	} else {
-		if (add_ipu_page(fio, &bio, &data_folio->page))
+		if (add_ipu_page(fio, &bio, data_folio))
 			goto alloc_new;
 	}
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
