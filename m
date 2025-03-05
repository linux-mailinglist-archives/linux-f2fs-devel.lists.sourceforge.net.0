Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87195A4F9AA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 10:15:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpkqE-0005iv-Rk;
	Wed, 05 Mar 2025 09:15:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpkqC-0005iT-Ot
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjg++WkDqFXehoZQN7JtAOSgWxhl2d1Ld8LpbIiaN74=; b=DdQvTXY3DqaZE3pBp/NDNkpn3F
 Df6VCAndWgdSZJp2d1+JPu1UXHnJ6pPShZp1rhYoya6m25LN77boKbEvwsE05y62HSJVUxvmcc+Co
 pY/aa3zbERUOra2G2ATDC+9PfD1fCoYsHoQma+Kaqft1kBmqQfze3mtfP4KBOhHmMb2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rjg++WkDqFXehoZQN7JtAOSgWxhl2d1Ld8LpbIiaN74=; b=ISyNE81q9Le32dCpYAQ+WXjt2+
 fbqUCQCe8DMqJF1XpzwPD5zbA4Ic+MARTShUydkQC7kHavRyJN1tisscCl/HOHkxm6r+c6llYyPHE
 8kA6DlMceXMmqkI3+W10ZtDPOAkhSwSpy8KtI3Tly3Oc23+0dOY/qhDDyS0B0pxaauLE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpkq1-0000TN-9z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1EB065C66FA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 09:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834F1C4CEE2;
 Wed,  5 Mar 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741166083;
 bh=4QyVJFbmKdtxLQ92pp1KwxdRC4e8KKpMsgEHFxx52Ns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gbuIS1ACkj+HQCw1kbViL4IsMJNOcjKbFdG02LjX9aAawDqu/0zhz0huSvN8eoP8A
 aywAEmjS2hheIgbSNKVYDUgKXDYnxgxeL9gWQg3h2QzEIZWL+qqTrCbubjf0xz/qOf
 WoTUttOEvLIlDSUSYL5DVU3C62DFK0+gS532RBcLX7gpCfuk7KaqC12N23GYnIUjDC
 mKaO81xcI0y5g6bpzd0qQIv4a3Upcq35vzdLZ+/q0YXmmSjZ+br+sZM7g4OQoZwlgI
 b2IX+j6+7K8ln5PukqYKBzuaGtKItA4fyKa0ed+8kdH3YeASCI6oncDpina+jk4ZKJ
 VpWsREaivxcKA==
To: jaegeuk@kernel.org
Date: Wed,  5 Mar 2025 17:11:48 +0800
Message-ID: <20250305091148.2086015-3-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250305091148.2086015-1-chao@kernel.org>
References: <20250305091148.2086015-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To simulate inconsistent node footer error. Signed-off-by:
 Chao Yu <chao@kernel.org> --- v2: - no changes
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 1 + Documentation/filesystems/f2fs.rst | 1 + fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c | 3 ++- fs/f2fs [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpkq1-0000TN-9z
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: introduce FAULT_INCONSISTENT_FOOTER
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

To simulate inconsistent node footer error.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- no changes
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/node.c                          | 3 ++-
 fs/f2fs/super.c                         | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 81deae2af84d..b9a000e5098a 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -734,6 +734,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_BLKADDR_VALIDITY           0x000040000
 		FAULT_BLKADDR_CONSISTENCE        0x000080000
 		FAULT_NO_SEGMENT                 0x000100000
+		FAULT_INCONSISTENT_FOOTER        0x000200000
 		===========================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index fb7d2ee022bc..42f28dbf2410 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_BLKADDR_VALIDITY           0x000040000
 			 FAULT_BLKADDR_CONSISTENCE        0x000080000
 			 FAULT_NO_SEGMENT                 0x000100000
+			 FAULT_INCONSISTENT_FOOTER        0x000200000
 			 ===========================      ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b43aaa9e4ae5..6b4579b05dbf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -62,6 +62,7 @@ enum {
 	FAULT_BLKADDR_VALIDITY,
 	FAULT_BLKADDR_CONSISTENCE,
 	FAULT_NO_SEGMENT,
+	FAULT_INCONSISTENT_FOOTER,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 439690f40d2b..c40980447113 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1463,7 +1463,8 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 	if (unlikely(nid != nid_of_node(page) ||
 		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
 		(ntype == NODE_TYPE_XATTR &&
-		!f2fs_has_xattr_block(ofs_of_node(page))))) {
+		!f2fs_has_xattr_block(ofs_of_node(page))) ||
+		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
 		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  ntype, nid, nid_of_node(page), ino_of_node(page),
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3c875dc07266..bbd45e300311 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -63,6 +63,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_BLKADDR_VALIDITY]	= "invalid blkaddr",
 	[FAULT_BLKADDR_CONSISTENCE]	= "inconsistent blkaddr",
 	[FAULT_NO_SEGMENT]		= "no free segment",
+	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
