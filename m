Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E55AA1F9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 00:02:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTsH3-0000Mf-Jx;
	Thu, 01 Sep 2022 22:02:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oTsGz-0000Lz-Ac
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3W8eVECYUWOXPq8AmB0uwIDBTXoxHTg96669VXu7Qys=; b=HdzAXZi4R2ypoyI7lte1RTI90c
 zS2btyvVX4whgMngTOtPbXB+scDQzPUkMONM9yGP3ZUynfQun2ieA1yQ0nVdw6BKFSR4L88SFnbL5
 oC1qeD6tgz3S8/AokfvZOxo9b8OMm24mZqMjXgZ2lohVeRzbKYGJTGFmJg0tot+SCShA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3W8eVECYUWOXPq8AmB0uwIDBTXoxHTg96669VXu7Qys=; b=dbcLv2MxyccGdMykCnfOhIG5dv
 mflCAGCS6X9MJURu/0SZ0ga7MRZ2JbMoGb/h+aiWiWTe8ItS4nY9QRqOCVBRdh0p/ZTKRbxxpdiW7
 5ME7LzJuFtTLWwRKkkQXiZBABnOjjBY5g0kE89xf4ns6ZOp/L0Z6v1UsCkra3xZCrWeI=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oTsGu-0007vH-SR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:52 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso3743284pjd.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Sep 2022 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3W8eVECYUWOXPq8AmB0uwIDBTXoxHTg96669VXu7Qys=;
 b=T7nuCbAZMiTAbV5HIjQpWH+eZ9bQTc6PCgtrgl1hET8edirsolRjeqzxxDLlpylo6O
 o4mNGjl/sRdPAL9cyBLo7pPSX2/e8rdulZr4fxc4F/cQ5AhRiqY99FCf8SxmFrrEWzLG
 GwmBlyr64nECHNcSvLGGDgU9jwM9uICGm9ENuaBnbkPPhW9pSHYWvTqQUY01jHfEu8iA
 8qTU4vBK0tC6E/aFkaadbV0SSS1NROThuuOvdZR7ns9gnx2zbMOLC86SVrchIF9MO4NL
 JVoqN7FZ2hPAYogb7KAItYOxx1SfAaxkg+Ce70dXU0IvySIkg7JupZsJgatOwfXFf7eS
 c2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3W8eVECYUWOXPq8AmB0uwIDBTXoxHTg96669VXu7Qys=;
 b=v5QIN0kq0Knboc0NTeReDaXXsM4td0oW1ehbshU2BAbPuaZqBz4CO/yAWrSvITtRxa
 9gv/vsCeNVWOpphuWjSwcKQ09KXQBt3h73z+A1OxACAROMInve2BSSqRrX08gMFs3jdh
 a5OBXg8UqH83qtZH6cXXN4rsAo3nTKwICwzsPnYCuKx/uxtcQcIpzVFN/Fjw1JltWRCn
 nqxbL6xXSkyDxlNF+/Rec+m1VRm+qUkJdnI5gRy3h75P2c6ud1m51Vr7HTc/QvDfT10f
 s3fK9StElB83f4YHctrCdfSq3sIgxnRVX5vzxOLyd2mqNBz8bv5SttlQLJQxzVOpMdwz
 fhCw==
X-Gm-Message-State: ACgBeo1c7HZFp0wo+vO73jFJ3qyac4BM2Hs3bePntCXnoACEYIPNKcHr
 85MRH6SOUcIZ4M/ADuDUZG4=
X-Google-Smtp-Source: AA6agR4+8BUAX2YkjXUvTou/rR9ObQ1uX2z42w4hYTYm88BqrnOHPc03kR7a6JZ8cWUAEetKKB6rvA==
X-Received: by 2002:a17:902:ecd2:b0:16e:d87f:d19e with SMTP id
 a18-20020a170902ecd200b0016ed87fd19emr32807669plh.75.1662069763246; 
 Thu, 01 Sep 2022 15:02:43 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:42 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:21 -0700
Message-Id: <20220901220138.182896-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901220138.182896-1-vishal.moola@gmail.com>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Converted function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) --- fs/btrfs/extent_io.c | 19 ++++++++++--------- 1 file changed,
 10 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oTsGu-0007vH-SR
Subject: [f2fs-dev] [PATCH 06/23] btrfs: Convert btree_write_cache_pages()
 to use filemap_get_folio_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/btrfs/extent_io.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index cf4f19e80e2f..d1fa072bfdd0 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4844,14 +4844,14 @@ int btree_write_cache_pages(struct address_space *mapping,
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
@@ -4874,14 +4874,15 @@ int btree_write_cache_pages(struct address_space *mapping,
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
@@ -4896,7 +4897,7 @@ int btree_write_cache_pages(struct address_space *mapping,
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
