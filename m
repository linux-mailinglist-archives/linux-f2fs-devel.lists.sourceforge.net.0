Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BCC4599A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 10:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le+3PlXRgnPGX7cuHYshWfNlR0J9Wql8/HSkzpzj1eU=; b=Z/j0+xavvkTRms6aBPy2jcS1mb
	GKKg+HXLkdxfys3DCNHpTB1KKT+PoMMa7iClSRNKCYbI1p2DO5dXxHddUJgc2rVrw1kD69ULrCHE8
	6XHN8RoB9Pxcyl3MCXF3GtzOIFLUOZidw3Iy8UbLegRM1gyZc3bpH9aC0yt0A3zZB5fY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIO62-0005m6-GB;
	Mon, 10 Nov 2025 09:21:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vIO61-0005lK-Q6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RH6y8AqWM02HDoXJucHQCnZ4iL8GJPZpMZrh3/buiXE=; b=WahdLnIFmskWH7XeNd1+zye3an
 +s49jLmCuDI+8T2N2noJ7phhfpDPtidGjcmWJ6gARd3T+5uSLYFlbirYwvLalXuZTNwQU+G9GZoq1
 qEHETPg+aX25UL2blC0niMEruEREGkMfB72rlSG+/tPMvgMI+39vI2pLMUKZYIBzDtB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RH6y8AqWM02HDoXJucHQCnZ4iL8GJPZpMZrh3/buiXE=; b=OjJH9p5aZnwjLlBF/NY76yXWzv
 QNUTejEeck7PVTFBYC8Yk61a+pcPBZhDk7I3S+ENdjXyrV2IU4NrkDWghaaGfk9cAaJ9AZz6gWI5k
 z6ZMFgQhGZm1mkMtKLQ5QH3J/5oBJUEiW1DFhF3hggoQ4U6HJlkUJvVOMsE1R9ChkFI4=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIO5f-0004Qo-Fb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:21:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762766484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RH6y8AqWM02HDoXJucHQCnZ4iL8GJPZpMZrh3/buiXE=;
 b=1AHZDA0HjqDPADvCENpUEaCHCNu3clHUkAhrYHRZAj7SW8m1mWA4wwXhAxsXw9/Ypg1aql
 vC7+kpyBmfER8wn/9KvNWQO0rFSRZOGMYBF5W4dT/qMSeMaSYplCZNTCNz0Q0tmiyWSwf8
 3eqib3Jl7Vyed1Y2axixqLpWDLkSTmSXKns6RLZH/tcZQ0Pcl/heCNj7aj2vqUyV3Ul8um
 x5R7NCNT0RMZOgOxP/3EFZEU3YEKVcWTm3SG6iieA52kOiPXDyRMNWrmv78i6BSGx5WxjP
 QHs0P7xNmwUNPBEJfU6QLUlz8jMi83kpf/Q85gxF85GBgNspEwPIESQlc7M7Hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762766484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RH6y8AqWM02HDoXJucHQCnZ4iL8GJPZpMZrh3/buiXE=;
 b=QiNo9/Vx7XmkYNoF4Q7UPAO9m0J/JXMYstBDyeujKvFPQREVnnJ7dGQTsIZRrGya3/NmnR
 1nHl/bwTSAplPFDw==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <20251107194720.1231457-3-pmladek@suse.com>
References: <20251107194720.1231457-1-pmladek@suse.com>
 <20251107194720.1231457-3-pmladek@suse.com>
Date: Mon, 10 Nov 2025 10:27:23 +0106
Message-ID: <87jyzyutt8.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Petr, Nit: For the patch subject, remove the word "a":
 "Create a helper function to decide whether more space is needed" 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1vIO5f-0004Qo-Fb
Subject: Re: [f2fs-dev] [PATCH 2/2] printk_ringbuffer: Create a helper
 function to decide whether a more space is needed
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
Cc: Petr Mladek <pmladek@suse.com>, brauner@kernel.org, djwong@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 Joanne Koong <joannelkoong@gmail.com>, "amurray @ thegoodpenguin . co .
 uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Petr,

