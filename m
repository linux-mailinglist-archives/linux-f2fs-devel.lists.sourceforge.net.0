Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKDLNTB8UWrjFQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 01:11:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C1673FB6B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 01:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VKzaUV8s;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ExrKHpS7;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ioj0Ldm0;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=dvg9bD0f;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfhGkpG2yxx7Y3a5lJAFk/o6Az2xYFOiARmYx4p3d24=; b=VKzaUV8sWJ30Ozg5t8t6zodj5a
	psJNfzRmnb4/qAo7GqvwM+CZ78QQjKkLQ/JgTLBO7RCOySHZI95AesbKoGq3TqCkx7GSGM4MVC9g1
	UE1ecFntYzhXpqSt5xOSdJx7CFy/U1W+QW9FbnM01ivAceObfAjcWNcWC4VSJIBibdrg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiKNc-0004RH-Qk;
	Fri, 10 Jul 2026 23:11:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1wiKNb-0004R5-SY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 23:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmReB4YfsUmYlBzVCb27IBmpsFMAZFKysWECQFUPa44=; b=ExrKHpS7c5Ut3UoySfbE/gn6SG
 xUKwdyEhhNQIBwupeBHmvIMFwq0vvGCtUx5kaXNaS+XFXOLiTh2FudNYTJZCqZebW6WoK02Zk8ZA5
 GD3/X4lxqvkerlgJIyZiIEMDyY1H/P6nUJKk1hFMFs0UPjMeGmEqgR/nG9/4UcuAqhT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lmReB4YfsUmYlBzVCb27IBmpsFMAZFKysWECQFUPa44=; b=ioj0Ldm05OpTBGZcBY9bxUxeOk
 b55oAZJH9dkuMOGBdEwsrwLAU2zhG6APQrNBpFeyP0WJpwOTJBwYtzmkhLne32cTs2nIvQcPAQ4Vm
 pk8ea2HUo3FlW62/oPKc6egdLGtZ6RBI3LcJY1tyf4IN6YWa+tW7I2jKqD8BzxVT6ff0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiKNc-0002nm-2r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 23:11:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D56660051;
 Fri, 10 Jul 2026 23:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E9F1F000E9;
 Fri, 10 Jul 2026 23:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783725085;
 bh=lmReB4YfsUmYlBzVCb27IBmpsFMAZFKysWECQFUPa44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=dvg9bD0fAOmbip2lkwOOscdHwsK7ch300TBNdvvQq/0HxjjXmZrU7/t41ylG+gO2+
 qCbmItV/TjWEGHuFZ9Nltuf6Eem48B0wenIu0jgNaijCqweAqL+IQbRQrCOAAm21xn
 5VtabOFJbCAQ1dL3dsvtGlHmsPGRo5UDayIFpRDJBJFSIhFULc676oM6CiWkewdl7V
 LTjLIry6cv7caZfnruDM3GbeeWEXpQx+ogi9OWbWfRfeyjhB05fNbKeivlZhvb2la0
 dk/IbnaoE7qLFBM2w8EHuvDUIW8dIE3UqU40LM+hqZF8XJBf9jm5AglobEJxTknKot
 fCioOsZmBN2TA==
Date: Fri, 10 Jul 2026 17:11:23 -0600
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <alF8G6Fw2aFh-2_o@kbusch-mbp>
References: <20260708011843.1036846-1-kbusch@meta.com>
 <20260709071352.GA20180@lst.de>
 <neamg3phll7hjwd765ddtqebtxasdvkoskff75dqzmgzv2xy5i@mf4agr6yoizn>
 <20260710212058.GA1911@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710212058.GA1911@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 10, 2026 at 05:20:58PM -0400, Eric Biggers wrote:
 > So far I haven't seen the point. Yes, applications can benefit from the
 > lower alignment in theory. But especially with encryption/decr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wiKNc-0002nm-2r
Subject: Re: [f2fs-dev] [PATCH] fs: report direct io constraints through
 file_getattr
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@kernel.org>
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 Jan Kara <jack@suse.cz>, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 aalbersh@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[kbusch@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kbusch-mbp:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61C1673FB6B

On Fri, Jul 10, 2026 at 05:20:58PM -0400, Eric Biggers wrote:
> So far I haven't seen the point.  Yes, applications can benefit from the
> lower alignment in theory.  But especially with encryption/decryption,
> it isn't at all easy to support.  This has apparently been getting
> learned the hard way, as (for example) alignment was initially relaxed
> for dm-crypt without testing it, and it had to be reverted
> (https://lore.kernel.org/dm-devel/20221103152559.1909328-1-kbusch@meta.com/).

To be fair, that was most certainly tested in production, and it was
reverted for a bug not related to alignment. It was just a mishandled
early exit corner case accessing uninitialized fields; a trivial fixup.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
