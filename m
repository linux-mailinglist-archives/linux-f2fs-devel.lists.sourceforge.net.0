Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571A61674F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGKx-0000P3-L6;
	Wed, 02 Nov 2022 16:11:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGKm-0000Ny-15
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D7ILOV7uCBW9G56cPuCyE+xwJ/LPVQUTk1i899caTl0=; b=boWBoY/+vZMteqa9pHWIiZZzcz
 QTbWYUarSlZ/e6GmWcTr73ZC2cEwfZGWSruPVqqUl/3vMh5Ul3PNTXmnOQUzYahhKQsFEaOSryoCi
 MhnGYqJjxVaW+0tNJT38fCL1oWOkNS7U/xU+P1yNRXlC9rTqCvhoSSds/5lBK9SUgSsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D7ILOV7uCBW9G56cPuCyE+xwJ/LPVQUTk1i899caTl0=; b=lJUXxtX09luhDTNoPvDVl7mXah
 sXaL8gZKgPz7vQH8x6fJxU/5NQulR4+sZUVB2sw/TJQGPfY8DGUzRIQq1GYNaJAuAJIvz+eLueuD/
 iiGh2kpS+t1uEAsw8Dpul9MHRMJbJOIyiXY0yyZXRAthaP9DvtiI5pDVJjgq8ZEXa6Gk=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGKj-009a9K-9H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:19 +0000
Received: by mail-pf1-f175.google.com with SMTP id v28so16644787pfi.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7ILOV7uCBW9G56cPuCyE+xwJ/LPVQUTk1i899caTl0=;
 b=WlFYPEeV3wf0VfK6pqbhv5Egc4h8KVjel140fCaMDBK3FcDDdSMrAwC2RRkCV1yrTw
 g5UfIoUTA56HrpjtwUHlbxxIl2+2XVj36Necvjw2qtsGVhSk3MpYNUz5lqUeXoe9rcG+
 rSIhTCQW2xVo9vVWdW8xlqvFvN174oq7e9hBFs8SL0eQTkE9h9BtGOiyq5hrX0X03ARZ
 +PjKQOimzK0w0ph8uxMDYryUYErs4i2YihTAv+8viAcID4R9rEgIXHWoL0tVB1NY/fCF
 Zz7LVoKY7ZVpgl83UNZSArBIZLGwCRqsreKwNZaIOWeZgiKqm4whhefGhGSMZzVBzGt+
 R1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D7ILOV7uCBW9G56cPuCyE+xwJ/LPVQUTk1i899caTl0=;
 b=P1aSAlzoqFSt8GPVpEEMd07CxlgIUREOJFdNnlaw/1kkH/RtH2tly6YL9r/4MgfmBC
 EhCgG8Y8ORGIONzYGkw59FzAIEBqKjT+xaUxvkAK246r4v1VH9Ki4cEMRmoHty7bxcPt
 NGbhDO1BHhBiTY2AmIavac6SJSfaWVLm4wXu8ssegiFjTg/HurIhAQILTYvfOnn/rpUI
 ttxY0myeNFq+PKWuV8m5CMkMPJo5yLAJBBZMJIJsemv3BeeR4rPFEy3q00JJPfOXU50g
 OdfftOCbvLYEkodNnBGDIiFf1s3NhyRP2rZzx4FE38AtiRJeZDWDj7a6fBRAv0D9Pso9
 eqZg==
X-Gm-Message-State: ACrzQf3Op5RXCnLH7rgGGH/YHeOPSrPGoBH1SwkLKjbWMLV6lAeIxOJd
 hoPkeqpjZGq4KynodgF7Y6EAII5uhdMk9w==
X-Google-Smtp-Source: AMsMyM5yBalx5fts0VaFDBkG5q5k8ESrx5LXqDS/i9qmdUWGQhi6efEZneqsEsoguUnslwFAGGHvTA==
X-Received: by 2002:a05:6a00:1a10:b0:56d:5266:56aa with SMTP id
 g16-20020a056a001a1000b0056d526656aamr19077451pfv.61.1667405471611; 
 Wed, 02 Nov 2022 09:11:11 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:11 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:11 -0700
Message-Id: <20221102161031.5820-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
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
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1oqGKj-009a9K-9H
Subject: [f2fs-dev] [PATCH v4 03/23] filemap: Convert
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
index 9be22672ce1a..cc4be51eae5b 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -503,28 +503,30 @@ static void __filemap_fdatawait_range(struct address_space *mapping,
 {
 	pgoff_t index = start_byte >> PAGE_SHIFT;
 	pgoff_t end = end_byte >> PAGE_SHIFT;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned nr_folios;
 
 	if (end_byte < start_byte)
 		return;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
+
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
