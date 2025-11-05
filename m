Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27133C37990
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 20:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maDxC9pI2RAtSO4X1sUtG7ZwBJHnEX8achMC/OL4S8Q=; b=mol4UR/v/mJiKEm/suTUlhVSjk
	SetlSbfnlPXG/XLAJ+rObFApB2bo6J/6PZCqhjoxZOhUo/2s8Jo0GAUBsi9fZmD23Ob7tlo/6VYfZ
	0BZDqM3sSRZrxk5eAqs6YfDlO64xoTjgMebF5jgT+eNY9W28ZgqP2yFGL7OVqThmJW9w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGje5-0004Y1-VD;
	Wed, 05 Nov 2025 19:58:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vGje4-0004Xv-4F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 19:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0Okumwv2i/9MTHqqUn+mKL3pMAEP/LLr4SPEwH8vDA=; b=jaN5+iY8wicTjT2+WYerFgi419
 AHmBLOPagXM4ggkYkmMyd6wrEVCLxmygX8XzuQ3u6cFHLkbNrFy/4mw5YBc+iu+ElVc8OotRhaW2J
 ZwS9UE8dm7sOtRhT/ZrZJWjWtUsQl/DQlt6jS4dZhT3e1jXSRKMkfJSFTEh2dEe0ypV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/0Okumwv2i/9MTHqqUn+mKL3pMAEP/LLr4SPEwH8vDA=; b=F4w0fU4bNMX1I7kz2bA9cDzKtG
 BY1sbJhNNm4+G5UJxQ6/HtZnm6DhK8J2HoY/QdWtSgkgA7JwzbnH+jrpYz9MdKwwD0mk1MCONzr9f
 6mXfyqYy4tAYxtxGPlGN2cKH5w49bjnZLrqW66ofQbfgbdbsjeWv6gqdpocHaQv6fomQ=;
Received: from [193.142.43.55] (helo=galois.linutronix.de)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGje3-00053I-Ho for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 19:58:16 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762372682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0Okumwv2i/9MTHqqUn+mKL3pMAEP/LLr4SPEwH8vDA=;
 b=YadV75EqqrChNko7W61kSE7LTp9KNUVgJOpsBNRK0sYVRatElmdQHw3YK/33Ev0WkW8bI2
 0i3CE/80EDgrpib0ydGQDBh/ZJGRrJL7EIp/POOGsD4V/6wkL8/XZcA7CPiyO6PK9m+8tM
 dqA2hFq8KAGpjVpq/LZsbdX5dBQvUA3ZkeVbSJ2oSu5Zd6Q7366vKvV+HzJ4d3ikhQFtMm
 7v2rVCoFb31ks69IVdK/QCPgqoJrxmeNHIzQFuakaDrdvWWd8N9N3V1NzRGl4gmP4NJ/PW
 q9LTxmKlp2Pp3kjClmmgjKPD+Cepu8/hrZj8XlRdZVH/j/USXMssTzRRcSC0eA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762372682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0Okumwv2i/9MTHqqUn+mKL3pMAEP/LLr4SPEwH8vDA=;
 b=cgoR/Xr3pmYydMuv3YWSAL5rRLtSuwHLagt0qe4h/yfBvnLYkaAZ7dqg6Wi4dbs5PGPOa0
 UTuqS04wCz72B2Ag==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aQuABK25fdBVTGZc@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz> <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz>
Date: Wed, 05 Nov 2025 21:04:02 +0106
Message-ID: <87bjlgqmk5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-11-05,
 Petr Mladek <pmladek@suse.com> wrote: > I guess
 that we should do: > > From f9cae42b4a910127fb7694aebe2e46247dbb0fcb Mon
 Sep 17 00:00:00 2001 > From: Petr Mladek <pmladek@suse.com> > Da [...] 
 Content analysis details:   (1.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vGje3-00053I-Ho
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

On 2025-11-05, Petr Mladek <pmladek@suse.com> wrote:
> I guess that we should do:
>
> From f9cae42b4a910127fb7694aebe2e46247dbb0fcb Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Wed, 5 Nov 2025 17:14:57 +0100
> Subject: [PATCH] printk_ringbuffer: Fix check of valid data size when blk_lpos
>  overflows
>
> The commit 67e1b0052f6bb8 ("printk_ringbuffer: don't needlessly wrap
> data blocks around") allows to use the last 4 bytes of the ring buffer.
>
> But the check for the data_size was not properly updated. It fails
> when blk_lpos->next overflows to "0". In this case:
>
>   + is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)
>     returns false because it checks "blk_lpos->next - 1"
>
>   + but "blk_lpos->begin < blk_lpos->next" fails because
>     blk_lpos->next is already 0.
>
>   + is_blk_wrapped(data_ring, blk_lpos->begin + DATA_SIZE(data_ring),
>     blk_lpos->next) returns false because "begin_lpos" is from
>     next wrap but "next_lpos - 1" is from the previous one
>
> As a result, get_data() triggers the WARN_ON_ONCE() for "Illegal
> block description", for example:

Beautiful catch!

> Another question is whether this is the only problem caused the patch.

This comparison is quite special. It caught my attention while combing
through the code. Sadly, I missed this fix despite staring at the
problem. I was more concerned about making sure it could handle wraps
correctly without realizing it was an incorrect range check.

Tomorrow I will recomb through again, this time verifying all the range
checks.

> It might help to fill messages with a fixed size which might trigger
> blk_lpos->next == 0 in the 1st wrap.

I did this and indeed it reproduces the WARN_ON_ONCE() when next==0. And
with your patch applied, the warning is gone.

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
