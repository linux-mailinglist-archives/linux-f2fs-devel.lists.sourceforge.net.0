Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF8AA535B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Apr 2025 20:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zfoqq8XX3/AkOUbY95tiGdCudFh1Ud0qtUGbHLv28rw=; b=IUxQww/Q6yDC4qVFfoonEhvToj
	TzQLJe8dWKqN44BCMzJfSCW5KnrwOQD9yWKO1lSFaCQOmnFzmKpcydsLHFuqnjEmoe9gIzyH8Cd3w
	f/yegiSlV04cI535hqH7n5TQAVNRrmIA39oSocvTQ/fhgUgD/8QqGjwv/1pQ00FM7Ja4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uABuO-0000dP-FJ;
	Wed, 30 Apr 2025 18:11:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1uABuJ-0000dF-P6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 18:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=; b=hn2aL7jY1FoY3cVAvcxs42onPM
 MhAR7EgNxg8cxxmuQqXF26FMp3KhmFwjcu7ShNmReMvdns3/hWI6+m3B29+uCTU3aU0BFN9VgITdk
 zbE41uiN1LJazrn2U80GpRemQJFCUP0RIn25LyHTLwEzurwwvQ49TU2cSfWhYkm0sK1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=; b=hKXaeXL7DhHHLilaUuyXBbosaC
 6OJW2hypnhteZ+FoWbkuMjTyiLYKt3RbgXcsxXsmt6+4cdwV8TmAHFS1vJw5CY6X7gOdvWFaVT5N8
 etUwzfSrKbZzi79hRceQIqb7VU1HCiCIEbZwQAOdIZziX5nLw3qgr+cELksZATUQ0L5E=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uABu4-0000mz-2M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 18:11:43 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso283277b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746036677; x=1746641477; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
 b=jkjOf59CN6w2UmfCEMbK0WH8mPVM4j8AVMieAtHHq/3wbwieCQOW2RIKMljsYzM05X
 4rqxVtszTcXYJ4VYONkxJmbrQ/8KJu+JNX03jLtblifZhu1lYqt1TdYIzdJ/qGepGMgn
 5r2tdA5urZc49LWwUrKvqcTRAqVSVazM9N1NoA40E/F55ptGIVJZkkwFvg/97D4dHiGF
 cMJEKSmqtubzrqMP9C/TaujrOG+wusd/RYxIWcvFmOj7Ei3lWeo5uekjklWI6v1JUFN3
 //0TJ9IWxaDrD50N+5DIy4g9xDBEf/dqJ0JZm2//ro3X3Y84Ad4p1LU0ik498KTemrLw
 LI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746036677; x=1746641477;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
 b=C/UfdbwDsCGjla52Fi7IALzbtRZOIK+Lk8xR/51YdKqsUKkSjw1SLqL07EmQde74dJ
 97pdadVUJyX8I2L7joDJfs14mB8e5yeQMdHVnVSY/Nk8G7nWSzvcYOBwNCbodicOYWEa
 f0njSQHaPtpbMWnP6vsO7kW3/x85sf12W1QIFlIbtg7lodgd9b9nv/UNx2FdDIRD5NAs
 gWQPZaTLWSA/RIllE72y75AKiO/w6lWAZrUENtZpF1A65X70hxvrXcqiCK+whSd3d2xY
 zA5aPufre8rEE+Abj9rhJVjDu/2yJEjRSxXP1P3X3sHxx0AACBJHwX2R516PiVaYJo09
 rQfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGH7n5h8V0IqG6SYb5tyJTxJDyObwWkTR8Uw9+InAlZaFywvB+n9bbFISoZcjWmyQ0Ov55tHx5Np2l6iEb02wB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyU6BwDItbb20ag5tpRo+i0r+L2w+WuB5ull4E2Qm/aRkLFlNQt
 ik3rHsOytoUMfeKe5vCRXscm379TMr03jUFoiMRlGhVjI1fqD3X9
