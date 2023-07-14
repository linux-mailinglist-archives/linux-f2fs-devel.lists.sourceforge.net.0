Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD7B7530A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 06:40:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKAbe-0004i3-0C;
	Fri, 14 Jul 2023 04:40:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKAbd-0004hw-3k
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 04:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AXU+8mmvrqzl6FSBdEM6Q7HLncPgBhNOqu2AhU2OG+o=; b=PkKA8XGDDPC6IESlEeImNSct19
 f1aXkDH+eZU0EXL6iMtSbNrvJcINQhsZTirFMxk5pnxVfueN6ZffKJ4hfMVBlv95EGnC7REf5LyOL
 uKir7H+qZ7PtgEmZdjBTG0l+VxpP6CNxodi+tsdub3efAak3PclNbt50F6f6O/wMl4h8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AXU+8mmvrqzl6FSBdEM6Q7HLncPgBhNOqu2AhU2OG+o=; b=cwC4LMXBCAgxaGohpX7Cad2xYO
 Dhy4yswBNbIO+gCLTRLi/XGmMxrWfzNeH45yngnClgBsL84DaPEHOaoQwFh73s0r7bfFHDqY6Zp4A
 LeKRFVP2BGSTIumWwgNHstouLcD/26obL3MrEZAGsVaT21fBWQ8oOsQgwNfscEooUTl8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKAbf-00076i-LY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 04:40:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 600D061BA3;
 Fri, 14 Jul 2023 04:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8288EC433C7;
 Fri, 14 Jul 2023 04:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689309629;
 bh=xPM2ynhDBbedudlIudtUkYVzF4pbvK2Vdl+QBkQbJiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoBL2G7UhnHKAv1rD45zLbyHhpNg7D4LGBCVNLEZ5/JIJt5nrpIIN/CriLkQ7fZFj
 1fQ0daHISxxSWsWcVStSHSp2qIQOr/cr2dYE32Qc4Y/0OqzYQMOUbe2QHr0Fr0pQgp
 XxT4UYkD8rM6CCYcVx0PHQCZ9/TjPnruWNKJAsAFiFUR4xZ3VdSNFOhlk/eNo9ivvm
 sBv+5zsTqOIU7hexEhkH2K0JWgYTSfB/labqich3y1wCB9V7isf9xg+R5+GjNxLihc
 +0AeVN0rzSYqOMUpBwDCpdO64veY54ckb/6t9D3N55G0n3Zo5GvFriODy0muY3vMl2
 HXcj9nMVMdkjQ==
Date: Thu, 13 Jul 2023 21:40:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230714044027.GB913@sol.localdomain>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-2-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422000310.1802-2-krisman@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel, On Fri, Apr 21, 2023 at 08:03:04PM -0400, Gabriel
 Krisman Bertazi wrote: > From: Gabriel Krisman Bertazi <krisman@collabora.com>
 > > Negative dentries support on case-insensitive ext4/f2fs will requir [...]
 Content analysis details:   (-5.2 points, 6.0 required)
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
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qKAbf-00076i-LY
Subject: Re: [f2fs-dev] [PATCH v2 1/7] fs: Expose name under lookup to
 d_revalidate hook
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

On Fri, Apr 21, 2023 at 08:03:04PM -0400, Gabriel Krisman Bertazi wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Negative dentries support on case-insensitive ext4/f2fs will require
> access to the name under lookup to ensure it matches the dentry.  This
> adds an optional new flavor of cached dentry revalidation hook to expose
> this extra parameter.
> 
> I'm fine with extending d_revalidate instead of adding a new hook, if
> it is considered cleaner and the approach is accepted.  I wrote a new
> hook to simplify reviewing.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/dcache.c            |  2 +-
>  fs/namei.c             | 23 ++++++++++++++---------
>  include/linux/dcache.h |  1 +
>  3 files changed, 16 insertions(+), 10 deletions(-)

Documentation/filesystems/vfs.rst and Documentation/filesystems/locking.rst need
to be updated to document d_revalidate_name.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
