Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D29D69BD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Nov 2024 16:50:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEsP9-0003FT-Kr;
	Sat, 23 Nov 2024 15:50:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tEsP8-0003FK-95
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Nov 2024 15:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qSi3Tn4qvgEokYki2B6pXHigVIleGI41+v0Z3De+DY4=; b=SxDL//KlFSEoPc2JXWwqh8TWP+
 BnDa8TbVkpSp3Dj0DGH+NmIT4UuR7jK+jGsfWdKwUA+c/Bssq0O8YZAXVesTXJDmSVLB+90MGHVaJ
 XpMdt9SFjiMO3i9hebpsqByPpHPAK7+i6sBHSTrepbYKe4p1cLgWpOeM2PM5qwX+v0gs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qSi3Tn4qvgEokYki2B6pXHigVIleGI41+v0Z3De+DY4=; b=T
 2vpysSysQF560696Dl1M689Kba+LraB54XdbAPgDZu7JI8u4Sq7LD2N1cT4Bubnoqg6Hl1u7j7fWL
 3/lDnfSIwLaWiWo8Efs9ZNv37lJ8qLuJkCqQzdM5b6WCKiuiBfEMKVnBFhwEc7FmrLcJYGSdL/fs5
 3rz8lfsK4nFZeKy4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEsP5-0004M5-UC for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Nov 2024 15:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 07B1EA4017F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 23 Nov 2024 15:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78FFC4CECD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 23 Nov 2024 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732377024;
 bh=IczqUtw4N4T1zfYAyLTMPPP0PSxeRcQKEQh95/avdwo=;
 h=Subject:From:Date:To:From;
 b=dtkhVpZixBY9K3H0hM91KmcCRf+vPkof5BSym9rp4Ijzm5WsHYVxduvwGhiUd95z7
 QKAzJ7qI9L+276BYtEaJCS1YUAEmNmMaKitWEjH5iU6BQp9doahW+AOD7POZWFavyq
 SXXL9XYIlL3iEuFKX2n4pafrO/nBjCKTGL6sx9g8OJYVEV153jD5xxxidJBI/5JtSV
 bqam1YUSTiQ5jx9+/GTXHZ5bUhjeOo4Zg30Nkknzp13ovqY+z3DhnNp7R/R4LpuzjO
 dcY8z76/sfK4fxOmIkJcSlwFm3F1fTIxndfIXtzXdW9FE/JSOPU8iA5Xd3XNx4Z2ON
 PkYF6KgcbL6Nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3E59E3809A06 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 23 Nov 2024 15:50:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173237703669.3018181.12874371347774322352.git-patchwork-summary@kernel.org>
Date: Sat, 23 Nov 2024 15:50:36 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: print
 message if fscorrupted was found in f2fs_new_node_page() Submitter: Chao
 Yu <chao@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.ker [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEsP5-0004M5-UC
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

Patch: [f2fs-dev] f2fs: print message if fscorrupted was found in f2fs_new_node_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=911164
  Lore link: https://lore.kernel.org/r/20241120065850.1345670-1-chao@kernel.org

Series: [f2fs-dev,v2,1/2] f2fs: fix to shrink read extent node in batches
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=911680
  Lore link: https://lore.kernel.org/r/20241122065005.3772987-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/2] f2fs: fix to shrink read extent node in batches
             [f2fs-dev,v2,2/2] f2fs: add a sysfs node to limit max read extent count per-inode

Patch: [f2fs-dev] f2fs: fix to drop all discards after creating snapshot on lvm device
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=911530
  Lore link: https://lore.kernel.org/r/20241121141716.3018855-1-chao@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
