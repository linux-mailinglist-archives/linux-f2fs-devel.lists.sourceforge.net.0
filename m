Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0VRlCreuwGkrKAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 04:08:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B12202EC0F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 04:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIAoLIFoW7MA+LhCa9auWAPtm8cQbC8RsQxlpwm0lr0=; b=Nc3qerHp5cxzFHlGmEaq5cIuN5
	JauPyDOgToQu1y1TUFU1e7jXHNx7QmJ5k9vdjpXlcLvUyEyG/dTlaI6TXcNOyqxbr2ENIULfhdoMT
	XSLLr5R4vhvRlkYgDnN7JMWqZpmPm2s02tfO6XBccwjBjRCB33+vgeOkg/Fp+UBif3eM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4VeT-0006u1-Uj;
	Mon, 23 Mar 2026 03:08:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4VeS-0006tv-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 03:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9YaWjXBsd6ZsOv6Ielx6GBXKLfEVp8gbP/KxcdDUQuE=; b=VFjGdcp+xTqnwxpT+HYqVqyfcv
 wI5bUdJ6PN40FUamX9lPNpW/qXWJQuBXOX4M/MOWQKMdOA7hg00jVkGhshKM3CB5+bhArUt9b+LWz
 BaSDX1rlS4ugrfhQ6Fv/wwr9hhE89/g62beo3UWxgHrcbWs4xamYdXYKKSlol6c+Pkyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9YaWjXBsd6ZsOv6Ielx6GBXKLfEVp8gbP/KxcdDUQuE=; b=FSms6q29LX2ghbP0HVI4zUBtIB
 HNWwkKdaHb4rCrHmCOB8p7v65vbbeHGRHh/N+UO2oDJooVFU5Fs4XR92bYwE+RgyINbGm6zupU4jX
 CqEeg9wFrNgp/vBEnto0MHh2VK2Pdniq+sUjRVMbVVd+X/xbv2Jnif9pagg6ned1YfPY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4VeR-0008Lk-FR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 03:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 73D6443228;
 Mon, 23 Mar 2026 03:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26458C19424;
 Mon, 23 Mar 2026 03:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774235292;
 bh=Jb5rAujDPY2iFm6kd69ZYxJVvq4jodzIdzkMa+H5ZIo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EDKnQXQl3BZcdmy2zd0oPBxbWlKTlAenSLJlIxrr8GjJpsof8/+uWbdpCImF+jHC0
 YyC2QzrcXSXPCUWvKhF1wHIEvzFzDUWvguWc45NT9pGG4//lwFuwy1DHclJYIJnaqU
 cLpjI4mHVHJHRvkaZTxfdAr7S+Htn77IiRh3f96kcNl2GrBLoUl8Sgs/+pU5dLB33R
 Kb7GYznlx45G7mBIzVwjEghUYkPxijbj5W6m2Z2c+rrvLBZexw9CbkbXJDFcAkq1yo
 CGw0oog+Y19IefixWBVrzptrcn7OcYJZozdnU/P/D7SIbYnnnNhzlmKiBn4rPKo4M4
 8yxrsEx7cqOiA==
Message-ID: <03bbe295-f80e-4c45-a3d4-a3a2299a8509@kernel.org>
Date: Mon, 23 Mar 2026 11:08:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319132607.686096-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260319132607.686096-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/19/26 21:26, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When f2fs_map_blocks()->f2fs_map_blocks_cached()
 hits the read extent > cache, map->m_multidev_dio is not upd [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4VeR-0008Lk-FR
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix incorrect multidevice info
 in trace_f2fs_map_blocks()
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
Cc: stable@kernel.org, Yongpeng Yang <yangyongpeng@xiaomi.com>,
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:stable@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
X-Rspamd-Queue-Id: B12202EC0F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 21:26, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When f2fs_map_blocks()->f2fs_map_blocks_cached() hits the read extent
> cache, map->m_multidev_dio is not updated, which leads to incorrect
> multidevice information being reported by trace_f2fs_map_blocks().
> 
> This patch updates map->m_multidev_dio in f2fs_map_blocks_cached() when
> the read extent cache is hit.
> 
> Cc: stable@kernel.org
> Fixes: 0094e98bd147 ("f2fs: factor a f2fs_map_blocks_cached helper")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
