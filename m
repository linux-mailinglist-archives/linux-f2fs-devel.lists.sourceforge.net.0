Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41253ADBB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 22:45:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwVDM-0001hO-C6; Wed, 01 Jun 2022 20:45:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nwVDL-0001hB-9N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnce1kE7esaMucqzXjaZOV7uzfzoJyFdDzUfPSN4AW8=; b=XQWc3RvZy0PmpFuiu2h5/auY3B
 +KgbaMTYmSEmHiuquYjA/kuKeOOpPOarmxadsvbUcqBB3F1KyfoLtgnUiryJaii5cGK584OSn6LPm
 XrqXblAsz6OEY+//YC5UWc5hrn7SX1LiHcBiKJc+3FwDSHVIibqhD5YmT43OSlB8v6tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bnce1kE7esaMucqzXjaZOV7uzfzoJyFdDzUfPSN4AW8=; b=WriJeG2rdOIgRHMQomq6yLgNFF
 6kzPnEC//JIiTwnZaN0jlJnAf7D38chVwXUgx2/nfA2Lbn+MyW6mFw37DZU2JftadO5IgT9hzroPs
 cT/BVF0aQcTAmSj3GWPWCp3XxFSKirrxTble9HdKwHw25xQsHeS01+hefUrf/LTs4zs0=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwVDH-00029i-UU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:45:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id E34211F4398A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654116303;
 bh=EYpe7jq8IZWr8tink05axuBf87GgQR+c3mze25uRf3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gu2U+x1xr9c68jrHWXNn9eK1h9sFH7RfO+WWdoaw+vkefkr38W4doINXmEvoPn1hF
 HJfJBJPf9iSbKwIETQtwBHyaJieDSdQi1hcifoJVebxIlltN3BT5yN/ftwK3zBajJV
 m37KAbWpRVzhxtbWir2I1V70xgAx5OVPomi6LYsh3/w/1c257PBAeWSORU0JSj6kPm
 Vwo31RfttlP7sa2Y1fPWWM7wOX9JNlEHiUdsQPn3SiyRQAYU1f7NtG7ZqN5wIaD1X4
 S4yvqr7NkQy7u1+NwemQVm0aWqY2s0QthVcsV6y8UeMPCk/sT/DyB6bcrq+CzuIJy5
 SOei/Uj4PJ/4A==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org
Date: Wed,  1 Jun 2022 16:44:36 -0400
Message-Id: <20220601204437.676872-7-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601204437.676872-1-krisman@collabora.com>
References: <20220601204437.676872-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Instead of invalidating negative dentries during
 case-insensitive
 lookups, mark them as such and let them be added to the dcache. d_ci_revalidate
 is able to properly filter them out if necessary based [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nwVDH-00029i-UU
Subject: [f2fs-dev] [PATCH RFC 6/7] ext4: Enable negative dentries on
 case-insensitive lookup
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Instead of invalidating negative dentries during case-insensitive
lookups, mark them as such and let them be added to the dcache.
d_ci_revalidate is able to properly filter them out if necessary based
on the dentry casefold flag.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/ext4/namei.c | 35 ++++-------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 767b4bfe39c3..783ba0b186c1 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1800,16 +1800,9 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		}
 	}
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
-		/* Eventually we want to call d_add_ci(dentry, NULL)
-		 * for negative dentries in the encoding case as
-		 * well.  For now, prevent the negative dentry
-		 * from being cached.
-		 */
-		return NULL;
-	}
-#endif
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
+		d_set_casefold_lookup(dentry);
+
 	return d_splice_alias(inode, dentry);
 }
 
@@ -3126,17 +3119,6 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
 	ext4_fc_track_unlink(handle, dentry);
 	retval = ext4_mark_inode_dirty(handle, dir);
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	/* VFS negative dentries are incompatible with Encoding and
-	 * Case-insensitiveness. Eventually we'll want avoid
-	 * invalidating the dentries here, alongside with returning the
-	 * negative dentries at ext4_lookup(), when it is better
-	 * supported by the VFS for the CI case.
-	 */
-	if (IS_CASEFOLDED(dir))
-		d_invalidate(dentry);
-#endif
-
 end_rmdir:
 	brelse(bh);
 	if (handle)
@@ -3231,16 +3213,7 @@ static int ext4_unlink(struct inode *dir, struct dentry *dentry)
 	retval = __ext4_unlink(handle, dir, &dentry->d_name, d_inode(dentry));
 	if (!retval)
 		ext4_fc_track_unlink(handle, dentry);
-#if IS_ENABLED(CONFIG_UNICODE)
-	/* VFS negative dentries are incompatible with Encoding and
-	 * Case-insensitiveness. Eventually we'll want avoid
-	 * invalidating the dentries here, alongside with returning the
-	 * negative dentries at ext4_lookup(), when it is  better
-	 * supported by the VFS for the CI case.
-	 */
-	if (IS_CASEFOLDED(dir))
-		d_invalidate(dentry);
-#endif
+
 	if (handle)
 		ext4_journal_stop(handle);
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
