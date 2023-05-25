Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493A7109CB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 12:16:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q281R-0004Hr-Ja;
	Thu, 25 May 2023 10:16:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q281L-0004He-JP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qb4QVxqWbxY1BUOm/HZ1IAfPjmpuRF1GxZ/XtPI44ow=; b=hmO08YZ1vSg6SuD381Lqb+Yr9B
 swlfm2uHpS2zImeDYfr620Ru6w+YNDngThg3+0nfD9CLLHDCETdCLjz8d6DCm0MSoqb3EovaQQdbQ
 aX9GMj/qpSdzqrVZuOBzc7KEwlZodEwbAF4bC/Dt+LVXG+JBRyz6Agn4/Phhzc6dq3io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qb4QVxqWbxY1BUOm/HZ1IAfPjmpuRF1GxZ/XtPI44ow=; b=Zd5ljB6HrRFz/PSwHqgo6Uyg1p
 drGFR+v1AzF4/b4b+4P82b2rxb0/DcMIHJ/Bn+aP0luaoj/prGzPB4YJQTftq4eq90lv57pFnCRnk
 AFqMiKNPX7Tor029bkaAcltQluBCRSO3AYK5j4t0LBuENHoq5ZaOAEbyp9DkV7EuwxdQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q281J-0004Uu-Jl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73BB41FDFD;
 Thu, 25 May 2023 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685009785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qb4QVxqWbxY1BUOm/HZ1IAfPjmpuRF1GxZ/XtPI44ow=;
 b=dtO9RTZnM1fRgA0bjNf++oA62lCe+zVeecOqlSOBb/tz4PcV5d2oX7oWQYpalOoEH6ZpoN
 9pwOiU+ZoJTOq2RvRat5ivePyYu3GhG3k9KnsE8N9wLaGW0qy6tRlbbtPacjvFXOxtexoz
 IDlZaYBrVerxDU+oekFobdFaKAWYjAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685009785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qb4QVxqWbxY1BUOm/HZ1IAfPjmpuRF1GxZ/XtPI44ow=;
 b=efn70QkU372o8H6xDPqEw653+1DqpgjqZS4dC7xtD6/6Za7bbNHH+Xn3DXt+ylh+mLACOZ
 5TIb4krY6txILKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61B8313A2C;
 Thu, 25 May 2023 10:16:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P9zvF3k1b2RUdgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 25 May 2023 10:16:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 71E21A0765; Thu, 25 May 2023 12:16:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 25 May 2023 12:16:12 +0200
Message-Id: <20230525101624.15814-6-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230525100654.15069-1-jack@suse.cz>
References: <20230525100654.15069-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=jack@suse.cz;
 h=from:subject; bh=19vPa5MXihbI/vWBHK7A4hiBHoUR5MdlQiCbMXq3hU8=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkbzVrykH7A7q3YHZUXsS6ieeUX672QjHsKNA8icRS
 hsWFj0GJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZG81awAKCRCcnaoHP2RA2YARB/
 9gmSc9fUNiS36GUafnxhkegVOmOuan17kymaFtzzDDxN0mssrXV2LmeEzAklvwvI0n34vYU6TMF47N
 kBXJYSEm04O/dr8b+YfAm/fBhg7ZLnlX1a4KmqVwsadXXB+YZ1dlWniYhakV2xlyKu8HwETV1ghFsD
 usEyvQwXBA0f9yabKbZ3tQcXBh30hqIuffinSeGCr5mZpGkB4sBiO8Qsnq65x0kJMNZnk5aVxHbIfT
 zrdP+6kkv7TYve3PtK+qeTwrbYiTcEMLz3mJ8azfb8TbOfGicp7mzhJhPJJyjaYUO8x71eEVNNVWHr
 EfU5sthG72webH7lxc9Nooo8hkuKpN
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently lock_two_nondirectories() is skipping any passed
 directories. After vfs_rename() uses lock_two_inodes(), all the remaining
 four users of this function pass only regular files to it. So drop [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q281J-0004Uu-Jl
Subject: [f2fs-dev] [PATCH 6/6] fs: Restrict lock_two_nondirectories() to
 non-directory inodes
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently lock_two_nondirectories() is skipping any passed directories.
After vfs_rename() uses lock_two_inodes(), all the remaining four users
of this function pass only regular files to it. So drop the somewhat
unusual "skip directory" logic and instead warn if anybody passes
directory to it. This also allows us to use lock_two_inodes() in
lock_two_nondirectories() to concentrate the lock ordering logic in less
places.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/inode.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 2015fa50d34a..accf5125a049 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1140,7 +1140,7 @@ void lock_two_inodes(struct inode *inode1, struct inode *inode2,
 /**
  * lock_two_nondirectories - take two i_mutexes on non-directory objects
  *
- * Lock any non-NULL argument that is not a directory.
+ * Lock any non-NULL argument. Passed objects must not be directories.
  * Zero, one or two objects may be locked by this function.
  *
  * @inode1: first inode to lock
@@ -1148,13 +1148,9 @@ void lock_two_inodes(struct inode *inode1, struct inode *inode2,
  */
 void lock_two_nondirectories(struct inode *inode1, struct inode *inode2)
 {
-	if (inode1 > inode2)
-		swap(inode1, inode2);
-
-	if (inode1 && !S_ISDIR(inode1->i_mode))
-		inode_lock(inode1);
-	if (inode2 && !S_ISDIR(inode2->i_mode) && inode2 != inode1)
-		inode_lock_nested(inode2, I_MUTEX_NONDIR2);
+	WARN_ON_ONCE(S_ISDIR(inode1->i_mode));
+	WARN_ON_ONCE(S_ISDIR(inode2->i_mode));
+	lock_two_inodes(inode1, inode2, I_MUTEX_NORMAL, I_MUTEX_NONDIR2);
 }
 EXPORT_SYMBOL(lock_two_nondirectories);
 
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
