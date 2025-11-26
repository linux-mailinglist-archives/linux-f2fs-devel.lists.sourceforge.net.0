Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D898C87D7B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 03:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRWxoL5Qk31vNQEeAF4SWLQHNIGD4uqpRGj5dThZ7N8=; b=dM7q5olF8KpQeeIow/I1yt2peL
	22pF9yzWPwuzjsnGuwKGIJmRoWMvqiRoRtZrsQWLlkzoKTX0NJslSXiIuI7KNaUgdMF0h3PbHw2d4
	Me4nv06QWvXlMVU2uz6cqlsrqcPuBdLltt0SUL+4XZk0sN1iCeW0Ifrf24t8RhqsJu9Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO5PN-0007pF-9A;
	Wed, 26 Nov 2025 02:37:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vO5PL-0007p9-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 02:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qt1MZpNKWoqgVDxQoUbhRRb+/kXBWmuaotwFheQ1vHc=; b=X3jWQGR1jDvFz/tyMxx9SjRIVX
 MBd+AmHS7k/pmgM9Wfr6uaXxJqLzkJTFxV63BU99z4Dn0z7EKc55tAcE59D4X4vXqi+4G0lfHQwun
 78KxJzctyGbGylv0V13IbaHmH1w89K0m0K28/edtl8/pIA8aOUZylcWB+koeSWpkq/x0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qt1MZpNKWoqgVDxQoUbhRRb+/kXBWmuaotwFheQ1vHc=; b=VjN7BGf7ITeJ6muLqUdecYYpWH
 FHnrlRfTASm6v3U3D7H29F0Hcx7lFnJ8Ev/p5c+z9aqyeKfM/D5puTsTGYwYX1KWy/37jNdcPNzOL
 5Z8tQB/Ds4s523nF8/Y+AxBmm6OI4IeFbof4c38nPDD5/tpZT9hJYu5BpOgrniOtS/ho=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vO5PL-0004uP-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 02:37:27 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so7480954b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 18:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764124637; x=1764729437; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qt1MZpNKWoqgVDxQoUbhRRb+/kXBWmuaotwFheQ1vHc=;
 b=fdJZoPUVGx6cw+umYRkp/BP1F7BtUhcS366v/LaVtkGD42gKFR2CkcAVNTg2HmtfYK
 BxLeW2x9jsuK8N/fY7Lz6/l3X9WbAhWj0kH5+gFwnv3vAJpN+jhdQH3nEDmtU2TQSoEn
 I4HN7To5yz/ebXCVWa2uNBf0es0FQqfpZHKBHp/bTQC2ZpWtODj8H8Hw6D7OpS2lhqci
 osfrqma4nArHo0jBW0luIfM/4QiiJo+Izaslcu+gOgnZzApSPgeOoz7g6hvJHTO0g62x
 jKF3m7+yo/CJfYboG2Bi5xVvlGC1aSCJGd1SNjV4sxxDNrQ2bCq46JrCLFjIWHMjBot4
 lfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764124637; x=1764729437;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qt1MZpNKWoqgVDxQoUbhRRb+/kXBWmuaotwFheQ1vHc=;
 b=Jpp9be6cU4vLEkU2i3nHK4iyoKufE+yQ1CCBds83I6LrsQ2ATGjuAGbyiU4uKcDMH/
 DLSyoRTvftwvQB+6E1hIIMcYtXdZH7lCzB/aJT1fOeZh1JoJCL6ipH6XwjvR6tpqNcNf
 tvLz97GGiJobMPv4dM4LX1tVfa+ZbHDhjXPvzGOAQQS/A1zYq8EFbl2qrNbx7s5W5KRk
 lf0mKZVZLPs1Nlp5I0D5YLhdKBaWxLo0Wfvgp8pkUYJ+DFIWKgLfgypi9ZToog01mbDm
 3BazRMBoQ0mKiifOk6w6btq5vDRkS88Qc1MDnyFPV8LU7I5TWACOdt/OXcnVdjd9i7EJ
 8L+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaRqznH3f4dJTqXgHya/BgXEK8J2Av+ruqzbGr15zdtD9+sYVw4oiiYI3o98BOgkzejAzDPkyXkiGAqMxbGKct@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyNKmS2l3gUJkT28XLSe1im/Ne3m/J0b8bCZoexkGdAf/zwA6tE
 pQYlBeFdo0o7+ViAerjt0NtnkepDYtqMedc7rPfoT8hhL9YpEtbBuZLh
