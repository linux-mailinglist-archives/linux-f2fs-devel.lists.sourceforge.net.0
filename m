Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1907572B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jul 2023 06:05:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLbxy-0004ba-IP;
	Tue, 18 Jul 2023 04:05:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qLbxw-0004bT-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 04:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=war0DrrEXoN6PpNCVIPALK0Rro5J5nOISSFQV4vFbTs=; b=QTQc4YvPYAyubA9ZAFekDIjnUp
 V7NkL3BWqgdaOlU3TDrGDVebYS7A3944GixvTlrP6x+lLELd178Sf6jmSDoLSZES18nZL1H9TGfvf
 0XGmpY4HjQczbq078SUtzslaTwCDdQATPS8YOCSun9p97hTFH8RE6SvYQmMpfJbz2SDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=war0DrrEXoN6PpNCVIPALK0Rro5J5nOISSFQV4vFbTs=; b=i
 7BL/aBeS0ib+ISpkCj+GL6L3/utbIWGkb++PhMSrpV4GR7LQveh0UHr8Xxn4uor2easVcg+XCS6HF
 775mfIQVTpOhL0I+Lh1E4RNEOU6iV2puK00+9E7ssFsTg6DNn3H5RiY1Mi1tcQSW8Q0cjt2tn8PU+
 MQUX0ezvMqGOffSU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLbxv-00BQuz-Tg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 04:05:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5283761416
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jul 2023 04:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F79C433C7;
 Tue, 18 Jul 2023 04:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689653129;
 bh=l0QEipKZpjFuQnlgqxnCRseY9InesgcSUZV1JY4F3SM=;
 h=From:To:Cc:Subject:Date:From;
 b=avFHilciMBKx3i8R2auVp3/Cod0UjJ4dwZmPtW7vVfvfbGmmC3+caZj8W0NRAYihC
 5FS6YcdjGTkq+H4gjaNN6PdW0w2h4xXslcWR51ArXnLMsLyUsNQ6z6NLoB5haOal4f
 NuVcZxzfrQEHdGjQgGp/+b0XZNMzlCehiK3Qcq/YbFcu2NlVDhgWYYHiwEBXxrx8BI
 KHp4d8RwFp8CPeyJQB755ISdiO3ywASAwmMBkcC8vylrmbYQcQmgPrg+8Iqhu68y78
 klC0myVoGQJTcYi7SGSec7B06ApC63ZET97n8JL9bNYmtYw7cWwfePpFGVO+Bnv1hb
 /b2aiNk9yGo/w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 18 Jul 2023 12:05:23 +0800
Message-Id: <20230718040523.1171058-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If there are corrupted xattr entries in xattr space, it may
 cause traversing across end of xattr space issue, this patch adds sanity
 check during xattr traverse to avoid such issue. This patch synchronizes
 kernel commits: 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLbxv-00BQuz-Tg
Subject: [f2fs-dev] [PATCH] f2fs-tools: do sanity check on xattr entry
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If there are corrupted xattr entries in xattr space, it may cause
traversing across end of xattr space issue, this patch adds sanity
check during xattr traverse to avoid such issue.

This patch synchronizes kernel commits:

