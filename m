Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGKRAP0z/2nM3QAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 15:17:49 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B674FFD4A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 15:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59nonRYzIlK1AkaHCI3WJUW4XqcBsT1A2dy06Ftv8Zg=; b=b7M9hHGLZo1QxQTVyneMNIn2nS
	MXDquDdVtG98aWtD9uMIttR4mQK0Odiz3qs7JHsMOvTUS8SEAe0AGjShscgF2M8Wj/UH3FItfGfVE
	mjUPEtvErvsZz+Wxybdwga4SbihPbPFragPLZaIagjIAkJ/gQNmvohHtpO61Rz6T1Wm4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLhYz-0002HJ-5s;
	Sat, 09 May 2026 13:17:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wLhYy-0002HD-2r
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 13:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZakEAs5W9zoQT08n3gHRfN2GIQ9SbKs6VNcJIZkhsM=; b=dd/DrPJd4lr1WQ1QKGo4fwPRfC
 7ayVhgiX8B6wGsQ/T5UYnNNMmLznjRkT3ACeqZV/Z9V0sVoxzGQJun8XvHfG7G7cFuGhdBYgL+wVn
 5Z2fNA4J1DTItqioxLqCZffmet1zhqjq6eiPBmSER+mDF8fCGR/k0dASGJCfnwkhDfjo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZakEAs5W9zoQT08n3gHRfN2GIQ9SbKs6VNcJIZkhsM=; b=biCKX6HmjZqfd3Rb8GP/YEBt3T
 NVhxhH3YehlGPLPBI6PN6lq74BeBcmb8h8Ut+jhIKXyfexWfArGdpudct70p+140gN67b/E7w9Nhm
 /QiWwdbvkOiR3s+0AP/DMhjs6BiJql0U2VdM7e9J/8MqsAyXgwD2Q4BXEg7j66wkxiEw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLhYu-0007tB-4V for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 13:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 734CF60120;
 Sat,  9 May 2026 13:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C42C2BCB2;
 Sat,  9 May 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778332653;
 bh=DFE6Rl5lepS1KiM7U/4LCoiGspIzgn2J1rhPK8AcZh4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=M/AlLZ8y/gNZQ3Y5YQwGaMHBsL9Ft02h96ok3Mh5uf3xP8U9EIcyg1PHyzp/N1D/U
 13PlTS4GKkkAcp4FTue9iy9GLYFEt2Hv5vNp2RKhn9Zw7j+2ekrdblccitBoxFmTDv
 hrK7nZuqY4m+At0wgW0ihV4HPCzxZaEnS3A8X/A4OuEK+ipvmG4WC6HqeqDikBOVGM
 tUNjt+SO3vozfNnovp+V+bzWayXjsRRZd9QGOms7DNGdnAl3wZe0Fc4ZaBNU9EYiLD
 z5Zu66JaAyQNyCvvmGma5crTdCfQHVHvEsP6i03n//ybhhoJ2WmWckNPawd+qPfcjY
 0vLQsQ3iBoFpQ==
Message-ID: <13da11c4-c6a5-46c3-b2c4-3a3dcb92cb5d@kernel.org>
Date: Sat, 9 May 2026 21:17:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cen Zhang <zzzccc427@gmail.com>, jaegeuk@kernel.org
References: <20260506010709.3287111-1-zzzccc427@gmail.com>
Content-Language: en-US
In-Reply-To: <20260506010709.3287111-1-zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/6/26 09:07, Cen Zhang wrote: > f2fs stores mount-wide
 activity timestamps in sbi->last_time[] and > samples them from background
 discard, GC, and balance paths without a > dedicated lock. The tim [...] 
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
X-Headers-End: 1wLhYu-0007tB-4V
Subject: Re: [f2fs-dev] [PATCH] f2fs: annotate lockless last_time[] accesses
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
X-Rspamd-Queue-Id: E9B674FFD4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:jaegeuk@kernel.org,m:baijiaju1990@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 5/6/26 09:07, Cen Zhang wrote:
> f2fs stores mount-wide activity timestamps in sbi->last_time[] and
> samples them from background discard, GC, and balance paths without a
> dedicated lock. The timestamps are used as best-effort heuristics to
> decide whether background work should run now or sleep a bit longer.
> 
> The current helpers use plain loads and stores, so KCSAN can report races
> between frequent foreground updates and background readers. Exact
> freshness is not required here, but the intentional lockless accesses
> should be marked explicitly.
> 
> Use WRITE_ONCE() in f2fs_update_time() and READ_ONCE() in
> f2fs_time_over() and f2fs_time_to_wait(). This preserves the existing
> heuristic behavior and avoids adding locking to hot paths.
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
