Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CPLM6K2s2nbaAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:02:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480F27E740
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQECLm23K+HYxaVY8GKOXlogUrqFqLOPdHPMFB2aGqQ=; b=VQj3elS+qDraMsj+SpXHLv4ROU
	xVVyAS1csZOAUzvfNMADx2IDLqXZEN+q2tjntZAAJIa2mTCrIyJZIXiNoy9h++eRYZtgv2gOikLps
	6Liwf713tXm9JoZWH5GwOXRrF2Jid4J71mNqqWzGg1egQLsrRehN3pmxugwvhFP7OgeY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wXm-0005Lz-Kt;
	Fri, 13 Mar 2026 07:02:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wXm-0005Lt-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4qkHaJgXl/93atW0+2Jd/+uyKSj+B/TdESdnRuoAjQ0=; b=AGXWkQwvRc+n6zerGfwYj2Ltlj
 dycleyUKjp9DfV3MY/5kCzsHbVQN3nB1mDCNiTx/rajMIoh1PacJ/pg7NWrCYvtxF1210F9uFXyPH
 EGzdi1sRH3xtZLCjM4XzRWhGBSKGJnBLzq6QdUSVoeqVuHJ+IqXrSiy1eMQFgE2A5YGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4qkHaJgXl/93atW0+2Jd/+uyKSj+B/TdESdnRuoAjQ0=; b=hOUZRdoBWz/wDMrcOGOiG5q8rO
 RSQZUjdeVxR/Ijax3mkLxupfNk3TfRHDY32hJid7COcHkHe3gYucaDFdMdSS6nqGttiNc62eihTAX
 ZXadz1rX3VlYAVMLSvTfOTpefiIWNf4uHQffspJPAwPDDH/Bq5auQtPntWRC9No9OnGo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wXl-0006RM-M8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 208A541B50;
 Fri, 13 Mar 2026 07:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EE3C19421;
 Fri, 13 Mar 2026 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773385355;
 bh=ujambccXTBxe5YBy2ewa8gBhB6aCXXKh/bZoPz0DKzs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AhXqkKHsJ5JrzhdzEQjNeUsQDVo4CneouatygYAKQ1xGHamWX8yffByq9YgEcUAbk
 bJQDnGFx2NGdRI1bdslzF/63ufhzfwGZENxik2F3QbYMZBgIbOqz1k3nEpnuw/RUn0
 8Q3SqH+Hd3j1IgXU+311VJXGiLP4SI7xaPr8r3IXBTSbpkMocfy9Am/AobUI1N8yvN
 oFId4wLz+3LYtMRb/kZ9tCV5S19DB9PECZCaveA1fITdoY5KQysxGDv8MtFSNb1EUv
 U36WgD2lVml3vOC62BCD0ClHJ+oxUZuqRFkZO9Dfah5MMoVQDdvJRaQL2e0bKcFS7A
 IrdeNiTb5girg==
Message-ID: <15e4800b-ccd7-4934-a53b-b1c8f7e8b48c@kernel.org>
Date: Fri, 13 Mar 2026 15:02:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112841.67508-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260216112841.67508-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/16/2026 7:28 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > After the device is mounted, f2fs updates
 on-disk metadata without > updating the block device page cache [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0wXl-0006RM-M8
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: invalidate block device page
 cache before reading metadata
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email]
X-Rspamd-Queue-Id: 8480F27E740
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/2026 7:28 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> After the device is mounted, f2fs updates on-disk metadata without
> updating the block device page cache. As a result, f2fs-tools may read
> stale metadata from the page cache.
> 
> For example:
> mount /dev/vdb /mnt/f2fs
> touch mx // ino = 4
> sync
> dump.f2fs -i 4 /dev/vdb
> touch mx2 // ino = 5
> sync
> dump.f2fs -i 5 /dev/vdb // block addr is 0
> 
> Since `dump.f2fs -i 4 /dev/vdb` has already populated the metadata area
> into the block device page cache, the cached pages remain resident in
> memory. After creating mx2, the page cache is not updated accordingly.
> Therefore, `dump.f2fs -i 5 /dev/vdb` reads stale metadata, and the
> physical block address of inode 5 is incorrectly reported as 0.
> 
> This patch issues a BLKFLSBUF ioctl to the block device before reading
> metadata. The kernel then invalidates the block device page cache,
> ensuring that subsequent reads fetch uptodate metadata from disk.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
