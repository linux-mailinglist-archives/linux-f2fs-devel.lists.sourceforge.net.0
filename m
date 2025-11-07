Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E4C3FCEA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 12:49:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4O/vxFMEUZnkiyXh7PtMT1YLsBXJ2PFNgs+dqeq4yw=; b=C3oIwa0nWCtoGfi5sHybBGj+29
	OkoXw9GCxs+8KvlXE8rAML5D0h2k/ZazJTofYcERmTf3SHGSFuRislc/+8yT14zbto+Ddyw/PDu65
	wdW+0IgLy0aHIG5Ar5gf9CVKHCJVZw55m5NdBEw8yO+joaKDjyV6Co+GUTMjSZcBd/6o=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHKxS-0005nN-Nr;
	Fri, 07 Nov 2025 11:48:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vHKxR-0005nG-Cu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 11:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0btHuhgoXf1JIAcsuz3z0Yh6Fl6KHmjrhbtAp1FpJMM=; b=ap0TI5mSgYXnhMEaSe9pdYPT4O
 v+igPv3ZoKzbcxtHO/8+Ar7UA/H8qXnh5MaowwmhHhXiQBgMfu3VVq0ENwRACkXI7ZvjY0H4Eq7Ug
 8Xd926pY9i5IrYXHXLY5eZHjWcLZeojgvGJnETmXw/q8THyvw9V2prp6gQu7TubQ78oA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0btHuhgoXf1JIAcsuz3z0Yh6Fl6KHmjrhbtAp1FpJMM=; b=IdLp6QOj+Dumc1x/1Bfcgw1Dh2
 GtAqRygOC6O68izlGmfz/jOXagAAVmuA/goJaE+10YurGYvJadOmtg0z2wkR322crGof/RWqMIHrG
 coG/BDADiswpMhVZHRdhk+ug2ZUIslqau+q97NYgQNzN+JpdtHXSrDGWjrWtKVxFo53U=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vHKxQ-0002Dd-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 11:48:45 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b729f239b39so141869466b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Nov 2025 03:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762516118; x=1763120918; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0btHuhgoXf1JIAcsuz3z0Yh6Fl6KHmjrhbtAp1FpJMM=;
 b=P2wccWoHzZyipLa2ZwNGdQXI29gmRpqTPphoxEYj4F55uFsAFKj3xKxMwdnXVkc1NL
 xd5fBa48ifV31cqPDl6dNfd5fhmBSChsG83+jTmEvznsVjhfxr9OKtKX45tuIKXFiaFN
 YJ4YWW8/ml0/eN9eLEHiLEzJHYvktPHBZEjm84pU3EH+PxvP6mlUXuI28sn7rR94Qf4l
 YNBRn8DXIYFFjb2/yvYyf5LHJDH/47WMLwxWg5Ft8ZlVEpUB8bl/Ydv75d8ZGDboAwvt
 Oo50G9G/upxuTaYFcygAsqWZbhwXwJr48UCVPd1UQ4vs33ZQ/IgQGWhgN4qffTF3jVc2
 qRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762516118; x=1763120918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0btHuhgoXf1JIAcsuz3z0Yh6Fl6KHmjrhbtAp1FpJMM=;
 b=VbPRLNCuKsxiGNYit9Lco2z5kG6ZS7qnCVa1msUKQGA0ohC8gJ7XABvATDhqrcT4U6
 TGGo0tylAhOy2ttwFtbGbFHR4E6rWB85j46Jvz32KGxS4uKPnu08pbWX9KupoAY5uA/a
 WAx5snwvZ04vcXEFVaY/PSDJ+p+tV/WJqabNu+3iMt1NuO0KLhu++gzhBxxeVaOw1Imn
 pQ6zaedVFdwwflRhoReq72nEG+l6E1zPB8uhhBKdcpoB1x/Uht1iyFnhFbc/m8Cu5y+m
 n7WwTKgKkUJCJ8VDugiyRr8zk2LImV/VNCl1JiZY1l4EVs4YceUGv6/8DEiyrRg5jGsN
 rSIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3xGGnvop43pmVrq9ybTD/HEhp8L8C7UTOucONc+/jvRZdU6ChpV1RxhKlTXlPTW3YEPTf3eAcojprIXlKRSRj@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzi1SXAKX/oJng/Ul+0GfTNwO8vchqaoqjEjuDDcFwszUD3VxBl
 kTJ6eGhrK6fpe12E/+mAUYtkfH0T3Wjvs1DkiGjn8Mh/I47vrrb/528WQ6fvS7A1ZsQ=
