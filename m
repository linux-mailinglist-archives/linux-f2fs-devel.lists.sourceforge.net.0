Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F45510358
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Apr 2022 18:30:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njO5I-0000mi-T0; Tue, 26 Apr 2022 16:30:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1njO5H-0000mY-4v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Apr 2022 16:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F+RjSnjlqZjvDbmlaADnjfPHTPBxgE1mv0nr/XuAtsM=; b=EjZPTgUSwrAGifM+lELkCDa6g9
 rlNJPCM2fRoj8bKGlLYk4AvGolg/XKmO7LoWCu3TUVNwWdjT0W7he6L6zdr4w1aQKnJpujMZRwVNj
 vI+GsqeYI8tW90sCoVsi05JAwrQj3KCXXEr6eT/01UfkPD2b7R3YsEdifkIcIpjJNv9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F+RjSnjlqZjvDbmlaADnjfPHTPBxgE1mv0nr/XuAtsM=; b=ju8jTeRD/FjojWgGU9rXoI4qXz
 spOI4ZevVAA3Lm7+50nkmvfhLKKVkhhFYxAF76QoD/FYDaWQFkFnbsklLTwTEc/81u/vEwYNuxpLY
 MGMKLrB+zQYe7kVo+ss6JOPGgHN6HceXmd0qoM+sOaDtV2ip9fdh9NSgM0JqB7J9o+z8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njO5E-00ArA2-Sw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Apr 2022 16:30:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0723CB82047
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Apr 2022 16:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2518C385A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Apr 2022 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650990623;
 bh=YNeOYWxJR7wjVSw+Ti3XYGoMVjXTkzBHPM6tsfMxWXc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=H0C6JbHxW9T9TijPfOI/urWd6q8fVlgU7jwjESni6J6xeQ/+34nwgP1jKzyT0a37Z
 5CMGSfgxLsmwoUmHBL9bHA0oCwh/RKn5PYP9fcxRwrTi5MOf6Kr7Y/ho6nFWmFoDjI
 /d9P1jjJ7JbKTUtp/9nC1nMfAdnlyYxEEkc3oN35WqpDwZMkjM8UrET68cHxe4q1m4
 nFl0wJ/P/sk1MA2JH6xel2CbBvA/rIWUYscD4arciMQVPdc3zO9RvcJvU0G+Xz/ACh
 MdovQBPipHHyCmiPf6BpO/tcVgqjl5KqvSjDrmds7oMC3buLAMk7XHpj77jz6tMpD8
 eEHcsW5bghRMQ==
Date: Tue, 26 Apr 2022 09:30:22 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YmgeHgnGY2AFgjHl@google.com>
References: <20220422211819.2230879-1-jaegeuk@kernel.org>
 <20220422211819.2230879-5-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422211819.2230879-5-jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- Change
 log from v1: - Fix xfstests failure include/f2fs_fs.h | 5 +++-- 1 file changed,
 3 insertions(+), 2 deletions(-) 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njO5E-00ArA2-Sw
Subject: Re: [f2fs-dev] [PATCH 5/6 v2] f2fs-tools: use android config only
 if there's no config.h
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v1:
 - Fix xfstests failure

 include/f2fs_fs.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index d6374270c188..ad2798cf388c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -26,13 +26,14 @@
 #include <stddef.h>
 #include <string.h>
 #include <time.h>
+
 #ifdef HAVE_CONFIG_H
 #include <config.h>
-#endif
-
+#else
 #ifdef __ANDROID__
 #define WITH_ANDROID
 #endif
+#endif /* HAVE_CONFIG_H */
 
 #ifdef WITH_ANDROID
 #include <android_config.h>
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
