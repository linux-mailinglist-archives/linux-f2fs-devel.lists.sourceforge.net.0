Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A042E6A50
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Dec 2020 20:13:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktxxX-0000wb-0z; Mon, 28 Dec 2020 19:13:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ktxxW-0000wG-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 19:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7wBkScKlh545+jNDPyExD6bES0ElhkJBDoIa1kNlnU=; b=bQyWwLEWt+CRTsF2sXSibTl5fc
 yu3CyTe9BLvuGhtLKyUl3p6BW1VwgvEyD9sTLOQNxWiOphTMSinDnZ7ddpVil5ha005YO2VAu/7vc
 58gGszQetEXkB5ZSGbJcYbpfxm8InW72QGklqt/bv+aVD4svEm/bTzhqql2h7Eo5SVoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H7wBkScKlh545+jNDPyExD6bES0ElhkJBDoIa1kNlnU=; b=PgHCoShGLvxUgpwlUBAD0Hx2BL
 SCqW0rwK7qe1dDSydIMaMtjH5/ScEowbdJJ5fweUuoyyzbR3Ze0WiDjnlBZ9ZJ8sAABAU1HGxb3qY
 2aiT/CfXqSZtaW0UzguhQavgcqZhf0xGpBa0JHBr4wnNZTuoKC688UvuwJpQa6TnCw2s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktxxR-003H5x-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 19:13:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A51022B2C;
 Mon, 28 Dec 2020 19:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609182797;
 bh=IXmvQye9ZM3vzPLg/kY4jseJxfvpVBcbyPuNjzHTWF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jQya9WijPGAu5QKp6aRvs3aDB653D8Hv76AV5phKUMDyWFMiaAg4MHTwjj1RBt+7M
 iyq/ZgVltry9M+5t2oZs30wMF/G6NKjpDSCP1XT4ZmTnB067VauLZvLoC91sIZm7iw
 rkxpkiOCBwKY6rs/hwNhLjIlse4VYM8/FyBwuFDsCrFl3caRxhXwwvflQNIoNXRn5N
 ZDtjg/qlyXGK7W8/kndpbTOxYKbUJvmR7QFeuUdu+YQ1SZCDndIiP2EQkHPrLdN9kJ
 gfuDSlv09IpTCUmUEzasmBHTocNpQCUBmrVFqWHIx7yE7hUOJk8jOcu73YMA8+60hO
 KxlKk0BLmhKuA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Mon, 28 Dec 2020 11:12:10 -0800
Message-Id: <20201228191211.138300-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228191211.138300-1-ebiggers@kernel.org>
References: <20201228191211.138300-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ktxxR-003H5x-Sl
Subject: [f2fs-dev] [PATCH 4.19 3/4] f2fs: prevent creating duplicate
 encrypted filenames
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit bfc2b7e8518999003a61f91c1deb5e88ed77b07d upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on f2fs by rejecting no-key dentries in f2fs_add_link().

Note that the weird check for the current task in f2fs_do_add_link()
seems to make this bug difficult to reproduce on f2fs.

Fixes: 9ea97163c6da ("f2fs crypto: add filename encryption for f2fs_add_link")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-4-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/f2fs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53ffa6fe207a3..aacd8e11758ca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2857,6 +2857,8 @@ bool f2fs_empty_dir(struct inode *dir);
 
 static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
 {
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
 	return f2fs_do_add_link(d_inode(dentry->d_parent), &dentry->d_name,
 				inode, inode->i_ino, inode->i_mode);
 }
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