X-Gm-Gg: ASbGncuuouAjpl9e1qkarOKtPJHP3wv8Z2780PWw4Ou+11UEGMwr3EQu2ZN/NQ24Au7
 js4TQWQeEduSZyr7GqLSjzTj7HZNe29X+esEznMhIGVymjrUuwi7X7YTh7Yu91+HZSZlAsXb4+8
 MfvBS0eu2nEujoPV0KLTXt4kvRUukxVHYz+7Bp7+h7hQgoHRRCB1R4XG8ZO1QGrlpi8LfT9+8r5
 V1KoY0BG420TIFodwoVfNSn9e9IdVVrWnEcnmj8nHGDcJBfHrMQeoMfHrTqSnMrbZ3nTKT5tsY+
 1zd1Gkky3/Hq+TjdZh3hcNMQPd1XpnKi7FvdeO7j9dtL0GRDIa4kpJiZgSBvGunXmIiOA6VBNX1
 ILMi61WPh9w4YyrZ+BtGd+sAhYc679roasos/bpvM2AmLNBmESmWizx4GPrILTQR3x9kK1qMFSt
 KFkEES4MKaJwzTd4cWTc1Fh3O4
X-Google-Smtp-Source: AGHT+IEokWk1ZSxMf9gnaVqeMhezk2Opyg5SPlA30ekZY/SCq/nzbaLIFzm2m4+Eq/H2tXmxOh/49A==
X-Received: by 2002:a17:907:9489:b0:b72:c103:88da with SMTP id
 a640c23a62f3a-b72d0adb87bmr177003966b.26.1762516117816; 
 Fri, 07 Nov 2025 03:48:37 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72d3baf872sm85014366b.27.2025.11.07.03.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 03:48:37 -0800 (PST)
Date: Fri, 7 Nov 2025 12:48:35 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aQ3ck9Bltoac7-0d@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz>
 <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz>
 <87bjlgqmk5.fsf@jogness.linutronix.de>
 <87tsz7iea2.fsf@jogness.linutronix.de>
 <aQzLX_y8PvBMiZ9f@pathway.suse.cz>
 <87h5v73s5g.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h5v73s5g.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-11-06 20:04:03,
 John Ogness wrote: > On 2025-11-06, 
 Petr Mladek <pmladek@suse.com> wrote: > >> diff --git
 a/kernel/printk/printk_ringbuffer.c
 b/kernel/printk/printk_ringbuffer.c > >> index [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vHKxQ-0002Dd-Jd
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

On Thu 2025-11-06 20:04:03, John Ogness wrote:
> On 2025-11-06, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> >> index 839f504db6d30..8499ee642c31d 100644
> >> --- a/kernel/printk/printk_ringbuffer.c
> >> +++ b/kernel/printk/printk_ringbuffer.c
> >> @@ -390,6 +390,17 @@ static unsigned int to_blk_size(unsigned int size)
> >>  	return size;
> >>  }
> >>  
> >> +/*
> >> + * Check if @lpos1 is before @lpos2. This takes ringbuffer wrapping
> >> + * into account. If @lpos1 is more than a full wrap before @lpos2,
> >> + * it is considered to be after @lpos2.
> >
> > The 2nd sentence is a brain teaser ;-)
> >
> >> + */
> >> +static bool lpos1_before_lpos2(struct prb_data_ring *data_ring,
> >> +			       unsigned long lpos1, unsigned long lpos2)
> >> +{
> >> +	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
> >> +}
> >
> > It would be nice to describe the semantic a more clean way. Sigh,
> > it is not easy. I tried several variants and ended up with:
> >
> >    + using "lt" instead of "before" because "lower than" is
> >      a well known mathematical therm.
> 
> I explicitly chose a word other than "less" or "lower" because I was
> concerned people might visualize values. The lpos does not necessarily
> have a lesser or lower value. "Preceeds" would also be a choice of mine.

