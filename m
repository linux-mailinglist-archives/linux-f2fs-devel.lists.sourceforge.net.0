Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7657C727C7C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 12:12:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7CdK-0003DQ-2q;
	Thu, 08 Jun 2023 10:12:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q7CdI-0003DA-5M
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 10:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vW9Pg3025r7tvGJQCvfoCPcgA0cDwnTwjIgJuW7mEx0=; b=Qs/Y/wKe1lKxyUX5Kxrc3Gv6RN
 XtTbCIcvoO1L3WcVn/gg5XLdUgd4okjXX2w9kZ3M4U9GEHDEGNpZNb+qxPEEqSbcETZdmdq90iXmN
 TSMqslEPnuvEbKW3HRXzz1yya2qfEpIFCgEmXFf7bVOX8awn4ZADq8FqzunNq9gAjV/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vW9Pg3025r7tvGJQCvfoCPcgA0cDwnTwjIgJuW7mEx0=; b=R
 dB8kEaQLClH9VCKIEKmXI7Uo+wr4d3K9p7Hi06POLD9HUxC0x2njJSDJFRtrbp5MdFmqU724jijAX
 5Is5uumpqnqgD5yLgxzO7aK9Ti4BViB0HkHZzjjoUyxYFmXXk90Pw4AH8To7ACwupEyJ8wqaCd1bd
 Yo2oJ19FNUFKO/aY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7CdH-00Ebdg-Jk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 10:12:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3930B61866
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jun 2023 10:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7B5C4339C;
 Thu,  8 Jun 2023 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686219157;
 bh=4e3yJa9fSjX/Z/iF3gNTTDJB/YVfizwvnPCS8mnBgzU=;
 h=From:To:Cc:Subject:Date:From;
 b=gGsmp47QZArgcGmKwSYyX9BHTedwg7hONg45j5xd/e0J28dnHD2t9XTHUbaOXCIHI
 G6ikfrq8q1kIyDZIxLaDy1eG2dmOPeSj+9LVssk92g7D/Hji2myNLXwEjLAuGoHueS
 dgODBfUPgrNgTtbIAhS8bb8soWzKdIC8dmSVdquw2ac3RYjLwC/R6ZvJoQt2gUPd8p
 LutVBqNhK4STZ2ae6mJmdrSB2v4zmVM9md0BPd2wKTIxZzvzNbbi10ADchDBDXLvz9
 A3hyCnOjGgi7d9hlQ15xA4VHVrcVHpDr/fUuLCik9DPfjPlqs8Bz+iMOaLRBeJU9/i
 vxLpIKzIVEXOQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  8 Jun 2023 18:12:30 +0800
Message-Id: <20230608101230.3671677-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_dentry_hash() may return -ENOMEM due to malloc() failure,
 however caller won't check validaty of return value, result assign or check
 wrong hash value, fix to call assert() for such case. Signed-off-by: Chao
 Yu <chao@kernel.org> --- lib/libf2fs.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-) 
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
X-Headers-End: 1q7CdH-00Ebdg-Jk
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to call assert() if
 f2fs_dentry_hash() fails
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_dentry_hash() may return -ENOMEM due to malloc() failure, however
caller won't check validaty of return value, result assign or check
wrong hash value, fix to call assert() for such case.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 lib/libf2fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 7a08a7f..0ab7342 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -497,8 +497,8 @@ f2fs_hash_t f2fs_dentry_hash(int encoding, int casefolded,
 
 	if (len && casefolded) {
 		buff = malloc(sizeof(char) * PATH_MAX);
-		if (!buff)
-			return -ENOMEM;
+		ASSERT(buff);
+
 		dlen = table->ops->casefold(table, name, len, buff, PATH_MAX);
 		if (dlen < 0) {
 			free(buff);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
