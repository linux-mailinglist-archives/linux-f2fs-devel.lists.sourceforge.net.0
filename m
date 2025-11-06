Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FBC3D1EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 06 Nov 2025 19:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stSBkkB+chdNeuMKjclEUurFM3pylT+hj/wNp11pIAc=; b=TRjDgVM7YNUqym3jyrYV74k3h5
	3ndV/LOPSh7Gmd/NITT8ZqsRdcGdj/o8/DjwZpLdOBkIzEb9XQBroaA5Nhj7PnBC8lFvhJ4PfyemN
	Q3AUfi0fqM/ONGH0IAqpQln9EG1ftdCzYeGQ9N/Kk2p77EoxdnZnRzJZGmwItxIwntik=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vH5BV-0004Al-1T;
	Thu, 06 Nov 2025 18:58:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vH5BU-0004Af-2W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 18:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mWMyuixnst/vfm8/10KssX5w/ZtcrBMY+5+JVb+DTU4=; b=QbQ7xStBqXIB8Afu3NtgO5Yk0U
 Esf0goABZDNp92a0DIZFPV3DeYd2wO+9yWNH4tlBMPzScObOfTm8sozgT7I4lWKSVQrw3Bsfy1nTw
 QFNbEOVEbA64YiDChJuqDmauO80M5poVX+vEgYlVJcH9KpZYSubXGsdijsoo2qm8vzRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mWMyuixnst/vfm8/10KssX5w/ZtcrBMY+5+JVb+DTU4=; b=iUymyyZAV1nWYaDg5Ri2Eg0t+R
 Iq547/ge14y0r2D95UzCNg7PG4TSncRGXD7DGyxFix6CCC2kYhJVxDGg91q2GiaaL59SH2nuhQXRh
 XCRmUXV4HQLj53u6pD+P2rXahW2t0l4e+IkekMJIg74qBEI4pD5J4h11F9QXkmoJqB+U=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vH5BS-0001B1-VA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 18:58:12 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762455484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mWMyuixnst/vfm8/10KssX5w/ZtcrBMY+5+JVb+DTU4=;
 b=ne6IZX8vOnSnujWL7niEpvzOXSwkbcEah8Y0U53yPNBJzsCnhaJP4y0oyqSXCAex0F6mK/
 pUZQR458x4LZqHJtrWdh0Tjwoincl7rwIbcp+xsG2fTOIKyvFFvlpOUgqDqBhWHTFYftT3
 40hsQu1De4xpx9phH7rrq1/HymLh7To7CU+VhObqwN7SQFL8lul6BnRJmSSVj5ei/IOK0z
 uk2TG+ZsmC80NmzoGpwNpjr7NWGdhXQlIoZmdmT3nfpDVaFK22bdLXU2ugCvs6CrQuD4sh
 R8NKSh1vHrqDeVbiTOEvWQtXu5i7zd6tNdYEpnB+0A7SD1M8VFq/fkNf1EQEMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762455484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mWMyuixnst/vfm8/10KssX5w/ZtcrBMY+5+JVb+DTU4=;
 b=vLytAN2x2CKboH6PJj7U+1rQKrlMp/RZLscVdXuAU2IDgMWIofWXa4cxClMN5b51u3N0+p
 MYm/GF5NvbB1g3Dw==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aQzLX_y8PvBMiZ9f@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz> <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz> <87bjlgqmk5.fsf@jogness.linutronix.de>
 <87tsz7iea2.fsf@jogness.linutronix.de> <aQzLX_y8PvBMiZ9f@pathway.suse.cz>
Date: Thu, 06 Nov 2025 20:04:03 +0106
Message-ID: <87h5v73s5g.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-11-06, Petr Mladek <pmladek@suse.com> wrote: >> diff
 --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
 >> index 839f504db6d30..8499ee642c31d 100644 >> --- a/kernel/ [...] 
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
X-Headers-End: 1vH5BS-0001B1-VA
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
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, Joanne Koong <joannelkoong@gmail.com>,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025-11-06, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
>> index 839f504db6d30..8499ee642c31d 100644
>> --- a/kernel/printk/printk_ringbuffer.c
>> +++ b/kernel/printk/printk_ringbuffer.c
>> @@ -390,6 +390,17 @@ static unsigned int to_blk_size(unsigned int size)
>>  	return size;
>>  }
>>  
>> +/*
>> + * Check if @lpos1 is before @lpos2. This takes ringbuffer wrapping
>> + * into account. If @lpos1 is more than a full wrap before @lpos2,
>> + * it is considered to be after @lpos2.
>
> The 2nd sentence is a brain teaser ;-)
>
>> + */
>> +static bool lpos1_before_lpos2(struct prb_data_ring *data_ring,
>> +			       unsigned long lpos1, unsigned long lpos2)
>> +{
>> +	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
>> +}
>
> It would be nice to describe the semantic a more clean way. Sigh,
> it is not easy. I tried several variants and ended up with:
>
>    + using "lt" instead of "before" because "lower than" is
>      a well known mathematical therm.