The word "before" was fine. I proposed "lt" because it was shorter and
I wanted to add "le" variant. I wanted to keep it short also because I
wanted to add another suffix to make it obvious that there was
the twist with wrapping.


> When I see "lt" I immediately think "less than" and "<". But I will not
> fight it. I can handle "lt".
> 
> >    + adding "_safe" suffix to make it clear that it is not
> >      a simple mathematical comparsion. It takes the wrap
> >      into account.
> 
> I find "_safe" confusing. Especially when you look at the implementation
> you wonder, "what is safe about this?". Especially when comparing it to
> all the complexity of the rest of the code. But I can handle "_safe" if
> it is important for you.

OK, forget "_safe". The helper function should make the code more
clear. And it won't work when even you or me are confused.

I though about "_wrap" but it was confusing as well. The code uses
the word "wrap" many times and it is always about wrapping over
the end of the data ring, for example, DATA_WRAPS() computes how
many times the data array was filled [*].

But in this case, data_make_reusable(), and data_push_tail(),
the edge for wrapping is a moving target. It is defined by
data_ring->head_lpos and data_ring->tail_lpos.

[*] It is not the exact number because it is computed from lpos
    which is not initialized to zero and might overflow.

> > Something like:
> >
> > /*
> >  * Returns true when @lpos1 is lower than @lpos2 and both values
> >  * are comparable.
> >  *
> >  * It is safe when the compared values are read a lock less way.
> >  * One of them must be already overwritten when the difference
> >  * is bigger then the data ring buffer size.
> 
> This makes quite a bit of assumptions about the context and intention of
> the call. I preferred my brain teaser version. But to me it is not worth
> bike-shedding. If this explanation helps you, I am fine with it.

My problem with the "brain teaser" version is the sentence"

  "If @lpos1 is more than a full wrap before @lpos2,
   it is considered to be after @lpos2."

It says what it does but it does not explain why. And the "why"
is very important here.

I actually think that the sentence is misleading. If @lpos1 is more
than a full wrap before @lpos2 it is still _before_ @lpos2!

Why we want to return "false" in this case? My understanding is
that it is because we want to break the "while" cycle where
the function is used because we are clearly working with
outdated lpos values.

What about?

/*
 * Return true when @lpos1 is lower than @lpos2 and both values
 * look sane.
 *
 * They are considered insane when the difference is bigger than
 * the data buffer size. It happens when the values are read
 * without locking and another CPU already moved the ring buffer
 * head and/or tail.
 *
 * The caller must behave carefully. The changes based on this
 * check must be done using cmpxchg() to confirm that the check
 * worked with valid values.
 */
static bool lpos1_before_lpos2_sane(struct prb_data_ring *data_ring,
				    unsined long lpos1, unsigned long lpos2)
{
	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
}

Feel free to come up with any other function name or description.
Whatever you think that is more clear. but I have a favor to ask you to:

  + explain why the function returns false when the difference is
    bigger that the data buffer size.

  + ideally avoid the word "wrap" because it has another meaning
    in the printk ring buffer code as explained earlier.


