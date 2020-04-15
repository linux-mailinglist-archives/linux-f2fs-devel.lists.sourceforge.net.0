Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BE1A932F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 08:23:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jObSh-00031O-Aw; Wed, 15 Apr 2020 06:23:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jObSg-00031B-4S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 06:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MuJiH2bhhlo6rPUrcO7429Wb4s/wQMy9po1a6VYwVGo=; b=L21cSO3YsPiiUFFO5oJcyp+MUA
 fpEw00Un8CdeSQiyZzZ7tmreZcxAGMgaEX72gv5av+DnPNyN/ePAJ65h/AVo7p+ATFlmlGfV6QIyg
 RNyG3Q/tJFSQmOnWVFvFpXfv2jUuguFnExKADj2BGOHp3xx+NM2TrEHJ3IKxWr2kBTrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MuJiH2bhhlo6rPUrcO7429Wb4s/wQMy9po1a6VYwVGo=; b=Od2jp5i+li8XSXWmD7tCqh3Vb3
 U813jm75OcR5MbCVPfr8xyZ5ExbdDQLhvsWC+xjDKDbHKlcZ3FgQGpbg5IVeOhVj+ULA9hWOZPYb0
 QP5p+MGvVwaqt7M4ggJ4LZMVXZrMS09kjll0jHGfPksfEcqmLxAVrEJvyzM2kQ1Pzf0o=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jObSa-00H0eu-NL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 06:23:50 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 453A789B8D94E31EB935;
 Wed, 15 Apr 2020 14:23:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Apr
 2020 14:23:29 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200413161649.38177-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <838f483d-377f-e60e-5ffe-cf52b913f294@huawei.com>
Date: Wed, 15 Apr 2020 14:23:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200413161649.38177-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jObSa-00H0eu-NL
Subject: Re: [f2fs-dev] [PATCH] f2fs: add tracepoint for f2fs iostat
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/4/14 0:16, Jaegeuk Kim wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a tracepoint to see iostat of f2fs. Default period of that
> is 3 second. This tracepoint can be used to be monitoring
> I/O statistics periodically.
> 
> Bug: 152162885
> Change-Id: I6fbe010b9cf1a90caa0f4793a6dab77c4cba7da6

It needs to be removed?

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h              | 10 ++++++-
>  fs/f2fs/sysfs.c             | 34 ++++++++++++++++++++++++
>  include/trace/events/f2fs.h | 52 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c2788738aa0d4..87baa09f76fb2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2999,16 +2999,22 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
>  		sizeof((f2fs_inode)->field))			\
>  		<= (F2FS_OLD_ATTRIBUTE_SIZE + (extra_isize)))	\
>  
> +extern unsigned long long f2fs_prev_iostat[NR_IO_TYPE];
> +
>  static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>  {
>  	int i;
>  
>  	spin_lock(&sbi->iostat_lock);
> -	for (i = 0; i < NR_IO_TYPE; i++)
> +	for (i = 0; i < NR_IO_TYPE; i++) {
>  		sbi->write_iostat[i] = 0;
> +		f2fs_prev_iostat[i] = 0;
> +	}
>  	spin_unlock(&sbi->iostat_lock);
>  }
>  
> +extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
> +
>  static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>  			enum iostat_type type, unsigned long long io_bytes)
>  {
> @@ -3022,6 +3028,8 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>  			sbi->write_iostat[APP_WRITE_IO] -
>  			sbi->write_iostat[APP_DIRECT_IO];
>  	spin_unlock(&sbi->iostat_lock);
> +
> +	f2fs_record_iostat(sbi);
>  }
>  
>  #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index aeebfb5024a22..f34cb75cd039c 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -15,6 +15,7 @@
>  #include "f2fs.h"
>  #include "segment.h"
>  #include "gc.h"
> +#include <trace/events/f2fs.h>
>  
>  static struct proc_dir_entry *f2fs_proc_root;
>  
> @@ -751,6 +752,39 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
>  	return 0;
>  }
>  
> +static const unsigned long period_ms = 3000;
> +static unsigned long next_period;
> +unsigned long long f2fs_prev_iostat[NR_IO_TYPE] = {0};

