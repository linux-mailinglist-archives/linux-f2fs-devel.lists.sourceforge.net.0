Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 592076FB658
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 May 2023 20:34:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pw5h0-0007qX-Ru;
	Mon, 08 May 2023 18:34:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pw5h0-0007qQ-0A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJ83W7Rb2J31xIzadu0PIQIgitq7ezGtf+3sh8So6Ok=; b=I0pAiiORR/HTAbb1dUqu6xzmQA
 yHdU1bXJv0ItspqrKEVBYV4xEOHmTePG2s2y91pY/cEjivcXLwRcqn0e15wD7BtT9pmZ5gOBy3Iny
 o8MlFG5vWR5iyURNjyzHKgNE5H3ClypvcBxsD1hRlZOd0ao2IanDn80rhM3s7k/Z3ulg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hJ83W7Rb2J31xIzadu0PIQIgitq7ezGtf+3sh8So6Ok=; b=K
 GYs5jt7dckxnVziDuoeWoE2KCWG+nnwnPXZgphQqpYOC+mi7mOj6/3m1HBEk2U8L2+Ahu+1ixuE5Y
 eBU+kb8aY4yg4K9O+hrJgaTg7s7NguRMDjFdHZ36taD55+7+drZdTb3WI2ETBwwxp+B0ERAACbdHA
 7dwgvVpZ18nSxSsI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pw5gv-002LNF-4b for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBF6561545
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 234D0C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683570867;
 bh=BkixA/wl9BpLPiS2lCqB1rI4ZpafMrrqe5SDnzVPGS0=;
 h=Subject:From:Date:To:From;
 b=jRvBnegdK7sTd+MRo3YSbrVH2eGFk/qfaUO9Z9hSYGxrwydcLxltoUi+AAwDSyjMk
 CmwvLpLJIk5fCzqSUrKmfgXeYRCTh6/uC1VxW+TF5eutJbeWTHx6Knwz11C0tcSGiE
 ULIFUmymvL3xybmASQjvGU01NHJWxO2ISt3ZFoHY9wyz3Qc8EOeBOESIswagh1nexn
 PAD8ZEVz1JNRTOK0wPgSiNZ3fIBUU6S1lHnudjgAyNpx2Bdube1OXZyrRwDx1cQqYD
 z0FT9A1HQi1mDczcQtFBIg93mEW6eF92sQ4u9Xf7M1MBkJHvgExwCXko4xPGEzeqTe
 4sN9fDrmOIVAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 02B6BE26D26 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 May 2023 18:34:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168357086693.2764.7547827532866249538.git-patchwork-summary@kernel.org>
Date: Mon, 08 May 2023 18:34:26 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,-next] f2fs:
 remove redundant goto statement in f2fs_read_single_page() Submitter: Li
 Zetao <lizetao1@huawei.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://patchw [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pw5gv-002LNF-4b
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

Patch: [f2fs-dev,-next] f2fs: remove redundant goto statement in f2fs_read_single_page()
  Submitter: Li Zetao <lizetao1@huawei.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=742791
  Lore link: https://lore.kernel.org/r/20230424234648.577673-1-lizetao1@huawei.com

Patch: [f2fs-dev,v2] f2fs: add sanity check for proc_mkdir
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=743085
  Lore link: https://lore.kernel.org/r/20230425160611.79848-1-frank.li@vivo.com

Patch: [f2fs-dev,v11] f2fs: support errors=remount-ro|continue|panic mountoption
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=742514
  Lore link: https://lore.kernel.org/r/20230423154915.530254-1-chao@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
