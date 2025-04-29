Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696BAA0AAC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 13:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zfoqq8XX3/AkOUbY95tiGdCudFh1Ud0qtUGbHLv28rw=; b=Q+863ulLzFp39/mpE5uanPAytf
	zoroVhPUNJfTDhBzTIlBUQ8DKu1R+yPA+KZwIALsgGwrsvkuOWaXwsDaqs7AS7s/u4t69Xxr+BylG
	iHw0hed6dCp2c41GttalLZnjFjCFN2NsOzIYUqD4mhH5O6x4Fqh2SDqMYSlT2+miGnZA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9jUE-0001Jx-8Q;
	Tue, 29 Apr 2025 11:50:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1u9jUC-0001Jl-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Apr 2025 11:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=; b=a1jQVidmMnZBLxPz0QvLUii+EX
 esftAULWUj44oW4EzTSgFA57B2si6b/OuNGSQ3RzNLC2w3yC09U2PfsvJChMGUwiuKHdNhvKcJVWR
 g31LzzYLBurvFwW4qfu+9UAPBAtEjghJ0tAy8Fk0tTUWbPrA73lLO439BwdxESckE1Fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=; b=mJ7ZCzokrDtCiS7cv8hP7vLR7C
 pgH+QBy5af5M75Ia8JEERvHIUnlClpp8FEeWA5t4JXUifvsEVrlw1M428dI+35WWkmroKzCicUH2r
 nGQtkd9BtzUvAdwFf6gVZT+5FUu+6gAGorB0oK9FFFUHTwSzKWykTmP8X5iIR8yUm8Os=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u9jTw-00016n-Q3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Apr 2025 11:50:52 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7396f13b750so6489529b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Apr 2025 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745927431; x=1746532231; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
 b=dmHz67uGaCNawI5KzUSYeRn9e7tmN65XOcwA2u3SuN2451kdNKAJEg2AMyoKNUw9o1
 aeq/ojjeZ5owqRD97RsYWMIrCUgkFUuE3wk8E11cT058wHffkV67f5vDCc24x96e3iDt
 sblIjliIjxJo2YVUwT6Ebrcz+xxwbwyQs6kEw2sHFvGnLMF3lhpPPFPV9Ko85CMfiT1Z
 dHfwgoRrDUH2tG8t2Z0rIzibet69rVuWOBcnuMuEt+oDRgyFpnGLASJ6teqKP3kv+ejk
 eZ3Yk+fUPP6DCsx35Qq7kJ787cwb2YbP5leXTUFzEltyCm55DePNdvAKZCtwL7EXnE3R
 2IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745927431; x=1746532231;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRi4DVQ4l2yFg1fX4IS9tDs6tW+LC63jcXq9t1eYUbg=;
 b=GL3y2QymSDta0E0nLMX2MPXzUKtyhYnq/eQ8IBt+Ftj69fKMBaK7gIpOlF1YCfQxu6
 mV7QOhd5VjQgxpETmDDUZ39pTFeDHCSbqY0dia4l0JG7Sr1DAncSoI7IB2lyxZGTKaOk
 oa/11ZNDQlMZzBu+gwmumz7uMNnv/kW5yhSLsbShqXu4Ddg64L4KKzEvoqmpERgd5myH
 2fVvOeKfM3RAHnp0QwFNPLCo+gnisyUvwJyshMcy7md3b9XAT9u2splrhbfm445psweP
 poeXXCObqwYiwMvGLzrVf0uRzYG7dPfyig84Kdzvx0WTdZNenx9FwD/xN4doT5DUb5wI
 OhFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX90AXAE6Xhu/bFG0nkGDt0PliPB2tU8YGEiIMRJRwRn/o2lkKfERDgT5NcC/GrfdVa/6uzSnL9vwAz4AWHLqAp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzXK99DzrH1J1j1i6/ssD6O3HuRSabh0L0RB0V7fxEDVhJ3zQsx
 8EwBgu9vpIxKwMqyC9w7/F+vsH1KMFal0me4z+V8rXZompA6yTjF
X-Gm-Gg: ASbGncssaaBE2F55Br+YcyGzyMTc1BmtrWp9u8DAXN3nBN21cI6zDm0iryrcSFb3efW
 Trb6Ubuag6sBvKptfAyKbtoTewiucIhcj33Fregn9egiBo/s4HT1i6jHDQ6in3cYCTB0WatZYiA
 HSiTuktMXWurWo68ng2YJ4Y3sdb0i+w/7L3Lgficua2HptM+dUGdBgyaZRS7g4/IsefTgS2OsFg
 R0CzolK6sfJlWVeMbRRLMFfsUdQOICwMoYFJaDfXdTI+FXtG5TIpcff8wLs+ne32wDqM+Jzur3A
 9PoHcDTuZzK+IbVaSHhsGhSW+MgG2IsnSfq4a1mSFr9x2VvbmYxLNS0CUCDegcTy9g3uMtU=
X-Google-Smtp-Source: AGHT+IEoriRK2NyH//YcoOQqQiNaSwS5WKzp7Q2fF6Hs41CP4tZDUS769rp7JmgItvGnje7zbfgCvg==
X-Received: by 2002:a05:6a21:4a4b:b0:1f5:59e5:8ada with SMTP id
 adf61e73a8af0-20958f841c3mr3725562637.4.1745927431033; 
 Tue, 29 Apr 2025 04:50:31 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25aca62csm9661644b3a.167.2025.04.29.04.50.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Apr 2025 04:50:30 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Tue, 29 Apr 2025 19:49:46 +0800
Message-ID: <20250429114949.41124-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429114949.41124-1-ryncsn@gmail.com>
References: <20250429114949.41124-1-ryncsn@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.171 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.171 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1u9jTw-00016n-Q3
Subject: [f2fs-dev] [PATCH v2 3/6] f2fs: drop usage of folio_index
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
