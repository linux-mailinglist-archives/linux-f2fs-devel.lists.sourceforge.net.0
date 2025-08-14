Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D810AB2597B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 04:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GMR2Z0ah4O70+2Y6l2SnvXC0BNMHvJcl1fGjNNsaUc=; b=Oh3xoqEyAFM5JCynlutG64HyVk
	riU0JrVDTYztuwTMjgPZm0Ktv2MF/9qTYDG5RspViHWcPF/C73JaUb8VaRE20A5ba3UjGtMuAZvqZ
	vACpUXnuNI8LGrvHPZLoeig4NZu25S9+1HP8XTiTrVHLDH88FK9SF6P6hqK0VSpaBLdo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umNcF-00079A-Od;
	Thu, 14 Aug 2025 02:22:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umNcF-00078y-27
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 02:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zMwYrDJZhBjUj4bgMLx2iCozJTiZBa/c9OyCZ6ZrWKY=; b=iHGeYqPaUK0NCmLwLrPDl9GFSE
 FIA6RUE5b9BCw7pyH9Yk/eSLSowNrSjq2h7+rwbF4Ip5tHZpKnCLdo/GWD32e2aGYJWpr8hPUGUCw
 iRHxWRgmtyaJmjvN3RDmeIZQLmPEhNITH8Z5M+BzbGQaZbq82Sy7hN+wOUEiOhO81yZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zMwYrDJZhBjUj4bgMLx2iCozJTiZBa/c9OyCZ6ZrWKY=; b=TNPuGADrZ933Zn6KVUm22o4Auw
 uqVeE1Tw0UWHou+u7ujTzYv+w6Pitk0bg6iG/sRUFM/dqRZdFS23z0eXJ6fZNqABg/q1hbHNo21Yq
 5JJFTW7MZOQd5LxCwTZOSQuzu0d8b+BE8vZJNCBY0CcmllOQVPZO1dqjes9zyu37l1kg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umNcF-0004Rg-A9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 02:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E13695C55B5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 02:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A22C4CEEB;
 Thu, 14 Aug 2025 02:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755138164;
 bh=34ypJRRpRao6a54n/Veipk1DcAh+opWEwlZ2ccnwB08=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cTb3lHnX4tO8kB9f2UhEvrlUpG0kyT0CGAWQI8GOOpAS1/BNOiR4vH4m4PG7Nshg6
 LbpgUtoG3wmbG44k0G7yUYxEdURMpMf4+tWf/mYzB4eOTsfTetNmlB8dekKhY9l21U
 PPpUUoAOUXCG4fGMgiQFqwV7EKZPNND/hNh1ePOvQOE5fHxRiunn5K49Ise7kICXKJ
 lQyVc2R+7SgabJaYN3TA+q6UDfjb9NbbDEoycBTZAAZh5sZvJn5nA/OmuhkjdaPBMW
 J3nCLo9JC7Sg2v3zAnk7+HKWbFbQa9eHJDkw19FGDZiEnx0F+fur19xnv/M+A5fdxb
 54fqJtUcRY5hQ==
Message-ID: <c7b8c81e-c0fe-4edf-8ad0-e10df5d80bd5@kernel.org>
Date: Thu, 14 Aug 2025 10:22:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250812235814.960924-1-jaegeuk@kernel.org>
 <aJy8KS3fLQ452d2r@google.com>
Content-Language: en-US
In-Reply-To: <aJy8KS3fLQ452d2r@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/14/25 00:24, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch introduces a proc entry to show the currently enrolled donation
 > files. > > - "File path" indicates a file. > - "Status" > a. "D [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umNcF-0004Rg-A9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: show the list of donation files
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