These various should be per sbi, otherwise stats from different image could
be interrupt others'.

Thanks,

> +
> +static DEFINE_SPINLOCK(iostat_lock);
> +
> +void f2fs_record_iostat(struct f2fs_sb_info *sbi)
> +{
> +	unsigned long long iostat_diff[NR_IO_TYPE];
> +	int i;
> +
> +	if (time_is_after_jiffies(next_period))
> +		return;
> +
> +	/* Need double check under the lock */
> +	spin_lock(&iostat_lock);
> +	if (time_is_after_jiffies(next_period)) {
> +		spin_unlock(&iostat_lock);
> +		return;
> +	}
> +	next_period = jiffies + msecs_to_jiffies(period_ms);
> +	spin_unlock(&iostat_lock);
> +
> +	spin_lock(&sbi->iostat_lock);
> +	for (i = 0; i < NR_IO_TYPE; i++) {
> +		iostat_diff[i] = sbi->write_iostat[i] - f2fs_prev_iostat[i];
> +		f2fs_prev_iostat[i] = sbi->write_iostat[i];
> +	}
> +	spin_unlock(&sbi->iostat_lock);
> +
> +	trace_f2fs_iostat(sbi, iostat_diff);
> +}
> +
>  static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
>  					       void *offset)
>  {
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index d97adfc327f03..e78c8696e2adc 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1812,6 +1812,58 @@ DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
>  	TP_ARGS(inode, cluster_idx, compressed_size, ret)
>  );
>  
> +TRACE_EVENT(f2fs_iostat,
> +
> +	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat),
> +
> +	TP_ARGS(sbi, iostat),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,	dev)
> +		__field(unsigned long long,	app_dio)
> +		__field(unsigned long long,	app_bio)
> +		__field(unsigned long long,	app_wio)
> +		__field(unsigned long long,	app_mio)
> +		__field(unsigned long long,	fs_dio)
> +		__field(unsigned long long,	fs_nio)
> +		__field(unsigned long long,	fs_mio)
> +		__field(unsigned long long,	fs_gc_dio)
> +		__field(unsigned long long,	fs_gc_nio)
> +		__field(unsigned long long,	fs_cp_dio)
> +		__field(unsigned long long,	fs_cp_nio)
> +		__field(unsigned long long,	fs_cp_mio)
> +		__field(unsigned long long,	fs_discard)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev		= sbi->sb->s_dev;
> +		__entry->app_dio	= iostat[APP_DIRECT_IO];
> +		__entry->app_bio	= iostat[APP_BUFFERED_IO];
> +		__entry->app_wio	= iostat[APP_WRITE_IO];
> +		__entry->app_mio	= iostat[APP_MAPPED_IO];
> +		__entry->fs_dio		= iostat[FS_DATA_IO];
> +		__entry->fs_nio		= iostat[FS_NODE_IO];
> +		__entry->fs_mio		= iostat[FS_META_IO];
> +		__entry->fs_gc_dio	= iostat[FS_GC_DATA_IO];
> +		__entry->fs_gc_nio	= iostat[FS_GC_NODE_IO];
> +		__entry->fs_cp_dio	= iostat[FS_CP_DATA_IO];
> +		__entry->fs_cp_nio	= iostat[FS_CP_NODE_IO];
> +		__entry->fs_cp_mio	= iostat[FS_CP_META_IO];
> +		__entry->fs_discard	= iostat[FS_DISCARD];
> +	),
> +
> +	TP_printk("dev = (%d,%d), "
> +		"app [write=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
> +		"fs [data=%llu, node=%llu, meta=%llu, discard=%llu], "
> +		"gc [data=%llu, node=%llu], "
> +		"cp [data=%llu, node=%llu, meta=%llu]",
> +		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
> +		__entry->app_bio, __entry->app_mio, __entry->fs_dio,
> +		__entry->fs_nio, __entry->fs_mio, __entry->fs_discard,
> +		__entry->fs_gc_dio, __entry->fs_gc_nio, __entry->fs_cp_dio,
> +		__entry->fs_cp_nio, __entry->fs_cp_mio)
> +);
> +
>  #endif /* _TRACE_F2FS_H */
>  
>   /* This part must be outside protection */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
