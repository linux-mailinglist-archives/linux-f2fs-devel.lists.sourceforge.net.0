Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F689605A71
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 11:01:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olRQq-0005PE-Kw;
	Thu, 20 Oct 2022 09:01:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1olRQg-0005P1-G8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 09:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xb0fMQyC6wJ6bLgS2I3yNaQLgg4E+kj1V/B/Qe2t/5I=; b=HmZAw0mFVwgGYbmAjbutacKO7j
 OS+itupcQjTj6MGxw2beWGhnbcbxhaB+p/gdg0n5GONx3jeNcHbQP59QJnO5mLChoZnHB2DMLiZvV
 /wF4gVdKOQTFWcz1xUE4xMl28D8KDBPodZvTta+43v8RVp97xBkVt9eRmdklGPhBbZnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xb0fMQyC6wJ6bLgS2I3yNaQLgg4E+kj1V/B/Qe2t/5I=; b=ivuWcouFoE7ByXeHarl61aO6qk
 p6vcSO7b0zSceb3rl3U2Zcru2FKytkDQP2uvyp1hfpuRA9rvyLFR1hjKV+DfNIz8KWpNpZIe2xTER
 3ZgMiuASF40Oc3dk/qfPBl/qHhXuENseWLdLCC4AoAfUBHnCFPrPHH5MKWwY1gVt97Gs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olRQe-00AiGn-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 09:01:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40553B826AD;
 Thu, 20 Oct 2022 09:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8452CC433D7;
 Thu, 20 Oct 2022 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666256481;
 bh=L53OLp+EtSA3/Wo9g7x7vk8nFVgvWC22Aa/T6e2PStc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M3XDzlbDmMtxOYamMV21F0m6VnlwZFg0LY+wHzzdoBY8javIfionD+3iUvZhlyWBt
 AZI9QuzkDvW5hSCHnXJLYY2XwQet9dNqD0m5rLxWXjiqVp2ccTm7iEw7BlErWAg5v7
 Ds6ssvdP3jfpyssodkraSv6PP6tGHdytcUIyF6tWHPDMBS0x9S40Tf66VfHFuNHhn2
 aZ7WkAZVXViCeWEGizu38iyLVhUHPA70CPU9QM3vBH3KO1RC0nT9Wq0H4F6LNa+wQ/
 /nTG4xpSx/cpcE9emZzb/8zJzWxCPIK/+k/+ZifzVR7xn6Gu/gwTxXPk6VR2CzUDeV
 38TqdeM9oaXug==
Message-ID: <35c29f27-96c6-6d74-1efb-1588cbf430a2@kernel.org>
Date: Thu, 20 Oct 2022 17:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, jaegeuk@kernel.org,
 mhiramat@kernel.org
References: <1666196277-27014-1-git-send-email-quic_mojha@quicinc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1666196277-27014-1-git-send-email-quic_mojha@quicinc.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/20 0:17, Mukesh Ojha wrote: > commit 18ae8d12991b
 ("f2fs: show more DIO information in tracepoint") > introduces iocb field
 in 'f2fs_direct_IO_enter' trace event > And it only assigns the p [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olRQe-00AiGn-Ha
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the assign logic of iocb
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

On 2022/10/20 0:17, Mukesh Ojha wrote:
> commit 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
> introduces iocb field in 'f2fs_direct_IO_enter' trace event
> And it only assigns the pointer and later it accesses its field
> in trace print log.
> 
> Fix it by correcting data type and memcpy the content of iocb.

So the implementation below is wrong, right? since it just assign __entry->name
with dentry->d_name.name rather than copyiny entirely, so that, during printing
of tracepoint, __entry->name may be invalid.

TRACE_EVENT(f2fs_unlink_enter,

	TP_PROTO(struct inode *dir, struct dentry *dentry),

	TP_ARGS(dir, dentry),

	TP_STRUCT__entry(
		__field(dev_t,	dev)
		__field(ino_t,	ino)
		__field(loff_t,	size)
		__field(blkcnt_t, blocks)
		__field(const char *,	name)
	),

	TP_fast_assign(
		__entry->dev	= dir->i_sb->s_dev;
		__entry->ino	= dir->i_ino;
		__entry->size	= dir->i_size;
		__entry->blocks	= dir->i_blocks;
		__entry->name	= dentry->d_name.name;
	),

> 
> Fixes: 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>   include/trace/events/f2fs.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index c6b3724..7727ec9 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -940,7 +940,7 @@ TRACE_EVENT(f2fs_direct_IO_enter,
>   	TP_STRUCT__entry(
>   		__field(dev_t,	dev)
>   		__field(ino_t,	ino)
> -		__field(struct kiocb *,	iocb)
> +		__field_struct(struct kiocb,	iocb)
>   		__field(unsigned long,	len)
>   		__field(int,	rw)
>   	),
> @@ -948,17 +948,17 @@ TRACE_EVENT(f2fs_direct_IO_enter,
>   	TP_fast_assign(
>   		__entry->dev	= inode->i_sb->s_dev;
>   		__entry->ino	= inode->i_ino;
> -		__entry->iocb	= iocb;
> +		 memcpy(&__entry->iocb, iocb, sizeof(*iocb));
>   		__entry->len	= len;
>   		__entry->rw	= rw;
>   	),
>   
>   	TP_printk("dev = (%d,%d), ino = %lu pos = %lld len = %lu ki_flags = %x ki_ioprio = %x rw = %d",
>   		show_dev_ino(__entry),
> -		__entry->iocb->ki_pos,
> +		__entry->iocb.ki_pos,
>   		__entry->len,
> -		__entry->iocb->ki_flags,
> -		__entry->iocb->ki_ioprio,
> +		__entry->iocb.ki_flags,
> +		__entry->iocb.ki_ioprio,
>   		__entry->rw)
>   );
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
