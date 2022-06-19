Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE961550A65
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 13:55:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2tWU-0006BC-A9; Sun, 19 Jun 2022 11:55:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <avi@scylladb.com>) id 1o2tWT-0006B6-Cl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 11:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O2I45PoOglfUqWYYLgh36wUEI38mqN5c3WyJELiYVrQ=; b=SaUkDbujopaL/Wwmq3KtrFyEHg
 Hx4Z1LU7hLSpaZPVg9OoBWL8o2HPlrkMvgOOcTiYZgjfVKSAT3x8LNA6LI2dJKJaia4X2ZnxZW20I
 /qoBPVP26HIWqF66dWkOMXWgDIIKXi9g8iY0txtTZVpHtpJISfl+Lms5UEu2z/3xXfXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O2I45PoOglfUqWYYLgh36wUEI38mqN5c3WyJELiYVrQ=; b=SD+F5iAzLppnQQ8e5HDc5k8e6V
 109cKamYvToCugUKyFepGrRk5LO29CZSLeRKc7t7eQugX9B3upsCsfEkDpYu77WDhZ0T+Nwmx8y7X
 MIu1WKxh2CJCfQ+jAj1OqPyteQCKCoxgw2LQMWvDxMKhHG8vNItzeVs+bDMVIxNac5WQ=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o2tWN-0001gn-Ny
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 11:55:22 +0000
Received: by mail-wm1-f52.google.com with SMTP id e5so4425270wma.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scylladb.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O2I45PoOglfUqWYYLgh36wUEI38mqN5c3WyJELiYVrQ=;
 b=CMDX7ziQVP/ELJCQ2uYixvE/VDY4gI0qJRyGZ6YhB69FGdgWsPUtuQ4ujKYUJOLfr3
 JecC5hxwQzEatbQfmcHzd4sjCyNFkj1eXcQa2IbP+NPsmH3iuu5a83ukp1hWLtrn+SDp
 8gvphAot6Kf3zSzGxxzeUfJ6pluXb1axlJWDmuKfXjXHgxmIa3Ne9GsgU811Ua2tYlrE
 OA1WN8N/jwauET/7+Xk91P+RwrybwSq+T3UMITLjpWa85tfQOfL/LK5uULCiFGPNytHq
 /qfUyy4cM4U38c3lRisTyxMFzdqTuYbve/Ij7FcakHP7u3lqBMOhVDG5RpW9uGnPMM9A
 3j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O2I45PoOglfUqWYYLgh36wUEI38mqN5c3WyJELiYVrQ=;
 b=jf4v/nFcPoTr0+mkOcu1zTNnWL9ofwaAqg+vTIiSH7hSm272S6fU/9kCEukqj9wkzB
 mAt+U5AVIF4iz6D7WWHfPd/YgO7mm/lem8xl4l8zwssALQXy/0DEXW+QuJvbqcH02wE+
 3I/BNQupB0Wkr36WyQbISAfAKwCTqU9XtQu9ILrfwEx9JULYJTIGKjlBAIj0qF1s3wQx
 5mnIRox3LgRuTPEnEgSQtR5Um1yPjKMZywnWqJkSgSUbc6SAggpszbw0hs4Kvc6LQ205
 W84Coeb71D7k3GxqnGayMcfLLwxu5zJ6xAtNvi67M4uu5z+6lGE7YKTsxzAzIRC9IFVx
 lfSQ==
X-Gm-Message-State: AJIora94o2PLdySj5dpwTt2Z9HnrQJntwrlTnh3dJOSv+U1lYFJ+txfI
 +k0zO5oF4tlb4IT7EbwBY5QTzbnYoHCbanCh
X-Google-Smtp-Source: AGRyM1sQr/+BlLCjFYp7YIL2rW66A6O7S/z7a9tjlAuS/44BkYWT2Uw8taLHxSnMG2oypjiTMj2wcg==
X-Received: by 2002:a05:600c:17cf:b0:39c:4b79:78c9 with SMTP id
 y15-20020a05600c17cf00b0039c4b7978c9mr19415525wmo.96.1655638251293; 
 Sun, 19 Jun 2022 04:30:51 -0700 (PDT)
