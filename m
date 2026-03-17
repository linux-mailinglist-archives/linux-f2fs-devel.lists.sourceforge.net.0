Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H+rOGTpBuWnp9wEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 12:55:38 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A02A94E2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 12:55:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG1YMN4rJWSvdhOgJmZGbkqMptzWriws6OU4QUnCRvI=; b=IIYq8uU9WA8YEfnGd2EpvAu1aa
	8UIuHAMTP5ZHUGmUEMFtem1yd2LsDl09xvYR6MV18guAqiAQ3NEy3nhimywU2G4M49O1I9/2g741F
	EBzRi+gTZVpw5+keTYI+j/pthWOyl4cWrHQtv7Q341PciuqUV7MFTT1ee3/EMn4fhY4s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2T1C-0008DV-MB;
	Tue, 17 Mar 2026 11:55:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w2T19-0008DC-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 11:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xB9ncntm0cHkxirOa0Lpt9HwcxPLntPgscqZWgKpo9U=; b=V+Vtzuw8LSyONMQWkbTygDcPVF
 Et6ZiRi/pJFJNPFGUp/CHshxbQK97vIAt2oB+Vj5VsIjbpVWP/t8ucBez3kqRJnrLIMMeK9DR2zFS
 b3OUiD5UYuj4F/qgOLWWKHFkbQryuH/73c4JvQ2MpAYj7JxynU8UcxaTIPDABqmt/1JM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xB9ncntm0cHkxirOa0Lpt9HwcxPLntPgscqZWgKpo9U=; b=l284Fa2r+y0MK/5INdxjaxWxoP
 lA30+/QM4Qfz/Szf0uF203NhqwQNdPzVKrygyt5Z9tlmCJapsZViCTzhPRXd5+X/cz0CGyd1PxkHd
 Rt0AHx5RD6PlZF/ua0Le2nIwK1laaS0ixrkiDrf+MGfyGP1qW3e/U8X6/yft2fUjdpGU=;
Received: from smtp153-141.sina.com.cn ([61.135.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2T19-0004Ug-EI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 11:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773748523; bh=xB9ncntm0cHkxirOa0Lpt9HwcxPLntPgscqZWgKpo9U=;
 h=From:Subject:Date:Message-ID;
 b=bZGT6uU5+xvZVhnzer6FjB0PXS4HOV23jwppV2AzoaNAL0NLDNBoLVW1iiAFH1E10
 AUrJ8RNF5mPehVk4AGRlmMC/h0N+e3FubpZipHQ02Dt0hTEqbGIjdabfa0Xmx2G1Nl
 tZqi/xD2motwl0O7DsOwNmRp+VZbRx5onjkriZuU=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 69B9411A000012B1; Tue, 17 Mar 2026 19:55:15 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4618956816134
X-SMAIL-UIID: E7B047EEF79F4840AD814629A010BC17-20260317-195515-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 17 Mar 2026 19:54:59 +0800
Message-ID: <20260317115459.208306-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317115459.208306-2-monty_pavel@sina.com>
References: <20260317115459.208306-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patch refactors the node footer flag
 setting code to simplify redundant logic and adjust function parameters and
 return types. No logical changes. Signed-off-by: Yongpeng Yang ---
 fs/f2fs/f2fs.h
 | 2 +- fs/f2fs/node.c | 2 +- fs/f2fs/node.h | 23 +++++++++++ 3 files changed, 
 13 insertions(+), 14 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w2T19-0004Ug-EI
Subject: [f2fs-dev] [PATCH v4 2/4] f2fs: refactor node footer flag setting
 related code
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: D50A02A94E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patch refactors the node footer flag setting code to simplify
redundant logic and adjust function parameters and return types. No
logical changes.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h |  2 +-
 fs/f2fs/node.c |  2 +-
 fs/f2fs/node.h | 23 +++++++++++------------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index afb4d10142dd..3b1fdaac1ef6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3928,7 +3928,7 @@ bool f2fs_in_warm_node_list(struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
 void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
-int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid);
+bool f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2e74d2882b6f..3c862d8ed3d9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -391,7 +391,7 @@ void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi)
 	spin_unlock_irqrestore(&sbi->fsync_node_lock, flags);
 }
 
-int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
+bool f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct nat_entry *e;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 824ac9f0e6e4..219be30e6a68 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -400,27 +400,26 @@ static inline int is_node(const struct folio *folio, int type)
 #define is_fsync_dnode(folio)	is_node(folio, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(folio)	is_node(folio, DENT_BIT_SHIFT)
 
-static inline void set_cold_node(const struct folio *folio, bool is_dir)
+static inline void __set_mark(const struct folio *folio, bool mark, int type)
 {
 	struct f2fs_node *rn = F2FS_NODE(folio);
 	unsigned int flag = le32_to_cpu(rn->footer.flag);
 
-	if (is_dir)
-		flag &= ~BIT(COLD_BIT_SHIFT);
-	else
-		flag |= BIT(COLD_BIT_SHIFT);
-	rn->footer.flag = cpu_to_le32(flag);
-}
-
-static inline void set_mark(struct folio *folio, int mark, int type)
-{
-	struct f2fs_node *rn = F2FS_NODE(folio);
-	unsigned int flag = le32_to_cpu(rn->footer.flag);
 	if (mark)
 		flag |= BIT(type);
 	else
 		flag &= ~BIT(type);
 	rn->footer.flag = cpu_to_le32(flag);
+}
+
+static inline void set_cold_node(const struct folio *folio, bool is_dir)
+{
+	__set_mark(folio, !is_dir, COLD_BIT_SHIFT);
+}
+
+static inline void set_mark(const struct folio *folio, bool mark, int type)
+{
+	__set_mark(folio, mark, type);
 
 #ifdef CONFIG_F2FS_CHECK_FS
 	f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
