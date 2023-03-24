Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C96C7880
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 08:11:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfbaX-0006BG-7i;
	Fri, 24 Mar 2023 07:11:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pfbaV-0006BA-Dk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 07:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZETkEfKj2/0zNH33wFebpLM6CNBk0DcgJ8ub7BAvqpE=; b=BbI9S+h1x8MEg8bnccO2awl1qF
 8H211Unoe4gEYuabaLF5vyeSM8HhoLWwN3W3S3ZKxadSkf4aWk5Ab2S5PQ2q6yLcfWomysvZLXngn
 zAjoKcK48ar0Uxt5+O/zii/Xco+OhBgR9dLkW4bloAeg296eWAj3WkjOWtGcn6ZX6mak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZETkEfKj2/0zNH33wFebpLM6CNBk0DcgJ8ub7BAvqpE=; b=E
 PQ3iIyOlz9E7ZLM7EVp69x/prauYIRjrIGbHiYWtTnaQBdyyGE+8TAKP5sa1R3YXJlbqjvPKOfvwD
 tU5eMi6oNUv0UrNoiQB/W6yIzZjnp70Y8dfeSBOn/NVxpPbmBi+gEHpW5XHym9whsxsvuUfwJ0Qfy
 sll/vGxW1eFYsnyI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfbaR-0001Ql-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 07:11:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E68E46293A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Mar 2023 07:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0639C433EF;
 Fri, 24 Mar 2023 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679641892;
 bh=fd449v8qUAZkDHI6JVneORMPbA4ytiODmJnf767Az2E=;
 h=From:To:Cc:Subject:Date:From;
 b=Ifgg7zI5WbqRt/wqU+zoY5M6knul1KM3tbF0F9zWBh/P/F0IUZoA9U0oA8fJLKqe7
 XFu7rjzuhLE0JGqH5oTfrqQNn3akT63mR4zyes68LX5vvspHXTFAAE6VTP1+HwX1ai
 6o/ZQ7DDwUOX1YVudxWf0iQUWdDZM4wEAUNkPPGqFabR7y9xGIULR1Nq2rd0eKXwP/
 OLM3xaXi9QdTa+TQLOwIKvifuaPlCBCQwGHcDNFx1BN3HPmm1x4F3svRGykC/4S1W/
 mL682Ozy7WyDe40UAdex1veILvNgqTaN8aVQe/cZaogmNTU4W67Emo6fZbLQ5822I9
 l6nWibBrt4IwQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 24 Mar 2023 15:10:28 +0800
Message-Id: <20230324071028.336982-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to reclaim free blocks in prefree sections before
 latter use. Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock
 in f2fs_gc") Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h |
 1 + fs/f2fs/gc.c | 8 ++++++++ fs/f2fs/segment.c | 1 + 3 files ch [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfbaR-0001Ql-4Q
Subject: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end of
 foreground garbage collection
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

In order to reclaim free blocks in prefree sections before latter use.

Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/gc.c      | 8 ++++++++
 fs/f2fs/segment.c | 1 +
 3 files changed, 10 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53a005b420cf..b1515375cb4c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1269,6 +1269,7 @@ struct f2fs_gc_control {
 	unsigned int victim_segno;	/* target victim segment number */
 	int init_gc_type;		/* FG_GC or BG_GC */
 	bool no_bg_gc;			/* check the space and stop bg_gc */
+	bool reclaim_space;		/* trigger checkpoint to reclaim space */
 	bool should_migrate_blocks;	/* should migrate blocks */
 	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
 	unsigned int nr_free_secs;	/* # of free sections to do GC */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2996d38aa89c..5a451d3d512d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -132,6 +132,7 @@ static int gc_thread_func(void *data)
 
 		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
 		gc_control.no_bg_gc = foreground;
+		gc_control.reclaim_space = foreground;
 		gc_control.nr_free_secs = foreground ? 1 : 0;
 
 		/* if return value is not zero, no victim was selected */
@@ -1880,6 +1881,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
 		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
 			goto go_gc_more;
+
+		/*
+		 * trigger a checkpoint in the end of foreground garbage
+		 * collection.
+		 */
+		if (gc_control->reclaim_space)
+			ret = f2fs_write_checkpoint(sbi, &cpc);
 		goto stop;
 	}
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6c11789da884..b62af2ae1685 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -421,6 +421,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 				.victim_segno = NULL_SEGNO,
 				.init_gc_type = BG_GC,
 				.no_bg_gc = true,
+				.reclaim_space = true,
 				.should_migrate_blocks = false,
 				.err_gc_skipped = false,
 				.nr_free_secs = 1 };
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
