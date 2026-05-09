Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCGxHvoz/2nM3QAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 15:17:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B754FFD42
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 15:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OG05m4xPdFr6v5XuVdv5QXhMBk2HC6jRAOKzxlvKcYg=; b=VD9G3yn2AH2pkLX2E4SNX3gMK9
	eEPaNIa2mmyTXAoYNhkNeeaMR1BxO0p0mqSsGP5tmjf9o3AynGNRKVYYbJ00STvAAL4EmaxT58SFR
	41RF9mlbDOCQWjE8A96gAp6XYh9yvT3eVff53nvaadh0OSQ21CGQ5moUSz3Wq9BUw7Aw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLhYh-0000w1-O0;
	Sat, 09 May 2026 13:17:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wLhYf-0000vv-Sz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 13:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mQpN33HDeGpYdD7x0SAJ0UeC10h6VsVzDXidtlg05wo=; b=GGnw6y+NNVr5RbsHhWlyIW+/FQ
 g7DtnLVBsuNgAemvz6GHKhqgstMsVvZus7rDk056zg6H7HXUJkxxAplVdUAmHRHFH7G8PIyBSpz2n
 ofQdiMjQ5cFRlIBkQ2Kq3+XRZ6OtU4gQ7TY48dL9UacZPbKwpy9wcpzz8ReGFty62hOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mQpN33HDeGpYdD7x0SAJ0UeC10h6VsVzDXidtlg05wo=; b=NmlNZGEjwjkAwh4AGEBYzlSyNE
 Qzrythf3qs92XFKkLDJi9O3t6qUZYbBfrQEeV1NEDoiLE7KzcxDzLEzWrKrI0DccCaLewGuOtbybP
 wQOkJYL+NUhc4v8JfWyZ7wuDK79uSf9eElxdLdYDZareYhxVn4cvIhGQneWVPVzkTF3E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLhYf-0007sH-GO for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 13:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1C9EA41A34;
 Sat,  9 May 2026 13:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09BCC2BCB2;
 Sat,  9 May 2026 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778332638;
 bh=GovmqvW+H8iHnBrgX5Bhn8ssZFtFngl8cW/75itPgxc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=JM2jyvsjgrW/sEbfot3VXAFO/w/ZmXzf/UlQRSCyR5t8tFkZr9u9UOWx1DhYy6tC+
 oP/YbApXTMkPBScJ3BieIvjZuh1Xi8VR5mym1D9UO2Tcx2EHpOoreMsx9kZC0uFcIG
 7GPnkdru5mtNvYVHl7gqtPsaGr4wXUiAe1pLRD+ONFh68NqAnQFamOLvnfdswq9CQW
 Bjoon6RGUQZK7q22Tj9lPhgw7Gq35Xie+16K5S0dkx8V58Ft/tZrcS5FGbkiFAzPCw
 pbu3H/dg4jDjeeC/Uepf6bxYWCpvp255F5q4n2cJ+mIyoMYi0J+cyBYBOWARBrtY18
 27/AB+9nyc42g==
Message-ID: <04ab5f17-2f63-49e4-8d4b-af781f5ff704@kernel.org>
Date: Sat, 9 May 2026 21:17:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cen Zhang <zzzccc427@gmail.com>, jaegeuk@kernel.org
References: <20260505125510.1369132-1-zzzccc427@gmail.com>
Content-Language: en-US
In-Reply-To: <20260505125510.1369132-1-zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/5/26 20:55,
 Cen Zhang wrote: > nat_cnt[] is updated while
 callers hold nat_tree_lock, but F2FS samples > the counters locklessly in
 f2fs_available_free_memory(), > excess_dirty_nats(), and excess [...] 
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
X-Headers-End: 1wLhYf-0007sH-GO
Subject: Re: [f2fs-dev] [PATCH] f2fs: annotate lockless NAT counter reads
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
Cc: baijiaju1990@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 11B754FFD42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:jaegeuk@kernel.org,m:baijiaju1990@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 5/5/26 20:55, Cen Zhang wrote:
> nat_cnt[] is updated while callers hold nat_tree_lock, but F2FS samples
> the counters locklessly in f2fs_available_free_memory(),
> excess_dirty_nats(), and excess_cached_nats(). Those helpers only steer
> cache reclaim and background sync heuristics; they do not control NAT
> entry lifetime or checkpoint correctness.
> 
> Document the intent with data_race(READ_ONCE()) and a short comment
> instead of adding locking to the balance path.
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
