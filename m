Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDMxA+nv52mhCwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 23:45:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7B43FD78
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 23:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjBLUw6r6nfIXP5C/LxHrCYk2LzCUjWaGLAgI777ECM=; b=IReuApkTW/MfGjxiRoEj3n4BMG
	5qetI4zLuMCiZeHvEoRRvwQiuomh8Oc53g8jx7nI7v4D+jfCsXOY20wBvGV74dHIz8K+JQVvTIbM3
	stGHyLO4Ds6nW6KSKEb1PihirJkx/K76oIfR8dkdTsvkqa2xzilIppvNLzSdSXCJbxgo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFIu4-0000pS-OO;
	Tue, 21 Apr 2026 21:45:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wFIu2-0000pM-Sw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 21:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2QZmoZa/lBPAsLyCIN6tZEYPEHxxDkLU0/6I18pW0Aw=; b=LIrjg4JW1hoQqX5DiVcXF5mOIk
 5VMEYdLJo3OP1Xvq0TU5OP2fMIXauW1LqTwQi9uq/ggNAeuksqkHMxBOdcvsOn5658FflgAkoxezj
 +UenS0Hk5teVx4CuuOZZJFtqCaBn95ozVlDESHJxUxyAqTWIxyKETPklEjq1UnTn9yDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2QZmoZa/lBPAsLyCIN6tZEYPEHxxDkLU0/6I18pW0Aw=; b=O9Tn5txtWiDem5wmaDgR8Mwk++
 GtSqiJYAQxZsehkY2sj5/iyUXI4sWkgrRYDMsq3Eb4kfQP8Exq0EChl2u6DI2f590ppm/XaiOvv9A
 UH2oav040sS1ZsUzmT9dqzz86jlGD+A4R2ZZFBy9DZ5zrovZ50/bHmlz5u1ggPpQZgIE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFIu1-0005O4-T5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 21:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 87DF141ACB;
 Tue, 21 Apr 2026 21:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A2DC2BCB0;
 Tue, 21 Apr 2026 21:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776807900;
 bh=oEKtrHTNxN6oxmbk4u6spR57zah8XJcPFxPsYaN+UmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6cMc/Oi5S6xt9k5GF6Wj3JU1mLv2YGZcXhGk7PayrWWcXgqR/9HBgtKcqy+qPzP2
 oapNudG8J/JXNMvF+rsb2qUeURnILnnFqM/Yv6XRXfRX8myOOMsCqQgEc3YXHKr9fZ
 HhdVTEK1Ez8MhJEeKeNptrNMrRhJaK5xFtDeyDmgSVlMgyPJxjkPa7NwCqpffxMxuc
 SkzCf7Bp4IMJ0/7ITVnWTOC94v+1M0BWd/jV7gLXfEdXJscn64loGONFGzwZ/OGkjY
 qziIKK/LlzP+wmeDUwlElORYkCalPy6vwRdjkJnWr7EsEr7nt+3xNS4dmnYUR4kCqp
 EKxG0JMdA5HRg==
Date: Tue, 21 Apr 2026 14:44:57 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260421214457.GC37143@quark>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
 <20260420114714.1621982-4-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260420114714.1621982-4-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 20, 2026 at 01:46:50PM +0200, Andrey Albershteyn
 wrote: > int ovl_ensure_verity_loaded(const struct path *datapath) > { >
 struct inode *inode = d_inode(datapath->dentry); > - struct file * [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFIu1-0005O4-T5
Subject: Re: [f2fs-dev] [PATCH v8 03/22] ovl: use core fsverity ensure info
 interface
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
Cc: fsverity@lists.linux.dev, djwong@kernel.org,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net,lst.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: B0E7B43FD78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 01:46:50PM +0200, Andrey Albershteyn wrote:
>  int ovl_ensure_verity_loaded(const struct path *datapath)
>  {
>  	struct inode *inode = d_inode(datapath->dentry);
> -	struct file *filp;
>  
> -	if (!fsverity_active(inode) && IS_VERITY(inode)) {
> -		/*
> -		 * If this inode was not yet opened, the verity info hasn't been
> -		 * loaded yet, so we need to do that here to force it into memory.
> -		 */
> -		filp = kernel_file_open(datapath, O_RDONLY, current_cred());
> -		if (IS_ERR(filp))
> -			return PTR_ERR(filp);
> -		fput(filp);
> -	}
> +	if (fsverity_active(inode))
> +		return fsverity_ensure_verity_info(inode);

Not sure whether I should review this version or the version in git, but
both seem wrong.  The 'if (!fsverity_active(inode) && IS_VERITY(inode))
{' condition should stay, but fsverity_ensure_verity_info() will need to
gain a !CONFIG_FS_VERITY stub to fix the build error.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
