Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2DC17FF4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 03:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHwq42tVsqAXm2LQioZIAyK9pvICFSoSTYqGK8mgsQU=; b=fWnY3/hdv8AjsY9XHc/8OGQt+j
	34dPnmmKH2rwcxmSuJSWiq1zrS+43RckVIa5EOb3AsMWPZEevkEWoh9FOXvzSk2tq6Dcvg80ScxZ5
	omfr7Ptmc6JzkMYzoaj795BDYwouoFkZvVhHwYfKHEzJcIA+LuLGhAmvwwB78clZC70c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDvZs-0001Bb-Sw;
	Wed, 29 Oct 2025 02:06:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDvZr-0001BU-Gy
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 02:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fpBRCcV2lwsij/XjEPUSEgREQa6yvrwqwvB3y7ewtcg=; b=K4Nrhgy66FNm4StJZMpzjNxSIb
 XaxEpHj93NSPuaaUhurLiWtK2QgzP+GoJNIkXgOiEkv95KWeSRcKxmYi83rLYgsjVGNMJEW7h4jlF
 pmsO7+/3yMC9ymXVdeZOkSnJolLuSeSJmagtTTDFdRtP14pgKE8aDB8Uh/jt4a2i8wg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fpBRCcV2lwsij/XjEPUSEgREQa6yvrwqwvB3y7ewtcg=; b=gn13M5StHHVsvijPJs1RuItycE
 PXyXDLYqmzVEstFdUv7drOG/1H1GVXXn7uPUD56ltAARz/TL/9SITpmPgDMXLPbTQS0SSt4siPF0s
 ZRlRaH4g4wQjAQpSEcoSmffLa4O9p7kxxf1bEzWux8RqERBQeHd6kq+yWvBXOVp6urC0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDvZq-0003XT-PR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 02:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B7C7602BE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 02:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053AEC4CEE7;
 Wed, 29 Oct 2025 02:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761703567;
 bh=HMC9j24US+EH/znFASuxf00dXnERjTr7097s6hS7xqE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HYJPfHMH70x0ReVPqAR/fHtQRwR/8jEg24hQjp06TxfiGlxO/G0AVGZFcCg1WXkxu
 SiQtAKO4wMYXUJhiVirVBBCAZfnGHKSAeK2u9Q7KaUyc8dN4zQmCKnnlkdI1Zu/Cqe
 H1U1+9OT4HU4T+MKFTP9AekfYDD88GUJjiBIKPktd1gl8MBMgwfRg689h8Uyr3rq3k
 /rCPbX9XXsq5P+diQn1MBf7rfgqS6zMkzE34EQaILNR79zaYnNtlGiZXeYDl5A2yhW
 4+atRnSc+F+sqpkpUytWO4Jto9GidmdWrgyIJy6aD8v5Ww8LHKk9NlwRACVyPdLY5d
 ykvrP5k3tXZ0g==
Message-ID: <81602674-b9f4-4ab2-91f5-0afc762e7cc6@kernel.org>
Date: Wed, 29 Oct 2025 10:06:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251028195444.3181203-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251028195444.3181203-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This adds a tracepoint in the fadvise call path. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> > --- > fs/f2fs/file.c | 2 ++ > includ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDvZq-0003XT-PR
Subject: Re: [f2fs-dev] [PATCH] f2fs: add fadvise tracepoint
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This adds a tracepoint in the fadvise call path.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c              |  2 ++
>  include/trace/events/f2fs.h | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6d42e2d28861..4a81089c5df3 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5288,6 +5288,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>  	struct inode *inode = file_inode(filp);
>  	int err;
>  
> +	trace_f2fs_fadvise(inode, offset, len, advice);
> +
>  	if (advice == POSIX_FADV_SEQUENTIAL) {
>  		if (S_ISFIFO(inode->i_mode))
>  			return -ESPIPE;
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index edbbd869078f..b7f5317b5980 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -586,6 +586,38 @@ TRACE_EVENT(f2fs_file_write_iter,
>  		__entry->ret)
>  );
>  
> +TRACE_EVENT(f2fs_fadvise,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int advice),
> +
> +	TP_ARGS(inode, offset, len, advice),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,	dev)
> +		__field(ino_t,	ino)
> +		__field(loff_t, size)
> +		__field(loff_t,	offset)
> +		__field(loff_t,	len)
> +		__field(int,	advice)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev	= inode->i_sb->s_dev;
> +		__entry->ino	= inode->i_ino;
> +		__entry->size	= inode->i_size;

__entry->size = i_size_read(inode)?

Thanks,

> +		__entry->offset	= offset;
> +		__entry->len	= len;
> +		__entry->advice	= advice;
> +	),
> +
> +	TP_printk("dev = (%d,%d), ino = %lu, i_size = %lld offset:%llu, len:%llu, advise:%d",
> +		show_dev_ino(__entry),
> +		(unsigned long long)__entry->size,
> +		__entry->offset,
> +		__entry->len,
> +		__entry->advice)
> +);
> +
>  TRACE_EVENT(f2fs_map_blocks,
>  	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int flag,
>  		 int ret),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
