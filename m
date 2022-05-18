Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90C52C822
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 01:54:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrTUO-0000HT-T0; Wed, 18 May 2022 23:54:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrTUA-0000H8-IA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 23:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xmvuDnACj1/gRG9TinKXlbFA+kN5PQIxckB3PvzFAig=; b=QSDO0UmUGDbbhNWRLzREo5k+r8
 tP8wtYVlIEwdRvpCpfnV5GciQV2zejohPqhxIdBL+HOYq21SAC8u/5X101+fWD38zVy/VmpA0Nxxf
 NDXF60jdV5xl1EhwIN8LFeALio6YJyqaG9YV13T/oSFW2j8oBLX1C9Gq43yIq9eewL60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xmvuDnACj1/gRG9TinKXlbFA+kN5PQIxckB3PvzFAig=; b=B3yUFCWcX3w2Y0BLhG5y/bxSut
 Cos8qy6CeDcqlUf0nar2QbGlgRoQAtr8QJyGe/vonimbU4+UANTBY17ztiohw8e/Pz16FODvq0T3i
 UOjhicPC9CtlaGRGIpZ2xkiRcyxuDN5WPhAQZg6c7dl2AInVo13twxM+t16e8gf2Tm/k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrTU4-007nP6-NB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 23:53:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9D99B8225D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 May 2022 23:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5214BC3411A;
 Wed, 18 May 2022 23:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652918010;
 bh=3sZKLjhW06TI7c+BVa7gpFBKd4C/l+SSKwcEXk2rzX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j+97VEJ8HtA4dSe2xlZDFCMyTr0v0o1esE+ZYr1Pp/3lSdTk/ZbgbKv+4J7u1hl6x
 5QrX+wl3wxxdLquQmGPHKlZTFY7nDWvGKCXCly+s2EGc4OKye9LZYP3Lqac/SFXB01
 j+Ajgae21bh8oVFdB/UeGDmlM7+1tfTUwaZdFG8MPYa8RG1TW+ZTtpCAznsNq2andv
 RVJRLAjfWnBhX4V5AOj1VPin12DiFsIHBRAJx70sJMGwmxqa0j0HAH99OIcgKr8pKQ
 4s5EHa2wC/0Dz3hyZ1MsIPHYDU2eGhPOYtmOtQS/oHDEDBV1CQlS5t3m82cKI8HNd+
 To0Lakc2KzaDw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 18 May 2022 16:50:08 -0700
Message-Id: <20220518235011.153058-5-ebiggers@kernel.org>
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
 Content preview: From: Eric Biggers <ebiggers@google.com>
 f2fs_force_buffered_io()
 is only used in file.c, so move it into there. No behavior change. This makes
 it easier to review later patches. Signed-off-by: Eric Biggers
 <ebiggers@google.com>
 --- fs/f2fs/f2fs.h | 45 fs/f2fs/file.c | 45
 +++++++++++++++++++++++++++++++++++++++++++++
 2 files change [...] 
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
X-Headers-End: 1nrTU4-007nP6-NB
Subject: [f2fs-dev] [RFC PATCH v2 4/7] f2fs: move f2fs_force_buffered_io()
 into file.c
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

f2fs_force_buffered_io() is only used in file.c, so move it into there.
No behavior change.  This makes it easier to review later patches.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/f2fs.h | 45 ---------------------------------------------
 fs/f2fs/file.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 271509b1c7928..2d6492c016ad6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4442,17 +4442,6 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
-static inline int block_unaligned_IO(struct inode *inode,
-				struct kiocb *iocb, struct iov_iter *iter)
-{
-	unsigned int i_blkbits = READ_ONCE(inode->i_blkbits);
-	unsigned int blocksize_mask = (1 << i_blkbits) - 1;
-	loff_t offset = iocb->ki_pos;
-	unsigned long align = offset | iov_iter_alignment(iter);
-
-	return align & blocksize_mask;
-}
-
 static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
 								int flag)
 {
@@ -4463,40 +4452,6 @@ static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
 	return sbi->aligned_blksize;
 }
 
-static inline bool f2fs_force_buffered_io(struct inode *inode,
-				struct kiocb *iocb, struct iov_iter *iter)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int rw = iov_iter_rw(iter);
-
-	if (!fscrypt_dio_supported(inode))
-		return true;
-	if (fsverity_active(inode))
-		return true;
-	if (f2fs_compressed_file(inode))
-		return true;
-
-	/* disallow direct IO if any of devices has unaligned blksize */
-	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
-		return true;
-	/*
-	 * for blkzoned device, fallback direct IO to buffered IO, so
-	 * all IOs can be serialized by log-structured write.
-	 */
-	if (f2fs_sb_has_blkzoned(sbi))
-		return true;
-	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
-		if (block_unaligned_IO(inode, iocb, iter))
-			return true;
-		if (F2FS_IO_ALIGNED(sbi))
-			return true;
-	}
-	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
-		return true;
-
-	return false;
-}
-
 static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 {
 	return fsverity_active(inode) &&
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5b89af0f27f05..67f2e21ffbd67 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -807,6 +807,51 @@ int f2fs_truncate(struct inode *inode)
 	return 0;
 }
 
+static int block_unaligned_IO(struct inode *inode, struct kiocb *iocb,
+			      struct iov_iter *iter)
+{
+	unsigned int i_blkbits = READ_ONCE(inode->i_blkbits);
+	unsigned int blocksize_mask = (1 << i_blkbits) - 1;
+	loff_t offset = iocb->ki_pos;
+	unsigned long align = offset | iov_iter_alignment(iter);
+
+	return align & blocksize_mask;
+}
+
+static inline bool f2fs_force_buffered_io(struct inode *inode,
+				struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int rw = iov_iter_rw(iter);
+
+	if (!fscrypt_dio_supported(inode))
+		return true;
+	if (fsverity_active(inode))
+		return true;
+	if (f2fs_compressed_file(inode))
+		return true;
+
+	/* disallow direct IO if any of devices has unaligned blksize */
+	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
+		return true;
+	/*
+	 * for blkzoned device, fallback direct IO to buffered IO, so
+	 * all IOs can be serialized by log-structured write.
+	 */
+	if (f2fs_sb_has_blkzoned(sbi))
+		return true;
+	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
+		if (block_unaligned_IO(inode, iocb, iter))
+			return true;
+		if (F2FS_IO_ALIGNED(sbi))
+			return true;
+	}
+	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
+		return true;
+
+	return false;
+}
+
 int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		 struct kstat *stat, u32 request_mask, unsigned int query_flags)
 {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
