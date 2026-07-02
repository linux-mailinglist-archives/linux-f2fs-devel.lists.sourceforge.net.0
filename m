Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9MD0LtMTRmqYJQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 09:31:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9C6F4311
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 09:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="C23r/Lz5";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=RZxQws+T;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=UZMyEdzY;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=cbwqN2A+;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8XsfXCcsjqxZ0aM5R7DwWQxAMjgriiXTJCxrfO3b/g=; b=C23r/Lz5d0Oxfw3FVht42Av9E/
	loosW+WsFk3Rzvow+o38K9Xawhk3ufdGV5NZbTV33PhmYK2hDM3cCplxW4PTSwnMJtsYtyCLuawWY
	H6nRtDV6dOzri//98Rzybej9+xvweUuo4GAoUzNSZfnRajZOZj6E3hFyB5X9Vsz5QGCU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfBtL-0004He-Hz;
	Thu, 02 Jul 2026 07:31:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wfBtI-0004HX-Jn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 07:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ijDypNty0/TeiekgDrrpIqxObZzPGfiCYiiEMG4e/c=; b=RZxQws+TDIJUWLKvyl9Krd+snp
 0N7DQ/sW8GnioQgo2j0mSydNYzgkTK8N8b8aVealh6tRXVsri07uMWmwo5osqQ0nSVGObMjEYc3kL
 E39/WdToGEs0l1o9J4jRgtez8VeKDcFOS4sOeDNgQhg5H5BEkL26sNt4AoNmJM7zTY/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+ijDypNty0/TeiekgDrrpIqxObZzPGfiCYiiEMG4e/c=; b=UZMyEdzYVXa8bR2JMSNSNAo8HB
 vRLaO8XGRUsLcNJsIEySTV+FWY6YY+n1M6qBACiZbBynHjCsOpmx6eKnpJdlW2ZSE9sS6mVLpIVi8
 q9qu2ZFPHPRcIhl9nbVa8xUbPhqPS7QSPXg3FUltnp+ZC3VP9zH1KBsCkRCRJfUAVGoc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfBtF-0004FG-Na for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 07:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 814A66001D;
 Thu,  2 Jul 2026 07:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E641F000E9;
 Thu,  2 Jul 2026 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782977467;
 bh=+ijDypNty0/TeiekgDrrpIqxObZzPGfiCYiiEMG4e/c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=cbwqN2A+KilnsiHdSeZ4WgPq3U0imwQjl4OEHQPlYCM0fLFFiBdBHQte7oZ1FmlAg
 xZGjcgsocxblP0v4j8z+u28dD4eFYv9+DLbhf+bSB3+ksagZPzTuj3Hi5/VQyysAH5
 f9wvpyTm/NJ2quoP5soaM3PpTtFjbdkkeDzd4VcUe6le7kxMQnGHbuiIprcMD8kX5M
 kHzw7cZXNYzJH5CbfhSIv5aRyWZpDpXahz1Umf9amkrNefxGR9Y9Ll9cLxmSLCm5hO
 F9sWExnsajzBu1ybBnkZ663Md6Yc58mdDod5yTKgvA4FIwQUG6vXW8rkCUQ21cK6yc
 KOrO0qB5azBBQ==
Message-ID: <e241092f-1634-47d3-befd-00fbd4a65706@kernel.org>
Date: Thu, 2 Jul 2026 15:31:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260702065602.4120914-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20260702065602.4120914-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/2/26 14:56, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 From: "xiuhong.wang" <xiuhong.wang@unisoc.com> > > After commit
 b15b6cc56ac7("f2fs-tools:
 convert to lseek() and kill > lseek64"), 32-bit And [...] 
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
X-Headers-End: 1wfBtF-0004FG-Na
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs-tools: Build f2fs-tools with
 _FILE_OFFSET_BITS=64
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
Cc: "xiuhong.wang" <xiuhong.wang@unisoc.com>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:xiuhong.wang@unisoc.com,m:zhiguo.niu@unisoc.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unisoc.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50A9C6F4311

On 7/2/26 14:56, Jaegeuk Kim via Linux-f2fs-devel wrote:
> From: "xiuhong.wang" <xiuhong.wang@unisoc.com>
> 
> After commit b15b6cc56ac7("f2fs-tools: convert to lseek() and kill
> lseek64"), 32-bit Android should also be built with
> _FILE_OFFSET_BITS=64.
> 
> When calling the lseek function on arm32, if the offset exceeds 32
> bits, lseek fails. Therefore, the flag _FILE_OFFSET_BITS=64 is
> added to support operations with offsets greater than 32 bits on
> arm32.
> 
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
