Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41155A86E51
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Apr 2025 19:11:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3eNZ-0004Z1-NS;
	Sat, 12 Apr 2025 17:10:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u3eNY-0004Yn-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 17:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tpzLVQ461MOrGkrNCvv7MwD8RNEwwXP94cyXs4DLNBA=; b=V+OUoUBj+JTDXvc6vfREaTDLiH
 SZS4YUNpyBGHLsUjLkD2XAbWsahxoe+vebAkhHMSVhTdIUL+l4oksYlX20MEJjZ4mLYYojcR4ITq+
 dBcaIs7uwFA/B2NK0w3yfIbL5nM+WccZwIpzjQs/COOOa3pYFGb51grVpEcuSRX4Mb1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tpzLVQ461MOrGkrNCvv7MwD8RNEwwXP94cyXs4DLNBA=; b=A
 CQ8709cHlP4DzWFE7uWu9by4tI8oGpCYaTwKlzYo0SpumMwHR7gTJMHNJIf2OhUpyL3kMcAOVXBUA
 pE49t3rNa3x5TZiCmjDQxw+cwgGepjMyhxgzU6LybNUvmUlhYSXtYzxM+p4nu3vigUk6dJD7VUEpv
 4St/qQmuNdUCdtqU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3eNJ-0008Ip-IX for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 17:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 42A1BA4801C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Apr 2025 17:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD17C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Apr 2025 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744477826;
 bh=eftyqgRMryDd8sV+Cr/7sJHX7MzE1cu0uox7I8p4CZQ=;
 h=Subject:From:Date:To:From;
 b=J1y1PgPsjZQqcJgkHX3LlVBOvWMwR4YTo5vaD7k8ZemhxwHFqM+Nb2JdKSovWUdu6
 NNfGpVWvSIwG9IfjmXemVIKe1rL4907SpIgadYyWWB0DcMUpbW+szrw5k3+D14hFJD
 x40+X7sGaTP1IdP7qB9CT4PHk8BjppBn0BfnthfRuX132MTRDi0wuOBiMRucmvBt3L
 30GI7B2KGddYwXis+CQV8yi+MI/MzaXPN++Hzr+THtkrxHGTSeigasYYR0IXViQ14s
 WZVlYMt8W4kT/faPIkbC89jBS7zH9R1ATM2SENNoWlxMUQkEcjSbFRpND5U+i3carF
 ofR38L0hN/tWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 39B15380CED9 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Apr 2025 17:11:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174447786360.711489.6750674843900810230.git-patchwork-summary@kernel.org>
Date: Sat, 12 Apr 2025 17:11:03 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to do sanity check on sbi->total_valid_block_count Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3eNJ-0008Ip-IX
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

Patch: [f2fs-dev] f2fs: fix to do sanity check on sbi->total_valid_block_count
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=951093
  Lore link: https://lore.kernel.org/r/20250408122208.2297777-1-chao@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