2777e654371d ("f2fs: fix to avoid accessing xattr across the boundary")
688078e7f36c ("f2fs: fix to avoid memory leakage in f2fs_listxattr")

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/dump.c  |  9 +++++++++
 fsck/mount.c | 18 ++++++++++++++----
 fsck/xattr.c | 21 ++++++++++++++++++---
 fsck/xattr.h |  6 ++++++
 4 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 6deaa7e..e7a1c5c 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -354,6 +354,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 {
 	void *xattr;
+	void *last_base_addr;
 	struct f2fs_xattr_entry *ent;
 	char xattr_name[F2FS_NAME_LEN] = {0};
 	int ret;
@@ -362,10 +363,18 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 	if (!xattr)
 		return;
 
+	last_base_addr = (void *)xattr + XATTR_SIZE(&node_blk->i);
+
 	list_for_each_xattr(ent, xattr) {
 		char *name = strndup(ent->e_name, ent->e_name_len);
 		void *value = ent->e_name + ent->e_name_len;
 
+		if ((void *)(ent) + sizeof(__u32) > last_base_addr ||
+			(void *)XATTR_NEXT_ENTRY(ent) > last_base_addr) {
+			MSG(0, "xattr entry crosses the end of xattr space\n");
+			break;
+		}
+
 		if (!name)
 			continue;
 
diff --git a/fsck/mount.c b/fsck/mount.c
index 2691b2f..3ee003d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -274,6 +274,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 {
 	struct f2fs_inode *inode = &node->i;
 	void *xattr_addr;
+	void *last_base_addr;
 	struct f2fs_xattr_entry *ent;
 	char en[F2FS_PRINT_NAMELEN];
 	unsigned int i = 0;
@@ -370,13 +371,22 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	DISP_u32(inode, i_nid[4]);	/* double indirect */
 
 	xattr_addr = read_all_xattrs(sbi, node);
-	if (xattr_addr) {
-		list_for_each_xattr(ent, xattr_addr) {
-			print_xattr_entry(ent);
+	if (!xattr_addr)
+		goto out;
+
+	last_base_addr = (void *)xattr_addr + XATTR_SIZE(&node->i);
+
+	list_for_each_xattr(ent, xattr_addr) {
+		if ((void *)(ent) + sizeof(__u32) > last_base_addr ||
+			(void *)XATTR_NEXT_ENTRY(ent) > last_base_addr) {
+			MSG(0, "xattr entry crosses the end of xattr space\n");
+			break;
 		}
-		free(xattr_addr);
+		print_xattr_entry(ent);
 	}
+	free(xattr_addr);
 
+out:
 	printf("\n");
 }
 
diff --git a/fsck/xattr.c b/fsck/xattr.c
index 04c2879..4593709 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -55,11 +55,19 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 	return txattr_addr;
 }
 
-static struct f2fs_xattr_entry *__find_xattr(void *base_addr, int index,
-		size_t len, const char *name)
+static struct f2fs_xattr_entry *__find_xattr(void *base_addr,
+				void *last_base_addr, int index,
+				size_t len, const char *name)
 {
 	struct f2fs_xattr_entry *entry;
+
 	list_for_each_xattr(entry, base_addr) {
+		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
+			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
+			MSG(0, "xattr entry crosses the end of xattr space\n");
+			return NULL;
+		}
+
 		if (entry->e_name_index != index)
 			continue;
 		if (entry->e_name_len != len)
@@ -125,6 +133,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 {
 	struct f2fs_node *inode;
 	void *base_addr;
+	void *last_base_addr;
 	struct f2fs_xattr_entry *here, *last;
 	struct node_info ni;
 	int error = 0;
@@ -159,7 +168,13 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	base_addr = read_all_xattrs(sbi, inode);
 	ASSERT(base_addr);
 
-	here = __find_xattr(base_addr, index, len, name);
+	last_base_addr = (void *)base_addr + XATTR_SIZE(&inode->i);
+
+	here = __find_xattr(base_addr, last_base_addr, index, len, name);
+	if (!here) {
+		error = -EUCLEAN;
+		goto exit;
+	}
 
 	found = IS_XATTR_LAST_ENTRY(here) ? 0 : 1;
 
diff --git a/fsck/xattr.h b/fsck/xattr.h
index bf1dd7e..867349c 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -182,6 +182,12 @@ static inline int f2fs_acl_count(int size)
 			!IS_XATTR_LAST_ENTRY(entry); \
 			entry = XATTR_NEXT_ENTRY(entry))
 
+#define VALID_XATTR_BLOCK_SIZE	(F2FS_BLKSIZE - sizeof(struct node_footer))
+
+#define XATTR_SIZE(i)		((le32_to_cpu((i)->i_xattr_nid) ?	\
+					VALID_XATTR_BLOCK_SIZE : 0) +	\
+						(inline_xattr_size(i)))
+
 #define MIN_OFFSET	XATTR_ALIGN(F2FS_BLKSIZE -		\
 		sizeof(struct node_footer) - sizeof(__u32))
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