X-Gm-Gg: ASbGncu6GwcL5Cdg+zZID6RQ9P0fMaKU7TVZD4rIPO+hIWYJszZPE7C3JZ4SJtfmNaG
 xqrBXmM5MMhL5DiAyLw9FaPD18kR553rXqMR17o256q86/AimvZkgrHLPKHP4rIyAREElpYNJ0M
 IdlVyOx/l3Y7EU7jH/AwsfHwW1ly9Zr1TLmyqIY8+F8UwVINjMLteeE5W3ZvvL130qr/tFyZRqu
 azcmLmlCllRY4Znaj+otIP4pSqorkg28Xv2wuKUz39KKva952muVf0M01LGNciXenzg5fWfh9w5
 2GwyVkYszGU0+VKGDoV7KMBAed/ca+sE+iK+vo+VLcPTT/SnYmgowHMR28BxGA==
X-Google-Smtp-Source: AGHT+IFui7W32qe/7oFPxgXqGuD21PFMOpd9VG8chpu1c5yNXFW+POaOkysCOWvmg5iIKChIBFoOWg==
X-Received: by 2002:a05:6a00:391b:b0:736:3ea8:4813 with SMTP id
 d2e1a72fcca58-7404613f584mr699444b3a.2.1746036677129; 
 Wed, 30 Apr 2025 11:11:17 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.122.198])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74039947976sm1983822b3a.84.2025.04.30.11.11.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Apr 2025 11:11:16 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Thu,  1 May 2025 02:10:49 +0800
Message-ID: <20250430181052.55698-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181052.55698-1-ryncsn@gmail.com>
References: <20250430181052.55698-1-ryncsn@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Kairui Song <kasong@tencent.com> folio_index is only
 needed for mixed usage of page cache and swap cache, for pure page cache
 usage, the caller can just use folio->index instead. It can't be a swap cache
 folio here. Swap mapping may only call into fs through `swap_rw` but f2fs
 does not use that method for swap. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.177 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.177 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uABu4-0000mz-2M
Subject: [f2fs-dev] [PATCH v3 3/6] f2fs: drop usage of folio_index
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
Reply-To: Kairui Song <kasong@tencent.com>
Cc: Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
 David Hildenbrand <david@redhat.com>, Chris Li <chrisl@kernel.org>,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Yosry Ahmed <yosryahmed@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Kairui Song <kasong@tencent.com>

folio_index is only needed for mixed usage of page cache and swap
cache, for pure page cache usage, the caller can just use
folio->index instead.

It can't be a swap cache folio here.  Swap mapping may only call into fs
through `swap_rw` but f2fs does not use that method for swap.

Signed-off-by: Kairui Song <kasong@tencent.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c   | 4 ++--
 fs/f2fs/inline.c | 4 ++--
 fs/f2fs/super.c  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 54f89f0ee69b..5745b97ca1f0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2077,7 +2077,7 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 	sector_t last_block;
 	sector_t last_block_in_file;
 	sector_t block_nr;
-	pgoff_t index = folio_index(folio);
+	pgoff_t index = folio->index;
 	int ret = 0;
 
 	block_in_file = (sector_t)index;
@@ -2392,7 +2392,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		index = folio_index(folio);
+		index = folio->index;
 
 		if (!f2fs_compressed_file(inode))
 			goto read_single_page;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ad92e9008781..aaaec3206538 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -86,7 +86,7 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 	if (folio_test_uptodate(folio))
 		return;
 
-	f2fs_bug_on(F2FS_I_SB(inode), folio_index(folio));
+	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
@@ -130,7 +130,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 		return -EAGAIN;
 	}
 
-	if (folio_index(folio))
+	if (folio->index)
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
 		f2fs_do_read_inline_data(folio, ipage);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f087b2b71c89..eac1dcb44637 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3432,7 +3432,7 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
 
 	/* it doesn't need to set crypto context for superblock update */
-	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio_index(folio));
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio->index);
 
 	if (!bio_add_folio(bio, folio, folio_size(folio), 0))
 		f2fs_bug_on(sbi, 1);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
