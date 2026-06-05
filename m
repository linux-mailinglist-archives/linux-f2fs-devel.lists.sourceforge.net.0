Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kve2AGpJI2penwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 00:10:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548F64B908
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 00:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RdxYX0PC;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mmAWXI1V;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Z0n0EFaS;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=DZJs1NeG;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6braq2Xoflw4pguGWAeuQ3HPctSCn6zM7Kp7w//doQ=; b=RdxYX0PCVdqLJoT5on551WY2w3
	Rr2zE0sy1mOESx29SaMGfswW/k1YUI/jQT8uBN2HcQuk1MoT4yg/QGfhtybFhNSoRErnQptwqho9+
	gnz3NLPT5BOdxcjaJg3FhdiVlxW1pJeqTIaKZkpJBMs38pYWXHMo/dG+Pi4m++p18+cE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVckU-0006Ar-Ih;
	Fri, 05 Jun 2026 22:10:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wVckT-0006Af-1u
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 22:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iJT3Q7smY0LrmHruOEmo/PCSRB3GG8ERa4x6kmx4d+Y=; b=mmAWXI1VjGaNNPl6mHIgEhzXCh
 oFSULnEmkvoQzKn3yn7veNuSAYGP0LJWqdu0jCZhhwliNINQ5EBjqAXcnQ0KZQnC9VW0s4iCw6wjW
 4UsjDDSZs5Z7GY5Jdt3LhM5fd8XFbP6+C24WeAWDGliCXRz4Ehru2wUo/R0bdci0ArMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iJT3Q7smY0LrmHruOEmo/PCSRB3GG8ERa4x6kmx4d+Y=; b=Z0n0EFaSIjgybD9A9LoT1/bFHX
 gG7VMgsetN6PB2VH2+MzPN0tx6SjuEUKHLIrEccmU4UOZE4wbdG9/SiswFtS+UOAPeZRDnZnWx7y0
 K4bsZKJVEdoSQgnMA3YjDby7lKo+quGeJeIOd61W2aAy9LKlJSLBp0PlU4+qol4m/lJ4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVckS-00043C-3C for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 22:10:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DC4DC600AE;
 Fri,  5 Jun 2026 22:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622D31F00893;
 Fri,  5 Jun 2026 22:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780697429;
 bh=iJT3Q7smY0LrmHruOEmo/PCSRB3GG8ERa4x6kmx4d+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=DZJs1NeGHa6Aj5cGd2/4LKJNYX2ZOA007sU5tt1nQypR4gNWPS3L9LOEZfYrAYKIQ
 RTq217bR6iiqBK2d7qIhYjnUT+KbWjx1CwcLmkqDXnchtgIfICxGsfaVqI1g/rHhjQ
 3bQaKxcYxDY0FdR+r064rlpKMDClNrsBXkPzXQ8V8VlyvWXERTIOMaZjkeGUCd03CW
 /bvma0EHSo8m52mqnvJKuRkL8B8XbrisWxR1u/8GmeJ161Cy/OKrjM752FGbhY4Q4M
 AbLNTaNZSh4pqPSFWH6MO0rpf7I2xEyKdY0tVY66HSW6Gh5RlGEr1ik4a7CvL99VKN
 a9v2JnKDIS3gA==
Date: Fri, 5 Jun 2026 22:10:27 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20260605221027.GA2312230@google.com>
References: <20260605212504.1080138-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260605212504.1080138-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 05, 2026 at 02:25:04PM -0700, Daeho Jeong wrote:
 > - F2FS_IOC_EXCLUDE_DEV_ALIAS: This reclaims the space occupied by a > device
 aliasing file. It first performs a capacity check, resets GC [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wVckS-00043C-3C
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support dynamic include/exclude for
 device aliasing
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8548F64B908

On Fri, Jun 05, 2026 at 02:25:04PM -0700, Daeho Jeong wrote:
> - F2FS_IOC_EXCLUDE_DEV_ALIAS: This reclaims the space occupied by a
>   device aliasing file. It first performs a capacity check, resets GC
>   victim information for the target range, marks the segments as in-use
>   to prevent new allocations, and then triggers GC to migrate existing
>   valid data out of the range. Finally, it reserves these blocks in the
>   SIT to effectively exclude the device from the usable capacity.

Does this do anything to zeroize the device so that random data isn't
leaked in it, or is that the responsibility of the userspace code that
reallocates the device to something?

> @@ -2214,7 +2231,8 @@ static const struct {
>  		FS_INLINE_DATA_FL |	\
>  		FS_NOCOW_FL |		\
>  		FS_VERITY_FL |		\
> -		FS_CASEFOLD_FL)
> +		FS_CASEFOLD_FL |	\
> +		F2FS_DEVICE_ALIAS_FL)

This is extending FS_IOC_GETFLAGS, which you probably don't really want
to be doing, right?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
