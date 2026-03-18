Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOKjFg0kumk3SAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:03:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE12B59FD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rmqgvi1V70NYcnHlkzLHxstocU69fes6+N4ZNtjRxk=; b=gX3Fp7hsq4oOb4C2OlYssEM5Xt
	hT8HZV575mUu2EQjuKezilDWHI8E3Pm77wXcLyHYSqRrvdzwlxreViYyolJc1eYkX2csvjPdurvQB
	q1lKunQ/gaMl68tdsIrVSkhsgHCmOWL6SCURVj2b6drTeJ4obvbGVKLrqePcrsSytHg0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2i7v-0003fd-Qz;
	Wed, 18 Mar 2026 04:03:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2i7t-0003fV-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PEdujb661gROLJcooaLhpq9gm6EVAb+yGjsrgUbX6oo=; b=PzBAAzOCfm9iRrXBeqIEu8nt0D
 NKo/nT+UoHuAeCqpRr6ByLGXLHiCpfW0XrSpkLDWAKcDtf1khYRdldGFDL7k4DJmdOra82yccVoQR
 moZbhTawWpomevjlHptTLWprkUuBRWhpm1nOJVrgPR+UrDL2H3FTov3L4ZoSdQC/cI04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PEdujb661gROLJcooaLhpq9gm6EVAb+yGjsrgUbX6oo=; b=FEeEhR5WlCie3bqvT0V0OA6TW2
 1vBHD5xAoav3M9sCKu8IdwujtGJtQ2mY0tQ3wpr0GHQZaATorUblJcpg9b4euFVl4HDeAnvJ5Ib6Z
 exytjNL3DzqTNAm/jxT1aVpl0UYI1xhrJ6IPpRFAGz9wbfmA90L0Nsb2Ehvno99ZQS9g=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2i7t-00064J-5k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 855DC60054;
 Wed, 18 Mar 2026 04:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02DFC19421;
 Wed, 18 Mar 2026 04:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773806595;
 bh=uo8IwZ+QJ23+L4LoOhLmPA7dGtlrCWIGhHTduxhKTm0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cknwmSxKWLKQLh4ROO8Sk0WAn01RzKfzgBP/1xV/mgW6ortcIwimFC+vU7ZXmJfZq
 7kr9SFZ86oUj6Zvn3/63zfsSydXP5u3wPgncsNGbobBEj9r4+eT4UGuHeTpxQ1Ze57
 ZWCrafv6GcbUJ52k7e+p5xhv/chyPaj7xlZkwpTe/Rsg29KBeaUtgIIPaLxQXkk/9j
 0h2QVa9AwgCxlHCkzwn3ZkuVGKm3rBRuMMO0rdx3D5WT9Q+zpSGBeA+gpccG1wgsFr
 BWztPburX5sp2fwZLhN2leIjcuE91Xe//t36Tti0+8VI3mADmeIrYDhrI9FfOjPXsj
 nG1deLCFf3Gkg==
Message-ID: <da81990a-4c7b-4268-8249-797d132be58f@kernel.org>
Date: Wed, 18 Mar 2026 12:03:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260316185954.2185806-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260316185954.2185806-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/17 02:59, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Suspend can fail if kernel threads do not freeze
 for a while. > f2fs_gc and f2fs_discard threads can perform long [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2i7t-00064J-5k
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to freeze GC and discard
 threads quickly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,android.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 2EEE12B59FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/17 02:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Suspend can fail if kernel threads do not freeze for a while.
> f2fs_gc and f2fs_discard threads can perform long-running operations
> that prevent them from reaching a freeze point in a timely manner.
> 
> This patch adds explicit freezing checks in the following locations:
> 1. f2fs_gc: Added a check at the 'retry' label to exit the loop quickly
>     if freezing is requested, especially during heavy GC rounds.
> 2. __issue_discard_cmd: Added a 'suspended' flag to break both inner and
>     outer loops during discard command issuance if freezing is detected
>     after at least one command has been issued.
> 3. __issue_discard_cmd_orderly: Added a similar check for orderly discard
>     to ensure responsiveness.
> 
> These checks ensure that the threads release locks safely and enter the
> frozen state.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
