Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD619D16A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 18:01:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD57U-0005rw-LW;
	Mon, 18 Nov 2024 17:01:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tD57K-0005rb-KI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9MRXo7IadPp1cy7arPSydXzJLEZHDl469hHXuCsrhBY=; b=jCtn9pk4rEGj1XAjFizZDvGWQA
 fmzNF5ew2pbsf/eBFjsnS9+sdQMgO4Zzv7VhyVi8H6w4lHVOidXCNxbajYAOhJGo7ya5dneTup9wc
 ihTgBnJ78iHG0oUTub0vy9teeWHAJWFz8ababrT9C4dfWbs2MU1YZu/wXV5xPWqyWbwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9MRXo7IadPp1cy7arPSydXzJLEZHDl469hHXuCsrhBY=; b=F
 fzOiqR+zTYmiBWq94PX5+KAxAIhYUhGXz8jl+O0MSVk9jdNLn88A4xMGSSJyRc4M3rHaiIWid37X6
 PIgJFl375fKCoBlj6s0STtYq/EgdH5U17FuPRVZ1qEMztgNub9Y7FdlfW3MeaG9mOQ3kmpJUeAs0l
 /f0cLa5tE450dwuE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tD576-0000yH-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4C51A416D9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3043AC4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731949225;
 bh=u9rwiy3SXlvAJQSB9dc5gbBiHUqudgcLjDSuTp1T1xM=;
 h=Subject:From:Date:To:From;
 b=av4c9RGNkpv37gLWl8zWco9p5A1FpMA96DCxPz1NJ4T5DI+2MEmYJEcFh38spZpUO
 WPTHkrpj/q8x/W4xhz0O+aymWyYMWl78HG6RjTKBX5nqtBbEyRLG2McIyfqy/lk9UV
 Dob+vZgJ+wqEq0UwKYqBcLVn6qWTar0nKOoEvZD25C52cjH/4I/3wZ1wSeYIJUARFe
 ezGG2Rb+m1ww9vMtfLpZvhGsM9zWaAV6s//OZtIo4JwneBX+rdYpy98+4MWL7SeAF0
 VMT5QbU5iF1DTVS7IHIbNRm/V+oVvfimpRcaLF8t+O6d5wlDI8VV247UoinpnWRF1J
 ACfXb5e/JqJSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD613809A80 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 17:00:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173194923625.4109060.2019499032578282587.git-patchwork-summary@kernel.org>
Date: Mon, 18 Nov 2024 17:00:36 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] Revert "f2fs:
 remove unreachable lazytime mount option parsing" Submitter: Jaegeuk Kim
 <jaegeuk@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.k [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tD576-0000yH-8Y
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] Revert "f2fs: remove unreachable lazytime mount option parsing"
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=908614
  Lore link: https://lore.kernel.org/r/20241112010820.2788822-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: fix to avoid forcing direct write to use buffered IO on inline_data inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=905830
  Lore link: https://lore.kernel.org/r/20241104015016.228963-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to map blocks correctly for direct write
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=905827
  Lore link: https://lore.kernel.org/r/20241104013551.218037-1-chao@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
