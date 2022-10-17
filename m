Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C2601980
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfi-0007ZC-N7;
	Mon, 17 Oct 2022 20:25:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfb-0007YW-Ha
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OszXCtyBAOhtTfNS2VcED/PJCoIEbwhBnrXkCjtJV6A=; b=CpC05YJuYBJLXHL4uU3A1Ez9nn
 F9GoKCHz3dYRD/LBG0ZEIHsFUrVQ46q14DoQlvmJOgflJ3dS5zwfJLv/Q5RQSfJMOWvO2vUQk3jEO
 l+v2egwb74zzoSmAcN7ZfLK3bOhKWeXpdE5yA4q3vYYPmfA7LOWnLftLIDcTjuPjiHsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OszXCtyBAOhtTfNS2VcED/PJCoIEbwhBnrXkCjtJV6A=; b=Ia1rK3y19Mp1eOWGAOUBgV5h3y
 Td2mxtIg2V8zfx76npZ80m8UwU+/hGRMvNzmJ1MnnVc3JAYxUhNAGyBQMI41ZgkEStW+ma3YxHMyt
 /UNfVMHWmgRXxYeUekBQWd29uoTsbtn+F+B90QE76p2lVnGP5/BsBhxFBU8gmnB1TVIc=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfZ-007Li9-Tn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:07 +0000
Received: by mail-pl1-f172.google.com with SMTP id d24so11821721pls.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OszXCtyBAOhtTfNS2VcED/PJCoIEbwhBnrXkCjtJV6A=;
 b=DlogKpHGuzxO+jQRFtRTRFNBhcjjfosVdGfz4vShoT5jbOvLmiulTdcKtHEFGwz5vi
 lfN8CyIsdDsnzLwlPsrwSNu7A69s5Fy0qqRQj2nA9AGm0yWGFBOpq6+hyWMx+nCdiEOf
 HOWv03XJMaxBzb3v/k5D8Tkgw8Rsjf1L9diV61pFglGBB5j0nFSq0gT1h245hSzueZGw
 Np3EM/UvXHrfuYbzgwORQStqJotyQYc3vhFcPkD+Oz9PUmc3lvU5n0m6WUynYqD8tTw7
 UZB5z88hHxb4eP2oFj6wehPTurmZRyd9zSlH8SoJqpqYDPStY4oaZoe1q3QYLoKSuu0H
 QHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OszXCtyBAOhtTfNS2VcED/PJCoIEbwhBnrXkCjtJV6A=;
 b=oFZeDb3MLy+2HZNAQHSg8V6BxJpIHF74T03vQiX2A6HlDD8/OjVCsJMgVoDlbbh6YI
 GQTtqjXNkuVkLX82SyiB1KHGlvLfFVTGDrm3U+9XMntLgNrHe/XMiNDYQnXHOd5ZZugo
 iJvsiAhrKR5Q4/3SOvf8VP78Dqxa/7i2Be+6jxRg5idRnuNbTUU5mRmeaVB3167V2xzs
 Sk77r6XfQXCslJYBo6Yv8D9ODNdpIaxDA4gIojvfWssa5N+Rq04M+I+GcQxE8khvoTT6
 r7csSeh/yXAwtOnWraQ3KuXuQU1GlUr6Hd+N0KE59t90xWVe9rdbWN7XyG4lM12M6/xM
 Kjdg==
X-Gm-Message-State: ACrzQf2iEk39OsI6t2n8fLRMr+wDofRZooD/DROMb8mt9Tfk6IYK8huk
 wBdJZe/Rvxc7iIcPAsAvxI8=
X-Google-Smtp-Source: AMsMyM5dOMLXhO4r9Hp/ovS4Nq60959rICPP1Z87znhDFezbM2jNPwSutoEbYZoR6vJvgAlXfg9V6w==
X-Received: by 2002:a17:90b:3847:b0:20d:c41f:de7a with SMTP id
 nl7-20020a17090b384700b0020dc41fde7amr18478400pjb.85.1666038300344; 
 Mon, 17 Oct 2022 13:25:00 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:00 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:34 -0700
Message-Id: <20221017202451.4951-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Converted function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: David Sterba --- fs/btrfs/extent_io.c | 19
 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
X-Headers-End: 1okWfZ-007Li9-Tn
Subject: [f2fs-dev] [PATCH v3 06/23] btrfs: Convert
 btree_write_cache_pages() to use filemap_get_folio_tag()
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, David Sterba <dsterba@suse.com>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/extent_io.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 4dcf22e051ff..9ae75db4d55e 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2960,14 +2960,14 @@ int btree_write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0;
 	int nr_to_write_done = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	int scanned = 0;
 	xa_mark_t tag;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* Start from prev offset */
 		end = -1;
@@ -2990,14 +2990,15 @@ int btree_write_cache_pages(struct address_space *mapping,
 	if (wbc->sync_mode == WB_SYNC_ALL)
 		tag_pages_for_writeback(mapping, index, end);
 	while (!done && !nr_to_write_done && (index <= end) &&
-	       (nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-			tag))) {
+	       (nr_folios = filemap_get_folios_tag(mapping, &index, end,
+					    tag, &fbatch))) {
 		unsigned i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			ret = submit_eb_page(page, wbc, &epd, &eb_context);
+			ret = submit_eb_page(&folio->page, wbc, &epd,
+					&eb_context);
 			if (ret == 0)
 				continue;
 			if (ret < 0) {
@@ -3012,7 +3013,7 @@ int btree_write_cache_pages(struct address_space *mapping,
 			 */
 			nr_to_write_done = wbc->nr_to_write <= 0;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	if (!scanned && !done) {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
