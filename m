Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DCC3D425
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 06 Nov 2025 20:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3/i8JC5JjnEKkWsJuXfAD288RHkELnZDwZrGXPOsBs=; b=UCiOdHzpUveyUImtCv9RUqxefl
	FzKJ925nCcCRNTYhtCXX+EM8hhvEKu8OGgb7SrUKxwe7A59ECidlGJOW6ggc8GpmtoTSlcy1vxAWI
	VLUp0mplfeqAdMOyp5IgvyXvmEI8wh/0VoJk9KuMdMTabnDuCgfZQ5rqk9KC4dm1vQTo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vH5my-0001fO-Sb;
	Thu, 06 Nov 2025 19:36:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vH5mw-0001f4-WF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 19:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e8m7hqDWmGMiD3VZvqj6eJnOHa/EgleS4BSvs95ztZM=; b=BuayOACNKf0UQ841Njml+4+fNa
 LKhRUsMdxwaH9Hq4UH/LPU1SF0VcW6nrdYb6wBzpt3+Jai+ChqeMFwBkUzNFM5BI4d353mQgrjdNL
 qnXWUvuqBgX80dDZjk5W1/u+hhN56/3YPQ6WSmF6Gtj1rZQnEhQ3uONNO9DXhsyTVceQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e8m7hqDWmGMiD3VZvqj6eJnOHa/EgleS4BSvs95ztZM=; b=I5JwBJvJlhhiUyLtg2Jq5kdu3k
 dwXj4Uzvf0qDGjHXdDXPrTn31iQvvBE8urpnhGXsYHm/6hV/8pZr0MxgDYbCQazfO2ASBHAX/GUIP
 EoweS7pMLcTm6JvczTq7Uau9AD1sgJkEahhWnIpWDcKhHNoxj1J+2MnHZ+7nLl20eoFo=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vH5mx-0003Fm-9e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 19:36:55 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762457803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8m7hqDWmGMiD3VZvqj6eJnOHa/EgleS4BSvs95ztZM=;
 b=0PGUDtUy5mXmov+QN6daEJze3fpy9uOdakNj0Z80KT6Y5zXefEaDmf+1cNRdug7iYPSta5
 wfsv2zGaCLT0eVSp9UcRFnoJnL6K6xTAan+hBMg6Du7ZRNsEyNu1ig3fciszn7pI1DIVL1
 bjQwuUskTd91/RQKzETOMszyUbP5nfrviCbBFt5umCZypHPf8drCdt8vMafyuB1tOSEWpM
 +kZPKhVTeP2nD7i7hPOCYVLTG0FvpZxb2iE9Mu2l+Dd5YMR5B79nHvqqVbqxVsBb3rXT6E
 wou9vWaZSpoLNz9L9wrU/4r+PYthBXHulE8OQhakHZIl0BJdeLAVNEYP1mFqSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762457803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8m7hqDWmGMiD3VZvqj6eJnOHa/EgleS4BSvs95ztZM=;
 b=hLvN/qk987oQ/YoxD4VuAngdzwe8vRIT2yABcgAbcxB/iJHWjVPc1acBGNkDhjsemQL1XA
 RmUp4DpLWphMvsDA==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <87h5v73s5g.fsf@jogness.linutronix.de>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz> <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz> <87bjlgqmk5.fsf@jogness.linutronix.de>
 <87tsz7iea2.fsf@jogness.linutronix.de> <aQzLX_y8PvBMiZ9f@pathway.suse.cz>
 <87h5v73s5g.fsf@jogness.linutronix.de>
Date: Thu, 06 Nov 2025 20:42:43 +0106
Message-ID: <87ecqb3qd0.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-11-06, John Ogness <john.ogness@linutronix.de> wrote:
 >> I think that we should do the following: >> >> diff --git
 a/kernel/printk/printk_ringbuffer.c
 b/kernel/printk/printk_ringbuffer.c >> in [...] 
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
X-Headers-End: 1vH5mx-0003Fm-9e
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

On 2025-11-06, John Ogness <john.ogness@linutronix.de> wrote:
>> I think that we should do the following:
>>
>> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
>> index 839f504db6d3..78e02711872e 100644
>> --- a/kernel/printk/printk_ringbuffer.c
>> +++ b/kernel/printk/printk_ringbuffer.c
>> @@ -1260,9 +1260,8 @@ static const char *get_data(struct prb_data_ring *data_ring,
>>  		return NULL;
>>  	}
>>  
>> -	/* Regular data block: @begin less than @next and in same wrap. */
>> -	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
>> -	    blk_lpos->begin < blk_lpos->next) {
>> +	/* Regular data block: @begin and @next in same wrap. */
>> +	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)) {
>>  		db = to_block(data_ring, blk_lpos->begin);
>>  		*data_size = blk_lpos->next - blk_lpos->begin;

Upon further consideration, your suggestion here is better. The wrapping
data block detection should continue to make sure there is exactly one 1
wrap. The size check will not catch the case where there are multiple
wraps.

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
