Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956B61679B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGLK-00069E-3a;
	Wed, 02 Nov 2022 16:11:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGLH-00067J-ID
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3e61Fb9Dqh0rLEzgpxaQ/B901JahzW9QwTImcYRDNk=; b=gypKNMzni2WmboLzrEVSh/Pdcl
 oVALVu6D6vag0QNwq9Y9cfTJSBbhn/jpvk/8fWBbw28Wo8n/ZuR6T8nMIgE1XlppXYsrkxZwRcsGl
 /AP7da6tDwzGI+ej/FkRcwtzTsYf9K0Qi/P4ySmg0vGCmSf35DuJrji5mSfkoUPP76xw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T3e61Fb9Dqh0rLEzgpxaQ/B901JahzW9QwTImcYRDNk=; b=Ks/Y39j4gNwZUR8nU0Vmq7xCjW
 rP1moiWEZTffy9e/xCNPncFgXE0thUYNJGQVsi0wTenCZRuQmM/LIWJnJXbIBGVJ7F0qjxctni0m7
 DgaHGUgQ52mQm+MNnFhe/728bITXAI08qHttMWWB7/TQngv8gM+VyRxw05D51SBR7LTI=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGLB-0005A3-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:51 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so2314777pjl.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3e61Fb9Dqh0rLEzgpxaQ/B901JahzW9QwTImcYRDNk=;
 b=pqx1PJqOgEaKfUss0nxJak4n84vFKOvzq3ESyrjGFD8v8ROxU3CQGdvwQuKFd1I/w3
 dCJ41EX/Bok9xslgktz6xXZZB5vDFu5BXOoWGO34UzLTcVVzuhGdIGcQHvEi5gNg3GSQ
 gscxO1Gb4psr/vsFsU/1JpKGLnKfg3l6eDymWIA8qk7+XrNzqRLz/vgtPRF4DPnVnb4T
 PW63xls+m/+8H/fBE5siUOyqDVnX5GNrTviD0Y18uYcvd2toxW0MDmiLDFy+p7D7UQQ6
 IBU8URj3sypjIFT2nA8r21p6YwsgewrtbGGcm7sfWsWRu0sZsqZoVeMOaVhnUYxkI+jf
 hvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3e61Fb9Dqh0rLEzgpxaQ/B901JahzW9QwTImcYRDNk=;
 b=f5zVJ/sP9LFsHPZ8bGj5ku7ScKDSIe1DAKyz1G/onKXGTbgy+zzZ/o2kFzs1DOdith
 lColI0ef9PsiI/gODsrFAL12BAtJ1RB2Me9FlqX/8c1jVWrtxPZhYSvP7ptHC7nAZfx/
 4fptQHWK8ZdKZtXyAHD6nXMG6pAaYJel7TADEX8LSe4hmJF6ZeJSztw5ntcIKH2n++B7
 ZPkH/p5YJ3HDYHuMxniUVE2xiPXaAJdYmberD0EHwBhsODESlssoxGx+gD4aIW4SOUV6
 ImeVBKsFJxJQ6mItwcAqa2ADmLmFWf0ng9iwNiEKowIf9HcJV5yxdG26u61zKxmrVvhW
 k9/A==
X-Gm-Message-State: ACrzQf3bD6vq2IDyfyozFFrWymxZSPBVECM8WSQBV8ss0Uqo/ZNKgxZ2
 X3TEHhjv225SAEdu77Fvb+8=
X-Google-Smtp-Source: AMsMyM4+pj++Af4Edyb2QUG36sMaov5LKSRDOi2tknVjdB5MdIhE6lghLouhN9qeqBdhiOHeQb9nDw==
X-Received: by 2002:a17:90a:9a8f:b0:212:ea8d:dc34 with SMTP id
 e15-20020a17090a9a8f00b00212ea8ddc34mr45089840pjp.30.1667405500003; 
 Wed, 02 Nov 2022 09:11:40 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:39 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:30 -0700
Message-Id: <20221102161031.5820-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
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
 for the removal of find_get_pages_range_tag(). This change removes 2 calls
 to compound_head(). Signed-off-by: Vishal Moola (Oracle) Acked-by: Ryusuke
 Konishi --- fs/nilfs2/page.c | 20 ++++++++++ 1 file changed, 10 insertions(+), 
 10 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGLB-0005A3-Iq
Subject: [f2fs-dev] [PATCH v4 22/23] nilfs2: Convert
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
the removal of find_get_pages_range_tag(). This change removes 2 calls
to compound_head().

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
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
