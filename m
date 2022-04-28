Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1600513E85
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 00:30:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkCeS-0004nB-9R; Thu, 28 Apr 2022 22:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nkCeQ-0004my-33
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 22:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SGi1PkdHCNzQd8mrIznjvDJcghdBwZh3daz4Nb+lP84=; b=CYgWhRrfrX7jm4ThSHI5Ibowwn
 XPCdBxZFYzzmeXHNaakdJZz0sgb+G7ikdA98R3PRtfT8q829EUYlbS15N/UVcH1vBSHnUgMdSb0l4
 YKRfGEU3qy3J62Qp2KIBxRaZD8pfTuez0zVi7ThejgOhBj7BlX+Mj56/ykuwK/eJu+Ms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SGi1PkdHCNzQd8mrIznjvDJcghdBwZh3daz4Nb+lP84=; b=DIGijqSQub8rX5cj716E/PYy0r
 84ymRu5ldEWsOkqifVBCIQSH0tXWJju0eC//b5OHT34/UnPwR/plos511oNNxECmkIxZhNhIV9Pue
 oY0DVyccm+vNXLMe5GTLPZet0EpqGXkc8HMUTtW/NMoq5vdxzvQo1SZNvNNSvtK0+L58=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkCeP-0001Tn-H3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 22:30:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 5116D1F45D0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651183853;
 bh=vyo85rNwnnFuylcqfkeboay433CDn2ax39QHFWTvwF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WMR9VUiLNDGNRTAYhKWATRTuaeN5B7iI3NBjMMoVNp/RH7Oy21w58uIlez9YHUNdN
 /W3UhwGbbuqvvxzqZqNrjGTw55G7yNuqWQ55OIxvJxfu868mYBR2fsRhvMCxZDcMU9
 DuBSinlFBPyT10HVJdhKe+zOboGkUPnMS9htVnAx5PfDGmmXGbTY6l3jeHOIMJ3soJ
 G9miPvzy9/CSLbQoMT4HcxuX+ObULnTwg7U5NfDVKr0mHhk/mnuQLcu0jprUlTPKrV
 jaQriwY5kA9YmznyyJeq28rRu4yK/USlyVMIqMWt/ZE3X5kzzVGsTdGzvFXoGXFwuv
 NoQag6JSv3AmQ==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Thu, 28 Apr 2022 18:10:24 -0400
Message-Id: <20220428221027.269084-5-krisman@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428221027.269084-1-krisman@collabora.com>
References: <20220428221027.269084-1-krisman@collabora.com>
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
 Bertazi <krisman@collabora.com> --- fs/ext4/namei.c | 18 ++++++ 1 file changed,
 6 insertions(+), 12 deletions(-) 
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
X-Headers-End: 1nkCeP-0001Tn-H3
Subject: [f2fs-dev] [PATCH v2 4/7] ext4: Simplify hash check on ext4_match
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
 fs/ext4/namei.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 5102652b5af4..e450e52eef48 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1440,19 +1440,13 @@ static bool ext4_match(struct inode *parent,
 #endif
 
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
-	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
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
+	if (IS_ENCRYPTED(parent) && fname->cf_name.name) {
+		if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
+		    fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de))
+			return false;
+	}
 
+	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
 		u.folded_name = &fname->cf_name;
 		u.usr_name = fname->usr_fname;
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
