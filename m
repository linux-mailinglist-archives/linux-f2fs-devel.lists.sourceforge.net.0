Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C904871A75
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Mar 2024 11:16:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhRqy-0003vF-LB;
	Tue, 05 Mar 2024 10:16:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rhRqx-0003uy-OE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 10:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8W4xgLXAHu7j23bZ91oYk9DdyruAuK8j58HlBrltQZA=; b=b0SMnk1FmldPVNamOi0w6ZfhsP
 e4QCsxiKC7DAIUE2Udh9ToglVQUbC1Tjly7z/uIh3Zo8AMBBcIIc5zBxdDddCeHes7qA8TJXmH4Rx
 nmDsOxpheUx0DC+xz/nUT+lohh1UgXRMiKVmYjX7h7LDPT3vRI48usp8CiAnwodOPWHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8W4xgLXAHu7j23bZ91oYk9DdyruAuK8j58HlBrltQZA=; b=Q4FukuFrvGF4M1RqkZkIAujhcc
 b0NvXJ7mVqHKCHeTutoPTs/ZS6LhoCmbRa/pk5GViJ2+RDcXfOzsfu3PbuMEQ5ppIch9RYY/I+D2u
 iwAMDgP3kL61A6IZ3SDJXUTDpJgFyCh7JwGiEAaMfo3N6KtYeKqsK+D469KMIY/pVSOU=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhRqr-0001wS-GW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 10:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709633809;
 bh=VysEZ2lHFHLjYXsEGtqT3tM7vTbrrtv13nJeePZzgiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oxGh57L9DzbFshNO4gMAW7zI1Vej6TDs0+KddLIM+OhA+vhy2JSRQ+hCNG7c1jpFI
 QM/SXJTw3Jmf4MSOiGsaBL9niHnZN6xN02d3wutMuNbeMqrapllSM8BjLIqf8/BQC0
 It1qJwLq/SbsZSzKpcFDdEvRvjcnXGjDTIVHw2Us9YWoyW/zo1MTsOUd8GgPMGbQXd
 q66bbmeX+b81CCewGEtRHgJnOA3qY1uZIje/g4VUAqo2XR+1/n0QegedcGNl6DPutL
 WCrAsqTDaHannc+ADmvLdeX9tsa6RE+ObjNwrFjlFx+lzKncZJ8Qyj/AnIRj5LelUR
 MaK4y8S+SGx8w==
Received: from eugen-station.domain.com (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9C24C37820E8;
 Tue,  5 Mar 2024 10:16:46 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Tue,  5 Mar 2024 12:16:06 +0200
Message-Id: <20240305101608.67943-8-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305101608.67943-1-eugen.hristev@collabora.com>
References: <20240305101608.67943-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the volume is in strict mode,
 generi c_ci_compare can report
 a broken encoding name. This will not trigger on a bad lookup, which is caught
 earlier, only if the actual disk name is bad. Suggested-by: Gabriel Krisman
 Bertazi <krisman@suse.de> Signed-off-by: Eugen Hristev
 <eugen.hristev@collabora.com>
 --- fs/f2fs/dir.c | 21 ++++++++++++++++----- 1 file changed, 16 insertions(+), 
 5 dele [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rhRqr-0001wS-GW
Subject: [f2fs-dev] [PATCH v13 7/9] f2fs: Log error when lookup of encoded
 dentry fails
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krisman@suse.de, brauner@kernel.org, jack@suse.cz,
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com,
 viro@zeniv.linux.org.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the volume is in strict mode, generi c_ci_compare can report a broken
encoding name.  This will not trigger on a bad lookup, which is caught
earlier, only if the actual disk name is bad.

Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 fs/f2fs/dir.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 0601b4c8bacc..1bb98970a56a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -190,11 +190,22 @@ static inline int f2fs_match_name(const struct inode *dir,
 	struct fscrypt_name f;
 
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (fname->cf_name.name)
-		return generic_ci_match(dir, fname->usr_fname,
-					&fname->cf_name,
-					de_name, de_name_len);
-
+	if (fname->cf_name.name) {
+		int ret = generic_ci_match(dir, fname->usr_fname,
+					   &fname->cf_name,
+					   de_name, de_name_len);
+		if (ret < 0) {
+			/*
+			 * Treat comparison errors as not a match.  The
+			 * only case where it happens is on a disk
+			 * corruption or ENOMEM.
+			 */
+			if (ret == -EINVAL)
+				f2fs_warn(F2FS_SB(dir->i_sb),
+					"Directory contains filename that is invalid UTF-8");
+		}
+		return ret;
+	}
 #endif
 	f.usr_fname = fname->usr_fname;
 	f.disk_name = fname->disk_name;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
