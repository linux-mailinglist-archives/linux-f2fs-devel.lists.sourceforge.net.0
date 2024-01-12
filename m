Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F0182C492
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 18:17:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOL9U-000690-RV;
	Fri, 12 Jan 2024 17:17:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rOL9T-00068t-L7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 17:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=liF3vtcdzBZo47/KspwGwE27wtHQ9MztXTADu2RcTlU=; b=i56MJ+73WJ2FvffJ69e5cV16eh
 UyfS2NTXDU2UNZasevVNSiKQfgZeaqOzDi+V/G7nt9NmMWquOg5g4tKrdd7ZlQTIkPVUyqid8gTYW
 XkQ7Tj+Fa+ufvsK2l7SJ/CdSIeG3IHAYXcdpnc2KHWsncBQkasbAxc6jHn9O6IL9+BN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=liF3vtcdzBZo47/KspwGwE27wtHQ9MztXTADu2RcTlU=; b=a
 h6NjeLdIVYPbcxm+/FA24GLiHjvfbtN2uw5RVOiDDjccLHn2kPbDSJ4bL9WppiGrAkvDKDrz0aHi2
 SpIMthN16yinNfXm8ahTo+goJ0foJNAouxGYbxkbcmVqk2nCPC3ql64rHciDbx5rUCdUkVEiIvZb4
 jDErmuYjv4PRLQbs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOL9T-0000LD-1T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 17:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2456C61E13;
 Fri, 12 Jan 2024 17:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B79C433C7;
 Fri, 12 Jan 2024 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705079812;
 bh=lryv/farYg+kjJnYzgoPmLVHiOFuDwPZIzxjpW3gLXk=;
 h=From:To:Cc:Subject:Date:From;
 b=kJjpyS+WcmdNVBnqw2w0+DO9Nx1eDtj14ip+T9pZ4gGXCSR1tgVZBju9cf5qT7JaV
 TwFkmGRPWyYxGd2Kdz353JHiLwRPBp7mo8biHW+YkVtn3cjgCbIg42f+t6o+cQI220
 /V7LfJOaA0WIpnGaNuJF5fBFzD5Sb2GIYpL/fxfJBUCIVLt9J+XKHkYY/kYRJZw/CU
 vZMTFfORwmK+mwkSEsZZD/thYi9ongQqzksdhZ+6wlkrdnTNlMUBbRrfvKvsPiDeY9
 +eBWAQIrV9YAeLA/E8fkLbRpzxmdp2VFvUxNpU2axoHLnWOspls3U+UmGXeZmbXwhx
 gJKVx299R+VIQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jan 2024 09:16:45 -0800
Message-ID: <20240112171645.3929428-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
MIME-Version: 1.0
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [1] changed the below condition, which made f2fs_put_page()
 voided. This patch reapplies the AL's resolution in -next from [2]. - if
 (S_ISDIR(old_inode->i_mode)) { + if (old_is_dir && old_dir != new_dir) {
 old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_page);
 if (!old_dir_entry) { if (IS_ERR(old_dir_page))
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOL9T-0000LD-1T
Subject: [f2fs-dev] [PATCH] f2fs: remove unnecessary f2fs_put_page in
 f2fs_rename
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[1] changed the below condition, which made f2fs_put_page() voided.
This patch reapplies the AL's resolution in -next from [2].

-       if (S_ISDIR(old_inode->i_mode)) {
+       if (old_is_dir && old_dir != new_dir) {
                old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_page);
                if (!old_dir_entry) {
                        if (IS_ERR(old_dir_page))

[1] 7deee77b993a ("f2fs: Avoid reading renamed directory if parent does not change")
[2] https://lore.kernel.org/all/20231220013402.GW1674809@ZenIV/

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/namei.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b3bb815fc6aa..ba11298b7837 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1105,14 +1105,11 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		iput(whiteout);
 	}
 
-	if (old_is_dir) {
-		if (old_dir_entry)
-			f2fs_set_link(old_inode, old_dir_entry,
-						old_dir_page, new_dir);
-		else
-			f2fs_put_page(old_dir_page, 0);
+	if (old_dir_entry)
+		f2fs_set_link(old_inode, old_dir_entry, old_dir_page, new_dir);
+	if (old_is_dir)
 		f2fs_i_links_write(old_dir, false);
-	}
+
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT) {
 		f2fs_add_ino_entry(sbi, new_dir->i_ino, TRANS_DIR_INO);
 		if (S_ISDIR(old_inode->i_mode))
-- 
2.43.0.275.g3460e3d667-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
