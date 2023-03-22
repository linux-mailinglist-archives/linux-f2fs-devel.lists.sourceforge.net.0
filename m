Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAC6C5ACE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 00:47:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pf8As-0004wX-Di;
	Wed, 22 Mar 2023 23:47:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=438b69c7b=damien.lemoal@opensource.wdc.com>)
 id 1pf8Aq-0004wR-Hs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 23:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQSDAMaTzmE9XBa8j1VLibejVzOAwkcT9p0rqOH9+2w=; b=KP492S9vaHNR4SjUs9mPS8OYVq
 Aly73XzNJhYk7bslT/YvvVskVB1whXsc/l4yUObgd8f8kZHCb3lOH1jOHLCuKWi7/paLT4f8aKci1
 Lgj7j/3O8+lY/Q7+mnwE5UwJGcsleVbDUiE+A1c1uFVZi4CEvx/axDzAEudDs2/uQEU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KQSDAMaTzmE9XBa8j1VLibejVzOAwkcT9p0rqOH9+2w=; b=KHvkkZ49leAab9EkKEDtPi5inP
 nj+3WeqGc1qPU35y8j9mwZnA2IEjsHm39Upavrt0qFIlXt8W5kSc27kPqPklsZABWKbKsJRwmHQ7X
 IQRsFHK9yPE6bKGQPXASGJifMg94k/kZqIWqqCvQj5XvAHmDsUqyQGJLxBqckzAAK1O8=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pf8Aq-00H7UL-6z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 23:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1679528840; x=1711064840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q9SHaaGc/iP3oUCDDkuobziv3fI8u5euiS4kcHH3kx8=;
 b=AqAeBr7PeHZ3VC+UkFpe9Ws6m5sQCRYSDbageIOOHNtoMAEEm7pq6s7x
 uzD57Teu2v2/HNoQUll8nBerA4PWPBiW0nFYSdys2PI8G+obq9ti6qpNI
 oeZTiU1fg22dFM8a+P4e4qu6d19czHRmbnPVEsL/huGS43kD7fTJjW0XR
 f/VyWmGKaZJguOlJf+ajMbJbOaY99zU8vhbWmcbJY4VapNuq+OLiOysll
 Tdybdnmt2GIf3SZp/AiXOt1G8+tVuwC7oFe9xW010MUJK1AOsl2iHEmpe
 365NQemRma4pYf/3U+8MHsKpHgpCwJEMDo93ysH97hNcMB3KgjK55CqgV Q==;
X-IronPort-AV: E=Sophos;i="5.98,282,1673884800"; d="scan'208";a="226273057"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:31:39 +0800
IronPort-SDR: 24jTB+/hRJU4SaVo8zIV/pL2gKX+inOeD2sLYsw83tY1CPXp8ZMRhHDjxr4Xsu1xg4SVRl7sCQ
 HgURYsz+lnfVv7W5aUqHdDu83c4CfWTBI/Ff84V3hecrl0TeLhiU603nwBg/1CqQMSPu6zoN4X
 gCDsmtBx2c3JQ27gH9tGZ5K7D0Y5qKqSX5lwZFY+WjTOq3SX+EbIgrmhWQ0zU4yPKc5+cDJfeC
 TY1qydDEOvKpVp+z8b/ztTrFRQRj9UCozapiFRlufMAJ/nHDz6NyfpItjgQHAtBl4bQN7OzCwD
 K1I=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 15:42:16 -0700