Nit: For the patch subject, remove the word "a":

"Create a helper function to decide whether more space is needed"

More below...

On 2025-11-07, Petr Mladek <pmladek@suse.com> wrote:
> The decision whether some more space is needed is tricky in the printk
> ring buffer code:
>
>   1. The given lpos values might overflow. A subtraction must be used
>      instead of a simple "lower than" check.
>
>   2. Another CPU might reuse the space in the mean time. It can be
>      detected when the subtraction is bigger than DATA_SIZE(data_ring).
>
>   3. There is exactly enough space when the result of the subtraction
>      is zero. But more space is needed when the result is exactly
>      DATA_SIZE(data_ring).
>
> Add a helper function to make sure that the check is done correctly
> in all situations. Also it helps to make the code consistent and
> better documented.
>
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Link: https://lore.kernel.org/r/87tsz7iea2.fsf@jogness.linutronix.de
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  kernel/printk/printk_ringbuffer.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 3e6fd8d6fa9f..ede3039dd041 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -411,6 +411,23 @@ static bool data_check_size(struct prb_data_ring *data_ring, unsigned int size)
>  	return to_blk_size(size) <= DATA_SIZE(data_ring) / 2;
>  }
>  
> +/*
> + * Compare the current and requested logical position and decide
> + * whether more space needed.
> + *
> + * Return false when @lpos_current is already at or beyond @lpos_target.
> + *
> + * Also return false when the difference between the positions is bigger
> + * than the size of the data buffer. It might happen only when the caller
> + * raced with another CPU(s) which already made and used the space.
> + */
> +static bool need_more_space(struct prb_data_ring *data_ring,
> +			    unsigned long lpos_current,
> +			    unsigned long lpos_target)
> +{
> +	return lpos_target - lpos_current - 1 < DATA_SIZE(data_ring);
> +}
> +
>  /* Query the state of a descriptor. */
>  static enum desc_state get_desc_state(unsigned long id,
>  				      unsigned long state_val)
> @@ -577,7 +594,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
>  	unsigned long id;
>  
>  	/* Loop until @lpos_begin has advanced to or beyond @lpos_end. */
> -	while ((lpos_end - lpos_begin) - 1 < DATA_SIZE(data_ring)) {
> +	while (need_more_space(data_ring, lpos_begin, lpos_end)) {
>  		blk = to_block(data_ring, lpos_begin);
>  
>  		/*
> @@ -668,7 +685,7 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
>  	 * sees the new tail lpos, any descriptor states that transitioned to
>  	 * the reusable state must already be visible.
>  	 */
> -	while ((lpos - tail_lpos) - 1 < DATA_SIZE(data_ring)) {
> +	while (need_more_space(data_ring, tail_lpos, lpos)) {
>  		/*
>  		 * Make all descriptors reusable that are associated with
>  		 * data blocks before @lpos.
> @@ -1148,8 +1165,14 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
>  
>  	next_lpos = get_next_lpos(data_ring, blk_lpos->begin, size);
>  
> -	/* If the data block does not increase, there is nothing to do. */
> -	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
> +	/*
> +	 * Use the current data block when the size does not increase.

I would like to expand the above sentence so that it is a bit clearer
how it relates to the new check. Perhaps:

	 * Use the current data block when the size does not increase, i.e.
	 * when @head_lpos is already able to accommodate the new @next_lpos.

> +	 *
> +	 * Note that need_more_space() could never return false here because
> +	 * the difference between the positions was bigger than the data
> +	 * buffer size. The data block is reopened and can't get reused.
> +	 */
> +	if (!need_more_space(data_ring, head_lpos, next_lpos)) {
>  		if (wrapped)
>  			blk = to_block(data_ring, 0);
>  		else
> -- 
> 2.51.1

Otherwise, LGTM. Thanks for choosing a name that presents contextual
purpose rather than simply function.

Reviewed-by: John Ogness <john.ogness@linutronix.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
