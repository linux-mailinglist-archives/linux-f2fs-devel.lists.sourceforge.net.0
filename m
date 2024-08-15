Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A15952723
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2024 02:48:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seOei-0003wd-PO;
	Thu, 15 Aug 2024 00:47:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seOeh-0003wX-Ly
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 00:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PPE0BITfRkG7PhFD7voZK3LbeYpomNYo/x4bV1sdi5w=; b=ik0Wzdc5VyzF6ekVuZx9vImdGM
 vLjbc425VgM4w3cZnV7oW6l9l8TRsh00p/QQGdHhUPgq45lEM9ZvAEA1dnVpl7heJPWX/w0LsFWyJ
 Or1VkzLbjtJH1r2YC5+hsp6Pb6rQBNRsRYuL2vjH7vM6CD/4UV+fMz/bDqEc4kgOi6rI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PPE0BITfRkG7PhFD7voZK3LbeYpomNYo/x4bV1sdi5w=; b=F
 SDBZi/qdo9nKzBpbao0HvDMc96Si6wFNYEI50LH0UjGBKderwL2yOHHSV2o7PeDXMr+TRC/2Shmjn
 z9lkXZt7lnh1RTB04S/LtkvyyM3gUQ0btHC8bpSs2b891A+PNymP8n/KsmpV7MlHoiUp9hE/Rj+V0
 MesjFGzJWJW1DA2U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seOeg-0002A6-8m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 00:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E22AA61D2B;
 Thu, 15 Aug 2024 00:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322EDC116B1;
 Thu, 15 Aug 2024 00:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723682863;
 bh=r4BuNVkYuudg6mssyMhySpqB69LfFwKvJIwhIwlq9vw=;
 h=From:To:Cc:Subject:Date:From;
 b=WTjUI5eBcl/eUzAvbxSR7N3TpnNseMvcrBzAHKcSyZ5GQG+DkxhjwB1IpTzfy4noD
 eJhFX8H5ZZ+HZnskPK/q5Gn7IxS1m6Q3Iz8Dr7rEZ5YDfXq/hakAhl3xBiK2kzW+jh
 9PBjPGZG9qo31nhOkfTDSJRRZ6xhCq4iMH6nAFdLjzp//pmdHGFKxaaRsF+9GXyzJg
 DVlXsOTzH5gQamzdrM44uFTuQlsQ7Roig51x9Rt9YReLxy0ccV8P2/3ulkFfyuOchP
 Q6HiTt2nPqG+JTPN9beKqmeFyH3957mSAuF3OeK7D3qAlSd5blWlQzlT/KlxsA/nKp
 bla2ShBXs4LIw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 15 Aug 2024 08:47:28 +0800
Message-Id: <20240815004728.983290-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Christophe JAILLET <christophe.jaillet@wanadoo.fr> This
 file already uses sysfs_emit(). So be consistent and also use sysfs_emit_at().
 This slightly simplifies the code and makes it more readable. 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seOeg-0002A6-8m
Subject: [f2fs-dev] [PATCH RESEND] f2fs: Use sysfs_emit_at() to simplify code
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This file already uses sysfs_emit(). So be consistent and also use
sysfs_emit_at().

This slightly simplifies the code and makes it more readable.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/f2fs/sysfs.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index ed4bf434207a..654a541dcc45 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -188,50 +188,50 @@ static ssize_t features_show(struct f2fs_attr *a,
 	int len = 0;
 
 	if (f2fs_sb_has_encrypt(sbi))
-		len += scnprintf(buf, PAGE_SIZE - len, "%s",
+		len += sysfs_emit_at(buf, len, "%s",
 						"encryption");
 	if (f2fs_sb_has_blkzoned(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "blkzoned");
 	if (f2fs_sb_has_extra_attr(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "extra_attr");
 	if (f2fs_sb_has_project_quota(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "projquota");
 	if (f2fs_sb_has_inode_chksum(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "inode_checksum");
 	if (f2fs_sb_has_flexible_inline_xattr(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "flexible_inline_xattr");
 	if (f2fs_sb_has_quota_ino(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "quota_ino");
 	if (f2fs_sb_has_inode_crtime(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "inode_crtime");
 	if (f2fs_sb_has_lost_found(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "lost_found");
 	if (f2fs_sb_has_verity(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "verity");
 	if (f2fs_sb_has_sb_chksum(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "sb_checksum");
 	if (f2fs_sb_has_casefold(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "casefold");
 	if (f2fs_sb_has_readonly(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "readonly");
 	if (f2fs_sb_has_compression(sbi))
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "compression");
-	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+	len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "pin_file");
-	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
+	len += sysfs_emit_at(buf, len, "\n");
 	return len;
 }
 
@@ -329,17 +329,14 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		int hot_count = sbi->raw_super->hot_ext_count;
 		int len = 0, i;
 
-		len += scnprintf(buf + len, PAGE_SIZE - len,
-						"cold file extension:\n");
+		len += sysfs_emit_at(buf, len, "cold file extension:\n");
 		for (i = 0; i < cold_count; i++)
-			len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n",
-								extlist[i]);
+			len += sysfs_emit_at(buf, len, "%s\n", extlist[i]);
 
-		len += scnprintf(buf + len, PAGE_SIZE - len,
-						"hot file extension:\n");
+		len += sysfs_emit_at(buf, len, "hot file extension:\n");
 		for (i = cold_count; i < cold_count + hot_count; i++)
-			len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n",
-								extlist[i]);
+			len += sysfs_emit_at(buf, len, "%s\n", extlist[i]);
+
 		return len;
 	}
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
