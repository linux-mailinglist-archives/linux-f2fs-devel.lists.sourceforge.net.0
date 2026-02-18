Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHFyBCMylmktcAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 22:41:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560015A527
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 22:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UYcV8TAZ2MblIkDlAI4CnxdQbC1Vxzn/SrYe/E0iGU=; b=YzlkgyBPZJ347fOGR50Hds9Jln
	SnFkV/LP9RmxESlHLiYuTUbQT0FFriubsQX0ZuS0nLhXnCwt4nwf3XoAcHb13xxPLPFNvrBkTj7PB
	9CSZpOu7oSpo8TH1QZTf1r6IzELHzVpVB7GGKz1nO3B+RFDYNRMHCK7xdBKSUXYzw4+s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vspIl-0000zZ-TB;
	Wed, 18 Feb 2026 21:41:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vspIk-0000zR-5d
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 21:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hzEs6DyVThmFhA/mAchE8tfD9lSBRF8Os76iCXNTuGA=; b=WCVtdM3JYw1nJNBMQdViSbI9wr
 NhOCuKwxPSxEP9vjadWm7rmGFvh5nUw+rpK3EwTwIrqESMBdj3rMTQwxmT/9br46rhNz3JJa6yo6f
 WIPKqwXQNis/Y7nUAvU8A+X0Bx2AIuI8UShGAV9e68OUkkgSo1ECTb0eZksgK2NKUs/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hzEs6DyVThmFhA/mAchE8tfD9lSBRF8Os76iCXNTuGA=; b=S+8I8U5gPMj3e+eh1lklCdpiR6
 uFOCiUP1/6cWwES0Au7FoTSg7Il2EBN+Cjs8fmytLy+qE5fkExGpU8hCGAP2Yud4Ez7UjFjH8bbbo
 JI9NCkEET5SkCo7xVmJJPYNhuTD9WANodLdbopeBqbwiHPLREylejYxVCzYGb8PFndtc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vspIj-000870-GT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 21:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1553E41742;
 Wed, 18 Feb 2026 21:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D7DC116D0;
 Wed, 18 Feb 2026 21:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771450890;
 bh=/IflDQzD1mZk9rjG4pZkPRLVYTGkljhA6AxzxuIUJiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jDeRLZ2N+mftD8U/rpydot+/RR5oKjcvZZgi6mrt6x020Dev65ezbvAaUWf99d5e+
 ouAqWD8bJ3TYTMTvToI+xqVjwifi/9wkwO4ZOgWZnZYIOv/haJsxi056KGNtVh4PHR
 XqslNQ+VjQe9+svEfYzNGLWixIGfOqh6MzDzmZ7fPeIFM+Q/RRRs99plv6Tb0mZZmt
 Xip/WO168g56PS+9LeEl2SV2Nxod+/2K9EMT1NZOAFuO+KSo3psQtO7Y9apcsfLKcp
 46tbUxNxQBYfNzPFI/tTDEKxP2F9B2cGHoyeYPc43jsx0QCk93J6Zclo/LJiWOB5sA
 Ny9gDvGJGhp3Q==
Date: Wed, 18 Feb 2026 13:41:29 -0800
To: fsverity@lists.linux.dev
Message-ID: <20260218214129.GB2128@quark>
References: <20260218012244.18536-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260218012244.18536-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 17, 2026 at 05:22:44PM -0800, Eric Biggers wrote:
 > hppa-linux-gcc 9.5.0 generates a call to fsverity_readahead() in >
 f2fs_readahead()
 when CONFIG_FS_VERITY=n, because it fails to do the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vspIj-000870-GT
Subject: Re: [f2fs-dev] [PATCH] fsverity: fix build error by adding
 fsverity_readahead() stub
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Christoph Hellwig <hch@lst.de>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:lkp@intel.com,m:hch@lst.de,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 9560015A527
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 05:22:44PM -0800, Eric Biggers wrote:
> hppa-linux-gcc 9.5.0 generates a call to fsverity_readahead() in
> f2fs_readahead() when CONFIG_FS_VERITY=n, because it fails to do the
> expected dead code elimination based on vi always being NULL.  Fix the
> build error by adding an inline stub for fsverity_readahead().  Since
> it's just for opportunistic readahead, just make it a no-op.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602180838.pwICdY2r-lkp@intel.com/
> Fixes: 45dcb3ac9832 ("f2fs: consolidate fsverity_info lookup")
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  include/linux/fsverity.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
