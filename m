Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EAD471972
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 10:17:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwKyq-0008DQ-3q; Sun, 12 Dec 2021 09:17:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mwKyo-0008D2-EJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 09:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7AwagigfbUQh3iqqlRkpbk/ZBUE0SiX4LeXPmVrpYOU=; b=QWQpDLNp0hd19JdPovmjz5bUJ/
 xh6SB9FxLUc1r5dWyDryJkwvEpWguiNUqqBzJoRo4wtif1h49u79foCLvg4VImAP0VTxim2U0WZlo
 pKtNJwGWOyEA7jrHp/O+z0WySiD1F7IROff9ytfITcFt5OrNf6EUSok48exZfzWl1n6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7AwagigfbUQh3iqqlRkpbk/ZBUE0SiX4LeXPmVrpYOU=; b=k
 EPFJ1zH7X2Wskg7Dw9cyf9j3QHCSp/0sIR5thxnPFY++WJtd0Aw2+smuDpw5qs6FmvytgCGYjm1FY
 avkWYe3p22QwqyNoMYryon1ijxCCX9H7On7DWIl8DmB2MY2tFjLT8J8kfftm0BttmBrpeZjbU9uOb
 3KIpaX3ZB/VhLKHU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwKyo-0003vT-O1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 09:17:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3C1FFCE0AB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 09:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D73C341C6;
 Sun, 12 Dec 2021 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639300621;
 bh=elxtjfKOhvAqmW+8MXAqawaVNnq4o0koS73lDKUoLus=;
 h=From:To:Cc:Subject:Date:From;
 b=tNp8drbx6GuzqUybqonJytE1Tz6DSkkDJZmCRv+WeUm90IWESDgxKAtpV8kt3Jqr+
 7AxTzONGEryLfP6023Wdj1UYsL9eRAyStLBWRdN/orBV+K0GviRkySm/JPlX6iApBy
 KkRM2llg3ZgyKie8M1WTlhmEKVfXUo5ti3Abece8nGRIHM055AaYTuNDpnouTTFTTn
 DCuuuHg3oqfhnnaW9GJyC/X0eE/kCeVjWoYdCGSQv8vM3H5McnRX8eIX1K0APs1jlo
 rv+WTirXbnYftuczuQbJLU4TeqviVSbh8HpcnmF7rX/D6oRBuaAYk1yQeIYtoXnDcX
 B3ovDj4G8XJbQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 12 Dec 2021 17:16:56 +0800
Message-Id: <20211212091656.6404-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup,
 no logic change. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/xattr.c | 29 +++++++++++ 1 file changed, 11 insertions(+), 18
 deletions(-) diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c index
 797ac505a075..8e5cd9c916ff
 100644 --- a/fs/f2fs/xattr.c +++ b/fs/f2fs/xattr.c @@ -226,15 +226,18 @@
 static inline const struct xattr_handler *f2fs_ [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwKyo-0003vT-O1
Subject: [f2fs-dev] [PATCH] f2fs: clean up __find_inline_xattr() with
 __find_xattr()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just cleanup, no logic change.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/xattr.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 797ac505a075..8e5cd9c916ff 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -226,15 +226,18 @@ static inline const struct xattr_handler *f2fs_xattr_handler(int index)
 }
 
 static struct f2fs_xattr_entry *__find_xattr(void *base_addr,
-				void *last_base_addr, int index,
-				size_t len, const char *name)
+				void *last_base_addr, void **last_addr,
+				int index, size_t len, const char *name)
 {
 	struct f2fs_xattr_entry *entry;
 
 	list_for_each_xattr(entry, base_addr) {
 		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
-			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr)
+			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
+			if (last_addr)
+				*last_addr = entry;
 			return NULL;
+		}
 
 		if (entry->e_name_index != index)
 			continue;
@@ -254,19 +257,9 @@ static struct f2fs_xattr_entry *__find_inline_xattr(struct inode *inode,
 	unsigned int inline_size = inline_xattr_size(inode);
 	void *max_addr = base_addr + inline_size;
 
-	list_for_each_xattr(entry, base_addr) {
-		if ((void *)entry + sizeof(__u32) > max_addr ||
-			(void *)XATTR_NEXT_ENTRY(entry) > max_addr) {
-			*last_addr = entry;
-			return NULL;
-		}
-		if (entry->e_name_index != index)
-			continue;
-		if (entry->e_name_len != len)
-			continue;
-		if (!memcmp(entry->e_name, name, len))
-			break;
-	}
+	entry = __find_xattr(base_addr, max_addr, last_addr, index, len, name);
+	if (!entry)
+		return NULL;
 
 	/* inline xattr header or entry across max inline xattr size */
 	if (IS_XATTR_LAST_ENTRY(entry) &&
@@ -368,7 +361,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	else
 		cur_addr = txattr_addr;
 
-	*xe = __find_xattr(cur_addr, last_txattr_addr, index, len, name);
+	*xe = __find_xattr(cur_addr, last_txattr_addr, NULL, index, len, name);
 	if (!*xe) {
 		f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
 								inode->i_ino);
@@ -659,7 +652,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	last_base_addr = (void *)base_addr + XATTR_SIZE(inode);
 
 	/* find entry with wanted name. */
-	here = __find_xattr(base_addr, last_base_addr, index, len, name);
+	here = __find_xattr(base_addr, last_base_addr, NULL, index, len, name);
 	if (!here) {
 		f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
 								inode->i_ino);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
