Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VeNWGERdTGqOjgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 03:58:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E340F716B69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 03:58:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=TlgYuWSL;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=kFZB6Zp5;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=gsOKow4J;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=OpgaYWNu;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3C3IiX7aECpYbAZtTuJUmtksy933INDBACdT54JLarU=; b=TlgYuWSLYnw0agZ3fSTWZxzF7G
	L447jHXwaMHpII0+yr1Z9lkwLdSR8igbJw0qKC9vvOGk+qC1osl1fclDfOOknb/BUvN+PXaJf6Mw8
	WcV95lXey2BR9HH8shfz6RISzutMNsUtf5w9rQspnGTDycTF0mJKXB2N1O81A+BYsImQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgv4j-0005xp-1l;
	Tue, 07 Jul 2026 01:58:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wgv4i-0005xj-Hr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 01:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yX6kQd4IxcUrVBpyK0AZR0ZFyYkTIptJMlIrBriMmSY=; b=kFZB6Zp5XIHxg0iYtZvlKA/tdZ
 WxquEE85myCiw7+jsMPOmHOdWwAKXJVD3CH6aAN285OGD8QKWcefvZJ1/xNh/OUdeUzRmOWGFLWCs
 /lXi0qlmg8WEsUWBfUFFBkM9ccVhYt8mjAcYGBP3gf4CiRc49t55GU8hvUdMgW0/13CM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yX6kQd4IxcUrVBpyK0AZR0ZFyYkTIptJMlIrBriMmSY=; b=gsOKow4JYdj5i7b784zg4kr6Cn
 ZCq2aSdqpCwsHoDHPUFnHOOcb3bwSFd2l+YIOlop3GK1HSUHHzZ4tFGYZr2lGavmyb1fXpagzqLQo
 f/Ff3YPVJ+PsneXzlZrHFyBUepz/vT+gZxIL9rNpRzdQzRK4pPS4H7YNVi5KDHFYUi0w=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgv4i-0000oA-CJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 01:58:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 871F74061F;
 Tue,  7 Jul 2026 01:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE581F000E9;
 Tue,  7 Jul 2026 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783389491;
 bh=yX6kQd4IxcUrVBpyK0AZR0ZFyYkTIptJMlIrBriMmSY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=OpgaYWNucNSz/C6IiKyQu23dJbn/Oi+ZR2f9xvq+3MRZ94VMSBiUHS2UDXABp+00i
 eUU/G7bIkYKxqOMKx+ZdkF1CpAh9FcqNHChwlfB3P94JQ9fpBvrYO4AyGHJkvyurB0
 VP9Kg4ezadElVCmVYUhyJFaliqz204JO8bPCrk0a2mDRi/mABXDHi8tTrU5urc4WIy
 5jtvqyT8b+QuOI94s6gdEQ9Fws2zWZkd+JmqXvzm3r1sNbYOJ/bW+mJDpwp2atx/sr
 1UR3QaoB0uCzam68k7oVDOQjaAtQRPbAE8eukuGsrabEbeTKKzxpwCegOi/AkkLw68
 Nwkz5o0plWfSw==
Message-ID: <dcc490cd-01f5-4d11-84e0-f37efd1b6b47@kernel.org>
Date: Tue, 7 Jul 2026 09:58:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <20260706095943.2560208-1-chao@kernel.org>
 <akulrzxMUbI5Kr3D@casper.infradead.org>
Content-Language: en-US
In-Reply-To: <akulrzxMUbI5Kr3D@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/6/26 20:55, Matthew Wilcox wrote: > On Mon, Jul 06, 2026
 at 05:59:42PM +0800, Chao Yu wrote: >> - folio = mapping_read_folio_gfp(mapping,
 off >> PAGE_SHIFT, >> - GFP_NOFS); >> + folio = mapping_r [...] 
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
X-Headers-End: 1wgv4i-0000oA-CJ
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: quota: do not use GFP_NOFS in
 f2fs_quota_read()
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
Cc: jaegeuk@kernel.org, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:jaegeuk@kernel.org,m:jack@suse.cz,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E340F716B69

On 7/6/26 20:55, Matthew Wilcox wrote:
> On Mon, Jul 06, 2026 at 05:59:42PM +0800, Chao Yu wrote:
>> -		folio = mapping_read_folio_gfp(mapping, off >> PAGE_SHIFT,
>> -				GFP_NOFS);
>> +		folio = mapping_read_folio_gfp(mapping, off >> PAGE_SHIFT, 0);
> 
> 0?  Surely you mean GFP_KERNEL?

Oops, my bad, it should be GFP_KERNEL.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
