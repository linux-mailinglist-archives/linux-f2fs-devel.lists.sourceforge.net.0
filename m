Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B235B7DB0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 01:59:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYFo7-0003S6-Ak;
	Tue, 13 Sep 2022 23:59:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@collabora.com>) id 1oYFnz-0003Rp-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QCj8y9iGacZibm/o3SQEwfd6D69exr0yb14wndFXBOM=; b=lMHvxxGI+tiijz8HXUJFTwnnpj
 rhZFc7Gp7/QeOuTUj8Yn84WUm7su/IxOtacMppGMEqyHBN1EImP/n3mUgfSYGM/3QFEIkap0ncpwn
 cBdfy8yabqpsjad9hKtDi/vt4yyJCWYMC9sD+zn3a31TzPjVFLPdbgHWhsxS+LBxBUdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QCj8y9iGacZibm/o3SQEwfd6D69exr0yb14wndFXBOM=; b=FE1O4CNp2T3kQB92LWZSp2EhCF
 MGv235EtmNkZEh21Yq3kAyrI2J0I7IUT3wWm+nXz0HwgBgt0ptQg6LnGMUTHnZ049Nz41iIUGtQ47
 dBmZjksVTutXgMNwbAKcGSHSUPAFj8aAgZ5nt9ePn/fqa5wrkv0aOrheoAluF49hnYng=;
Received: from madras.collabora.co.uk ([46.235.227.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYFo8-007NNL-5q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:59:16 +0000
Received: from localhost (modemcable141.102-20-96.mc.videotron.ca
 [96.20.102.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: krisman)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5728F6602033;
 Wed, 14 Sep 2022 00:42:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663112551;
 bh=MZQbRUazF2vg4Tg978XNZC0bZGGWs1+KayZdfr4nmDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cPPc7Pa0OPPQPm+v7ijRy+jPvVM8ChYaO0lb96yEtuq6kvBzPggB1gapwJF+7pJfr
 QclxIPGpEyHXcm0XyxNuJQM/sktZsQeWHH8VOsWHON/OfYe7XW1hBypf+3sGgW9nse
 vNDXJ88EBv8TCXcGwl49ArCU88wfCXlklKqk7FXldamHsY8JExEcfIF6TlYuuVpACu
 jA59parZn6SVCDJl/dLgN0NS+bEsG1vj3/50HXRacKA6PrlK6fNsW7e5lHLb1IH6gA
 kfocSlUWDrOPf3mzLwWOWK48I9u42LtjrobkEGhyjV1x20douTORMUEYKfZFfMGHiA
 eAplXxelPhmsw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Tue, 13 Sep 2022 19:41:50 -0400
Message-Id: <20220913234150.513075-9-krisman@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913234150.513075-1-krisman@collabora.com>
References: <20220913234150.513075-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Instead of a bunch of ifdefs, make the unicode built checks
 part of the code flow where possible, as requested by Torvalds. Reviewed-by:
 Eric Biggers <ebiggers@google.com> Reviewed-by: Chao Yu <chao@kernel.org>
 Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com> --- Changes
 since v4: - Drop stub removal for !CON [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oYFo8-007NNL-5q
Subject: [f2fs-dev] [PATCH v9 8/8] f2fs: Move CONFIG_UNICODE defguards into
 the code flow
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
Cc: kernel@collabora.com, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Instead of a bunch of ifdefs, make the unicode built checks part of the
code flow where possible, as requested by Torvalds.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
Changes since v4:
  - Drop stub removal for !CONFIG_UNICODE case (eric)
---
 fs/f2fs/namei.c | 11 +++++------
 fs/f2fs/super.c |  8 ++++----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index bf00d5057abb..46325cac4fb6 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -571,8 +571,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out_iput;
 	}
 out_splice:
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
+	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
 		/* Eventually we want to call d_add_ci(dentry, NULL)
 		 * for negative dentries in the encoding case as
 		 * well.  For now, prevent the negative dentry
@@ -581,7 +580,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		trace_f2fs_lookup_end(dir, dentry, ino, err);
 		return NULL;
 	}
-#endif
+
 	new = d_splice_alias(inode, dentry);
 	err = PTR_ERR_OR_ZERO(new);
 	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
@@ -632,16 +631,16 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		goto fail;
 	}
 	f2fs_delete_entry(de, page, dir, inode);
-#if IS_ENABLED(CONFIG_UNICODE)
+
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at f2fs_lookup(), when it is better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_CASEFOLDED(dir))
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
-#endif
+
 	f2fs_unlock_op(sbi);
 
 	if (IS_DIRSYNC(dir))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2451623c05a7..636488d65342 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -284,7 +284,7 @@ struct kmem_cache *f2fs_cf_name_slab;
 static int __init f2fs_create_casefold_cache(void)
 {
 	f2fs_cf_name_slab = f2fs_kmem_cache_create("f2fs_casefolded_name",
-							F2FS_NAME_LEN);
+						   F2FS_NAME_LEN);
 	if (!f2fs_cf_name_slab)
 		return -ENOMEM;
 	return 0;
@@ -1273,13 +1273,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 #endif
-#if !IS_ENABLED(CONFIG_UNICODE)
-	if (f2fs_sb_has_casefold(sbi)) {
+
+	if (!IS_ENABLED(CONFIG_UNICODE) && f2fs_sb_has_casefold(sbi)) {
 		f2fs_err(sbi,
 			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
 		return -EINVAL;
 	}
-#endif
+
 	/*
 	 * The BLKZONED feature indicates that the drive was formatted with
 	 * zone alignment optimization. This is optional for host-aware
-- 
2.37.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
