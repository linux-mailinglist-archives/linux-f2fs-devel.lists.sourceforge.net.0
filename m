Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBdMBg2Bw2nZrAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 07:30:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E893202B9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 07:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPNttcehIW+PdSJ2IcKFAD4M4IJJGf8B9zgsb0qgAD4=; b=Y2JKoHFE5am4BjalK1XzJ4FQvo
	n+ofqujabTzOQXahqivxioNE3m4VlS+kAYhhgUj9PR463Y54BPKIV29YVV+bzV7iQ9ryocyyhqzt8
	Nee3ssMqS86Gzfqef82N88ahjYAddUWUTqEOsxZMxAGWzMnQlG++fmQm9ZsH98VZnvDY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5Hl1-0003MZ-8k;
	Wed, 25 Mar 2026 06:30:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w5Hkz-0003MT-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SHzbgvVXRhkBw3a61QihbzN/MTB/vp/jm4iOfE0lKns=; b=Mcnhh25KNaqJsfzovIoZ792W6y
 cqyRXoN4RYjTBUsiAH8E8XJNcHW/KrSQiblmZYq9FB4UCpxhiYxEXM4DwdarXaJP37gEJkX/oY1gS
 Ls40DdFVKlQGUNbVsZUJsrQDWjZoz+oslERjTmdHcQS0C/4q7YXrrWwXv0+JO+YSR/kI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SHzbgvVXRhkBw3a61QihbzN/MTB/vp/jm4iOfE0lKns=; b=NVFIUhLqJa0cF+a2fyHlGB9ytp
 JPYbZ7EHoTG/SgXnNRJ38PDRUbwHO8YETnjuBj2RGFRefYkzBHFY0AyT+hDw41gGMKKpEY4B4iKdN
 NSiIAXkKcdH8OVkI+nBtsxaQ2AsBVZhILaYHv13ZYMrj+nh4saV7XHxyS7QbvN6OwOao=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5Hky-0002cU-KI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 06:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5898600AC;
 Wed, 25 Mar 2026 06:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E803FC4CEF7;
 Wed, 25 Mar 2026 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774420213;
 bh=GJkdHJL8jbzI0cvYfVjlcOX4u1soS5SlVk5upSvOhck=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=N+e9jmL54g+k15rZtjbqbRiqeaeGSF3BAvReSeKWmVSVDiCjM835SEaAodWvVY81u
 tQPSOq0k5+DsRnAdNR9oxdk2VZF6mXLoPMASvrlmVMDDxMrtKVh6g43NRUtQuPPRj6
 vwYGjXJ9Mrt35YtS0fMleE+v1J9VyHzr93eDzczBJs+5kx9Y//iS8Hzp+KAFcjUVP5
 jyyl8kTBcGQHvDONGspVpXJbGZF3cUjvc/xg6xK2IHxTyZFk4pI65TruorE1KYtoj8
 jpCUxWnGLkyyKdznBOdfvBH/8tW2OiV1Fds5oy+yF5rOFt3yV9Kl2aac4NRxwk1GGa
 vxWZpqYor0xTQ==
Message-ID: <db814739-7fae-40ad-87aa-53ed159dee31@kernel.org>
Date: Wed, 25 Mar 2026 14:30:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>
References: <20260324025656.493776-1-chao@kernel.org>
 <acN4PWKHvk_33VB7@infradead.org>
Content-Language: en-US
In-Reply-To: <acN4PWKHvk_33VB7@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/25/26 13:53, Christoph Hellwig wrote: > On Tue, Mar 24, 
 2026 at 10:56:55AM +0800,
 Chao Yu wrote: >> This patch allows to run generic/791
 on f2fs. > > When was this introduced? This doesn't curren [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w5Hky-0002cU-KI
Subject: Re: [f2fs-dev] [PATCH] common/rc: support f2fs in
 _require_fanotify_ioerrors()
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:jaegeuk@kernel.org,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: A9E893202B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 13:53, Christoph Hellwig wrote:
> On Tue, Mar 24, 2026 at 10:56:55AM +0800, Chao Yu wrote:
>> This patch allows to run generic/791 on f2fs.
> 
> When was this introduced?  This doesn't currently exist in mainline,
> and it would probably help to run your fserror implementation past
> Darrick and fsdevel for review.

Oh, let me Cc Darrick and fsdevel for review.

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
