Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA27C3C5E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 06 Nov 2025 17:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWCe8OxaCT4O9T+QcZKYZOOHOBU7jb79BrQ+uLQQ6fA=; b=SWeqDNAb3GCdp2hDPmrpzbe4Xw
	BI1vu0LLOV72pLtJkFSSROUJAoHmKqCYtad0lD0hD/6nkFLeDSEOmDCWwjXGNGzfn78lsZz3Oc9t9
	eIwWqvhhGk9pcaxReXDJEXw5ogXgMvSEci9dILPhF4fBofXnU3/cQdZWW1Yki1eEq1/4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vH2lU-0004tx-B9;
	Thu, 06 Nov 2025 16:23:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vH2lT-0004tr-4p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 16:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vNsPx84ow00us8mQGNUZ/5IigkZKqRCW8jzXpmXKZ2g=; b=b9aZQPS47L5om/BJ/iwXsJ1Gev
 E1rc1yFmJGRSE7FzSw0cXvGhriHnR2POESqw5Ljed1tO2Hdia1kgcWAmmOWnrJILTXdBikpkh0hlp
 WNWDtuWeCyKBRy0wO9v8blzb2p7VyINWyczyGbV7W5NOowzyJI4tW9lkGjL5cQTLbJD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vNsPx84ow00us8mQGNUZ/5IigkZKqRCW8jzXpmXKZ2g=; b=TXQ8oGw9iOgNbiWcsPKv2Argcq
 EMqd4GKIWZhTT49yMrlk/bPgWDfw7RVbHo1czxluP/M6JG/bXoI0XCnjMYru57yzIUJvegXz17Vbv
 KcshIxJS91f1ERlx1UgW5rTF11y+9tTbC49mN/VP8PTB2VotykCYwMFYx7WG3tN5r7TI=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vH2lS-0001FN-Ev for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 16:23:11 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b4f323cf89bso258935966b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Nov 2025 08:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762446179; x=1763050979; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNsPx84ow00us8mQGNUZ/5IigkZKqRCW8jzXpmXKZ2g=;
 b=YlAQpr2kDpRh2ZFc0Z0Vl5JOs3KbfpX6Mrx//BVILCyYO5vHWkHF9F5ZoNptSyu29E
 EfZM8+KTo5oh/N/SceLQ0R0jVT0Lp/mXqAPjdGAQtVUSnt9PGJ3cYy+KJ7Jp0SEXQ81M
 E9UzYNfEaXe3/icTnDWMKBaDBOWXKeg8JItzoQghZ9YiqrF4HIQpz5d0+Kla+TZROFDE
 /pI4Rzt9kPzFFWHyGeuNNqOPGKmi0BQqIqjVHzf3bOlSQbBlrv5NpPW4+UcW0pg/vBHA
 DlpFTdMmTnCyPyvsYCmQRYdj40vkSCy9C7bSsLx1YQYIeBglyHytN7JtMHFzKBI4McIt
 xUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762446179; x=1763050979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNsPx84ow00us8mQGNUZ/5IigkZKqRCW8jzXpmXKZ2g=;
 b=qBMjii5OZnYsMKE0XihP2Oen5fBAozklra2lZ7QZ24RJdFh/p/5QuteG1DBZkoCwh1
 5J58zpZaxs07aXN9Lv/Wd2s1VpBH6wwsfeO7cUnNNegukCShF82LZAOkxYe6nKh7ojRV
 wrmNWx0MwSdJsnMp/Tl9P9OxPw8KyLgFhrOxVne7PmpV5Tk8eXCWH8hPpgqkXQNfMwTE
 0zMa3fiYxCH6XOQWMgBh2B+/ei1cyq+ZmiZdR4W/ybmTMc0cHghu43PRw1diX/uGBbE1
 hrFIe73OMkfoY21J0yV6jV0/9X4MBt2zrqhdlgcFt0KNcMNwMkAsTkoFhaufQCtV/Fvl
 eNZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUPSyxzTRn6yI4X+dES7sMAzzOH9ejHBQbvZuYyetzLgS4fsA5/GEs/bf9q3cWnLFKKkhGNG6c9e+8h0NJYYIT@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz+XQaglNyaYglwAPzGmH8lhOT4LGmWAlwpLa/Af/Ff3MYl490/
 eWmkz18sMoFM1HP7XE+TUJu6YLZJ7bL1JfnyvRcW28OqHNlvS7AQoJKluEqQ+BEScTQ=
