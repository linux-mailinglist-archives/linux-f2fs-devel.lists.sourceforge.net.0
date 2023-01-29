Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14E67FF79
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 15:08:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM8Lg-0007bR-R6;
	Sun, 29 Jan 2023 14:07:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM8Lg-0007bK-2B
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 14:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1z+iCS46Yr3lm9ACNgc7qodB+R5Gmf1kYOzItj9dp4U=; b=JoMYKbtmyOXiBr0C5ZZxTXXQYC
 2eHNG2fwcjGDXUOVW0DNOC17f7qFfMBD15P4qujTXlFfqqbmd7q2KSmXdCe/CHBE86nx+EGQhCq7o
 LBGnVnTa/OPIE77hfJmB32TB0Sr2ESwZeZY9MRCL554RAkLLq67OsLEyuvMLtGD/0V+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1z+iCS46Yr3lm9ACNgc7qodB+R5Gmf1kYOzItj9dp4U=; b=W
 FcSJaru1gUC0G50F2ZL5W/DrutYLtpKhgJV7OL9qZ1HQfK6uwbJW7oORKtKoche73on+Q8KHHmQEA
 lJGlBK6ZIpv3Wj6V7XAoQLVncR4LBtr/q7NRlLUAbFxEcYxv1yl6cbmLl+botfIVuk0VavCDSpJQp
 1kHaiJBZ5FHyS8Uw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM8La-0003Fi-SA for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 14:07:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9F2B60D40
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 29 Jan 2023 14:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E340C433EF;
 Sun, 29 Jan 2023 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675001267;
 bh=bivgQD4hccIujFULNfSi51tGjZlhLoS4MaUhofH0cSc=;
 h=From:To:Cc:Subject:Date:From;
 b=JqAp/Hc9UJhdXEb1d4OF6T7gLXjUOMIttzWm4qjncnt6y+JzSfVCQlRw8zBxhOIDh
 aFvOiUOp4J79fM36UPDgJe9yGWrciOioFsS1CkJ3Y8W2kj5LzXQ8ZZxsR1sxGr8/zw
 7020xN/e1BWTLpQjF6iWtgkKYqjaihUyBzDmbU8TWxDLTo9/wykwiOTYq9kYfE9m64
 K8ndYaMC3KLaf4z1mVTUHq7e0Ta3Pw5ST3JlRsfEbGqotqEhc+FFTHNNyrCH8P+NPW
 KEUs8cIxn4NQuGmb59oDphE2bXorgTMF7di9Ips+jrES/1PGtKPw/p+9g7wq4c51TO
 WD/O/1vgXducw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 29 Jan 2023 16:30:45 +0800
Message-Id: <20230129083045.7754-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch tries to use bitfield in struct f2fs_io_info to
 improve memory usage. struct f2fs_io_info { ... int need_lock:8; /* indicate
 we need to lock cp_rwsem */ int version:8; /* version of the node */ int
 submitted:1; /* indicate IO submission */ int in_list:1; /* indicate fio [...]
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM8La-0003Fi-SA
Subject: [f2fs-dev] [PATCH] f2fs: reduce stack memory cost by using bitfield
 in struct f2fs_io_info
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch tries to use bitfield in struct f2fs_io_info to improve
memory usage.

struct f2fs_io_info {
...
	int need_lock:8;	/* indicate we need to lock cp_rwsem */
	int version:8;		/* version of the node */
	int submitted:1;	/* indicate IO submission */
	int in_list:1;		/* indicate fio is in io_list */
	int is_por:1;		/* indicate IO is from recovery or not */
	int retry:1;		/* need to reallocate block address */
	int encrypted:1;	/* indicate file is encrypted */
	int post_read:1;	/* require post read */
...
};

After this patch, size of struct f2fs_io_info reduces from 136 to 120.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fa41c0dad308..f2f201e2a6a6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1212,19 +1212,19 @@ struct f2fs_io_info {
 	struct page *encrypted_page;	/* encrypted page */
 	struct page *compressed_page;	/* compressed page */
 	struct list_head list;		/* serialize IOs */
-	bool submitted;		/* indicate IO submission */
-	int need_lock;		/* indicate we need to lock cp_rwsem */
-	bool in_list;		/* indicate fio is in io_list */
-	bool is_por;		/* indicate IO is from recovery or not */
-	bool retry;		/* need to reallocate block address */
 	int compr_blocks;	/* # of compressed block addresses */
-	bool encrypted;		/* indicate file is encrypted */
-	bool post_read;		/* require post read */
+	int need_lock:8;	/* indicate we need to lock cp_rwsem */
+	int version:8;		/* version of the node */
+	int submitted:1;	/* indicate IO submission */
+	int in_list:1;		/* indicate fio is in io_list */
+	int is_por:1;		/* indicate IO is from recovery or not */
+	int retry:1;		/* need to reallocate block address */
+	int encrypted:1;	/* indicate file is encrypted */
+	int post_read:1;	/* require post read */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */
 	sector_t *last_block;		/* last block number in bio */
-	unsigned char version;		/* version of the node */
 };
 
 struct bio_entry {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
