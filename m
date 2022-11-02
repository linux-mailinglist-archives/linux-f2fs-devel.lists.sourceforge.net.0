Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0A616798
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGLJ-00068P-1z;
	Wed, 02 Nov 2022 16:11:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGL9-00066N-Mi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BlC7rcv7uN/Ok17R0azuMVwGkvRCqLRr8I16XJ1l0Zg=; b=E4U/LnYVNu9M5CYjKkGIOU/gCx
 IfsOi0IWLDpSnnWJ1KFQbih2dtPnKJKeea+I0BNPzzgGr40uJo3sY5PrwPvZ/KKfmf91Hj7EorXcp
 DnCf72Wa4+P2dLWXjmipkxde6eaxBSCkO1phiYySZHi75p6A6x1mV1EzQllXfhjIGN2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BlC7rcv7uN/Ok17R0azuMVwGkvRCqLRr8I16XJ1l0Zg=; b=fY7XPwh9UucMAPVEUKuW7dSeU+
 qn3b0n14Sq3AbQBxDiyU4BQ3oa0cyytyA9zUu35BhH6P2BNx1MsAmrK0zXf9Swf+EBUZX6C3SFwuF
 0K94IPRRA99q4WAYzJ4YSH/GYM5AbVibi7WJfNnP4mHS6o3NB4XewL/1vzo1yYhQ07Tk=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGL8-009aAg-RB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:43 +0000
Received: by mail-pg1-f170.google.com with SMTP id r18so16606555pgr.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlC7rcv7uN/Ok17R0azuMVwGkvRCqLRr8I16XJ1l0Zg=;
 b=Nq5OC7/qho070kMTIR5kedhLSGx2YL5E36Blk/zAHlfy6q42bFls2+pa4RnB8ovU/3
 23vNW1b/D7YHHKye0/4R/8zfNZQd1v8t3O7W30JyYK8TO3BPzuGAvu8+idJLehY48eH0
 nTA2LRYP2Tci8THpRdHRqOdUYAvC3WYgum+zsQ45VXVUlAh+7LDKxfOfFDNSJdU1TCHI
 654ZghJ33xktcPdPAHAEZ2WzWNJD2pfRdlYSjV2sZ+0y6oREU3jCVDH6UyjTHuPXqQAv
 7tNhrDH+d3WfX8ldYnIx9oUWEl/bGnai6OMrkkhyLBvzLpImZOGi3fus7xAeqEFsIJc3
 iWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlC7rcv7uN/Ok17R0azuMVwGkvRCqLRr8I16XJ1l0Zg=;
 b=dlf1bQP3VHdg+scIHSVnMWo/DJDV2XBPfCz0OibtsMMEWBwYrl8/jqIS0ENBDMpfrV
 K+ITuSJkscfDO9+mWWIKHFrjfe6CUzC6FkB4NHa0vvxaJ+N4blonzKCvuSirHT65PuKO
 4h2MZjEfb+relZSJIZU4Py75fh8EQtsVOlf8O+heY1x1Z/DGZ1GEGBoSNJxiNwyOoJWC
 QVW9NbYdPNdtfaT47GPE+9ZrM+GLLuwhM9afa/QSbzS5xsYOphNnHbi8pnzI0kRCUJp7
 kvRNseQr9CkDu41k8P/qao3Nj+BJg+E7TBUpNR+UxZPQDTRsVNMlVfMp0FOyMBzGQdwS
 hdcw==
X-Gm-Message-State: ACrzQf0F4JxwsJuH/j98kPplsl8pGCFuVNN27XALLjko2PI7X6qC2Jxz
 OQw0kRQmq2BByxnLAzZFsQ0=
X-Google-Smtp-Source: AMsMyM4j3s90xT9i6LYsmPHnxhpVulb37Bk4oCPHgBg+ghAVYd6bcWusmh3MWIob26u2e/+gVRMdDw==
X-Received: by 2002:a63:85c8:0:b0:46e:c387:c85f with SMTP id
 u191-20020a6385c8000000b0046ec387c85fmr22258571pgd.105.1667405497249; 
 Wed, 02 Nov 2022 09:11:37 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:28 -0700
Message-Id: <20221102161031.5820-21-vishal.moola@gmail.com>
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
 Content preview: Convert function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). This change removes 1 call
 to compound_head(). Signed-off-by: Vishal Moola (Oracle) Acked-by: Ryusuke
 Konishi --- fs/nilfs2/btree.c | 14 +++++++------- 1 file changed,
 7 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
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
 [209.85.215.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGL8-009aAg-RB
Subject: [f2fs-dev] [PATCH v4 20/23] nilfs2: Convert
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
the removal of find_get_pages_range_tag(). This change removes 1 call to
compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/btree.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
index b9d15c3df3cc..da6a19eede9a 100644
--- a/fs/nilfs2/btree.c
+++ b/fs/nilfs2/btree.c
@@ -2141,7 +2141,7 @@ static void nilfs_btree_lookup_dirty_buffers(struct nilfs_bmap *btree,
 	struct inode *btnc_inode = NILFS_BMAP_I(btree)->i_assoc_inode;
 	struct address_space *btcache = btnc_inode->i_mapping;
 	struct list_head lists[NILFS_BTREE_LEVEL_MAX];
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct buffer_head *bh, *head;
 	pgoff_t index = 0;
 	int level, i;
@@ -2151,19 +2151,19 @@ static void nilfs_btree_lookup_dirty_buffers(struct nilfs_bmap *btree,
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
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
