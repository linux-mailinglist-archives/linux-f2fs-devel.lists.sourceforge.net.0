Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A999905784
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKV-0006vL-1L;
	Wed, 12 Jun 2024 15:56:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKT-0006v5-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjkEIYVRloRZUfof3UtAuZK2oBmlNzXy+hm51hAklIg=; b=ICKhDaPrz3cmBioEiBrAYQRmtP
 o48cz59c6PHImzJB+o10HH+Gt7FgIgDyf1HpKP+GEM010KQjJTzZ9es/oZki+0EdE84Hxv8FIHZVn
 Ge6HJyt4yMf2KYA5wDBOqUDS1I5S62BENCFFKvFwk5xB5+vV6TA7psKo7meKQuXU0Zvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjkEIYVRloRZUfof3UtAuZK2oBmlNzXy+hm51hAklIg=; b=FsCo0VTciaBcNykWEpVXpIhKtU
 ihWtGw9zFyCNnOlnUp1bx5nuUqYndsfJj1DRzpUtOKH4Z1mOJn1Rb87pi8/kwAnyjeGiflK/wDF5h
 651FiRm+qh64LsnDoOlYWTRt72rn2GZvwEjC3tWCMPMrIlq48EfIwlWGY4Bwb1As0K5o=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKU-0007Rt-D5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BFF3ACE21D2;
 Wed, 12 Jun 2024 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3718FC32786;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=XPgYyhCocDhmK60A7bTcEl7zys5QbnfCXdeEtVRWmcQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Fov6JwUkPwJarGkitn00xJbvhgpTSFXeYuQa8BeJi4BfAvjnj1IWeNiyeRLf1B9R7
 Jws40mmhHSPEa6C0gaTgKt391E+BoHgtP2WvZA5JWpLIHdWek0UTMtD9XJDN0y6lhd
 mJWn7ruBuIJFyrxB2sQoY/ALbRH+3OJt8mryUuR2GqrduQSBLqKq5f71SkDBgkvWqX
 MOEp7Bq2U58WFNvUjewTeM6xGWqhkp+Lq84n5J3B0vZxz6vCsU+V7Zap1cQtnM7EJM
 wceR464oI9AA72T0VQ4NFh/ETWr004BR65kXcWY3qz5E1fHNGa5ovGYW1YhzQ9Y8yF
 og9M8ECw5N2fQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2A25FC4361C; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775716.32393.14343237902912623947.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <1716976020-28757-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1716976020-28757-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 29 May 2024 17:47:00 +0800 you
 wrote: > SSR allocate mode will be used when doing file defragment > if ATGC
 is working at the same time, that is because > set_page_private_gcing may
 make CURSE [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKU-0007Rt-D5
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid use SSR allocate when
 do defragment
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 29 May 2024 17:47:00 +0800 you wrote:
> SSR allocate mode will be used when doing file defragment
> if ATGC is working at the same time, that is because
> set_page_private_gcing may make CURSEG_ALL_DATA_ATGC segment
> type got in f2fs_allocate_data_block when defragment page
> is writeback, which may cause file fragmentation is worse.
> 
> A file with 2 fragmentations is changed as following after defragment:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid use SSR allocate when do defragment
    https://git.kernel.org/jaegeuk/f2fs/c/21327a042dd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
