Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0B616758
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGL0-0007cC-3w;
	Wed, 02 Nov 2022 16:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGKo-0007bZ-8a
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CScuk7r85wyu6F501iefg0DKwl3fyaI1fu4SBsbfBNk=; b=cDPTo8xviuG+fNZ3iXm5ofmvPB
 3uMRr+FFJxNb+ujosBl8ecEQS3lUKN1Q28aFWIDseAQU6vclIO/OADw/St/rlA+8ogVCs32g25+P7
 NA7DbMs4fanX5RVHBmDtV1yI9j6aa7u6afkxJ8fYZeKkgH7wGFppLqk4h48xtdbBoYSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CScuk7r85wyu6F501iefg0DKwl3fyaI1fu4SBsbfBNk=; b=m/gziHfAV3wRg7TRy08oYmQupG
 mIijNT9TkpkxuL+q4WL3DfXeR2hMVfpVLTM4nGsvvu110tFiC6aIb7tcqGBSDcf3ONLa4rZevemLV
 kuZSxJwnu88RTgURhGy4h1t0L/YO9l8g2W1TW6avL5XlEj+Pcw4mXrtz837fIGstL8Nw=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGKn-009a9W-N4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:22 +0000
Received: by mail-pf1-f182.google.com with SMTP id k22so16841661pfd.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CScuk7r85wyu6F501iefg0DKwl3fyaI1fu4SBsbfBNk=;
 b=G1xj7WAmIltNBsbLKuO9CkKEQ79pa0K47wkha3puJeaezV2/imAkDdcfm/KV23FIHU
 +KArDubzSRmx7FiH0l8qSZQuiZfGIGZFESde9F7GDr7BI0vnEKAz4OoG+/TLSnEP6lVV
 hEk3uS7L0RHCBIur0yh9N3EX0D7wiz8f/Tz1DOmo9UyRB6et4qwOzt9Nng+ZOsOpt5/H
 9uNCUJ20VcSVqHMicFHHEq7ELqXYQFE7Mrb+NRFmYH88zfkz/DMkzuyMw0IDbt4InR+d
 u77NqmroP0vZczS44dmUtLli+wdv7QD3/rglQpmtqCu4rEb336yGk934JQ6ASFGIEHNx
 5dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CScuk7r85wyu6F501iefg0DKwl3fyaI1fu4SBsbfBNk=;
 b=QtIb4RgIqRDRsl29ayeI6IUiNeqbXzvCBt64SGhME9FJcrzA3UaMMiiD5P9+mgXWeN
 arUzIAIrMwFr2mMARt/dOAU1uCekT+nUnQSP9eFROMRCjdCQBoovihQ4mGcurCIHgWu9
 9dQsGaaNmBGI6Mwy8u7e8FOG6GlrAGsUybcpAhmSGy3zD4Zwvr8neRdR8IqPqZnsPeWA
 36he6HGgGpBtdILW9pUwz3zuHqARqN0JrcJcWrqPllGACTuoRZqNwzJBd7bc+JblS0r6
 nCPTbM1RdMzFvzvGxW13aSzXwmTBxI3ZkZnfuBAMgA1n6sTScXezJy9Z5ikFuzxmedRm
 obYg==
X-Gm-Message-State: ACrzQf2Na0zgvaCqk45xyOYdx3zb+wnHQb2vpyTaG1JxsBiM+fASEHQz
 jzbhzHtiPmPl1q1mjN25928=
X-Google-Smtp-Source: AMsMyM6GJxhB3WK1RR+mjEzfRIolTwRsa2T5GOunC8tyj4bGy4RuSHbsovs3MGUIO1XlX8Eq6nDAFQ==
X-Received: by 2002:a63:4753:0:b0:462:b3f0:a984 with SMTP id
 w19-20020a634753000000b00462b3f0a984mr21859153pgk.501.1667405476022; 
 Wed, 02 Nov 2022 09:11:16 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:15 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:14 -0700
Message-Id: <20221102161031.5820-7-vishal.moola@gmail.com>
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
 Content preview: Converted function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: David Sterba --- fs/btrfs/extent_io.c | 19
 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGKn-009a9W-N4
Subject: [f2fs-dev] [PATCH v4 06/23] btrfs: Convert
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
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
