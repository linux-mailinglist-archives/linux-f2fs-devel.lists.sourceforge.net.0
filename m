Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED61F5AA202
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 00:03:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTsHA-0000Uw-Kk;
	Thu, 01 Sep 2022 22:03:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oTsH9-0000Uh-Ij
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cO8ljolH2h2y0oWNA4Z7VoneqopIkQJQEMsP9EWX9UE=; b=HrEn16s6PKV+nRVv+w/Uq/gyKd
 YoN3d9akT/EH8STheI4Ul0W6jLh1mXp9mZxs22CYKzj4XOq90glnw7BYYOs3QKfoqHQMNXVlUuQAp
 1kHCsyFDI1dKOsScHWlHbfRcHCM3k4tw5ivfvp7f/Xk3c+V0p3f02uN/uw+knlyenAnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cO8ljolH2h2y0oWNA4Z7VoneqopIkQJQEMsP9EWX9UE=; b=C7UVA2Bbd6tY9YJhXbWIOgWPXK
 kYm4X6zIKDw1n5JEM3d7Vyb80z60h1g6E6U4cN6pqJqhWlaLVraVWRR7J/jdaAdVMFADARBaQTant
 KmHqyPeBg1v8i6Y3HR4EPG+UtS+OolC1wBaCu6wKqtCGV1SiCzxtrfiindluEF7tvZZ4=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oTsH7-0007wj-S7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:03:03 +0000
Received: by mail-pf1-f182.google.com with SMTP id c66so96006pfc.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Sep 2022 15:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cO8ljolH2h2y0oWNA4Z7VoneqopIkQJQEMsP9EWX9UE=;
 b=kKpyoHXEn14IP8WZWJwoknMWz/3cEOj2DtppI4cG+XUgdh8Tj1+NKWa1adqBtYfRyk
 VHPG5rdhWAQ4al3AZaUyV4gt0By/gJ2McMkw6RSp3WXMbGoQm4Z42P2OF7rEI5+v8UFy
 T83xOcnBL+8y53/G5LsCfiBNZVkJ59jiyGCBVGzvkjfyRBt3dlDX+e3T3Jb65ECCpxvk
 de50C1kCfFbev8CHBRr9SMR2MV04+yZrNWPkJ78ejHguj8T8ZvuRGaGrPi165Wp2Alcd
 WVUEC3AobWtJj3jqC/3Bd7A785/43KHGySAeLICCAztfaQ+xJ9RiweF5yex+rajvvdOC
 /ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cO8ljolH2h2y0oWNA4Z7VoneqopIkQJQEMsP9EWX9UE=;
 b=aU0q1pMPMmMQeoJDqEq09OTaO+GMCNfqWU/mKvUkw2g37+YTXCjxkf8sR2wPcFU2zb
 S2Tl1hgUKy8gi4nB7iXFX1P6kxYkxqFezAVhi2y9vpkMucTV6+bHyhKj027gB6opjU4g
 I99B1Onq319TvWCHEKlboOKjLTXYpkWvNgXQL4ZiVfAcFfKqmN3lRd9hQkG3DqRzlRMo
 cSgGt4DbUqJeqfk0bim5OnX2kI/rPsqDdtZdKzOENxpWCb1nqA5WcKw6ahzUN/T5a+8t
 K1/aWmBvKwTHqg560m/4W9tENlOyGkRXqWoAqvHtm++Ku6GOTbmROCtXiV9phiPA/h0z
 4Aiw==
X-Gm-Message-State: ACgBeo2x+9YFuzNAuDE3ax4968l3v4CPDAz4CSc3pPK3edxlFXocZhFO
 EpntZ1DyuuCZzWr6WzrKt/0=
X-Google-Smtp-Source: AA6agR5hXhjZN5uBNUEvEE06143lBtKSeWoPuJQC/ApxWtxLERe0a7EzkbibHXQL+mnSnNH8xT9rzg==
X-Received: by 2002:a62:1c81:0:b0:52f:ccb5:9de1 with SMTP id
 c123-20020a621c81000000b0052fccb59de1mr33199922pfc.45.1662069776277; 
 Thu, 01 Sep 2022 15:02:56 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:55 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:30 -0700
Message-Id: <20220901220138.182896-16-vishal.moola@gmail.com>
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
 Content preview: Convert to use folios. This is in preparation for the removal
 of find_get_pages_range_tag(). Signed-off-by: Vishal Moola (Oracle) ---
 fs/f2fs/node.c
 | 19 ++++++++++--------- 1 file changed, 10 insertions(+), 9 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oTsH7-0007wj-S7
Subject: [f2fs-dev] [PATCH 15/23] f2fs: Convert last_fsync_dnode() to use
 filemap_get_folios_tag()
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

Convert to use folios. This is in preparation for the removal of
find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cf8665f04c0d..b993be76013e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1513,23 +1513,24 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct page *last_page = NULL;
-	int nr_pages;
+	int nr_folios;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	index = 0;
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
-				PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 
 			if (unlikely(f2fs_cp_error(sbi))) {
 				f2fs_put_page(last_page, 0);
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				return ERR_PTR(-EIO);
 			}
 
@@ -1560,7 +1561,7 @@ static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 			last_page = page;
 			unlock_page(page);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	return last_page;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
