Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8281966B0C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 23:00:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8jQ-0001Fr-RB;
	Fri, 30 Aug 2024 21:00:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@sandeen.net>) id 1sk8jP-0001Fj-Dn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 21:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UVQr6IE/zrPI8n+Fhao2tpCa1eBa9OcMUViwTcSNsos=; b=ei62rjYVYogBOFHhseSIuX2Neh
 Iggvq+LS/IZK59kH8Inz19Y18oktQjdeNaxbveqZcphP6i7dbp8NGtfD6hkPa0uAlYrgaqxtGOVH3
 kxa7KRPqg5RQbAJ448sd7D3UtEz50r1Zji4T/3NzP97MCGn3uR+DbyvNMXwdyPoKIKik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UVQr6IE/zrPI8n+Fhao2tpCa1eBa9OcMUViwTcSNsos=; b=VmDGeDfoFdz+0fukTg6aHUMeK8
 JgMXt7ZPC5Z+Xjl531WGnFYBRR5XRFsE29iCQ7VygaDUHQQG6IucUGFV3jehnh4Pi0w1Xw4xbv9Nk
 /yiVc2jX3i5i++oQqiojLoeP0j+ydQrndfoYFaf9/dHVF/A2XsO/eIPpT/PBrsoFHFHw=;
Received: from fhigh3-smtp.messagingengine.com ([103.168.172.154])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8jO-0006Tb-W8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 21:00:32 +0000
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal
 [10.202.2.42])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 5522B114025D;
 Fri, 30 Aug 2024 17:00:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Fri, 30 Aug 2024 17:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandeen.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1725051625;
 x=1725138025; bh=UVQr6IE/zrPI8n+Fhao2tpCa1eBa9OcMUViwTcSNsos=; b=
 e5tqFRwf1lVsLEhy43ilvIswoVxLoaiHl8iUbRRPXhyROYw5fhgkFlMnbfOqdqV/
 psBfe2yWm3EbUTZT7QEhNu5ri4DS1iWdSBaZV4uelgzYt2rV5U9UDAxladfje79t
 w+eJW7d5xuijmUPGS6NU3yJ61eNIuFxuAqNj+dYvslU4OJqyeA6IWdCOOPArxLD+
 f0dibsCst05nXMsx+74u77UtBCgmuD3ij6cjOcp9t4Cj0yuObcxTO2FQUIJ0n3ml
 +naBrZl+cubSxNhPkgm4A4GTbAMbBYFN3zD3OBkKpi+0frJuk7sD5uHlu06cfDkk
 wQPADR//IXS8drPZ5P30PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725051625; x=
 1725138025; bh=UVQr6IE/zrPI8n+Fhao2tpCa1eBa9OcMUViwTcSNsos=; b=Z
 Ztg5KXSFRRN4EM4kJLG7KWRi0P+b+M7Ct6ZNxJwE3dVfzwE1wqmsFqG4r4h0bOb6
 jkNN2pyqq8Z9YYtVq/CQ6wqlDXbL8X+gyM1vXAWrwYSxNh9h28eOYYrKRjYHHiCF
 u/IUG8YhO1+rNG7HGS0kb/G8LQZ2bH4GNVkTEl+AWA7DeU28WmnKG1cbdSw0BMZQ
 Pddxm0uHSllCENVKAbjCc47UBsk1KUDoW5hAKcN+ful6rKqnRAu5iaP0CbS5CuXN
 DaiRXQmloSQJhv8CstkTWWJkCPsgfvZmNnaTydq2+dGpopIzHX3TvCaVp++dMPcI
 V70445iUVBLZFL2taAhLA==
X-ME-Sender: <xms:6TLSZiPLkqccxlIAipvRIJ1dOal_AY0fct06IWJQMFK5bzKhj9o38w>
 <xme:6TLSZg8MPCIxxqkfAAYCk6GpnvSTXjcCRWVeQvv1kYva9FyxGfxN_WQ9DRfgQ9MWw
 AYLgimpKvTTRVWpsG0>
