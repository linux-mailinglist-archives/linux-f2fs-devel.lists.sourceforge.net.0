Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F0C379124
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:42:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg77N-0004AX-07; Mon, 10 May 2021 14:42:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lg77K-0004AL-I0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Px3zF2E1unRr1TiaMN8ifLzVpfYCJrVWAsz5Zb0TbJk=; b=HK89RYFv6+6N5S3/kJjy+yjAWX
 ZIpWcotZ0Qsv5DOvrPsAM20XlFcP3IG56+bPVSnHYXH0Ud3BPLQdcJ5z3QPJKWEx70+C55aVYP4zl
 yacRRL7mSXTM0hvUqcM50TbrstjRknvjwMXwqjeV1UXYlWUq1n5NE1jVfsG2+E90OUXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Px3zF2E1unRr1TiaMN8ifLzVpfYCJrVWAsz5Zb0TbJk=; b=mxacu8YNINdvP/hY8sBAVCwGVs
 K9DOl6UblOqYBTE+3ukXyUSrEkgsEfrOWdg/GAGr6ionbULudzE+nctFPMHBzzOO7HOAl5XZe0/Nh
 C0vJ9Fl97j6vocwETksARsV9iQY/8KKyEbnoyh8mCVvmun1VgvlMJtN1tEYVMbyN6PbQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg77C-0028NO-9r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:42:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE505613B6;
 Mon, 10 May 2021 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620657748;
 bh=+zaTw2MyhWZVx6mLMle52nf82JFa4RkhC/eaBmVOGqw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=EuS1/s50iuxWebKL/qEe+XTto+YydQ8k9+cOQralxHFdsGYn4lcfefmtE0MLmhpjN
 65ihnBZX4cwS0FywI3zAO2P5Vf9FbtUqeAKaLywFdU3vk56ThylUJCT0OUtzdh1H79
 n9/0l9ab6ZlBq8zjz3pAMwxLN3BSwfDgSmoY7gzNqAwy2mH/ErmJNt/BFp7VTKpFUO
 31EFACexSkoBxucPDd75Pqn54ZGitKtHTyPBDJTm+BQJq4fYbLlhXc5tMI9qxHdiwz
 a/9XHR4uY10VOmFtSOtD9nyLLR7TXM2isNp3llFom4Z8aBCd/9NdxUqXJbzyNPrUjn
 Rfj62WVuqptTQ==
Date: Mon, 10 May 2021 07:42:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YJlGU+STYD5geyIc@google.com>
References: <20210506191347.1242802-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506191347.1242802-1-jaegeuk@kernel.org>
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
X-Headers-End: 1lg77C-0028NO-9r
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support iflag change given the mask
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

In f2fs_fileattr_set(),

	if (!fa->flags_valid)
		mask &= FS_COMMON_FL;

In this case, we can set supported flags by mask only instead of BUG_ON.

/* Flags shared betwen flags/xflags */
	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
	 FS_PROJINHERIT_FL)

Fixes: 4c5b47997521 ("vfs: add fileattr ops")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 44a4650aea7b..ceb575f99048 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1817,7 +1817,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	u32 masked_flags = fi->i_flags & mask;
 
-	f2fs_bug_on(F2FS_I_SB(inode), (iflags & ~mask));
+	/* mask can be shrunk by flags_valid selector */
+	iflags &= mask;
 
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
-- 
2.31.1.607.g51e8a6a459-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
