Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C6DD1F6EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 15:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMU80MXxJCgfAMddneFmFpKc5hpF2G4uv90LYNliSHs=; b=lyBgVjs1CFMdPz+xz39gqWa+wO
	UTFX5is0qVcWT3KgPQTz4IDUN2wbtpTXPeBZ6mvM32xWWMujsJMLtq/CZ4A11QK4YSs2b05X4RYJx
	scbJdpYD19HxY4TEnodZ8G/2714labboq/BgkTG6mi+TqgCAd1gjF6lA5vPeBy3RXFXw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg1sI-0003Ec-Ak;
	Wed, 14 Jan 2026 14:29:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg1sH-0003EI-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qhOV7iQINfiUBGxoscNk6HEdAGMqddAbchXOBtHBaWg=; b=itcjvJjfDVPc1gGmqNXoGRsIks
 nObxbtMe4PTAuRYukjoiyt4VlKgkfB2yG+ZKHK1sUZfdG1cvSEjXx4ujB0k2A3kyBLERjP+iza3Is
 vvzg0qPCVAoJOig1T9KB27bQ1Cdjb5d0aB1UvnjSpPZKxIye8OVcI1YtlwWhcJoUAz8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qhOV7iQINfiUBGxoscNk6HEdAGMqddAbchXOBtHBaWg=; b=IZpU6PGSfG/pk1aUcRVP/q/4uM
 8gEGKA5zxyRAuyJgo8WP31kvGFLftgMJmeAWsO+naUy3frWraKWyh9Wdb/Qa5yz8uWUgHj9zaOTJ6
 OJU3kkFB+JucAuS6VlxbH3JnnYFWGRz+yAK6me3SSdyvKEe2l77Imq8k6e4YoxFQiWFU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg1sH-0001GK-Ou for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 67FBC440E4;
 Wed, 14 Jan 2026 14:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C839C16AAE;
 Wed, 14 Jan 2026 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768400959;
 bh=7L4KjJ52/tlODNs/DbrL8VR4WdJ76Ryp9p91k5Grblo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nijd/OMGAs7q2xnoLkc+Xv35DQEOlxxlx1WfpNMDoAxq6z6rNJdOuLYyjWSmLM9qf
 gKzkGHwhU8tzxq7iw5AraLTJW5NK+drjvgEhrGKAQDLXYE8gQQrXeWaAa89p7S3Tm+
 qziEp4BuZhbaaqM0ly2WLJoSz6XJhF51ZXJ+CAMb1rlnAUb52/ej//ZQkK5FneEtic
 U0UHEZo/WX4UHuWrm4qR6LJMBWi/657wnDS3VIKPUucs2CIvDdfmkQFT8GzDvqI/gB
 31Juf/lcf4sNgee2/1+aL0GoQMc3SE+hdj1k4r6OokRXSe4BIQOT3nXXfIyCIqTd15
 o5UEvAz20pVNQ==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Wed, 14 Jan 2026 09:28:49 -0500
Message-ID: <20260114142900.3945054-7-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114142900.3945054-1-cel@kernel.org>
References: <20260114142900.3945054-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Add case
 sensitivity
 reporting to the existing hfsplus_fileattr_get() function. HFS+ always
 preserves
 case at rest. Case sensitivity depends on how the volume was formatted: HFSX
 volumes may be either case-sensitive or case-insensitive, indicated by the
 HFSPLUS_SB_CASEFOLD superblock flag. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vg1sH-0001GK-Ou
Subject: [f2fs-dev] [PATCH v4 06/16] hfsplus: Report case sensitivity in
 fileattr_get
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chuck Lever <chuck.lever@oracle.com>

Add case sensitivity reporting to the existing hfsplus_fileattr_get()
function. HFS+ always preserves case at rest.

Case sensitivity depends on how the volume was formatted: HFSX
volumes may be either case-sensitive or case-insensitive, indicated
by the HFSPLUS_SB_CASEFOLD superblock flag.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/hfsplus/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index 7ae6745ca7ae..7889d37f5c85 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -694,6 +694,7 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
 	unsigned int flags = 0;
 
 	if (inode->i_flags & S_IMMUTABLE)
@@ -705,6 +706,12 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	/*
+	 * HFS+ preserves case (the default). Case sensitivity depends
+	 * on how the filesystem was formatted: HFSX volumes may be
+	 * either case-sensitive or case-insensitive.
+	 */
+	fa->case_insensitive = test_bit(HFSPLUS_SB_CASEFOLD, &sbi->flags);
 	return 0;
 }
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
