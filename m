Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4021813C01
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 21:50:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDsfQ-0000Bb-4U;
	Thu, 14 Dec 2023 20:50:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rDsfO-0000BV-IA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wabTj6tAXOATFed0JCh4CPIXMprK56xvkY0AsMddnJo=; b=F+vqMeVgi752p+eBMT9zjy9ANR
 PdcgoZ+Z3bUr+skOWL8fIa30tHcBrsH7ouA0fdazGPvUHJA07loxtGtmdYnEHf7OJNKYOPD7tQLT6
 7FQyo2UkU+WObUGjiEwt+CUPwGTNuM/eZxRdOL5hPamHNzcuvtsXgpqndLEhpZVNbOQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wabTj6tAXOATFed0JCh4CPIXMprK56xvkY0AsMddnJo=; b=B4V7YDlB3MmY7i1wxC7iVtszSW
 p3O+zUXo76IDV3l9gbMJ5TZ+IecBMoH7bgmoMKZEgHOerB0+aQCjiwu9jqrMxGVEVqdsgspBvcLyn
 QTyZ1O+dMyqLdMNdVdHZ2HvMx3RDNj+HvZxnK/S2sq47CsyxSJOE0tamGg8SV7thXvyc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDsfM-0000kP-RX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8A74BB824B5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Dec 2023 20:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32485C433D9;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702587032;
 bh=5QyxmMYJ8M0Zhf0Pi2Lb8jlyb51z43Cw5tcc/uGcs/Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SIYy1O5QlycEh9jO1PYYpHDXPMzcPayuNC7W1aVJ5G6fQus2U8ds+UL8DL4XbFxEx
 +IC0VDRmmLdxyiAG851lGs/anVUG0+lEZtuzTAFcJxpE1l9DCuqqUXiY1q5LdVnsY4
 R+DvwRTaIfYdptqjpn9nn+vHn+LlXIEtYpNAl6snJotLowE7oAaObhJFnr4U4Ce2AK
 8NJlxh4dO6mTtX4dqkBDsgptnH6sxupq76uA0FL+haMovUlZUgic1Z4gJyX/8BpF1D
 MnnwzOIEVLVtiRYpnV3LC+/6Q9o+B84Lt1GLbsLVMU50C04koyobq0wAxKCEBFk97v
 4jEUOUl5QTIDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0F53DDD4EFE; Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170258703206.30587.6882657417862323311.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 20:50:32 +0000
References: <20231204180428.925779-1-jaegeuk@kernel.org>
In-Reply-To: <20231204180428.925779-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Dec 2023 10:04:25 -0800 you wrote:
 > If fsck can allocate a new zone, it'd be better to use that instead of
 > allocating a new one. > > And,
 it modifies kernel messages. > > Signed-off-by: J [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDsfM-0000kP-RX
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: allocate new section if it's not
 new
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  4 Dec 2023 10:04:25 -0800 you wrote:
> If fsck can allocate a new zone, it'd be better to use that instead of
> allocating a new one.
> 
> And, it modifies kernel messages.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: allocate new section if it's not new
    https://git.kernel.org/jaegeuk/f2fs/c/15a76c8014f9
  - [f2fs-dev,2/4] f2fs: fix write pointers on zoned device after roll forward
    https://git.kernel.org/jaegeuk/f2fs/c/9dad4d964291
  - [f2fs-dev,3/4] f2fs: check write pointers when checkpoint=disable
    https://git.kernel.org/jaegeuk/f2fs/c/aca90eea8a90
  - [f2fs-dev,4/4] f2fs: let's finish or reset zones all the time
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
