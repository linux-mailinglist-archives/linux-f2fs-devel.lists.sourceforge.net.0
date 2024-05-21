Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0288CB326
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2024 19:59:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9TlZ-0007v7-6t;
	Tue, 21 May 2024 17:59:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1s9TlX-0007v1-JP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 17:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=; b=PopDquZH/QzwFguAuxHdeLYEjP
 6A1XFWYIA1DKy8ZS6VKtXdh2ohP1C5rnsqGmLsqv2EQNExetNoptUpfQETihqgB4/J+hoZLo7SfPt
 XVs1LH2RAz6zpAZ5SPvhC5vfXlAtF789uSFOVlhsir343NE2KVfbcqMAJFMO40lxNMpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=; b=ektiRFd8AKYwi3YAjMTc+WVE87
 cMASMxYmF2Q6uBPJ6p4n8XxW8Ajt+SUe37zV1K3plnHYwykYnupEKhSmT9lO5tHvblFm+DJXe7spt
 ZveBxDmLuJfk9itlAuKo5zkbe6PYPOPZqJFLG6jkwjHsWoEsgHc1ELkGk2cxImugJBMo=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s9TlY-0004JS-4g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 17:59:11 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6f4521ad6c0so594829b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 May 2024 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716314346; x=1716919146; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=;
 b=kEWTEc6fq1Xq0J6Xn+fZB9vgeiQ4V18gSLm5ciQdzdLD3NCQrrBymgJls6c6llq1+E
 9FYmnUHr1Q1LSCAMHdpx06xF0A+VHW5DoB5YhU+GDx+Ra2QoKLOnHT/VfouYHPuXZfdO
 VM9syPlVHHJkaM0584S1sY3CXrzRMlJYUrJqLU8hXuWqDNTZyiHqx1Gffa7l1vRKB4PK
 8MgRchNDxQ1XAEmxr/6MIaYDrU2QuPzFWQ5OeeZXQv0gv/C/HzpthL2w8vzIVTEHbUOC
 k42g1VJLhLY0q0emnTbV9GbE5JgsrTdDw1XmH166hZR5ZoQ4ogqDZLsn/tOUFtg+1MC7
 5IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716314346; x=1716919146;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=;
 b=KvnJDQ6oHUWl2s8tJzsEBSICS7Qdqvy9FQ7kVgRMGCIfTbtEsdzpBFVZviaqxBv+0X
 90NKrinQiSikaLRNNfgbQEfDHcZ3jYWGu819RcInsgfDJSu0JQVDdRBq3kt76hCg9D2v
 qNw/etRhYx2A79ufwaJJXreUjFDDrMCJUB9l/I4rS475tuVIslDAjqu+/55cCG+3jV65
 RNPdNzPWibKSIDWl831SlNY406tc413DJ11GibhVWCJuEar0xrYTAh5350tm9ZU3E3pb
 FHqeh1OpO32gOaCOcygzUUoefZatluQ4dwO2uRFDsg86/sKmSeMvvqrqq+DTnNBU1vjM
 0sTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu00vh/83FH3YvDMHp7SeNibuBuhVK4+KChbNaQg5l7X3a51+GoOIx21OwzOURbEN4Y4W+N50++Fa71WSmF+yYKiNlEevImUETXeNJGTSseXCYdBqS7w==
X-Gm-Message-State: AOJu0Yy52jfo8VsREDjGq0KEF2QRmO5za4+Bly7dyFMNBDSYrOKML4wp
 oUCuN1L4Q9nGWfxaeIrW+fKCUJrt7iFNqBTXwInWZ0SR0K0SCVbq
X-Google-Smtp-Source: AGHT+IEPpozMM0L+20HNGIEKpe29SmAQZrslVrxqPFNwn5ThpFi4hMV2N2JdR99RXw3BFqLPSnJwLg==
X-Received: by 2002:a17:903:245:b0:1e4:4ade:f504 with SMTP id
 d9443c01a7336-1ef44161e45mr347769925ad.46.1716314345665; 
 Tue, 21 May 2024 10:59:05 -0700 (PDT)
Received: from localhost.localdomain ([101.32.222.185])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f2fcdf87besm44646935ad.105.2024.05.21.10.59.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 May 2024 10:59:05 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Wed, 22 May 2024 01:58:43 +0800
Message-ID: <20240521175854.96038-2-ryncsn@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240521175854.96038-1-ryncsn@gmail.com>
References: <20240521175854.96038-1-ryncsn@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Kairui Song <kasong@tencent.com> page_index is needed
 for mixed usage of page cache and swap cache, for pure page cache usage,
 the caller can just use page->index instead. It can't be a swap cache page
 here, so just drop it. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.210.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1s9TlY-0004JS-4g
Subject: [f2fs-dev] [PATCH v6 01/11] f2fs: drop usage of page_index
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

[ This commit will not be needed once f2fs converted
  f2fs_mpage_readpages() to use folio]

Signed-off-by: Kairui Song <kasong@tencent.com>
Cc: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 961e6ff77c72..c0e1459702e6 100644
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
-- 
2.45.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
