Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A830BF13
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 14:12:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6vU4-0001ZT-SN; Tue, 02 Feb 2021 13:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1l6vU1-0001ZH-Rq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 13:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NuQULG8x3jxSiBq+8RF2RpV96LJQI6w5O+u5nKs5bZk=; b=HNUbZVdVLW0WFGyOirTaKWKDZS
 dlqohUUD2xudZwwPoC/R1dYclZXPGrR2iRjWhrzFmTZY44yTO9xC5nudCEw+3N4G8NoGqSstHdxWx
 BCp/2D8YSTI++3uNHAED8JYtWYC1nYrA92BTvM9qYCqzgabP+dj0jcCocw3oZdlNGITg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NuQULG8x3jxSiBq+8RF2RpV96LJQI6w5O+u5nKs5bZk=; b=abFQS+dnLKG2pq6IgDkp04vbuR
 Z/6ETZSn11iiSW1nsy6aWJiq1JxdDi0ciouWOVjMue95JLChD5fgwyDcGt3CxnqtQaDr+37xjP7lN
 vUuix1IQ36z1And3JAiirbmrDWgH2ec6oqTiJmhI0EXclwFVtHI/LJOzgQKlrsW8waO0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l6vTw-00EnPv-GU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 13:12:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 073FD64ECF;
 Tue,  2 Feb 2021 13:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612271550;
 bh=/lfW9msPfiMljbI90SDPeL/MkjF+o+FXXXbZ8mJePIc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H8nyk40jeHd1WQnsW9m3IaAukirTJqdZP7pQhgWv58ukaI8GsjgzqTMQlmZcxguE6
 DX5KACFmDXN3q35DO5tujhOYRPOrDbOoMmya8YDsCs6CKzs0+wNtepgSPFKPpi+hcU
 89GHQxBEhT4QUUg5QSXc3PvZZdDxqKMnyoJ2J+Uk4uyTsS8yc0r+Z/MaCFzhq9YDDI
 IRY5/lHqgXJDPriwljC2fqyPs7N32E577Y+HLIyi6ZuY5dQRL3bPPNjrOeXwIKZhB5
 yMrI7ErzyU9smfIqsIIyFy9wYnSljOe0GmOs98ww5xCzvgfhz7csRdme2z+uuDPXzL
 I3QKwMhRQ9byg==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210202125716.2635406-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <56d08bfe-28e3-e672-f83a-1f3da79c297b@kernel.org>
Date: Tue, 2 Feb 2021 21:12:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202125716.2635406-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6vTw-00EnPv-GU
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: rename checkpoint=merge mount
 option to checkpoint_merge
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

On 2021/2/2 20:57, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> As checkpoint=merge comes in, mount option setting related to checkpoint
> had been mixed up and it became hard to understand. So, I separated
> this option from "checkpoint=" and made another mount option
> "checkpoint_merge" for this.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: renamed "checkpoint=merge" to "checkpoint_merge"
> v3: removed "nocheckpoint_merge" option
> v4: re-added "nocheckpoint_merge" option to make it possible to disable
>      just only "checkpoint_merge" when remount
> ---
>   Documentation/filesystems/f2fs.rst |  6 +++---
>   fs/f2fs/super.c                    | 25 +++++++++++++------------
>   2 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d0ead45dc706..475994ed8b15 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -247,9 +247,9 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
>   			 hide up to all remaining free space. The actual space that
>   			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>   			 This space is reclaimed once checkpoint=enable.
> -			 Here is another option "merge", which creates a kernel daemon
> -			 and makes it to merge concurrent checkpoint requests as much
> -			 as possible to eliminate redundant checkpoint issues. Plus,
> +checkpoint_merge	 When checkpoint is enabled, this can be used to create a kernel
> +			 daemon and make it to merge concurrent checkpoint requests as
> +			 much as possible to eliminate redundant checkpoint issues. Plus,
>   			 we can eliminate the sluggish issue caused by slow checkpoint
>   			 operation when the checkpoint is done in a process context in
>   			 a cgroup having low i/o budget and cpu shares. To make this

nocheckpoint_merge?



> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 56696f6cfa86..f1791b9c1eac 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -145,6 +145,7 @@ enum {
>   	Opt_checkpoint_disable_cap_perc,
>   	Opt_checkpoint_enable,
>   	Opt_checkpoint_merge,
> +	Opt_nocheckpoint_merge,
>   	Opt_compress_algorithm,
>   	Opt_compress_log_size,
>   	Opt_compress_extension,
> @@ -215,7 +216,8 @@ static match_table_t f2fs_tokens = {
>   	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>   	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
>   	{Opt_checkpoint_enable, "checkpoint=enable"},
> -	{Opt_checkpoint_merge, "checkpoint=merge"},
> +	{Opt_checkpoint_merge, "checkpoint_merge"},
> +	{Opt_nocheckpoint_merge, "nocheckpoint_merge"},
>   	{Opt_compress_algorithm, "compress_algorithm=%s"},
>   	{Opt_compress_log_size, "compress_log_size=%u"},
>   	{Opt_compress_extension, "compress_extension=%s"},
> @@ -946,6 +948,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		case Opt_checkpoint_merge:
>   			set_opt(sbi, MERGE_CHECKPOINT);
>   			break;
> +		case Opt_nocheckpoint_merge:
> +			clear_opt(sbi, MERGE_CHECKPOINT);
> +			break;
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   		case Opt_compress_algorithm:
>   			if (!f2fs_sb_has_compression(sbi)) {
> @@ -1142,12 +1147,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		return -EINVAL;
>   	}
>   
> -	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
> -			test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
> -		return -EINVAL;
> -	}
> -
>   	/* Not pass down write hints if the number of active logs is lesser
>   	 * than NR_CURSEG_PERSIST_TYPE.
>   	 */
> @@ -1782,7 +1781,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   		seq_printf(seq, ",checkpoint=disable:%u",
>   				F2FS_OPTION(sbi).unusable_cap);
>   	if (test_opt(sbi, MERGE_CHECKPOINT))
> -		seq_puts(seq, ",checkpoint=merge");
> +		seq_puts(seq, ",checkpoint_merge");

else
	seq_puts(seq, ",nocheckpoint_merge");

Thanks,

>   	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
>   		seq_printf(seq, ",fsync_mode=%s", "posix");
>   	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> @@ -2066,9 +2065,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		}
>   	}
>   
> -	if (!test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_stop_ckpt_thread(sbi);
> -	} else {
> +	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
>   		err = f2fs_start_ckpt_thread(sbi);
>   		if (err) {
>   			f2fs_err(sbi,
> @@ -2076,6 +2074,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   			    err);
>   			goto restore_gc;
>   		}
> +	} else {
> +		f2fs_stop_ckpt_thread(sbi);
>   	}
>   
>   	/*
> @@ -3831,7 +3831,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   
>   	/* setup checkpoint request control and start checkpoint issue thread */
>   	f2fs_init_ckpt_req_control(sbi);
> -	if (test_opt(sbi, MERGE_CHECKPOINT)) {
> +	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
>   		err = f2fs_start_ckpt_thread(sbi);
>   		if (err) {
>   			f2fs_err(sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
