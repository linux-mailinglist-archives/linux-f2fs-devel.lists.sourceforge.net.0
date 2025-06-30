Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF73AEE38E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 18:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dxAvNQGhaqcNiexi034UgAzzD/q3AuLXQUe3xbHDTNk=; b=KgS1kuMCcDeWc+njCUryJ93xLw
	fnkeuglRm+Xbm2Ux1kaaUbFuqXEge1ILoNwflSErc7gNlwPExC7Rx3M4tzxLiENaMPeYsgkPdFqb/
	1apBom3FLwginm5aCmHOJkCk32E02lPOiqa0I/Cf9yyNZTRrnrwii8sgYAhgJFBVfj/w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWH3u-0006MK-T3;
	Mon, 30 Jun 2025 16:08:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uWH3t-0006MB-BK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 16:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8XEZcsbzelkOO71t+Tu7VEigdRg34eTkhVGp16AL+Jg=; b=Po4BuK2ZlrqaXXiHdSB4TfuFPH
 rZHeiu9t6M+T4p1rtWPM9c73g5iWkEcUZNo7FI9Uh7mWHZqGW2nrcm4ny91a59wurzJc++MnmAVep
 ptDYAZnKKKxA03LmUblru4O7DJ10d39EvO6qWIm1psc2pd7pNmpOEL+NvhofoN+kyEkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8XEZcsbzelkOO71t+Tu7VEigdRg34eTkhVGp16AL+Jg=; b=d
 qze3/fRxvA41OPUx2AKKOlcPLTMy5AMJLzr3Wa/He8p4FdQHuCdL5bFYqGyn9en4i3Sz0W7T1s7h2
 ylQTW/GiXBc2pcYrLPekRH8u837Xn3yAw+1YhqxMLVxpLHHEdEYEJ666vtSssB8Naw1ahbBQuBusj
 g2uDZWNRkhkmSPWM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWH3s-000171-Ui for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 16:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41DF2A53505
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jun 2025 16:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE91C4CEE3;
 Mon, 30 Jun 2025 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751299721;
 bh=6aZ6RrcZTZwQoW5ivL50ynDXvw/g7SfaRb+9dlOqfpc=;
 h=From:To:Cc:Subject:Date:From;
 b=XPljEV38kuR3dBAxZXLsOowg833OEWE64z1v3LWtHuIHSQplNC57ZKbr6RIcRaBtf
 /hU7sBAAmbrmiWTdH91GNFjVZ5WoO6nz7ajvh9sWEtiDhnFuZ0Xj59WpkqZQqY/HU6
 umKopUpan3FF/aomxcesf6yjyeYJeZAO5UG6QGi/sCM1CJp70qC8KQm3ltfEOyfyxk
 QiEE2BiRs49/WPU+TJ7KcmzQDjZ7QZChndlQQC1mE7sozs6bXGDMf1avRD7EwhXKU6
 zM1k5WWHl7uFEPXjCpDES5bbIugGZ4eKKrHQQy87iud+gi4K0Mf1j7JP7p7gIcfW2N
 WyWwdx2y3sjdg==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 30 Jun 2025 16:08:38 +0000
Message-ID: <20250630160839.1142073-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's return errors caught by the generic checks. This fixes
 generic/494 where it expects to see EBUSY by setattr_prepare instead of EINVAL
 by f2fs for active swapfile. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- fs/f2fs/file.c | 24 ++++++++++++ 1 file changed, 12 insertions(+), 12
 deletions(-) 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWH3s-000171-Ui
Subject: [f2fs-dev] [PATCH] f2fs: check the generic conditions first
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's return errors caught by the generic checks. This fixes generic/494 where
it expects to see EBUSY by setattr_prepare instead of EINVAL by f2fs for active
swapfile.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index bc0ca697e064..bd835c4f874a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1048,6 +1048,18 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
+	err = setattr_prepare(idmap, dentry, attr);
+	if (err)
+		return err;
+
+	err = fscrypt_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
+	err = fsverity_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
@@ -1077,18 +1089,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return -EINVAL;
 	}
 
-	err = setattr_prepare(idmap, dentry, attr);
-	if (err)
-		return err;
-
-	err = fscrypt_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
-	err = fsverity_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
 	if (is_quota_modification(idmap, inode, attr)) {
 		err = f2fs_dquot_initialize(inode);
 		if (err)
-- 
2.50.0.727.gbf7dc18ff4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