X-Gm-Gg: ASbGncuWQ/o9E69MbRQ7TKYbG9B5FU5/Jz/jg8KJvBsHcqkoSWqAF4HQkGtcMFH6MKv
 SrN/croKMRUDohAWnLD5RBF6bhIARGWkdCReKT5CIvfh5mWoyS39lpbVg/mu8KvEONNsBBpHrd9
 JDzSeoqDma2otcDsL60QSAtZgE0ddSaYu6qKFirIzKIWT9F7gsze1BLEgyLIAlGZ6mktefdIcae
 ZUvJ/YlI4OXg+pX2cTH+RxR1lM/j1YomnK0VrBfWQmYpw3WI2Qxx6ICL4yIOItVsAMt+N8NrSi1
 3n3W8AngLZIOK54CHoAdHF5/TGnHwy1IuR7tHstrIaBtPrYaEDufJU5FnnRIAL+UjGr7HUqUq2U
 yDprewbcxF0Cy/gtNtp/kTwoc3w/7ZBpYzON/XVKhP7B66RiQimhT9mueLyn3BStzSVL1iK7VJR
 AhV84qhvMPAy+F6w==
X-Google-Smtp-Source: AGHT+IE08HmORqHbz2m0uvai3cj8NgPnbGUJ7c/vK84uqQfLOz86XCiAJbCrlgBPuPPnAW3Py/FEIA==
X-Received: by 2002:a17:907:9409:b0:b40:b54d:e687 with SMTP id
 a640c23a62f3a-b726561117amr730715966b.47.1762446178676; 
 Thu, 06 Nov 2025 08:22:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72893cc74bsm244483466b.33.2025.11.06.08.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 08:22:58 -0800 (PST)
Date: Thu, 6 Nov 2025 17:22:55 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aQzLX_y8PvBMiZ9f@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz>
 <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz>
 <87bjlgqmk5.fsf@jogness.linutronix.de>
 <87tsz7iea2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tsz7iea2.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-11-06 12:42:21,
 John Ogness wrote: > On 2025-11-05, 
 John Ogness <john.ogness@linutronix.de> wrote: > >> Another question is
 whether
 this is the only problem caused the patch. > > > > This [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vH2lS-0001FN-Ev
Subject: Re: [f2fs-dev] [syzbot] [iomap?] kernel BUG in folio_end_read (2)
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
From: Petr Mladek via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, Joanne Koong <joannelkoong@gmail.com>,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 2025-11-06 12:42:21, John Ogness wrote:
> On 2025-11-05, John Ogness <john.ogness@linutronix.de> wrote:
> >> Another question is whether this is the only problem caused the patch.
> >
> > This comparison is quite special. It caught my attention while combing
> > through the code.
> 
> The reason that this comparison is special is because it is the only one
> that does not take wrapping into account. I did it that way originally
> because it is AND with a wrap check. But this is an ugly special
> case. It should use the same wrap check as the other 3 cases in
> nbcon.c. If it had, the bug would not have happened.

I think that there are actually some differences between the
comparsions, see below.

> I always considered these wrap checks to be non-obvious and
> error-prone. So what if we create a nice helper function to simplify and
> unify the wrap checks? Something like this:

But I agree that some wrappers with a good description
would be helpful.

> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 839f504db6d30..8499ee642c31d 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -390,6 +390,17 @@ static unsigned int to_blk_size(unsigned int size)
>  	return size;
>  }
>  
> +/*
> + * Check if @lpos1 is before @lpos2. This takes ringbuffer wrapping
> + * into account. If @lpos1 is more than a full wrap before @lpos2,
> + * it is considered to be after @lpos2.

The 2nd sentence is a brain teaser ;-)

> + */
> +static bool lpos1_before_lpos2(struct prb_data_ring *data_ring,
> +			       unsigned long lpos1, unsigned long lpos2)
> +{
> +	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
> +}

It would be nice to describe the semantic a more clean way. Sigh,
it is not easy. I tried several variants and ended up with:

   + using "lt" instead of "before" because "lower than" is
     a well known mathematical therm.

   + adding "_safe" suffix to make it clear that it is not
     a simple mathematical comparsion. It takes the wrap
     into account.

Something like:

/*
 * Returns true when @lpos1 is lower than @lpos2 and both values
 * are comparable.
 *
 * It is safe when the compared values are read a lock less way.
 * One of them must be already overwritten when the difference
 * is bigger then the data ring buffer size.
 */
static bool lpos1_lt_lpos2_safe(struct prb_data_ring *data_ring,
				unsined long lpos1, unsigned long lpos2)
{
	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
}

