Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581F3EB6F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 16:45:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEYR0-00062h-Cs; Fri, 13 Aug 2021 14:45:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mEYQm-00060j-15
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 14:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LmltiUIIVTOfKyuJuVmdGP2MVfnfIJerGvUQaFD17Xc=; b=OuRAUjzmelc+7ltYApCLonj5Zf
 iXa/qtoQnetOtu/8x/PuXb2Auo89UhJpnszP+xxLfHp3Ijf7IzSehUWOSJvMYMYvwRDdoP/Yjtpgj
 pyRElOJWC1UnUD6upoRleyV9ncOkL37Miaizub26fI6DnAn1gnzCYHDAPzgqMpKINIKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LmltiUIIVTOfKyuJuVmdGP2MVfnfIJerGvUQaFD17Xc=; b=FfdUcOQOWVEIv5o0JSPvBUShUV
 jfO/2R5oGi0iOwa2NZRgqRqjW+ICkFwicombizwLJJHE+e7qp8rGHZgDBoxD2B4nKDCjxHawjh6pv
 ECgQ0TDZLF5xfOzevEovxPzAoR9QOiZUhrJwo65MVFduLC14LV2UGZzW42Yaq0bJ1PrY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEYQd-005G6a-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 14:45:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDB4460C41;
 Fri, 13 Aug 2021 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628865892;
 bh=5leq8kE0+YWfDReXgUKHmWcBXZjTix6mSjdCruwc/hc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uHncfYNkIPFZjqoEC32dZD04Xq/OzMmnsZodq3Jc3s2/1snq+f0Zq1aBPLfez2hQ2
 5UJDATDVjVriYqvmefBCbfMY4A9E6qe7NEXp8nlkoGFYrhzAUxaBvMCnnuEq670Djo
 iaLwvXEcmSkVIcrTxNGNA8m/L3r3GD7AlNSOSmVg6/Pf61tXuYZ6FiOPMWcUMWeMwo
 MkEt06nEneAVwNM5vZksjScIuhAWMA1Ycgq6fi41oHQjkNVtk2R/QqxTowBH9sCk6k
 6QwWwm3BQXNVHvXkWw+1XfZ+/pEYUjVowV+fhHqr86XImv2jZ2Id6uXOCOLcZTrzdm
 uUO5D0fQLfV3Q==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210813123221.185591-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <0cc57cc5-33b1-cc00-58a4-fce8de22aa35@kernel.org>
Date: Fri, 13 Aug 2021 22:44:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210813123221.185591-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEYQd-005G6a-Vk
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: introduce
 proc/fs/f2fs/<dev>/fsck_stack node
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

On 2021/8/13 20:32, Yangtao Li wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
> this flag is set in too many places. For some scenes that are not very
> reproducible, adding stack information will help locate the problem.
> 
> Let's expose all fsck stack history in procfs.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v5:
> -fix implicit declaration of function 'stack_trace_save'
>   fs/f2fs/f2fs.h  | 34 +++++++++++++++++++++++++++++++++-
>   fs/f2fs/sysfs.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 67faa43cc141..cbd06dea3c6a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -24,6 +24,8 @@
>   #include <linux/quotaops.h>
>   #include <linux/part_stat.h>
>   #include <crypto/hash.h>
> +#include <linux/stackdepot.h>
> +#include <linux/stacktrace.h>
>   
>   #include <linux/fscrypt.h>
>   #include <linux/fsverity.h>
> @@ -119,6 +121,8 @@ typedef u32 nid_t;
>   
>   #define COMPRESS_EXT_NUM		16
>   
> +#define FSCK_STACK_DEPTH 64
> +
>   struct f2fs_mount_info {
>   	unsigned int opt;
>   	int write_io_size_bits;		/* Write IO size bits */
> @@ -1786,6 +1790,8 @@ struct f2fs_sb_info {
>   	unsigned int compress_watermark;	/* cache page watermark */
>   	atomic_t compress_page_hit;		/* cache hit count */
>   #endif
> +	depot_stack_handle_t *fsck_stack;
> +	unsigned int fsck_count;
>   };
>   
>   struct f2fs_private_dio {
> @@ -1997,9 +2003,35 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>   	return test_bit(type, &sbi->s_flag);
>   }
>   
> -static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
> +static void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>   {
>   	set_bit(type, &sbi->s_flag);
> +
> +	if (unlikely(type ==  SBI_NEED_FSCK)) {

Hmm... I don't know what to say...

> +		unsigned long entries[FSCK_STACK_DEPTH];
> +		depot_stack_handle_t stack, *new;
> +		unsigned int nr_entries;
> +		int i;
> +
> +		nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
> +		nr_entries = filter_irq_stacks(entries, nr_entries);
> +		stack = stack_depot_save(entries, nr_entries, GFP_KERNEL);
> +		if (!stack)
> +			return;
> +
> +		/* Try to find an existing entry for this backtrace */
> +		for (i = 0; i < sbi->fsck_count; i++)
> +			if (sbi->fsck_stack[i] == stack)

stack need to be released here?

> +				return;
> +
> +		new = krealloc(sbi->fsck_stack, (sbi->fsck_count + 1) *
> +			       sizeof(*sbi->fsck_stack), GFP_KERNEL);
> +		if (!new)

Ditto?

> +			return;
> +
> +		sbi->fsck_stack = new;

Need to be released somewhere.

> +		sbi->fsck_stack[sbi->fsck_count++] = stack;

Need to be released somewhere.

> +	}
>   }
>   
>   static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 0954761341d7..c134bbb99c7b 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1171,6 +1171,29 @@ static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
>   	return 0;
>   }
>   
> +static int __maybe_unused fsck_stack_seq_show(struct seq_file *seq,
> +						void *offset)
> +{
> +	struct super_block *sb = seq->private;
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	unsigned long *entries;
> +	unsigned int nr_entries;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < sbi->fsck_count; i++) {
> +		nr_entries = stack_depot_fetch(sbi->fsck_stack[i], &entries);
> +		if (!entries)
> +			return 0;
> +
> +		for (j = 0; j < nr_entries; j++)
> +			seq_printf(seq, "%pS\n", (void *)entries[j]);
> +
> +		seq_putc(seq, '\n');
> +	}
> +
> +	return 0;
> +}
> +
>   static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
>   						void *offset)
>   {
> @@ -1261,6 +1284,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>   				iostat_info_seq_show, sb);
>   		proc_create_single_data("victim_bits", S_IRUGO, sbi->s_proc,
>   				victim_bits_seq_show, sb);
> +		proc_create_single_data("fsck_stack", S_IRUGO, sbi->s_proc,
> +				fsck_stack_seq_show, sb);
>   	}
>   	return 0;
>   put_feature_list_kobj:
> @@ -1282,6 +1307,7 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
>   		remove_proc_entry("segment_info", sbi->s_proc);
>   		remove_proc_entry("segment_bits", sbi->s_proc);
>   		remove_proc_entry("victim_bits", sbi->s_proc);
> +		remove_proc_entry("fsck_stack", sbi->s_proc);
>   		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
>   	}
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
