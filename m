Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D36118A887B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Apr 2024 18:10:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rx7rE-0002VL-NR;
	Wed, 17 Apr 2024 16:10:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1rx7rC-0002VE-ID
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Apr 2024 16:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccxP7TY1LZd03lAzTUSjd/WMiiw2l1TFGZjibmTvaRo=; b=KClvubOG1hdgsUiv4iQ/913570
 7OxK5OsNSPj3VKypqhDoP59bCELRBPO6168w1VlwJr5ZO8O1lGrawNfE69hU5xbGd/C40fC1ynsT3
 WGCMClGPcYmc4rCCGEh2H9InnvEVszyeUDDonK2BOUwsMJq0ZXIDLbjmXpybk6Dko3Ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccxP7TY1LZd03lAzTUSjd/WMiiw2l1TFGZjibmTvaRo=; b=ClzIEMMqG6bYtcuk1ckTX2h2jR
 brX3v92oUF3Bk1FomBI637ONzX5cYybC/cDWnleBAiUW4Jcw7T3AosGLxmDnw7r9sqro7Ovp3Y+62
 24K07bgRf3MGhDv5/CGuQHrIlqXYDP4e461Mc+0lIzgoLH6VwWJGJ8mdTvYsNRFUHSe4=;
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rx7rC-0001wy-Df for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Apr 2024 16:09:58 +0000
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7d9480d96bdso204172139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Apr 2024 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713370192; x=1713974992; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ccxP7TY1LZd03lAzTUSjd/WMiiw2l1TFGZjibmTvaRo=;
 b=DhyL4P8UlEAmxh6SM5WGg/tXmDFYAqSjbYd7x7lBFtJaEf/CSFSYKoqRcQI8oAriZD
 N+BJF+L9C5UAGKjJfZorvxtn+vg7H5lv9bDCQp1/As+c/yzC2YZQW0gopB74I9/E5iKB
 d1011m8msrGaXW/NtXVeXx7JG37tENhXCeEUfzPhWjP0E9Y66kesMZE9iKuZZZemk5Nb
 690zjHJ0Ce/ceELwcxm4ltUav390gOq3QFasSHo05s875IE5hqck4awkrfsbf5bEhkDP
 mHllmcbFV5vnoksrGQ4qbWwwwXZqbJ5NSYbOpY2VuhYkQRLnQ26EY/H21VU3DzmQB1Bh
 9MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713370192; x=1713974992;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccxP7TY1LZd03lAzTUSjd/WMiiw2l1TFGZjibmTvaRo=;
 b=BoFtzjOAJ8Ss+paJZcjJblIOL1Z29FtTRphUcosLsZnjIgSRrryLo78MKvF2eRbSJX
 yb1iX0QN5DQz4y4+2My9JQ4sDwvh2tL8HO7ebg7rnleW3+LbjoD8GyKDxF5hTQ90hYzs
 5R2FrUHVjJHFy3bMId7vSzvt6uDn14MU3w1I4y5ci1uCOgHVSiB8XehH3E+qfduWpwAQ
 ZO1HCoe6v+NM50BgV8jWbtKFHHYXFkOmQRNP2p50CnVkiIk9SLBVl68nyRO8DslBSbn2
 5V22gDQXpzlV3pckYPjdYy101C98Gw9xkdDIue0vO6FRbM2Srvh0w5k1wd74VM+hy5AO
 pAJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX171ppw4+UYcpPVOlLag/VInKthbJqTbZOCO/7OsLXeW16UHm32TvPpIB2NXXUOVqrJxEbc+0Mr2b90wr74olYYeS9Q0LxsamfF9VCSJDa8CTxTOPlvA==
X-Gm-Message-State: AOJu0YylJswTOhxFqyBDjpqFoo02MAPYsAgEN8hLNbp2SQkJcPrEK31B
 a37jTAAhgZQgaChZUKVx7E3tQTRe3HKFkVE7T6NY18v90K/S2MQZ
X-Google-Smtp-Source: AGHT+IEpyaQ2B9laiL5Qz3xq+OgAsfHl508IHieRw4jQK+zsxfoW9aDncD8KQfXYdlyhnJK/CywmIw==
X-Received: by 2002:a05:6e02:12e1:b0:36a:1e27:1708 with SMTP id
 l1-20020a056e0212e100b0036a1e271708mr18563457iln.25.1713370192373; 
 Wed, 17 Apr 2024 09:09:52 -0700 (PDT)
Received: from KASONG-MB2.tencent.com ([115.171.40.106])
 by smtp.gmail.com with ESMTPSA id
 h189-20020a6383c6000000b005f75cf4db92sm5708366pge.82.2024.04.17.09.09.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Apr 2024 09:09:50 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Thu, 18 Apr 2024 00:08:37 +0800
Message-ID: <20240417160842.76665-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417160842.76665-1-ryncsn@gmail.com>
References: <20240417160842.76665-1-ryncsn@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Kairui Song <kasong@tencent.com> page_index is needed
 for mixed usage of page cache and swap cache, for pure page cache usage,
 the caller can just use page->index instead. It can't be a swap cache page
 here, so just drop it. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.47 listed in wl.mailspike.net]
X-Headers-End: 1rx7rC-0001wy-Df
Subject: [f2fs-dev] [PATCH 3/8] f2fs: drop usage of page_index
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
Cc: Kairui Song <kasong@tencent.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Chris Li <chrisl@kernel.org>, Neil Brown <neilb@suse.de>,
 David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Yosry Ahmed <yosryahmed@google.com>,
 Minchan Kim <minchan@kernel.org>, Barry Song <v-songbaohua@oppo.com>, "Huang,
 Ying" <ying.huang@intel.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Kairui Song <kasong@tencent.com>

page_index is needed for mixed usage of page cache and swap cache,
for pure page cache usage, the caller can just use page->index instead.

It can't be a swap cache page here, so just drop it.

Signed-off-by: Kairui Song <kasong@tencent.com>
Cc: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
---
 fs/f2fs/data.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d9494b5fc7c1..12d5bbd18755 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2057,7 +2057,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	sector_t block_nr;
 	int ret = 0;
 
-	block_in_file = (sector_t)page_index(page);
+	block_in_file = (sector_t)page->index;
 	last_block = block_in_file + nr_pages;
 	last_block_in_file = bytes_to_blks(inode,
 			f2fs_readpage_limit(inode) + blocksize - 1);
@@ -4086,8 +4086,7 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
 	unsigned long flags;
 
 	xa_lock_irqsave(&mapping->i_pages, flags);
-	__xa_clear_mark(&mapping->i_pages, page_index(page),
-						PAGECACHE_TAG_DIRTY);
+	__xa_clear_mark(&mapping->i_pages, page->index, PAGECACHE_TAG_DIRTY);
 	xa_unlock_irqrestore(&mapping->i_pages, flags);
 }
 
-- 
2.44.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
