Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF11D32D3E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 15:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6rVAuiaWbmk50MeXZbbJ9uYpmQdbUTA2uamxUlMMwg=; b=bg10Kdl4FyzsSE71f6ET7r2PK5
	ArJ2v3iDsSIBgFgUJGIlyjosHZoEGKE9oe60tFgdyaJpav/FonPDAQptKnzUSBqzspk7FY51zJ8E8
	g5mVS6wKxolmnEgv2Pllkta3OhYEbIYtyXrzE7oS4Zu9dvpeowFMac4yKihs5muWlY4c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgl6A-0001mo-Cm;
	Fri, 16 Jan 2026 14:46:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vgl68-0001mb-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 14:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1TRgeT3N7pSGEAsUtdUGeUnZkhJn7qC1MylgtG4RGU=; b=GJxlFTdbmeit39CAh/Kq/cGYnM
 Cwc5K7uxqEmJgjbd7lWfxiIlX4zaVB0Oy8vxpURyZRUToNEDFevEj01onPrwboL6xtUQml/ULJ2CZ
 ZG+2Nj9xyMSdIj9YmtEJsZHtl74R5/AglgPbQBfAttSoB+TI1OEUBMzayTLdg1qMO5AA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M1TRgeT3N7pSGEAsUtdUGeUnZkhJn7qC1MylgtG4RGU=; b=Isz26v80xjYGB9LBC0ShXndHgZ
 RuDJtbBNLHPCg4Jrv9K4+ZNJcvJ0Zq31+YrlwW2hKgZSxVtUOKfEtJ/EK5nWCNQ/Fu9JrqET5q+QC
 4zWdWGz6Jp9EdvjERppTwicpi3SJNaKIEQi2gTkN94V5gV/WTXvvWoXA/peN2eQM/Yr4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgl68-0002ER-13 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 14:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AF05743C08;
 Fri, 16 Jan 2026 14:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658B2C19421;
 Fri, 16 Jan 2026 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768574797;
 bh=tyhvqqIS+ku3U7Hk/wztpIFyA6yZTojJ9ILKjB/tyUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+BrI+6nlKHQZfkg5DDc/BbSQzbF8SNUNZIO/2QyelkLAE8q1wWo8MR88Fk5Hv1HM
 VBlnSa/OG03+z2mLQk7nfajOgsXCkpUNRxCIU9l24DyMDsc9Y/XwgVj7v4Pyj7zaVo
 4iBrq4wEKDPY3N6ZKzQ1HfdxOnoEoUtjjbfKm+0Uc7KOL70yAYcVaZUtjRzDqy4o6r
 YEVijPjcCHCnMnvH5cPN9jduQWINKJO41WCcbEIhBUy0n+Dg9xLmcnImv462YAcWO1
 5JeuW5sSA1GYYx6L2XlgTxi0kY6wAFLEVNNDRyfOAy50Pfvvo/CAWgLHZznkm6Uiif
 Vd8HEuVEnFrYQ==
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>
Date: Fri, 16 Jan 2026 09:46:06 -0500
Message-ID: <20260116144616.2098618-8-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116144616.2098618-1-cel@kernel.org>
References: <20260116144616.2098618-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Report ext4's case
 sensitivity behavior via file_kattr boolean fields. ext4 always preserves
 case at rest. Case sensitivity is a per-directory setting in ext4. If the
 queried inode is a casefolded directory, report case-insensitive; otherwise
 report case-sensitive (standard POSIX behavior). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgl68-0002ER-13
Subject: [f2fs-dev] [PATCH v5 07/16] ext4: Report case sensitivity in
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

Report ext4's case sensitivity behavior via file_kattr boolean
fields. ext4 always preserves case at rest.

Case sensitivity is a per-directory setting in ext4. If the queried
inode is a casefolded directory, report case-insensitive; otherwise
report case-sensitive (standard POSIX behavior).

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/ext4/ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 7ce0fc40aec2..213769d217c3 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -996,6 +996,12 @@ int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (ext4_has_feature_project(inode->i_sb))
 		fa->fsx_projid = from_kprojid(&init_user_ns, ei->i_projid);
 
+	/*
+	 * ext4 preserves case (the default). If this inode is a
+	 * casefolded directory, report case-insensitive; otherwise
+	 * report case-sensitive (standard POSIX behavior).
+	 */
+	fa->case_insensitive = IS_CASEFOLDED(inode);
 	return 0;
 }
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