X-ME-Received: <xmr:6TLSZpT0mp1OUmuOuToFB5cwHI0qLHbbeJ21aSvBsZVyU_wZ2thcLIqUdywi5pjuylMN7mVJ8cGjd-qdhSVnC7UKlbDJCgHKqqf6UJ3Fbvp8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddv
 jeenucfhrhhomhepgfhrihgtucfurghnuggvvghnuceoshgrnhguvggvnhesshgrnhguvg
 gvnhdrnhgvtheqnecuggftrfgrthhtvghrnhepleehieegueeljeevieegudekfeevleff
 vdeuteehtddtuefhkedvkefhiedvfffhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghn
 uggvvghnsehsrghnuggvvghnrdhnvghtpdhnsggprhgtphhtthhopeeipdhmohguvgepsh
 hmthhpohhuthdprhgtphhtthhopehlihhhohhnghgsohdvvdeshhhurgifvghirdgtohhm
 pdhrtghpthhtohepjhgrvghgvghukheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptg
 hhrghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhfvdhfshdquggv
 vhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopegsrh
 gruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhfshguvghv
 vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6TLSZiuHCmggiEpZSszY7Fz6uABS9q4E13KTXkpDqetiUjpYDONMMQ>
 <xmx:6TLSZqfz0-PU-D01o3sC4Fqf3tCHQtnqFq4WMUxwIqbj_9AdoiaSlw>
 <xmx:6TLSZm1kAV-aaDQT2U3dpIGnWNit2lNeQE0foHR85ny65HZ9PRXxqA>
 <xmx:6TLSZu9B60BiICm9KVXIUvBGLH77menkSIkchEgSD8AFyCp_Ft3_9A>
 <xmx:6TLSZgu4jDKDy4d-0XoeQ0haQMAnROXcCLrcg-8E5WqzxzGwGKIqv5KU>
Feedback-ID: i2b59495a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 17:00:23 -0400 (EDT)
Message-ID: <c55d435f-c06b-4b99-b6db-b21f495b4c32@sandeen.net>
Date: Fri, 30 Aug 2024 16:00:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hongbo Li <lihongbo22@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
 <20240814023912.3959299-2-lihongbo22@huawei.com>
Content-Language: en-US
From: Eric Sandeen <sandeen@sandeen.net>
In-Reply-To: <20240814023912.3959299-2-lihongbo22@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/13/24 9:39 PM,
 Hongbo Li wrote: > Use an array of `fs_parameter_spec`
 called f2fs_param_specs to > hold the mount option specifications for the
 new mount api. > > Signed-off-by: Hongbo Li <lihong [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sandeen.net]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.168.172.154 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.168.172.154 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sk8jO-0006Tb-W8
Subject: Re: [f2fs-dev] [PATCH 1/9] f2fs: Add fs parameter specifications
 for mount options
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
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/13/24 9:39 PM, Hongbo Li wrote:
> Use an array of `fs_parameter_spec` called f2fs_param_specs to
> hold the mount option specifications for the new mount api.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  fs/f2fs/super.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 3959fd137cc9..1bd923a73c1f 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -28,6 +28,7 @@
>  #include <linux/part_stat.h>
>  #include <linux/zstd.h>
>  #include <linux/lz4.h>
> +#include <linux/fs_parser.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -189,9 +190,87 @@ enum {
>  	Opt_memory_mode,
>  	Opt_age_extent_cache,
>  	Opt_errors,
> +	Opt_jqfmt,
> +	Opt_checkpoint,

If adding an opt_jqfmt to use with an enum, you can/should remove
Opt_jqfmt_vfsold Opt_jqfmt_vfsv0, and Opt_jqfmt_vfsv1, because they
are no longer used.

Similarly for Opt_checkpoint_disable_* symbols.

>  	Opt_err,
>  };
>  
> +static const struct constant_table f2fs_param_jqfmt[] = {
> +	{"vfsold",	QFMT_VFS_OLD},
> +	{"vfsv0",	QFMT_VFS_V0},
> +	{"vfsv1",	QFMT_VFS_V1},
> +	{}
> +};
> +
> +static const struct fs_parameter_spec f2fs_param_specs[] = {
> +	fsparam_string("background_gc", Opt_gc_background),
> +	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
> +	fsparam_flag("norecovery", Opt_norecovery),

Many/most other filesystems tab-align the param_spec, like

...
+	fsparam_string	("background_gc",	Opt_gc_background),
+	fsparam_flag	("disable_roll_forward",Opt_disable_roll_forward),
+	fsparam_flag	("norecovery",		Opt_norecovery),
...

but that's just a style thing, up to you and the maintainers.

I'd also suggest making more use of enums (as you did for f2fs_param_jqfmt).
I think it can simplify parsing in the long run if you choose to. It avoids
the "if strcmp() else if strcmp() else if strcmp()... pattern, for example
you can do:

static const struct constant_table f2fs_param_background_gc[] = {
	{"on",		BGGC_MODE_ON},
	{"off",		BGGC_MODE_OFF},
	{"sync",	BGGC_MODE_SYNC},
	{}
};

...

	fsparam_enum	("background_gc",	Opt_gc_background, f2fs_param_background_gc),

...

and then parsing becomes simply:

	case Opt_gc_background:
		F2FS_CTX_INFO(ctx).bggc_mode = result.uint_32;
		ctx->spec_mask |= F2FS_SPEC_background_gc;
		break;

When I tried this I made a lot of use of enums, see
https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git/tree/fs/f2fs/super.c?h=f2fs-mount-api#n182
and see what you think?

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
