Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66EC76E03
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 02:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVq0ihrTNdRfsN1xcvhvstKMWSQqNnTEXwyPbKgv2VQ=; b=b3flVWaCe395hPn0kmvjjA9tLY
	FuoNrWgoaXDSReHSL0fdJdbEbENbn2qk2agjtMamJhi/xv5fVuXyqnq5Db/Tn49n9M2uMtBvXIMwX
	A7YZbSbaqdpmF6Xavc1IjAMZUbxwH4nU3BDtb+ibK8K4IGV6T3X/Mu7VItXkI3/toqrY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMGAF-0002k8-Jz;
	Fri, 21 Nov 2025 01:42:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMGAE-0002jz-Mw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPzMBokgUxD1zy+ejZZXxXlbYOojtD6KIaCGEfPPNBU=; b=A6DqeCTlGm1AF5f0/puD9cQhmg
 1KVu+EmYBRnTDPNaXd3yh1QK5CVb7v09jO/BuUaDN+VYHiZkEfnFg8NgoPROLs2mjMwXfATnGlEME
 JpMbD1Gt7I5XUHPrLk7G+IOMeHlSFJn2Klw8/Zknapf9z5PHi4aHnTeFqE42DCOWNxHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yPzMBokgUxD1zy+ejZZXxXlbYOojtD6KIaCGEfPPNBU=; b=V43gQ+sRUA7jXqlAeWmBBviXPR
 IQle6lhOasLl4HPZD+J2D6ybqdGozdYyaCmT0nTbhfqlaH6QpDzHMhPD3sw1nPRCQRJ+gyD4p+GKF
 ++39Hnzxa6rEMVEV2BylDtiZwqwtxHrJRezBcYfKd5uQtHY069cQ6KhvUgnHuCBq0lC8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMGAE-0005RN-7k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE09143B9D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Nov 2025 01:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF77C4CEF1;
 Fri, 21 Nov 2025 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763689327;
 bh=pgHvA2TK3yIfyEQY0xbsNCMyz0hTFjZE0URPIaBS6/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mg+rkKhnOL8zhFrQRljvt+QBzExONGBWRZfRsS9ayEQS4PXcTpED0aQgB+bB6dlhZ
 VZNPRUHlIEeUVGnxTOJA/EclbSZrx77O8d1jR/r5+GYXM6Ev0gLR6pzpM9w8fLWoNZ
 LBQERBdDdouK5FelHBdndLwT4tzS0udlT66Wt8iOVFFl/CwP6MZj+FOr+LFURybhvF
 UvwW03cm/mK4yMFb7RsVgir8EvFIrA+vDmdMMqklASv8eepHC7p63iuDHVmGEu+/sp
 s8bRh41+TdZ0Mx1FRB2UIddCk345+k2tyiyE/Q7oLvUFyu36Ax3ddolZvaDmbbIZsB
 tBsQv7499MT1Q==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 01:42:02 +0000
Message-ID: <20251121014202.1969909-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
In-Reply-To: <20251121014202.1969909-1-jaegeuk@kernel.org>
References: <20251121014202.1969909-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a tracepoint to track the
 f2fs_readahead_pages().
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c | 3 +++
 include/trace/events/f2fs.h | 43 +++++++++++++++++++++++++++++++++++++ 2
 files changed, 46 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMGAE-0005RN-7k
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add a tracepoint for readahead pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a tracepoint to track the f2fs_readahead_pages().

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c              |  3 +++
 include/trace/events/f2fs.h | 43 +++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d95974d79fb3..c80d7960b652 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2757,6 +2757,8 @@ int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
 	if (start_index > end_index)
 		return 0;
 
+	trace_f2fs_readahead_pages_start(inode, start_index, end_index);
+
 	nrpages = end_index - start_index + 1;
 
 	while (nrpages) {
@@ -2768,6 +2770,7 @@ int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
 
 		nrpages -= this_chunk;
 	}
+	trace_f2fs_readahead_pages_end(inode, start_index, end_index);
 	return 0;
 }
 
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index d406b047c50b..bb98a9655ec9 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -618,6 +618,49 @@ TRACE_EVENT(f2fs_fadvise,
 		__entry->advice)
 );
 
+DECLARE_EVENT_CLASS(f2fs__readahead_pages,
+
+	TP_PROTO(struct inode *inode, pgoff_t start, pgoff_t end),
+
+	TP_ARGS(inode, start, end),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(loff_t, size)
+		__field(pgoff_t, start)
+		__field(pgoff_t, end)
+	),
+
+	TP_fast_assign(
+		__entry->dev	= inode->i_sb->s_dev;
+		__entry->ino	= inode->i_ino;
+		__entry->size	= inode->i_size;
+		__entry->start = start;
+		__entry->end	= end;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, i_size = %lld start: %lu, end: %lu",
+		show_dev_ino(__entry),
+		(unsigned long long)__entry->size,
+		__entry->start,
+		__entry->end)
+);
+
+DEFINE_EVENT(f2fs__readahead_pages, f2fs_readahead_pages_start,
+
+	TP_PROTO(struct inode *inode, pgoff_t start, pgoff_t end),
+
+	TP_ARGS(inode, start, end)
+);
+
+DEFINE_EVENT(f2fs__readahead_pages, f2fs_readahead_pages_end,
+
+	TP_PROTO(struct inode *inode, pgoff_t start, pgoff_t end),
+
+	TP_ARGS(inode, start, end)
+);
+
 TRACE_EVENT(f2fs_map_blocks,
 	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int flag,
 		 int ret),
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