I explicitly chose a word other than "less" or "lower" because I was
concerned people might visualize values. The lpos does not necessarily
have a lesser or lower value. "Preceeds" would also be a choice of mine.

When I see "lt" I immediately think "less than" and "<". But I will not
fight it. I can handle "lt".

>    + adding "_safe" suffix to make it clear that it is not
>      a simple mathematical comparsion. It takes the wrap
>      into account.

I find "_safe" confusing. Especially when you look at the implementation
you wonder, "what is safe about this?". Especially when comparing it to
all the complexity of the rest of the code. But I can handle "_safe" if
it is important for you.

> Something like:
>
> /*
>  * Returns true when @lpos1 is lower than @lpos2 and both values
>  * are comparable.
>  *
>  * It is safe when the compared values are read a lock less way.
>  * One of them must be already overwritten when the difference
>  * is bigger then the data ring buffer size.

This makes quite a bit of assumptions about the context and intention of
the call. I preferred my brain teaser version. But to me it is not worth
bike-shedding. If this explanation helps you, I am fine with it.

>  */
> static bool lpos1_lt_lpos2_safe(struct prb_data_ring *data_ring,
> 				unsined long lpos1, unsigned long lpos2)
> {
> 	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
> }
>
>>  /*
>>   * Sanity checker for reserve size. The ringbuffer code assumes that a data
>>   * block does not exceed the maximum possible size that could fit within the
>> @@ -577,7 +588,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
>>  	unsigned long id;
>>  
>>  	/* Loop until @lpos_begin has advanced to or beyond @lpos_end. */
>> -	while ((lpos_end - lpos_begin) - 1 < DATA_SIZE(data_ring)) {
>> +	while (lpos1_before_lpos2(data_ring, lpos_begin, lpos_end)) {
>
> lpos1_lt_lpos2_safe() fits here.
>
>>  		blk = to_block(data_ring, lpos_begin);
>>  		/*
>> @@ -668,7 +679,7 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
>>  	 * sees the new tail lpos, any descriptor states that transitioned to
>>  	 * the reusable state must already be visible.
>>  	 */
>> -	while ((lpos - tail_lpos) - 1 < DATA_SIZE(data_ring)) {
>> +	while (lpos1_before_lpos2(data_ring, tail_lpos, lpos)) {
>>  		/*
>>  		 * Make all descriptors reusable that are associated with
>>  		 * data blocks before @lpos.
>
> Same here.
>
>> @@ -1149,7 +1160,7 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
>>  	next_lpos = get_next_lpos(data_ring, blk_lpos->begin, size);
>>  
>>  	/* If the data block does not increase, there is nothing to do. */
>> -	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
>> +	if (!lpos1_before_lpos2(data_ring, head_lpos, next_lpos)) {
>
> I think that the original code was correct. And using the "-1" is
> wrong here.

You have overlooked that I inverted the check. It is no longer checking:

    next_pos <= head_pos

but is instead checking:

    !(head_pos < next_pos)

IOW, if "next has not overtaken head".

> Both data_make_reusable() and data_push_tail() had to use "-1"
> because it was the "lower than" semantic. But in this case,
> we do not need to do anything even when "head_lpos == next_lpos"
>
> By other words, both data_make_reusable() and data_push_tail()
> needed to make a free space when the position was "lower than".
> There was enough space when the values were "equal".
>
> It means that "equal" should be OK in data_realloc(). By other
> words, data_realloc() should use "le" aka "less or equal"
> semantic.
>
> The helper function might be:
>
> /*
>  * Returns true when @lpos1 is lower or equal than @lpos2 and both
>  * values are comparable.
>  *
>  * It is safe when the compared values are read a lock less way.
>  * One of them must be already overwritten when the difference
>  * is bigger then the data ring buffer size.
>  */
> static bool lpos1_le_lpos2_safe(struct prb_data_ring *data_ring,
> 				unsined long lpos1, unsigned long lpos2)
> {
> 	return lpos2 - lpos1 < DATA_SIZE(data_ring);
> }

If you negate lpos1_lt_lpos2_safe() and swap the parameters, there is no
need for a second helper. That is what I did.

>> @@ -1262,7 +1273,7 @@ static const char *get_data(struct prb_data_ring *data_ring,
>>  
>>  	/* Regular data block: @begin less than @next and in same wrap. */
>>  	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
>> -	    blk_lpos->begin < blk_lpos->next) {
>> +	    lpos1_before_lpos2(data_ring, blk_lpos->begin, blk_lpos->next)) {
>
> Hmm, I think that it is more complicated here.
>
> The "lower than" semantic is weird here. One would expect that "equal"
> values, aka "zero size" is perfectly fine.

No, we would _not_ expect that zero size is OK, because we are detecting
"Regular data blocks", in which case they must _not_ be equal.

> It does not hurt because the "zero size" case is already handled
> earlier. But still, the "lower than" semantic does not fit here.

Currently we have 3 explicit checks:

1. data-less

2. regular

3. wrapping

But I agree the checks are "relaxed" because we are doing only minimal
sanity checks on the positions, rather than size validation.

> IMHO, the main motivation for this fix is to make sure that
> blk_lpos->begin and blk_lpos->next will produce a valid
> *data_size.
>
> From this POV, even lpos1_le_lpos2_safe() does not fit here
> because the data_size must be lower than half of the size
> of the ring buffer.

Currently we do not do size validation for reading, only for writing. If
you are arguing that we _should_ perform better size validation on read,
then I agree this is the place for it.

>> 		db = to_block(data_ring, blk_lpos->begin);
>>  		*data_size = blk_lpos->next - blk_lpos->begin;
>
> I think that we should do the following:
>
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 839f504db6d3..78e02711872e 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -1260,9 +1260,8 @@ static const char *get_data(struct prb_data_ring *data_ring,
>  		return NULL;
>  	}
>  
> -	/* Regular data block: @begin less than @next and in same wrap. */
> -	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
> -	    blk_lpos->begin < blk_lpos->next) {
> +	/* Regular data block: @begin and @next in same wrap. */
> +	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)) {
>  		db = to_block(data_ring, blk_lpos->begin);
>  		*data_size = blk_lpos->next - blk_lpos->begin;
>  
> @@ -1279,6 +1278,10 @@ static const char *get_data(struct prb_data_ring *data_ring,
>  		return NULL;
>  	}
>  
> +	/* Double check that the data_size is reasonable. */
> +	if (WARN_ON_ONCE(!data_check_size(data_ring, *data_size)))
> +		return NULL;
> +
>  	/* A valid data block will always be aligned to the ID size. */
>  	if (WARN_ON_ONCE(blk_lpos->begin != ALIGN(blk_lpos->begin, sizeof(db->id))) ||
>  	    WARN_ON_ONCE(blk_lpos->next != ALIGN(blk_lpos->next, sizeof(db->id)))) {
>
> 1. Just distinguish regular vs. wrapped. vs. invalid block.
>
> 2. Add sanity check for the "data_size". It might catch some wrong values
>    in both code paths for "regular" and "wrapped" blocks. So, win win.
>
> How does that sound?

I think it can be made even more simple since we are adding size
validation:

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index b7ab4e75917f0..04bc863eae411 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1271,23 +1271,15 @@ static const char *get_data(struct prb_data_ring *data_ring,
 		return NULL;
 	}
 
-	/* Regular data block: @begin less than @next and in same wrap. */
-	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
-	    blk_lpos->begin < blk_lpos->next) {
-		db = to_block(data_ring, blk_lpos->begin);
-		*data_size = blk_lpos->next - blk_lpos->begin;
-
-	/* Wrapping data block: @begin is one wrap behind @next. */
-	} else if (!is_blk_wrapped(data_ring,
-				   blk_lpos->begin + DATA_SIZE(data_ring),
-				   blk_lpos->next)) {
+	/* Wrapping data block description. */
+	if (is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)) {
 		db = to_block(data_ring, 0);
 		*data_size = DATA_INDEX(data_ring, blk_lpos->next);
 
-	/* Illegal block description. */
+	/* Regular data block description. */
 	} else {
-		WARN_ON_ONCE(1);
-		return NULL;
+		db = to_block(data_ring, blk_lpos->begin);
+		*data_size = blk_lpos->next - blk_lpos->begin;
 	}
 
 	/* A valid data block will always be aligned to the ID size. */
@@ -1300,6 +1292,10 @@ static const char *get_data(struct prb_data_ring *data_ring,
 	if (WARN_ON_ONCE(*data_size < sizeof(db->id)))
 		return NULL;
 
+	/* Check if the data size is at least legal. */
+	if (WARN_ON_ONCE(!data_check_size(data_ring, *data_size)))
+		return NULL;
+
 	/* Subtract block ID space from size to reflect data size. */
 	*data_size -= sizeof(db->id);
 
So it ends up looking like this:

	/* Wrapping data block description. */
	if (is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)) {
		db = to_block(data_ring, 0);
		*data_size = DATA_INDEX(data_ring, blk_lpos->next);

	/* Regular data block description. */
	} else {
		db = to_block(data_ring, blk_lpos->begin);
		*data_size = blk_lpos->next - blk_lpos->begin;
	}
...
	/* Ensure the data size is at least legal. */
	if (WARN_ON_ONCE(!data_check_size(data_ring, *data_size)))
		return NULL;

(Note that there is already WARN_ON_ONCE() checks for misaligned lpos
values and sizes less than sizeof(id).)

How does this sound?

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
