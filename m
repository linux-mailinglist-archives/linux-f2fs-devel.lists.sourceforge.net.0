Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD47E6567
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Nov 2023 09:38:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r10Y1-0000Eu-BH;
	Thu, 09 Nov 2023 08:37:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r10Xz-0000Eo-Ff
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 08:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fDWV34qV+aerHOWJYlBGVnQ2wAVJTFgqB7Y4pw2b8X8=; b=TXAxvLfAtwTlQ6JeW5D1EPgz+O
 tTQFV5a5izLzReCTiVaTMK5Ty/EmgnmwTPSWDDakjB5FLO/O/HKWM4uR6XtF6+oS4r/EdmpuURgjs
 DKVzyCssXM7UlkkwRMZM+WQ3nREHQAUSs7aOjltb7upoYZAp20pc2qxFr/92j1msiIJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fDWV34qV+aerHOWJYlBGVnQ2wAVJTFgqB7Y4pw2b8X8=; b=VTMPS7xw+ka3YvnUcAmx3v60A9
 clVhW8fdEElpgA4bEfgkpC60Ev+CYptO74+CliSuRwuozCH9ghl9ICaA7BK6ucHpo6bkZ60bkKq7q
 SGWK9j6kf3M2eZi2MFw/ilrptBqP2moB+l15+b/JndNylv9iswHl3ysAe/h9118+MIWc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r10Xy-0002kd-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 08:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0763CE1105;
 Thu,  9 Nov 2023 08:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69242C433C8;
 Thu,  9 Nov 2023 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699519064;
 bh=zU1/KbknoRpYLkdd8CK08OGdRra74C9WHm8BpnZszVQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JjQRjXN448B1Z2gRuLpeDQwGpssusa9FGuBcDiFQB9lkxxw5U4/upP0oz+zntniP4
 JOfuQUeFhb8c/GqmCS6vcCFtU6sPd91zJc26K4SG7rxu7k8s3L7P1y5Mo+USGXz7D8
 8YMoA7mIglh9+PSlkQOohK1r7YT0x4qrzuA19wA15J7BKaICYZrSwGQHThCQ7zjbrP
 UKV4coxunxaT6z+0NoSvKbPrzvKMiNop4mXNBhBmNXPh54lMDJ0yd6AR8bRM0Guk2i
 SFhR49s1z6ZsjzvQa8DdWNC7nCqIMiLmsyoaJ/oQDIhqZ6tOwXbayMKvVC4i317fQX
 hOjMImi8pTmsQ==
Message-ID: <dc585173-d459-fc2a-b8ec-43a36361eeb2@kernel.org>
Date: Thu, 9 Nov 2023 16:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: zangyangyang1 <zangyangyang1@xiaomi.com>
References: <20231108123830.165855-1-zangyangyang1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231108123830.165855-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/8 20:38, zangyangyang1 wrote: > This issue comes
 from a static code scanning tool. > When c.sparse_mode is 1, stat_buf will
 not be initialized, > but it will be used next. > If this issue d [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r10Xy-0002kd-P4
Subject: Re: [f2fs-dev] [PATCH] libf2fs: Fix using uninitialized variables
 error in get_device_info()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/8 20:38, zangyangyang1 wrote:
> This issue comes from a static code scanning tool.
> When c.sparse_mode is 1, stat_buf will not be initialized,
> but it will be used next.
> If this issue does not require modification, please ignore this commit.
> 
> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
> ---
>   lib/libf2fs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 995e42d..0398c52 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -933,6 +933,7 @@ int get_device_info(int i)
> 
>          stat_buf = malloc(sizeof(struct stat));

Use calloc() instead of malloc()?

Thanks,

>          ASSERT(stat_buf);
> +       memset(stat_buf, 0, sizeof(struct stat));
> 
>          if (!c.sparse_mode) {
>                  if (stat(dev->path, stat_buf) < 0 ) {
> --
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
