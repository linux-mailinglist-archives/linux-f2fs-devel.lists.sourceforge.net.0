Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E606EA9FD24
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 00:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OSuRHHbOmHFhug/QS8SWa3USjLhkf/gYPMcys2A+/U=; b=aMZaV/+DtYd9NLSu8MOaVVqCrY
	uvmdwGNPbeyCtslcWngWtsUFgV3vGx+Lpt/fB1EgQi2FVTccZA1jaXiNEMNmrF+7vjMD+Kx5oAVG5
	tgC29upr0Iyg/DUd2hXE5ek98yyQyxWp8h8x4QMr4ovzZxEMhCaHAMq4pGa/LjCXXqjk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9X9W-0003jb-0g;
	Mon, 28 Apr 2025 22:40:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9X9U-0003jT-G7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65S8UDZgB1aoaDCK7YOjWkx7MYqsyBOEmwk3JQ9AJiQ=; b=lRpmeEI2JKo3gQBXAAKr0F58jW
 fDGFHTLjvkH2u0OuxeP5nh2dSBa6ZAXTunWdWNR0SxLk3pEHKcExT7ddL9C1tZAWs3Z/5zfztNOEz
 xy77M8b5xcHsjCJcCmeEkk91zkccOqWy7qw3GSnSt5N6E7zv+xVV6kLnMiN+1m8xMde0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65S8UDZgB1aoaDCK7YOjWkx7MYqsyBOEmwk3JQ9AJiQ=; b=d4cbUcvTFXRhnEzw07No+9aC0r
 6mRt7bMwcOcPwGytxmbstn2bXQR3Wfn7mYMNQWz8C0scuFl3QHlQyAQH8bn7Ozayb6klShYYu+ufK
 cm18EZuPekyrG1p89IKHeU25qc05FjzFMGrg8f3xuq5mb0rwq/Mz2XPMtGzTKWLvqw4Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9X9E-0002KI-Re for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63365A4863D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 22:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD479C4CEE4;
 Mon, 28 Apr 2025 22:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745880013;
 bh=5eS6DGU2Q+bCtF9R1Dk2V/qavNj0iNbuvOWY14ztV8g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tbCBIElQ4XwfCdkAsa0HnDaZaICSy3NqmUwPyyxiYNKPNclSBPu6pOoU+DoaeOgYj
 JiAp06yF82wR1SxVlvS3N3Npc1GxO2JOMWbx8k7GmB67E8NBxMbY+AtDHnFbTA1Tlh
 5iod7zHvNZxG9PLMjxm9OQ82cJgjCauJnY/TuBuzSg3OtwIzbGuIZb9j1L/aFpl7uV
 D9KJ/fdmKg3KyXkzAdKKm9qTNeG27SRbODWwkVE+ThE6qU4sOr9ipAinbPXBu95td4
 4Q+hoE/vUAhBB+6pCSqnqaQivOuc2p7w2MgiHFMXUfs5ibF555gn2Yu647I8naB7xn
 8Cj1DOMo6TwMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD673822D43; Mon, 28 Apr 2025 22:40:53 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174588005248.1067750.11308178018864136202.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:52 +0000
References: <20250416054805.1416834-1-chao@kernel.org>
In-Reply-To: <20250416054805.1416834-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 16 Apr 2025 13:48:04 +0800 you
 wrote: > This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags, 
 > it is a read-only entry to show the value of sb.s_encoding_flags, the >
 value is [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9X9E-0002KI-Re
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: sysfs: add encoding_flags entry
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 16 Apr 2025 13:48:04 +0800 you wrote:
> This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
> it is a read-only entry to show the value of sb.s_encoding_flags, the
> value is hexadecimal.
> 
> ===========================      ==========
> Flag_Name                        Flag_Value
> ===========================      ==========
> SB_ENC_STRICT_MODE_FL            0x00000001
> SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
> ===========================      ==========
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: sysfs: add encoding_flags entry
    https://git.kernel.org/jaegeuk/f2fs/c/0d56663919d2
  - [f2fs-dev,2/2] f2fs: sysfs: export linear_lookup in features directory
    https://git.kernel.org/jaegeuk/f2fs/c/217fc63224a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