IronPort-SDR: N96jlNSQxH0TsVQzXt6B8ZXyoJvBDP3jvZcrKYqmTjcZYrKUGrtFkZHhcUUPY0bC6JjVO1Ozbz
 U0sVLonuV5xbypaUzMR4bWmM/rKTe5UYXGZXaF5nH8lz8PZbRk3H8Ysy6HuCj52H4yA+xuKyBd
 3tzGiGrthYxKbpwys3qrwOKBq67BUZnQoOO959RzXxvGAuv8QksSxsv3ZxxE7j6Vri9XtK9w+n
 ADf53vujeG8H/QsGyg2n86fRuawbCCO16k+7Rff6dvoZKbtaXTG03V14o++U8fVajDBAvtzA7G
 HBk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 16:31:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Phl9Q5fTvz1RtVq
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Mar 2023 16:31:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1679527897; x=1682119898; bh=q9SHaaGc/iP3oUCDDkuobziv3fI8u5euiS4
 kcHH3kx8=; b=JGNufdCwdGSw+94EX16K+0u2kFMVp2NvMLIq1nJZeab8uhMdwEp
 ofeBGEWeT3XCiWuOQ9cadh1ZCGt6neqeNZZyT2OBS+H2o1Cvu5cncPD0EDzjH1AD
 myqHohfVKhmuEzn/VGtFJ7tfYD8TReeVYC7gO1HyzUKJhYf0JQ75JgZThXcZk9KL
 CPRoJq87xivOlYq6xPGnJMI9lRYbH4wI6+ISXQTY6SIHsRlxQ7o3g3F5XwT9hVKt
 fLnDy4FDSd0EN1mp9Ihw418Ej9XwY+ZX1tAKbEbdvAyv0qiLal1fF184rj8UhwDY
 6eTC3LRkgdQnQyirrpmiYNHdXAQDoGEBDdg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id upix8eC8tAIw
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Mar 2023 16:31:37 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Phl9H74fjz1RtVm;
 Wed, 22 Mar 2023 16:31:31 -0700 (PDT)
Message-ID: <5e7e8187-f514-c65e-2615-26762a329590@opensource.wdc.com>
Date: Thu, 23 Mar 2023 08:31:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 trond.myklebust@hammerspace.com, anna@kernel.org, konishi.ryusuke@gmail.com,
 mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
 richard@nod.at, djwong@kernel.org, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
References: <20230322165830.55071-1-frank.li@vivo.com>
Organization: Western Digital Research
In-Reply-To: <20230322165830.55071-1-frank.li@vivo.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/23 01:58, Yangtao Li wrote: > There are plenty of
 using kobject_del() and kobject_put() together > in the kernel tree. This
 patch wraps these two calls in a single helper. > > Signed-off-by: Y [...]
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pf8Aq-00H7UL-6z
Subject: Re: [f2fs-dev] [PATCH v3 01/10] kobject: introduce
 kobject_del_and_put()
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/23/23 01:58, Yangtao Li wrote:
> There are plenty of using kobject_del() and kobject_put() together
> in the kernel tree. This patch wraps these two calls in a single helper.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -convert to inline helper
> v2:
> -add kobject_del_and_put() users
>  include/linux/kobject.h | 13 +++++++++++++
>  lib/kobject.c           |  3 +--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index bdab370a24f4..e21b7c22e355 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -112,6 +112,19 @@ extern struct kobject * __must_check kobject_get_unless_zero(
>  						struct kobject *kobj);
>  extern void kobject_put(struct kobject *kobj);
>  
> +/**
> + * kobject_del_and_put() - Delete kobject.
> + * @kobj: object.
> + *
> + * Unlink kobject from hierarchy and decrement the refcount.

Unlink kobject from hierarchy and decrement its refcount.

> + * If refcount is 0, call kobject_cleanup().

That is done by kobject_put() and not explicitly done directly in this helper.
So I would not mention this to avoid confusion as you otherwise have a
description that does not match the code we can see here.

With that fixed, this looks OK to me, so feel free to add:

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> + */
> +static inline void kobject_del_and_put(struct kobject *kobj)
> +{
> +	kobject_del(kobj);
> +	kobject_put(kobj);
> +}
> +
>  extern const void *kobject_namespace(const struct kobject *kobj);
>  extern void kobject_get_ownership(const struct kobject *kobj,
>  				  kuid_t *uid, kgid_t *gid);
> diff --git a/lib/kobject.c b/lib/kobject.c
> index f79a434e1231..e6c5a3ff1c53 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -876,8 +876,7 @@ void kset_unregister(struct kset *k)
>  {
>  	if (!k)
>  		return;
> -	kobject_del(&k->kobj);
> -	kobject_put(&k->kobj);
> +	kobject_del_and_put(&k->kobj);

Nit: You could simplify this one to be:

	if (k)
		kobject_del_and_put(&k->kobj);

and drop the return line.

>  }
>  EXPORT_SYMBOL(kset_unregister);
>  

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
