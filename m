Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B57572B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jul 2023 06:05:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLbxa-00026g-OE;
	Tue, 18 Jul 2023 04:05:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qLbxZ-00026a-99
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 04:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e9FvwEGHWKYbKj1HvBkCZelW5kvQvNXxoXwVHcNNx+E=; b=PF90aYmmyFYjzkrdVchFr+Q13O
 QGMbBf4nJ8BeSaYNPnMGkEcMCOD5VIQHpG9SyczmzlLTs7lhKmG+KJw5G/EQu5zKJgbd7wJnuzyj+
 vWFfCnCjJp3cSOY/xCmo3BFS+9u+LifnoPetLqBqdKeFk7e21YvB9iZMfZs0An3QyQ4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e9FvwEGHWKYbKj1HvBkCZelW5kvQvNXxoXwVHcNNx+E=; b=S
 0g7g388qHvJieMWVZLLB/uZHlg/NWcuPC1KXj2W0Y9ypVTZRhEqzcYm6qnSUL6sEkhnGsO5h51xZe
 ngFC6f4BCLtKbFxMlO5+N/GwKk7S8ge7tIevoAyw6gYEeWzRgJRptXoMliv1ml0DTogmZaKZ5GiKZ
 9tcHKz8vuoz/pzZ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLbxa-0008Jq-IP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 04:05:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF7D161368
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jul 2023 04:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4BFC433C8;
 Tue, 18 Jul 2023 04:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689653106;
 bh=K61TdkRDVa8bi8+2w1sYwcG3dUwCLBo0rD/l0mmE3Do=;
 h=From:To:Cc:Subject:Date:From;
 b=lZbeMssAOVe14xiYVegJUhtV9Hs+6CLKEsxKfbH5bvZ7k6tC6lLckepKxE5zzx2e/
 OdkTNpGTHSfpIH9bBz+f6+VN2/ilhyj/y94GS//Z58bDM3jKmNe0AEkCfGU3EkmwSI
 gDJjDFrbDXN+Y/ok2CoCvShgWCqLSRCPn0NR4IjSCtIDyv69lv4S+dazWhihxJJbgp
 eS86nVaVZBZzxug3P3rJQk7CetQk6Iv58yivMRxrYlp+kjKVKT9U0DpxBabVlzPQrZ
 FyiOFKc4frQ2e8rQ8DyY+G0OJacUUySu1YuO4vllmNmu4egwHQih5jpCno3T6V7aDR
 ks7yy8ixeVVEA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 18 Jul 2023 12:05:00 +0800
Message-Id: <20230718040500.1170842-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds to support dumping fsverity xattr info in
 print_xattr_entry(). Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c
 | 13 +++++++++++++ fsck/xattr.h | 11 +++++++++++ 2 files changed,
 24 insertions(+)
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLbxa-0008Jq-IP
Subject: [f2fs-dev] [PATCH] dump.f2fs: support to dump fsverity xattr info
 in print_xattr_entry()
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

This patch adds to support dumping fsverity xattr info in print_xattr_entry().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 13 +++++++++++++
 fsck/xattr.h | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index dbb516b..2691b2f 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -199,6 +199,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 	char *enc_name = F2FS_XATTR_NAME_ENCRYPTION_CONTEXT;
 	u32 enc_name_len = strlen(enc_name);
 	const union fscrypt_context *ctx;
+	const struct fsverity_descriptor_location *dloc;
 	int i;
 
 	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
@@ -250,6 +251,18 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 			return;
 		}
 		break;
+	case F2FS_XATTR_INDEX_VERITY:
+		dloc = (const struct fsverity_descriptor_location *)value;
+		if (ent->e_name_len != strlen(F2FS_XATTR_NAME_VERITY) ||
+			memcmp(ent->e_name, F2FS_XATTR_NAME_VERITY,
+						ent->e_name_len))
+			break;
+		if (size != sizeof(*dloc))
+			break;
+		MSG(0, "version: %u\n", le32_to_cpu(dloc->version));
+		MSG(0, "size: %u\n", le32_to_cpu(dloc->size));
+		MSG(0, "pos: %lu\n", le64_to_cpu(dloc->pos));
+		return;
 	}
 	for (i = 0; i < size; i++)
 		MSG(0, "%02X", value[i]);
diff --git a/fsck/xattr.h b/fsck/xattr.h
index cddafa7..bf1dd7e 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -90,6 +90,14 @@ static inline int fscrypt_context_size(const union fscrypt_context *ctx)
 	return 0;
 }
 
+struct fsverity_descriptor_location {
+	__le32 version;
+	__le32 size;
+	__le64 pos;
+};
+
+static_assert(sizeof(struct fsverity_descriptor_location) == 16, "");
+
 #define F2FS_ACL_VERSION	0x0001
 
 struct f2fs_acl_entry {
@@ -150,6 +158,9 @@ static inline int f2fs_acl_count(int size)
 #define F2FS_XATTR_INDEX_LUSTRE			5
 #define F2FS_XATTR_INDEX_SECURITY		6
 #define F2FS_XATTR_INDEX_ENCRYPTION		9
+#define F2FS_XATTR_INDEX_VERITY			11
+
+#define F2FS_XATTR_NAME_VERITY			"v"
 
 #define IS_XATTR_LAST_ENTRY(entry) (*(__u32 *)(entry) == 0)
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
