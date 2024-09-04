Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316096AF0D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 05:18:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slgX5-0006Tv-SU;
	Wed, 04 Sep 2024 03:18:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slgX4-0006Tn-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bdvZIDpCjZTahtq1pwemrlYIoukz8ubMheMWb3aQ5g=; b=JtWMtayY1Ogb7fjJHhGXWPxYAb
 WqX4nBFZgMuW2+ZPeF2L+HIQxNw1NMfZhHOPgLBHT2OfEfrXIidCOZxJxfN+5/UeONWjSy8wuIKDM
 ILLdUH4UrSkMXJsRXjZSYRDVTWfsQZduaGVEmI47sbcdpz2MIvkBswt03dW5O2BYb7zA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8bdvZIDpCjZTahtq1pwemrlYIoukz8ubMheMWb3aQ5g=; b=B
 krs05CRlBxui/cSuFXesQ6azwuinwSnO+69qRKAL94q8tP12WaX/MmIWzBuUv1yetRkfIHAdBfdOq
 lGwQ6QJbqiINgMVQogrPEPp7YlnQMkWaJVRDXDdg29nJaQQlmH9C7kaLAfb8yKRqRkIhGq+I4KJq7
 8h0guDoF0WaGnacE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slgX4-0005Ib-35 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 514005C0FAE;
 Wed,  4 Sep 2024 03:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554F0C4CEC4;
 Wed,  4 Sep 2024 03:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725419879;
 bh=qRbiznnrsRgEA3Web+4SIwc4T8tzRKG87HpRd1ZIWME=;
 h=From:To:Cc:Subject:Date:From;
 b=O81kw72NwaHlj0dW1QoCyxOPnKdYYhLaOMECqwNdxiyyg4r5xriSiBezA4bqsTR3A
 NYfFREvdWokMj2kWmmqnOwP6eMsiayYCijf0huWJhLnKt4Imk7e23v9GRWPb/IHFh7
 ogGT/wBXnqcTYaT3VoYAqwId/kkE3XjUzey5yWKqU2j1sPkgkLi7yneZv+4kwcrYuz
 GMp5UeuoQCiYvfQLDB+WzHRrkgCja2jAUCyRMNXSust2IP/0GwCt5iMl8heGXDMZ9b
 OWk738+rh+3LjQglPrZy79F3ahnyMVlsxSIMZ/NkgqU6cxdSRgH1ckZMMI8zXbitiW
 vZ+0EOPTYefuw==
To: jaegeuk@kernel.org
Date: Wed,  4 Sep 2024 11:17:45 +0800
Message-Id: <20240904031746.1262403-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If there are double '.' or '..' dirents in directory,
 fsck.f2fs
 won't detect and repaire the issue correctly, fix it. Reviewed-by: Sheng
 Yong <shengyong@oppo.com> Signed-off-by: Chao Yu <chao@kernel.org> ---
 fsck/fsck.c
 | 55 +++++++++++++++++++++++++++++++ fsck/fsck.h | 3 ++- include/f2fs_fs.h
 | 6 +++ [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slgX4-0005Ib-35
Subject: [f2fs-dev] [PATCH 1/2] fsck.f2fs: fix to detect double '.' or '..'
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If there are double '.' or '..' dirents in directory, fsck.f2fs won't
detect and repaire the issue correctly, fix it.

Reviewed-by: Sheng Yong <shengyong@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c       | 55 +++++++++++++++++++++++++++++++----------------
 fsck/fsck.h       |  3 ++-
 include/f2fs_fs.h |  6 ++++++
 3 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index a18bee9..54ddc11 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1307,10 +1307,10 @@ skip_blkcnt_fix:
 						nid, i_links, child.links);
 			}
 		}
-		if (child.dots < 2 &&
+		if ((child.dot == 0 || child.dotdot == 0) &&
 				!(node_blk->i.i_inline & F2FS_INLINE_DOTS)) {
-			ASSERT_MSG("ino: 0x%x dots: %u",
-					nid, child.dots);
+			ASSERT_MSG("ino: 0x%x dot: %u, dotdot: %u",
+					nid, child.dot, child.dotdot);
 			if (c.fix_on) {
 				node_blk->i.i_inline |= F2FS_INLINE_DOTS;
 				need_fix = 1;
@@ -1862,26 +1862,45 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 
 		/* Becareful. 'dentry.file_type' is not imode. */
 		if (ftype == F2FS_FT_DIR) {
-			if ((name[0] == '.' && name_len == 1) ||
-				(name[0] == '.' && name[1] == '.' &&
-							name_len == 2)) {
-				ret = __chk_dots_dentries(sbi, casefolded, &dentry[i],
-					child, name, name_len, &filenames[i],
-					enc_name);
-				switch (ret) {
-				case 1:
+			enum dot_type dot_type = NON_DOT;
+
+			if (name[0] == '.' && name_len == 1)
+				dot_type = TYPE_DOT;
+			else if (name[0] == '.' && name[1] == '.' &&
+						name_len == 2)
+				dot_type = TYPE_DOTDOT;
+
+			if (dot_type != NON_DOT) {
+				bool need_del = false;
+
+				DBG(3, "i:%u, dot_type:%u, ino:%u, p:%u, pp:%u\n",
+					i, dot_type, dentry[i].ino,
+					child->p_ino, child->pp_ino);
+
+				ret = __chk_dots_dentries(sbi, casefolded,
+					&dentry[i], child, name, name_len,
+					&filenames[i], enc_name);
+				if (ret)
 					fixed = 1;
-					fallthrough;
-				case 0:
-					child->dots++;
-					break;
+
+				if (dot_type == TYPE_DOT) {
+					if (child->dot == 0)
+						child->dot++;
+					else
+						need_del = true;
+				} else if (dot_type == TYPE_DOTDOT) {
+					if (child->dotdot == 0)
+						child->dotdot++;
+					else
+						need_del = true;
 				}
 
-				if (child->dots > 2) {
-					ASSERT_MSG("More than one '.' or '..', should delete the extra one\n");
+				if (need_del) {
+					ASSERT_MSG("More than one '%s', should delete the extra one, i: %u, ino:%u",
+						dot_type == TYPE_DOT ? "." : "..",
+						i, dentry[i].ino);
 					nullify_dentry(&dentry[i], i,
 						       &filenames[i], &bitmap);
-					child->dots--;
 					fixed = 1;
 				}
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index a8f187e..efccfbc 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -70,7 +70,8 @@ struct child_info {
 	u32 links;
 	u32 files;
 	u32 pgofs;
-	u8 dots;
+	u8 dot;
+	u8 dotdot;
 	u8 dir_level;
 	u32 p_ino;		/* parent ino */
 	char p_name[F2FS_NAME_LEN + 1]; /* parent name */
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 15a1c82..0b6777a 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1429,6 +1429,12 @@ enum FILE_TYPE {
 	F2FS_FT_LAST_FILE_TYPE = F2FS_FT_XATTR,
 };
 
+enum dot_type {
+	NON_DOT,
+	TYPE_DOT,
+	TYPE_DOTDOT
+};
+
 #define LINUX_S_IFMT  00170000
 #define LINUX_S_IFREG  0100000
 #define LINUX_S_IFDIR  0040000
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
