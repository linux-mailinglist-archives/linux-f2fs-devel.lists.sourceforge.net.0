Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0252EA1B4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadP-0008OE-HT; Tue, 05 Jan 2021 00:55:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadL-0008Nc-Ic
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TT7AIewAbzYcrkWXkN0bLyKiPMKGMRsC6rc0/t8u4iY=; b=f29Y2HqNttK7hAJKltdWoheYAG
 Gn1cyu8cH8eEQzcN15AZzFjNSKl3pkSBrlo80Xib+MvmZ31J7CLPYCkOmkZcNFMwxedU4+3cWVlHw
 WdyP5b+rtLTy3y2v7gKl4vEfC+Ms66mfwwAzeI00IrUv1V6nRy7TYoXLKrOux5qe/xM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TT7AIewAbzYcrkWXkN0bLyKiPMKGMRsC6rc0/t8u4iY=; b=jlexAdc1gNA3PwKr2Il6l4M6Io
 x9dRvPCXCJnESt3+wsLgQzpdmA1pYXEcO+5lzy5MPsOazQsZ830l5u8dLvyOty5iF801b4PL6WlbF
 h09suTsaG+GSFnF0GUscSiGNLw49oSBk+ik2jgnB20lQvVh4gtE862m5Meutul9DS3YE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadH-008Hll-LJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 775A0225AB;
 Tue,  5 Jan 2021 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808109;
 bh=msnnxCLzPo2DYdIqcuEghPRawTGVOjAsHU3RAs/RXao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hohi5mOdPwavJo+wbNII2B4bRm29y9bMy1xU4F+Jc0L/sOVNQ1trYDZZpnkX/WiPg
 TZokPX7i3KW5A6qMfqYlNo0CcI4aybTOLGBHD9wALvx1J8DilxPMxmG3OwPBUTAMAq
 0Pbedq2YIJ2graQdydC7vnPV+w6iIgMnjZsfkqTsB/VMVQxPK6Htv4EA6AmuM1xkx5
 PzYgNOn1ozvjDbtHlotxJRK4GJ78x9ldPbO601uaEuWL7bOkgs6ZlhoOzeSfPOQLR2
 J2wtQdpijkV8cUN03mkDjecwwx0fXpzgLuJf2qx6Y35nJ4YPTU6rBdU5fH2Mfa91Mj
 tiXtmTpPToffA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:48 -0800
Message-Id: <20210105005452.92521-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105005452.92521-1-ebiggers@kernel.org>
References: <20210105005452.92521-1-ebiggers@kernel.org>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwadH-008Hll-LJ
Subject: [f2fs-dev] [PATCH 09/13] fs: drop redundant checks from
 __writeback_single_inode()
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

I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state.  So
after seeing that I_DIRTY_TIME is set, there's no point in checking for
I_DIRTY_INODE, as it must be clear.

Separately, wbc->for_sync implies wbc->sync_mode == WB_SYNC_ALL.
So there's no need to check for both.  Just check for WB_SYNC_ALL.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fs-writeback.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index f20daf4f5e19b..3f5a589399afe 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1482,8 +1482,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 
 	dirty = inode->i_state & I_DIRTY;
 	if ((inode->i_state & I_DIRTY_TIME) &&
-	    ((dirty & I_DIRTY_INODE) ||
-	     wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
+	    (wbc->sync_mode == WB_SYNC_ALL ||
 	     time_after(jiffies, inode->dirtied_time_when +
 			dirtytime_expire_interval * HZ))) {
 		dirty |= I_DIRTY_TIME;
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
