Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 925EE9D16A8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 18:01:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD57h-0002sC-A2;
	Mon, 18 Nov 2024 17:01:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tD57P-0002s2-OQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=liIHHR1U1YZBJtOJYregD3OLwIrH4UgPFRmciSapiUo=; b=L0Pd5G+Valco0QWLVdv/jvy3gI
 UdZaEtlSUbtcG4zyyZETNbDXuEQ+9aiZZnJHnDlWrEgKVbPlWJCcldTsDvA3wM/tEOgJBuVHIj3W2
 5MzFjEsfGvMUo8qoW34tq8tzmTJwep62jHHcvE/Pe8uQgzgZ2+l64kr0gUjW+yr/3u2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=liIHHR1U1YZBJtOJYregD3OLwIrH4UgPFRmciSapiUo=; b=EP1Vsz50Az546yrsLxGnGRv5is
 EtCxWEK/Tnw6IdK0Og7I0GnrLHke7PI4V9Bld+bjLd17KcQeDAJcH8aPRCJ1gmv/+DjfU23Ck3GxK
 z/qgYToxRIz5CAq5Gp3sBwNZKexWR/GEluG0VqYmPfO8IrnEbaL4m7wPlDrYuyjM1Wos=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tD57B-0000yU-9d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE4D1A41641;
 Mon, 18 Nov 2024 16:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B49C4CECC;
 Mon, 18 Nov 2024 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731949229;
 bh=aCMzkrnkmswBGkORH2PDGxYL9yDX2zO7PHnNpveln+c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DyUy6t421aI7preeDKTIOPxMqJNGTTbifTvLNLelkoISmTFeiZfv0rPEF9AFlLNCG
 9qcKzF0Am+zaJfrR8byG5JBKQoXc6R6/WC9P9Rm4KwCaNS1A1+mT9D1bhTeWwFMyTd
 +ZJ9M12n/UZar8/ZccZOs0DXwHf/9jxP3dGmkh5rNqaUqMh1tTc3tKaSxxjm+IGRYB
 CQ1kdiXlZTxdJgUE5cAESiSkOSaHBfCxwxkcve0E//QKi0FaxGsFjIyfpjwksl+J9k
 Gd7w7P2kBz+RxDbj/4E3SgUhmedwGLu4UY4JYqL2+gJg3Wj2DxJmroKoLNAnLZQHUt
 aRnbUJZTFIsZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE263809A80; Mon, 18 Nov 2024 17:00:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173194924030.4109060.8641898406336440438.git-patchwork-notify@kernel.org>
Date: Mon, 18 Nov 2024 17:00:40 +0000
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
In-Reply-To: <20241112010820.2788822-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 12 Nov 2024 01:08:20 +0000 you
 wrote: > This reverts commit 54f43a10fa257ad4af02a1d157fefef6ebcfa7dc. > >
 The above commit broke the lazytime mount, given > > mount("/dev/vdb",
 "/mnt/test", "f [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tD57B-0000yU-9d
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove unreachable lazytime
 mount option parsing"
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
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, drosen@google.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 12 Nov 2024 01:08:20 +0000 you wrote:
> This reverts commit 54f43a10fa257ad4af02a1d157fefef6ebcfa7dc.
> 
> The above commit broke the lazytime mount, given
> 
> mount("/dev/vdb", "/mnt/test", "f2fs", 0, "lazytime");
> 
> CC: stable@vger.kernel.org # 6.11+
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: remove unreachable lazytime mount option parsing"
    https://git.kernel.org/jaegeuk/f2fs/c/f8bed73c6c52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
