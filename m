Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2283B84E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 04:34:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSqVr-0007PE-Dt;
	Thu, 25 Jan 2024 03:34:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rSqVp-0007P8-Ao
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 03:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=85PNoXKF38NmEyXNhJvMRCaZAca13Cuuggi7QGp02cE=; b=MCecOMkyPBShqV+w5AYExdpD3B
 55VDUaOgi5mtIdZPYIW7lOBSMbCGgLaWXIDi/77/CQWNDMD1QH3uNU7nPif6NQncIdW//NClf7XYp
 SGqz8gIKgH4QBEGDKKIe50HOKAyIWRNb+rk2hD61XWcnT+mdD1amZApmiMqkqRXjpbY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=85PNoXKF38NmEyXNhJvMRCaZAca13Cuuggi7QGp02cE=; b=Gfwa5nCXnUcaWvFm1/Bg9X+Aty
 r7fQmFpnZtuL4gh8lZSlY95xlkXUFM+CqbsyI3ELbNBKL4XaOCOarJUfDlnaylrXfQpaGJ1Ema1CP
 AuIYyMnCN6tXSX7BDW3hxXPX4ZO5edXXogbW37LYtZpsEKWEnqEUYSnnF0ESrUeStiCU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSqVn-0006rm-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 03:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8F926CE32AE;
 Thu, 25 Jan 2024 03:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3CBC433F1;
 Thu, 25 Jan 2024 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706153676;
 bh=5nKlkdVTP90VlmmNuw9xvFlkteOuuubePKwYu2lTc2Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cpk4h8KOwrzfshK6xRI4StxzD92WE9EX2ADLsHospm0v8cP72aQ32l4HbC6Yz0WA/
 6JQdG8wvKXMPFN8KjfNfV0yECRq+VlRwFsD0b7+grCUE8o62KSRHl70o2BPM+HkYqf
 PAgpuY0hq74NGMFXnfrphamHsoWFx+aqS6y4S/Y13TY1DeSG6GAWuIuM6PUjL9b3YR
 BJB7XWUhGXx7rvnwb0ZPcPDzT5+eyZUZlvf4b6P99LeQCDCyzpkvNBM46N7UZvihdz
 AJQ6RilSTj/yb1wv+2N46AFxwLDvbV90oFmBRc+2C+XNdUgXW8R1q5OHFAlRVAsXKL
 SNdPyUfN9o5/g==
Message-ID: <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
Date: Thu, 25 Jan 2024 11:34:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240117230032.2312067-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240117230032.2312067-1-daeho43@gmail.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +Cc Yongpeng Yang Daeho, Yongpeng reports a potential issue:
 if c.devices[0].total_segments is larger than segments of mainarea,
 c.cur_seg[CURSEG_HOT_NODE]
 will exceed end boundary of mainarea. Could you please check that? th [...]
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSqVn-0006rm-S4
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

+Cc Yongpeng Yang

Daeho,

Yongpeng reports a potential issue: if c.devices[0].total_segments is
larger than segments of mainarea, c.cur_seg[CURSEG_HOT_NODE] will exceed
end boundary of mainarea. Could you please check that? though it's a corner
case.

On 2024/1/18 7:00, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Make to allocate logs after conventional area for HM zoned devices to
> spare them for file pinning support.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   mkfs/f2fs_format.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index f2840c8..91a7f4b 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -557,7 +557,8 @@ static int f2fs_prepare_super_block(void)
>   		c.cur_seg[CURSEG_COLD_DATA] = 0;
>   		c.cur_seg[CURSEG_WARM_DATA] = next_zone(CURSEG_COLD_DATA);
>   	} else if (c.zoned_mode) {
> -		c.cur_seg[CURSEG_HOT_NODE] = 0;
> +		c.cur_seg[CURSEG_HOT_NODE] = c.zoned_model == F2FS_ZONED_HM ?
> +			c.devices[0].total_segments : 0;
>   		c.cur_seg[CURSEG_WARM_NODE] = next_zone(CURSEG_HOT_NODE);
>   		c.cur_seg[CURSEG_COLD_NODE] = next_zone(CURSEG_WARM_NODE);
>   		c.cur_seg[CURSEG_HOT_DATA] = next_zone(CURSEG_COLD_NODE);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
