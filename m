Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFAD65DE33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6T-0002M0-2x;
	Wed, 04 Jan 2023 21:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6N-0002L0-4g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/F8d0ryK33J83PP3KTKD8iJBJ7iw3NcsaZlwvBQl84=; b=D/MhCD20yXpwulj0WuN2b28UFo
 16s3Pe/v6PfGyplMyvwrROmPSzlqvi0tgo1G8aYgcgYYUw66vqU5JqZrLRk0+Ak1mEjRANnsBR558
 izqftGsU2A++qwH+2nWSc2fOLZH7JSlX1xjuV8D9XJJK5PGeE+tyr/8YKAJ9Lz9SkpMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/F8d0ryK33J83PP3KTKD8iJBJ7iw3NcsaZlwvBQl84=; b=DQH/2+FDBFU89+7+TsPNU/9VdV
 A8yOr5CakZ3PvwYTHNiiuw+nyzrOXxGt0GUQzAyqK4rEwAUJGDHhp4IDYXySxKpjORBmzD72xkRqb
 8n3ntknyZHPIhiMWIU8/IKv9E93dVNr/ep9xFNffPt4ec9zmWePfXMDDsjdC/1eGzAY8=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6M-00054h-IB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:11 +0000
Received: by mail-pl1-f181.google.com with SMTP id p24so14704277plw.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/F8d0ryK33J83PP3KTKD8iJBJ7iw3NcsaZlwvBQl84=;
 b=CNESCgcUv9kyk6ZyuvoP2d6/MvhM1pCGilvS2/lZfNbmctlSZWFKUqCSvhFIz1agh0
 MrXYUY/IjeyZdKqV04XP1+w+s563MfL6+BGDibaZYFnnmEIV6pxQQi6KtEvnE/Zh6S9x
 N3YHOD+Wv8qtv3qvpXgMLZUQwwOCEW7H7eRmd/WlRcZhTkbK/UvDIqsoezAJMA0lHvvS
 kWJCDRpjIbsqJnvVQ/ULbh6fTn6+ffdvyUTkqPbElybf60JgjpuMKt4o2uXOPIr/TfNE
 +OyO0tT4kunau+qPwxmhXHoh0V+QCydNCNYwJsT/xGh1U9dwCtvIvQ+8IlclyBNEC2Z1
 /zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/F8d0ryK33J83PP3KTKD8iJBJ7iw3NcsaZlwvBQl84=;
 b=FH0BEDbSTb1RcAgMeKbp9Bi2UwaP8SG4qa6eWCakMSt0CQSBmoUVe3biMDf8lSLEbq
 DKyHav2hpOe6zWS70/ymRfESdGr5Q8Vxtzk4l5kB5bgy5gQEfVNc30uieLSpvx+DiPnn
 pgkycNFrj75UCebA1LPMKq9xqlLOp5xM9tivwT1u0ctQ5ThiDo6cU1XY5ciWao1ywMfu
 k6esWyImdLbCUydjdtlpxPx9OF4ZwDRcrBc4ncE7CSWzszxl2FwA+B2KB6fN8aWmFGrZ
 b/sS1dMfZy+eh3QqsymkJ8s6mbaKjcph4i5sqsPfsWJxsGjr1xzi0PI3C9vB3v8VEZYs
 VN9w==
X-Gm-Message-State: AFqh2krMNG7MXcSNq7Kr0n6UIDJjsiQT4EHwcxPlzBB7akNz8ezKlGFk
 oc5wCEEJMNmCzHVmRtm27k8=
X-Google-Smtp-Source: AMrXdXuAX7hDzmiQPGibqegiPGsPttVBZ/qOOsjXqjfaA/v0yCiadzuJ0YGwzrUP0RByey/eocKZSw==
X-Received: by 2002:a17:90a:8b05:b0:226:7fcb:c215 with SMTP id
 y5-20020a17090a8b0500b002267fcbc215mr10576703pjn.17.1672866904962; 
 Wed, 04 Jan 2023 13:15:04 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:04 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:31 -0800
Message-Id: <20230104211448.4804-7-vishal.moola@gmail.com>
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
 Content preview: Converted function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: David Sterba --- fs/btrfs/extent_io.c | 19
 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
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
X-Headers-End: 1pDB6M-00054h-IB
Subject: [f2fs-dev] [PATCH v5 06/23] btrfs: Convert
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
index 83dd3aa59663..64fbafc70822 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2845,14 +2845,14 @@ int btree_write_cache_pages(struct address_space *mapping,
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
@@ -2875,14 +2875,15 @@ int btree_write_cache_pages(struct address_space *mapping,
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
 
-			ret = submit_eb_page(page, wbc, &bio_ctrl, &eb_context);
+			ret = submit_eb_page(&folio->page, wbc, &bio_ctrl,
+					&eb_context);
 			if (ret == 0)
 				continue;
 			if (ret < 0) {
@@ -2897,7 +2898,7 @@ int btree_write_cache_pages(struct address_space *mapping,
 			 */
 			nr_to_write_done = wbc->nr_to_write <= 0;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	if (!scanned && !done) {
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
