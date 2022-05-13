Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E55268BB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 19:53:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npZTO-0005eo-8P; Fri, 13 May 2022 17:53:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npZTN-0005ei-0G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 17:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NPmtz4mZLcyufN1eGJAe1mFk+RlbPDuL4uoYK16Leds=; b=HcTJPhWMYGvinG6Y2xxnHj87D/
 IJVjmgi9I/2ZN/gHoQP18dHfyg69g3lNZFOYbEU+vGmlB5bAKRcRiNxdLMCD+IUoEqLBizaExdX1e
 TXKomRHq+Dv7v62ybImepTRjmQud5MZzHuMQJhcpWOSPj/KMYit6BZTqGg5Vg6WiwePI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NPmtz4mZLcyufN1eGJAe1mFk+RlbPDuL4uoYK16Leds=; b=jErpSurUTb0up6yQZ+2LrzHQBn
 7E52QfUlk7dKNRznLe7M4jvvkzzd+9WxcbkcRoAC52NdZV+AON4St7JBgB4EdvvbM6W8pjtfTyctZ
 AxOfr2ZVP0yzyrGudNxXH5rKpzVgA8hc9GWpczxsSa7/DeFNJzpkwGfn66a5egn6fZ+I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npZTH-0002uI-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 17:53:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E240262101
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 May 2022 17:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B998C34113;
 Fri, 13 May 2022 17:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652464373;
 bh=YcL9hk57toKVJUGoCt+0tGS/bSaRRoOnnPfzpFAvgbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NBICU6RJx/waSzfFvGz61cYUheWqEhaEHQCK1ra0EmjUwjShJ0pRuPSn/hFqKsUuv
 9nMzA9uzn7capjHlQKklnU4+WbLEl/oImll4jL5Zf9RWnbrhgbPfqCzXBID1pdDacn
 5fWWNzjbit7GS35k5DeUrq56woQxRYIY/TgpwZxyL0O3zG3rYdQw51v14RTHU0PK+t
 FBM24xsWK80tn8UcoEIctHTfw8pzstW8lDtwZCpSTj3nxXOqNS3TsMzP4UK2tz5ZOA
 fiyhLyW6e/T/D7KvNBH+qamjmbesobEhKkAOMi4ZalacIzAc4Bhbk/lbtM8f7PFvHI
 Gb/gz6yi4eNSg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 10:52:50 -0700
Message-Id: <20220513175250.184032-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513175250.184032-1-jaegeuk@kernel.org>
References: <20220513175250.184032-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- VERSION
 | 4 ++-- configure.ac | 4 ++-- 2 files changed, 4 insertions(+), 4 deletions(-)
 diff --git a/VERSION b/VERSION index 9043463cdba6..bb79667e50a8 100644 ---
 a/VERSION +++ b/VERSION @@ -1, 2 +1,
 2 @@ -1.14.0 -2020-08-24 +1.15.0 +2022-05-13
 diff --git a/configure.ac b/configure.ac inde [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npZTH-0002uI-Fx
Subject: [f2fs-dev] [PATCH 2/2] f2fs-tools: upgrade version 1.15.0
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 VERSION      | 4 ++--
 configure.ac | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/VERSION b/VERSION
index 9043463cdba6..bb79667e50a8 100644
--- a/VERSION
+++ b/VERSION
@@ -1,2 +1,2 @@
-1.14.0
-2020-08-24
+1.15.0
+2022-05-13
diff --git a/configure.ac b/configure.ac
index cfcc405b5f21..91bf7ff8e0f8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -234,12 +234,12 @@ AC_CHECK_MEMBER([struct blk_zone.capacity],
 		]])
 
 # export library version info for mkfs/libf2fs_format_la
-AC_SUBST(FMT_CURRENT, 7)
+AC_SUBST(FMT_CURRENT, 8)
 AC_SUBST(FMT_REVISION, 0)
 AC_SUBST(FMT_AGE, 0)
 
 # export library version info for lib/libf2fs_la
-AC_SUBST(LIBF2FS_CURRENT, 8)
+AC_SUBST(LIBF2FS_CURRENT, 9)
 AC_SUBST(LIBF2FS_REVISION, 0)
 AC_SUBST(LIBF2FS_AGE, 0)
 
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
