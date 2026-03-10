Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGELGPxpr2nzYAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:46:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4A2431A7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWiDv0eBTOZe0QTaR9WQi3XpNuDhZTjygPxtiozwp8A=; b=Y0Up+nblihbBMMKPM2visg8x4b
	5d3T/FSsQu7bNfOu/3O2GOcWEbc8qsVxsOFeBZcR7tsQhLewyZZm5JStGjK0fnCl8eVgoAZcQ7NdG
	XIhHoq0ymWAdG3CQZOsDU2cLsev5ZK2bW4bZkHlZanLzrfpBHTECAlx9jWNGFdZDD2pQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlFA-00062m-MN;
	Tue, 10 Mar 2026 00:46:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlF8-00062g-SC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lhvlnz0nU3d1WvlSrur1yV5Rcq1eSMG1z0JYW22UKhs=; b=SwPdLwpAmpmSOJanR8hVw62Ynd
 rMpwCbYeQB4+YYjL0r/lN2oBUmd2aETLWMYXx0H86ZaE/43wFxmlWXRYtckfEpdtRjRTLpA3Gy7p5
 skfIc1cPstYnbBSUksjHYhFvXERhictD++JwFmHdvPWnT56h4d7n/8xGVh5FlcRam2vA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lhvlnz0nU3d1WvlSrur1yV5Rcq1eSMG1z0JYW22UKhs=; b=Q5ZtEVeKl9pZmSbuFYqzPoZBzg
 8p8sAee80uLJYtE4hpkwkX6s5rxyP0WGwcGwTX7lAkCvDov5DGnR07MeEWmCyFMKW3COX4raEGV5B
 k2OQPn/5SG/Zey76RargKdu0VY44Cau1WPty2h0YY5a2+YsT43vHjnIGNUpZNfRDUhJs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlF9-0006Ou-83 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 81FEE60054;
 Tue, 10 Mar 2026 00:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E013FC4CEF7;
 Tue, 10 Mar 2026 00:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773103587;
 bh=ZaMPY2YfyWjkT+Gcpp9C9C2PHVwVCnyFNVGI6g8OFNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I/1xWpRDysmce3EvyVnDKvplZQdEjjKRvgmy5LdtujsGRPRt+90/Q3oZadWhrczVK
 QFiZeRzNsuWYvCxautmeR8y1HvInv0nUBr8eDiMG5CyoOxwt0uP6yFUEpBhcT3VUQJ
 gMdFl/kQlUlFa2g3AMebTXjVzwpx2ZWc3d2T1p4U1TYIVd0Z/itnEwFscfBAqLygge
 MlGZcPhQK0uZXzFaqTE9HHOWiAGdE7OBwwozTyPcX+DFc0SCWzprSOvi78r5WEd93o
 oHayMDAiNInQrV71Axr7SjTy7EQ5xiL/QGV9y821SwUAnzbhgLkEBuolUmmhX1TnL7
 NcNDqlOSGKhHQ==
Date: Mon, 9 Mar 2026 17:46:27 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310004627.GV6033@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-2-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-2-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:16PM +0100, Andrey Albershteyn
 wrote: > Reported verification errors to fsnotify through recently added
 fserror > interface. > > Signed-off-by: Andrey Albershteyn <aalber [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzlF9-0006Ou-83
Subject: Re: [f2fs-dev] [PATCH v4 01/25] fsverity: report validation errors
 through fserror to fsnotify
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: C7F4A2431A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:16PM +0100, Andrey Albershteyn wrote:
> Reported verification errors to fsnotify through recently added fserror
> interface.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/verity/verify.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 4004a1d42875..99276053d3bb 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/bio.h>
>  #include <linux/export.h>
> +#include <linux/fserror.h>
>  
>  #define FS_VERITY_MAX_PENDING_BLOCKS 2
>  
> @@ -312,6 +313,7 @@ static bool verify_data_block(struct fsverity_info *vi,
>  		data_pos, level - 1, params->hash_alg->name, hsize, want_hash,
>  		params->hash_alg->name, hsize,
>  		level == 0 ? dblock->real_hash : real_hash);
> +	fserror_report_data_lost(inode, data_pos, params->block_size, GFP_NOFS);

Don't we also need to cover the "if (unlikely(data_pos >= inode->i_size))"
around line 199 in verify_data_block?

--D

>  error:
>  	for (; level > 0; level--) {
>  		kunmap_local(hblocks[level - 1].addr);
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
