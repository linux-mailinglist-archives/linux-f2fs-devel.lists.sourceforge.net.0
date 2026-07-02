Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cs0VFNUTRmqZJQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 09:31:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4506F4318
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 09:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XulDbsD2;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=B04hQZ5Y;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Tu5h+JEh;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Qhd5nIpE;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo98MxMDRGnC647P9EGenXV3LdsL7/Yt4cqIZoc8/tU=; b=XulDbsD27fFd3SOPpFs5j7AzWQ
	OwDFNL/USmLhQpiy+nKlHIno9J/kaXKJkEJ95NeaLCvC8DEnEvPvjLWMtlBZqtDtt6GryCUoX3yt/
	EnT0bSMYkjIx9VS8QGnjXnjoh69OdVsvqoJURg3HnIM9CMTKe3vbByh4IJFnmKlToPeI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfBtR-0008MC-7S;
	Thu, 02 Jul 2026 07:31:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wfBtP-0008M4-ID
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 07:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x5XVCblwWz7xc7zqosTsyqhwpRXSAeTWbwOFO2trlFM=; b=B04hQZ5Y7LqQg4aeZaF2gb0N+W
 2ge9qCqRGklQPaqui8FA3ZAa/vX6N8qFNd50ZidRkc+pjKVE9UMN9PRcZQiMcAc2bpu1z6hGqZlBR
 8D9ABqadWkkGijLM7wGZ0RnxTwBYjPotK6/6+aRKmmiZdYIfjiUa0zcUV6J/11FrHQJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x5XVCblwWz7xc7zqosTsyqhwpRXSAeTWbwOFO2trlFM=; b=Tu5h+JEhsaqN5XjokOCyOg03CB
 diFXhQEUYPiB8luGdezp1Ipf+T4x2hb4ZBHqaUzA4NgcHgG1rQPsTfyp5D1j1UY2FuvnLVU7DK2Xf
 qTzrJtqpWz0EMsC13xA11/3U5ocp08YbtjcXC+8xzc7iX7MJS2of9yHTSX5lUUoWEXE8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfBtK-0004FY-QT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 07:31:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 058D441FFF;
 Thu,  2 Jul 2026 07:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97221F000E9;
 Thu,  2 Jul 2026 07:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782977477;
 bh=x5XVCblwWz7xc7zqosTsyqhwpRXSAeTWbwOFO2trlFM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=Qhd5nIpEb/UxFNxj56GHLsXPzncMeUO9dM5jlyY3qPm10uWeI+4QIwhqgT0HI2t6y
 tas8OrvDkRBvhj+YDb103FopYsv0fjEoYz0I3BDNXtQsmS3+GK4yzfqBVCT8Pzp5Xc
 HOxdqiIuinjXZCiJ0dQ6sAhzfmpTmofg9IR/9BgdMo1J6aCCV0m5t3oRUIQoHu0dj3
 o67qHmz99LtAITLhtq2KaWtNK2Ss8v1Co68Zj0g0qcyLbc47eHJ08vnbkjctskPrW8
 9Y1kf4ZyY7GcG3zZpOew3V1V2/eAcsdK3w2/nfAUA3/Rsm9z83HiqbuKvubFi5mvwk
 22QmNoWFPIKGA==
Message-ID: <b28cd4fc-cb06-43ce-9938-de35786c6e94@kernel.org>
Date: Thu, 2 Jul 2026 15:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260702065602.4120914-1-jaegeuk@kernel.org>
 <20260702065602.4120914-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20260702065602.4120914-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/2/26 14:56, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 From: Jaegeuk Kim <jaegeuk@google.com> > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@google.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wfBtK-0004FY-QT
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs_io: add include dir
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@google.com,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D4506F4318

On 7/2/26 14:56, Jaegeuk Kim via Linux-f2fs-devel wrote:
> From: Jaegeuk Kim <jaegeuk@google.com>
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
