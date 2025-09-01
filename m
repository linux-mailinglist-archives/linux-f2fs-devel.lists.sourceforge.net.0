Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65FB3D686
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Sep 2025 04:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SEOXFg8qUU+57VlzCprUxyk18vvZzIVeUa8u/pQRB9Q=; b=Qk+q6HpLIbaez6veWN1TdFN6BD
	eMDGZM1OPdY3aCGAaPLUkfo/4OKwiCnOTpWpKfEK46dnSL49KIt+oH9Ay0dfVZ4xscTN92TRplh6c
	qxNMFNbClDsR/QxJDJvYq+QDId6Oo5HqtZM1xNkiv2Fcsj0z887r9wX3AMPjdnYmoFnc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ustuK-00047Z-3o;
	Mon, 01 Sep 2025 02:04:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ustuJ-00047O-2u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qXlD/q23ZgY/eIVdpXKbP+qtuauIJ2rNluuBJI8QDo=; b=CQuYf0VZLq4+9ceqYmLfplbCeo
 yNNYpoiHTSKz9A7n6YsY1ynyXRvk83/bUOgfc1OTxZqOTxoscOmR/QK0J1bgdBYF+o+lwk7/6Sck7
 QBr2CjzGJCYBEJAa0wbmRCtYbHkEhLngrVsiQYFm2wAO8XYOI/bjM6gL63x4arlG9nHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5qXlD/q23ZgY/eIVdpXKbP+qtuauIJ2rNluuBJI8QDo=; b=D
 CoenDifPa/VZILWQuTP37pNEdUeF41cIrMYIgJ7ka2TATu0JtZrIbIkcveTxjV57d8v5HZSQ/HT3l
 J62etmcBI7zn9vZmJUBkm5Oyr9BI127aFfoXVLMjUVj47y24Cht6QK/tuiLqaTtjpYu3eULA1ZLN0
 rIBjpGOys/sr624Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ustuJ-0004tU-AY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BFC28601BC;
 Mon,  1 Sep 2025 02:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CE3C4CEED;
 Mon,  1 Sep 2025 02:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756692260;
 bh=ausF7AVg0t1Vf+HSZjrDosL4uEuyprEfDFeCeFJ4G2o=;
 h=From:To:Cc:Subject:Date:From;
 b=g6r5rwrVnOoPscDz45G0jlVqx6GCrUkDBXO3/9amBMoMwmLhLRLc3DMcNTXlASmV6
 t5Riq2j3Km5b2zf65klx7F+5AXLZZAKtrC0VMM5D3tKMhfWLjz4X3bpw0+gXBcO4ui
 jf+yzHWPK1Cv89sIrcL8Wcn9OGq3l9RXwLXNWII2UYeBdPnNOKnPFZQajJ62iLxcOE
 +TtkgL3asfD6p4zysQPjKp8bMAwxxy7SXFM+Qd7v8URKga1v+M78Z/7U4sL3+Iukf8
 88+ZQ122u9Nqvu/YYgDKy5sSgE0sCb/Qg9tEJa8JjXtC5Zc+ZhI0Mvo38HpC2IQQZE
 Ogeb1NynZDlsg==
To: jaegeuk@kernel.org
Date: Mon,  1 Sep 2025 10:04:15 +0800
Message-ID: <20250901020416.2172182-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It reports a bug from device w/ zufs: F2FS-fs (dm-64):
 Inconsistent
 segment (173822) type [1, 0] in SSA and SIT F2FS-fs (dm-64): Stopped filesystem
 due to reason: 4 Thread A Thread B - f2fs_expand_inode_data -
 f2fs_allocate_pinning_section
 - f2fs_gc_range - do_garbage_collect w/ segno #x - writepage -
 f2fs_allocate_data_block - new_curseg - allocate segno #x 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ustuJ-0004tU-AY
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid migrating empty section
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It reports a bug from device w/ zufs:

F2FS-fs (dm-64): Inconsistent segment (173822) type [1, 0] in SSA and SIT
F2FS-fs (dm-64): Stopped filesystem due to reason: 4

Thread A				Thread B
- f2fs_expand_inode_data
 - f2fs_allocate_pinning_section
  - f2fs_gc_range
   - do_garbage_collect w/ segno #x
					- writepage
					 - f2fs_allocate_data_block
					  - new_curseg
					   - allocate segno #x

The root cause is: fallocate on pinning file may race w/ block allocation
as above, result in do_garbage_collect() from fallocate() may migrate
segment which is just allocated by a log, the log will update segment type
in its in-memory structure, however GC will get segment type from on-disk
SSA block, once segment type changes by log, we can detect such
inconsistency, then shutdown filesystem.

In this case, on-disk SSA shows type of segno #173822 is 1 (SUM_TYPE_NODE),
however segno #173822 was just allocated as data type segment, so in-memory
SIT shows type of segno #173822 is 0 (SUM_TYPE_DATA).

Change as below to fix this issue:
- check whether current section is empty before gc
- add sanity checks on do_garbage_collect() to avoid any race case, result
in migrating segment used by log.
- btw, it fixes misc issue in printed logs: "SSA and SIT" -> "SIT and SSA".

Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ed3acbfc83ca..a7708cf80c04 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1794,6 +1794,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
 					GET_SUM_BLOCK(sbi, segno));
 
+		if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
+			f2fs_err(sbi, "%s: segment %u is used by log",
+							__func__, segno);
+			f2fs_bug_on(sbi, 1);
+			goto skip;
+		}
+
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
 		if (gc_type == BG_GC && __is_large_section(sbi) &&
@@ -1805,7 +1812,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		sum = folio_address(sum_folio);
 		if (type != GET_SUM_TYPE((&sum->footer))) {
-			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
+			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SIT and SSA",
 				 segno, type, GET_SUM_TYPE((&sum->footer)));
 			f2fs_stop_checkpoint(sbi, false,
 				STOP_CP_REASON_CORRUPTED_SUMMARY);
@@ -2068,6 +2075,13 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
+		/*
+		 * avoid migrating empty section, as it can be allocated by
+		 * log in parallel.
+		 */
+		if (!get_valid_blocks(sbi, segno, true))
+			continue;
+
 		if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno)))
 			continue;
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
