Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9uaHOOv2tmkkLAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2026 19:14:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F67291DF4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2026 19:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2kOQ+qBn9nar/48MDebFmYIB39SEvISM+2EY3rJJmHY=; b=OsswDnyZL3aJ6V7StQPIXk1PeY
	N5OYI3ihtYI+R+rzybhnGe/n1/jjCfPf+LprBj/o9HlEhImUt8hAe2P6vjD/rjNKmzEzbyIQd5aTp
	DSDaRWDR2Xe77lcwHoZO3mu3UmwWSa5o9za8JE7HCL4DdwubrwwFMe0Ys2ASRZQQzbuc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1pyL-00014O-6h;
	Sun, 15 Mar 2026 18:13:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w1pyJ-000149-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Mar 2026 18:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEa0toRAnN++wk0f2/JVCD1RZAelJYEAjE4hjMJ2ILs=; b=A3e81raH3rd1rlsBfOK0LX0yuR
 AWE6WoIkXScC4PQHJfqGzNb/vw6cFc18M0HBIAH6BWqb1BRn7mqU3p9Yr+4zYLACmZRkCwy2wSEVR
 dOZzNir0pivWtha+KKXe2wgaF2BjHj5s1XvmC3JDWVIPhGu3Ndvx2OTja/G+cuqs07IE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rEa0toRAnN++wk0f2/JVCD1RZAelJYEAjE4hjMJ2ILs=; b=V
 iMr6zZ8A6FhaDrlBfBOOO7psVF+Fr00RXVqibgcIQaiKzf6XpeMUPCOEs+l+dreoPDNWO14cf/APC
 /Y1tOG3QV2Tskx+jKZZesUTlUyi8RR45cfgoZwO1RpH+YYEEvEsrBaaBk/biD9ys+rvcoub/Fzj6v
 gBFNQiS71PaIHWHk=;
Received: from mail3-167.sinamail.sina.com.cn ([202.108.3.167])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1pyJ-0007Gs-ET for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Mar 2026 18:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773598431; bh=rEa0toRAnN++wk0f2/JVCD1RZAelJYEAjE4hjMJ2ILs=;
 h=From:Subject:Date:Message-ID;
 b=ESFe/+GYvBAiGjYUZFpSRuHAYPZkQzGF+FWNRreasvkj+4EWkWw1cKSOMbH/KBoq8
 VsBcsv5b1yttvnRPhxXCTUrKPlvO31nfW/gPd92YGbFrI696Fc8TxpoBRZuUL6XX6+
 wd0aFpRU+t693SGO+MqdjDeJkGvLePACz+71SUQE=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69B6F6CE00004A8F; Sun, 16 Mar 2026 02:13:38 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9017626685377
X-SMAIL-UIID: 2D5BC3525A44468DA7CEA1086B2CB191-20260316-021338-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 16 Mar 2026 02:13:20 +0800
Message-ID: <20260315181321.4063984-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patch refactor the
 f2fs_move_node_folio()
 function. No logical change. Signed-off-by: Yongpeng Yang --- fs/f2fs/f2fs.h
 | 2 ++ fs/f2fs/node.c | 54 ++++++++++++++++++++++++++++++ 2 files changed,
 34 insertions(+), 22 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w1pyJ-0007Gs-ET
Subject: [f2fs-dev] [PATCH v3 1/3] f2fs: refactor f2fs_move_node_folio
 function
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email]
X-Rspamd-Queue-Id: 98F67291DF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patch refactor the f2fs_move_node_folio() function. No logical
change.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h |  2 ++
 fs/f2fs/node.c | 54 ++++++++++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8942b2a63cfd..be5132f992e8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3947,6 +3947,8 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					enum node_type ntype, bool in_irq);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
+int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
+			bool mark_dirty, enum iostat_type io_type);
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bbfa677ef46f..12b943eae4d9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1843,41 +1843,51 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	return false;
 }
 
-int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
+int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
+			bool mark_dirty, enum iostat_type io_type)
 {
 	int err = 0;
+	struct writeback_control wbc = {
+		.sync_mode = WB_SYNC_ALL,
+		.nr_to_write = 1,
+	};
 
-	if (gc_type == FG_GC) {
-		struct writeback_control wbc = {
-			.sync_mode = WB_SYNC_ALL,
-			.nr_to_write = 1,
-		};
+	if (!sync_mode) {
+		/* set page dirty and write it */
+		if (mark_dirty && !folio_test_writeback(node_folio))
+			folio_mark_dirty(node_folio);
+		goto out_folio;
+	}
 
-		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
+	f2fs_folio_wait_writeback(node_folio, NODE, true, true);
 
+	if (mark_dirty)
 		folio_mark_dirty(node_folio);
+	else if (!folio_test_dirty(node_folio))
+		goto out_folio;
 
-		if (!folio_clear_dirty_for_io(node_folio)) {
-			err = -EAGAIN;
-			goto out_page;
-		}
-
-		if (!__write_node_folio(node_folio, false, NULL,
-					&wbc, false, FS_GC_NODE_IO, NULL))
-			err = -EAGAIN;
-		goto release_page;
-	} else {
-		/* set page dirty and write it */
-		if (!folio_test_writeback(node_folio))
-			folio_mark_dirty(node_folio);
+	if (!folio_clear_dirty_for_io(node_folio)) {
+		err = -EAGAIN;
+		goto out_folio;
 	}
-out_page:
+
+	if (!__write_node_folio(node_folio, false, NULL,
+				&wbc, false, FS_GC_NODE_IO, NULL))
+		err = -EAGAIN;
+	goto release_folio;
+out_folio:
 	folio_unlock(node_folio);
-release_page:
+release_folio:
 	f2fs_folio_put(node_folio, false);
 	return err;
 }
 
+int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
+{
+	return f2fs_write_single_node_folio(node_folio, gc_type == FG_GC,
+			gc_type == FG_GC, FS_GC_NODE_IO);
+}
+
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			struct writeback_control *wbc, bool atomic,
 			unsigned int *seq_id)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