>  /*
>   * Sanity checker for reserve size. The ringbuffer code assumes that a data
>   * block does not exceed the maximum possible size that could fit within the
> @@ -577,7 +588,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
>  	unsigned long id;
>  
>  	/* Loop until @lpos_begin has advanced to or beyond @lpos_end. */
> -	while ((lpos_end - lpos_begin) - 1 < DATA_SIZE(data_ring)) {
> +	while (lpos1_before_lpos2(data_ring, lpos_begin, lpos_end)) {

lpos1_lt_lpos2_safe() fits here.

>  		blk = to_block(data_ring, lpos_begin);
>  		/*
> @@ -668,7 +679,7 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
>  	 * sees the new tail lpos, any descriptor states that transitioned to
>  	 * the reusable state must already be visible.
>  	 */
> -	while ((lpos - tail_lpos) - 1 < DATA_SIZE(data_ring)) {
> +	while (lpos1_before_lpos2(data_ring, tail_lpos, lpos)) {
>  		/*
>  		 * Make all descriptors reusable that are associated with
>  		 * data blocks before @lpos.

Same here.

> @@ -1149,7 +1160,7 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
>  	next_lpos = get_next_lpos(data_ring, blk_lpos->begin, size);
>  
>  	/* If the data block does not increase, there is nothing to do. */
> -	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
> +	if (!lpos1_before_lpos2(data_ring, head_lpos, next_lpos)) {

I think that the original code was correct. And using the "-1" is
wrong here.

Both data_make_reusable() and data_push_tail() had to use "-1"
because it was the "lower than" semantic. But in this case,
we do not need to do anything even when "head_lpos == next_lpos"

By other words, both data_make_reusable() and data_push_tail()
needed to make a free space when the position was "lower than".
There was enough space when the values were "equal".

It means that "equal" should be OK in data_realloc(). By other
words, data_realloc() should use "le" aka "less or equal"
semantic.

The helper function might be:

/*
 * Returns true when @lpos1 is lower or equal than @lpos2 and both
 * values are comparable.
 *
 * It is safe when the compared values are read a lock less way.
 * One of them must be already overwritten when the difference
 * is bigger then the data ring buffer size.
 */
static bool lpos1_le_lpos2_safe(struct prb_data_ring *data_ring,
				unsined long lpos1, unsigned long lpos2)
{
	return lpos2 - lpos1 < DATA_SIZE(data_ring);
}


>  		if (wrapped)
>  			blk = to_block(data_ring, 0);
>  		else
> @@ -1262,7 +1273,7 @@ static const char *get_data(struct prb_data_ring *data_ring,
>  
>  	/* Regular data block: @begin less than @next and in same wrap. */
>  	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
> -	    blk_lpos->begin < blk_lpos->next) {
> +	    lpos1_before_lpos2(data_ring, blk_lpos->begin, blk_lpos->next)) {

Hmm, I think that it is more complicated here.

The "lower than" semantic is weird here. One would expect that "equal"
values, aka "zero size" is perfectly fine.

It does not hurt because the "zero size" case is already handled
earlier. But still, the "lower than" semantic does not fit here.

IMHO, the main motivation for this fix is to make sure that
blk_lpos->begin and blk_lpos->next will produce a valid
*data_size.

From this POV, even lpos1_le_lpos2_safe() does not fit here
because the data_size must be lower than half of the size
of the ring buffer.

> 		db = to_block(data_ring, blk_lpos->begin);
>  		*data_size = blk_lpos->next - blk_lpos->begin;

I think that we should do the following:

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 839f504db6d3..78e02711872e 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1260,9 +1260,8 @@ static const char *get_data(struct prb_data_ring *data_ring,
 		return NULL;
 	}
 
-	/* Regular data block: @begin less than @next and in same wrap. */
-	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
-	    blk_lpos->begin < blk_lpos->next) {
+	/* Regular data block: @begin and @next in same wrap. */
+	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)) {
 		db = to_block(data_ring, blk_lpos->begin);
 		*data_size = blk_lpos->next - blk_lpos->begin;
 
@@ -1279,6 +1278,10 @@ static const char *get_data(struct prb_data_ring *data_ring,
 		return NULL;
 	}
 
+	/* Double check that the data_size is reasonable. */
+	if (WARN_ON_ONCE(!data_check_size(data_ring, *data_size)))
+		return NULL;
+
 	/* A valid data block will always be aligned to the ID size. */
 	if (WARN_ON_ONCE(blk_lpos->begin != ALIGN(blk_lpos->begin, sizeof(db->id))) ||
 	    WARN_ON_ONCE(blk_lpos->next != ALIGN(blk_lpos->next, sizeof(db->id)))) {

1. Just distinguish regular vs. wrapped. vs. invalid block.

2. Add sanity check for the "data_size". It might catch some wrong values
   in both code paths for "regular" and "wrapped" blocks. So, win win.

How does that sound?

Best Regards,
Petr


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
