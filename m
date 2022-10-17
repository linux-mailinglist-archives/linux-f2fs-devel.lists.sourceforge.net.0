Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB55601998
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfs-0002eD-QR;
	Mon, 17 Oct 2022 20:25:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfr-0002dw-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vEJiD15A68fC6SKwYs5XNRqfHJAp+vmoTIHZ0Wq7X1E=; b=dVnRxyAcMLaUy+636kugVoqCuw
 s+f1GePxsqyooCMnc1LVPtK8M2zgdVJxzEnWK10NaRl1+K9+lvHvLFqND+ypLIq3VS00pJ0zLyIvS
 I4CRzgG3Jo12OgBGgY37Kz1pqX7fAhETgiqM0bZLTNjB/02BEHtcD/Jc7JHKkPNfBLTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vEJiD15A68fC6SKwYs5XNRqfHJAp+vmoTIHZ0Wq7X1E=; b=RnH1/phCNfGpcH0s9xF7OYkCNK
 QNMEta9QzsfVZU9M2AlyGoPBWCOXIukzmIAy4Kx4ekrIMzvXDOoHplpu1t9zdiQxkMJfr0XQgiFM0
 xQUMUFp7Y592q02KDgKlxC3gi9NZDiV58qXTfIzxxJUAHC2yEPv4qHQ2hKG4vu3liHt8=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfp-0008Sx-Ij for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:23 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so15372887pjs.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEJiD15A68fC6SKwYs5XNRqfHJAp+vmoTIHZ0Wq7X1E=;
 b=HuFrfcPO7PV53ayIMggGbnfzpHoeRQFhEFVQOHPc6PzciA7uBE16kgNsOTzTc1N9dJ
 2hSJwfj31GhqB57Dr9/JR3txjsKxYKd0DISzk5VV/d3E3Vvva9/OdBLRndwoGjHrDXuK
 3qY8DRPEAXcVMt/sdZ/bgfMCfvzda7cDqa8pI+Md0v4rCay9b1P1aDFJ+wuv/xkwhjDh
 0KtsJUtybAp1KLL3S4A3UmyZmXQ8CTdDX6Bkp+k+AXUIgWAtr3eIZaG4Vz97JDWv8G7t
 DfxB/Jkfg4jPAEaUIknmd3fhww6CnCHqRF/goZ5vhsIyCSXiY5Ug+9SlNiOQCIqmtJWg
 3FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEJiD15A68fC6SKwYs5XNRqfHJAp+vmoTIHZ0Wq7X1E=;
 b=lKo16snyF28bvf7JXYY4Sx0i2kpcaTW63a4ZfLK5ku/JY/zilEDmXZE5KxbahKAVPm
 QD5TYtylY42S3WT9Zj7IS2k1L+qAerGEQa3MJ1biostIbTVXlAu64zDSl/gR+NAYO5SL
 y+vQGmyLQlfNDcdkOkOLRW9PDzKx/vImb0VGlxyp2i0lmJ5DQumqbYjmOjqyQ3EsN0BJ
 GGjnuI2hIa9bZrUd29H+B5/Qkc8Ezo+wzTTEHKhCcorCd6RryT7HgKJFHlZUQPHf7JbJ
 WjmqC54BNlLKurkIMyXa9YcXjlUFX6i2qsLGBoDlW4JyhPyyO09LiRgaJ/ndFM5DDBIX
 E7vw==
X-Gm-Message-State: ACrzQf06pD8Yq6UiEMqHYHZYbqxNtSfjTrr6Z4C4zSuK1l33bq1PjcGO
 dfdEytXRF7l5+DMEnxx27PM=
X-Google-Smtp-Source: AMsMyM7NCPquviHbr1ViT+Zn2xCx1V3w/gqj9EI3FyaFAgvANG2ME7aA/s6o30lzSxwKI6TzBYUiPA==
X-Received: by 2002:a17:90a:e7d0:b0:20c:169f:7503 with SMTP id
 kb16-20020a17090ae7d000b0020c169f7503mr34763255pjb.175.1666038316564; 
 Mon, 17 Oct 2022 13:25:16 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:16 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:50 -0700
Message-Id: <20221017202451.4951-23-vishal.moola@gmail.com>
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
 Content preview: Convert function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: Ryusuke Konishi --- fs/nilfs2/page.c | 20 ++++++++++ 1
 file changed, 10 insertions(+), 10 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
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
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okWfp-0008Sx-Ij
Subject: [f2fs-dev] [PATCH v3 22/23] nilfs2: Convert
 nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
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
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/page.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index d921542a9593..41ccd43cd979 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -358,22 +358,22 @@ void nilfs_copy_back_pages(struct address_space *dmap,
  */
 void nilfs_clear_dirty_pages(struct address_space *mapping, bool silent)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	unsigned int i;
 	pgoff_t index = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while (pagevec_lookup_tag(&pvec, mapping, &index,
-					PAGECACHE_TAG_DIRTY)) {
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			struct page *page = pvec.pages[i];
+	while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			lock_page(page);
-			nilfs_clear_dirty_page(page, silent);
-			unlock_page(page);
+			folio_lock(folio);
+			nilfs_clear_dirty_page(&folio->page, silent);
+			folio_unlock(folio);
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
