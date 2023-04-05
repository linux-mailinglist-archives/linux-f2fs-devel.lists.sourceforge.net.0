Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5B6D728F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 04:44:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjt8G-0008KA-NF;
	Wed, 05 Apr 2023 02:44:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjt8E-0008K4-Vf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 02:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ij35UsgQFtqmUbvrmP0oqLgol9rEDxKS71bsVWjh9II=; b=hef5nMYCbjrVDYUECvCBr+HXxD
 n/t54CiBoAXKBe9YQi/VqpMZRNIj+1cMyg0j94BNcUOLxTzDA/lW35uG5bY2FSodNNvbY+IVSQpnK
 WcK0UFemoG87GFkUWJuCdBQ/f9NVSv3jc+z13wZCCR4kceyT0jjJ9p+rFc/geduR1gc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ij35UsgQFtqmUbvrmP0oqLgol9rEDxKS71bsVWjh9II=; b=d1BsGKUXxWk4oqoak1L7fNF+HJ
 1uoHAgJxJS/O4O8YLdrzIhA+IhSvpy82gk+G1XBGznwwW0YIk53MhXOGg1LC7P7+oYvizQKtqJjjf
 uMz16kc79aJcY+vYk6N1pKpQ046caxiW0TKNhqvY3ZCuTrvDH5UtJKB66nvVMfP9v9uk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjt8D-000281-Op for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 02:44:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61731638A4;
 Wed,  5 Apr 2023 02:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51673C433EF;
 Wed,  5 Apr 2023 02:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680662651;
 bh=B0fG8cDrSJuSDznhEKKjqRypY7IlcyPQWYknjOL91/U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TqDL4650iHQQ4XJgPKE6jUNLNPE07IhUmhp0txUNL9Nc6Soy58PxSjBscDuItmmzb
 QOm2cMUtVMJ3/o6kSrAFMX+RwgcddNIZtiZJPavoohuC8MFmO+tBq/SG8wD9bgiVCs
 ruFaipp0phX492gv3+yNPwyOzJniOJ04cNyMeYxBdV0bHrtciiKlrNDK4jfKxwHOXJ
 6HuXo4xAqweFzIJTv6udZ3fe/NyPRGPL3UGx//vx46L6a9YE7uCjw/iXienGwbd3HT
 EV6TrRLdE5YdL6T1ZEBeH0C3fhdaAlBwNFm2mcRerT/8Yu5c2IkhnO0YWAYnFaddFV
 fZkgcY5tAn0iw==
Message-ID: <3918411a-77fc-48d7-5b80-c4b84203a39c@kernel.org>
Date: Wed, 5 Apr 2023 10:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230331113305.77217-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230331113305.77217-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/31 19:33, Yangtao Li wrote: > Let's use sysfs_emit.
 > > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- > fs/f2fs/sysfs.c
 | 10 ++-------- > 1 file changed, 2 insertions(+), 8 deletions(- [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjt8D-000281-Op
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert to use sysfs_emit
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

On 2023/3/31 19:33, Yangtao Li wrote:
> Let's use sysfs_emit.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/sysfs.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9ddc6ee19433..2c0b2cb05a3a 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -312,19 +312,13 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   
>   	if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
>   		struct ckpt_req_control *cprc = &sbi->cprc_info;
> -		int len = 0;
>   		int class = IOPRIO_PRIO_CLASS(cprc->ckpt_thread_ioprio);
>   		int data = IOPRIO_PRIO_DATA(cprc->ckpt_thread_ioprio);
>   
> -		if (class == IOPRIO_CLASS_RT)
> -			len += scnprintf(buf + len, PAGE_SIZE - len, "rt,");
> -		else if (class == IOPRIO_CLASS_BE)
> -			len += scnprintf(buf + len, PAGE_SIZE - len, "be,");
> -		else
> +		if (class != IOPRIO_CLASS_RT && class != IOPRIO_CLASS_BE)
>   			return -EINVAL;
>   
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "%d\n", data);
> -		return len;
> +		return sysfs_emit(buf, "%s,%d\n", class == IOPRIO_CLASS_RT ? "rt" : "be", data);

Exceed 80 columns.

Thanks,

>   	}
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
