Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57394FC6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 05:51:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdiYs-0001c3-Mp;
	Tue, 13 Aug 2024 03:51:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdiYZ-0001bb-A5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 03:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIiFXpop4XpkZOJv+UdVhwmXwfrGHRDJ99Y/ME8pIDo=; b=HgZVIgS+qKpeQ/xGbcJqYDKKUh
 WQokVKmZXsMv6gSrMA8/uATr68jpxtu3JVFVOvCRcNZQ7+9kTDgl5PLTAy0SxtG43rKPRC4KmI7F5
 m2jQC6j+cn1WATeoXKjKD9r7IHG/Rz+VknA+s0JVzEnIcphYqKx0qrSkWbh9FMyT9IyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mIiFXpop4XpkZOJv+UdVhwmXwfrGHRDJ99Y/ME8pIDo=; b=MoamRmKnYEJ8ZmfnKMRwu6YYNB
 RTh//yy28wRGE2RBdZy1Bk47xRs7nmtBbuzSAChQmJS6yGnFsoL9Q800HOaW/8Kr8cquZxVZQWiMo
 h5G5Ippvwt8OqKpTNhMbOpBEcvlNr2NXDbd9CdMTgqnzrkT5HEDpu+4pACQ9UUoYakdc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdiYX-0004LT-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 03:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1981CCE0FBB;
 Tue, 13 Aug 2024 03:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6712CC4AF09;
 Tue, 13 Aug 2024 03:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723521033;
 bh=HpdtZYHIgVKl77goaydOo9aidbpvk6Qq/wAQSe6qc7o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OP7u6ZPY7GSUWNf/vCvhyqHQtlDllJh0pJ4KfusC4V8IU3VWuhm+Vg6/Jc245AdWK
 kDXj7uxXB75Wn1BQ3xn/wW+7pVd6BVWP2mNaGwVuP9h8T6I8gnXLobWlPwpeoBUZfE
 LQL9xe3HBA+N1aSallpruLfjMgL+7s5EG5p9FIxpF68Bm5mx6R2dlo8RImUZOdaWNI
 /cGBLjEzm7TwTqz8OIpugGJhOa9hUx56TNhGwevG6qgJHJd3KY2YWT+iMdhITv08HW
 Wir7mJLaHj58Iyq6jMwWGIIkKfe2SNILVt5+Kpfn9LYnn4JuuFjWDjw6Emye2rsTeg
 U1SACqNBniI4w==
Message-ID: <e82ab6dd-f4a6-4648-a4b4-b092f2eaf2be@kernel.org>
Date: Tue, 13 Aug 2024 11:50:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roman Smirnov <r.smirnov@omp.ru>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240801071707.8296-1-r.smirnov@omp.ru>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240801071707.8296-1-r.smirnov@omp.ru>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/1 15:17, Roman Smirnov wrote: > If invalid data
 is copied from user space and if GET_SEGNO() > returns NULL_SEGNO an overflow
 is possible. Can you explain in which condition that
 FDEV(range.dev_num).start_blk
 or FDEV(range.dev_num).end_blk will be invalid? 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdiYX-0004LT-Ql
Subject: Re: [f2fs-dev] [PATCH] f2fs: file: add checks to
 f2fs_ioc_flush_device()
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
Cc: lvc-project@linuxtesting.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-kernel@vger.kernel.org, Karina Yankevich <k.yankevich@omp.ru>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/1 15:17, Roman Smirnov wrote:
> If invalid data is copied from user space and if GET_SEGNO()
> returns NULL_SEGNO an overflow is possible.

Can you explain in which condition that FDEV(range.dev_num).start_blk or
FDEV(range.dev_num).end_blk will be invalid?

 > > Add checks for invalid values.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> ---
>   fs/f2fs/file.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 168f08507004..1b9c4fee9db1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3093,6 +3093,9 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>   		start_segno = dev_start_segno;
>   	end_segno = min(start_segno + range.segments, dev_end_segno);
>   
> +	if (start_segno > F2FS_MAX_SEGMENT - range.segments || end_segno == NULL_SEGNO)
> +		return -EINVAL;

It missed to call mnt_drop_write_file() before return.

Thanks,

> +
>   	while (start_segno < end_segno) {
>   		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>   			ret = -EBUSY;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
