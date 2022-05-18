Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5214552C81F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 01:54:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrTUJ-0002hM-MZ; Wed, 18 May 2022 23:53:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrTU8-0002gw-R2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 23:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+RDaEEMK4eT++lo3xgpRp/qjzTM2quZ8kl0hZwgItoE=; b=SS7DB9ESttGxghJGShO749EovY
 lw6VK3GeS7kES0U/lRMv5uTdhLyTF8VXlpxUEXepyb12AGlN5E4eE1jp1EAc9/JuieL0ph6obDX4b
 +Pw6R4lrGLoMZG1EaJX4drAuATsaanHsHbq/47e3zzHdhCD44ELLlHb07YIuw+b7Xrks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+RDaEEMK4eT++lo3xgpRp/qjzTM2quZ8kl0hZwgItoE=; b=Gs9NkSBAZeXZhb2Zyn9R7Fc3bZ
 g4TR9EVl7IUB6F9iUCoTVeVCVdsqx63iIkHfsHTqIFtwpFB0kQ1OMUa9jK5PN39yAlKMjUlVhUry6
 3nV+19gxxyyCnBXQhNn6UklZ/vRJAV5WM5v2NeMhvex5+wXP3VD5qZRmF78upLQ8p444=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrTU4-007nPM-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 23:53:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A8D0B8225F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 May 2022 23:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9F6C3411B;
 Wed, 18 May 2022 23:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652918011;
 bh=ZE7itEEPnptZhGuc8FqpYj5SCJPv5va5nQLMU3S/gQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owfg/F0xZThvzpCjzSoA1MRFeGdGDwzUdcPeWd/alnsvpgMVvJEqqh9PdOMPWq+5g
 /KOGcKBOtdGO3bDbcoYZ909SBYVoR2hEHX5w9T8wy9o3f3lDvn6okpsMgYi75IoNuv
 QVQBMz3l/DO+qa5omaNeIMR4O27xp0nUtc9NRcVMeiugPTmJBcRZ1/4FrC7bzcGRTz
 4Hls4MRp41Nxu2UlJiYHRO/txX42QDmjODhpp+uuPWBBnyGAusxCKHgPBdTl2d9HuX
 yDaqaT40qaOnKwYIHf8DaGG90QFkPxNALhH9WhZZUY7qMWFFrzVzTP9T/4kvBMgsAn
 AeRd0FgWLGaWg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 18 May 2022 16:50:09 -0700
Message-Id: <20220518235011.153058-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518235011.153058-1-ebiggers@kernel.org>
References: <20220518235011.153058-1-ebiggers@kernel.org>
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrTU4-007nPM-Mp
Subject: [f2fs-dev] [RFC PATCH v2 5/7] f2fs: don't allow DIO reads but not
 DIO writes
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
both reads and writes from a file (using O_DIRECT).  Given this, let's
drop the support for DIO reads in this configuration.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 67f2e21ffbd67..68947fe16ea35 100644
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
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
