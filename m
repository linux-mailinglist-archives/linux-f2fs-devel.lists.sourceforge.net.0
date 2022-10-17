Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF935601989
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfk-0002bS-NH;
	Mon, 17 Oct 2022 20:25:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfh-0002aB-Fy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6ErMtYFOLSC+XFSDnhR16+VnHSa+A9yG2wppqURV6g=; b=mECJOj3Rimkf02YdBVmSIx4Sxo
 fVr7KLSGbt+7kz0IK0DfiJ+owB2bD7xJ7HZDN3pe5x0IoOlCGUBL5VfKFjLrxBqb2emD245NgLnmk
 KOERWs9IEhK9psNsvXWZdRTHgYtusIw3QdzmNAm0tj0FdjPK6VUx7FnMTMhus+M2VGPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m6ErMtYFOLSC+XFSDnhR16+VnHSa+A9yG2wppqURV6g=; b=BMvXCaYsY7Ga4L+34G3BsqFHvw
 DEWdtnggpd8mUIxnoMwI7l0TeA94lOqYk3f9Gl3fC31TaNMTbMCmCsZOJCJ9E/9ZIcZDBThHa0bar
 ywjpmYoJpEQ2YmsUuXMwj9opqeQ2fdH3s4HP06QwD8yDFGDq5/lncBlsIzccYDTq34sU=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWff-0008SE-7F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:13 +0000
Received: by mail-pg1-f175.google.com with SMTP id q9so11439051pgq.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6ErMtYFOLSC+XFSDnhR16+VnHSa+A9yG2wppqURV6g=;
 b=cCPZ3LZeIepzgHQo38JmLKd16CRdo+2iAtbuM0GeXbYUQtLEwsFysyya7MYzHjocpg
 9H9ib+VuWdRu2d7bK5i8paQZGdzHkJ1SWJG7Dh0Ca6BqZhTE4s9Bd6e7ntf4YGC91R/h
 UgFC41Q0Q/xhD+8z+10ge1J4agN3xgWHAKXVd63knIgAcRcmNhj/iSTo20LpGHMF/9aA
 NbK4DCkGcpGDuZtGOnbGMumQl6ROrfsEwEfIgs8chmDRZdYYwSRrxiDodPpn4T5dlrkt
 VNzn2lVkELDr1gtJA0x7iwQCGF5ya7VDbUQisTDDlMqMXif/Z3VL8W7KPwnE+fu1FxM7
 QosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6ErMtYFOLSC+XFSDnhR16+VnHSa+A9yG2wppqURV6g=;
 b=kZGc0WPSy8krfM3nPdFbZ7YwTX9abQOohCPKdGgFopT8jgqwFJUAGrky76rYUFsydx
 jQDDjWz+KHZJk4JXU7PCE7WFalNUT4RdMOYChu+eBGhwZXY3x54d4vc+MJbojD7sbaNT
 t3uN15SF4kBZJIlBEzwMCEWEDSnH5+DNldQ1zeRJzsFQ67ZVUpPKItjY6ScLa7lYdVzc
 oqobLObOynq2FCJYK+Kt9754Knq3y7a9JeCJWihfaPjYQAvUJYWsTVSq2QklrcvhXXuP
 CIJl0B6cnND34Si9nUfWYQIA8cJElqAoyOBrx1aCID/EsuG36Ha64+CWGOEtfzqXiTkJ
 womQ==
X-Gm-Message-State: ACrzQf3KM6bYvVUuOflYGss88v6I91120u2XJXxGJhBdrDhyAZsbiZNn
 GseFaq7NyTThqUNY9iZSUetgEDwTH1z+Xw==
X-Google-Smtp-Source: AMsMyM5dwvFL/LmsuIkwQu3OP5WD+EqvGKYBix16mvgoTXBrNYZig7nSszRgeBhz/RAGO3jgcp6Nrg==
X-Received: by 2002:a65:674e:0:b0:43c:3b91:236e with SMTP id
 c14-20020a65674e000000b0043c3b91236emr12225402pgu.510.1666038306213; 
 Mon, 17 Oct 2022 13:25:06 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:05 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:40 -0700
Message-Id: <20221017202451.4951-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_tag(). Signed-off-by:
 Vishal Moola (Oracle) --- fs/f2fs/node.c | 17 +++++++++-------- 1 file changed,
 9 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1okWff-0008SE-7F
Subject: [f2fs-dev] [PATCH v3 12/23] f2fs: Convert f2fs_flush_inline_data()
 to use filemap_get_folios_tag()
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
preparation for the removal of find_get_pages_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e8b72336c096..a2f477cc48c7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1887,17 +1887,18 @@ static bool flush_dirty_inode(struct page *page)
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 {
 	pgoff_t index = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	int nr_folios;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec,
-			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 
 			if (!IS_DNODE(page))
 				continue;
@@ -1924,7 +1925,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 			}
 			unlock_page(page);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
