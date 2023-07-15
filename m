Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A617546EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jul 2023 07:25:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKXmj-0000e6-4G;
	Sat, 15 Jul 2023 05:25:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKXmh-0000e0-9F
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 05:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Opzf/QX+Fp3d9V5iCRDolpiWeRrDIA9342Tbk8cWb4w=; b=gRw55SGg24PiwAkellNIeWnH/8
 bFax7EU6up1UGhEFh1B7huQVD4OkpSElh9zQGetR+Wkhaj2huMtaV7+RUKX6YuzwERGo6bImaFh+Z
 c3OzeCEmzAemrJVcu3fkvk4U3F4e6M2eg/qzHxSimOBFeHnrL8zdO6zH8Umqro3e/tEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Opzf/QX+Fp3d9V5iCRDolpiWeRrDIA9342Tbk8cWb4w=; b=kck9LEt8198i3qDSCBk2AfW26Z
 P1ncESBytfh/PDXX1N3izmQSyep1yF9FAE7iN3zx5HLmjFRT7WbUTF3cKoG3XtF1ZEdObnH5LqR2j
 46Ynjg/bFGinKQVia6UdGL8XEjpj8OHqinBvstJdVXPMzLd5UhKOR2yOgamDpz7HLm/g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKXmg-008KHQ-5j for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 05:25:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E30236009E;
 Sat, 15 Jul 2023 05:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238CCC433CB;
 Sat, 15 Jul 2023 05:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689398722;
 bh=lESjDKnve39GEpWTt/+x5jAJvtQLAMGjLVXC2kJR0Ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0SHAsVOuhW00htDez9RxfOednB2dELjLJinF2WX60d1fLwLcj+wX935EbR1M9P5h
 GxVpK4jlN874OSOWFHr3FNK20U+L7+S+OrkUH7uSAgeka+wtcBb1xwcrZL4dkqrArx
 tuLX8Y78D7Xz5sPnrVeKUXS7Lg46B43mZdcyUWei4xn+uN8bDj2fRgdR+RqPchF4nQ
 MUyQJocKgwmEvEj2MG+ztE/0zLUwZ4tPEjKrrbQv8AQSMo1aZVsfoviaM6lbdy7M2k
 LeU2Wf7RrMXhamyFluTzjX14qRPGjW3vXGaA95priLdriupSAd+tx13q4YKXVttQAP
 v2elm8ooTN/9Q==
Date: Fri, 14 Jul 2023 22:25:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Weichao Guo <guoweichao@oppo.com>
Message-ID: <20230715052520.GB4123@sol.localdomain>
References: <20230715052023.2317307-1-guoweichao@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230715052023.2317307-1-guoweichao@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jul 15, 2023 at 01:20:23PM +0800, Weichao Guo wrote:
 > As the fscrypt context has two versions now, this patch adds the > support
 of fscrypt_context_v2 for print_xattr_entry. > > Signed-off-by [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qKXmg-008KHQ-5j
Subject: Re: [f2fs-dev] [PATCH v3] f2fs-tools: support to show
 fscrypt_context_v2 in print_xattr_entry
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 15, 2023 at 01:20:23PM +0800, Weichao Guo wrote:
> As the fscrypt context has two versions now, this patch adds the
> support of fscrypt_context_v2 for print_xattr_entry.
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fsck/mount.c | 48 ++++++++++++++++++++++++++++++----------------
>  fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
>  2 files changed, 77 insertions(+), 25 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d..1900b84 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -194,7 +194,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  {
>  	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
>  	const int size = le16_to_cpu(ent->e_value_size);
> -	const struct fscrypt_context *ctx;
> +	const union fscrypt_context *ctx;
>  	int i;
>  
>  	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
> @@ -211,22 +211,38 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  		return;
>  #endif
>  	case F2FS_XATTR_INDEX_ENCRYPTION:
> -		ctx = (const struct fscrypt_context *)value;
> -		if (size != sizeof(*ctx) ||
> -		    ctx->format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
> +		ctx = (const union fscrypt_context *)value;
> +		if (size != fscrypt_context_size(ctx))
>  			break;

As I mentioned on v2, if size == 0, this will read past the end of the xattr
value.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
