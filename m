Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B7523D87
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 21:32:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nos4L-0006ul-20; Wed, 11 May 2022 19:32:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nos4J-0006uV-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ol3n/j1Z0J4X4oP8jPfVRWmaIqS4l3Sy3R87YV4Hrm4=; b=nU405UhzzKe5dZB+RI20IhkT7F
 fXOjgFbkEY+yLjddEmKret1FiyH96irDCkNRshTCs92roUBgNyPN8bDMAZT3f1ItWkzr0+MgT/U/w
 x/YQvMrKYMw6BbjtZS/ArH5upLz+XEgi2EqTjq9SdLr2e8lQcjNIWitrVCk0J+OWGfJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ol3n/j1Z0J4X4oP8jPfVRWmaIqS4l3Sy3R87YV4Hrm4=; b=ggcgcQp/cVnVwzrI6yBfBxoybG
 NY8G2YXS9AqRuwgSOnPa5jtRf9l0KSiK7+Ps3MKAMJ1mg1wAaJWek+3fVDnQHWwP9qAzxQZhhRfUh
 b7AOlTMInrd7qcFau9zSfrf9cprVckjtPEUdNUlJKEae1Y2TekLOJGadm/DwMMZvqjM8=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nos4I-0093hD-0O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 19:32:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id A23651F42914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652297531;
 bh=TjgXhAZ/MBxjUpu+HmWWAjpjE8dWN7hkqM2SLl+MDBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VvnzLQ74hbS+WXZ8pHwFFxiMw0z8L3tIEV0a8oPFrq/dlkcMT9D8372goZdjjIiL1
 U4Nd1VmivnTjUYHsQz6MOQ8gZg13qS5w+7EMeZmjC1obOQzoVroUZqfLP/n45isJk2
 I9CBQr9sUzcFNiAcVAjvy+t/2wavw/087SmnsbJ1O2SL9U/ViXomrHFsNDykUkUf3N
 e4kYN2nrO3Z1BXZmPNTWqYjX8Tn/ohS73l8HSFpKng0/2a48pcXTKyZYQTN0wcSvSk
 xrYfXD/T/dUbyZ+01yqCVH1ONS1KhWF8rbZg/i7ETUMb9oWGlGNbgFa3lA7JJMA2dJ
 o4i93sxDxfzEw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Wed, 11 May 2022 15:31:41 -0400
Message-Id: <20220511193146.27526-6-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511193146.27526-1-krisman@collabora.com>
References: <20220511193146.27526-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The existence of fname->cf_name.name requires s_encoding &
 IS_CASEFOLDED, therefore this can be simplified. Signed-off-by: Gabriel Krisman
 Bertazi <krisman@collabora.com> --- fs/ext4/namei.c | 20 +++++++ 1 file
 changed, 7 insertions(+), 13 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nos4I-0093hD-0O
Subject: [f2fs-dev] [PATCH v4 05/10] ext4: Simplify hash check on ext4_match
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
Cc: ebiggers@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The existence of fname->cf_name.name requires s_encoding & IS_CASEFOLDED,
therefore this can be simplified.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/ext4/namei.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 5296ced2e43e..cebbcabf0ff0 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1438,25 +1438,19 @@ static bool ext4_match(struct inode *parent,
 #endif
 
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
-	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
+	if (IS_ENCRYPTED(parent) && fname->cf_name.name) {
+		if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
+		    fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de))
+			return false;
+	}
+
+	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
 		struct unicode_name u = {
 			.folded_name = &fname->cf_name,
 			.usr_name = fname->usr_fname
 		};
 		int ret;
 
-		if (fname->cf_name.name) {
-			if (IS_ENCRYPTED(parent)) {
-				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
-					fname->hinfo.minor_hash !=
-						EXT4_DIRENT_MINOR_HASH(de)) {
-
-					return false;
-				}
-			}
-		}
-
 		ret = ext4_match_ci(parent, &u, de->name, de->name_len);
 		if (ret < 0) {
 			/*
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
