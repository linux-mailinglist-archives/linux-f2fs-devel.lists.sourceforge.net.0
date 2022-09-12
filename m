Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F25B6055
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo80-0005Y0-TD;
	Mon, 12 Sep 2022 18:25:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo7y-0005XQ-AZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pWqS4ooFUTFHzhqRBDvFvbwutPU6GCzkgDePLKh0xDE=; b=bvJiIBbF4AOf6Iqt1mxCwM8BmN
 WOmGP0dWBa6VJVOZUoEH1NwK2sZKR0zJTdjDA1QVKhkXK2npE6RlDPGm88BDy1kwNnDUXuA0D4kxb
 490yClM0bnTJpbfJl36jfRemRnOfHmNZQe8HWg1wjgi6WD2pubd71UO2g0G2wpiKDUhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pWqS4ooFUTFHzhqRBDvFvbwutPU6GCzkgDePLKh0xDE=; b=V/wowoU9Zt221x4OdL5FR88qn5
 4au1KasyQlBwIgBuW9zrrfsQyoDxGxvA/U47svVFNVcPXa77BDQl6nFVHy3slQO9jt51DSio1m/hg
 mEAb+dkbETkrEpItTBjj0ucHcyb26wYowMIDHqwrG0DA6ysJa+AAWtbH6HDvsY3GPHSw=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo7w-0003mp-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:50 +0000
Received: by mail-pg1-f172.google.com with SMTP id r23so460111pgr.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pWqS4ooFUTFHzhqRBDvFvbwutPU6GCzkgDePLKh0xDE=;
 b=AYWIcUZ91sylesOSzRGl2hKsZM7DiQkiDsyS+9s5+LA+MPta/U3ymY0YWDkPHY9oab
 TuySg+H6RXpkOErLu2PR++mbeOfkgTYRUYqEVnrjpRv+UPKnC3/D3FOtp4XhZFrfgO7X
 86LOFTVnc1CRsA3Yc1TcR//CirAhQzUigoEM9VJBDrwvXswZrs4O2QwJLmXpBw3aaxKC
 O4U1D5hP5xt3/7bU1KCBkhDP79kXcAHKiy2/l4pAA+Zq0gboMPZStEpJ422HzaC98JBQ
 +qawMpBKfA4hSwv0L3tMjDudqnDhF82hZqBXTqC2jkUV1wm/OoqfuvtRTsjq9MsLcqSC
 QclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pWqS4ooFUTFHzhqRBDvFvbwutPU6GCzkgDePLKh0xDE=;
 b=Opbm8CF5FJYSnpICs4NQFm7VeFss7SmZtPsvOmVHYbGwehAHT8c/Eq0Z24XHV/bCDO
 oQnp4NGFvmIgNNrp2EPZvdqIcPTXHuREwM2mCxa8MyQBEgtUwc+6OR/l2eCfjSmqnzqM
 AJuPtd4piRHMFg8mKMYXexjcdjkqIOQBaPSNYlOM6I7eeD2+FHt2646SSKfLzoKP1YLB
 V2kQ1cvzPQ4sgl4+ShWFHZsL5IvUKhFUdsMSsDpCRWAvxVJncq6QXH0eeiqqu6C91ycM
 IO+PJ3/umqW24NmVhA4InD8i9WCKPNTfLd7xLV680ZhMbLI7QJ93s+20Wf/fEgPoEN6e
 nT6w==
X-Gm-Message-State: ACgBeo0E8WMhh2jVgext2zPa9VMpkVl/WOXOkF1Ke4wgFwYZicfvgZXz
 o4kwoJuawRZ+XJeQDrIfX6g=
X-Google-Smtp-Source: AA6agR7iHaf9tD1IZum1dK00J/tGnrsDCLmrUllmORyGa507ezKYi/IXYce1EbiFNnQXHzaZYOyPmg==
X-Received: by 2002:a05:6a00:1ac7:b0:537:4186:c106 with SMTP id
 f7-20020a056a001ac700b005374186c106mr28997861pfv.76.1663007142969; 
 Mon, 12 Sep 2022 11:25:42 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:42 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:14 -0700
Message-Id: <20220912182224.514561-14-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
References: <20220912182224.514561-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert function to use folios. This is in preparation for
 the removal of find_get_pages_range_tag(). Does NOT support large folios.
 Signed-off-by: Vishal Moola (Oracle) --- fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oXo7w-0003mp-HJ
Subject: [f2fs-dev] [PATCH v2 13/23] f2fs: Convert f2fs_sync_node_pages() to
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

Convert function to use folios. This is in preparation for the removal
of find_get_pages_range_tag(). Does NOT support large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c2b54c58392a..cf8665f04c0d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1933,23 +1933,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
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
@@ -2024,7 +2025,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (--wbc->nr_to_write == 0)
 				break;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (wbc->nr_to_write == 0) {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
