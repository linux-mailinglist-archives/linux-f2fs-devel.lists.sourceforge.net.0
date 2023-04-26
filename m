Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7C6EFDD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Apr 2023 01:07:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1proES-0007Ez-9f;
	Wed, 26 Apr 2023 23:07:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1proEQ-0007Et-Ns
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Apr 2023 23:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VElJsdtyCUH9v7u2X34togOEttZBD9WINKc5DlCylLU=; b=Q6+gNL1zjRI5dVpba2cUyF/uDG
 +mnQB5fMS6bnlFC/3mhQwlc7jls4LD6En1GSjhlXiS6KTyX5JSjv7hjzjTl/puj7RCzsqCgbhVFFy
 nZPUaiaa+jDodiyGQVrS1d4A58LPEjNFkDFBrED7VUa6eF+UZmD1VmGdO0mBM1vz/VzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VElJsdtyCUH9v7u2X34togOEttZBD9WINKc5DlCylLU=; b=JbAq3LRSrYHjclN7CWdZoqqjH9
 jRGdCr4JXO3sCa46dqxN6Rp4FsjRedto73+GEHm5zf9D1V1gszBUeYlSeIEpub2XGZHDxcEZP9LGp
 ZlNOUfuMbyrWvQaRx4KSrBxvceELYR63f5uXoIYQ1TWLRD4SKYpPlTUco08PEp73NMyg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1proEQ-002d5I-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Apr 2023 23:07:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 852E463993;
 Wed, 26 Apr 2023 23:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2946C4339B;
 Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682550440;
 bh=EzrAzHGqX33HLlqpfsl59P+BWciRL4LLNL4FJ5YxYiw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=huemn0yp2XzRUtzI1j/YWNYRt1QKV1SVDVfajDMru9/LkNbnuOgXFP3lMOAewzkEw
 SFF3oLTNxd72taeJdoC8laOtlFG8z9pxPaFk08isrDw/5LQ+gUxIpqOwd2IOZSFHNw
 4HYKoKLprsc12RNLmO3wSw8omR8cHmCcDPa7+6xfQmB55f1oTV8EE1H27j6Pls93PV
 Vp8gC4W2lzsIGyOAAPyzt57VCNGwzu0LHwHQBJ7Pg0/TaE/8XeLwZP00zH/DE2R/VR
 NQgC/FuN1OP8CVZJl+9K/8e1+I0LNNqhbulyDD+LaQvunkEVwhC25NS9T0BTLO3FNI
 B6MP2MQraMVWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AB86DE5FFC8; Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168255044069.16014.2458183090274454828.git-patchwork-notify@kernel.org>
Date: Wed, 26 Apr 2023 23:07:20 +0000
References: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
To: Christian Brauner <brauner@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner (Microsoft) <brauner@kernel.org>: On Mon,
 30 Jan 2023 17:41:56
 +0100 you wrote: > Hey everyone, > > after we finished the introduction of
 the new posix acl api last cycle > we still left the generic POSIX ACL xattr
 handlers around in [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1proEQ-002d5I-Ta
Subject: Re: [f2fs-dev] [PATCH v2 0/8] acl: remove generic posix acl
 handlers from all xattr handlers
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
Cc: reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, hch@lst.de, sforshee@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner (Microsoft) <brauner@kernel.org>:

On Mon, 30 Jan 2023 17:41:56 +0100 you wrote:
> Hey everyone,
> 
> after we finished the introduction of the new posix acl api last cycle
> we still left the generic POSIX ACL xattr handlers around in the
> filesystems xattr handler registered at sb->s_xattr for two reasons.
> First, because a few filesystems rely on the ->list() method of the
> generic POSIX ACL xattr handlers in their ->listxattr() inode operation.
> Second, during inode initalization in inode_init_always() the registered
> xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> inode->i_opflags.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,6/8] fs: simplify ->listxattr() implementation
    https://git.kernel.org/jaegeuk/f2fs/c/a5488f29835c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
