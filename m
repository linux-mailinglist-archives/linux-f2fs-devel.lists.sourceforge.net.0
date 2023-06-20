Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE680736098
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 02:34:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBPJi-0001SQ-13;
	Tue, 20 Jun 2023 00:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBPJg-0001SK-MT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 00:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNXV21OsSt7gI/n/3PefRlJKDR0R38lN2SdtU/cKoZk=; b=N7xYC2OF0f+8423YptqVD39sbw
 zD/v+0ZBS9L7lJqgZmMYAkIBNSEnnPeoS9eu/nGT0UFhpcBJ+vws6pHc7qUAJIarIIW+kOnxDWekk
 tt3ifu0C3D1tnEHBjIqobPVfFUWmP5Wr+YvIjNtxdRqf1yofymp+r/dC1JFBtkQyDMN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aNXV21OsSt7gI/n/3PefRlJKDR0R38lN2SdtU/cKoZk=; b=bu//xoWTriIU2j+IH+FDngULjq
 Cf6wWuN1pVATW1Zy6c6UrHypg0f2cMCClMVYmUY6LELrTxGZNz5qoJRqv62jErMrzen/J9qp3yJ7E
 qXGOniqFw/RGMkbeueF18uol3Pkof9ujjnvVMHWcy42seN7aN20+nPvwcDs3jfhGTSmc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBPJc-0000la-SF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 00:33:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 706CD60C74;
 Tue, 20 Jun 2023 00:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F13C433C0;
 Tue, 20 Jun 2023 00:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687221222;
 bh=2fIhx9gewgHQdAG7ylH52oVyteZ+F4kPWjIGNK8Ut3g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m8uf3fI1rWhcDoQc1vzBdZELxEoK+yqcFGwVQIhjuDHQqVMTtD0uRQQ2Bcujun0DY
 Kg/cB9HATnKguN9rHJp+bGbSXAFjT/2o5GwawmSNRXWOk6Qxe6O4bHt16L8LUmaRuV
 mMKf+6Kew4YAwDOg02Sf6rjsc72Hd/rx2ESgAeCVOqQ2LCo5YwszxhfLe6Pfqq34x8
 rFMqyz8qI6+TfgGdctzolZ/EU2PxrtJmpInHpuwL5rUFBM0ULBDb7ST5J9EYx54A8z
 hEVNljD126RpkA96NjNOGg0NssXNHqELKZNT2dsDaRK5GwUaOaYiabdjxDEB5XTges
 n3YuMusFEmEEQ==
Message-ID: <b8523d41-246b-b11e-f6e3-423e32cc597a@kernel.org>
Date: Tue, 20 Jun 2023 08:33:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yunlei He <heyunlei@oppo.com>, jaegeuk@kernel.org
References: <20230613085250.3648491-1-heyunlei@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230613085250.3648491-1-heyunlei@oppo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 16:52, Yunlei He wrote: > File set both cold
 and hot advise bit is confusion, so > return EINVAL to avoid this case. >
 > Signed-off-by: Yunlei He <heyunlei@oppo.com> > --- > fs/f2fs/xattr [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBPJc-0000la-SF
Subject: Re: [f2fs-dev] [PATCH] f2fs: not allowed to set file both cold and
 hot
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/13 16:52, Yunlei He wrote:
> File set both cold and hot advise bit is confusion, so
> return EINVAL to avoid this case.
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>
> ---
>   fs/f2fs/xattr.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 213805d3592c..917f3ac9f1a1 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -127,6 +127,9 @@ static int f2fs_xattr_advise_set(const struct xattr_handler *handler,
>                  return -EINVAL;
> 
>          new_advise = new_advise & FADVISE_MODIFIABLE_BITS;
> +       if ((new_advise & FADVISE_COLD_BIT) && (new_advise & FADVISE_HOT_BIT))
> +               return -EINVAL;

Yunlei,

What about the below case:

1. f2fs_xattr_advise_set(FADVISE_COLD_BIT)
2. f2fs_xattr_advise_set(FADVISE_HOT_BIT)

Thanks,

> +
>          new_advise |= old_advise & ~FADVISE_MODIFIABLE_BITS;
> 
>          F2FS_I(inode)->i_advise = new_advise;
> --


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