Received: from [10.0.0.1] (system.cloudius-systems.com. [199.203.229.89])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adff0c1000000b002103cfd2fbasm10156755wro.65.2022.06.19.04.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 04:30:50 -0700 (PDT)
Message-ID: <6c06b2d4-2d96-c4a6-7aca-5147a91e7cf2@scylladb.com>
Date: Sun, 19 Jun 2022 14:30:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-2-ebiggers@kernel.org>
From: Avi Kivity <avi@scylladb.com>
Organization: ScyllaDB
In-Reply-To: <20220616201506.124209-2-ebiggers@kernel.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 16/06/2022 23.14, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Traditionally, the conditions for when DIO (direct
 I/O) is supported > were fairly simple. For both block device [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1o2tWN-0001gn-Ny
Subject: Re: [f2fs-dev] [PATCH v3 1/8] statx: add direct I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 16/06/2022 23.14, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Traditionally, the conditions for when DIO (direct I/O) is supported
> were fairly simple.  For both block devices and regular files, DIO had
> to be aligned to the logical block size of the block device.
>
> However, due to filesystem features that have been added over time (e.g.
> multi-device support, data journalling, inline data, encryption, verity,
> compression, checkpoint disabling, log-structured mode), the conditions
> for when DIO is allowed on a regular file have gotten increasingly
> complex.  Whether a particular regular file supports DIO, and with what
> alignment, can depend on various file attributes and filesystem mount
> options, as well as which block device(s) the file's data is located on.
>
> Moreover, the general rule of DIO needing to be aligned to the block
> device's logical block size is being relaxed to allow user buffers (but
> not file offsets) aligned to the DMA alignment instead
> (https://lore.kernel.org/linux-block/20220610195830.3574005-1-kbusch@fb.com/T/#u).
>
> XFS has an ioctl XFS_IOC_DIOINFO that exposes DIO alignment information.
> Uplifting this to the VFS is one possibility.  However, as discussed
> (https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
> this ioctl is rarely used and not known to be used outside of
> XFS-specific code.  It was also never intended to indicate when a file
> doesn't support DIO at all, nor was it intended for block devices.
>
> Therefore, let's expose this information via statx().  Add the
> STATX_DIOALIGN flag and two new statx fields associated with it:
>
> * stx_dio_mem_align: the alignment (in bytes) required for user memory
>    buffers for DIO, or 0 if DIO is not supported on the file.
>
> * stx_dio_offset_align: the alignment (in bytes) required for file
>    offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
>    on the file.  This will only be nonzero if stx_dio_mem_align is
>    nonzero, and vice versa.


If you consider AIO, this is actually three alignments:

1. offset alignment for reads (sector size in XFS)

2. offset alignment for overwrites (sector size in XFS since 
ed1128c2d0c87e, block size earlier)

3. offset alignment for appending writes (block size)


This is critical for linux-aio since violation of these alignments will 
stall the io_submit system call. Perhaps io_uring handles it better by 
bouncing to a workqueue, but there is a significant performance and 
latency penalty for that.


Small appending writes are important for database commit logs (and so 
it's better to overwrite a pre-formatted file to avoid aligning to block 
size).


It would be good to expose these differences.


>
> Note that as with other statx() extensions, if STATX_DIOALIGN isn't set
> in the returned statx struct, then these new fields won't be filled in.
> This will happen if the file is neither a regular file nor a block
> device, or if the file is a regular file and the filesystem doesn't
> support STATX_DIOALIGN.  It might also happen if the caller didn't
> include STATX_DIOALIGN in the request mask, since statx() isn't required
> to return unrequested information.
>
> This commit only adds the VFS-level plumbing for STATX_DIOALIGN.  For
> regular files, individual filesystems will still need to add code to
> support it.  For block devices, a separate commit will wire it up too.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>   fs/stat.c                 | 2 ++
>   include/linux/stat.h      | 2 ++
>   include/uapi/linux/stat.h | 4 +++-
>   3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/fs/stat.c b/fs/stat.c
> index 9ced8860e0f35..a7930d7444830 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -611,6 +611,8 @@ cp_statx(const struct kstat *stat, struct statx __user *buffer)
>   	tmp.stx_dev_major = MAJOR(stat->dev);
>   	tmp.stx_dev_minor = MINOR(stat->dev);
>   	tmp.stx_mnt_id = stat->mnt_id;
> +	tmp.stx_dio_mem_align = stat->dio_mem_align;
> +	tmp.stx_dio_offset_align = stat->dio_offset_align;
>   
>   	return copy_to_user(buffer, &tmp, sizeof(tmp)) ? -EFAULT : 0;
>   }
> diff --git a/include/linux/stat.h b/include/linux/stat.h
> index 7df06931f25d8..ff277ced50e9f 100644
> --- a/include/linux/stat.h
> +++ b/include/linux/stat.h
> @@ -50,6 +50,8 @@ struct kstat {
>   	struct timespec64 btime;			/* File creation time */
>   	u64		blocks;
>   	u64		mnt_id;
> +	u32		dio_mem_align;
> +	u32		dio_offset_align;
>   };
>   
>   #endif
> diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
> index 1500a0f58041a..7cab2c65d3d7f 100644
> --- a/include/uapi/linux/stat.h
> +++ b/include/uapi/linux/stat.h
> @@ -124,7 +124,8 @@ struct statx {
>   	__u32	stx_dev_minor;
>   	/* 0x90 */
>   	__u64	stx_mnt_id;
> -	__u64	__spare2;
> +	__u32	stx_dio_mem_align;	/* Memory buffer alignment for direct I/O */
> +	__u32	stx_dio_offset_align;	/* File offset alignment for direct I/O */
>   	/* 0xa0 */
>   	__u64	__spare3[12];	/* Spare space for future expansion */
>   	/* 0x100 */
> @@ -152,6 +153,7 @@ struct statx {
>   #define STATX_BASIC_STATS	0x000007ffU	/* The stuff in the normal stat struct */
>   #define STATX_BTIME		0x00000800U	/* Want/got stx_btime */
>   #define STATX_MNT_ID		0x00001000U	/* Got stx_mnt_id */
> +#define STATX_DIOALIGN		0x00002000U	/* Want/got direct I/O alignment info */
>   
>   #define STATX__RESERVED		0x80000000U	/* Reserved for future struct statx expansion */
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
