Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5A506FA7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 16:02:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngoRE-0000SN-85; Tue, 19 Apr 2022 14:02:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <brauner@kernel.org>) id 1ngoRD-0000SB-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUa6elZetNNxbm0IThTr2fT4SGK51SdOhCAt7KyfOs4=; b=W8WA+1t8EQZDxptr8x5hhZqcku
 Q+acB6sEkZGChIiLBW0jcks3Le/4ooj7vakou/BUs4nrKo5bnNwLLtwfNhYYCtUphU7w8w52tqglz
 dXNy5x5ghCBedDzUXGgVbh2Nhco8aGiCO2n4FJu8zUSL5soTvTMjVCEJIwoSvoJCpDqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hUa6elZetNNxbm0IThTr2fT4SGK51SdOhCAt7KyfOs4=; b=d+3fMQsiGvYPm+D1Gq7dPoVT+a
 zZ3ghxFyD8NVhUiQt8M7oskRaTS1Y+ALUVhaPfMAsYQUgsXHQkDHRa2stH3hG5X4XArGKZ7lXBMZ1
 miPtK+tV7c6850N6x3VH88c6BvKO8A5fdHjGCDKvzdxYeQnyHIuWI8lIMJe/cr61l8kY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngoR7-00035H-RD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:02:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 882C0616C3;
 Tue, 19 Apr 2022 14:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58788C385A5;
 Tue, 19 Apr 2022 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650376946;
 bh=sqRutsWahsHt6cigK4f/6dAwTpOvdRR3j3VJDDTTT3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPiHCRBR9A9r8gkTiMDE9GS5JlTwXlsgUBFVeqIOEtI8jBZ4oIBvIBp/JbFgzZ2aa
 TlozkkqcyWXZ3jr15aantTnmLnT/WnbUP3V6VhJjkKefqI3AuT8RBBfJsDxzpRZnYR
 F11TJty84zVoGOS+vQQEp56xcNl17IycDPLg6aMR6oQh2XDzK0gIURJcZyGfMVb273
 1NROG81D5OFReoDGTY6ABBkYJtIAqnIultYyRlVzv9lLohlWVylJjsBLVlflUS/vjI
 SULfyiwUp5/LyXYTuyKu5h2h9g/strGps6Re0o4JRL9Y+65GmKeUeBHRYBT9dhCnLS
 O+NSdOZ2t5XMg==
Date: Tue, 19 Apr 2022 16:02:20 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20220419140220.bfziilnj47vdgsef@wittgenstein>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-5-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1650368834-2420-5-git-send-email-xuyang2018.jy@fujitsu.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19, 2022 at 07:47:11PM +0800, Yang Xu wrote: >
 Like other use ${fs}_init_acl and posix_acl_create filesystem, we don't >
 need to assign NULL for acl and default_acl pointer because f2fs_ac [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngoR7-00035H-RD
Subject: Re: [f2fs-dev] [PATCH v4 5/8] f2fs: Remove useless NULL assign
 value for acl and default_acl
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
Cc: linux-nfs@vger.kernel.org, djwong@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jlayton@kernel.org,
 ceph-devel@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 19, 2022 at 07:47:11PM +0800, Yang Xu wrote:
> Like other use ${fs}_init_acl and posix_acl_create filesystem, we don't
> need to assign NULL for acl and default_acl pointer because f2fs_acl_create
> will do this job. So remove it.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  fs/f2fs/acl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
> index eaa240b21f07..9ae2d2fec58b 100644
> --- a/fs/f2fs/acl.c
> +++ b/fs/f2fs/acl.c
> @@ -412,7 +412,7 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
>  int f2fs_init_acl(struct inode *inode, struct inode *dir, struct page *ipage,
>  							struct page *dpage)
>  {
> -	struct posix_acl *default_acl = NULL, *acl = NULL;
> +	struct posix_acl *default_acl, *acl;

Hm, patches like this have nothing to do with the theme of this patch
series. They can go as completely independent patches to the relevant
fses. Imho, they don't belong with this series at all.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
