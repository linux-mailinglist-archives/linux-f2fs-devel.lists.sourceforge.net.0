Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB3256B40
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Aug 2020 05:24:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCDx9-0005OB-HF; Sun, 30 Aug 2020 03:24:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kCDx8-0005O0-PU
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WwyG8wfl++RUXDrvt+8gzuMtc62f5XcAiEf+rd+R4qE=; b=AozU9cdDDI+PQhjbOGrLC1pWE0
 Dl+2LQRNtc5wcfDrxSUkGkdIRkZSdQPyNqAeBfiCBXsE4yiFW7BFHS9WXbUNpaewl4W5zfKu+01cu
 0FvU+ssh9nkcqwLBBe+nvVJcE0YZ27hhii7AcUBd1j1ZGdL3bxOy64+Gav6DuliUmo/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WwyG8wfl++RUXDrvt+8gzuMtc62f5XcAiEf+rd+R4qE=; b=AKv7llW6l/ZY5m+ZRKhrgouhLI
 RBMdGSvwZUB7VljVEtAlCF9FZp/Vx6NulQfbh0nTRSSBe4A3e/AJFURtG4SEUIrSQB5ujf/OHe59k
 /yv7emMB+NzzJjouISMS5hDP2WgplmFK4tU+T7Tay17vnA/OIlpZD9KmGKCOJVjWlGRc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCDx7-0054DY-MF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:24:22 +0000
Received: from [192.168.0.108] (unknown [49.65.245.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A338204FD;
 Sun, 30 Aug 2020 03:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598757843;
 bh=T/YuBD9FNEDuwJiC7R7sKn8AsKAtuYVwKij2Pn0fWTM=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=p/mC+Ogx3eCpOFDT4IT3ER5zJKpGtqdpOu7fPod1/pNAXFHPkl4Vdc3fO+ZkBqDQX
 +ebz0UReH3rWnk18Y2DUvX7IXM8J23BO+lnm3B07NUlhyS+tuX24uaiGA5zR3e4WZ2
 0OxxsqwJ7ONdWzykp/KbMARI/f3/Lxx9aCBjJRyU=
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200828054629.583577-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
Date: Sun, 30 Aug 2020 11:23:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200828054629.583577-1-daeho43@gmail.com>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kCDx7-0054DY-MF
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent compressed file from being
 disabled after releasing cblocks
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

On 2020-8-28 13:46, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
>
> After releasing cblocks, the compressed file can be accidentally
> disabled in compression mode, since it has zero cblocks. As we are
> using IMMUTABLE flag to present released cblocks state, we can add
> IMMUTABLE state check when considering the compressed file disabling.
>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 02811ce15059..14d30740ba03 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3936,6 +3936,8 @@ static inline u64 f2fs_disable_compressed_file(struct inode *inode)
>  	if (!f2fs_compressed_file(inode))
>  		return 0;
>  	if (S_ISREG(inode->i_mode)) {
> +		if (IS_IMMUTABLE(inode))
> +			return 1;

It looks most of callers are from ioctl, should we add immutable check in f2fs 
ioctl interfaces if necessary? or I missed existed check.

Thanks,

>  		if (get_dirty_pages(inode))
>  			return 1;
>  		if (fi->i_compr_blocks)
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
