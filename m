Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8F793AB14
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRYz-0002L2-Tw;
	Wed, 24 Jul 2024 02:17:09 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sWRYs-0002Jt-Um
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5K9zHcPQyJ/FAYxOSjcwvAeeDUQrwShr1CxWZruS5bY=; b=f1PzIA99+IfS0UPRJ+k9HsmbP0
 7ZVYGKSqPlyC1Je1ZSnqo/HhCys3HVFvn1uZ+yt0PdPI48nx4e6Y+mAWM+EZ9qTmkc9+FI8uYeE3O
 siKGRYLnitbgejA6sUvTk5fnxQYcOhBqFmT+YSqkHG1CzqLfPPtds972Krd5lcm/bPYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5K9zHcPQyJ/FAYxOSjcwvAeeDUQrwShr1CxWZruS5bY=; b=M
 aYljc7+1oh7M0UIRs6wnAgAnn/NjLn6nJBZRRYreMp+TrWJiJ40eQ8NHaWohRaZ6udJyzm0249nwr
 ML0J+jzrC1XGNsgkh1LqjO7Ru6+aiyo+dFUdT++5L/esSNxk02T6O/8+HHfP2mgGXMIHY1Md/lgfq
 xrPGFQFOCFTUOpJY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRYo-0002I6-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4214BCE0F09
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jul 2024 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 804B8C4AF0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721787406;
 bh=qn19ogqooqyMFuaf0IvEdluIfaa2DPJHVXmlWU6q3ac=;
 h=Subject:From:Date:To:From;
 b=e3/gpgK3ZIR9sOd9LSCmAO5zJmQdgKJHW+U2NsRnnPvJAlZgPRucvWaStObqjeSLH
 xmV+XUrbRFqoonyLsbyox0zJGU3sI+HQOuMWzOoBPLjSadi8FXlGcopiH5nP0KkvAo
 8p2Zaw+2NLQPC5giUJ0wiF3qWGkDTVMEswuk9PVocKyQNlHB3pLItJaHiAp4cjslC+
 Obxe6kw/LZqnODSaP4B4C4xMzxkXvWTpZqvdCGvNi5T9hX9oyOEriYZiUUR3fBqpsM
 k/qW5wGE1PhopcxlWei0fNRQVx5OvZtCpkV1JmN7EX2zQh+aITXw2XmoFy3edzvTUb
 Rv23yZhgtM4PA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 702A3C43443 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172178740637.17759.6164855175682800543.git-patchwork-summary@kernel.org>
Date: Wed, 24 Jul 2024 02:16:46 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev, 1/3] fs: Export
 in_group_or_capable() Submitter: Youling Tang <youling.tang@linux.dev>
 Committer: Christian Brauner <brauner@kernel.org> Patchwork:
 https://patchwork.kernel.org/proje [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWRYo-0002I6-W2
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

Series: [f2fs-dev,1/3] fs: Export in_group_or_capable()
  Submitter: Youling Tang <youling.tang@linux.dev>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=863678
  Lore link: https://lore.kernel.org/r/20240620032335.147136-1-youling.tang@linux.dev
    Patches: [f2fs-dev,1/3] fs: Export in_group_or_capable()
             [f2fs-dev,2/3] f2fs: Use in_group_or_capable() helper
             [f2fs-dev,3/3] fuse: Use in_group_or_capable() helper

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.11-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=873357
  Lore link: https://lore.kernel.org/r/ZqAZZAmghKIaBAkJ@google.com

Series: Cache insensitive cleanup for ext4/f2fs
  Submitter: Eugen Hristev <eugen.hristev@collabora.com>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=841787
  Lore link: https://lore.kernel.org/r/20240405121332.689228-1-eugen.hristev@collabora.com
    Patches: [f2fs-dev,v16,1/9] ext4: Simplify the handling of cached insensitive names
             [f2fs-dev,v16,2/9] f2fs: Simplify the handling of cached insensitive names
             [f2fs-dev,v16,5/9] f2fs: Reuse generic_ci_match for ci comparisons
             [f2fs-dev,v16,8/9] ext4: Move CONFIG_UNICODE defguards into the code flow
             [f2fs-dev,v16,9/9] f2fs: Move CONFIG_UNICODE defguards into the code flow

Series: Case insensitive cleanup for ext4/f2fs
  Submitter: Eugen Hristev <eugen.hristev@collabora.com>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=859376
  Lore link: https://lore.kernel.org/r/20240606073353.47130-1-eugen.hristev@collabora.com
    Patches: [f2fs-dev,v18,1/7] ext4: Simplify the handling of cached casefolded names
             [f2fs-dev,v18,2/7] f2fs: Simplify the handling of cached casefolded names
             [f2fs-dev,v18,3/7] libfs: Introduce case-insensitive string comparison helper
             [f2fs-dev,v18,4/7] ext4: Reuse generic_ci_match for ci comparisons
             [f2fs-dev,v18,5/7] f2fs: Reuse generic_ci_match for ci comparisons
             [f2fs-dev,v18,6/7] ext4: Move CONFIG_UNICODE defguards into the code flow
             [f2fs-dev,v18,7/7] f2fs: Move CONFIG_UNICODE defguards into the code flow

Series: Minor cleanup for case insensitive path
  Submitter: Eugen Hristev <eugen.hristev@collabora.com>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=823843
  Lore link: https://lore.kernel.org/r/20240207064302.221060-1-eugen.hristev@collabora.com
    Patches: [f2fs-dev,RESEND,v9,1/2] ext4: Simplify the handling of cached insensitive names

Series: [f2fs-dev,v10,1/8] ext4: Simplify the handling of cached insensitive names
  Submitter: Eugen Hristev <eugen.hristev@collabora.com>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=826206
  Lore link: https://lore.kernel.org/r/20240215042654.359210-1-eugen.hristev@collabora.com
    Patches: [f2fs-dev,v10,1/8] ext4: Simplify the handling of cached insensitive names
             [f2fs-dev,v10,5/8] f2fs: Reuse generic_ci_match for ci comparisons
             [f2fs-dev,v10,8/8] f2fs: Move CONFIG_UNICODE defguards into the code flow

Series: Remove page_mapping()
  Submitter: Matthew Wilcox (Oracle) <willy@infradead.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=847221
  Lore link: https://lore.kernel.org/r/20240423225552.4113447-1-willy@infradead.org
    Patches: [f2fs-dev,1/6] fscrypt: Convert bh_get_inode_and_lblk_num to use a folio
             [f2fs-dev,6/6] mm: Remove page_mapping()

Series: Introduce case-insensitive string comparison helper
  Submitter: Eugen Hristev <eugen.hristev@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=824195
  Lore link: https://lore.kernel.org/r/20240208064334.268216-1-eugen.hristev@collabora.com
    Patches: [f2fs-dev,RESEND,v9,1/3] libfs: Introduce case-insensitive string comparison helper
             [f2fs-dev,RESEND,v9,3/3] f2fs: Reuse generic_ci_match for ci comparisons


Total patches: 24

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
