Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA38D147BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 18:47:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3h5p0vOfuZNymEx60na8AuCHCZ9zm9fh1scm0L2PvPM=; b=PiXZ+eWiF1frTflOh+SVlcruX+
	jHh/x5OGx+lm0uFwinGPjHFVP1EcRIRNYXe3QTzV4VgIyewTEv5DFfdS79mRz8KtTRoMUrosMKJY2
	fGSFVFGwl0GVwA/HXmxiR48wvEl4oBpCJukIPP1Ru50bEhwHAoMjkvD8NOWs7tlAsj88=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfM0Q-00084I-QC;
	Mon, 12 Jan 2026 17:47:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vfM0M-000846-UW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eKVp7/1qGbEDncDKsChoJ7XgADJEHLc8A/ZzBtsBGUY=; b=XGAFPhPVtiGj57NPo15bPhhMKd
 /US+WOunKtEUSIl0udsdWDReQw47+PDEh28ZkP22Yyh2k5sys60+wxAryUeneiYnk86r33HlIQMTz
 FD6GXtgXGkD70rXO+Joc8N5V5fwWVTp1sjSKy/CMWRx3u0Aek4qTkzkE5I6U5osUQF2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKVp7/1qGbEDncDKsChoJ7XgADJEHLc8A/ZzBtsBGUY=; b=KCrOxMMEMaH4UuGuZZrURyBM+z
 JTa1+DodiIaI/ny1y8QJmfOzaRW4lx5zoo5TjjUynePjGNY2Z3aZm/c9Jq9oZwBApNsb8e1BzZoDg
 nMoDG/nP6cG7XknK06VkwbLOZ1BeswKErREbndA4Fztevf+oRchAg9I0l6UWc6+Ha+ZU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfM0N-0008TK-4U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 90A7B60097;
 Mon, 12 Jan 2026 17:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3D8C16AAE;
 Mon, 12 Jan 2026 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768240012;
 bh=L5CDc1Nm8Bp2qYtvo56luGywAJSsqnRCZMclqhdhavs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KIiDq/J6c8fJ/AFmnlkONFsYYJ+8sEbkwLX508eZBqVurO4qweeYHdmcikGGOUz2M
 8Ds+QX/wRi8ZdxM88f2UNEMHns9A6Y3hAZFHg2j/VASpXtFBt7i+tXmCteGYh2EPqh
 IP1zyqGDfh+CfbKibYB7SFWf2zwn3aGCs9FjsnkMeiPI289MeZakQ5GGhq4Mr6oDUW
 YtToEL3wINLCGyMpr5Tvf7x5ZIwRYM36f4xopVVpm7QFTNQcsL4GXgiEVb1l8r0VB9
 d2sPgXlqiLnasqM0nUFmn9WJxX1CJZaChrOOe5hNG5AbYFaAHsWrpzMfEiyisl5IwV
 eBKeUlogrk9xw==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Mon, 12 Jan 2026 12:46:19 -0500
Message-ID: <20260112174629.3729358-7-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112174629.3729358-1-cel@kernel.org>
References: <20260112174629.3729358-1-cel@kernel.org>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfM0N-0008TK-4U
Subject: [f2fs-dev] [PATCH v3 06/16] hfsplus: Report case sensitivity in
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

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/hfsplus/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index 7ae6745ca7ae..0ce9561c0f18 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -694,6 +694,7 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
 	unsigned int flags = 0;
 
 	if (inode->i_flags & S_IMMUTABLE)
@@ -705,6 +706,14 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	/*
+	 * HFS+ always preserves case. Case sensitivity depends on how
+	 * the filesystem was formatted: HFSX volumes may be either
+	 * case-sensitive or case-insensitive.
+	 */
+	fa->case_insensitive = test_bit(HFSPLUS_SB_CASEFOLD, &sbi->flags);
+	fa->case_preserving = true;
+
 	return 0;
 }
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
