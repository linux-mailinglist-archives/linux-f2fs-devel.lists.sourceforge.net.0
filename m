Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C41F0D1F70C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 15:29:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TAJj0cgh2s1995pmzxSkoESvltBgTNNqim6/0CzN48=; b=B+VkYueyAd4xElSfVTuK0AKFSZ
	cGOzde31hpfGqdg3HO1n3VtcRwqzMPOYJJFeNs18n4jCleUbn+ENBVBKtq3o7JFEgvw5x+hD82ev3
	/iKL7GQ0j5dNV+9P2C2hROy4c8nAoLBde3e0lkd7P6HgsFcDQhaXo1mPrsY5RPKj58tQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg1sX-0008WH-Gh;
	Wed, 14 Jan 2026 14:29:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg1sU-0008W1-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qqoEsvfJHNooKliyhhMNmQYyF8FIq3X/QCtdlLWlOA0=; b=mUgr+s3v8DxdfojGBgrhNhtVaA
 XWsCCfUWHmV3KzQjuxatWN7rM4bj17S6i3PVNyjx6aGJN+SkzzuWaLjzfWc5AOh0U1gkwjzCN1rNC
 qzACh/oiRZlegPZopPdOCxNbw7RHb2qMhTCqltT+CdLXoDTHN6UxwtXOpZUWfFej7TSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qqoEsvfJHNooKliyhhMNmQYyF8FIq3X/QCtdlLWlOA0=; b=aDuPr2d+mlFLHuW183nEVav99i
 a5ibF34+sHvWHMsiJZSPnu7iFq3u+w1SGfCWqhFChuE7JVLRdV8Ybpsqy2uwcL6dL1HFIyZLG+F+5
 2hE80W351JOevgi4sX1B9iz9VPCvECawCcnVKL5p4Gu5if6id6hsBFmETkUjASHtsQuk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg1sU-0001HL-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0B6D60126;
 Wed, 14 Jan 2026 14:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619ABC19423;
 Wed, 14 Jan 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768400971;
 bh=X2CfF5Mn9CRS+EjjMIOtUmXyiac4dDTyVUDa2EW06DU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EJzzHfdw/hacdM48fidfnrJv0YzvbGhUvIBJr5cAF/xwLQtQpE5DauIigCx6L7s0M
 +HVTvSL3ynafViB+RyvF1tfbtr4Wp9OuQWgp670uHq7AFoHzy5RCSB035MCLmyarco
 Cw0QT1R0h7GnheHPu9OcgyKOX57UQ8q3WOi2+qPsoj51FYk5WYKo5YfAGA/mJUX51n
 HxMBw3YmfijgFpGwkr/7CNls9TCDCDoygN3fYfMlh0GbLBcD/+zvjAMp5Pzxh61J3N
 6B96VvJSeSQ5GuV1EDp3UTL04MgvVVCAkOBgDvZ+oIv7Ti19kP7+B6GxK3rknlnnxD
 MTQb2nWrt+WKA==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Wed, 14 Jan 2026 09:28:54 -0500
Message-ID: <20260114142900.3945054-12-cel@kernel.org>
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
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> NFS and other
 remote
 filesystem protocols need to determine whether a local filesystem performs
 case-insensitive lookups so they can provide correct semantics to clients.
 Without this information, f2f [...] 
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
X-Headers-End: 1vg1sU-0001HL-Jd
Subject: [f2fs-dev] [PATCH v4 11/16] f2fs: Add case sensitivity reporting to
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

NFS and other remote filesystem protocols need to determine
whether a local filesystem performs case-insensitive lookups
so they can provide correct semantics to clients. Without
this information, f2fs exports cannot properly advertise
their filename case behavior.

Report f2fs case sensitivity behavior via the file_kattr
boolean fields. Like ext4, f2fs supports per-directory case
folding via the casefold flag (IS_CASEFOLDED). Files are
always case-preserving.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/f2fs/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d7047ca6b98d..5d4c129c9802 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3439,6 +3439,12 @@ int f2fs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
 		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
 
+	/*
+	 * f2fs preserves case (the default). If this inode is a
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
