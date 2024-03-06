Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB57872C38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 02:32:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhg8q-000705-Er;
	Wed, 06 Mar 2024 01:32:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1rhg8p-0006zy-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 01:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ozuIl2z1mO5oh9A08OCRsJETbGPVwnmzxLCrSp32vgw=; b=Pp5xHEVY3qtkLnvei4IVpPbaz/
 jnRIyDvm91ZtYrTPNJbMxBA8rCjDz3PCCLu8vSxZeKq7ATNcTUfCLewijGjtFMANsi7F2mBmj8NLE
 iRhGv4ytMeqqLfIT+Cc8E5nq6cM0X15kcXY1h99PWFF9E8si052WAp385DZn1mSp4CkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ozuIl2z1mO5oh9A08OCRsJETbGPVwnmzxLCrSp32vgw=; b=M5/Uok/01BpphRYjeApXmujwMA
 vkE+a5dt9/1G9FY6V0H/7VZHYHFZiZsJyW0pu5yACJI3apomHkOVL+lsjp6sirldJ7X86YESb941u
 nCgsEhr435gIU/Obhi+z6b1C5eHrp/O6ieVt1PfHR6ZJAv2OMzFhNBh9ecm6xrk3hc04=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1rhg8i-000423-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 01:32:20 +0000
X-IronPort-AV: E=Sophos;i="6.06,207,1705334400"; d="scan'208";a="79773605"
To: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [External Mail][f2fs-dev] [PATCH] f2fs-tools: deal with
 permission denial on non-root user
Thread-Index: AQHabz6YXcg+MquUY0y8pIxDF9Ymz7EpZ5gA
Date: Wed, 6 Mar 2024 01:32:06 +0000
Message-ID: <b2ac7c04-7fef-4b0f-b8f7-fe0a6130f9b7@xiaomi.com>
References: <20240305204834.101697-1-jaegeuk@kernel.org>
In-Reply-To: <20240305204834.101697-1-jaegeuk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.8.11]
Content-ID: <C4D3386AC2672E41884DC08F716E1E6E@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Reviewed-by: Huang Jianan <huangjianan@xiaomi.com> Thanks.
 On 2024/3/6 4:48, Jaegeuk Kim wrote: > This fixes some android build failures
 due to the missing permission when > checking the loop device. Until we get
 a better solution, let's ignore > the error wi [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [118.143.206.90 listed in wl.mailspike.net]
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rhg8i-000423-G2
Subject: Re: [f2fs-dev] [External Mail] [PATCH] f2fs-tools: deal with
 permission denial on non-root user
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
From: =?utf-8?B?6buE5L2z55S3?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6buE5L2z55S3?= <huangjianan@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Reviewed-by: Huang Jianan <huangjianan@xiaomi.com>

Thanks.


On 2024/3/6 4:48, Jaegeuk Kim wrote:
> This fixes some android build failures due to the missing permission when
> checking the loop device. Until we get a better solution, let's ignore
> the error with warnings.
>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   lib/libf2fs.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index d51e485361ee..1cfbf31a9c85 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -854,9 +854,15 @@ int f2fs_dev_is_umounted(char *path)
>
>                          loop_fd = open(mnt->mnt_fsname, O_RDONLY);
>                          if (loop_fd < 0) {
> +                               /* non-root users have no permission */
> +                               if (errno == EPERM || errno == EACCES) {
> +                                       MSG(0, "Info: open %s failed errno:%d - be careful to overwrite a mounted loopback file.\n",
> +                                                       mnt->mnt_fsname, errno);
> +                                       return 0;
> +                               }
>                                  MSG(0, "Info: open %s failed errno:%d\n",
> -                                       mnt->mnt_fsname, errno);
> -                               return -1;
> +                                                       mnt->mnt_fsname, errno);
> +                               return -errno;
>                          }
>
>                          err = ioctl(loop_fd, LOOP_GET_STATUS64, &loopinfo);
> @@ -864,7 +870,7 @@ int f2fs_dev_is_umounted(char *path)
>                          if (err < 0) {
>                                  MSG(0, "\tError: ioctl LOOP_GET_STATUS64 failed errno:%d!\n",
>                                          errno);
> -                               return -1;
> +                               return -errno;
>                          }
>
>                          if (st_buf.st_dev == loopinfo.lo_device &&
> --
> 2.44.0.278.ge034bb2e1d-goog
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
