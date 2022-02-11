Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFC4B1E53
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 07:13:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIPBk-0005HY-5l; Fri, 11 Feb 2022 06:13:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nIPBi-0005HC-J7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gXqC7l9rLDFscewAsIXWvttxHgxsPGFU/FwFqZvI8S4=; b=eE9yzhRNJ6NDLDbie3O9b45Ze2
 HmOVg6OWE0ISXhzgNhT8gmRKChWq0hI6nqurUB/20Ikok6ouwsWe854mxQjA55XSfLEcmd0qWmETH
 zs+LlvPk3zrez+WyMQLwrzNIKD8EEeR1c5bZe9HeghCz9U2KouJm3RrYdK52vr+Hoc7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gXqC7l9rLDFscewAsIXWvttxHgxsPGFU/FwFqZvI8S4=; b=UZfBwk/5zxhWQ/ciqo3Pj7nsKj
 +L5uExxK5ZAsBPHe85VsF1pxV7LeR/DmmGVySd6SL1ZXLoDIuU6P32VMYUDoYZGiClv+TnssGUETG
 NVQIRA4cfbXvjAjT9ouGMkSgPZ3y+iJsoWv4WTpE/2AYm5VVyzWqtjET8NQvDXPC+o8s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nIPBa-0004iA-Ba
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:13:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D0F1619F3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Feb 2022 06:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F763C340E9;
 Fri, 11 Feb 2022 06:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644560008;
 bh=jpGDy6Iy7Lo9fogGzTmc2GQJ7sIvAivYezF205RJ4lY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5oljZ81biLnBS5BIZSFLCaQNbO8BT9flCghj93ZNPYevL2x97V9cL70f+0OTjZB7
 YaDQg0DWg6jqiDXl1xm3/0SccUH/08SSwJPra1x34o4LMY4jbEoJWsemamfzGtJJtc
 tIOWVjkWq7tfX9djN2zl686fTjTGvfsiq62KC6AxEpmFTskaZ4Zap5qAvBLHmvB8YU
 n1aSA8NrdBc0Dc8jWEpVtlOnkFJlCDiyZdxoPp9bzsAWIZ2JKGokceWj72XsMImzTd
 bmoEMCO52S7A8djx05UFxNFaKLHEEt/Q4KUITmwr97YiVaIW3ibM+rANlmQqXfWiU4
 xpVwFf2mNlHdg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 10 Feb 2022 22:11:56 -0800
Message-Id: <20220211061158.227688-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211061158.227688-1-ebiggers@kernel.org>
References: <20220211061158.227688-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Currently, if an
 f2fs filesystem is mounted with the mode=lfs and io_bits mount options, DIO
 reads are allowed but DIO writes are not. Allowing DIO reads but not DIO
 writes is an unusual restriction, [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nIPBa-0004iA-Ba
Subject: [f2fs-dev] [RFC PATCH 5/7] f2fs: don't allow DIO reads but not DIO
 writes
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Currently, if an f2fs filesystem is mounted with the mode=lfs and
io_bits mount options, DIO reads are allowed but DIO writes are not.
Allowing DIO reads but not DIO writes is an unusual restriction, which
is likely to be surprising to applications, namely any application that
both reads and writes from a file (using O_DIRECT).  Given this, let's
drop the support for DIO reads in this configuration.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 26c51517c2a30..61ff0fc16e160 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -822,7 +822,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int rw = iov_iter_rw(iter);
 
 	if (!fscrypt_dio_supported(inode))
 		return true;
@@ -840,7 +839,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	 */
 	if (f2fs_sb_has_blkzoned(sbi))
 		return true;
-	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
+	if (f2fs_lfs_mode(sbi)) {
 		if (block_unaligned_IO(inode, iocb, iter))
 			return true;
 		if (F2FS_IO_ALIGNED(sbi))
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
