Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rdLOF0S3TWqp9QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 04:34:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6D72130F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 04:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B05bC4v6;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ck68xDb3;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=CKYGbCTJ;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=MBIv9dtP;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HdaDVwiXdzx38b3+zdOQ3lrJQN1ScpmfutJXKtM95g=; b=B05bC4v6kmy6VyuYjADbMUrQyy
	/AXp4lIcPJZeY4q/niXH/9HUIFJr9RQyaNeAvEiYldTw2iTfJMu1pVz65ANMbwXDiboO3i4dXDmNd
	HylRm8PamZXYCAwK2z7W7B5Ye5My+YYDu0ZojJq2JwMleeQLvK8gC7bVwdueBTR3W2EY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whI7Q-0005DV-19;
	Wed, 08 Jul 2026 02:34:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1whI7O-0005DO-FD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jul 2026 02:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOpsRFp5Vz5pUcGeuFJY8h2sol+SNTT6AXyNJIVrmy0=; b=ck68xDb3fGV7JoQz7wOMQN2hb+
 bTiyWHz7vcwg1a/7Yl1z8ZfVG8GgZ4PyQPz4n1KQbFFuRyYe04gzeM3LIYnCYJVgbN9x56QlqoCP+
 OFp4DOkldVLFBAEMH0JkkOFc4KahL4QunYSf8QFw6jfhpFnhQ5oJzpKABuBlfPdQAApU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOpsRFp5Vz5pUcGeuFJY8h2sol+SNTT6AXyNJIVrmy0=; b=CKYGbCTJ1ybbj3JMM8MjwQRX8t
 Fs5PWYGAp1onNtMMDe/YPpwy8saRZM+S/GWqS7cvzUj343fb27g7FC5R9sXco9krHjREO3bv4SrPA
 ffKDDuFQVPXDjVFGNxxN9kyMg9ie9jMK9/3qTRU5kB6DXoSmbr6LLaR9ippaY5iTMczs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whI7O-0005Ed-2D for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jul 2026 02:34:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 90F074058D;
 Wed,  8 Jul 2026 02:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A6C1F000E9;
 Wed,  8 Jul 2026 02:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783478068;
 bh=NOpsRFp5Vz5pUcGeuFJY8h2sol+SNTT6AXyNJIVrmy0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=MBIv9dtPsK92v7GcTvhvJ1Cfma2NmpBjbmSe2tjx+sNYFvoLKh5nGF41rcTpqRc6p
 RKsPeAXdrv72Z+FDU8yXSmTgnMTtS0SwXyR2ER4/LraKJaxUE0M5ILL+Sien+OTUk0
 fJz3IMRXxv9wLHKjbHQWYdzQbwSGv8OzUc2DVXHZDJvXUDsbr9YEyggUIKibYkPNVc
 UDAKEFsELhkztu2ARETc6s90+RbDl/pvzrA46Z6ZkdcXHP+bcHtgFiTwTTjF2hk37Z
 2mxqVLNKqgoyiStd1vzngG5lPFWkSXq7nAN+RsehdBMmeGfstx3ii2n8xwyk3sYeS2
 GWHSdZwAY84YA==
Message-ID: <330f8b5c-6db0-4a3b-8296-716061eb6849@kernel.org>
Date: Wed, 8 Jul 2026 10:34:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260530123038.2101877-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20260530123038.2101877-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/30/26 20:30,
 liujinbao1 wrote: > From: liujinbao1 <liujinbao1@xiaomi.com>
 > > When CP has CP_COMPACT_SUM_FLAG set, the nat/sit journal is stored in
 > compact summary blocks at start_sum_block() r [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1whI7O-0005Ed-2D
Subject: Re: [f2fs-dev] [PATCH] inject.f2fs: fix injecting nat/sit journal
 in compact summary
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
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
X-Rspamd-Queue-Id: E0B6D72130F

On 5/30/26 20:30, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> When CP has CP_COMPACT_SUM_FLAG set, the nat/sit journal is stored in
> compact summary blocks at start_sum_block() rather than in the regular
> summary area. However, rewrite_nat_in_journal() and
> rewrite_sit_in_journal() only handled CP_UMOUNT_FLAG and the running
> state, missing the compact summary case.This caused the fault injection
> to fail.
> 
> Fix this by adding the CP_COMPACT_SUM_FLAG check before the existing
> CP_UMOUNT_FLAG check in both functions, writing the journal to the
> correct compact summary block location.
> 
> Test steps:
> 1. NAT journal injection (nid=4, quota file):
>   inject.f2fs --nat 0 --mb block_addr --nid 4 --val 12345 /dev/block/by-name/userdata
>   Before: blkaddr unchanged (308225)
>   After:  blkaddr = 12345
> 
> 2. SIT journal injection (segno=61075, CURSEG_COLD_DATA):
>   inject.f2fs --sit 0 --blk 0x1e1da00 --mb vblocks --val 123 /dev/block/by-name/userdata
>   Before: vblocks unchanged (0)
>   After:  vblocks = 123
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
