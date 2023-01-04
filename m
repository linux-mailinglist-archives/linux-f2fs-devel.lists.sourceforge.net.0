Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD165DE39
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6V-00044c-Kx;
	Wed, 04 Jan 2023 21:15:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6U-000443-3B
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yH5uknizJ+VZ3ByJbVZj3rNFJAjGpaD6mNiQZQbwTDM=; b=U2uyPn6nU9m8nrvST0wNdDl6tv
 kwbEQ7IoigMy+HRU6Ip7baIAy5Zika0ZUBiIwuZiaZKA0abqlhfpV6rlb2ZTytbBRWPbUZ9DbVeU0
 Wue4HzAoyL5gfCr8q8jGAvXOC1HUbRSenRgC2Z9n5dmRn74nwR9YRNiadpxsBmo9XwlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yH5uknizJ+VZ3ByJbVZj3rNFJAjGpaD6mNiQZQbwTDM=; b=YI4C6kDDUisHkBTWpnUuaQJBXR
 tv+OgL6R0KowWWB+OgOpZX9FGvUFIkgoTdf+0nzNgLnQCe/NcVtYEaNraxHmfJWtMmg66ugjEkHpt
 LRWfEbYYDNtpPI84yFWsbqAOqzsQ2h/RJaoIzK0+QYOkb5dcldPM6VHwnr14N5qpQNBQ=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6T-00055C-Gu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:18 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso2960515pjf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yH5uknizJ+VZ3ByJbVZj3rNFJAjGpaD6mNiQZQbwTDM=;
 b=HbtlZrradnwPMjbOnk5CSSrEWLtsrycMj6Tm30jqV76XWo9P/G6G9QfGZXA3hEuuO0
 yNLMx+3+R2fxnnyrSrsdtAH0YAmNGiTL388KwyzROfoONWg1jTa9Ux254/uWey0xofFS
 ZcN1YVGa74THrAOxSXWb1EhxG2YA/LskeaMec+FBsOyEUefqmBI414yyRv7F6qtfnFnG
 AKTzOXJ+X4W+hyL+EGENc2vkpZu+8+kQREVxb3SQSXSnUiBROYLOIlwHYGmrLdygYais
 EBeKayC0rdoQzyAgQz2uWHzmW86g0Hrl3uDZm7ONl8JUgVLCxAkjfMiNh3ua3ACkBAqv
 sniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yH5uknizJ+VZ3ByJbVZj3rNFJAjGpaD6mNiQZQbwTDM=;
 b=mYEsQrpmamy+PoKA9/VXVSX4m4WOaugTLOe03Omjab/IPKLo5tWtHVVXCEjLneN6Hs
 1AzRXXAGF3MOQiGEX69vIIX9lFb5MRmgYc4yo+e0jqWx86A2Ey1ussq4FCCV5Y9AhaC3
 f5G4/caYvPWnBCsyblC4UeYAirHXCkIQJKDBW+Wr1txlmbowJGEXGJcY2EoYUWtKqtfW
 1s0kFhuvHt4B/I8cxzqvpjPus60HOnUjC8EjvOydI/djWdvqZwKrHG4wIqAf/RZO8n6H
 0EAWkx5gCoa01an4lFMvE9zD4ikCbvoUK/zYL9gxWme2s3eTAMFDdBfi2ND8SJ3E9SEY
 PFRw==
X-Gm-Message-State: AFqh2koWRMpDQHD+I0Fe9F0nsQXY32Wpjd+0PV/wRcAeJjIG0f4Qu7ZE
 a8CBt3DRXCZZWWG+/SMD08s=
X-Google-Smtp-Source: AMrXdXtVQz3vUnk6SvLBb/uxtWWFs3KjCzby6fY2kylk/nf26hkuu2Sk6nOiS0bo0LRTvW+QMbKhXA==
X-Received: by 2002:a17:90b:520e:b0:226:ba10:14e9 with SMTP id
 sg14-20020a17090b520e00b00226ba1014e9mr2765079pjb.12.1672866911945; 
 Wed, 04 Jan 2023 13:15:11 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:11 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:36 -0800
Message-Id: <20230104211448.4804-12-vishal.moola@gmail.com>
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
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_range_tag().
 Signed-off-by:
 Vishal Moola (Oracle) Acked-by: Chao Yu --- fs/f2fs/node.c | 19
 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6T-00055C-Gu
Subject: [f2fs-dev] [PATCH v5 11/23] f2fs: Convert f2fs_fsync_node_pages()
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

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index dde4c0458704..3e0362794e27 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1731,12 +1731,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			unsigned int *seq_id)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int ret = 0;
 	struct page *last_page = NULL;
 	bool marked = false;
 	nid_t ino = inode->i_ino;
-	int nr_pages;
+	int nr_folios;
 	int nwritten = 0;
 
 	if (atomic) {
@@ -1745,20 +1745,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			return PTR_ERR_OR_ZERO(last_page);
 	}
 retry:
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	index = 0;
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
-				PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 			bool submitted = false;
 
 			if (unlikely(f2fs_cp_error(sbi))) {
 				f2fs_put_page(last_page, 0);
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				ret = -EIO;
 				goto out;
 			}
@@ -1824,7 +1825,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				break;
 			}
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (ret || marked)
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
