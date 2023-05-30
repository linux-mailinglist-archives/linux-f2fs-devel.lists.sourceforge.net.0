Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4877171DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:40:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48xD-0008Im-K9;
	Tue, 30 May 2023 23:40:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q48x8-0008IP-Fi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1BU7MJxzrsOKKpyDhcJcdfbQgku507UtP/99zC/M/EE=; b=a7+jGO5NUA0g22tsTNV4uc97OS
 sgBlrO2m/XfZmiCU85dhVaxYa1Hgqnma7brJZCGdAMW8W8/c8C7n5qHnicXu+UQx21AyiiuVkDXtn
 LCqZAiROIPV2hEGiB/mnKPc3vcFLUboxt8zl0gd/SQUWHKxvhP+Xu/5fR4khJhcyFAfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1BU7MJxzrsOKKpyDhcJcdfbQgku507UtP/99zC/M/EE=; b=X
 O5DdDKlMVGw855jZVEfaJOsVBAFJAalFtta5GLyVe7XQ9EIFok7OBHCpkzb0b8DszVef088R5mJQg
 pRG2rwfE/l3RMOO+KdjeoOl0jcFCrPlgx37C/ypGQPQbEFYuPMRytVZY4PX0gYv25NTnzZQ8IHyzf
 atgVjvHgdIjGGJyc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48x4-006wkL-1g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A39F5632F3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17431C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685490024;
 bh=tfU/tlYKt3H/ibXUHIek68Fj3WcWVuMg9rz2soi3TvA=;
 h=Subject:From:Date:To:From;
 b=CNsSVwIJ4d9Tlvfa5VbnbveU7aUFmuS75TCA2q6ekU5vCKXhvCB0qRv8VedfK7ygS
 wRE7VVE6bgG6D7LIsTN0Y/ixWE3UNX0r11SUoWsp8+Fu5O0iNu4/5L7ySpC8GaFVrG
 /sMjKvl+PtRMhGx4lKsHiJ8GS/4Fd7NpIBZZhetr4/plpsa7DuVoxyY98e7r2yiL9V
 XNGSFPvumvKXR8Me7ijVHDd0alfiH1zo9W7iy1eRwRfxnbxaE+EDjp3WbX456U3bZW
 QYHi5yb7ieUqb0+2EqzKx0/KC2d5QUDQUru0pdb07ZSprCBrotGw+7DvfSCCPzg1Ao
 O9eJSDuF0kxWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EF81EE52BF6 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168549002388.8773.10561627258043389780.git-patchwork-summary@kernel.org>
Date: Tue, 30 May 2023 23:40:23 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: don't
 reset unchangable mount option in f2fs_remount() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48x4-006wkL-1g
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

Patch: [f2fs-dev] f2fs: don't reset unchangable mount option in f2fs_remount()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=750045
  Lore link: https://lore.kernel.org/r/20230523035822.578123-1-chao@kernel.org

Patch: [f2fs-dev,v6] f2fs: add async reset zone command support
  Submitter: Daejun Park <daejun7.park@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=745732
  Lore link: https://lore.kernel.org/r/20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8

Patch: [f2fs-dev] f2fs: clean up w/ sbi->log_sectors_per_block
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=750226
  Lore link: https://lore.kernel.org/r/20230523123521.67656-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=750061
  Lore link: https://lore.kernel.org/r/20230523061725.650692-1-chao@kernel.org

Patch: [f2fs-dev,v3] f2fs: flush error flags in workqueue
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=748719
  Lore link: https://lore.kernel.org/r/20230518021412.2037728-1-chao@kernel.org

Patch: [f2fs-dev,v3] f2fs: fix to set noatime and immutable flag for quota file
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=751537
  Lore link: https://lore.kernel.org/r/20230527001539.3608665-1-chao@kernel.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
