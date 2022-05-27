Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3053688F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 May 2022 23:34:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nuhb0-0004Wq-Nj; Fri, 27 May 2022 21:34:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nuhaz-0004Wh-N4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 21:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jk8EPpZADNNQu6LLgsvqi7k9HYoW1V9ncRNACbABj+U=; b=GUWDYNYRgaLs5DAnIctZHXohoj
 QdNA3yF99W0ywPY3HoLlQNJrfssBKXawWVLGFs5nxWU9Z7XByUW8YqrbtEh1FYw35x/FG+6XnDZAY
 vPkflRyJi3xC4tpfmkrgaEYezwh8iTIFl4ws/BQrMyDvvkDzznzCox/ZtCHpOIvVgrFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jk8EPpZADNNQu6LLgsvqi7k9HYoW1V9ncRNACbABj+U=; b=F4d9OziPAvRzpOfh9RKiI1rBPa
 Z/gykr3RC7CUIfh2Kj6vh8uk7LfTvecr7a8l2zQT0RXansFwWdzWYus+V8YXHNIlSgXuDguNbDG2Z
 4b5nqr+kxygA+NyKf54GaTXcZfTlL+hvuEMyAkPm3zpqQIi+UJPoDutizoF+Ng6ELTkc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nuhaw-005KUW-U6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 21:34:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C70F6128E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 May 2022 21:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C07C385A9;
 Fri, 27 May 2022 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653687236;
 bh=gfujXJB2bf8jciwwiwps5AH82Rg/VMT8hb2RsJAdj5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faHHxdhtD0wc/aKhgN9YtTBdSTT/+JV2Rn1pV1aS3SS32teQJcMJ0kLlIxGgh02N9
 tidDnavnUcJAiMmvppKQIAikjejmMGpQJJK1bB8yBbCClm1/ZIXWbiMQu6FdHjWinx
 1TXuA+136++o5iNz0N2uTf6f64u+jC1oh9lvEIFqQ4gVhkpVQjrNUc2qkxkeoDF4A+
 Ud7QNmt/sAkZij3vYlrH+X48FTzxEtQPAuD9Tk/ZuHN6ttq/1+1hMag9TjakE0If0/
 s3N6SAlYelfzSI8vbisbIg6IjiXO05gXaYTVtHLUPQrfjlIB35TRXRrfq4JhoF3MX2
 yaUA1pbLPmUJQ==
Date: Fri, 27 May 2022 21:33:55 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YpFDw3mQjN1LBd2j@gmail.com>
References: <20220527205955.3251982-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527205955.3251982-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [+Cc linux-block for FUA, and linux-xfs for iomap] On Fri,
 May 27, 2022 at 01:59:55PM -0700, Jaegeuk Kim wrote: > Some UFS storage gives
 slower performance on FUA than write+cache_flush. > Let's give a way to manage
 it. > > Signed-off-by: Jaegeuk Kim [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nuhaw-005KUW-U6
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs entry to avoid FUA
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
Cc: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[+Cc linux-block for FUA, and linux-xfs for iomap]

On Fri, May 27, 2022 at 01:59:55PM -0700, Jaegeuk Kim wrote:
> Some UFS storage gives slower performance on FUA than write+cache_flush.
> Let's give a way to manage it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Should the driver even be saying that it has FUA support in this case?  If the
driver didn't claim FUA support, that would also solve this problem.

> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++
>  fs/f2fs/data.c                          | 2 ++
>  fs/f2fs/f2fs.h                          | 1 +
>  fs/f2fs/sysfs.c                         | 2 ++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 9b583dd0298b..cd96b09d7182 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -434,6 +434,7 @@ Date:		April 2020
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
>  Description:	Give a way to change iostat_period time. 3secs by default.
>  		The new iostat trace gives stats gap given the period.
> +
>  What:		/sys/fs/f2fs/<disk>/max_io_bytes
>  Date:		December 2020
>  Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> @@ -442,6 +443,12 @@ Description:	This gives a control to limit the bio size in f2fs.
>  		whereas, if it has a certain bytes value, f2fs won't submit a
>  		bio larger than that size.
>  
> +What:		/sys/fs/f2fs/<disk>/no_fua_dio
> +Date:		May 2022
> +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> +Description:	This gives a signal to iomap, which should not use FUA for
> +		direct IOs. Default: 0.

iomap is an implementation detail, so it shouldn't be mentioned in UAPI
documentation.  UAPI documentation should describe user-visible behavior only.

> +
>  What:		/sys/fs/f2fs/<disk>/stat/sb_status
>  Date:		December 2020
>  Contact:	"Chao Yu" <yuchao0@huawei.com>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f5f2b7233982..23486486eab2 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4153,6 +4153,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	if ((inode->i_state & I_DIRTY_DATASYNC) ||
>  	    offset + length > i_size_read(inode))
>  		iomap->flags |= IOMAP_F_DIRTY;
> +	if (F2FS_I_SB(inode)->no_fua_dio)
> +		iomap->flags |= IOMAP_F_DIRTY;

This is overloading the IOMAP_F_DIRTY flag to mean something other than dirty.
Perhaps this flag needs to be renamed, or a new flag should be added?

> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e10838879538..c2400ea0080b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1671,6 +1671,7 @@ struct f2fs_sb_info {
>  	int dir_level;				/* directory level */
>  	int readdir_ra;				/* readahead inode in readdir */
>  	u64 max_io_bytes;			/* max io bytes to merge IOs */
> +	int no_fua_dio;				/* avoid FUA in DIO */

Make this a bool?

> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 4c50aedd5144..24d628ca92cc 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -771,6 +771,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
>  #endif
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, no_fua_dio, no_fua_dio);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
> @@ -890,6 +891,7 @@ static struct attribute *f2fs_attrs[] = {
>  #endif
>  	ATTR_LIST(readdir_ra),
>  	ATTR_LIST(max_io_bytes),
> +	ATTR_LIST(no_fua_dio),

Where is it validated that only valid values (0 or 1) can be written to this
file?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
