Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E55AD7FB7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 02:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dllg3Mal45PHEvSV3521qC3kEy0v6nPkzGSYWnZA4Bs=; b=c9Lq+Z1YK2GFUIV8J0emC3ZvLZ
	lazgedjurdSLq07x0uodwrot83kN2zHfVF/G7IcIwFEKnlCRA0NKA8kRp//EYbs1XbDpo858Lv/ul
	26TfUs+rQvgzfi0YFdZBUgxx/y1dsYgpmRPjGiaJJGftNIGuWt/Hbk8zMkXt4pGrm00Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPsaJ-0004Od-44;
	Fri, 13 Jun 2025 00:47:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPsaH-0004OX-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 00:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hZa7TR2gLUi7Nh355mw1GrOzcQO6dxzrEO6YJrCh0PY=; b=hQGXK7yFepM/hvOPZY0xY+AcH0
 m4l8Qk/6aNL0qKMFCwvDLVOFoH6xTp/9RC0yOjvV5DT4xvE9UOg3Zhab+Emk+3fTxioo8ct7FFRsk
 DEWivpTgbWJAindZM9/UIioJxDq8305RV6jzu9R1b6SXQRgwBVyomtAxPkqPtzUeXlOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hZa7TR2gLUi7Nh355mw1GrOzcQO6dxzrEO6YJrCh0PY=; b=VRAujCNEd/e4QsYnpGpO3rurGp
 Xt9LqMtHu2YfJXsjUqKBH8uSSzlE2oib4PY9rb67K3LfcYoqHLK4NfiPEwiItFTY8ZbGY4j2tGvJZ
 hqA3ku5Ei3da9oqHi0hlsgtvk1e8cTSI3SOjpv0lOHgDFfy+MWiqITRFSu3NlcRaYdZc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPsaG-0006Cg-N7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 00:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D1ECA629D7;
 Fri, 13 Jun 2025 00:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CC8C4CEEA;
 Fri, 13 Jun 2025 00:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749775661;
 bh=FcwAaUnFzLm16huHjizGe95MQwCLo8XGRMUUruWoPVg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HWHdOwG5fGCvoZ49mhZwo4E9DXck8Oz8r0w31CBPt18AjO4MpfcIrFxRWBhve3lP9
 cmyVSDOLrvV5NbRPF2jP8b9fbEXnFecMlRvcDapqsejU8Bi/avxo0LipQUmFEymapS
 YD6V3mzWB5FvhN8C1Y/OzqLCNx+pgFcTlT81jHl73iYHMHkJDkfiw00+Zqstcpldkm
 sAqEBgKVy+zZ++1xyI77WmMgvA8BGYsEdJP+jex+u7ueRTHFjnHgX/58JtrwxraOUh
 spQFP35GxU6O8gfhey8/LwW+5aguAflbQAuF9RL4HxRqA6KX1YH2y+lvg9mNGIr6ub
 ighIGGihzzCYw==
Message-ID: <b3ecfa66-31c4-435e-918b-097c385848bf@kernel.org>
Date: Fri, 13 Jun 2025 08:47:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250611233706.572784-1-chullee@google.com>
 <20250611233706.572784-3-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250611233706.572784-3-chullee@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/12 7:37,
 Daniel Lee wrote: > Apply the `ioprio_hint`
 to set `F2FS_IOPRIO_WRITE` priority > on files identified as "hot" at creation
 and on files that are > pinned via ioctl. > > Signed-off-b [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPsaG-0006Cg-N7
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: use ioprio hint for hot and pinned
 files
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/12 7:37, Daniel Lee wrote:
> Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
> on files identified as "hot" at creation and on files that are
> pinned via ioctl.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>   fs/f2fs/f2fs.h  | 21 +++++++++++++++++++++
>   fs/f2fs/file.c  |  3 +++
>   fs/f2fs/namei.c | 11 +++++++----
>   3 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 162d79a3c1a5..0b05b3b6386b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3441,6 +3441,27 @@ static inline void set_file(struct inode *inode, int type)
>   	f2fs_mark_inode_dirty_sync(inode, true);
>   }
>   
> +static inline int get_ioprio(struct inode *inode)
> +{
> +	return F2FS_I(inode)->ioprio_hint;
> +}
> +
> +static inline void set_ioprio(struct inode *inode, int level)
> +{
> +	if (get_ioprio(inode) == level)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = level;
> +	f2fs_mark_inode_dirty_sync(inode, true);

We don't need to mark inode dirty? IIRC, .ioprio_hint is just in-memory variable?

> +}
> +
> +static inline void clear_ioprio(struct inode *inode)
> +{
> +	if (get_ioprio(inode) == 0)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = 0;
> +	f2fs_mark_inode_dirty_sync(inode, true);

Ditto,

> +}
> +
>   static inline void clear_file(struct inode *inode, int type)
>   {
>   	if (!is_file(inode, type))
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4fd45e94661a..95a3b4b59dd1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   
>   	if (!pin) {
>   		clear_inode_flag(inode, FI_PIN_FILE);
> +		clear_ioprio(inode);
>   		f2fs_i_gc_failures_write(inode, 0);
>   		goto done;
>   	} else if (f2fs_is_pinned_file(inode)) {
> @@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   	}
>   
>   	set_inode_flag(inode, FI_PIN_FILE);
> +	file_set_hot(inode);
> +	set_ioprio(inode, F2FS_IOPRIO_WRITE);
>   	ret = F2FS_I(inode)->i_gc_failures;
>   done:
>   	f2fs_update_time(sbi, REQ_TIME);
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 07e333ee21b7..0f96a0b86c40 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   }
>   
>   /*
> - * Set file's temperature for hot/cold data separation
> + * Set file's temperature (for hot/cold data separation) and
> + * I/O priority, based on filename extension
>    */
> -static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
> +static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
>   		const unsigned char *name)
>   {
>   	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> @@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>   
>   	if (i < cold_count)
>   		file_set_cold(inode);
> -	else
> +	else {
>   		file_set_hot(inode);
> +		set_ioprio(inode, F2FS_IOPRIO_WRITE);
> +	}
>   }
>   
>   static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
> @@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>   		set_inode_flag(inode, FI_INLINE_DATA);
>   
>   	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
> -		set_file_temperature(sbi, inode, name);
> +		set_file_temp_prio(sbi, inode, name);
>   
>   	stat_inc_inline_xattr(inode);
>   	stat_inc_inline_inode(inode);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
