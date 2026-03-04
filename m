Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OChYFTAdqGnyoAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 12:53:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C21FF56D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 12:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAl+KHrAyWouog2xdcYIdOWp8zYFY9VGCFR/5RQ4KkE=; b=nEO75mXJitsnSV3EYht73jCwWg
	k+kHDNxxSH9L5RAnmGFtvjOtspuD7GuRpjALnzewb2h8nJ3hRQt6l8VeZ9iABLWheE6jNfoXyICPN
	y7iglaWtbaegWfOTV08BQDFLJntYULu+nd9rIob5vAWDD9GifonZ7lpehcV5X8mJFOjY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxkmq-0003U5-3h;
	Wed, 04 Mar 2026 11:53:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxkmn-0003Tw-Sj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 11:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W3Ty7ibGuKmSh7pjOAeeLTsjUfIDNU5uo+7Cq+3jtA0=; b=OfMLzYO3V5Hq4seqXCr5wvhCax
 5JstCdGJ1fXI3dF1toJ0SFxRZaRf3HK+WmJqkueKZhFqQ287gE0zSYSL1TO+mb2irbeeIwLovhW4s
 uI3sBb321+lWCTpcD/Klr/Xr5dtXgB9jc3x/dNUyi/S9ZD0ZQZ/zRhXF5HSJ9W/fOhFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W3Ty7ibGuKmSh7pjOAeeLTsjUfIDNU5uo+7Cq+3jtA0=; b=Q/x8If66FJqSZ7vw47Sk/w2SL+
 FC0aO0sgBKtYnXHan7KnJ81Wga/TAjlwVnM9bmupyoys4+FgN6j/TLpWJ7biUkkP+hZVZX8r1TDuD
 vW4tCTPqLIJP9V5cZKRZPQM7VBpjXAPyU1m4NmOHKvayDXd0I3meqqmqZykmYlYlJZNw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxkmn-0006ei-HO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 11:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 330C043546;
 Wed,  4 Mar 2026 11:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF34C19423;
 Wed,  4 Mar 2026 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772625175;
 bh=URWG1LNsEaliJm0LGMxROTt+Anh8PZmyOFmZLKFZAu8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pmdvAXMBYuYiUc12n6JSH1Q+HJ9SK8cQBRxSOCJPQbwvx5QkWZeN2yLClpSIeB6pW
 scqsxojfY8gJrlXpzqwcSVbswLtFyb2hlbb+H83I0Pd3t7vkHKc6S7Dz0+CIpTQc6R
 HIEhEYjBSDiSBS2gYlBO2mGi4Gg9MhnbsufVQgoeQcLpGUAM+NY6YbbXIGM5J+0efF
 KB7wqjfJDIBJIyvM1tdeKgbYfB5CQrg3YZo/ltlVjh55mFw3ze/bF1bnxdKs7yvcYO
 kpjsRQc56N0eNRZFqGAVpSrmnkRlty1DNKPC2awDEfZzWe2q/BWKPiXPRoMAuYbJJl
 N1cUi30E6ASmQ==
Message-ID: <403b0843-e4ac-43ab-ab94-84f9b84f624f@kernel.org>
Date: Wed, 4 Mar 2026 19:52:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260227030254.270068-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20260227030254.270068-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/27 11:02,
 liujinbao1 wrote: > From: liujinbao1 <liujinbao1@xiaomi.com>
 > > Add the defrag_blocks sysfs node to track > the amount of data blocks
 moved during filesystem > defragmentation. > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxkmn-0006ei-HO
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add defrag_blocks sysfs node
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: EB5C21FF56D
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.252.31:received,172.30.29.66:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 2026/2/27 11:02, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> Add the defrag_blocks sysfs node to track
> the amount of data blocks moved during filesystem
> defragmentation.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
