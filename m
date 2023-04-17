Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4C6E541F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 23:50:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poWjy-0002dg-41;
	Mon, 17 Apr 2023 21:50:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1poWjw-0002da-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 21:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t23P3nOj4MSkHPbbedko9m7lNnNkqMqoGx0SkNgp+Co=; b=FeNLNG/Ws6m6UWfqDoM2Ps0xG5
 4vrKwN68jz9RNKSSn4Jo3joq+osFK9VRgH97e/rCGiQK30Z5asvcylYTBYbK1aKkIb/yR7iuaKND7
 S6Z6pP21ujLj59Jwd0M+heMCtMWWm1PDiwtA0kHbz8tL4qGGB8RTytd9uThQiN2Yv5c8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=t23P3nOj4MSkHPbbedko9m7lNnNkqMqoGx0SkNgp+Co=; b=F
 Hqbs+OsPdkgAstwz4CZQwB4pU2sii3DG6NvV9GIQBXW8fAaYkUmvQz0S2YNMSnHA51pIZxuuOEHuq
 T/eRSg8rcOTgVoWykEFJWdPaXWN11/D/Fn1Ks05s1H2+iV7o/XaxbFOZZw5vWZYlE+2QhozNjTrGc
 6CmpfgpBLrp08ePM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poWjw-0000J6-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 21:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 206E46221C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Apr 2023 21:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F7F7C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Apr 2023 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681768218;
 bh=sIA9k2HVWA9muvhFAP7i9dy+/hinp3DpZB5U6zu5fOw=;
 h=Subject:From:Date:To:From;
 b=g8S3qVOauqCMlT/75b4TOnwt5mKhMu/Jr23+pHO1InBKsVc/Wwm8i9+pnHRKlgfCx
 pnznJBnGyr9qH8HNpJprNqaxXl+HmLmaiVvE2IaFVBg63YtqaxbiJQLJdMXRouXUgf
 +A7QntuaC1Ce19b7LnhuA9i8c7poJTTI8DGIAyn3MSItFyk95DadPmxdnH17X93nU8
 /BAIv0NI32pBPG+Hjfr7Y0cnb8kx2imL6pbmVXBjDHoySfISJKgVdjIfbepVOQvznv
 ErGux9+i36hWscYEcMIK2srOEMbJcaaIiG1hZfmwuEcDXhnhCDXkQ2tVRMMj0nj6+e
 ZjgVHlwaSA8FQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 61BE2C395C8 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Apr 2023 21:50:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168176821834.10429.7775331406595503524.git-patchwork-summary@kernel.org>
Date: Mon, 17 Apr 2023 21:50:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: remove
 bulk remove_proc_entry() and unnecessary kobject_del() Submitter: Yangtao
 Li <frank.li@vivo.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork [...] 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poWjw-0000J6-Fv
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: remove bulk remove_proc_entry() and unnecessary kobject_del()
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=737752
  Lore link: https://lore.kernel.org/r/20230406191629.63024-1-frank.li@vivo.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
