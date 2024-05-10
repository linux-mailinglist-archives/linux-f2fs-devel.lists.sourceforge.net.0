Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EFE8C23E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 13:50:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5OlG-0001Z5-EF;
	Fri, 10 May 2024 11:50:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1s5OlE-0001YK-LX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 11:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Reply-To:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=; b=NjO57g+xj6zcgA3e+0B3zbgsH/
 cYDy1cd4zrjZEZr8QDGnSvz3OU7G2ZNPI2VBmU02m7avoIZZ8L+PMHkkYQfJCUeAO9J0khoUdZblh
 2vet+DDn/zoVGKzewjR8H0ryNTjJZn2ogByAFoMsI3Qd9ETIiZZ2yZslMY5tSLxpEkj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Reply-To:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=; b=DxbCX+EONNutnVHuJkHEFyq+kM
 9i4oVwFuK+0BO2QfnMbHoxLcOnHl+0xNk5CXiHDeM2NA797nC5EkPtXKrzJhDUxI4cXtH703z8r9B
 8nTt+uryThn2ngzhLAMu+woh9PxnWV5PJ+Caplcq5m364PIPbLFOyisg8YdOz9vI/11I=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s5OlE-0003ER-8V for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 11:50:00 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f0537e39b3so1579595ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 May 2024 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715341794; x=1715946594; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=;
 b=S1cOyNRyP89QLskVuR5QgtPv65kYhSYsD8LiPJi9XIAFm8BTGQSuDBThjdBIkVR8TD
 pRjGZaJNMXGrIbHbdpz8/vUYbKN16/UXbUeqdQlbATpTkM8yo44p3muv/11/Pz30DtfD
 yPQ4uBhaX7xckxolVCVaNCstuK0W5cb4Lig1X09zz7Q50w6shISJMSxNZ03h+d7neX8R
 gzT8gyARqUekfUqp5Dv9KY5N+XVAX7etLxBUQwghljtbl6feI6DOU+ocPGeMWjMwiPUV
 tgsX5gF+cgrKBNusaLu8IEQ/WsSEJAx/rqwTdDxYIyVCYLeWTJMPUKS0TUV/jRlYjkWV
 HLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715341794; x=1715946594;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R7lhdO5v0hVN0l2qTLtMelKVtmq+aBFR854K3Ld5uQo=;
 b=JveZLEAnal3j57aMvofqE1ODHfyzdOKDfgnBmGeixGzUejgDtdpt6gbJEwbTfu6TaB
 rA4P+xSQp3XRiY42rzL/qr6kvWM7B9BOe9u8ZCuRQtMJX2Q0OF1Eln/mW2NpUDOPPMKf
 S/7SVmbnmHvHULZJIWQA4g/bjEEAN+aNNu4KAp9ioMDf4ugEiqY0Mbo6rXLeFwUZHyxS
 DjCbiYQpudeBpIZcYujsOdrLdUlW805u1X913N8cmGkGw5FPbA5UeLM+qt90xbayinj8
 /rY4xBQydVjlBReyN9m82xaR2z/YKWYxY/5NRZy42wJaA3q2JNJxbE3BrGo6xWA6L3Ic
 VFpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHe9FJVoVkop99RFIPWBxHaM7b7PYZRnTG7xem2Tas3TA2BJNay8xjpNmCBp5bqQu6JPe4aqcCgp0MlZJPaKUVyIohWKlwSrTQBlX34lhaEprZ0fC3/g==
X-Gm-Message-State: AOJu0YwjXrfwwuWdoGKF38LjaC3Au5LmH8STd5DoECKhdaNnHe9AOwdX
 uzqSU0GDFcerCkYinHYJXSLRz+TNs97gAu+MTyfYEwd8dBxaGjW2
X-Google-Smtp-Source: AGHT+IFE2MX7TpHnes9SKnTNrFmEbBsmeG5v6bapWIi2SW3d+oyDfBCDoaA4IMTDGi9eLDl7rTjLlw==
X-Received: by 2002:a17:902:d506:b0:1e4:24cc:e021 with SMTP id
 d9443c01a7336-1ef44050595mr28789215ad.50.1715341793856; 
 Fri, 10 May 2024 04:49:53 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.20])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c134155sm30183825ad.231.2024.05.10.04.49.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 04:49:53 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Date: Fri, 10 May 2024 19:47:36 +0800
Message-ID: <20240510114747.21548-2-ryncsn@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510114747.21548-1-ryncsn@gmail.com>
References: <20240510114747.21548-1-ryncsn@gmail.com>
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
 high trust [209.85.214.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ryncsn[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
X-Headers-End: 1s5OlE-0003ER-8V
Subject: [f2fs-dev] [PATCH v5 01/12] f2fs: drop usage of page_index
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
