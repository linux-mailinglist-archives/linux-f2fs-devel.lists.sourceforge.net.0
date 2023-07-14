Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C975314C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 07:32:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKBPF-0002Ud-Ne;
	Fri, 14 Jul 2023 05:31:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKBP6-0002UW-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5zb1GO4xNNAfIr5fDyQR8UXPwEEHvITt0rtMB1Y5tpE=; b=gEerfmCRbBKymlFjSMbR4VuY2K
 OaOWKVYttDiariPTfjgXqSAd+fyrMW4Szwv25yetSd2BXT6BY1dgEOt8Ok0Epy0DankAmfoMeJcGu
 VgCChQ8sziYqhwWYoYXJkYF6xI3PNh48ZtnqsS3ZyG/8ebAR55A6fcx+8Ux/QDceW8gs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5zb1GO4xNNAfIr5fDyQR8UXPwEEHvITt0rtMB1Y5tpE=; b=Mui+/cMi3iOVQf6tujButhHmMN
 YPnzl28XyvRHY1Xsgv3jCyPSY+JY1pW7nIyQLE88XaGqJLYlLw2PpeD2Vl5y1GUrtLsiexcZIfxAp
 SI4JHYNChnHruyd8p1lCo6FQGnHMLdg5pmbllI0FeYzWhfE5klR2TapaGhb73IBaTowk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKBP7-00007Y-Jk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:31:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2DDD61C14;
 Fri, 14 Jul 2023 05:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16291C433C7;
 Fri, 14 Jul 2023 05:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689312697;
 bh=UQR3bir+WT35SRPvnb3D/9pM/N80WPTedvRzMIl+G4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pQwKSe7ig70Gqivtm2Dbh5BExokj9htpK0aCmQ/N7tKSJh4eGtxg4oWTBxgaleQEd
 qkMTkC0uXCdaPk7VGzDEBFiPZW9U2eL0HFCu51sWWFBw5QX9G06HNoI4k6YI0zQ4sw
 QARcLLQ6T0uC3NCWi0g8GUK/15W8+0/JZ50uvHlOJVDUQO3Wz9IGWM/d6/COIc9/3K
 3YpxiAhODi3M/4LvO+gliXc6SJQb3k5lIn4LzAlwNWs6SpW5WWEAfHcrqa02W7Xh7m
 hzz+WcpLd+b0q+L2v5KyoTnBt0JUoFQQXr/ALkrJH1DVaXew0SEWn0wFRl/PbhMtMx
 aLnHJvNURpdDQ==
Date: Thu, 13 Jul 2023 22:31:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230714053135.GD913@sol.localdomain>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-5-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422000310.1802-5-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 21, 2023 at 08:03:07PM -0400, Gabriel Krisman
 Bertazi wrote: > From: Gabriel Krisman Bertazi <krisman@collabora.com> > >
 Preserve the existing behavior for encrypted directories, by reject [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qKBP7-00007Y-Jk
Subject: Re: [f2fs-dev] [PATCH v2 4/7] libfs: Support revalidation of
 encrypted case-insensitive dentries
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

On Fri, Apr 21, 2023 at 08:03:07PM -0400, Gabriel Krisman Bertazi wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Preserve the existing behavior for encrypted directories, by rejecting
> negative dentries of encrypted+casefolded directories.  This allows
> generic_ci_d_revalidate to be used by filesystems with both features
> enabled, as long as the directory is either casefolded or encrypted, but
> not both at the same time.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/libfs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index f8881e29c5d5..0886044db593 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1478,6 +1478,9 @@ static inline int generic_ci_d_revalidate(struct dentry *dentry,
>  		const struct inode *dir = READ_ONCE(parent->d_inode);
>  
>  		if (dir && needs_casefold(dir)) {
> +			if (IS_ENCRYPTED(dir))
> +				return 0;
> +

Why not allow negative dentries in case-insensitive encrypted directories?
I can't think any reason why it wouldn't just work.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
