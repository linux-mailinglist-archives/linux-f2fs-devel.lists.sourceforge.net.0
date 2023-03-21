Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6926C3720
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 17:40:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pef2J-0007hV-DG;
	Tue, 21 Mar 2023 16:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pef2I-0007hK-EA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8WXbJRsAPpJnnOnjRrlddNAtdqRNuJWf4o2K+QHUow=; b=BzizatIpaHLYxs1NqZZDIVhFlX
 acYtkMPGCy6EBr6MIXxmQXr445ezCtAUPRkvJ8aKy/D/1qlyrJUhZJyXgFfTuMV7COrjy7MUvbP6i
 VYUBisdiYp3gto4kpIAtG72xL3obQxwn+HWWPpPOqTd8gbcGxyY6pSC/VCpm0yA6fSYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8WXbJRsAPpJnnOnjRrlddNAtdqRNuJWf4o2K+QHUow=; b=gKnG8vNBRsMoYm9ZJm4Gww8qN8
 wjmzOwdKGY2J2NOQ0PLoJaqsQKT73d+MsPVBoCwbRMXT2XSnA3Cg3Wp7uyVtchzoyJFzexol4Q5pp
 N1xeImh1icjb02ma7n4rFDMdPy6NUubhW/oAXYZVLzVQFl9eg+Db1ViAJxOOBJp5nbfs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pef2A-00FiIv-J5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A49AB818DF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 16:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E701DC4339B;
 Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679416818;
 bh=ldWpBNnr4qmFL77lev/coFUi1C+rOctqD9HBEAO/K3M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oUOhoVZa7vRYH3Z5xq2ESZCtwOzg+y2BYzhkT+2hPiCfJNU/oN5O23AG7ohUiR9eN
 JY3qMbhBWisixw9jjSdZT3Wap7Nt931CkHbHPzWpwa73wzouPFg8Rs0huODaqfI3Yo
 pAYI8Y4BqAlQ9rv812CyeYOPE3gI37wqJ4KkIIIE5KzDp8EmAXxzDQsNRBnKDNF+uA
 rSYEx8uBKDxSgLkk6tdXWZyK4J2yn3xHEHcgBWWGFpvWiXAZk6NQgb3FKAoqxP+tKW
 Q84vyJYejVq0vrllQnIpc620ZuI1lVHmFMoCIn3kiBNZyxgGXnlyNaQeayHTnyhYK/
 8xCdJDzKLVSpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C0F08E4F0DA; Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167941681878.25004.6451264587497952126.git-patchwork-notify@kernel.org>
Date: Tue, 21 Mar 2023 16:40:18 +0000
References: <20230310210454.2350881-1-jaegeuk@kernel.org>
In-Reply-To: <20230310210454.2350881-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 10 Mar 2023 13:04:52 -0800 you
 wrote: > Let's reduce the complexity of mixed use of rb_tree in victim_entry
 from > extent_cache and discard_cmd. > > This should fix arm32 memory
 alignment issu [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pef2A-00FiIv-J5
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: factor out victim_entry usage from
 general rb_tree use
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 10 Mar 2023 13:04:52 -0800 you wrote:
> Let's reduce the complexity of mixed use of rb_tree in victim_entry from
> extent_cache and discard_cmd.
> 
> This should fix arm32 memory alignment issue caused by shared rb_entry.
> 
> [struct victim_entry]              [struct rb_entry]
> [0] struct rb_node rb_node;        [0] struct rb_node rb_node;
>                                        union {
>                                          struct {
>                                            unsigned int ofs;
>                                            unsigned int len;
>                                          };
> [16] unsigned long long mtime;     [12] unsigned long long key;
>                                        } __packed;
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: factor out victim_entry usage from general rb_tree use
    (no matching commit)
  - [f2fs-dev,2/3] f2fs: factor out discard_cmd usage from general rb_tree use
    (no matching commit)
  - [f2fs-dev,3/3] f2fs: remove entire rb_entry sharing
    https://git.kernel.org/jaegeuk/f2fs/c/6b40bc364c10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
