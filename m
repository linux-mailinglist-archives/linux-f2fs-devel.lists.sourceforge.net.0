Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30A8B96B7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 May 2024 10:47:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s2S6C-0001dX-LA;
	Thu, 02 May 2024 08:47:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1s2S6A-0001dI-UA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 May 2024 08:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WSvD/YVvY3oR/SV9lrJcxmGa9WfASg1z+eMVQdwymCU=; b=Cr4ubh3FtfTmiuMkQCVHCRkNXG
 VNBKTkxnWqYdO7xIo3OnCQM7yyOh8GSd+5mDKL6eBR+N2ePjkVTjvaT9Ez+Bxiv70/qxXoifjExzF
 qLlyWC51+fnkyjo6nNeICA+8JEIjxu3mSpQlFIoniXGrUV/b6mPzXoqcHvV9NmMEKPqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WSvD/YVvY3oR/SV9lrJcxmGa9WfASg1z+eMVQdwymCU=; b=AV5F1OKQ9Vqbz9CajGPjdbTk8L
 wZ8hfevoeMeGeLMkSHTOiywWf8BdSh4SuMig0CgzYMCF98hR25RN7r2iEH7FZxOdMdVYxVDjlqyUD
 kAMsLI+HHqLrJFc0Pv8LCUZ11j5DVtox8g4XqusgxkIWqVx2wvlVOVixQvo55uockX/o=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s2S6B-0002zg-15 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 May 2024 08:47:27 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e4bf0b3e06so76097735ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 May 2024 01:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714639636; x=1715244436; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WSvD/YVvY3oR/SV9lrJcxmGa9WfASg1z+eMVQdwymCU=;
 b=khEFvbJSsMPNEF3b8++73GMtb3UFSMbEpJY0Sgl8ShpTIlBl4pBce+ciz2bZ0gCClg
 6/X8p4Hf05mYwLZoUjx4/BB+qwafH9RAPgKqaKqnPINkrerMXrujGJe4AtxTr/h9BEzK
 eIAwgp4VJlKtj4AaXvsXsrSAPjBGn8/ZLhI33oAijWHrFSzqDsTf9qM/WHCgwt4Nonu0
 2/ruO/afm1Y6OcjAK6oKMG2Vsqz9VmHwUhLGBo4PEFUi1SYHz84Z+0Yn7JUZuUgTzt8l
 ifooElB2O7paIyd1u7GZbVCPwFQmvfV5rDRBD8ZKTbNRil1mWrdTU6GE6Wk7GPHYaCK9
 QVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714639636; x=1715244436;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WSvD/YVvY3oR/SV9lrJcxmGa9WfASg1z+eMVQdwymCU=;
 b=TwQESvlpO8Cyt981rFJzMHExksragPfu7LuSxVzntFLXCjfR+wRe1Ep+1PA6nhrQLo
 cRk7Qn82pGfdEmFemL/mjR9RhRHo4l2KIX0ctC1rbN6kZ04Gv0sn3zGjAejCNS/0PKa4
 WIq2GP/ptJSNsy/iWqFplG/BPI8TleCDBRZGYiS8ZTW8Dz2y3QDPnsqj5GAtu7Qb/A+o
 4wknUaC93xM7zRTpcxvA0O8O6hijfi9NHxUTaYOjA4C/XkTnrMYd246aV+dvygseOiQ7
 RZi//BXoei774Fmg9aESY9sWk/wxU9NRLLwAobt/U3lwX7xp5cCvYt9I5IsV+pzhhLKP
 fzYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIISDBZ4tUwFwO0NbgFyKJFAAhqQCyR6ZLNobGenvnbGtJFEtR75NjYKYGoAJLdb1QiYLvQkxgsQIT/sX+mmKlZBiMzH7W6SkUcSiyHN/Vk3QuS9tFEQ==
X-Gm-Message-State: AOJu0Yx5b+fGSVC+4HIIQoUOxWU96bW4hKYT4aAKWM6JLcldWc3MPj/l
 IymFlt/rcetJ9yLdyFdn+Ya9GOH+XIqytUZCmpKzvh4ALJsGUqhV
X-Google-Smtp-Source: AGHT+IHHmKPYxmQ1NnctSOq7P493kmk6LeLXH7PC/dx0NjjiKoIYGnc+kgONRssyDz3JCfG5GAiMeg==
X-Received: by 2002:a17:90b:50cc:b0:2ad:da23:da0b with SMTP id
 sb12-20020a17090b50cc00b002adda23da0bmr5630235pjb.34.1714639636249; 
 Thu, 02 May 2024 01:47:16 -0700 (PDT)
Received: from KASONG-MB2.tencent.com ([1.203.116.31])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a17090a938600b002b273cbbdf1sm686805pjo.49.2024.05.02.01.47.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 May 2024 01:47:15 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Thu,  2 May 2024 16:45:58 +0800
Message-ID: <20240502084609.28376-2-ryncsn@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502084609.28376-1-ryncsn@gmail.com>
References: <20240502084609.28376-1-ryncsn@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1s2S6B-0002zg-15
Subject: [f2fs-dev] [PATCH v4 01/12] f2fs: drop usage of page_index
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
2.44.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
