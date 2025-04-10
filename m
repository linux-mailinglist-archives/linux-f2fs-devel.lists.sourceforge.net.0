Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC1A837AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 06:10:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2jF9-0006g3-6q;
	Thu, 10 Apr 2025 04:10:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u2jF7-0006fk-F1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 04:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jRb7COLF3AwXSp8DbS3mTKfFx3AexfxYV8qyWxLRFY=; b=l/obBu0nQlmfC1RODduRaqyD3E
 cRWxH4Y9gWLcSaevevNAlJOF9H2pkoysTuokPwlGU/Q8yY1OOEntq4HUwnWqrQzmj69uNvvXFlDpZ
 7LJZlQml7ntOfmExlg1Cy0T8taIRBZuhpz+IeKek8mWBqIKQAd1kJlEQttKNyQCSQSLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8jRb7COLF3AwXSp8DbS3mTKfFx3AexfxYV8qyWxLRFY=; b=h
 hGpF7Z5+IN8kilg2tI0Puq8HqAJh4eMWWSoE7gA5oc+RClxfZwHvBnjPD++5TP/OQxvwJh7J5x692
 OqdSU9o6XTlHBqJjL5dGZjfFq/zVpTPb1iDCQ5PrWmfIHiaih9Y9Vq+nl0N8EaO3FlEEuvkd0Q0ot
 lCMF7Zg1No7jaz50=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2jEs-0001AF-I3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 04:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 667F249CE8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 04:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4A6C4CEDD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 04:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744258196;
 bh=xq0hiRzSPrXToLD20MmN9XOlLownFF7DdEfp/kLsj8s=;
 h=Subject:From:Date:To:From;
 b=LPgq8Na5Boff+JVBDPK5ezuOj+3UZMCBwCCH3ENrnj780n22vqXMl3KMeRCDbnvCs
 gcREAmDCNWCx6vuoOBvIQzbtv0pOZ2nrKnjBAXxRn9KX+hK5ah+UVJAAnqFUUshqLv
 9SwRezZ6KSh3dj8oGIiBFUXeGXL1ulVSfkApgBlE+++j4KmiHB6QBcZ7heeWIXdnth
 HLznx5uVVOnTUC3VUapA/rvTG56aN/2+wnKVVTG17umjO3a00QjJIJbs4LxacNvSBf
 ot8yqc1ZX+0nG52dGIWwnp2T4q0EKFmYc/9zxMF3qzYb6bzE0EBeZra+743nnlOOaq
 Lu5lm1qYOd/nQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B1AFB380CEF9 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 04:10:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174425823323.3146257.8736521266367630930.git-patchwork-summary@kernel.org>
Date: Thu, 10 Apr 2025 04:10:33 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,v2,1/2] f2fs:
 add a proc entry show inject stats Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2jEs-0001AF-I3
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

Series: [f2fs-dev,v2,1/2] f2fs: add a proc entry show inject stats
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=945764
  Lore link: https://lore.kernel.org/r/20250320022230.1938110-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/2] f2fs: add a proc entry show inject stats
             [f2fs-dev,v2,2/2] f2fs: fix to update injection attrs according to fault_option

Patch: [f2fs-dev,v2] f2fs: support to disable linear lookup fallback
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=948756
  Lore link: https://lore.kernel.org/r/20250401035800.51504-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: add a fast path in finish_preallocate_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=947058
  Lore link: https://lore.kernel.org/r/20250325081321.3296714-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to set atomic write status more clear
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=947649
  Lore link: https://lore.kernel.org/r/20250327055607.3829954-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to do sanity check on ino and xnid
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=946667
  Lore link: https://lore.kernel.org/r/20250324053339.2994251-1-chao@kernel.org

Series: [f2fs-dev,v2,1/2] f2fs: zone: fix to calculate first_zoned_segno correctly
  Submitter: Chao Yu <chao@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=947056
  Lore link: https://lore.kernel.org/r/20250325080646.3291947-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/2] f2fs: zone: fix to calculate first_zoned_segno correctly
             [f2fs-dev,v2,2/2] f2fs: zone: fix to avoid inconsistence in between SIT and SSA

Patch: [f2fs-dev] f2fs: clean up unnecessary indentation
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=950072
  Lore link: https://lore.kernel.org/r/20250404195442.413945-1-jaegeuk@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
