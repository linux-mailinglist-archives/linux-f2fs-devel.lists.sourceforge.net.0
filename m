Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A414A5FF19
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Mar 2025 19:20:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsnAD-0004RJ-QJ;
	Thu, 13 Mar 2025 18:20:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tsnAC-0004RB-Dw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 18:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=usBwcVuk/tXjaeYaFmuY8RWmeCvFsNvZIINoJEj/M2E=; b=T44H3iy26rpR4my+qmgzLqakKm
 1vf8mya2p4cmFVPNILcRLdocLS0N/ouI9ciUXo1jG6nU654LRasT6v7320mNkLLNFwRVGe+Qrvnxb
 NOySJPYRQ/4utI37xW381Hvwqdhjy8XM1cHCVVhwASx1z1GKKXV3vw2CqJ9Uwxl9Q5FY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=usBwcVuk/tXjaeYaFmuY8RWmeCvFsNvZIINoJEj/M2E=; b=L
 m5F14AoJLNjiHvec1zMbLUOwRJn+jWtRBqQf3lJlveQVP1zXqdA6uQAY9V3j/yTGkaTqlRI8MvrF1
 NQXwl1CXFxUuJYlKF9D/78vt9K2y2IhtgARKl+20lnF8344Gp3LFyveWtLqYT9MIgQo+hBBQfc1on
 MF+bOdvJ9ZK7P2ro=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsnA4-0004Q1-QS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 18:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D3C8A47885
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Mar 2025 18:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB21FC4CEDD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Mar 2025 18:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741889998;
 bh=X0wRJXYCsaAceTy0UU+aThtu3/2BHFyjN8HNhUGKOis=;
 h=Subject:From:Date:To:From;
 b=XpEMWdS6DjQdyIvNEZToP66skVTjJswgE+wWgzKJbabrq5+T1oBjXIZ2+GkJj46r5
 /4+5wTkhIQeYCfHCfdVKTuKCT9/A3rrMsYl+TWa8izNcVaq7K+lKy1Xbdfmp4QJMJd
 virbXtzK66ISX259HPWqPDYQi0nUMxB/1lnFxLpoBQH2CzUE34+QMwauKjGWLcJGGW
 NcXxc4lppihHQqwX4YO/2HQ0Wtgc06HI3N30ZKksRJJ3lJ+g891RnZCS9LXSPSpkKS
 F1WFkMp6Pk2ZCQgNDW13T8k954LXOw7nxHbo74LjxOdh+Aa1udyIojVJARGPrAZsO4
 PMRS6DY4intBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 769A73806651 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Mar 2025 18:20:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174189003287.1620163.13863046210344887343.git-patchwork-summary@kernel.org>
Date: Thu, 13 Mar 2025 18:20:32 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: f2fs: first steps towards
 mount API conversion Submitter: Eric Sandeen <sandeen@redhat.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/lis [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsnA4-0004Q1-QS
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

Series: f2fs: first steps towards mount API conversion
  Submitter: Eric Sandeen <sandeen@redhat.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=939708
  Lore link: https://lore.kernel.org/r/20250303172127.298602-1-sandeen@redhat.com
    Patches: [f2fs-dev,1/9] f2fs: use f2fs_sb_has_device_alias during option parsing
             [f2fs-dev,2/9] f2fs: consolidate unsupported option handling errors
             [f2fs-dev,3/9] f2fs: factor out an f2fs_default_check function
             [f2fs-dev,6/9] f2fs: Pass sbi rather than sb to f2fs_set_test_dummy_encryption
             [f2fs-dev,7/9] f2fs: defer readonly check vs norecovery
             [f2fs-dev,8/9] f2fs: pass sbi rather than sb to quota qf_name helpers
             [f2fs-dev,9/9] f2fs: pass sbi rather than sb to parse_options()


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
