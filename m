Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD74F779C07
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 02:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUchu-0007ZM-DC;
	Sat, 12 Aug 2023 00:42:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qUchp-0007Yz-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZLSJltA607r7xtpPPkkvUfJUZbMcdXItzz2TC+sxABk=; b=N3d1I8SOxYir+ELcIDTi8uefvl
 pcV2bWzl85UAVr06A1+sRodFTZ0CLi2Do9SVARDlmF5dnxteO5m7KQ0BC6Ej0jmxsPPU2KHor0Yww
 /MZx9+6oUOeXjlw3y6STNywWs/OGiUHH/f7hslCLkHFKi0VlpAwdu+g82C67COfyHfs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZLSJltA607r7xtpPPkkvUfJUZbMcdXItzz2TC+sxABk=; b=K1aCMt9UHlFLO/Sd3ObRFnewZB
 lR7615od1mQJyJR3f+s8cS3/0DdJQOuKd+Y0sxHdpKjhF1FLEyibXvN2z+TcKLZZeXAWFFp8ul/2d
 VIRM89827xUsQ3FGEIxQGp/kkct8/6hQZXMBn17y8HCq24ufSHxpBjvkHFePBs0HtK34=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qUchk-002xtD-7V for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:12 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEB07218E6;
 Sat, 12 Aug 2023 00:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691800918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLSJltA607r7xtpPPkkvUfJUZbMcdXItzz2TC+sxABk=;
 b=SQTOGHNV2KiavvzoucAG5T8Vw5AFv5EqUIT7kv7/ngcaAqlx47a8XJNITsEjC5YDJ/KbXw
 wenk5fzYjOmUCtWwimhSa3Zgkhx2H3QRzrEmmVANv2AGmz9VV+eBxyTDPMjATet6RyV6dq
 9aRrHOSeHurjemQaGcy+dOVl5DFOeMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691800918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLSJltA607r7xtpPPkkvUfJUZbMcdXItzz2TC+sxABk=;
 b=t+aMxO4dfWreIRpbqekuGL5xR6qXonpBXp/46PoO9x4xKG7WBEvCyDBYbyG/pPKaw67Waj
 7a6q0bcfAfohLZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA1F713592;
 Sat, 12 Aug 2023 00:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nwbYJ1bV1mQREAAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 12 Aug 2023 00:41:58 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Fri, 11 Aug 2023 20:41:39 -0400
Message-ID: <20230812004146.30980-4-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812004146.30980-1-krisman@suse.de>
References: <20230812004146.30980-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to change the signature of
 dentry_ops->revalidate, 
 avoid reusing the handler directly for d_weak_revalidate in 9p. Signed-off-by:
 Gabriel Krisman Bertazi <krisman@suse.de> --- fs/9p/vfs_dentry.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-) 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qUchk-002xtD-7V
Subject: [f2fs-dev] [PATCH v5 03/10] 9p: Split ->weak_revalidate from
 ->revalidate
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
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation to change the signature of dentry_ops->revalidate, avoid
reusing the handler directly for d_weak_revalidate in 9p.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/9p/vfs_dentry.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/9p/vfs_dentry.c b/fs/9p/vfs_dentry.c
index f16f73581634..0c6fa1f53530 100644
--- a/fs/9p/vfs_dentry.c
+++ b/fs/9p/vfs_dentry.c
@@ -94,9 +94,15 @@ static int v9fs_lookup_revalidate(struct dentry *dentry, unsigned int flags)
 	return 1;
 }
 
+static int v9fs_lookup_weak_revalidate(struct dentry *dentry,
+				       unsigned int flags)
+{
+	return v9fs_lookup_revalidate(dentry, flags);
+}
+
 const struct dentry_operations v9fs_cached_dentry_operations = {
 	.d_revalidate = v9fs_lookup_revalidate,
-	.d_weak_revalidate = v9fs_lookup_revalidate,
+	.d_weak_revalidate = v9fs_lookup_weak_revalidate,
 	.d_delete = v9fs_cached_dentry_delete,
 	.d_release = v9fs_dentry_release,
 };
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
