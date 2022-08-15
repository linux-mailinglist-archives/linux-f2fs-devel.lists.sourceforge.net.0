Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A8592834
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Aug 2022 05:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNQvs-0002lH-4G;
	Mon, 15 Aug 2022 03:38:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oNQvq-0002lB-8A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 03:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+QLyk9N70sH4rJMC4E+opGwDlZoWX1Nq02YBG+pMIk=; b=EY0z34ejexKTk4+8rDs3LECozp
 9lwIrBFxIsJALKX2rvOejmwyf0ozHvddtVphNmN/pNfLcuVd9JK8oeZPvBTttkIyDSJbGt4LXw2ie
 11yhapFGeC7dzVh/Nym4uHi5lZYbFjkDpA+Ar3MHNkbdGyyZ7CwqjFvKZ1S9p/PYjMaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K+QLyk9N70sH4rJMC4E+opGwDlZoWX1Nq02YBG+pMIk=; b=Ka9WyRktNPNNYMETdFy17zSUuY
 zXhboCNzsT/5hVdAXtR0NVV5DrBq6Dt2et+GcZ3mEFBdbaCQY4fBnv07HNYw3/h91KHp9l2U1IT02
 rxC2GRv8lndYFqUiO+oClb/b0waAXY31aCcpLT2UnTym9kfuNCq3pV/MOXk0lHqZAGyk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNQvl-002cIO-16 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 03:38:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D7F5B80D00
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Aug 2022 03:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB18C433D6;
 Mon, 15 Aug 2022 03:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660534683;
 bh=VsYtEaLrultUzMYq2W9FqRUKe3E7Yctk9vn8SCRVUCs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=EvOM/yGowHJ9MBWHDjna0JIomwNTVgijPeGdq6G3VY8JUttonvroTfsUwAvjQvCrw
 Fqb2/qo2zTVQ8zbM+J6iY2T2cqj2svwY62g0ZZp4yRHDjmgvjitEbd8nX7hmpTifOV
 DAUPbKubdiEl81nimPayRZ2jxXl0XCHpNEyK+7SasLXgZdTBPkrw0BNmIdNLnfG8JD
 qmdkI6y1/s0wnfvCGBMzfVxMMLbPXst5buOxtVy7knkYE/I8LAU4Z+a298DvTmir/n
 kakBEk/4l2qb4AFMFO3vo3GWk7NmLh2J50hDwgl2hhxONvlddVnj6DLFSpMN+HxgPp
 OLhGcU2nwM7Fw==
Message-ID: <f13d4881-820f-f6cd-4a70-c46ca3c5089f@kernel.org>
Date: Mon, 15 Aug 2022 11:38:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220811225454.2125297-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220811225454.2125297-1-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/12 6:54, Jaegeuk Kim wrote: > ATGC is using SSR
 which violates zoned device. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 > --- > fs/f2fs/super.c | 4 ++++ > 1 file changed, 4 insertio [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNQvl-002cIO-16
Subject: Re: [f2fs-dev] [PATCH] f2fs: zoned device does not support ATGC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/12 6:54, Jaegeuk Kim wrote:
> ATGC is using SSR which violates zoned device. >
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/super.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 2451623c05a7..212ec2b4926b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1298,6 +1298,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			F2FS_OPTION(sbi).discard_unit =
>   					DISCARD_UNIT_SECTION;
>   		}
> +		if (test_opt(sbi, ATGC)) {
> +			f2fs_err(sbi, "Zoned block device doesn't support ATGC.");
> +			return -EINVAL;
> +		}

ATGC is incompatible with LFS mode, we can check f2fs_lfs_mode() and ATGC
mountoption instead, as zoned device depends on LFS mode.

Thanks,

>   	}
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
