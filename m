Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51560791FD0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Sep 2023 02:39:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdK5p-00073Q-7G;
	Tue, 05 Sep 2023 00:38:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qdK5o-00073G-30
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 00:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ISSKmQj3dqOD9F3yzHQ0UcfguinM5ud6sS3eBUZ3RQE=; b=Gl4q6vcasX0TxFysCVCMp9cXdD
 ygf4zKVqP8Dn6nDjeW5dbrmRy3Yw6TN1Xs+zldZ5QxR8zLx28VTPkNPWP7HHrEY3CkDEjho4UkPUI
 Bb0V2BMBehynqOvzrgnzhGq7R6y9DnIR/jAjba84vIPqKNVZLgu3SFWrySDpYh0SheYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ISSKmQj3dqOD9F3yzHQ0UcfguinM5ud6sS3eBUZ3RQE=; b=j
 mn8uQQFPhxY7GwqMgSVejabkKpmjYCg6fWgeiV9BwXzajV1qctSE8wlVcETMri0GjNvxcqH3FrelK
 Y71s75cPhOapQYlEFI8Gat/3X7HARd8U0LjhtmdPyU/Q2Z4sVX2jcpUd3V9z2CPnCgrZVFwUVQ4ZT
 nlh7BWJukpQ1Du6Q=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdK5j-00035d-Gv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 00:38:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCC08B80932
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Sep 2023 00:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C12C433C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Sep 2023 00:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693874318;
 bh=G1fdhpDHWmDf/8HtIgolrNV0cuJIQjaWdeF0BAFmWuA=;
 h=From:To:Subject:Date:From;
 b=KqcgYVSJXVI1jGjdYuNi1mYOpXAYWfN7x75MbE+rX2ezVg4s3pJzOi7RThBnvqxoi
 UTvvqhRMoSDmsImEDw5Vsl1h1BEvY6effIT2i6pK/H4VuoNOy5MvV0ChR9GO8fJOAX
 y88nQNwb31RbeYirV0SCL3XiZIysq3pdKK9fSV+nSw4hyQGejDYMH3t2KuZ91PCIYy
 bnY/Z3rZDRGuSVtfcuQsMGAwVERo/tFabfeijDiNo8dBBbr09ojrn0F2Gb7KH+CTNU
 fbZLj+zdYQqfejdht4GnR8tVEeEOmiQzFy2TnQ25oySYMjcQLP0TBmxtal3/FWPfjH
 cVdhqtT6ei74A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  4 Sep 2023 17:38:02 -0700
Message-ID: <20230905003802.333176-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> The message "Info:
 Fix the reported corruption" makes people think that fsck has detected
 filesystem
 corruption. Replace this message with "Info: Automatic fix mode enabled"
 which is more accurate. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdK5j-00035d-Gv
Subject: [f2fs-dev] [PATCH] fsck.f2fs: use clearer info message for -a option
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

From: Eric Biggers <ebiggers@google.com>

The message "Info: Fix the reported corruption" makes people think that
fsck has detected filesystem corruption.  Replace this message with
"Info: Automatic fix mode enabled" which is more accurate.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fsck/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index 3690c74..dd8643c 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -263,7 +263,7 @@ void f2fs_parse_options(int argc, char *argv[])
 				break;
 			case 'a':
 				c.auto_fix = 1;
-				MSG(0, "Info: Fix the reported corruption.\n");
+				MSG(0, "Info: Automatic fix mode enabled.\n");
 				break;
 			case 'c':
 				c.cache_config.num_cache_entry = atoi(optarg);

base-commit: b15b6cc56ac7764be17acbdbf96448f388992adc
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
