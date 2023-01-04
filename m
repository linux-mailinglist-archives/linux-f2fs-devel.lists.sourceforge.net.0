Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A75465DE3E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6f-00046a-AY;
	Wed, 04 Jan 2023 21:15:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6a-00045K-Vm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x25JE3Kc6tv/CRPnK8Jr5HLS2sX0SCmIF/DAVcH2FqE=; b=Xp2AQfr7FaHABeZwDuBt8j9p8m
 pMouKFraGEgjYUGvTtQIlYjbrmFHAmZB8nq5c/t2BvDWJP9zioEm0AEhK6P0ZurwzdrdVtP4w2uPK
 XSRjPyZ60sE+Dn4afKlfSGSgzKEoMHN5jB6VbQ/GPm3PXgfEfGaeAKmSslX634sVHeCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x25JE3Kc6tv/CRPnK8Jr5HLS2sX0SCmIF/DAVcH2FqE=; b=cUXv470W9HK6tjG7mp64e2z3YL
 LXSod8FcGPYEy4TYp8PUmxcaU+8cOAD1UBLfGwHNV8tUbo7y8pA5gQmae3Ht6H3Z4sjxhygWaslu/
 Z9ZuXhdSonqeU1R4S3ktjsT42CAS/ADXcltRve67QmoswSnsRyt0d2Prt+mk0CM3hsic=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6W-00055J-DW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:23 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so2113199pjb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x25JE3Kc6tv/CRPnK8Jr5HLS2sX0SCmIF/DAVcH2FqE=;
 b=GGaN80QXsh4J1YXL+CzIWsFbPtYnvqnUAuR7BlWM5cg7Fb96IUWkf9YKtYSUX4xJiv
 fdrgdThz8UL3P4MZ+eHMu/4K966siuQI6iAdHR2MVQjMjV6MN1GRnO6doH2uk5OhpsZO
 LY78o+yIQS4ow8RQaNkPfGCKMNJtGI3xD9tlc5jEE555TQyh8J94/Gr9HVriMtas67IH
 FB8OUwFz1Oy3rJJOCQeEa/ZHyPHJEdTE5f3SEzIDvxTL2bZ5bnEYjE/0AQom1yTmJR+y
 hcZ12FlAB2hAIMkIDGdKE9vHxFNU1VPWGBB3MfQllfkg7rnUYN+U0mQERs2+5ZkIr7zC
 Wx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x25JE3Kc6tv/CRPnK8Jr5HLS2sX0SCmIF/DAVcH2FqE=;
 b=PZJW2n3BvfNbIDNw2BEsBqfJSf2aYhmr7ZwG6orUXv1luAXhR5nTg1LRW9harbocar
 pfGDam8MCxBNsCBfAtQb0bl4BynxJ+0Up4sGXrwlYmXNqOQqIFy1vIGrYgtdRISKThAA
 QfFKNg6O0eB1u0N2f819Alrh8INVi1lXWrUszLdi6NSlPic003HEvoeMf9jq/ae/XaeI
 ycXo9+TGStV6YabYHKYch24UMRUBLjXsCVvbtGpLlEuftcbrOH9GLniV8Kcd899xRVZQ
 JXCXNfcGVMKFgpZBOyH1XxVSnpGka18KtdNFUKmJnq8FMDiOio9svDs9pkNXqWxskV53
 PfDQ==
X-Gm-Message-State: AFqh2kpNdkNapj/etm9hhJQq1EmEcFJCMu5KJxqD7wgUuaEPjaQa3gf3
 F3P6+csDww130CQmjT/KFLs=
X-Google-Smtp-Source: AMrXdXtcJ2y8j2tl71bGDNWcQ9VdexuFiNN6QmVTJEdgM9Lahf3FnPeatjjBv8JIR91dEL59PwjIKg==
X-Received: by 2002:a17:90a:930f:b0:225:be98:f5b5 with SMTP id
 p15-20020a17090a930f00b00225be98f5b5mr45592480pjo.23.1672866914778; 
 Wed, 04 Jan 2023 13:15:14 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:14 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:38 -0800
Message-Id: <20230104211448.4804-14-vishal.moola@gmail.com>
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
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_range_tag().
 Signed-off-by:
 Vishal Moola (Oracle) Acked-by: Chao Yu --- fs/f2fs/node.c | 17
 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6W-00055J-DW
Subject: [f2fs-dev] [PATCH v5 13/23] f2fs: Convert f2fs_sync_node_pages() to
 use filemap_get_folios_tag()
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

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1c5dc7a3207e..51e9f286f53a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1938,23 +1938,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				bool do_balance, enum iostat_type io_type)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int step = 0;
 	int nwritten = 0;
 	int ret = 0;
-	int nr_pages, done = 0;
+	int nr_folios, done = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 next_step:
 	index = 0;
 
-	while (!done && (nr_pages = pagevec_lookup_tag(&pvec,
-			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
+	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
+				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+				&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 			bool submitted = false;
 
 			/* give a priority to WB_SYNC threads */
@@ -2029,7 +2030,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (--wbc->nr_to_write == 0)
 				break;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (wbc->nr_to_write == 0) {
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
