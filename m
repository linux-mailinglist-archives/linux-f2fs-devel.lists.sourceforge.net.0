Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPfNHzWwwGldKAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 04:15:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD482EC132
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 04:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kH6JkkT+aA9dzkk7ss8agxXbzM+x06NJJvum4PGJo4=; b=UHE6aRM0WOvUNKFNt8gLsWEX7I
	USG2wsyNuTWtPM6a6UGI5cqSDxo5eAjNWPQKvj8WB8cgHTl2MkPbWwMMpvDmx7dFm1q/+M84BNk3f
	WivHxwBVobh2s3ojTUKby2EhWH0e2TqKvsUhquTQvrvn2LBwmSWo3vRw2wrumlM3Fd2Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4Vkp-00073a-P3;
	Mon, 23 Mar 2026 03:14:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4Vkn-000735-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 03:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0uMbHoXkzvBFlJxACWl3bZjVxh5XweLR+jNxROsxi48=; b=kgq27xe64yL9nOGhG3GKtD9tzm
 UhGXPsacH5dPJQd4Zef3iH96nLcysO6axlok69Zr7cwAgeaZy7DOa79chfX1XLMi1EOdRc3swA1Fg
 VJ2wkD22O0OGtkBmO3w2uvFUoJjOBXy2ooiG8v5r6853zy2aRkT3VAkH2xvte+OxOyGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0uMbHoXkzvBFlJxACWl3bZjVxh5XweLR+jNxROsxi48=; b=FLRAGwkjbCBhs+VS+Dfn5AFWyV
 V3sMkJMZ/p+cRfz3oraRqRVgFfz0hxkF5pOHALHtlom3NmgkpfzAvch1ZgbpuuLHHwUNVYtqBoqgc
 MERpZDXqaPKNzZUtCdhAn62wLcDMWnvYsbbDAuNITOFC7xep4a2jeE7FIhi6oMy5/vSM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4VkL-00008d-1N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 03:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 709E960008;
 Mon, 23 Mar 2026 03:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF61C19424;
 Mon, 23 Mar 2026 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774235658;
 bh=HtTo2MR7FX/XSmMO5nwMt6KFsIRKfj2g+cviNbnmnz4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qL9O6T6Ym2mvTEu+LupaAfpqWIpxfkZDitTar0GCUBTOqfAzltPKgJrEzhoPHL+An
 egPik7GzlNoLNqBI4zsxrTsjo7Ixc6DDYLpHu8DufUIvfwg1yZ5+a8gJm0YIBxT0Mz
 a5c3s0fxavSi81Ctp4NnnmKzR0X0pTlIW14x3X/27lak3kB2Zb7+uiQt9JjGf1/Gum
 zveN52Mp1H58sOgTRX9uRgDCzFyLS44gHqhc5G70AUQQtSuZKIt5/BYqgt5KREAu2h
 DL5sjr5h5JVoIfnFqafYbwAMy+MD/knk7D5J/Z46oSBy6DkchJa9W6qkv5U3wKUEpc
 vHY6MebBBwtlw==
Message-ID: <37c11065-e055-41b8-82a8-68f2fdf56ac3@kernel.org>
Date: Mon, 23 Mar 2026 11:14:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kth5965@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <b044d785-cf71-4186-b208-c375c605893b@kernel.org>
 <20260319151121.39737-1-kth5965@gmail.com>
Content-Language: en-US
In-Reply-To: <20260319151121.39737-1-kth5965@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/19/26 23:11, kth5965@gmail.com wrote: > Hi Chao, > >
 Yes, I agree with your point. > > I also think 2) is useful to detect the
 corrupted inode earlier and to > make the issue visible through log [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4VkL-00008d-1N
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: evict: truncate page cache before
 clear_inode
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kth5965@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 3BD482EC132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 23:11, kth5965@gmail.com wrote:
> Hi Chao,
> 
> Yes, I agree with your point.
> 
> I also think 2) is useful to detect the corrupted inode earlier and to
> make the issue visible through log and returned error.
> 
> But 2) alone does not seem sufficient, because we can still reach inode
> cleanup later, and then `f2fs_evict_inode()` can still go through the
> inline conversion path.
> 
> So it makes sense to me that we need both:
> 
> 1. earlier detection / guarding in sanity check
> 2. fixing the empty inline conversion path so page #0 cache is not left
>    behind
> 
> If this understanding is correct, I will prepare the fix in that
> direction.

Please go ahead w/ this, thank you!

Thanks,

> 
> Thanks.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
