Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F925375B84
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 May 2021 21:14:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lejRq-0000nv-00; Thu, 06 May 2021 19:14:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lejRo-0000n7-5p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 19:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWTrcWevnKSgcsLU0ifwZpMW/1cu+iXYgU6D9tyHUgc=; b=lHxJjAQib+lDATX5bmCtUxFbNO
 6moL3ZxUQyfM3st7bTSsOBw4ilcs+iUWcfZnxPL3zGAGHTbrf31xNri7m/xWJntbPF8DNFSKpn+IR
 Tz+/bPA1lTOEltlPSacyC3g/XX2QHilTkJqY7vD7vjUtDG+qnc0S9W00EZwegthkF+Rk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iWTrcWevnKSgcsLU0ifwZpMW/1cu+iXYgU6D9tyHUgc=; b=P
 sFvoglbEoWOqJhZVa6Q5t38OSt8cA7dFcDPQhggvrWnu8+a8PROI/7OwaH5XBvMVqa9Da7cC7mar2
 +YlFOX+6HilNxzcUwPYArkzMiPWWL+LgM+5F8jkrT8DN8C1wRGtaqEkMO17KM98aaIWVEUrXtuDof
 5ZkjUOalx5rn18V4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lejRg-0003EY-Gw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 19:14:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63B3C61107;
 Thu,  6 May 2021 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620328431;
 bh=Xd/ndCtgZJ2dO4cS5u02uHTb6AeNYHoi+rl86LUAbso=;
 h=From:To:Cc:Subject:Date:From;
 b=GYgkzkyezQq25+wnQeXre7srZxxQyVeHIWgdt+aJ9BwHucvGsxj8IqBFxcABjkdyf
 fTSQFXtZHhvZeevvP/MtiPeAZS7gaZK/9Hw2zF5fSRcQmrNLVYUs2w7hBeWQcNvDV6
 699A6NY5iSs56tuPkLBWjPVv/ikWYjzSIyrlTQEMsedhHv1sS8KAGlaDS3zOx6FB0J
 AurGdOsFF+ZI332T8HAT4lt4Wjn5INvv/eR8PDtB8yc3odCV0EuSuLP+HkZE+v6Z4O
 6mp9SKlDDkUVOM8EMd2Kv+8bvhef2RN6t/afdelMtddteKTSjucLS5ojIpNr4Fjaz3
 q8qiVhYbYmA7A==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  6 May 2021 12:13:47 -0700
Message-Id: <20210506191347.1242802-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lejRg-0003EY-Gw
Subject: [f2fs-dev] [PATCH] f2fs: return -EPERM given generic mask
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_fileattr_set(),

	if (!fa->flags_valid)
		mask &= FS_COMMON_FL;

In this case, we should not allow to set FS_COMPR_FL, instead of BUG_ON.

/* Flags shared betwen flags/xflags */
	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
	 FS_PROJINHERIT_FL)

Fixes: 4c5b47997521 ("vfs: add fileattr ops")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e01ce802cf10..38015ef84893 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1817,7 +1817,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	u32 masked_flags = fi->i_flags & mask;
 
-	f2fs_bug_on(F2FS_I_SB(inode), (iflags & ~mask));
+	/* mask can be shrunk by flags_valid selector */
+	if (iflags & ~mask)
+		return -EPERM;
 
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
-- 
2.31.1.607.g51e8a6a459-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
