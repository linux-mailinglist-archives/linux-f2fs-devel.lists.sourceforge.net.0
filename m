Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A77171DC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:40:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48xG-0004oW-4J;
	Tue, 30 May 2023 23:40:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q48xE-0004oB-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBRLMIKp+js5hPh5JKSX4lKxLqSlfnm7pmh8Na4lDVg=; b=fI5x/ra6KO+LCwvcFJTkqmsARu
 OXkEIe3F9qgjGy2PkejPzpSIFk3UMkzQyNeEFqlK6TAOdEgxPN01EO82PP32X8m9W48m2wejMVJvp
 orLOLsN3R9K3q1WngPgcvxPBHAA95mjR2DHT4pzoDaEoNcS1aWjIb3gJCVq/0DK8X3iQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBRLMIKp+js5hPh5JKSX4lKxLqSlfnm7pmh8Na4lDVg=; b=Jmcowzi+lsUc5b3CBEiY9hH3OU
 Hsrs+gBQgvBcwuQEt64pLIYAAurvLBb/ruXZXRYiINGewDcS7vPDO0JtdyogJiE5exzRqvcjvpkM5
 QFEFB84w/n950Od4iaTqZup/zaZLHZ+5MqQ6lbpM9qgWAiN2b51STyhjuU+avmZ4eCsU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48xD-006wkk-S3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 611F46354B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54A58C433A8;
 Tue, 30 May 2023 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685490024;
 bh=H9VqBAbZl2Fz3jcWASfHBQXr+VWaknCHrI+JGkA2M7I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JEd3jMOSxkRA25cxJZQj+PH7QXy2mHT5dhF1np91C5mvtwruhLNQjF05SpS9MX+xV
 xXHGiCRdtPMUskZmY3GoYdPH7DSUCzELY702nliohHfJbfmuXMmrOrTL58GcMkiXGS
 5hhyRziWIrfJTn+uPE/3cgI24DdW/BTXRDNBvsT3KAlakPVvW5PF3kE2XSYoTD5LrQ
 4xIST7nT8C+efwbd4haMOP8zLRYNvlAzt3Woe2J7l/m3AgIiHTiftCg1jKXHJ0AES+
 P3rXnXLNYBkTISxN52Engk4u5tt9UMIFXbZ1ixyTIBIuE1g2b6SLfxJ42rsKmpBxqb
 db/rKKoBaOExA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 35AC6E21ED8; Tue, 30 May 2023 23:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168549002421.8773.313920209333136970.git-patchwork-notify@kernel.org>
Date: Tue, 30 May 2023 23:40:24 +0000
References: <20230518021412.2037728-1-chao@kernel.org>
In-Reply-To: <20230518021412.2037728-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 18 May 2023 10:14:12 +0800 you
 wrote: > In IRQ context, it wakes up workqueue to record errors into on-disk
 > superblock fields rather than in-memory fields. > > Fixes: 1aa161e43106
 ("f2fs: fi [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48xD-006wkk-S3
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: flush error flags in workqueue
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 18 May 2023 10:14:12 +0800 you wrote:
> In IRQ context, it wakes up workqueue to record errors into on-disk
> superblock fields rather than in-memory fields.
> 
> Fixes: 1aa161e43106 ("f2fs: fix scheduling while atomic in decompression path")
> Fixes: 95fa90c9e5a7 ("f2fs: support recording errors into superblock")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: flush error flags in workqueue
    https://git.kernel.org/jaegeuk/f2fs/c/36e63b159dd6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
