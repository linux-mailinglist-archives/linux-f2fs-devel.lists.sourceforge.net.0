Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FDA215D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 01:56:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcwNA-0003Qf-LR;
	Wed, 29 Jan 2025 00:56:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tcwN9-0003QY-EB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUkmntvHoS6n8Lk0gT+aRCCufnirD/G0kTfkHPtfTu4=; b=T5PMFwK7Rw0Pyv9Ly0QTsXdiqG
 Stw2HpBw475mnNdrXa6i+O3A5jGbUguCSoFEoQlIkPzcZ0gD0HRzPxKWfABq+i1c0jngC3O2IGiIY
 HRaiho6As9PptSnI6atW/z94nJaf+Rd/6WtIreIqXOMmw6MoEALJLeZifA/U3hFY4VYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUkmntvHoS6n8Lk0gT+aRCCufnirD/G0kTfkHPtfTu4=; b=VxHSL264Q/4a42T3/5v/DQ2B/Y
 o+KqPQhkVpd2WXqjA68MnXDrGzslajW2QHsvpwUppiAgLADNSdinDctC5dk+gMtz9pk+uiLh53Wqi
 wEZyEkuGVhhgKKCMBL6TdHhvjD/anTi9BbiytoGN78bZaix2Sula8d6ZoO13NT/pMW8g=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcwN4-0001Lt-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA802A41649;
 Wed, 29 Jan 2025 00:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C85C4CEE5;
 Wed, 29 Jan 2025 00:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738112147;
 bh=fHQX4W65GyKIvsAVa0l454mFXY3/JQdzf77DNqOzYQE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WcPJm0KXqHafFE1N+jb6xqiTvr74okKHA28WzssL52oxG/LC1LQO5KR4skEsgOAWN
 sKn32sh2JY6iNqf5toA92jV2pp11kNk9cXQELTQqxPieLFLwtHe8b3h2DRZ7OIcTIl
 zWiKBHsZKfWSDEnFH79jrsY3EwHWTVH+Bo+KXuBFsMoQmcXRJW14nYoW7HYTec0AO/
 i77R6S6DU72BKytNFatgDTvqHIOuvqrMv8TcOeuq6hGPgVYr1GtHiDWlUCb24aPL/D
 YsXMhFt21eqwkrFYGxnmofh1sO+IShmJK0mtg1ryUFFLXrSD1GK4cyRANoZjDSF1M6
 x2QMIAS3zsBmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC9B380AA66; Wed, 29 Jan 2025 00:56:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173811217323.3973351.17971976914892259618.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jan 2025 00:56:13 +0000
References: <20240910150200.6589-1-joshi.k@samsung.com>
In-Reply-To: <20240910150200.6589-1-joshi.k@samsung.com>
To: Kanchan Joshi <joshi.k@samsung.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 David Sterba <dsterba@suse.com>: On Tue, 10 Sep 2024 20:31:55 +0530 you wrote:
 > Current write-hint infrastructure supports 6 temperature-based data >
 lifetime
 hints. > The series extends the infrastructure with a new temperature-agn
 [...] Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcwN4-0001Lt-Ec
Subject: Re: [f2fs-dev] [PATCH v5 0/5] data placement hints and FDP
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org, hch@lst.de,
 bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by David Sterba <dsterba@suse.com>:

On Tue, 10 Sep 2024 20:31:55 +0530 you wrote:
> Current write-hint infrastructure supports 6 temperature-based data
> lifetime hints.
> The series extends the infrastructure with a new temperature-agnostic
> placement-type hint. New fcntl codes F_{SET/GET}_RW_HINT_EX allow to
> send the hint type/value on file. See patch #3 commit description and
> interface example below [*].
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5,1/5] fs, block: refactor enum rw_hint
    (no matching commit)
  - [f2fs-dev,v5,2/5] fcntl: rename rw_hint_* to rw_lifetime_hint_*
    (no matching commit)
  - [f2fs-dev,v5,3/5] fcntl: add F_{SET/GET}_RW_HINT_EX
    (no matching commit)
  - [f2fs-dev,v5,4/5] sd: limit to use write life hints
    (no matching commit)
  - [f2fs-dev,v5,5/5] nvme: enable FDP support
    https://git.kernel.org/jaegeuk/f2fs/c/2fa07d7a0f00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
