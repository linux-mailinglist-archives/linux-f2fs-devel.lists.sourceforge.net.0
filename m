Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E75B6063
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:26:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo8B-0000sS-FV;
	Mon, 12 Sep 2022 18:26:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo8A-0000s0-9Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iZBT3paH7ib6tLdY11ze0PGeOOPanYFCKzZa2TAf2gQ=; b=XHYytQN75Q9+HSR3BFqcL8lNpB
 0oqpGvrWyJHrd13XXbV0YEbQhn6zCl0A+/1CXQQ1aSO3M5FYK50pA9905i1+MdvTcx6JsIVu30N3e
 Dpm0MQH0A3/hPHlKVa8RShUW3N1fvgL9vT8DbhiepcE7N3+noAzgiI8d1mpKZTpYqPBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iZBT3paH7ib6tLdY11ze0PGeOOPanYFCKzZa2TAf2gQ=; b=g1G+d34HPCxPwgf3pSkQ4LkGlh
 lz9pMSjsMuUgTirOVtz1hmiXLCaRbP7iULseVprnMRtQwt7LzrM+VaUYUfVd6DIjxmpheuAhA5fkg
 aGjddBTrEzLT5a5O/q6f8n8rBQHLp+UlFxHmOQCJps+QLZYHAdYTj2MIjrAAYd/HLNSY=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo88-0003nd-Jn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:26:01 +0000
Received: by mail-pf1-f181.google.com with SMTP id z187so9418986pfb.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iZBT3paH7ib6tLdY11ze0PGeOOPanYFCKzZa2TAf2gQ=;
 b=QkzFucHR1fupSeVgkblSK5qafJCdbSmYeMiwUIAQlaY9uethI4Pgnd1Bnj9rnWMs8/
 r3L4IeC3wfXLBQd0PODD5XEJxk5uyedAZU1m489CavS2FEDS8quz37ynfsdfhjEZm8RI
 C2ZLDnP9Pnc8XBiwTLesO6YiXLxOL2gbOGUJt2n/PEx5+mfO0etsNWI0uvIAO/uhFb6x
 lFFXBAKKaMWQvQgH39q61lrTIsM7c8YMTUcW4lDdSlXhdww3nb7o02TObqPupet5gyJk
 7RkJCEpDWHn639fPwEhJvdWuZSftDpyL+FtJODzUIbnECV1xwKcq6GxE0JKbw3aep+na
 CN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iZBT3paH7ib6tLdY11ze0PGeOOPanYFCKzZa2TAf2gQ=;
 b=ERhT4zdtnyN13tEh2aH/5xD2l5ijXwMJrMrliGd9ipg4dfo6BOVI2W7V2VPhLgNq0K
 rwNmpuxIeHJTEa2J6nUg/9ZqT/QOwy50hOnnDmytEeTER3kCXsYYVQRfW1fzlqvaaidJ
 FwDxQiyDreo9BGWJKrUY4z24ogh9zY4PeWKAh0raMfqZG/gcPHlePCGDt8iWaybKSNql
 mjM/zGBGwhmiupbx+ne5eYzJHh0LwIDEDYQBsnhbSBImj8hoUb74wASpl5ZTOQPTu5U0
 Qrv8OxHvKJauLWLAbuxQjOO3Dy+23Dwz/4VN8DGoivTF5EAlPFnxK6Fx1CocUA8FJqIr
 dWlg==
X-Gm-Message-State: ACgBeo2v07cnAHZ7xxmNtZgHFFIM00SzTy2e8r6VBlnudCr34kCgdvKq
 VuP+BnnsjxsxbZmeCD1iFgvN7OA08SYdKQ==
X-Google-Smtp-Source: AA6agR5jqq4HR13QV4NjOJyLUDfVzNGQEZAmimcRy3kDhjfHX6OWAX3x1w/BfIb8s4plIHCJOjRu2Q==
X-Received: by 2002:a65:6749:0:b0:434:1f8b:cb97 with SMTP id
 c9-20020a656749000000b004341f8bcb97mr24158872pgu.360.1663007155026; 
 Mon, 12 Sep 2022 11:25:55 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:21 -0700
Message-Id: <20220912182224.514561-21-vishal.moola@gmail.com>
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
 Content preview: Convert function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: Ryusuke Konishi --- fs/nilfs2/btree.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
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
 [209.85.210.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oXo88-0003nd-Jn
Subject: [f2fs-dev] [PATCH v2 20/23] nilfs2: Convert
 nilfs_btree_lookup_dirty_buffers() to use filemap_get_folios_tag()
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
 fs/nilfs2/btree.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
index 9f4d9432d38a..1e26f32a4e36 100644
--- a/fs/nilfs2/btree.c
+++ b/fs/nilfs2/btree.c
@@ -2143,7 +2143,7 @@ static void nilfs_btree_lookup_dirty_buffers(struct nilfs_bmap *btree,
 	struct inode *btnc_inode = NILFS_BMAP_I(btree)->i_assoc_inode;
 	struct address_space *btcache = btnc_inode->i_mapping;
 	struct list_head lists[NILFS_BTREE_LEVEL_MAX];
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct buffer_head *bh, *head;
 	pgoff_t index = 0;
 	int level, i;
@@ -2153,19 +2153,19 @@ static void nilfs_btree_lookup_dirty_buffers(struct nilfs_bmap *btree,
 	     level++)
 		INIT_LIST_HEAD(&lists[level]);
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while (pagevec_lookup_tag(&pvec, btcache, &index,
-					PAGECACHE_TAG_DIRTY)) {
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			bh = head = page_buffers(pvec.pages[i]);
+	while (filemap_get_folios_tag(btcache, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			bh = head = folio_buffers(fbatch.folios[i]);
 			do {
 				if (buffer_dirty(bh))
 					nilfs_btree_add_dirty_buffer(btree,
 								     lists, bh);
 			} while ((bh = bh->b_this_page) != head);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
