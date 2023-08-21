Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D978310F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 21:50:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYAv5-0005qO-T4;
	Mon, 21 Aug 2023 19:50:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qYAv3-0005qG-RY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 19:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8DG97AHO7J7T4cl1pz62HBwt1D7mTiMal6YNyQcF0LM=; b=jZmtap7Poruzjhex39Bs+SrjT0
 GlHnA4H1QujNuq3X+MvUizQoG3NSQ5qDRbSOcJhRvOobSxa+aJtA/8+qqA/8a7my/M6URtpaXsSW4
 HpTjm68nA7CkJBYNUkAmrOAy+fgwa69w/GgxUPl36YjA+su/PkIyoRwyKcIBFnfaBOjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8DG97AHO7J7T4cl1pz62HBwt1D7mTiMal6YNyQcF0LM=; b=g
 GWBMrArlJPhkOxQFKmbKc4GcKDA9/eveCoQtcm20E7/gO5ZGqZWZpSY8nfiYEMkj5ycFNyJvLcTYA
 O1l1ABKQGkVyNmq30X7J5jMedcH4RlyjOtOCQSS8UTWluQPI7PAbXrau32uszP2ViKgUb2YppwvMa
 oizy0kLEfDwrsabU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qYAv0-00Bgt9-17 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 19:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72D9461347
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 19:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBB4AC433CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692647423;
 bh=QEXe1MJxbJTaa9q3/+zqEGiMl+RFW72DaD9GSHjdxOM=;
 h=Subject:From:Date:To:From;
 b=m3WOpyRGBvpUysq5IJIvxkjc/i+rv34ljNk8QRJfi/be9QiXKHL1F8EAaDYsKN8kf
 oXM0wwzmg3I1ImAH48SiKKacWtBj1C+KLPtRGae8SqK0mCillZ3IysXQ+XHYHxSqSw
 U/b2T+OxoteGuRLGqhhoZF6tXl8vR1CUL6v5mBDR2anQUxMAZftJqXnSeEpiuv66an
 6PC/3gYlTOiE1b7s9pOPxV9VstdSCUNqIx2sK5Tx09l0NRznr/pOs4xQt8bUbm2Hd7
 XfuFX2VAuUvhkrlAkETOJoItYcL3eqEe7TQjNRtarxeL1gNfuOlCdDk8CVXbYqgBSx
 B//rYfAT4yZqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C0E66E4EAF9 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 19:50:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169264742370.19522.15157213485880124725.git-patchwork-summary@kernel.org>
Date: Mon, 21 Aug 2023 19:50:23 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 doc: fix description of max_small_discards Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYAv0-00Bgt9-17
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

Series: [f2fs-dev,1/2] f2fs: doc: fix description of max_small_discards
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=770920
  Lore link: https://lore.kernel.org/r/20230730142552.3918623-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: doc: fix description of max_small_discards
             [f2fs-dev,2/2] Revert "f2fs: do not issue small discard commands during checkpoint"

Patch: [f2fs-dev] f2fs: avoid false alarm of circular locking
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=777561
  Lore link: https://lore.kernel.org/r/20230819003012.3473675-1-jaegeuk@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
