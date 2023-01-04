Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93165DE3D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6e-0003S2-0v;
	Wed, 04 Jan 2023 21:15:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6c-0003RN-9w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JTMc/Rft/vIyJlvWKFcn8nkQrf+O33NuNawnN6rRgI=; b=mrc3rNaom8CpNBDIvkuAZfEmjS
 3R+xCbn0VyavguCp83siMq2aSNTbJRK0H5PBCze8VQB4Lnjvib9uT5Wfuf2rv++T/0kkG9MDAeRyf
 AJysRcYkEdINcTPh8BHWNrhKEKsoUgV/MB0VTEcivmzhaL4/KPhMmCwfyFnBVcEZRadY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JTMc/Rft/vIyJlvWKFcn8nkQrf+O33NuNawnN6rRgI=; b=iq2NznYEWg5EsvHFJPhaZxNonP
 OtEJxQSY7ShN/iSYH3RtXjz9DlWivsA6fBsLCFcOc0bUWUYOArwagxQK/fbQ0RIzl6MwTB/nbOQ/n
 TmU868Aa/MvwBQVSXmXWGK1lFKdGwD2qsexlsivjiC2U5uumitGhIsTYYx4pEngom57o=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6U-00055E-UI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:23 +0000
Received: by mail-pl1-f180.google.com with SMTP id 17so37265115pll.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JTMc/Rft/vIyJlvWKFcn8nkQrf+O33NuNawnN6rRgI=;
 b=nqEuKaTI9dAXbJiKNF6NFVlHonYqdpnzDFZQRbj6c6q33P4q7zmgWoLXJ3cvwJxiFU
 R4EchBW4P9btK5EV2Ivos6RVjg1pCqpX1sdrjygOWSOWvR56x6MAcYlVYqzqYxU9e9pD
 7EqyoRZKmtKUIC4XqucME2BOGZCWoquaRcoAjwG6f440GMABya0GF45MLcEdcWoBQIPQ
 aSrPTzqxY2gV56movVnmY+sLkzpn2sZ/+NfGjAOpD0jKjJOna2t97nyuQoo/S3JNHjEa
 jJZ5wa0Qe7mURn1kHsaymS4r8Y1pr0V1FypBr74zDvcLsepES4cYIoRevgoh6RoBOUZe
 pZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5JTMc/Rft/vIyJlvWKFcn8nkQrf+O33NuNawnN6rRgI=;
 b=RgVJ/DYxsWFwOTfs/sGHSDcXj/SJjvqoBeasyxb4MZKYz73C81cBIFuk2NrlCZUEuP
 ydAj+Zix9IWYyx3JrP2uFzXnk3cgRAlXyynD65U+iKwWe7H1+oG5M9iLTO5ZERiClH8M
 RYZIMYw5yjfEA+I9ROoVNjrc8sRae1ruTiTqBjGAj5fGVS6F2MBVE1FOYda0avRzZIy0
 kO4hFt2/tJMQ+1XR2NumpLtvbuNlPSXCD898mdzy5FGlhuI4bKqFimXtc9dU3lPad+vs
 q5sBjk4hGaN7GY+kdhDAB8Z2xcefBHHXA0VKuMyDeykKaSFoCy5tzk3TKEO97bvmaMga
 IEvw==
X-Gm-Message-State: AFqh2krFx/lrN1ZBmuWxpDCyIZDYojUM4s5PwccBbRzRTajb+3wpAhpU
 37Q0hNMJcxTvXGDkjpZEp5w=
X-Google-Smtp-Source: AMrXdXs4LlgTrixclkrOcCZrpN6SR5Ezctmf4LJMRiV2PQ69qXIMCxzU7F8St0tY9EKMLcnxhYsTtw==
X-Received: by 2002:a05:6a20:8e10:b0:a4:a73e:d1e2 with SMTP id
 y16-20020a056a208e1000b000a4a73ed1e2mr72696381pzj.57.1672866913342; 
 Wed, 04 Jan 2023 13:15:13 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:13 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:37 -0800
Message-Id: <20230104211448.4804-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_tag(). Signed-off-by:
 Vishal Moola (Oracle) Acked-by: Chao Yu --- fs/f2fs/node.c | 17
 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6U-00055E-UI
Subject: [f2fs-dev] [PATCH v5 12/23] f2fs: Convert f2fs_flush_inline_data()
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
preparation for the removal of find_get_pages_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3e0362794e27..1c5dc7a3207e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1890,17 +1890,18 @@ static bool flush_dirty_inode(struct page *page)
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 {
 	pgoff_t index = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	int nr_folios;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec,
-			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 
 			if (!IS_DNODE(page))
 				continue;
@@ -1927,7 +1928,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 			}
 			unlock_page(page);
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
