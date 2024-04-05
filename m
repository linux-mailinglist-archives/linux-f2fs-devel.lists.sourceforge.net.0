Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A58FC899C98
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Apr 2024 14:14:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsiSh-0003zH-4v;
	Fri, 05 Apr 2024 12:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rsiSe-0003yx-IY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8sbsv28mkc9rYVRw1VmvFfYk6iGtJsLkjAf38gOsMhQ=; b=Mjs6gfQZrX4sGmxkm7tqUMdTCp
 dSAsmUWz6RT+/ZEdxA6STIItH7XHA1jANAbqySC+HMFIjxZYysyv1D0Ch+V3VTMQ5m8CLjk3wtFCN
 2eF7qCHoJOu1EsUSR5pK+39OORDT57eNRXbgcwHrePzSI1VFNDyiNUguTPgfsztAZ+yA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8sbsv28mkc9rYVRw1VmvFfYk6iGtJsLkjAf38gOsMhQ=; b=DZcAH2c2lrd61KrAPup9vzVzgh
 uSssS/JcBmLycLC0JbZFqBdP3viV2AT8L3YvUUE4VUiXZDKiw/fxGDVFS3GwfLNzjEo3kkBtP3TkQ
 kCLXW6hEpyG9M1lrQ4wwmojHqfqMhi9VS/2AzJ5HHaU0f3D+MTbyb9DU2EmDHxRHiBgY=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsiSd-0004YX-Rw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712319249;
 bh=Yqu0eGYoz7+oBoYtg2t/IEEnKe5iA2fOw8gbynJ9Ihs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=df8xZznrABuMa8M76D/XsfV8axeXxvQxOkVf47zrMlcghtQDKi7QspHB/bIuP4gao
 l/2+hvqJdnjEEoG3F2mILMO2cusG1vFGc4ViArSz/Vf1jtvzB5eVUV9uLymYvLONza
 eSm6fbscy8EdR9KmWLUqeT76t/WcZ1AiahVLRU81iX5Zll6A5QsAT2QhupFby26xYU
 3DgfXtyfCDBNHeA2UArVpEv8OTo5/4/xgpfOoAh13wtwWoR6t6kzF2WJsaPI3DbeQ8
 bVtuPaXwjW56g7kS9VRALJkS6F1sCQZQgExEwupzhfU0Wsco8l3/DZlBs2qtNQwLbp
 k3lrTGi18YKTQ==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4558B3782135;
 Fri,  5 Apr 2024 12:14:08 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Fri,  5 Apr 2024 15:13:30 +0300
Message-Id: <20240405121332.689228-8-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405121332.689228-1-eugen.hristev@collabora.com>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
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
 --- fs/f2fs/dir.c | 15 ++++++++++----- 1 file changed, 10 insertions(+),
 5 deletions( [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rsiSd-0004YX-Rw
Subject: [f2fs-dev] [PATCH v16 7/9] f2fs: Log error when lookup of encoded
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
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com, ebiggers@kernel.org,
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
 fs/f2fs/dir.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index cbd7a5e96a37..376f705aa3f1 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -192,11 +192,16 @@ static inline int f2fs_match_name(const struct inode *dir,
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
+		if (ret == -EINVAL)
+			f2fs_warn_ratelimited(F2FS_SB(dir->i_sb),
+				"Directory contains filename that is invalid UTF-8");
+
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
