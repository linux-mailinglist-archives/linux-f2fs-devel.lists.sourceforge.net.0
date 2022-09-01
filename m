Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFF5AA209
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 00:03:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTsHF-0000Wi-CR;
	Thu, 01 Sep 2022 22:03:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oTsHD-0000W2-46
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6jEJW/hdf8NlYILH28nH262i/WrC/eObbm9U3wHW7N0=; b=UUbdfF3F5vKhAQdNFfupWuw6b6
 /gmGfu/DHZC92+Z4x/F38QdcdfrQppK9JTyyYnvr2Olpw4xm7Tb5u27L0ReNglsrFHx8C9rXrf6qD
 dQDZJf7c5xaVZr5Oab9YnS1NaBg3P4Cyu/W6OPU65CEPJaKwSWxtBT7ojWl29nd3RGGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6jEJW/hdf8NlYILH28nH262i/WrC/eObbm9U3wHW7N0=; b=Wy7nkqQj0wa0qFVGCcgHeT8El7
 mQOZhZsdsBAatfF1txIGp40TG58etzVbmgxmSHX3DQh/QDLQwYqH8OfkmgZF++LC2GvoVELddPcEu
 nIlBYhi27MlW7xW1lP0WNcknPufwi+70eHjRLiwvFzdRn2I01zdTrnx8XNNBPAt06ip0=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oTsHC-00AagD-J3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:03:07 +0000
Received: by mail-pj1-f44.google.com with SMTP id l5so247418pjy.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Sep 2022 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6jEJW/hdf8NlYILH28nH262i/WrC/eObbm9U3wHW7N0=;
 b=N9gi0ek73D6+Ob4gJQTCenTIizkASUjD+NGWnY0SxFC164jHY2z+KDjngS5u8a5ea1
 pTnBRJWlclL9jxrutcaq59svND4AAi3Mu6zjZ5R0ZdTzg7WkwILrexZuQIgRHx4yncJe
 OCQ0GP35CE39948Jkx+DdsWr/hVemLW0aPd8pHpB8mjZW2hr0avHI7FZaniFXz2bEU5c
 8rj/3cGG0sHkP+Xg1vHbPyhxWGLC3ZGSwUXEq4Bo3qDVM63ON1NgwYw3KkUKbds8fRoP
 Z5oZrMmJFM7HBd6JNC8OlP+eYzpgfFP4AsKvNF+23CtWe3kx/Wqjrlwut0YprghhKCzN
 8ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6jEJW/hdf8NlYILH28nH262i/WrC/eObbm9U3wHW7N0=;
 b=qkA9Q9UVATAu4FkjcPBwBO9p4oduhPwkYdoTLapFd/LjeAM74ADjZNZSIAiiCdkBlB
 ynUp56w/sjJmnhCtMdJJUEWTk6WCzO/tli9jjeNhG3b8v5WNI4vPLBC2Z0e3CZ7c0NaP
 t04AIWlhFFzx3SkNIlbEZu9m49NY/qGmVYaSCtdsjo8x3cR7vvUbkHQfL0s3f0/61TBm
 BDc0MX3H/eo0w8+F5aSW/E7fuQ1gnq7liv4N+6G8Yk8HpXxknUNXfTQ+hpMudBBQiFzA
 4aEI6JYOKOLXKtcgOsvfwxireIsGG6WmKvXbnf++n8ZblHe/H7ya3WIlT+Y9sN4uUCKf
 rn0g==
X-Gm-Message-State: ACgBeo2np2q6PmWLMYbmXozbqyLyExLtf/1OVx9RH2hvWXMQwiwnjuAB
 qtRnkmL77G6ZrSUA7nkH7eY=
X-Google-Smtp-Source: AA6agR6ueb+SpLMpe0ENf809+aslBhtpdEEwbT3aRvZt/q/0zk6S/BuXNiziVl4cLeo0K8hj5HTpaw==
X-Received: by 2002:a17:903:40d2:b0:174:e086:c748 with SMTP id
 t18-20020a17090340d200b00174e086c748mr19496625pld.108.1662069786179; 
 Thu, 01 Sep 2022 15:03:06 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:03:05 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:37 -0700
Message-Id: <20220901220138.182896-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901220138.182896-1-vishal.moola@gmail.com>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
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
 (Oracle) --- fs/nilfs2/page.c | 20 ++++++++++ 1 file changed, 10 insertions(+),
 10 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oTsHC-00AagD-J3
Subject: [f2fs-dev] [PATCH 22/23] nilfs2: Convert nilfs_clear_dirty_pages()
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

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/nilfs2/page.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index 5c96084e829f..b66f4e988016 100644
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