X-Gm-Gg: ASbGncuARdtXu3nvjfFrdIXVJEMg86FCUae2ojGjJ/t8nDqBFeLBRSXyMoye5zGLyd8
 MrBjTGuRjnWOk84KbhCqa95kMIqeuZ5yWBCvigNf63TMaXCLbl3PHZtlCQVy7RPAELGPnM1qfZ5
 icTQp9DUx3uR7QA+aNQQYZgeA906BUAMf7KxxvqZZ9kYjeTIJ6IoSEOfAZJzi4IQpwZTMONPycJ
 +6l9dG28uv5CEsY0BO73Bm4oSNYuQFAkHQssfzym/bTjP69d3pL/DoBaT7qEjExTvDyMOaIWfkh
 WUUxjG2NzmjD3Jo16hs/k+HIUyRPp1J/LiUkFpY9H7anxl9SdmLxX5Dk0OoeCSlc/jcWYz6Uh/i
 eAJ6o+agSIjpv++ubxe4x4iDJfZbQ6oTig2heX7ukl0nD9mPozDcXMiEKrEvrhNjoxyKCC3nnfL
 Uley28JFIuhW4NL3uSdt4iKaHk2mSYGQ==
X-Google-Smtp-Source: AGHT+IFMPVdPASuME6boYfK9CSm7iGISD/qVZKhPKWlRPsY/Zck4GXkccO8MN1rBK0lovp98a7V31w==
X-Received: by 2002:a05:6a00:3906:b0:77f:efd:829b with SMTP id
 d2e1a72fcca58-7c58e602dcdmr17676868b3a.22.1764124636518; 
 Tue, 25 Nov 2025 18:37:16 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f1262364sm19518773b3a.58.2025.11.25.18.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 18:37:16 -0800 (PST)
