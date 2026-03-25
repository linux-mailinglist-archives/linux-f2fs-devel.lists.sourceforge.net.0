Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GbPLRr7w2k/vQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:11:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40310327960
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Mime-Version:References:In-Reply-To:Message-Id:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPIA4pF5MQgXJqS6WnlOFX9Kxv+uXXZ0P+58u7HsAYE=; b=UWU9YoVfBlfaGNvHVe3RSZHkaf
	pDd5nyD6TOuRWxDiBD77XCkWRnr2DmZRtwIoXZoIRNo2N+2obE5+crMJ2UXqpbW2LgBFpR9umRQau
	LqTheBQ9WEXEOP6P73M9Uu8xdr1t65O0M/hnqkuExoizD6bYYQRxR3nYcC4kYo0fjw3Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5Pt7-0006EO-2d;
	Wed, 25 Mar 2026 15:11:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1w5Psk-0006DS-2F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dH/HikHS0Z43yKF1/mCPjOqgmV+U9gh7c/HR1qGU5to=; b=gxYup8uwo6NXECTD8+edwOXTC3
 DMFfipjNsH5ldj8JQwnh28O1JQYX04BmgbFtAZ8VCiVk+Bzz5eHZmKFyMEsHlixD3Y+sCSinLb7YJ
 Fm7QIi6kgyFXCoRiQ33XDAX4F3Xlcs9bHQHxOcoxEhheSjYeK19Lu57GZlgFcrGLxY6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dH/HikHS0Z43yKF1/mCPjOqgmV+U9gh7c/HR1qGU5to=; b=MglfMPhLPKSLvNRlO7lhGmqGhh
 GYgT6+cVx4lvKWhkjNoURn/QhnjW5LE39eO8c0wB9fmlV7OrcSk64kcEJT3KfoQKokdK13QdNTgLb
 GLmXNP1RcbrtAWEqCTpmI8ujvJ2E3Tn207K+Jdt/K55TwpkbdGuVU8G7Z9eqNeX9dc0E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5Psj-0007Si-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3235341661;
 Wed, 25 Mar 2026 14:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E794C4CEF7;
 Wed, 25 Mar 2026 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1774450414;
 bh=q2p/caJLu8pgVOjdyT3CZ8x/Y2Xscg0zLpvXvsseD8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D+hj6iIk+0w+xk85T8d/IyEtFWgl4HYqHqdhqdUgrNWbItcGpyg7gBkHlwVQFaSjM
 hlTFjZnwPnx9tFFn7OWGrErqZKHx+RMUOuqa0NIbVvD4PQBlu5KGgdgAtUEpOA4RZV
 HjFakHOJnfaFHVScNx5U2pNor538ZXzijk/44xxA=
Date: Wed, 25 Mar 2026 07:53:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-Id: <20260325075332.c32528cd5a16bc7886421a1b@linux-foundation.org>
In-Reply-To: <20260325135413.GY3738786@noisy.programming.kicks-ass.net>
References: <20260325133322.1050573-1-ruipengqi3@gmail.com>
 <20260325135413.GY3738786@noisy.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed,
 25 Mar 2026 14:54:13 +0100 Peter Zijlstra <peterz@infradead.org>
 wrote: > > I still fully and totally detest all of this :/ This is one of
 those mystery sends of material which has been upstream for nearly a year.
 Content analysis details:   (-1.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain -1.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1w5Psj-0007Si-Ei
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:anna.schumaker@oracle.com,m:kent.overstreet@linux.dev,m:ruipengqi3@gmail.com,m:leonylgao@tencent.com,m:rostedt@goodmis.org,m:ioworker0@gmail.com,m:linux-kernel@vger.kernel.org,m:joel.granados@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:senozhatsky@chromium.org,m:mingo@redhat.com,m:jstultz@google.com,m:mhiramat@kernel.org,m:longman@redhat.com,m:amaindex@outlook.com,m:jaegeuk@kernel.org,m:tfiga@chromium.org,m:will@kernel.org,m:boqun.feng@gmail.com,m:mingzhe.yang@ly.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linux-foundation.org:s=korg];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[oracle.com,linux.dev,gmail.com,tencent.com,goodmis.org,vger.kernel.org,kernel.org,lists.sourceforge.net,chromium.org,redhat.com,google.com,outlook.com,ly.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linux-foundation.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,infradead.org:email]
X-Rspamd-Queue-Id: 40310327960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 14:54:13 +0100 Peter Zijlstra <peterz@infradead.org> wrote:

> 
> I still fully and totally detest all of this :/

This is one of those mystery sends of material which has been upstream
for nearly a year.

I don't recall you weighing in when this was under discussion - did I
miss something?

What's the objection?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
