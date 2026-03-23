Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJvzNzL8wGmiPQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 09:39:14 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DD2EE59A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 09:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGefqth8sAPW9dCynA6K9wfFiQ+9JGaIup3Os5WE6i4=; b=R0qWf5A0hyFDtpz9cnfVLH70t1
	tXHhdnod/2AkxYoQhZRy3TTFE8AaN8y64RVX5bmhWVM8hWX3UPCsve3lOlySRJNd4oq6q4cL7+XKt
	SnaHfCC1lecIS7iucdxVfljaTuO/I5bFT6IUOfIQzxbG/15d9U5B+DZlg2TS8NO4nFIU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4aoX-0007a4-7b;
	Mon, 23 Mar 2026 08:39:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4aoH-0007Sc-2B
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 08:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=51wOvs3dryi07uDQPzlr9euFteL6sGbOsa9o32Gjzlw=; b=WzRXPQRHcPu8FlKYmXeocajRpD
 X5EQlBjTYj/Iuim84Yl/0vWItMYiRhmuEML/QssTOPHSGvh1dPRxLYc00ZgRAKbqTQL9SpNAt0Y2U
 rpxTX3LiqZhRCDEpVjh/sb+UgVlzKwx1+BwiCPB5SXs0ZMBgpBxYNM78IYo741qtRZ9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=51wOvs3dryi07uDQPzlr9euFteL6sGbOsa9o32Gjzlw=; b=eNqFvI3KKkcjmUbTptrJefdp9i
 jTGFq2HYdcF8/M74P2RyQ08B2GrpajVRb18Y3Fjb1AkIzsCwbEG466Sd9KYggz1o26OIUuI8ayQsV
 GgtXDZZy6SpH5Why7JOdnr/nlVz46cO4KLKtoeUVeExFPAgFcPtEJAvSHLnIqYgwltf4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4aoG-0004xL-7u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 08:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9E124338F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2026 08:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBCFC2BCB0;
 Mon, 23 Mar 2026 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774255121;
 bh=+zKOpcvSNYbdWl4TdDFXpsye2s5dDcbGfsO3Gb4Qv38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I1YsDq/m8ph7ozk2XOVINzZ8f8ApWlnBuzEhYJfTZzYieNRmkwr9ML+b4CvcYhcmr
 N8/2ptm2XPe+xjux1npLiePjNbHz9wpPql6x9AdQmzTNBi3O+afWsUJw0Cwfw3dDV4
 wrZKod+82aJBcq7Sw5+Wjp0Paw+B2MZZwbvG2y66JErIEdCKzO0CTjjEX1zgkvW3MU
 eM0nAz5+IBhs7u2Xp0mIgkZRBqK8pHraFoB3uYgPNOix4Up49bV1gr1FqdmIuSyNLT
 Y7TdYe7O8ONbwtRfRjI9OONZHyU8Wm6VVJWAGMvkTcgx1vnwBpFgLrn7N66g9+bc0o
 GBkXhK3tpv9kA==
To: jaegeuk@kernel.org
Date: Mon, 23 Mar 2026 16:38:33 +0800
Message-ID: <20260323083834.156393-2-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260323083834.156393-1-chao@kernel.org>
References: <20260323083834.156393-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's use more generic f2fs_stop_checkpoint() instead of
 f2fs_handle_critical_error()
 to handle critical error in f2fs. Signed-off-by: Chao Yu <chao@kernel.org>
 --- v3: This patch depends on "f2fs: call f2fs_handle_critical_error() to
 set cp_error flag",
 so send it as a patchset. fs/f2fs/checkpoint.c | 9 ---------
 fs/f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4aoG-0004xL-7u
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: use more generic
 f2fs_stop_checkpoint()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 7F9DD2EE59A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let's use more generic f2fs_stop_checkpoint() instead of
f2fs_handle_critical_error() to handle critical error in f2fs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
This patch depends on "f2fs: call f2fs_handle_critical_error() to set
cp_error flag", so send it as a patchset.
 fs/f2fs/checkpoint.c |  9 ---------
 fs/f2fs/f2fs.h       |  3 +--
 fs/f2fs/node.c       |  2 +-
 fs/f2fs/super.c      | 13 ++++++++++++-
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6dd39b7de11a..01e1ba77263e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -232,15 +232,6 @@ static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
 static struct kmem_cache *ino_entry_slab;
 struct kmem_cache *f2fs_inode_entry_slab;
 
-void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
-						unsigned char reason)
-{
-	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
-	if (!end_io)
-		f2fs_flush_merged_writes(sbi);
-	f2fs_handle_critical_error(sbi, reason);
-}
-
 /*
  * We guarantee no failure on the returned page.
  */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 94cf1e78d892..247eae5eb83b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3905,7 +3905,6 @@ int f2fs_do_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
-void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
@@ -5090,7 +5089,7 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
 				f2fs_bug_on(sbi, 1);
 				return;
 			}
-			f2fs_handle_critical_error(sbi, stop_reason);
+			f2fs_stop_checkpoint(sbi, false, stop_reason);
 		}
 	} else {
 		sbi->page_eio_ofs[type] = ofs;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 17eab01ae8f9..0de41526f28a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1779,7 +1779,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
 	if (f2fs_sanity_check_node_footer(sbi, folio, nid,
 					NODE_TYPE_REGULAR, false)) {
-		f2fs_handle_critical_error(sbi, STOP_CP_REASON_CORRUPTED_NID);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED_NID);
 		goto redirty_out;
 	}
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bd9785a3c805..5b552f08fe7b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4663,7 +4663,8 @@ static bool system_going_down(void)
 		|| system_state == SYSTEM_RESTART;
 }
 
-void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason)
+static void f2fs_handle_critical_error(struct f2fs_sb_info *sbi,
+						unsigned char reason)
 {
 	struct super_block *sb = sbi->sb;
 	bool shutdown = reason == STOP_CP_REASON_SHUTDOWN;
@@ -4720,6 +4721,16 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason)
 	 */
 }
 
+void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
+						unsigned char reason)
+{
+	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
+	if (!end_io)
+		f2fs_flush_merged_writes(sbi);
+	f2fs_handle_critical_error(sbi, reason);
+}
+
+
 static void f2fs_record_error_work(struct work_struct *work)
 {
 	struct f2fs_sb_info *sbi = container_of(work,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