Message-ID: <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
Date: Wed, 26 Nov 2025 10:37:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk,
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org,
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-7-ckulkarnilinux@gmail.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20251124234806.75216-7-ckulkarnilinux@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 07:48,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making all error checking > in XFS discard functions dead
 code. > > Change xfs_discard_extents() return type [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vO5PL-0004uP-Bu
Subject: Re: [f2fs-dev] [PATCH V3 6/6] xfs: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-raid@vger.kernel.org, bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 11/25/25 07:48, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making all error checking
> in XFS discard functions dead code.
> 
> Change xfs_discard_extents() return type to void, remove error variable,
> error checking, and error logging for the __blkdev_issue_discard() call
> in same function.
> 
> Update xfs_trim_perag_extents() and xfs_trim_rtgroup_extents() to
> ignore the xfs_discard_extents() return value and error checking
> code.
> 
> Update xfs_discard_rtdev_extents() to ignore __blkdev_issue_discard()
> return value and error checking code.
> 
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
> ---
>   fs/xfs/xfs_discard.c | 27 +++++----------------------
>   fs/xfs/xfs_discard.h |  2 +-
>   2 files changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/xfs/xfs_discard.c b/fs/xfs/xfs_discard.c
> index 6917de832191..b6ffe4807a11 100644
> --- a/fs/xfs/xfs_discard.c
> +++ b/fs/xfs/xfs_discard.c
> @@ -108,7 +108,7 @@ xfs_discard_endio(
>    * list. We plug and chain the bios so that we only need a single completion
>    * call to clear all the busy extents once the discards are complete.
>    */
> -int
> +void
>   xfs_discard_extents(
>   	struct xfs_mount	*mp,
>   	struct xfs_busy_extents	*extents)
> @@ -116,7 +116,6 @@ xfs_discard_extents(
>   	struct xfs_extent_busy	*busyp;
>   	struct bio		*bio = NULL;
>   	struct blk_plug		plug;
> -	int			error = 0;
>   
>   	blk_start_plug(&plug);
>   	list_for_each_entry(busyp, &extents->extent_list, list) {
> @@ -126,18 +125,10 @@ xfs_discard_extents(
>   
>   		trace_xfs_discard_extent(xg, busyp->bno, busyp->length);
>   
> -		error = __blkdev_issue_discard(btp->bt_bdev,
> +		__blkdev_issue_discard(btp->bt_bdev,
>   				xfs_gbno_to_daddr(xg, busyp->bno),
>   				XFS_FSB_TO_BB(mp, busyp->length),
>   				GFP_KERNEL, &bio);

If blk_alloc_discard_bio() fails to allocate a bio inside
__blkdev_issue_discard(), this may lead to an invalid loop in
list_for_each_entry{}. Instead of using __blkdev_issue_discard(), how
about allocate and submit the discard bios explicitly in
list_for_each_entry{}?

Yongpeng,

> -		if (error && error != -EOPNOTSUPP) {
> -			xfs_info(mp,
> -	 "discard failed for extent [0x%llx,%u], error %d",
> -				 (unsigned long long)busyp->bno,
> -				 busyp->length,
> -				 error);
> -			break;
> -		}
>   	}
>   
>   	if (bio) {
> @@ -148,8 +139,6 @@ xfs_discard_extents(
>   		xfs_discard_endio_work(&extents->endio_work);
>   	}
>   	blk_finish_plug(&plug);
> -
> -	return error;
>   }
>   
>   /*
> @@ -385,9 +374,7 @@ xfs_trim_perag_extents(
>   		 * list  after this function call, as it may have been freed by
>   		 * the time control returns to us.
>   		 */
> -		error = xfs_discard_extents(pag_mount(pag), extents);
> -		if (error)
> -			break;
> +		xfs_discard_extents(pag_mount(pag), extents);
>   
>   		if (xfs_trim_should_stop())
>   			break;
> @@ -496,12 +483,10 @@ xfs_discard_rtdev_extents(
>   
>   		trace_xfs_discard_rtextent(mp, busyp->bno, busyp->length);
>   
> -		error = __blkdev_issue_discard(bdev,
> +		__blkdev_issue_discard(bdev,
>   				xfs_rtb_to_daddr(mp, busyp->bno),
>   				XFS_FSB_TO_BB(mp, busyp->length),
>   				GFP_NOFS, &bio);
> -		if (error)
> -			break;
>   	}
>   	xfs_discard_free_rtdev_extents(tr);
>   
> @@ -741,9 +726,7 @@ xfs_trim_rtgroup_extents(
>   		 * list  after this function call, as it may have been freed by
>   		 * the time control returns to us.
>   		 */
> -		error = xfs_discard_extents(rtg_mount(rtg), tr.extents);
> -		if (error)
> -			break;
> +		xfs_discard_extents(rtg_mount(rtg), tr.extents);
>   
>   		low = tr.restart_rtx;
>   	} while (!xfs_trim_should_stop() && low <= high);
> diff --git a/fs/xfs/xfs_discard.h b/fs/xfs/xfs_discard.h
> index 2b1a85223a56..8c5cc4af6a07 100644
> --- a/fs/xfs/xfs_discard.h
> +++ b/fs/xfs/xfs_discard.h
> @@ -6,7 +6,7 @@ struct fstrim_range;
>   struct xfs_mount;
>   struct xfs_busy_extents;
>   
> -int xfs_discard_extents(struct xfs_mount *mp, struct xfs_busy_extents *busy);
> +void xfs_discard_extents(struct xfs_mount *mp, struct xfs_busy_extents *busy);
>   int xfs_ioc_trim(struct xfs_mount *mp, struct fstrim_range __user *fstrim);
>   
>   #endif /* XFS_DISCARD_H */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
