Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6469485F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7AT-0000Vs-KI;
	Mon, 05 Aug 2024 23:31:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AN-0000VT-Oq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjwSa4DELho24fGJ2WqH6mb+14hdUnihgKso6cEC/+s=; b=Mt+o5G4ZJLujBgJNlAUUd8I0k2
 fuh3fsAj42stIr5yxrKqcToXR6zbtOboHcb6wLwl6aVaKwAeI3ghFwNE++YN4yISdqBCtBbYckO0/
 KxJmSCc2piIixVq6pwezECbd454Z/zrbk0+v6BJSfNZ8bO98z0sbMlxzg1fkqB2o/+z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjwSa4DELho24fGJ2WqH6mb+14hdUnihgKso6cEC/+s=; b=jYxWjrYRk1vwI9eCOyg5+c12+Y
 8ea39K1tEE7JBAmE+OT6EBVuWbxAQ8A9YfQIVv3Yk9Z0us6iHxtgSnel22QSlx4z+O+oqS7ALXQvG
 F/sLJi2eXighLgZG33V4ZivN2UslR63NsV6zoS3twnB4jDJC7lxehzoBGsDVNTDSlOck=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AM-0005AK-Fh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2558260EAB;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE5ADC4AF0E;
 Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900651;
 bh=Rsa4UgKROg3oElaqYDmOCqPOaaR0RW68YsBwnLH5WlE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jlYNOe11nzSMe16nbuiN7KrLdj2E1D3+nzi2YTBDpuZCcZlv0Lvr+RVy4AyIRCxfS
 3u/zWt9cgRGhgLa0GqPezKWPOrW6oeb8V9f+yTtZFrQ51goEylGGQOG2D/Jv72vyFJ
 HVX3qwHuHeFen1klrnJqqAHNY7TtGQiUZ24mSvqGuGEuUyqB+UKHperK1KZ56YSJK8
 X/t5Wl3UyTQp67YQyVzkem4oyvlJS7lqT48IBRxAaX/Y1kcZVGSLfpChThiVcl1cau
 UkafDYiE0zqbcvg/Etx0pubR/YKzHolwzmf8z07kFKdL834cH+SFItEuE/HPHDBRBs
 z+cmd1KCx8EmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B64F5C43140; Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065174.2803.15142106569963496847.git-patchwork-notify@kernel.org>
Date: Mon, 05 Aug 2024 23:30:51 +0000
References: <20240715123451.7918-1-liaoyuanhong@vivo.com>
In-Reply-To: <20240715123451.7918-1-liaoyuanhong@vivo.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 15 Jul 2024 20:34:51 +0800 you
 wrote: > Currently, we are using a mix of traditional UFS and zone UFS to
 support > some functionalities that cannot be achieved on zone UFS alone.
 However, > th [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AM-0005AK-Fh
Subject: Re: [f2fs-dev] [PATCH v5] f2fs:Add write priority option based on
 zone UFS
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, bo.wu@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 15 Jul 2024 20:34:51 +0800 you wrote:
> Currently, we are using a mix of traditional UFS and zone UFS to support
> some functionalities that cannot be achieved on zone UFS alone. However,
> there are some issues with this approach. There exists a significant
> performance difference between traditional UFS and zone UFS. Under normal
> usage, we prioritize writes to zone UFS. However, in critical conditions
> (such as when the entire UFS is almost full), we cannot determine whether
> data will be written to traditional UFS or zone UFS. This can lead to
> significant performance fluctuations, which is not conducive to
> development and testing. To address this, we have added an option
> zlu_io_enable under sys with the following three modes:
> 1) zlu_io_enable == 0:Normal mode, prioritize writing to zone UFS;
> 2) zlu_io_enable == 1:Zone UFS only mode, only allow writing to zone UFS;
> 3) zlu_io_enable == 2:Traditional UFS priority mode, prioritize writing to
> traditional UFS.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5] f2fs:Add write priority option based on zone UFS
    https://git.kernel.org/jaegeuk/f2fs/c/8444ce524947

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
