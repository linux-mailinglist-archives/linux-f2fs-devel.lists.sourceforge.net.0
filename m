Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9kv4CAjAMGokXAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:16:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B7068BA78
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:16:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=MvC0JEy4;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bv3fUE1b;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="B+R/Czmg";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="OKLThBm/";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAxiWOkwAhRdBbcpzLKLshujln0AzlNRscLhzyE1qDY=; b=MvC0JEy4pr4uN1lltPAuubgDt0
	Q3nJNmzoFQsEIQnHZaNLyPj/pwKywwIt1WkXcE/pjddo7AUzT/2i+iq0TkkUFYz3LcxCJoiQCWGmi
	HOiil1DdPMNQYp7IP5k7nEBILZ/sjUdKsaa6gNX23iIALhwJD+40z4SuBSsJFmzZyZsg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZKHj-0004kn-Ma;
	Tue, 16 Jun 2026 03:16:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZKHj-0004kf-1M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7qcGy97RJthIKYNTKcmD6a7zj/H4lLk55pYE5C8ndeU=; b=bv3fUE1b6fHXYhjK6I/NCTqYo1
 ewp963S24vu+ER2Ja3vZp5zHQz/2m2gdd6fHPDbXZ9GEjzET1GFzPUtOFaC25IFhk1Ww0fhQ+xiFV
 +7Vm4q6m3ln/6B+tYdZWd77v8N8e6iyubmbYchw3BmwsYqFFb/DzW5sCmRUfgco157O0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7qcGy97RJthIKYNTKcmD6a7zj/H4lLk55pYE5C8ndeU=; b=B+R/CzmgbW6iTB3eeXf3i6w/ud
 8Syishv3Fm4ky4dZ/GsQLjPuNyEmgLYdtYQf89madfp3Ngr7fOpSrEe9+UC07uMeibzugvaFwZdJc
 VHRBuYrGkFDq+3vpJYJ7MyM4BmlQS5ema8qjZ4UL+PHPElu6ZhV3JJ3gdZ8NRoJTO1iE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZKHh-0003XM-MS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:16:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CE70F417D7;
 Tue, 16 Jun 2026 03:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045111F000E9;
 Tue, 16 Jun 2026 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781579767;
 bh=7qcGy97RJthIKYNTKcmD6a7zj/H4lLk55pYE5C8ndeU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=OKLThBm/0yGIg3ovDVMnd3wSvUHacHkZj0QZz4hAu43R3lLtYPAAM0eLjXvgXIYGt
 82cDUvTLaKj/d8eMAX800aFJ3jcITs8VP5Y9sltdiL4kHMjbGvJP/teweReW1NG3eE
 BF4puJN2tSkvip2/PSBUYuYITE+p8vGOoBl1nXvTxttrAVkc1XcxecwiAqarOgu/WN
 dhjD+5W1Gpgx7t3OyB7FJbYoV5ARbGusOY3b48kX97WzwSBGVuvEMa7srnRt0dLi7z
 MGK8sGGA8P2oJUmjjtmVk9U1LGeyETQyVtfpIhPGMvLCAd2784Oyp/0/kH0EwHAKDW
 cxE+vFYlSqa4w==
Message-ID: <d9db27f3-3328-4490-b8a7-292d76b017d2@kernel.org>
Date: Tue, 16 Jun 2026 11:16:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260616030655.111933-1-qiwenjie@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260616030655.111933-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/16/26 11:06, Wenjie Qi wrote: > F2FS iostat is optional
 and is disabled by default. Direct I/O still > allocates and binds a
 bio_iostat_ctx, 
 updates the submit timestamp, and > replaces bi_end_io [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZKHh-0003XM-MS
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: skip direct I/O iostat context when
 disabled
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
Cc: qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,xiaomi.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2B7068BA78

On 6/16/26 11:06, Wenjie Qi wrote:
> F2FS iostat is optional and is disabled by default.  Direct I/O still
> allocates and binds a bio_iostat_ctx, updates the submit timestamp, and
> replaces bi_end_io for every DIO bio even when sbi->iostat_enable is
> false.
> 
> The byte accounting calls do not need an extra guard because
> f2fs_update_iostat() already checks sbi->iostat_enable.  Only skip the
> DIO bio context setup when iostat is disabled.  If iostat is enabled
> through sysfs before submission, the existing context allocation and
> latency accounting path is still used.
> 
> QEMU benchmark on a 1GiB F2FS virtio-blk image, with iostat_enable=0,
> 4KiB O_DIRECT I/O over a 64MiB file, 50000 iterations per run:
> 
>                          baseline     patched
>   direct_read median    65264.50 ns  55470.95 ns
>   direct_read recheck   65553.75 ns  55470.95 ns
>   direct_write median   68054.62 ns  56309.44 ns
>   direct_write recheck  66873.51 ns  56309.44 ns
> 
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
