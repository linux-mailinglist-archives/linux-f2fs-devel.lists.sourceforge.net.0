Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 315B9A9E443
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 21:00:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u97F7-0001iI-HO;
	Sun, 27 Apr 2025 19:00:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1u97F6-0001iA-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 19:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kiHWomkf3wcsR+tvD4RLDrQZNUBMxVnHVwy9itXWJo8=; b=XLooHdsoFNTmzHk4D7TthjRl7t
 8xGqQKINLGJ+Er5oz/rkGYsbTLMOiQHGq2Frt2PGoIEyXQVmUV27FXZZVV4XV+lSgTz5N/2qAJV8O
 RUSE1EISlZGzrFfQKWI9by62SvvvmxPmXJaSXjS2bQfD2Yi0rE4/wk4EwbKT+j3u8R5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kiHWomkf3wcsR+tvD4RLDrQZNUBMxVnHVwy9itXWJo8=; b=TGmEuaOnmt3UC8yMX/coIQFXcg
 vWMqF1eA45nQTe7PD+NIn84ztQJdCAfh6DmN5TXW0nW8YaLsx+ZVISbZd6d4Vm0+k+0gAju/Y0WXN
 a5Fv3+UU1B7iVivVtIPaEdzFwPAfHcdiJ9eCtnFXvHLXF7XkhxLoUJe9c2VXxtiCA95U=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u97Eq-0003Ni-EF for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 19:00:44 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-22435603572so45312795ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 27 Apr 2025 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745780418; x=1746385218; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kiHWomkf3wcsR+tvD4RLDrQZNUBMxVnHVwy9itXWJo8=;
 b=UJWzy2/YlwNci9OwODBNYY5N1xZjR6+PoIW5O0UIg8IH4hsA18lCn71FEnZyK4J3LZ
 e0PIauZWn9ZQrUlbADzafC1Tb9jw6k7Q9FK7u9sd/AB09nFV2c41CgyLCW7IT+yjPho3
 SrBPNz6Aa3DZ1PC4gCb38zUuB92bVeeSKpf9dLH/inavtImnFFV8aUZA5GVyDB2HMvp0
 FsrI/VL5EgOcN7XdsE0tle/5aiTrzCps8ivnWO4e46UVKGZQt2wRtQYNWvAVfUIJshpJ
 Z6DbfCcndzhfqfeai9N4MA+V+zsTHgBdIPj2x40Y2juDt9+yRUxGJJ7FM+eyEv1dR3UR
 rWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745780418; x=1746385218;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kiHWomkf3wcsR+tvD4RLDrQZNUBMxVnHVwy9itXWJo8=;
 b=qC634+uJUWysVQEFED9QY/+CYU9dRLHov66HQeruSmjEb1N9dA+eYe9AofRzCU/dJn
 bdob4yMgDsP4kXuDhbWtsCrQPhwIFOq9Dq8t7nJv7oestNYZ/4bLqeGAWi4e5c+4nz+O
 Y0JRBwrr844neNcez03+/PjQ4rUnliPOq/lV+Wr2ujAtdsL3HBdgYg0S4hxC5ztMPbVO
 ekf+2VqwwU3uD5N1k0YfHza6J3h8dG0l8SuhjaVBNMZQ/A3Z8TxahAGgkE5JyD/Qrf34
 SOTJLAYINJEnEiD2L0BucW4Dqb6U3010RjdX7dg086q6B5ORudz6UaGrtdtMPMoiHBGX
 XAHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnpNwQMuKJ8BBNKu93KbEX9cshGGke2w02CFg9lxIjsYHoji1Wmmc/i1wWkkv94iWz8D0pqIt1szNR7Lk8C26Y@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzA2mKV1BXU8q/rSNU+2P39KwG67GHQbpq2yv4MQQpxoNMTmPaE
 /Z0yB+kQyz4nuGNk8RVog4kxqAZk5UXlqP9KdCKSXrZYiF1Kyd17
X-Gm-Gg: ASbGnctdu5RvINBA44J5pxhgAErIyIedpkKXRPkjCmeG5Tf+IHLZ4G2X2nEhoJWgFaO
 F8d6XiFz2Kk5JJkDRJYhDLKK6PdSpdRqPe8P9zLh6GSW1NDuGykTfX6t9D7Y6Oj40GMRS7lRO2S
 Wag2Y3YyyXuJftNClJ9m7AShxlvoQQ0Itz0oBFD0yMZkmzbHOVnEaHXOTEzwX7b4dI7j2wRB+p0
 AYLR8t6CEEtKkFZC7dG9M4GkgpFRx0QzY50QfwQilPzqrO28jMxXdbEh8SN5wEtFWDaAQhkqRDo
 3jLxKb1J9Z5FlUfTjzruvbHOLQaKXRD2NDDnZzd11nQs6A9loqOKVZa8RGhSbA==
X-Google-Smtp-Source: AGHT+IFUylfVVyaQkdTj7G9SXw4aWzBB2+YYrPKPSQjJoZLloI+KVj4P63eCYK2iieWNVOo68Fjdwg==
X-Received: by 2002:a17:902:e18c:b0:22d:c605:a30c with SMTP id
 d9443c01a7336-22dc605a33bmr81867745ad.11.1745780417680; 
 Sun, 27 Apr 2025 12:00:17 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([115.171.40.102])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15faded554sm5862153a12.72.2025.04.27.12.00.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Apr 2025 12:00:17 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Mon, 28 Apr 2025 02:59:05 +0800
Message-ID: <20250427185908.90450-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>
References: <20250427185908.90450-1-ryncsn@gmail.com>
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
 folio here. Swap mapping may only call into fs through `swap_rw` and that
 is not supported for f2fs. So just drop it and use folio->index instead. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.178 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.178 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u97Eq-0003Ni-EF
Subject: [f2fs-dev] [PATCH 3/6] f2fs: drop usage of folio_index
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
 Chris Li <chrisl@kernel.org>, David Hildenbrand <david@redhat.com>,
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
through `swap_rw` and that is not supported for f2fs.  So just drop it
and use folio->index instead.

Signed-off-by: Kairui Song <kasong@tencent.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
Signed-off-by: Kairui Song <kasong@tencent.com>
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
