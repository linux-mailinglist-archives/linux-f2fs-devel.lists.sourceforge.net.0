Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6C68A3EF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 22:01:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pO3BL-0006ot-Tj;
	Fri, 03 Feb 2023 21:01:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1pO3BI-0006oi-Gh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 21:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvvmq4e+UnqjqHZYFWY+SBLpSNDieXa5F6FXm74ran0=; b=QkKdnlJlhZyr260r0ZnFhZXpfM
 u1LstUpdQQRkWKjTCzUKokDy+DZi7bLyMJQLLnu1N3cn/1Z0o2AxjGtRYXXKQzj3WenjCYHHkUfuq
 3r7js7qLbo+gpxpf5wP7ny63Amsdioj7TvVkpaHVoXvJDBNeQ+tE9AeK5+k3ItRmpdlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xvvmq4e+UnqjqHZYFWY+SBLpSNDieXa5F6FXm74ran0=; b=P+4BlQklJO07o9Bsei8W5Kb3EL
 hLDIHjXmZ2gkHEyNFuqr+eY0E3vXTPQ8HNXgpUVWR+H2qig3Wps8tEE4pAkP9z2TkLIWyR9fPkG0u
 Ulo/70DPwuEujugnUH4jDUnhy6V4pP9nWlsKiB/bwVFdEnLgrpPpsU580Hrj4MA4UEGU=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pO3BB-00ASwJ-BM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 21:01:10 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22B4F35227;
 Fri,  3 Feb 2023 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675458059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvvmq4e+UnqjqHZYFWY+SBLpSNDieXa5F6FXm74ran0=;
 b=HYahpR9qIPXN3yqqoea6UWTGw+G2MhBYnPG+zcq5zAeBZX0gULd/yYcU6CW29w7Odn6VI1
 a9TZ+WyDDp+QYjCadv8Gb9crGeYiUSCnTRYFehvRVKlQwYQOnfjAyokM2jxVpn8T66gOTn
 /A7qGafBe/dADhpfCfIxbAtlEO4VDPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675458059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvvmq4e+UnqjqHZYFWY+SBLpSNDieXa5F6FXm74ran0=;
 b=Y781/F/KHOG0LdivmD+cc4alLvZS7OpJHSbM0xnLmCcV3guYK11s9UwrrOMNvSpO/tVtHn
 PqpADwhJwjvLbeDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A52641358A;
 Fri,  3 Feb 2023 21:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BT5aGwp23WPwJgAAMHmgww
 (envelope-from <krisman@suse.de>); Fri, 03 Feb 2023 21:00:58 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, tytso@mit.edu, jaegeuk@kernel.org,
 ebiggers@kernel.org, jack@suse.cz
Date: Fri,  3 Feb 2023 18:00:34 -0300
Message-Id: <20230203210039.16289-3-krisman@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230203210039.16289-1-krisman@suse.de>
References: <20230203210039.16289-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Gabriel Krisman Bertazi <krisman@collabora.com> This
 flag marks a negative or positive dentry as being created after a
 case-insensitive
 lookup operation. It is useful to differentiate dentries this way to detect
 whether the negative dentry can be t [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pO3BB-00ASwJ-BM
Subject: [f2fs-dev] [PATCH v2 2/7] fs: Add DCACHE_CASEFOLD_LOOKUP flag
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

This flag marks a negative or positive dentry as being created after a
case-insensitive lookup operation.  It is useful to differentiate
dentries this way to detect whether the negative dentry can be trusted
during a case-insensitive lookup.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/dcache.c            | 8 ++++++++
 include/linux/dcache.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 98521862e58a..05e4c7019e17 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1958,6 +1958,14 @@ void d_set_fallthru(struct dentry *dentry)
 }
 EXPORT_SYMBOL(d_set_fallthru);
 
+void d_set_casefold_lookup(struct dentry *dentry)
+{
+	spin_lock(&dentry->d_lock);
+	dentry->d_flags |= DCACHE_CASEFOLD_LOOKUP;
+	spin_unlock(&dentry->d_lock);
+}
+EXPORT_SYMBOL(d_set_casefold_lookup);
+
 static unsigned d_flags_for_inode(struct inode *inode)
 {
 	unsigned add_flags = DCACHE_REGULAR_TYPE;
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index b6188f2e8950..457345123cb6 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -209,6 +209,7 @@ struct dentry_operations {
 #define DCACHE_FALLTHRU			0x01000000 /* Fall through to lower layer */
 #define DCACHE_NOKEY_NAME		0x02000000 /* Encrypted name encoded without key */
 #define DCACHE_OP_REAL			0x04000000
+#define DCACHE_CASEFOLD_LOOKUP		0x08000000 /* Dentry comes from a casefold directory */
 
 #define DCACHE_PAR_LOOKUP		0x10000000 /* being looked up (with parent locked shared) */
 #define DCACHE_DENTRY_CURSOR		0x20000000
@@ -497,6 +498,13 @@ static inline bool d_is_fallthru(const struct dentry *dentry)
 	return dentry->d_flags & DCACHE_FALLTHRU;
 }
 
+extern void d_set_casefold_lookup(struct dentry *dentry);
+
+static inline bool d_is_casefold_lookup(const struct dentry *dentry)
+{
+	return dentry->d_flags & DCACHE_CASEFOLD_LOOKUP;
+}
+
 
 extern int sysctl_vfs_cache_pressure;
 
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
