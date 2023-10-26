Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B50B7D7B21
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Oct 2023 04:59:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvqaT-0007GX-R6;
	Thu, 26 Oct 2023 02:59:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qvqaN-0007GP-Bz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 02:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cE9QBG0wmDhPmcIreu/PdIJH6UHO5VwBi3IJPYojI+Y=; b=MkfVI3Ylz7rZLMeyZ24bREeDrf
 MMJyx554u1btNMXv81EAHmLyrcF7Ojc1MeD7y+wDt4LdjaG8o9LGjaIt/Z1vZOz2qYruSItSMNF6k
 YZl0IcewYAs1dOgxJk+EcpVLOh2ByIOoeys82eXd1ZPNEL1TEY+4sTfCtRu7WuywiwO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cE9QBG0wmDhPmcIreu/PdIJH6UHO5VwBi3IJPYojI+Y=; b=L
 mUi7dliC2J5q314BZHZUC6k8J7ndOQGz+kDRLYKEGW5Y2smmIXUfhBe+YlKxyOgQuwkUxHn/cZ3JM
 Y44OxT3ASQeWma+c5CKixXXbENaJdTM1AFhZdZuiIcTrq/2dEwvEXxJrWYcWSA+MVz9dMGunF6RuP
 HyTzKlPJ4LcyjqRU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qvqaL-009YO1-45 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 02:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF6E6624AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Oct 2023 02:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5553BC433C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Oct 2023 02:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698289135;
 bh=pxUQ7aCNtsOESQSnP0jg+N4P8Uim/urUiSisoLONbRs=;
 h=From:To:Subject:Date:From;
 b=pSWMvFzwQ5mYwPanOiv7l5V7JjlrbV/uwr2is5cOc//Aqshrcu218iaVBr3Rcy3Nm
 uZ4QuK95yNj5mYXIbdEwkZzRHWPdm9KEU+SdO8gsLC8zNr4JooufAzPxe5zrOQGa9m
 001oeCVHRSfNh8Ua+OJ/c/doGE7N/TjwTNRnPcjVNHxc0HZQt83VnRG6a8/36sPIob
 l194qNWnaOsKF/YgialpUkIEuU3VB166ldXOaD49XzuA6OqvaOsOr7GMqrQKX3v0RA
 9aw4jjHWKauchuTVkbCIfPZsdtNzw1652DXn+0TeSeVSJDn78ABibD+FRHryxC7jDt
 lM27zd4vUfE2A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 26 Oct 2023 02:57:36 +0000
Message-ID: <20231026025736.2193139-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make fsck.f2fs
 zeroize
 the unused xattr space, i.e. the space after the end of the zero-terminated
 xattr list, if it isn't already zeroized. This is important because the kernel
 currently does not explicitly zero-terminate the list when writing xattrs.
 So, the kernel relies on the unused space containing zeroes. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qvqaL-009YO1-45
Subject: [f2fs-dev] [PATCH] f2fs-tools: ensure that unused xattr space is
 zeroized
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make fsck.f2fs zeroize the unused xattr space, i.e. the space after the
end of the zero-terminated xattr list, if it isn't already zeroized.

This is important because the kernel currently does not explicitly
zero-terminate the list when writing xattrs.  So, the kernel relies on
the unused space containing zeroes.

Also, add a missing free() to fix a memory leak.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fsck/fsck.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 72daa71..51e46e4 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -827,54 +827,72 @@ void fsck_reada_all_direct_node_blocks(struct f2fs_sb_info *sbi,
 {
 	int i;
 
 	for (i = 0; i < NIDS_PER_BLOCK; i++) {
 		u32 nid = le32_to_cpu(node_blk->in.nid[i]);
 
 		fsck_reada_node_block(sbi, nid);
 	}
 }
 
+static bool is_zeroed(const u8 *p, size_t size)
+{
+	size_t i;
+
+	for (i = 0; i < size; i++) {
+		if (p[i])
+			return false;
+	}
+	return true;
+}
+
 int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 		struct f2fs_node *inode)
 {
 	void *xattr;
 	void *last_base_addr;
 	struct f2fs_xattr_entry *ent;
 	__u32 xattr_size = XATTR_SIZE(&inode->i);
+	bool need_fix = false;
 
 	if (xattr_size == 0)
 		return 0;
 
 	xattr = read_all_xattrs(sbi, inode, false);
 	ASSERT(xattr);
 
 	last_base_addr = (void *)xattr + xattr_size;
 
 	list_for_each_xattr(ent, xattr) {
 		if ((void *)(ent) + sizeof(__u32) > last_base_addr ||
 			(void *)XATTR_NEXT_ENTRY(ent) > last_base_addr) {
 			ASSERT_MSG("[0x%x] last xattr entry (offset: %lx) "
 					"crosses the boundary",
 					nid, (long int)((void *)ent - xattr));
-			if (c.fix_on) {
-				memset(ent, 0,
-					(char *)last_base_addr - (char *)ent);
-				write_all_xattrs(sbi, inode, xattr_size, xattr);
-				FIX_MSG("[0x%x] nullify wrong xattr entries",
-						nid);
-				return 1;
-			}
+			need_fix = true;
 			break;
 		}
 	}
-
+	if (!need_fix &&
+	    !is_zeroed((u8 *)ent, (u8 *)last_base_addr - (u8 *)ent)) {
+		ASSERT_MSG("[0x%x] nonzero bytes in xattr space after "
+				"end of list", nid);
+		need_fix = true;
+	}
+	if (need_fix && c.fix_on) {
+		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
+		write_all_xattrs(sbi, inode, xattr_size, xattr);
+		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
+		free(xattr);
+		return 1;
+	}
+	free(xattr);
 	return 0;
 }
 
 /* start with valid nid and blkaddr */
 void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		enum FILE_TYPE ftype, struct f2fs_node *node_blk,
 		u32 *blk_cnt, struct f2fs_compr_blk_cnt *cbc,
 		struct node_info *ni, struct child_info *child_d)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);

base-commit: 104b6b83206a9919d4b10f310981cc99fbbc8ed1
-- 
2.42.0.820.g83a721a137-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
