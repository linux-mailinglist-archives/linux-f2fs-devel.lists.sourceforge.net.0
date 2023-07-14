Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FC753181
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 07:49:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKBgN-0003v8-TN;
	Fri, 14 Jul 2023 05:49:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKBgM-0003v2-Fi
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SHcPWexzbWLR6et3TqJdT5GImKuE8Je85P9KdC6KhHQ=; b=myomMVkaDlfXWDV3TIacQyNfNe
 kb34jvIjoX9t7dmu1pgkV5xOhy7K3uvj5q5SLInIlV6Fe74nKvuHDNRyxpR4NGr75CQec/RQsBurJ
 M8qpcXstWRxYiSNycpVjnjZF+FEaPAyPaUm2lr6vIela1X7xQihLrFq0EqBAsHz5Txrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SHcPWexzbWLR6et3TqJdT5GImKuE8Je85P9KdC6KhHQ=; b=ORG7ga2BA04Rga0v59nryQ5Y2x
 hl6yigTCtF+qHiVXl0+SHI3T7j/Lf3VDiHirKbWs9AuU6X9iuJsDA+bnBom3hyL0wgw5ns1HL8IY9
 seJzXl1n+dk3FATLiOIA8BDFDxBHXX8ELO2hDf+54XqNAREF7sYvD9abtPeGN7Uf5sxU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKBgM-0000d3-R1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:49:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2301861C15;
 Fri, 14 Jul 2023 05:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49121C433C8;
 Fri, 14 Jul 2023 05:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689313766;
 bh=7DnQ3lPm58MYsorHdkMUvAqvzRj0azqqi5D765n2mkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S579h9VF/gTjL7FvtkLYx19YYonmDP7oeWhNKTLavRhs6b3XqYHgciC57V+g2JAc6
 XDYLHNlyHIPB90N1QlVqUjNVjTxyaOg6ZCus0W7CSpPcYIuqXGgDChAB8aTb7TWtxC
 A2pqs2CMuucrYF7hFG6kcldXkI/W7HCnK06IDecW3moef29b2zPcK4doO2IUvh4Ydi
 0igEQZt+pNQk3PsQyt1sm21qdsqaiCQ3xvKjameBVU14iiQVByJpgZfhVWgrRIZvu3
 NRr/X6QyILlYhdnE6gydOJpJvUQX0oua2oHDN7N+GHaEOqaB3yLnswxVELldGyWbkQ
 MFzFnxcJJdtjw==
Date: Thu, 13 Jul 2023 22:49:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230714054924.GF913@sol.localdomain>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-8-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422000310.1802-8-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 21, 2023 at 08:03:10PM -0400, Gabriel Krisman
 Bertazi wrote: > From: Gabriel Krisman Bertazi <krisman@collabora.com> > >
 Instead of invalidating negative dentries during case-insensitive > [...]
 Content analysis details:   (-5.9 points, 6.0 required)
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
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qKBgM-0000d3-R1
Subject: Re: [f2fs-dev] [PATCH v2 7/7] f2fs: Enable negative dentries on
 case-insensitive lookup
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

On Fri, Apr 21, 2023 at 08:03:10PM -0400, Gabriel Krisman Bertazi wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Instead of invalidating negative dentries during case-insensitive
> lookups, mark them as such and let them be added to the dcache.
> d_ci_revalidate is able to properly filter them out if necessary based
> on the dentry casefold flag.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/f2fs/namei.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 11fc4c8036a9..57ca7ea86509 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -564,17 +564,8 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>  		goto out_iput;
>  	}
>  out_splice:
> -#if IS_ENABLED(CONFIG_UNICODE)
> -	if (!inode && IS_CASEFOLDED(dir)) {
> -		/* Eventually we want to call d_add_ci(dentry, NULL)
> -		 * for negative dentries in the encoding case as
> -		 * well.  For now, prevent the negative dentry
> -		 * from being cached.
> -		 */
> -		trace_f2fs_lookup_end(dir, dentry, ino, err);
> -		return NULL;
> -	}
> -#endif
> +	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
> +		d_set_casefold_lookup(dentry);

I wonder if a more consistent place for the above code would be earlier in
f2fs_lookup(), next to the call to generic_set_encrypted_ci_d_ops()?  That's
where the dentry_operations are set.  It's also next to f2fs_prepare_lookup()
which is where DCACHE_NOKEY_NAME gets set if needed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
