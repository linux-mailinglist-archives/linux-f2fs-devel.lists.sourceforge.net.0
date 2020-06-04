Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA671EEE81
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 01:50:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgzdM-0000Az-2k; Thu, 04 Jun 2020 23:50:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jgzdC-00008l-Ub
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 23:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gGiC0x+XOELAYzDMdHSU1D+PBWmFnPVamSFrmgYg4yI=; b=NU0oJpE9zeygbpxnzEVD1ZhqVo
 MIjCN1V8by4EJhMQBqY1oOT+H5YSQqkDSMd8DfMyLUO7qR1/W/RkF8EWhu2mk6fv80k3yXKBE2uuT
 uUbjgW8qJoUQjrWnrXHtmKs+xvGZUJ7P71uDmE1zrIZ8JaekdrAEkTquxZ2bOSGyeY7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gGiC0x+XOELAYzDMdHSU1D+PBWmFnPVamSFrmgYg4yI=; b=CQhe7lemrMfSiU61jq2LbxAb1d
 DS+Ea0Y2PlRgb8w+jkLPlGQbTyPjL52tlDHk5bHnIXTI6CSVeeOv5xh9nyyhmqljvcuJIvWIwZ8L7
 /4AB4p1W3DxIYQ8uLweqUcEqt9Sobxy5xCK2gilJxeXYsp3PfuKKEncxSK42E0ik6FZE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgzdB-0068Ii-Un
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 23:50:42 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E69E20872;
 Thu,  4 Jun 2020 23:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591314625;
 bh=u+5YnwWFFK5nlG26TpFp3tw/TxQAXscErfxMw11kdHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=12DhJ4j7SA82q006esRWoPp6vOrOhNNpd5/SGsziuuG2nsrgWgRBs8X1fCOmSkiu/
 7hDhu5CTTZDufKWiPU3Qabbm39ZYXLl43tsAqzpsKzd7LoHvD7VRvPzHMjJ8ocV2nC
 N6ttocMm+STaxGGsMhocOjVAwE7tSwTk9UiCCVxE=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  4 Jun 2020 16:50:23 -0700
Message-Id: <20200604235023.1954-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200604235023.1954-1-jaegeuk@kernel.org>
References: <20200604235023.1954-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jgzdB-0068Ii-Un
Subject: [f2fs-dev] [PATCH 2/2] f2fs: attach IO flags to the missing cases
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds more IOs to attach flags.

Fixes: d58f2f658159 ("f2fs: add node_io_flag for bio flags likewise data_io_flag")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2f5293eb5e52a..9d40db50cd65a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -702,6 +702,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	if (fio->io_wbc && !is_read_io(fio->op))
 		wbc_account_cgroup_owner(fio->io_wbc, page, PAGE_SIZE);
 
+	__attach_io_flag(fio);
 	bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
@@ -888,6 +889,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 alloc_new:
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		__attach_io_flag(fio);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
-- 
2.27.0.278.ge193c7cf3a9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
