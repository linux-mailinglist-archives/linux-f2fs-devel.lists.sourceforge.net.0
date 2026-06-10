Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v5u2IuREKWpuTQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 13:05:08 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B401668910
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 13:05:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B3VN38Bw;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gUc2ie3s;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=llEZSnsD;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=O+CvwWUz;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEYLDioO+ZZDYQtpPpOmEFIS0d0CrPwbTP2n2B1W3hU=; b=B3VN38BwABwzwoJ9IDuys43CB7
	HcBkFqR0hIacQefhy/nu+GvFDeW3xD8BSCp9ix1oTlUFk4Ph/cgXy3TFPx8zSZNy0W0T+sMukymUA
	W1VfHaJmO7VfrBdIW4m0vbSu3IyXioPz/A0p/gpzvn//ADT83tFPT+U0l0X43mIF2Skc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXGjx-000873-9d;
	Wed, 10 Jun 2026 11:04:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wXGju-00086u-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 11:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qDnEYmAdmlpsmH2sm4DrOO0rKrq9gD2IC9aUjhiNxEE=; b=gUc2ie3sCePMa57RuASlQF6b+l
 qyGfrQHsr/QiR1UmvVPVjI0ZjnizwuHF6CiuyZOxkQzHsjpF4uENFGOtmw1ZUgDGitjgpyU9PB5yo
 QXAplZ07OpnxjjvFpKaerNcr40z2DBJAVCp7b/HYPWjn2FHxLwaAfG3y8Rdz7dRNMPrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qDnEYmAdmlpsmH2sm4DrOO0rKrq9gD2IC9aUjhiNxEE=; b=llEZSnsDMFwsdWRyHIXv/1UhOa
 ZEGCEa8QzQOP3ENhuYdy4DINdnI3Bsjd84URPUbMgJBc9WvEhL7Sj0N29GDJae3S7gI5gobe3o2pR
 in8LOmU1NyA2VTUViLW91hkAdrRWzcq7LskHkt5D9xUrB+pF5cy72cU/gWY+04nvtQLo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXGjo-0004fH-TY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 11:04:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E596C4194B;
 Wed, 10 Jun 2026 11:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2542E1F00893;
 Wed, 10 Jun 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781089478;
 bh=qDnEYmAdmlpsmH2sm4DrOO0rKrq9gD2IC9aUjhiNxEE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=O+CvwWUzum3RKmzSmuTI4aemkK+cbprnF2SbVMUOjtWocIA7D2+wcodX7arJnKBp3
 9gEG+AZwuF+P5pmQhqTyrO25BolDdMj0VfeqXkfFme10GoBZo2v9Ib6OLDEjEUSld5
 vkKdrT67ed9oKvsTOUJLH4YmyWyK428PEJq0ve8nrTSjCo0wep++R5HrP7rIDiDTH0
 IjX85oaZxD/FIxIvpvQ1s9riOHvgUASuQIM4INn8K0guyeIRUgar/KRMBvHABwkCJc
 vywMLJPX6vkRbFb47Ft4CwShL63Mqjip2R65ftZ7DUhU9mXtnIzch2j86HlAXD8PJ7
 ALU7DvvVTko7Q==
Message-ID: <de8ed987-e621-40c5-8d69-38455754c3dd@kernel.org>
Date: Wed, 10 Jun 2026 19:04:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260526053557.1096229-1-qiwenjie@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260526053557.1096229-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/26/26 13:35,
 Wenjie Qi wrote: > f2fs_recover_orphan_inodes()
 trusts the orphan block entry_count when > replaying orphan inodes from the
 checkpoint pack. A corrupted entry_count > larger than F2F [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wXGjo-0004fH-TY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: validate orphan inode entry count
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, qiwenjie@xiaomi.com
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
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:qiwenjie@xiaomi.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B401668910

On 5/26/26 13:35, Wenjie Qi wrote:
> f2fs_recover_orphan_inodes() trusts the orphan block entry_count when
> replaying orphan inodes from the checkpoint pack. A corrupted entry_count
> larger than F2FS_ORPHANS_PER_BLOCK makes the recovery loop read past the
> ino[] array and interpret footer or following data as inode numbers.
> 
> On a crafted image, mounting an unpatched kernel can drive orphan recovery
> into f2fs_bug_on() and panic the kernel. Validate entry_count before
> consuming entries so corrupted checkpoint data fails the mount with
> -EFSCORRUPTED and requests fsck instead.
> 
> Set ERROR_INCONSISTENT_ORPHAN as well, so the corruption reason can be
> recorded in the superblock s_errors[] field. This gives fsck a persistent
> hint even though mount-time orphan recovery failure may leave no chance to
> persist SBI_NEED_FSCK through a checkpoint.
> 
> Fixes: 127e670abfa7 ("f2fs: add checkpoint operations")
> Cc: stable@kernel.org
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