> >>  /*
> >>   * Sanity checker for reserve size. The ringbuffer code assumes that a data
> >>   * block does not exceed the maximum possible size that could fit within the
> >> @@ -577,7 +588,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
> >>  	unsigned long id;
> >>  
> >>  	/* Loop until @lpos_begin has advanced to or beyond @lpos_end. */
> >> -	while ((lpos_end - lpos_begin) - 1 < DATA_SIZE(data_ring)) {
> >> +	while (lpos1_before_lpos2(data_ring, lpos_begin, lpos_end)) {
> >
> > lpos1_lt_lpos2_safe() fits here.
> >
> >>  		blk = to_block(data_ring, lpos_begin);
> >>  		/*
> >> @@ -668,7 +679,7 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
> >>  	 * sees the new tail lpos, any descriptor states that transitioned to
> >>  	 * the reusable state must already be visible.
> >>  	 */
> >> -	while ((lpos - tail_lpos) - 1 < DATA_SIZE(data_ring)) {
> >> +	while (lpos1_before_lpos2(data_ring, tail_lpos, lpos)) {
> >>  		/*
> >>  		 * Make all descriptors reusable that are associated with
> >>  		 * data blocks before @lpos.
> >
> > Same here.
> >
> >> @@ -1149,7 +1160,7 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
> >>  	next_lpos = get_next_lpos(data_ring, blk_lpos->begin, size);
> >>  
> >>  	/* If the data block does not increase, there is nothing to do. */
> >> -	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
> >> +	if (!lpos1_before_lpos2(data_ring, head_lpos, next_lpos)) {
> >
> > I think that the original code was correct. And using the "-1" is
> > wrong here.
> 
> You have overlooked that I inverted the check. It is no longer checking:
> 
>     next_pos <= head_pos
> 
> but is instead checking:
> 
>     !(head_pos < next_pos)
> 
> IOW, if "next has not overtaken head".

I see. I missed this. Hmm, this would be correct when the comparsion was
mathemathical (lt, le). But is this correct in our case when take
into account the ring buffer wrapping?

The original check returned "false" when the difference between head_lpos
and next_lpos was bigger than the data ring size.

The new check would return "true", aka "!false", in this case.

Hmm, it seems that the buffer wrapping is not possible because
this code is called when desc_reopen_last() succeeded. And nobody
is allowed to free reopened block.

Anyway, I consider using (!lpos1_before_lpos2()) as highly confusing
in this case.

I would either keep the code as is. Maybe we could add a comment
explaining that

	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {

might fail only when the substraction is negative. It should never be
positive because head_lpos advanced more than the data buffer size
over next_lpos because the data block is reopened and nobody could
free it.

Maybe, we could even add a check for this.


> > Both data_make_reusable() and data_push_tail() had to use "-1"
> > because it was the "lower than" semantic. But in this case,
> > we do not need to do anything even when "head_lpos == next_lpos"
> >
> > By other words, both data_make_reusable() and data_push_tail()
> > needed to make a free space when the position was "lower than".
> > There was enough space when the values were "equal".
> >
> > It means that "equal" should be OK in data_realloc(). By other
> > words, data_realloc() should use "le" aka "less or equal"
> > semantic.
> >
> > The helper function might be:
> >
> > /*
> >  * Returns true when @lpos1 is lower or equal than @lpos2 and both
> >  * values are comparable.
> >  *
> >  * It is safe when the compared values are read a lock less way.
> >  * One of them must be already overwritten when the difference
> >  * is bigger then the data ring buffer size.
> >  */
> > static bool lpos1_le_lpos2_safe(struct prb_data_ring *data_ring,
> > 				unsined long lpos1, unsigned long lpos2)
> > {
> > 	return lpos2 - lpos1 < DATA_SIZE(data_ring);
> > }
> 
> If you negate lpos1_lt_lpos2_safe() and swap the parameters, there is no
> need for a second helper. That is what I did.

Sigh, lpos1_le_lpos2_safe() does not say the truth after all.
And (!lpos1_lt_lpos2_safe()) looks wrong to me.

I am going to wait what you say about my comments above.

> >> @@ -1262,7 +1273,7 @@ static const char *get_data(struct prb_data_ring *data_ring,
> >>  
> >>  	/* Regular data block: @begin less than @next and in same wrap. */
> >>  	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
> >> -	    blk_lpos->begin < blk_lpos->next) {
> >> +	    lpos1_before_lpos2(data_ring, blk_lpos->begin, blk_lpos->next)) {
> >
> > Hmm, I think that it is more complicated here.
> >
> > The "lower than" semantic is weird here. One would expect that "equal"
> > values, aka "zero size" is perfectly fine.
> 
> No, we would _not_ expect that zero size is OK, because we are detecting
> "Regular data blocks", in which case they must _not_ be equal.

It seems that you have more or less agreed with my proposal to
use  check_data_size() in the other replay, see
https://lore.kernel.org/all/87ecqb3qd0.fsf@jogness.linutronix.de/

I think about fixing this in a separate patch and pushing this
into linux-next ASAP to fix the regression.

We could improve the other comparisons later...

How does that sound?
Should I prepare the patch for get_data() are you going to do so?

Best Regards,
Petr


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
