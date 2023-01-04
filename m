Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D965DE43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6k-0002RK-Nv;
	Wed, 04 Jan 2023 21:15:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6j-0002Qt-NK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zdjIiLbt6NZs/+ugsh8p0DToyI6+NA6EFXmKyQS/uaI=; b=g7RfBo5pBWqJ0PtMh6V/+28wZs
 KtELCPuoBDsxuFu1smxFLOED6T6vRj4Jm9w3+yM31dvb2V//Lz8ULSQeH6Lq8pZgjFghjLfd8relY
 x8inliILC6/ZQkPeK3oMj8y/pE06vObCLyfieaiJBSU2kz9Gtod5MRbP2XZFf88PbRAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zdjIiLbt6NZs/+ugsh8p0DToyI6+NA6EFXmKyQS/uaI=; b=hylVxzp/JjRdcAOJsF59QZ2rgY
 dOrn4ECTRGm+G+cnZBYu7vSfMxkQIXRNMczRE8qzGsjZetDWc5wavEX07Lv9h/rdpDNAZMTCFTuOA
 VmqV0Y/5oBYJOYiEiyGJDJJEG7JXPTgNhaRyuz9JuSwIr5uqN3JiDqHEDmGaZ+x/WBRM=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6h-0050yn-Tk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:33 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso40284786pjt.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdjIiLbt6NZs/+ugsh8p0DToyI6+NA6EFXmKyQS/uaI=;
 b=glpIa7fah0tr/iN8VTblVZOLKx6udw1Y6CMH9y932LtgL0yAdBTRzwDIj0zvhgD39Q
 E1sL9pDcu27gNo9eBb2VjNhIMTDlKXVfRv6jhGeAPXWY0rUHIfhMoFfE3XhufWQTIbMH
 E2KvefozTkDS3/Hp893OF3S49VHllnT3CB69+mEDG9UtLBa4m/skO7yUjlUTWoasN5ZG
 NU+lE/pxu55tM0OK9vSbnCVSEU358m3zsG6W/CVnAseJloUEUnw/6cEJcYNAvsfouAqL
 w9cFz18Y11YtSUOFogC9JICjRGGamrfqBabqoubTBObtLZcvFhc86wyCAt/PfmLLGeYC
 HJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdjIiLbt6NZs/+ugsh8p0DToyI6+NA6EFXmKyQS/uaI=;
 b=GPxnqBnhmXGbAkIyxs4o2EHImidN1OGDjFK+xVrNEXEBPx3cBR4P9t9TQmd24szzju
 KL5Z4uCnTKhkXuA+TZj9nJpeLSECUq8u5eaSP9h+ebzlU5U4E0Yp87LF0YFzjgwzKve8
 X3dUYqYRSN/YU9ntgcYp6UHSIUpNFBirpifrq29ZrMg9C8sum4Ob0xVMQwQLorICdNpe
 1KAmBjVHB+TnCbGGETSieKLaaTLoK/lH2Vnn8rsuY/RCb/0dKdA8jAw4PpZ+4922AWSX
 CGYIq7rXskHpJTLJUWZLcEigz5Qd6UzABcXVivd1mwkBVuI7IvCm/39vBHg6rb/Y1Id/
 Cynw==
X-Gm-Message-State: AFqh2koEzUlybeMKrN3tmr6J9gEXeJFS0FyzDnvPWJ7zV79o8SQg8T7Y
 fLSKVGU3PfSOoOXJwMolxsoPHYdVeEtWNg==
X-Google-Smtp-Source: AMrXdXueuis6NhJlGTgG2VFmI91e7ab5OxbM/PwA6uv8A4+49g3wkiIGZ6yZWeV3aNkAfE4Gmx5MoQ==
X-Received: by 2002:a17:90a:4ca7:b0:226:317f:f832 with SMTP id
 k36-20020a17090a4ca700b00226317ff832mr21893775pjh.39.1672866926361; 
 Wed, 04 Jan 2023 13:15:26 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:26 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:46 -0800
Message-Id: <20230104211448.4804-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). This change removes 8 calls
 to compound_head(). Signed-off-by: Vishal Moola (Oracle) Acked-by: Ryusuke
 Konishi --- fs/nilfs2/page.c | 39 ++++++++++++++++++++ 1 file changed, 20
 insertions(+), 19 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6h-0050yn-Tk
Subject: [f2fs-dev] [PATCH v5 21/23] nilfs2: Convert
 nilfs_copy_dirty_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag(). This change removes 8 calls
to compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/page.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index 39b7eea2642a..d921542a9593 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -240,42 +240,43 @@ static void nilfs_copy_page(struct page *dst, struct page *src, int copy_dirty)
 int nilfs_copy_dirty_pages(struct address_space *dmap,
 			   struct address_space *smap)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	unsigned int i;
 	pgoff_t index = 0;
 	int err = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 repeat:
-	if (!pagevec_lookup_tag(&pvec, smap, &index, PAGECACHE_TAG_DIRTY))
+	if (!filemap_get_folios_tag(smap, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch))
 		return 0;
 
-	for (i = 0; i < pagevec_count(&pvec); i++) {
-		struct page *page = pvec.pages[i], *dpage;
+	for (i = 0; i < folio_batch_count(&fbatch); i++) {
+		struct folio *folio = fbatch.folios[i], *dfolio;
 
-		lock_page(page);
-		if (unlikely(!PageDirty(page)))
-			NILFS_PAGE_BUG(page, "inconsistent dirty state");
+		folio_lock(folio);
+		if (unlikely(!folio_test_dirty(folio)))
+			NILFS_PAGE_BUG(&folio->page, "inconsistent dirty state");
 
-		dpage = grab_cache_page(dmap, page->index);
-		if (unlikely(!dpage)) {
+		dfolio = filemap_grab_folio(dmap, folio->index);
+		if (unlikely(!dfolio)) {
 			/* No empty page is added to the page cache */
 			err = -ENOMEM;
-			unlock_page(page);
+			folio_unlock(folio);
 			break;
 		}
-		if (unlikely(!page_has_buffers(page)))
-			NILFS_PAGE_BUG(page,
+		if (unlikely(!folio_buffers(folio)))
+			NILFS_PAGE_BUG(&folio->page,
 				       "found empty page in dat page cache");
 
-		nilfs_copy_page(dpage, page, 1);
-		__set_page_dirty_nobuffers(dpage);
+		nilfs_copy_page(&dfolio->page, &folio->page, 1);
+		filemap_dirty_folio(folio_mapping(dfolio), dfolio);
 
-		unlock_page(dpage);
-		put_page(dpage);
-		unlock_page(page);
+		folio_unlock(dfolio);
+		folio_put(dfolio);
+		folio_unlock(folio);
 	}
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	cond_resched();
 
 	if (likely(!err))
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
