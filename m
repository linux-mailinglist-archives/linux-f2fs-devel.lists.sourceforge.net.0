Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52465DE2A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6N-0002L9-NT;
	Wed, 04 Jan 2023 21:15:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6J-0002Ka-4E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ONYMO0PIN9dk55uWmFjeEGp9OM+yknAPJhSRMx3xaw=; b=JGtPUBuBcYT39n6cPpu/+eR8Pj
 urctcZpj/1GPgNABLqnCpfVoYBI2Sr6RNMZmyIVA1ueVVBmzmuuO/QZzvXQ9QxQza2FRIvV4Fb9qh
 EWvYI6/MgWp+43q1CcFivKSNJn12zX+DeruKzMZPcZ0+JcY6LAZpivqdj5qZ/m0lMjkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ONYMO0PIN9dk55uWmFjeEGp9OM+yknAPJhSRMx3xaw=; b=TNrROO2uLp2/ESZWg9Hlb+46Lg
 KwZZPAGgTg3YfotAf7qh70vNxN4JsZpOSLij7YxakH/RZcFT3mKbEqn4QNY2hJeEEN1Sr7Aw6jDU8
 iPTa10ggsaEOStVpwZed3A0/4SCtBaKrNL8M3AjithXlfx3lZI5jre2pJo4eY1sTu/mw=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6H-00054H-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:07 +0000
Received: by mail-pl1-f181.google.com with SMTP id y1so1703838plb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ONYMO0PIN9dk55uWmFjeEGp9OM+yknAPJhSRMx3xaw=;
 b=B4tZImsNKLYbwaEqQjZ6y+RmfYlF9uPZ5GCZplXcCJF3iTUDgroyLgSP3mqYOoL8tg
 YUfyLoz3u5XgGnDE8mGVieFI7uGrvjpm7MV2567un6rA6WUGTCXfddQ3eRYqgtAPAsej
 ouYl8YS3aBd3N56Obqpj4h8BMtdtujYYIOVDFk+W7HfSFDJTTHDe65xJxpTl3VgqIUmo
 pI4SkMbuMEFagQxYzTZziQxn82J39o2Z7ocFmImgkgV9x4eSLUJZQMl3FydDHvRMUEpG
 u+rOOzvhF8F30SkjJIA4rPh2WDlpUGXokQmXmXOoIKmRVkH4a151vkBklfMzbbK9lmfe
 ilCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ONYMO0PIN9dk55uWmFjeEGp9OM+yknAPJhSRMx3xaw=;
 b=3b85e3iCQrZ3bjbOAyYyu1Vy0sno7X0laCksZtaU8P2jzrepi/A6VGbJb1+5XNuk0e
 34/h5lDIWXtdiZ17Pz58npxiLDMxujwgcROXiULybO3GmjFGhW/ffBlDP9+GB8qACvbh
 otHr2GdYiM/XLhKgioi+2LYEAXbj5wQ1a50b/MHI0Wyll+yKB521+V6L/O727VzFUaIO
 gRZr7lh9X1PQmSXuRYhwHRKrdsM76Ag0NF8IrBHUdOoN2JTmPeSlfiSux+kBL3QhlJaM
 HOTUJ81P2dRI/2diFFgbBb2UIQI7TDMtpsaTBHy5ngOyb4AAuqQ1eZqfHB8ocuC2tBEw
 9eSg==
X-Gm-Message-State: AFqh2kpWzd2RR3+iLDkiwh8UFg68AhbIKT9Nr+XYNwP0N45YGnNPJKmP
 hK/2hOyZVQYNqbbUzlTHZyI=
X-Google-Smtp-Source: AMrXdXvZLValNoGwSyObnfnQYoAH4bPSeKaHZWatAKcSnlYAPIvL07xJdtB6+9NqIK7AN3tdnyykVg==
X-Received: by 2002:a17:90b:2485:b0:226:b9ed:1788 with SMTP id
 nt5-20020a17090b248500b00226b9ed1788mr2782434pjb.31.1672866899803; 
 Wed, 04 Jan 2023 13:14:59 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:14:59 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:28 -0800
Message-Id: <20230104211448.4804-4-vishal.moola@gmail.com>
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
 Content preview: Converted function to use folios. This is in preparation for
 the removal of find_get_pages_range_tag(). This change removes 2 calls to
 compound_head(). Signed-off-by: Vishal Moola (Oracle) Reviewed-by: Matthew
 Wilcow (Oracle) --- mm/filemap.c | 24 +++++++++++++ 1 file changed,
 13 insertions(+), 11 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6H-00054H-Ds
Subject: [f2fs-dev] [PATCH v5 03/23] filemap: Convert
 __filemap_fdatawait_range() to use filemap_get_folios_tag()
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
 linux-kernel@vger.kernel.org, Matthew Wilcow <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Converted function to use folios. This is in preparation for the removal
of find_get_pages_range_tag(). This change removes 2 calls to
compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcow (Oracle) <willy@infradead.org>
---
 mm/filemap.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 291bb3e0957a..85adbcf2d9a7 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -503,25 +503,27 @@ static void __filemap_fdatawait_range(struct address_space *mapping,
 {
 	pgoff_t index = start_byte >> PAGE_SHIFT;
 	pgoff_t end = end_byte >> PAGE_SHIFT;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned nr_folios;
+
+	folio_batch_init(&fbatch);
 
-	pagevec_init(&pvec);
 	while (index <= end) {
 		unsigned i;
 
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
-				end, PAGECACHE_TAG_WRITEBACK);
-		if (!nr_pages)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				PAGECACHE_TAG_WRITEBACK, &fbatch);
+
+		if (!nr_folios)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			wait_on_page_writeback(page);
-			ClearPageError(page);
+			folio_wait_writeback(folio);
+			folio_clear_error(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
