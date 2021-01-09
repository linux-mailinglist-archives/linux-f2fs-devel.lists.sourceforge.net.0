Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E42EFE5D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9AL-0002Hn-SN; Sat, 09 Jan 2021 08:00:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9AK-0002HV-4b
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqtMUSMHjA+QOZ916Gt3rDOwy86ZDbjkYjpTDTpGArE=; b=Txi3W17dBFJF74ApHD9nSLcb45
 3hd+pwAqROL/D3Zwrpo3L1WqB3MOAylXqb0sWujLTxt1L4WnESYJ118ZnweRwy5LzT3JboxctZ9/r
 08ieIZ2TeYgbOppo4tpoXOs8CZ8azpPE0M1iePAclD5XMJ0fDVbpdGgjJUXoUJbm3wJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lqtMUSMHjA+QOZ916Gt3rDOwy86ZDbjkYjpTDTpGArE=; b=JjOq+oLe2Qz3CYbb25sedR/RLZ
 5Xys2XX14mbRf6r1GqTyyWcZZY0qgXvTuzoPaCMrvYD6cMnSVs+mJb+GxY0oDMdXTgf22rDcgNDhR
 B3hpZw1gwAtukykK6JGfP4FcTGJpqJXUoEjS6cW8uB6nq5rSVhmP3EL7Doj7q6x9RnwY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AA-00Dmpn-MW
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A956023A60;
 Sat,  9 Jan 2021 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179184;
 bh=UAs5pZYbnHEbB32I8gYpVHYl5ps5DskVBX1/zJ7HEQk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DoT+M+0x7oiHSACHnRZzbGNiIWW5upkwVfH5++ixOztpM5YOvybegB3g8nXEEicEj
 hl9mqWdNzhULeIjdHYsBv+IIOy70YPKx+OnBYbIlw3VzIfSrtA9C5muhIc968rY8KL
 psdI6/oG5oFnHsmSOi3lhhQEnSxSHHuKFZ2BFmrDsb/dQN8dkJXZjy2zvQwHBiyFzs
 j8DRYBIyioPgHaWnWsWd5nzp8XorZgiGmYdvIabwlvn12r8nXbaYTj/qwxn2S2Hpgd
 PSWWYIA2IDr1UMOe5W3Z1b80Sp9fXxraUFqynwAjlDyfYatd1Rdx8WS8DbSy+rjXRV
 jReLDxw0TkFXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:58:54 -0800
Message-Id: <20210109075903.208222-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AA-00Dmpn-MW
Subject: [f2fs-dev] [PATCH v2 03/12] fs: only specify I_DIRTY_TIME when
 needed in generic_update_time()
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

generic_update_time() always passes I_DIRTY_TIME to
__mark_inode_dirty(), which doesn't really make sense because (a)
generic_update_time() might be asked to do only an i_version update, not
also a timestamps update; and (b) I_DIRTY_TIME is only supposed to be
set in i_state if the filesystem has lazytime enabled, so using it
unconditionally in generic_update_time() is inconsistent.

As a result there is a weird edge case where if only an i_version update
was requested (not also a timestamps update) but it is no longer needed
(i.e. inode_maybe_inc_iversion() returns false), then I_DIRTY_TIME will
be set in i_state even if the filesystem isn't mounted with lazytime.

Fix this by only passing I_DIRTY_TIME to __mark_inode_dirty() if the
timestamps were updated and the filesystem has lazytime enabled.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/inode.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 6442d97d9a4ab..d0fa43d8e9d5c 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1743,24 +1743,26 @@ static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
 
 int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
 {
-	int iflags = I_DIRTY_TIME;
-	bool dirty = false;
-
-	if (flags & S_ATIME)
-		inode->i_atime = *time;
-	if (flags & S_VERSION)
-		dirty = inode_maybe_inc_iversion(inode, false);
-	if (flags & S_CTIME)
-		inode->i_ctime = *time;
-	if (flags & S_MTIME)
-		inode->i_mtime = *time;
-	if ((flags & (S_ATIME | S_CTIME | S_MTIME)) &&
-	    !(inode->i_sb->s_flags & SB_LAZYTIME))
-		dirty = true;
-
-	if (dirty)
-		iflags |= I_DIRTY_SYNC;
-	__mark_inode_dirty(inode, iflags);
+	int dirty_flags = 0;
+
+	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
+		if (flags & S_ATIME)
+			inode->i_atime = *time;
+		if (flags & S_CTIME)
+			inode->i_ctime = *time;
+		if (flags & S_MTIME)
+			inode->i_mtime = *time;
+
+		if (inode->i_sb->s_flags & SB_LAZYTIME)
+			dirty_flags |= I_DIRTY_TIME;
+		else
+			dirty_flags |= I_DIRTY_SYNC;
+	}
+
+	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+		dirty_flags |= I_DIRTY_SYNC;
+
+	__mark_inode_dirty(inode, dirty_flags);
 	return 0;
 }
 EXPORT_SYMBOL(generic_update_time);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
