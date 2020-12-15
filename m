Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6262DA5DD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Dec 2020 02:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ue4KdZOCM4QeYV961VEOYOmhD1X3KRNJleAoEcxUKPU=; b=NbbBc9Uk71sjEiBg4m3c6WF4Pe
	7upIv4xDaU1gvo5+3MUmjD4dPG+DUNd2xzQS0llcuANCeRJzMq5I7UM+wrG1amaPjrZEQ6N5xD2uW
	Y+3A+pJvXhOTPNX62LRbxtwczEjnjSuk4gt4J5EvazXIVBt7NmHMMpi1j4v8o88reDKY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kozba-0001mM-Fr; Tue, 15 Dec 2020 01:58:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john+kernel+f2fs-devel@zlima12.com>)
 id 1kozbZ-0001mF-FN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Dec 2020 01:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kufsyJw+LsrG8VSlWLkofxuTvZopUlvWJm0vwFn+5y8=; b=VLYtxTMqXtdtHgJ2T+b3avBr2l
 5IKf4X+S8R2p/ALrcG/YyxKKpCcGpZFE98E8uhqBlz1L1EKuH2/mxny1Qpamrny3QuxyNF4I4WYts
 6kiPqXNZfydt5Db38/pJA9h3y1QTLIiKeHxkSkG7TDpprfFWSxV5gZx029kptVHyEM9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kufsyJw+LsrG8VSlWLkofxuTvZopUlvWJm0vwFn+5y8=; b=g
 v9Zlw2g97lvrB/F7R40p7Su1k7wBg40G88OyHVGGbt3oDL6jbThfevnQd2jU9BmrCxOS8nqgi7DM7
 IYT22E+5VldvcCGmxMOIGwwFk3rKHfElry9zQkdqbduO/egpW68kKbaHgTLTnrIgAqIRQdUTkAsH9
 9+06wt4lc3z1tlO0=;
Received: from smtp.zlima12.com ([107.172.191.159])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kozbV-00DN1p-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Dec 2020 01:58:21 +0000
Date: Mon, 14 Dec 2020 20:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
 t=1607997484; bh=D/vl2WXk6Q8qZDaKCsGozs52DsvGA3gn3vG+E2Prew4=;
 h=Date:From:To:Subject;
 b=LW3CrFhoRA/73f8nGGRkKz7q+yg0hcIAhd8oPD4hEGrXzXGS9v8x4ksh8ZHukD6yE
 um1bKQ4HYt2tcoBool1hQY7Q2szlV0uzUl1nDGLZt3KgilrNJGdWIuD93JIE04HRtp
 2m4L/NC1ZaRGBjFPwYE4N4gI4AcjlpdSh1kZxRVI56FvbOZNJZ45J97biplC+b6Jwi
 ADXQpNUik0LBB8DhjdStobVtBCCgcgkbWpAUu9iaGq97MsQImvVoUdlUW6eBNShfxu
 egMEPqIM4P+Yzfs7J38NST8mai7UsDCUfgugOzEXpkTf9H6Eqzlr8TVIzgjvBJuppR
 37+KCxud6NtbA==
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20201215015800.u37ixmukkwihmxi2@Lima-1.maple.zlima12.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zlima12.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kozbV-00DN1p-Ed
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: Fix behavior of -g option to match
 the man page.
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
From: "John A. Leuenhagen via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "John A. Leuenhagen" <john+kernel+f2fs-devel@zlima12.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The man page states that simply specifying the -g option will use the
default Android options. However, mkfs.f2fs currently requires the user
to specify `-g android`. This makes the behavior of mkfs.f2fs match the
man page.

Signed-off-by: John A. Leuenhagen <john@zlima12.com>
---
 mkfs/f2fs_format_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 03eb748..8db2191 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -129,7 +129,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:";
+	static const char *option_string = "qa:c:C:d:e:E:ghil:mo:O:rR:s:S:z:t:T:U:Vfw:";
 	static const struct option long_opts[] = {
 		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
 		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
@@ -169,8 +169,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 			c.extension_list[1] = strdup(optarg);
 			break;
 		case 'g':
-			if (!strcmp(optarg, "android"))
-				c.defset = CONF_ANDROID;
+			c.defset = CONF_ANDROID;
 			break;
 		case 'h':
 			mkfs_usage();
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
