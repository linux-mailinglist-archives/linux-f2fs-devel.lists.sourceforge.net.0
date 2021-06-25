Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 794553B3B5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jun 2021 05:57:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lwcxY-0001Fu-Gc; Fri, 25 Jun 2021 03:56:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lwcxX-0001Fj-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Jun 2021 03:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JkuHaBNLH41ocU/skDni9hXN4JByaBj6uspbaoBlVSo=; b=HqC5is8HvDNSbpXDZqVk1z5n5z
 B02/qRvR2BAekiFd4SdUfHtAEekN13UtGJHrbTY1iq0HQtKFyo3lIashkicLZmYryGsLybOycTvtc
 1su85prs9nYTpjfEOfe5fMMv5MlAR46bkUcMtd9R4x5hFze6Hqb3aJukduhVtJ57A7m4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JkuHaBNLH41ocU/skDni9hXN4JByaBj6uspbaoBlVSo=; b=mqJD81PK7B7iaIUeTwOQYwwDFL
 HMj5dCjluXmyGOHA6VpD/TT73odgoWTmRaKV1gb3no1EGunidV39o9Kus2f8pGiFZ0gIhKBzNjdM6
 pXKdPdkZ9RGe5eCnKxHQ4jY8wnEFckr+jnU3L4jAeEmTUwIEd/p4yHYn5UhnpWSpMyXQ=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lwcxP-0001Zv-36
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Jun 2021 03:56:54 +0000
DKIM-Signature: a=rsa-sha256;
 b=KQc/EBAIHYvUzia6F+H9FlSmILeiH53kyXp9UwvtNKVH9bNVr3OwQw1eEqvvd740vMItU+DhjKBxhvktMjKmzPF9/it6xJbz+y9dZdS9ZcWVdprsjKMShHEDfLd+010Y8qYEbw+iKBIwc3vZzjg1+G+i2LYuTFaCUPDF3c8Uc7M=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=JkuHaBNLH41ocU/skDni9hXN4JByaBj6uspbaoBlVSo=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id E3921AC0219;
 Fri, 25 Jun 2021 11:56:35 +0800 (CST)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20210622115059.24860-1-changfengnan@vivo.com>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <6bd41278-0de8-5119-6857-0478c641cf71@vivo.com>
Date: Fri, 25 Jun 2021 11:56:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622115059.24860-1-changfengnan@vivo.com>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGkMdS1ZITUlJSk9OTUsZTU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mgg6Hio*CD9DMjEBMDEuKg0u
 FBEKFAtVSlVKTUlPTkJISEJNT0pOVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBSUlNTjcG
X-HM-Tid: 0a7a414ff173b039kuuue3921ac0219
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lwcxP-0001Zv-36
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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

Hi Jaegeuk:

    FYI, I have run xfstest fast test on linux-5.13.0-rc1 + patch, no 
new failure case.

Thanks.

On 2021/6/22 19:50, Fengnan Chang wrote:
> when we overwrite the whole page in cluster, we don't need read original
> data before write, because after write_end(), writepages() can help to
> load left data in that cluster.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Acked-by: Chao Yu <yuchao0@huawei.com>
> ---
>   fs/f2fs/data.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3a01a1b50104..2aeb1196cd5f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3328,6 +3328,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
> 
>   		*fsdata = NULL;
> 
> +		if (len == PAGE_SIZE)
> +			goto repeat;
> +
>   		ret = f2fs_prepare_compress_overwrite(inode, pagep,
>   							index, fsdata);
>   		if (ret < 0) {
> --
> 2.29.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
