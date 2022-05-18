Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F1F52C81C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 01:53:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrTUM-000541-Hj; Wed, 18 May 2022 23:53:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrTUC-00053h-NX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 23:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VK+fxpefrXkihvbJXirC2GvOU4OhiStGiNVMoly2AWA=; b=FhJWZUaUhJ9j2ryQlRpSNl8QVo
 6jH/rDS/Qw7aE+cYgkutmMtmQXkil0hb0fQgp4eB4Fljnq3JK6ciMQ0QUwsTiQR/8ggskO2iZhdjV
 evL1qZYppheL1uOUpwGbf6ZoiZK8KGGxjlmK6IbWSMvaAQLthKWndf7Yj/Noq0eEWEvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VK+fxpefrXkihvbJXirC2GvOU4OhiStGiNVMoly2AWA=; b=k81pKTFIS/DqWTLWsnb0JjTaBN
 b9ryiEV91azCVfD1NzJPIrCQnipD0yviLx8k9GlhTKRNoulLu78mlt9UriC6ZL6DvI3xalmcIkUPH
 jGrLST1WaXknoiJ+xped1VM/PBZgmyR4rMhFR1/iJCR+GeJ6/o5xXts9lZh775CLf8Ag=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrTU6-0006CZ-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 23:53:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27E586175E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 May 2022 23:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A28C3411C;
 Wed, 18 May 2022 23:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652918012;
 bh=mHfaNK/yqtCaO/YT1VZcqJFlQSMjauSczWDdIigQbH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X9OLn4uN0IO4WyRABB3ByikS4qWBMsqFglNa8PeQ72cZC0adZSBvyLrplspqEtJRX
 mZxZJWuw2e0+J9G4KOg8g+NuMV3eMDe6MRLVhA2PXNtqgJ/22jaYPwmRJBuar7XPkV
 BZMEX5DB0YvhDEVWNjqSNgnIYGirlIO+VpWpNzNKoRiCPTwZ013i1D1hEWsq+odUQ0
 jqK5EGlKizkZblHmj0qlIhshRQvVwH+kkUcnm3PZiENEHBLFjoXOZL42G3moRRaLxh
 iMIuOcvo/Xjrlh0wnusnqJd4zv9t2f8C4dAh8KR9Ee024Rmn8spgTVzaebA0uQzBKl
 AGm4vyf4h8/Mg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 18 May 2022 16:50:11 -0700
Message-Id: <20220518235011.153058-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518235011.153058-1-ebiggers@kernel.org>
References: <20220518235011.153058-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add support for
 STATX_IOALIGN to f2fs,
 so that I/O alignment information is exposed to userspace in a consistent
 and easy-to-use way. Signed-off-by: Eric Biggers <ebiggers@google.com> ---
 fs/f2fs/file.c | 31 +++++++++++++++++++++++++++++++ 1 file changed,
 31 insertions(+)
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrTU6-0006CZ-Rm
Subject: [f2fs-dev] [RFC PATCH v2 7/7] f2fs: support STATX_IOALIGN
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

Add support for STATX_IOALIGN to f2fs, so that I/O alignment information
is exposed to userspace in a consistent and easy-to-use way.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c32f7722ba6b0..f89a190949c59 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -835,6 +835,21 @@ static bool f2fs_force_buffered_io(struct inode *inode)
 	return false;
 }
 
+/* Return the maximum value of io_opt across all the filesystem's devices. */
+static unsigned int f2fs_max_io_opt(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int io_opt = 0;
+	int i;
+
+	if (!f2fs_is_multi_device(sbi))
+		return bdev_io_opt(sbi->sb->s_bdev);
+
+	for (i = 0; i < sbi->s_ndevs; i++)
+		io_opt = max(io_opt, bdev_io_opt(FDEV(i).bdev));
+	return io_opt;
+}
+
 int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		 struct kstat *stat, u32 request_mask, unsigned int query_flags)
 {
@@ -851,6 +866,22 @@ int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		stat->btime.tv_nsec = fi->i_crtime.tv_nsec;
 	}
 
+	/*
+	 * Return the I/O alignment information if requested.  We only return
+	 * this information when requested, since on encrypted files it might
+	 * take a fair bit of work to get if the file wasn't opened recently.
+	 */
+	if ((request_mask & STATX_IOALIGN) && S_ISREG(inode->i_mode)) {
+		unsigned int bsize = i_blocksize(inode);
+
+		stat->result_mask |= STATX_IOALIGN;
+		if (!f2fs_force_buffered_io(inode)) {
+			stat->mem_align_dio = bsize;
+			stat->offset_align_dio = bsize;
+		}
+		stat->offset_align_optimal = max(f2fs_max_io_opt(inode), bsize);
+	}
+
 	flags = fi->i_flags;
 	if (flags & F2FS_COMPR_FL)
 		stat->attributes |= STATX_ATTR_COMPRESSED;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
