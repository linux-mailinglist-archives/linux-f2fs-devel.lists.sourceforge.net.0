Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JygKnL5w2kxvQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:04:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F257327733
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANuDp+dSUAV3KLXQd7YCLaILUVSdQbJSSY0Vxsn0sWo=; b=OV96qATjHOBYdUmc8GzNbUEZqD
	qwaLxgjbIHN97s7IXVNuTrU90XrymML5sDBahjU6KQIdBRdTtdCWGnXtGSQXUyMVNKPuG1R1T/Tvj
	tvrLM/f4m6tmN8mN6HfhfVPt3ZeRPSuETe3tLVTfXDobHGg9OQWr9TOsaJ7uVwkuJ+zU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PmK-0002VY-Jg;
	Wed, 25 Mar 2026 15:04:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <peterz@infradead.org>) id 1w5PmJ-0002Un-55
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIuxSunehHiRSvG/GnXThLOJmIPoTa6dLKg7+KpmcBA=; b=dIPo4k5gDDxy8fk/w50qwuI9Z1
 xOdQ0pvanh9DLdqzd6SYlcQxXJ0e9I8AMOoTDrAI8ncV6TgwPny/M1aOEWuYm7J8CU6JJf+Q09/Ew
 MPrBDMxfLXNa3cLklMsSewiWTd5MHzJNHPSbq/1BV1R38DtgGypoywUrRKJnZsvUhEj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mIuxSunehHiRSvG/GnXThLOJmIPoTa6dLKg7+KpmcBA=; b=cArqYrvtGbYiwesdya0sJBNdJL
 2pWl1zLXjnMN7pQUJJbtGEqhoZ9W3KN1j+8bp5eCxvGaSte4TqJdjzGwC/RJi5YydBxNAsKhtlw7I
 hSV/xWmGE8m4tK2bMK6PZySdJuKZsyeji8odAQ7BvgQSWmkJ3AhV+9EzRFVJLUzfk1T8=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5Pm5-0006Ve-Rs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mIuxSunehHiRSvG/GnXThLOJmIPoTa6dLKg7+KpmcBA=; b=m6jz0KGhdEoAUzgiWb3fMvmDvc
 diJl7nyhbSFzgiGsfrgyVrz4dFAu7PFy615kqUx1xmRJ2zhHEsNkmNZ5GRHCGZc0m685PQhyAmua/
 rZQJokxeHWs8tu9c9w5twyMGh6WicQyemkXAAA4W62R+jrxq7nww7a9CTXsL+5KQcm4GEo0+fSJnm
 p6N9wqVCq5BIYtfe2aX/qKZB73AAYeBOl2FrHhJmFTSS71WrVD6f05aXHYWjDE7y+SE1LXLWcj8hx
 KwJw20b6kNG6FoSMVZ9xbKVd2CfjY37v2Rib3lAvgp1Fx5M9rndMliOQbnEmCcGv+ZcX7GkJdUl/A
 ypSW7qRQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1w5Pli-00000006QVL-2LxD; Wed, 25 Mar 2026 15:03:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id E8F88300400; Wed, 25 Mar 2026 16:03:36 +0100 (CET)
Date: Wed, 25 Mar 2026 16:03:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20260325150336.GF3738786@noisy.programming.kicks-ass.net>
References: <20260325133322.1050573-1-ruipengqi3@gmail.com>
 <20260325135413.GY3738786@noisy.programming.kicks-ass.net>
 <20260325075332.c32528cd5a16bc7886421a1b@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325075332.c32528cd5a16bc7886421a1b@linux-foundation.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 25, 2026 at 07:53:32AM -0700,
 Andrew Morton wrote:
 > On Wed, 25 Mar 2026 14:54:13 +0100 Peter Zijlstra <peterz@infradead.org>
 wrote: > > > > > I still fully and totally detest all of this [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1w5Pm5-0006Ve-Rs
Subject: Re: [f2fs-dev] [PATCH 1/2] hung_task: replace blocker_mutex with
 encoded blocker
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
Cc: Anna Schumaker <anna.schumaker@oracle.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, ruipengqi <ruipengqi3@gmail.com>,
 Yongliang Gao <leonylgao@tencent.com>, Steven Rostedt <rostedt@goodmis.org>,
 Lance Yang <ioworker0@gmail.com>, linux-kernel@vger.kernel.org,
 Joel Granados <joel.granados@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar <mingo@redhat.com>,
 John Stultz <jstultz@google.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Waiman Long <longman@redhat.com>, Zi Li <amaindex@outlook.com>,
 jaegeuk@kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mingzhe Yang <mingzhe.yang@ly.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:anna.schumaker@oracle.com,m:kent.overstreet@linux.dev,m:ruipengqi3@gmail.com,m:leonylgao@tencent.com,m:rostedt@goodmis.org,m:ioworker0@gmail.com,m:linux-kernel@vger.kernel.org,m:joel.granados@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:senozhatsky@chromium.org,m:mingo@redhat.com,m:jstultz@google.com,m:mhiramat@kernel.org,m:longman@redhat.com,m:amaindex@outlook.com,m:jaegeuk@kernel.org,m:tfiga@chromium.org,m:will@kernel.org,m:boqun.feng@gmail.com,m:mingzhe.yang@ly.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=desiato.20200630];
	FREEMAIL_CC(0.00)[oracle.com,linux.dev,gmail.com,tencent.com,goodmis.org,vger.kernel.org,kernel.org,lists.sourceforge.net,chromium.org,redhat.com,google.com,outlook.com,ly.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid,infradead.org:email]
X-Rspamd-Queue-Id: 1F257327733
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 07:53:32AM -0700, Andrew Morton wrote:
> On Wed, 25 Mar 2026 14:54:13 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > 
> > I still fully and totally detest all of this :/
> 
> This is one of those mystery sends of material which has been upstream
> for nearly a year.
> 
> I don't recall you weighing in when this was under discussion - did I
> miss something?

I'm sure I replied at some point, because the original was going to
abuse the blocked_on field, which we need for something else.

> What's the objection?

Death by a thousand cuts and endless duplication of stuff and nobody
should grub at lock internals.

We have a ton of lock debugging stuff, but because $raisins people don't
want to run their misbehaving crap on a debug kernel, so we must put
'cheap' hacks into production kernels :-(


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
