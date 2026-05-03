Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEKyGqgO92mQbgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 11:00:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89D4B506B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 11:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6adgPMP8PIex3MReT2uiHZ2r+/VC3lv+w1z3K8/w+0=; b=TnlTtaVoe8svEUXps7qI1f1MhN
	irlkTlzjOOugLQPn15BPLL4Lv4XkF9/2dBflJCtVsyGVSP17oosUqW/5sTa9nMQJmqPKWIQRiFRZe
	snreBUa7J0cC6Zndx2ec86iIqwk581C9rZgNHTY8uldmBvvnLSMOyaAhMLSjTSu9vLX8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJSgZ-0004fN-8N;
	Sun, 03 May 2026 09:00:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wJSgY-0004fE-0p
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 09:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WDOsxx1y3hxSedd8J201DyJnvRsugO5hdGWLCgF2Lps=; b=k7aeF9QTTFqrmlCsSarcP+1aP6
 9/zuzyCTl55E0qIy+C7+sAJLsi2ogJc/VXlO3Y47swa8yZOvBinLXgUd9nByiStsa03bVosamEJB0
 rhxLEopLv08u//cnpsH9p0KCQ1FW+5S7Hek217ikMzjJok+015I7CJyufF/k1wgfpWUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WDOsxx1y3hxSedd8J201DyJnvRsugO5hdGWLCgF2Lps=; b=mocy7TzfdeMlF+dh3DfrnTv9Ap
 EDoJwoKw8bo6BOKhNN0GjxxioXdoXq3eGTMW0SP2t0u2mdzWFJ2dlOC8wAV3aUMy/ZYfdtpGm689+
 sjpYTdmTvrqOaRkTm4N3LMo2KHkryLlW9/kNRecL9nm3xHZXqddgaZE94eQz65YovSU4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wJSgV-0000iT-4D for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 09:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C4AB740B55;
 Sun,  3 May 2026 09:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F50C2BCB4;
 Sun,  3 May 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777798813;
 bh=s3S0iiMVvJEoUB1cUh8UR8xxo23zU97CWT6LJTFqzkw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Is0wAzKY9lti7ORBWLtFbQCBy4RaeXmJd/y5/t+Eklt3YkpOyatHSX1pycbQztf9R
 SO0lgXxe4xpaExNk2Fj/+jn+FcRglvCXoSVxVsihi/SEA+Rub9jMs0aKby2b7jrKZJ
 FKvk/0Q5dlFVqHtTHPMv3YGtk90c0AMNG2MGDTYSugEtPi+KrI4dSwfebV8jgU6Sml
 19HERYRuYl5J7oJwtLOnvNALTdAsV0ATWKbK/c1hdxJoMUgn32V5+jSZyvdQfOez++
 ygWQ6OwWEvcgWJnz1gUNq0c9nBwQ1xM/ajs9YRaQPDTPUJvUxGmGVo0jFPq6ruf8dx
 Wrb8nEIf6bmQQ==
Message-ID: <137eb793-7f09-4c70-bd20-2294a8763d53@kernel.org>
Date: Sun, 3 May 2026 17:00:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ginger <ginger.jzllee@gmail.com>, jaegeuk@kernel.org
References: <CAGp+u1ZpFon+1Cw8WxEv+kr4wRE_ibPACY+kGsoUeeB-aVa78A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGp+u1ZpFon+1Cw8WxEv+kr4wRE_ibPACY+kGsoUeeB-aVa78A@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/23/26 13:48,
 Ginger wrote: > Dear Linux kernel maintainers, 
 > > My research-based static analyzer found a potential atomicity bug > within
 the 'fs/f2fs' subsystem, more specifically, in > 'fs/f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wJSgV-0000iT-4D
Subject: Re: [f2fs-dev] [bug report] potential order violation bug in
 'fs/f2fs/segment.c', in '__create_discard_cmd'
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1B89D4B506B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ginger.jzllee@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:gingerjzllee@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

On 4/23/26 13:48, Ginger wrote:
> Dear Linux kernel maintainers,
> 
> My research-based static analyzer found a potential atomicity bug
> within the 'fs/f2fs' subsystem, more specifically, in
> 'fs/f2fs/segment.c'.
> 
> Kernel version: long-term kernel v6.18.9
> 
> Potential concurrent triggering executions:
> T0:
> __create_discard_cmd
>       --> dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
>       --> list_add_tail(&dc->list, pend_list);
>       --> spin_lock_init(&dc->lock);
>       --> dc->bio_ref = 0;

Hi,

Actually, fields of dc entries are protected by dcc->cmd_lock, so it should be
fine? it needs to fix static analyzer? IIUC.

Thanks,

> 
> In T0, the freshly allocated 'struct discard_cmd *dc' is first added
> to the globally visible list 'pend_list' (i.e., from
> dcc->pend_list[plist_idx(len)]'.
> However, its fields like 'dc->lock' and 'dc->bio_ref' are set up after
> being globally visible.
> This violated the expected order of setting up private local heap
> variables before exposing them to the global state, causing potential
> concurrency bugs with '__issue_discard_cmd()' or
> '__submit_discard_cmd()' within 'fs/f2fs/segment.c'.
> 
> Please kindly check at your convenience. Thank you for your time and
> consideration.
> 
> Best regards,
> Ginger



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
