Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F54817EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Dec 2021 01:46:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n2jZr-0004yR-NF; Thu, 30 Dec 2021 00:45:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <antoine@lesviallon.fr>) id 1n2jZp-0004yL-OH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 00:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yudbbxaq97fJ5ABi+2IxPdjywCB7wflw5cDay1oFSMI=; b=Gmj78QvN2zBQ1KrcP89RhJMStJ
 /J2Z0D1mI9dSboU1j+B8u48u3QjFK9V22fLQT7Fbz06OHGvcHWQMksmsNPLYTyBs7OBFKhR8w0G3z
 PHnhy1ruwKuggjCuZGFSrLi89AXgreBmsCG8jpA/ida9YKeuCnYK7yXw66fBSfz3GP4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yudbbxaq97fJ5ABi+2IxPdjywCB7wflw5cDay1oFSMI=; b=X
 2178QhnqWc249iZQxO7UxPONWWOR16CJW391+NLniDgt/um2iBOduiZwvexxkg/k7rq5z9uDwOoba
 e+uoSoJgCq96dnmIZPj3Q8WYDOgpjN4UI+uglc7nZpO4Iqdf74QKVV22X5JlZeFBV06vrOojfshFq
 2INn9kkG8rmFS+UM=;
Received: from lesviallon.fr ([82.66.80.223])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n2jZn-0003Ww-El
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 00:45:53 +0000
Received: from authenticated-user (lesviallon.fr [82.66.80.223])
 by lesviallon.fr (Postfix) with ESMTPA id 991F262A6202;
 Thu, 30 Dec 2021 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lesviallon.fr;
 s=dkim; t=1640824184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yudbbxaq97fJ5ABi+2IxPdjywCB7wflw5cDay1oFSMI=;
 b=gmwvbHkeYYKFGRRxZ9zCQ07T05ETohXnNTaY39UWumS7P11cCWncTDn6DWn/BHb7hgPEah
 RKomnchwz+lSoVNwDepbp3cE0MhZR86RbPtC98LF7j95Q9WUvQ1DOoVmZGBksfuhoxmpAr
 FaaQu7CVzgOoCYej4VPErzNznytY4Tg=
To: linux-f2fs-devel@lists.sourceforge.net,
	antoine@lesviallon.fr
Date: Thu, 30 Dec 2021 01:29:42 +0100
Message-Id: <20211230002942.298407-1-antoine@lesviallon.fr>
MIME-Version: 1.0
X-Spam-Level: ****
X-Spamd-Bar: ++++
Authentication-Results: lesviallon.fr;
 auth=pass smtp.auth=antoine@lesviallon.fr smtp.mailfrom=antoine@lesviallon.fr
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On large SSDs filled with lots of data, fsck.f2fs can be very
 long to finish. For instance, on my 1TB SSD filled at 99%, it takes literally
 5 minutes to complete. Currently, the only way to have some feedback is to
 enable debug output,
 but it is very verbose and doesn't tell the actual progress.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n2jZn-0003Ww-El
Subject: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
From: Antoine Viallon via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Antoine Viallon <antoine@lesviallon.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On large SSDs filled with lots of data, fsck.f2fs can be very long to finish.
For instance, on my 1TB SSD filled at 99%, it takes literally 5 minutes to
complete.

Currently, the only way to have some feedback is to enable debug output,
but it is very verbose and doesn't tell the actual progress.

This patch implements a simple progress report in the longest
running part of the check (in fsck_chk_node_blk).
The number of checked node / total valid nodes is printed
every 1000 nodes checked, and the percentage of progress
is also calculated and printed.


Signed-off-by: Antoine Viallon <antoine@lesviallon.fr>
---
 fsck/fsck.c | 9 +++++++++
 fsck/fsck.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index ecd87af..7a64339 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -546,6 +546,15 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk != NULL);
 
+	/* Progress report */
+	sbi->fsck->chk.checked_blk_cnt++;
+
+	if (sbi->fsck->chk.checked_blk_cnt % 1000 == 0)
+		printf("[FSCK] Checked node %lu / %u (%.2f%%)\n",
+			   sbi->fsck->chk.checked_blk_cnt,
+			   sbi->total_valid_node_count,
+			   100 * (float)(sbi->fsck->chk.checked_blk_cnt) / sbi->total_valid_node_count);
+
 	if (sanity_check_nid(sbi, nid, node_blk, ftype, ntype, &ni))
 		goto err;
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 11846e1..dd679b5 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -91,6 +91,7 @@ struct f2fs_fsck {
 
 	struct orphan_info orphani;
 	struct chk_result {
+		u64 checked_blk_cnt;
 		u64 valid_blk_cnt;
 		u32 valid_nat_entry_cnt;
 		u32 valid_node_cnt;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
