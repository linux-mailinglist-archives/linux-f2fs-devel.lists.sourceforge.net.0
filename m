Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E897A88F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 17:50:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qizTU-0005lg-5K;
	Wed, 20 Sep 2023 15:50:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qizTL-0005lS-GP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBpXvUIUjcRIRnPKjtWRvBFppMUWS6A61I6pE0uYlco=; b=MOGZ+Z7oMyeax9cO4T1wc9gHBD
 rf4GBoFRJDvbs2zk2nFvDmj7rJooBZAv4bCUoS/MB4Q2wbBdyg9YqwIt6fP7aNEWQRuKBbJJXTdrx
 d0G/qFTN4q7xPgG5SKBiHg9tdnHAnjzoOBJwVidKohDHRmmYc4fY6YUhaWHFSP5j9b8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBpXvUIUjcRIRnPKjtWRvBFppMUWS6A61I6pE0uYlco=; b=P2EPT/mNojBmbeczeLV98s0CXX
 adRklURBMSeeIF0/TVbQx5ci2MAeCZ4aGgQ7F5bUj3Qv2TqSG3x1KdcenECyxlNdBJlfftZytgGKn
 RpPb91TZJTseHM0/bIwelt4wSsDtjrnW/0OfSpAWs5filuG5bpe9u61pmVC8okR6hwr8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qizTF-00GvPo-JN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CD95B81DDA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 15:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60420C433CB;
 Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695225025;
 bh=IxzmerP4BfIbNeGXSbfo0n4u8HnDaD9IUMu+iAYXuIg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sz5GrnPfBp0fLWnSNvpMt3socVfsC8nB4k9rJwL762H1B4B6T7j4bky/6JUlYKTJy
 iepj/xhEC634uOf6XxKuIn2ooBuUmdmodAmw0AQJX17jgmm+LRZVojcwn8xsH94CSZ
 Z0mIHmBxlg+8Eb+zMT6J7UMO/QlF3F+1Z4uFk7Qdakj4nh6/it+TtfwiV9DnbtQvkB
 7U5NCPD22pb9yY4GSwwv5SzdNN5NZ+QSBBf45rX+IRtBWD7f7qoTp2NKzzGaNYBoRf
 EkqvIHf/S2AHCDmhDkpVWmxvYuaIZtfnhuNoJwlgkKDQD84ItokRbQLFpqM+XO1ZMP
 /Sws3Peg3ptOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 38783C43170; Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169522502522.22557.4305670746484363117.git-patchwork-notify@kernel.org>
Date: Wed, 20 Sep 2023 15:50:25 +0000
References: <20230904151242.1786219-1-chao@kernel.org>
In-Reply-To: <20230904151242.1786219-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Sep 2023 23:12:42 +0800 you wrote:
 > If file has both cold and compress flag, during f2fs_ioc_compress_file(),
 > f2fs will trigger IPU for non-compress cluster and OPU for compress >
 cluster [...] 
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
X-Headers-End: 1qizTF-00GvPo-JN
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to avoid fragment w/ OPU
 during f2fs_ioc_compress_file()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  4 Sep 2023 23:12:42 +0800 you wrote:
> If file has both cold and compress flag, during f2fs_ioc_compress_file(),
> f2fs will trigger IPU for non-compress cluster and OPU for compress
> cluster, so that, data of the file may be fragmented.
> 
> Fix it by always triggering OPU for IOs from user mode compression.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: compress: fix to avoid fragment w/ OPU during f2fs_ioc_compress_file()
    https://git.kernel.org/jaegeuk/f2fs/c/943f7c6f987f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
