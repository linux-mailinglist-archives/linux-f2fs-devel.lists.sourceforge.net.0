Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC8C40291
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 14:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4gEedgvcTpZsaDejkT4+QfwKTJ+1WavWuoK6GSMJSY=; b=BM8Mh5QexB4VT8t+JUA1jdr8P7
	4hC/ZWJBcfIJ3ZH6z8j5Y03ybPmjJNiC2r5vi/Y8FZq+DK0RGuo8pPDjrCUR+uLKtaErX9hP2xats
	A7WImkJ2zRJqABmU6ekPV7zegiYrn7UHedptRI/gCdfJvBVEhy15z5us8nG7JNm0ltEM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHMil-00081q-P7;
	Fri, 07 Nov 2025 13:41:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vHMik-00081k-Fs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 13:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQ9noBC6jYHpesi21iR41wacPz1nSToTuWL/a29XHiA=; b=Vz08t+YIjpiXVwpra9Db0JMKtX
 JbkCvf4WpRosB1+1a4OB9e0fjcP7EAkLkNWTaxnagcfYoJrkZ1/modvwCMCeopuZ0Ls2iV6gFyNjE
 HCEd17BqxQjpVlQk00wrsXHxfz739nUGqz2IqT64QASOdm16ax9el/J15pn+8pE6vud4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UQ9noBC6jYHpesi21iR41wacPz1nSToTuWL/a29XHiA=; b=UmuvIS1/V+bQswmqJwUSsBmh3m
 Kr/P69l6dxN6T8s4vkWIAQQWkz83YSqgVDqNn7j843ArqkLOcKHt/Yp4N3kcnrQO4WONIBwH7nWkF
 36+DyeRnrXsZ64vED8olTsbx0BYXTsdspo03IhRnKWMImiOb+C8aRyhnJFyCcTOtKsrM=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHMij-0007GS-SP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 13:41:42 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762522890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQ9noBC6jYHpesi21iR41wacPz1nSToTuWL/a29XHiA=;
 b=Rfr252XcjH5h+UUrJg/pmHzom8K256tRHq3+XOxMpc5mvk/FBD7zawbZc+FBMfzDg6JWJm
 Mzl2SO/sj/xDa39sASpyyoP6S3G9uyKdvg9R+0IYkbqaYgY3tqtVZnhLlS3+QI2O9Vr/7/
 vYKOXKTmznhPyndd5YtDpSCKbXlWB6LYpOwd0Fnz7+7kVlmnyltXyB2HxtjOAKHSrnhwHn
 SbVUOnXSo9BWL+3YQYJLKuQsCT8/sfx49vHreaLzA/2b1m1KtGXTTzw4GpsAwq+cBHytGA
 6IWsxCA0V1ohfpmidKQc/QVEjs4872qeHPN6LkOdHXDohbnkk9782R/w9rzfSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762522890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQ9noBC6jYHpesi21iR41wacPz1nSToTuWL/a29XHiA=;
 b=hOgdHBfoRYMa2wIRjwpw1clVkYTVr9ky7h14gp6dC/iF9rk2OTn09LiBFhE8YiT7N1QP+m
 r+HFrMbi4idy7RDQ==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aQ3ck9Bltoac7-0d@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz> <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz> <87bjlgqmk5.fsf@jogness.linutronix.de>
 <87tsz7iea2.fsf@jogness.linutronix.de> <aQzLX_y8PvBMiZ9f@pathway.suse.cz>
 <87h5v73s5g.fsf@jogness.linutronix.de> <aQ3ck9Bltoac7-0d@pathway.suse.cz>
Date: Fri, 07 Nov 2025 14:47:29 +0106
Message-ID: <871pma0xkm.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-11-07, Petr Mladek <pmladek@suse.com> wrote: > What
 about? > > /* > * Return true when @lpos1 is lower than @lpos2 and both values
 > * look sane. > * > * They are considered insane when the di [...] 
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: linutronix.de]
X-Headers-End: 1vHMij-0007GS-SP
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

On 2025-11-07, Petr Mladek <pmladek@suse.com> wrote:
> What about?
>
> /*
>  * Return true when @lpos1 is lower than @lpos2 and both values
>  * look sane.
>  *
>  * They are considered insane when the difference is bigger than
>  * the data buffer size. It happens when the values are read
>  * without locking and another CPU already moved the ring buffer
>  * head and/or tail.
>  *
>  * The caller must behave carefully. The changes based on this
>  * check must be done using cmpxchg() to confirm that the check
>  * worked with valid values.
>  */
> static bool lpos1_before_lpos2_sane(struct prb_data_ring *data_ring,
> 				    unsined long lpos1, unsigned long lpos2)
> {
> 	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
> }
>
> Feel free to come up with any other function name or description.

I prefer "_bounded" to "_sane". And I really don't care if it is
"before" or "lt". I was only stating why I chose "before" instead of
something else. But I really don't care. Really.

My preferences would be:

lpos1_before_lpos2_bounded()

lpos1_lt_lpos2_bounded()

But I can live with lpos1_before_lpos2_sane() if you think "_sane" is
better.

>> You have overlooked that I inverted the check. It is no longer checking:
>> 
>>     next_pos <= head_pos
>> 
>> but is instead checking:
>> 
>>     !(head_pos < next_pos)
>> 
>> IOW, if "next has not overtaken head".
>
> I see. I missed this. Hmm, this would be correct when the comparsion was
> mathemathical (lt, le). But is this correct in our case when take
> into account the ring buffer wrapping?
>
> The original check returned "false" when the difference between head_lpos
> and next_lpos was bigger than the data ring size.
>
> The new check would return "true", aka "!false", in this case.

Sure, but that is not possible. Even if we assume there has been
corrupted data, the new get_data() will catch that.

> Hmm, it seems that the buffer wrapping is not possible because
> this code is called when desc_reopen_last() succeeded. And nobody
> is allowed to free reopened block.

Correct.

> Anyway, I consider using (!lpos1_before_lpos2()) as highly confusing
> in this case.

I think if you look at what the new check is checking instead of trying
to mentally map the old check to the new check, it is not confusing.

> I would either keep the code as is.

:-/ That defeats the whole purpose of the new helper, which is simply
comparing the relative position of two lpos values. That is exactly what
is being done here.

I would prefer adding an additional lpos1_le_lpos2_bounded() variant
before leaving the old code. A new variant is unnecessary, but at least
we would have all logical position comparison code together.

> Maybe we could add a comment explaining that
>
> 	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
>
> might fail only when the substraction is negative. It should never be
> positive because head_lpos advanced more than the data buffer size
> over next_lpos because the data block is reopened and nobody could
> free it.
>
> Maybe, we could even add a check for this.

If data is being illegally manipulated underneath us, we are screwed
anyway. I see no point in sprinkling checks around in case someone is
modifying our data even though we have exclusive access to it.

> I think about fixing this in a separate patch and pushing this
> into linux-next ASAP to fix the regression.
>
> We could improve the other comparisons later...
>
> How does that sound?

Sure. Are you planning on letting 6.19 pull 2 patches or will you fold
them for the 6.19 pull?

> Should I prepare the patch for get_data() are you going to do so?

I would prefer you do it so that we do not need any more discussing for
the quick fix. ;-)

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
