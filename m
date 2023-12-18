Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE6D817908
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 18:45:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFHgJ-0002vD-1y;
	Mon, 18 Dec 2023 17:45:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rFHg7-0002v6-SJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 17:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CpCOkQtAmpi+IOCCnfTfyyBC5ExF9+2rcZZYo/fY4qM=; b=CzdwGSj7tssvYQlQ2A9hPF7eth
 /97+7OcInQcFd1grlRIwfNV8jcZ+AhgmaNJmjvw1bVIFP38Nr8gmoKSybykfdFzP8SPMmPfQ0aBOp
 OigXLh1WZY+vljTGlpHiC3Ha+W6GHWPmb2w6w7du+3jS+uJtrQqrXYRdHNPdWP3/CC8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CpCOkQtAmpi+IOCCnfTfyyBC5ExF9+2rcZZYo/fY4qM=; b=HGf9SCfslg9/pFYVGHNcbTdRto
 B6QfTPryogGzSdDuekU+UlC2mU2cyYxSwHQj3p63SsIezYl1W4v1s8J9vL4Krhc0SO9Yu2lqBxKAI
 9PHaJX8r3ko4+t76u6pjxzmN7vfRPVzLjRTEluD37sqaF5wUylUVFPK1qSxePgxeGhzE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFHg6-0001wf-2r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 17:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9FB9DCE1286;
 Mon, 18 Dec 2023 17:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D23BC433C8;
 Mon, 18 Dec 2023 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702921504;
 bh=kDVkRZAYV2bjlg4876dXBiXZOhzsZ7DaqA1eePR2E2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEAoeHwMxC0sPYX6XJSjfJAfU+/8NkyaKA/DkNb41kHu+wFOQgbfGHCyQO3z+S3BE
 e32GnGhaMwrysGA9xBhZ+WQ3GU3ucUYtgPMFEGjWtUpIsqhHf3NI4sdXtAO0+nzgtW
 l4/fVdPYTK2cOpbyu3nuJTchPHB0wiiwR0QZf/hKZIJGBmIX+8e/nefLYEpvfZFSqP
 eV07W38K6MXjT+Dowf+NXOmFsJmkJyr4pu5J4+jTA0DMSlp+Xlo6J0SjqwjDFIDgd1
 w4LiQbqpehpKFVMO2t52YuDLge3iXrA2dp74IzbUvfDv52a0QlfHoITNc4sfFIGr5j
 1IovLSNIq3e9w==
Date: Mon, 18 Dec 2023 09:45:03 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Message-ID: <ZYCFH4cyjjCVbpDF@google.com>
References: <1702897676-12851-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1702897676-12851-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/18, Zhiguo Niu wrote: > The current pending_discard
 attr just only shows the discard_cmd_cnt > information. More discard status
 can be shown so that we can check > them through sysfs when needed [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFHg6-0001wf-2r
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: show more discard status by sysfs
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/18, Zhiguo Niu wrote:
> The current pending_discard attr just only shows the discard_cmd_cnt
> information. More discard status can be shown so that we can check
> them through sysfs when needed.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> changes of v2: Improve the patch according to Chao's suggestions.
> changes of v3: Add a blank line for easy reading.
> ---
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
>  fs/f2fs/sysfs.c                         | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 36c3cb5..c6970e5 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -498,6 +498,12 @@ Description:	Show status of f2fs checkpoint in real time.
>  		CP_RESIZEFS_FLAG		0x00004000
>  		=============================== ==============================
>  
> +What:		/sys/fs/f2fs/<disk>/stat/discard_status
> +Date:		November 2023
> +Contact:	"Zhiguo Niu" <zhiguo.niu@unisoc.com>
> +Description:	Show status of f2fs discard in real time, including
> +		"issued discard","queued discard" and "undiscard blocks".
> +
>  What:		/sys/fs/f2fs/<disk>/ckpt_thread_ioprio
>  Date:		January 2021
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 417fae96..312a4dc 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -134,6 +134,22 @@ static ssize_t cp_status_show(struct f2fs_attr *a,
>  	return sysfs_emit(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
>  }
>  
> +static ssize_t discard_status_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +
> +	if (!dcc)
> +		return -EINVAL;
> +
> +	return sysfs_emit(buf, "%llu, %llu, %u\n",
> +			(unsigned long long)atomic_read(
> +				&dcc->issued_discard),
> +			(unsigned long long)atomic_read(
> +				&dcc->queued_discard),
> +			dcc->undiscard_blks);

We cannot do this since it needs one value per one entry.

> +}
> +
>  static ssize_t pending_discard_show(struct f2fs_attr *a,
>  		struct f2fs_sb_info *sbi, char *buf)
>  {
> @@ -1197,9 +1213,12 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
>  
>  F2FS_GENERAL_RO_ATTR(sb_status);
>  F2FS_GENERAL_RO_ATTR(cp_status);
> +F2FS_GENERAL_RO_ATTR(discard_status);
> +
>  static struct attribute *f2fs_stat_attrs[] = {
>  	ATTR_LIST(sb_status),
>  	ATTR_LIST(cp_status),
> +	ATTR_LIST(discard_status),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs_stat);
> -- 
> 1.9.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
