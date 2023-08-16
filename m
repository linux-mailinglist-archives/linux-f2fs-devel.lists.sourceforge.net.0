Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF277D99C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 07:08:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW8li-0004rj-7p;
	Wed, 16 Aug 2023 05:08:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qW8le-0004rS-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jfWn+nVnv3+8SQpKCe+L3XufWL8bAoo1SnGSq8hl/Lo=; b=kfzY50b5fcWim6SdN73jAdwQfp
 Nxi4mZ92zi/+NbCa7YzU7mLZ//LkJmSEO8yOGPWM3wZaY1LbznB+FUatT2FJRXXcoCeqK742sz8mi
 jU9Qoh12+EF6HGakkRFfv+YNSxGBVJsTM+QNG3lA5/PkjedkG/X/MgzM5zNX1kKmhag0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jfWn+nVnv3+8SQpKCe+L3XufWL8bAoo1SnGSq8hl/Lo=; b=Nfpkmoid3To6Ud4uLdqbn7R47h
 0b38d5P7zqluT4rk0gtmNXCQCC1Jp4uka81eJM6RxcmrSKhk9tGtqhW75o3mb1Pv0yhvXiL5r3xS5
 8HPHBC9S3sm+oLmfWiOgmwM8dn3lqjQ0vU/bzq8xWv6nSIRje7Ey+5DNPAoc4ORZFVJI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW8lb-0004zd-Ml for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:08:26 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 60BB01FD68;
 Wed, 16 Aug 2023 05:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692162497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfWn+nVnv3+8SQpKCe+L3XufWL8bAoo1SnGSq8hl/Lo=;
 b=uHk9/NDXy54Ps3hgFUM7ZmkOyUwDGzc2LYEjh1QTroGoBAOPsmDp/tn6Dqvps2Ro00Upls
 eWarw5OENO9wdPnP96JNE/BmvT0YSbezK9yPuwRpaVU+WGSjkf1x+rNiRSySipYz+x4g4A
 IW51xHtfDGXwDT6E2kjtTQ4HHvOSc2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692162497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfWn+nVnv3+8SQpKCe+L3XufWL8bAoo1SnGSq8hl/Lo=;
 b=6+OtEpZaQ8VZp1D1MHeDTr/KKhSlreUog2bxmATSI1pXWcgAtXZ/V98PeaadOzgBEJ7J2a
 W81afJNVNFNu86Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29969133F2;
 Wed, 16 Aug 2023 05:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id shOlBMFZ3GQBTwAAMHmgww
 (envelope-from <krisman@suse.de>); Wed, 16 Aug 2023 05:08:17 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Wed, 16 Aug 2023 01:08:00 -0400
Message-ID: <20230816050803.15660-7-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816050803.15660-1-krisman@suse.de>
References: <20230816050803.15660-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com> Support
 encrypted dentries in generic_ci_d_revalidate by chaining fscrypt_d_revalidate
 at the tail of the d_revalidate. This allows filesystem to just call
 generic_ci_d_revalidate and let it handle an [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qW8lb-0004zd-Ml
Subject: [f2fs-dev] [PATCH v6 6/9] libfs: Chain encryption checks after
 case-insensitive revalidation
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Support encrypted dentries in generic_ci_d_revalidate by chaining
fscrypt_d_revalidate at the tail of the d_revalidate.  This allows
filesystem to just call generic_ci_d_revalidate and let it handle any
case-insensitive dentry (encrypted or not).

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v2:
  - Enable negative dentries of encrypted filesystems (Eric)
---
 fs/libfs.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 26bf1b832b0a..994e4c98ec07 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1462,9 +1462,8 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 
-static int generic_ci_d_revalidate(struct dentry *dentry,
-				   const struct qstr *name,
-				   unsigned int flags)
+static int ci_d_revalidate(struct dentry *dentry, const struct qstr *name,
+			   unsigned int flags)
 {
 	const struct dentry *parent;
 	const struct inode *dir;
@@ -1515,6 +1514,15 @@ static int generic_ci_d_revalidate(struct dentry *dentry,
 	return 1;
 }
 
+static int generic_ci_d_revalidate(struct dentry *dentry,
+				   const struct qstr *name,
+				   unsigned int flags)
+{
+	if (!ci_d_revalidate(dentry, name, flags))
+		return 0;
+	return fscrypt_d_revalidate(dentry, name, flags);
+}
+
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
@@ -1532,7 +1540,7 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
 static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
-	.d_revalidate = fscrypt_d_revalidate,
+	.d_revalidate = generic_ci_d_revalidate,
 };
 #endif
 
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
