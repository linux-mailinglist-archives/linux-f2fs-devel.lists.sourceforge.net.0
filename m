Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F2253ADB9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 22:45:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwVDE-0008RI-Bd; Wed, 01 Jun 2022 20:45:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nwVDC-0008R6-Cm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/p9ZJxiHgKMEbJJoD8x9X6Bb6v2VA9bCulN38kw5dk=; b=DclnAz8x4qw4RkwYHV4bNUKuVi
 KhCLbsTQuO3IddEJhiAF83zeVsAhtW2bryqPRTvUbysaUMhtoI+aaSYBoH8ylIj+OciOPjLWQpdEv
 Omx7fpuC7mgMQ4voKUROT/tOADPn1zzVTYf0bUT8Ao//gE+kDKIPfnhhiJMB4fmhkiRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/p9ZJxiHgKMEbJJoD8x9X6Bb6v2VA9bCulN38kw5dk=; b=QSyelja3I+4mhwUYcYaRYITUrN
 aDBt7LVuqdpmWGH/ESzNQJ/kYXECJoLP6dq8VIOc4hc/zmpp/49MsXxKfjaA5ReJ2zcYM4tsFJzj1
 CdE7lYJw2z5n5xzxz1x0W/aOiWPUbso0vhnVk+yJuAuEVuDuVXuyCR4ZOrv7zSmaBP7o=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwVDC-001KTw-EI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:45:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 1D0291F438EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654116296;
 bh=BBhM4E24E3FzLZ2ImuINI815DcsgQV3gbQsLsPXZbL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ARysa8n0T/spCEKppZpd7ncpab+aSeFM2iIGRnjodegjdm0pXm2ewpECE+U8l1kN2
 fOq2mYSWr/sqCpxQrh2R0VIeBaWps7RE4rea2Qn6O48t3AZvtmaa1hjQ0l3LxFLvk6
 59aX+JBnRK8RALv0X11lJQqIeTBjkWWRjgTczIb1D2jBn3New5scJBkLMtXgXF2rw+
 g2tIFy4GbBKTRhg3ON16h9/2O3A7pB8BIfmSN24prOpKDKvm2HiZBY9em8FMO6RlLH
 4By2c+o4wsvi19z2UIdyeKBY0wxexp+QgDBvyMfA3zvpeG0mxSj5AZqEU3iRK5mnuy
 XOzjMV1cKdjEg==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org
Date: Wed,  1 Jun 2022 16:44:34 -0400
Message-Id: <20220601204437.676872-5-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601204437.676872-1-krisman@collabora.com>
References: <20220601204437.676872-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Preserve the existing behavior for encrypted directories,
 by rejecting negative dentries of encrypted+casefolded directories. This
 allows
 generic_ci_d_revalidate to be used by filesystems with both fe [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nwVDC-001KTw-EI
Subject: [f2fs-dev] [PATCH RFC 4/7] libfs: Support revalidation of encrypted
 case-insensitive dentries
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Preserve the existing behavior for encrypted directories, by rejecting
negative dentries of encrypted+casefolded directories.  This allows
generic_ci_d_revalidate to be used by filesystems with both features
enabled, as long as the directory is either casefolded or encrypted, but
not both at the same time.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/libfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 618a85c08aa7..fe22738291e4 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1461,6 +1461,9 @@ static inline int generic_ci_d_revalidate(struct dentry *dentry,
 		const struct inode *dir = READ_ONCE(parent->d_inode);
 
 		if (dir && needs_casefold(dir)) {
+			if (IS_ENCRYPTED(dir))
+				return 0;
+
 			if (!d_is_casefold_lookup(dentry))
 				return 0;
 
@@ -1470,7 +1473,8 @@ static inline int generic_ci_d_revalidate(struct dentry *dentry,
 				return 0;
 		}
 	}
-	return 1;
+
+	return fscrypt_d_revalidate(dentry, flags);
 }
 
 static const struct dentry_operations generic_ci_dentry_ops = {
@@ -1490,7 +1494,7 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
 static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
-	.d_revalidate = fscrypt_d_revalidate,
+	.d_revalidate_name = generic_ci_d_revalidate,
 };
 #endif
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
