Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761E95284C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2024 05:33:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seRF4-00009k-7g;
	Thu, 15 Aug 2024 03:33:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seRF2-00009V-HI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 03:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SnxMonwGy16E59HNLixndLtASc3G1QI2Ct3+b1cqRww=; b=LvCjdy/mpII5TBm1s3j6RLamQH
 GzqlGvX4mGeXuVmDRnZWYtb4DZ4z5BW1Afw+5kjDBHIaSnpftfQDJ18A3R8cp3ToynrvJYW6tunrt
 WkKGAJgq9I8eK+WzfBEKpaTsKxNGvaNDgXVPQPyXY5WiUQC8e4ZNDG8ecb1wmFicDEck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SnxMonwGy16E59HNLixndLtASc3G1QI2Ct3+b1cqRww=; b=PSFiz+Vc3JTTA7+nivyeDiecq6
 R7943E3EfIbTGXNgLj7KjTkmW9uwGaYJZkEZ7LRXtNI2WunOiV+Grh9J9z5qegt0qTRaVtIF/UKiv
 Te65Q5I5W9h+/dDDURr1vRlQrqhOsWkkdQGECTjz/e9XsioBIEMzw/kxzS3HrMy92Flc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seRF1-00019T-TB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 03:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57E9561755;
 Thu, 15 Aug 2024 03:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B0DC4AF09;
 Thu, 15 Aug 2024 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723692805;
 bh=jgpaGMcJiYk4bjwM5QRNzadECxTVVfgf4yknE8Qlxlg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tfzMrhxnWvlWyW93iKUBCaEgB5HYE+qpxv+uetB1jzLXo/zyewCvoFSyKv5Lm8GWt
 zMwYmRO6IhSXexcae6kSOyhSKDq7jyAneI5wYHZFDpdd6zZi+FS+SbYUga8zQaU1EI
 AIw3VjynF31ziqXvhBWW4z6Is8LjZsNkC7mwdupYUDkcEvqYAcqxP1m02e/VVdyoRO
 W2jlzxAAiUsBOouxHtWisNWK56nZPEC1uFhDyA4Xs0NR1oHnXtmLIMZ8r4k+6Dl1l6
 ek596UHf1fuhenwBfVzv1Kx0bBmxvKDK+Ju2xJ07S2Icavy9FtHJW9f1R+ibCe1rz1
 GQWMlAH2PtTkQ==
Message-ID: <ce74a0ac-1c64-43db-ae74-eac621982484@kernel.org>
Date: Thu, 15 Aug 2024 11:33:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CGME20240809073246epcms2p134ead07aadfe72e7e3506efc5098ad7f@epcms2p1>
 <20240809073246epcms2p134ead07aadfe72e7e3506efc5098ad7f@epcms2p1>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240809073246epcms2p134ead07aadfe72e7e3506efc5098ad7f@epcms2p1>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/9 15:32, Daejun Park wrote: > This patch enables
 support for write hints by segment type. What about adding an option to enable
 this functionality? otherwise, for a device which doesn't support whint feature,
 it will cause overhead whenever calling fcntl() syscall. 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seRF1-00019T-TB
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: add write hint support
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/9 15:32, Daejun Park wrote:
> This patch enables support for write hints by segment type.

What about adding an option to enable this functionality? otherwise,
for a device which doesn't support whint feature, it will cause
overhead whenever calling fcntl() syscall.

[snip]

> @@ -1005,7 +1005,7 @@ int get_device_info(int i)
>   #endif
>   
>   	if (!c.sparse_mode) {
> -		if (dev->zoned_model == F2FS_ZONED_HM && c.func == FSCK)
> +		if (dev->zoned_model == F2FS_ZONED_HM)

Why do we need to change the condtion?

[snip]

> -int dev_write(void *buf, __u64 offset, size_t len)
> +static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>   {
> +	bool set_whint = whint != WRITE_LIFE_NONE;
> +	u64 hint = whint;
>   	int fd;
>   
> +	fd = __get_device_fd(&offset);
> +	if (fd < 0)
> +		return fd;
> +
> +	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
> +		return -1;
> +
> +	if (set_whint)
> +		fcntl(fd, F_SET_RW_HINT, &hint);

What about keeping last hint in fd, and update it once new hint is
not same to old one?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
