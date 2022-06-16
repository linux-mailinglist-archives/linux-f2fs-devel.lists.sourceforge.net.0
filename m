Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7C54EAB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 22:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1vwj-0000g5-Km; Thu, 16 Jun 2022 20:18:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o1vwh-0000fp-PU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vYF7G5dH6YCYNI9w5IHy/TYUaay1JHTBtm4WZuTPdzM=; b=S8qO/54V4p7HMvR5hiDBHV5Kbr
 n+KQdBxBAw4r5ct4Ebiqfd8wi6Q8oBj16HrPaLGgPgwqpwGQ6RcCJ4gCYp2MPLd/MCtwCgrBtVide
 vKtg+WL8gaHhctoPktFRGQmoGlKWyTPCykzzcEwf482OfW/XJjG25rIZ9VzukWfI35Tk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vYF7G5dH6YCYNI9w5IHy/TYUaay1JHTBtm4WZuTPdzM=; b=aokQCfIjRPuLljSp7CltntlOA7
 c4NccjcD6Hw5kPGs/T4a7J0cK4+z89X1mJjLetZLZRrQoGdlaenXEcjS0fihC3QeYpv7scJDKhmR3
 uAevzTCxMYwGk2/UAM6qc68now/8sDqOMRemYyOBcE36zWeltoUTdU3zFAmfP+w8Npvw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1vwb-0005am-Ti
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D93AC61DB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jun 2022 20:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BF7C341C6;
 Thu, 16 Jun 2022 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655410697;
 bh=YB3H0eP+bq4tdjh6wOG3YtQsw/WbRpJHmQN03tzgLw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G738p0TMyDWt0e6trNPG+dB0KLlBCyRwBvLqIZ8Nuyj+G49kC8lRumdjhubfT/kOr
 jeYn01pHPF87lJkZ2uk8dQ/Q3opB3khw6umyDkfkxQqBXqtVGm3sqPY4Q6P/81EO0m
 3Whtsu5ECR4LCexsZ/MQ9Jy2ii1jRqMahe+08NKepynxPyL0jDyQlvrSzQ+RJs49il
 v8QKnHRH1faFtoGDpF/X/S0P2OFkIyir8Y38fdukImFvo7DGESaWqvlY6UBq26mqdx
 5o6IEQAcK0NkhL3fXoFG3MrrbZhHm4p2dGRh2Yo+PN6f8MfeNSIKRVmNCB2m5EmMJi
 ZLYfarptileBA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 16 Jun 2022 13:15:04 -0700
Message-Id: <20220616201506.124209-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616201506.124209-1-ebiggers@kernel.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.3 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Currently, if an
 f2fs filesystem is mounted with the mode=lfs and io_bits mount options, DIO
 reads are allowed but DIO writes are not. Allowing DIO reads but not DIO
 writes is an unusual restriction, [...] 
 Content analysis details:   (-3.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1vwb-0005am-Ti
Subject: [f2fs-dev] [PATCH v3 6/8] f2fs: don't allow DIO reads but not DIO
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Currently, if an f2fs filesystem is mounted with the mode=lfs and
io_bits mount options, DIO reads are allowed but DIO writes are not.
Allowing DIO reads but not DIO writes is an unusual restriction, which
is likely to be surprising to applications, namely any application that
both reads and writes from a file (using O_DIRECT).  This behavior is
also incompatible with the proposed STATX_DIOALIGN extension to statx.
Given this, let's drop the support for DIO reads in this configuration.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5e5c97fccfb4e..ad0212848a1ab 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -823,7 +823,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int rw = iov_iter_rw(iter);
 
 	if (!fscrypt_dio_supported(inode))
 		return true;
@@ -841,7 +840,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	 */
 	if (f2fs_sb_has_blkzoned(sbi))
 		return true;
-	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
+	if (f2fs_lfs_mode(sbi)) {
 		if (block_unaligned_IO(inode, iocb, iter))
 			return true;
 		if (F2FS_IO_ALIGNED(sbi))
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