On 8/14/25 00:24, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch introduces a proc entry to show the currently enrolled donation
> files.
> 
> - "File path" indicates a file.
> - "Status"
>  a. "Donated" means the file is registed in the donation list by
>     fadvise(offset, length, POSIX_FADV_NOREUSE)
>  b. "Evicted" means the donated pages were reclaimed.
> - "Offset (kb)" and "Length (kb) show the registered donation range.
> - "Cached pages (kb)" shows the amount of cached pages in the inode page cache.
> 
> For example,
> 
> Donation List
>  # of files  : 2
>  File path                                              Status     Offset (kb)     Length (kb)    Cached pages (kb)
> ---
>  /local/tmp/test2                                      Donated               0         1048576              2097152
>  /local/tmp/test                                       Evicted               0         1048576              1048576
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  v2: use inode_lock|unlock_shared
>  
>  fs/f2fs/sysfs.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 1ffaf9e74ce9..9f90d1878ec6 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1769,6 +1769,68 @@ static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
>  	return 0;
>  }
>  
> +static int __maybe_unused donation_list_seq_show(struct seq_file *seq,
> +						void *offset)
> +{
> +	struct super_block *sb = seq->private;
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	struct inode *inode;
> +	struct f2fs_inode_info *fi;
> +	struct dentry *dentry;
> +	char *buf, *path;
> +	int i;
> +
> +	buf = f2fs_getname(sbi);
> +	if (!buf)
> +		return 0;
> +
> +	seq_printf(seq, "Donation List\n");
> +	seq_printf(seq, " # of files  : %u\n", sbi->donate_files);
> +	seq_printf(seq, " %-50s %10s %15s %15s %20s\n",
> +			"File path", "Status", "Offset (kb)",
> +			"Length (kb)", "Cached pages (kb)");
> +	seq_printf(seq, "---\n");
> +
> +	for (i = 0; i < sbi->donate_files; i++) {
> +		spin_lock(&sbi->inode_lock[DONATE_INODE]);
> +		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
> +			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> +			break;
> +		}
> +		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
> +					struct f2fs_inode_info, gdonate_list);
> +		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
> +		inode = igrab(&fi->vfs_inode);
> +		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> +
> +		if (!inode)
> +			continue;
> +
> +		inode_lock_shared(inode);
> +
> +		dentry = d_find_alias(inode);
> +		if (!dentry) {
> +			path = NULL;
> +		} else {
> +			path = dentry_path_raw(dentry, buf, PATH_MAX);
> +			if (IS_ERR(path))
> +				goto next;
> +		}
> +		seq_printf(seq, " %-50s %10s %15lu %15lu %20lu\n",
> +				path ? path : "<unlinked>",
> +				is_inode_flag_set(inode, FI_DONATE_FINISHED) ?
> +				"Evicted" : "Donated",
> +				fi->donate_start << (PAGE_SHIFT - 10),

It needs to avoid overflow while left shift?

(loff_t)fi->donate_start << (PAGE_SHIFT - 10)
(loff_t)(fi->donate_end + 1) << (PAGE_SHIFT - 10)
(loff_t)inode->i_mapping->nrpages << (PAGE_SHIFT - 10))

Thanks,

> +				(fi->donate_end + 1) << (PAGE_SHIFT - 10),
> +				inode->i_mapping->nrpages << (PAGE_SHIFT - 10));
> +next:
> +		inode_unlock_shared(inode);
> +		iput(inode);
> +	}
> +	f2fs_putname(buf);
> +	return 0;
> +}
> +
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
>  static int __maybe_unused inject_stats_seq_show(struct seq_file *seq,
>  						void *offset)
> @@ -1878,6 +1940,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>  				discard_plist_seq_show, sb);
>  	proc_create_single_data("disk_map", 0444, sbi->s_proc,
>  				disk_map_seq_show, sb);
> +	proc_create_single_data("donation_list", 0444, sbi->s_proc,
> +				donation_list_seq_show, sb);
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
>  	proc_create_single_data("inject_stats", 0444, sbi->s_proc,
>  				inject_stats_seq_show, sb);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
