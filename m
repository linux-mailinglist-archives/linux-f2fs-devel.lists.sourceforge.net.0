Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933B7397F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 09:12:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCEUv-0003Ka-Pr;
	Thu, 22 Jun 2023 07:12:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qCEUu-0003KU-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 07:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ts81l7dfuJiU1bEnBMPO6/aks0gF2eLVemgTt357AUI=; b=IsX6YRumVhz7aCgSgylkB1Je3f
 pRezKW/8PumS1utJ40nT6Xwzu39d+VZyY+I+NPjtygfoLzjAGQDS0scDZj6CtUcsx6p70kHESJcJV
 vdcc8hrDs9L0YJVz++hh7XcLkXugtEC7F1pQeW9oSgofKe3j/4QU5PzlldshtOtvBfbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ts81l7dfuJiU1bEnBMPO6/aks0gF2eLVemgTt357AUI=; b=DE7CAhV/7oTj9LPREeVIqyRDbs
 XZJCpFhRFU0lsnyUJ7I/jlYZSPGZGCJCgzB4Xydn8ExXZHzY/FH1M3FQq1PA/QLVJaegKxTWDZoqN
 j5uoEb3U0dBWsiuZvRidnN3yV4AqYONhzMssmY+1UqoJipv/v18yD3bid+qmZvY1oAiM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCEUr-0006WU-Ke for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 07:12:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CD576177B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jun 2023 07:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E64C433CA;
 Thu, 22 Jun 2023 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687417963;
 bh=FrHV/aMYkgKJL7vYPTB/f+fAorcu5w2trEwg00r+1/4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=vKpzyF7M/taaUfr2eUVeK3zXkQjzykKdEkWrEcsha2+UlziELuyNE4/zglr33vT9N
 Y4tkpP4zPLnXYjJ1PkW8TLIAeY+7hpfrfT0n7x2oTj9KY2fCZ/uxh6x+Btc2WQuB1l
 9JUpyXeSnvSEzzEnvDpHcDo24Z/SGrHnf5o99Om6P09EsRKEQ6qtOnf4fyd3GSS+67
 1txDZVSIMZEnmLp+WKywCg2S43ZmSDYMrEzizxjQgSHIcPlQFJZPZZctYi5wMmz8R6
 Hqu1k/NfB0kvyrkMpHYUOaiShwSL7UxA40mgAXz7OhGMcyvcmCb1CEw+hdiiIwtOgk
 bF02r3o/cFXqA==
Date: Thu, 22 Jun 2023 00:12:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZJP0aoy03Vx2Q2K1@google.com>
References: <20230606203645.3926651-1-jaegeuk@kernel.org>
 <ZIjqKHDUmN6u9pXa@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZIjqKHDUmN6u9pXa@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's compress tmp files for the given extension list. This
 patch does not change the previous behavior, but allow the cases as below.
 Extention example: "ext" 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCEUr-0006WU-Ke
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress tmp files given extension
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's compress tmp files for the given extension list.

This patch does not change the previous behavior, but allow the cases as below.

Extention example: "ext"

- abc.ext : allow
- abc.ext.abc : allow
- abc.extm : not allow

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
  Change log from v2:
   - fix parameters

  Change log from v1:
   - refactor to allow abc.ext.dontcare only

 fs/f2fs/namei.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 3e35eb7dbb8f..80806ce1289f 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -23,7 +23,7 @@
 #include <trace/events/f2fs.h>
 
 static inline bool is_extension_exist(const unsigned char *s, const char *sub,
-						bool tmp_ext)
+						bool tmp_ext, bool tmp_dot)
 {
 	size_t slen = strlen(s);
 	size_t sublen = strlen(sub);
@@ -49,8 +49,12 @@ static inline bool is_extension_exist(const unsigned char *s, const char *sub,
 	for (i = 1; i < slen - sublen; i++) {
 		if (s[i] != '.')
 			continue;
-		if (!strncasecmp(s + i + 1, sub, sublen))
-			return true;
+		if (!strncasecmp(s + i + 1, sub, sublen)) {
+			if (!tmp_dot)
+				return true;
+			if (i == slen - sublen - 1 || s[i + 1 + sublen] == '.')
+				return true;
+		}
 	}
 
 	return false;
@@ -148,7 +152,7 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
 	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
 	hot_count = sbi->raw_super->hot_ext_count;
 	for (i = cold_count; i < cold_count + hot_count; i++)
-		if (is_extension_exist(name, extlist[i], false))
+		if (is_extension_exist(name, extlist[i], true, false))
 			break;
 	f2fs_up_read(&sbi->sb_lock);
 	if (i < (cold_count + hot_count))
@@ -156,12 +160,12 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
 
 	/* Don't compress unallowed extension. */
 	for (i = 0; i < noext_cnt; i++)
-		if (is_extension_exist(name, noext[i], false))
+		if (is_extension_exist(name, noext[i], true, false))
 			return;
 
 	/* Compress wanting extension. */
 	for (i = 0; i < ext_cnt; i++) {
-		if (is_extension_exist(name, ext[i], false)) {
+		if (is_extension_exist(name, ext[i], true, true)) {
 			set_compress_context(inode);
 			return;
 		}
@@ -189,7 +193,7 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
 	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
 	hot_count = sbi->raw_super->hot_ext_count;
 	for (i = 0; i < cold_count + hot_count; i++)
-		if (is_extension_exist(name, extlist[i], true))
+		if (is_extension_exist(name, extlist[i], true, false))
 			break;
 	f2fs_up_read(&sbi->sb_lock);
 
-- 
2.41.0.162.gfafddb0af9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
