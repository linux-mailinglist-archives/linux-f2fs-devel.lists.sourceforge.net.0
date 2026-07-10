Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dOYkJVthUGqGxwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 05:04:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA1736E41
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 05:04:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=BEtbFk11;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gzthwquK;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QNZnIEgZ;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=eWNrKMdV;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbPSfyJhxl7fImD9t1d9EdGhsW51ZZSMsbJWj83FpI8=; b=BEtbFk11SbBwdd9cCx9hsA9hqS
	X7ubZidnUNHp6rU6ZuhU16g7dolby4HZ0fvxq3Q8LPXPr5xhIqsFGnnRD+O6jeeDLC2ZOhdlPvgi0
	NBaD6Tt/QxbDM7qtH+ta2zTTlIq/jWOTezX7nyks4o+V0gopepTU0hf6vxi6Pf1uAE70=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wi1Xg-0002AV-8E;
	Fri, 10 Jul 2026 03:04:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wi1Xf-0002AO-3I
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 03:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S6Uitytt2+vFrXVrmF3l1mzokRJyz/mIzlRDo6TPLDE=; b=gzthwquKoZCKFD5rR6CLlAAau/
 8OgofQA4S5jN9L61gMZ1o6+apqzD2xRngRfXOuZ7TG6rT6tf17xnCFAdbjOe/fQMStwrp1TTczq8s
 Pv/PGq6gvdo5T5jDFOx5Y4nrrTaCxXOhVeklCtIkooIdxkbChgQEfbaYztdMhDYb/Xn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S6Uitytt2+vFrXVrmF3l1mzokRJyz/mIzlRDo6TPLDE=; b=QNZnIEgZDqyWJGjscf8STbUiJv
 wjmckNIp69gbmMZl/QoRt3XXyOEJscgssRTto8nRaH3CGuPr1uYy1k3FTf7RHG+7utgB3KJBLC/UV
 TjfkUbhKQSQfipBoq3W24BSDcjzHTlz0EW2Bl3Qojlietf7b8jfmykHhJ26uZOhG0Ngc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wi1Xc-0001cv-6y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 03:04:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EC1214143A;
 Fri, 10 Jul 2026 03:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C481F000E9;
 Fri, 10 Jul 2026 03:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783652668;
 bh=S6Uitytt2+vFrXVrmF3l1mzokRJyz/mIzlRDo6TPLDE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=eWNrKMdVBLAfOfyglz+lvSWZFkqR8yTucnRjXUZRamnaIIElqi7dD9Ff3vjPWNy9g
 QdOdc5SDi54kTfk/kvc/x6JZBVoL3Vd5ySJHfvflAFm9nVP4D08/ySPNfioi1fv+ku
 qBxcxURlKh9eiPyHbgpLaiSMRpNzWaq5PWo9kCzImXISFeg3O9q0DjRwIjXR/NL8tK
 NeK7be7n5o8YOm0y8GjG/K53fmQJgWv+lOTFTi4aIqzCZuFgX+diBg2QcMZfbdOUCF
 Aw+j+q7fgdTYLUL6Hp9am2NqrgeI3BZdwhGjyxbBLrVjGBTutWMdE9uxqaYOiOUAAY
 Kt7paX0M59pmA==
Message-ID: <835e14b7-17d7-4f9c-b84b-593a0f2d5982@kernel.org>
Date: Fri, 10 Jul 2026 11:04:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
References: <bc4b29f0-8309-4a36-bdbe-b5f375aec31a@kernel.org>
 <20260710011534.2307696-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260710011534.2307696-1-zhaonanzhe@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/10/26 09:15, Nanzhe Zhao wrote: >> How about cleaning
 up w/ below macros? >> >> #define F2FS_FOLIO_INDEX(folio, fio) (folio->index
 + fio->folio_offset) >> #define F2FS_FOLIO_BLKCNT(fio) (fio->fol [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wi1Xc-0001cv-6y
Subject: Re: [f2fs-dev] [RFC PATCH v2 02/10] f2fs: carry subpage offset and
 count in write IO
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
Cc: Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Pengfei Li <lipengfei28@xiaomi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:zhaonanzhe@xiaomi.com,m:baohua@kernel.org,m:jyescas@google.com,m:Dev.Jain@arm.com,m:linux-kernel@vger.kernel.org,m:David.Hildenbrand@arm.com,m:linux-f2fs-devel@lists.sourceforge.net,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:Ryan.Roberts@arm.com,m:jaegeuk@kernel.org,m:lipengfei28@xiaomi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20FA1736E41

On 7/10/26 09:15, Nanzhe Zhao wrote:
>> How about cleaning up w/ below macros?
>>
>> #define F2FS_FOLIO_INDEX(folio, fio)    (folio->index + fio->folio_offset)
>> #define F2FS_FOLIO_BLKCNT(fio)          (fio->folio_blkcnt ? fio->folio_blkcnt : 1)
> 
> F2FS_FOLIO_XXX naming seems a bit weird to me :). It does not show that
> we want to use the folio subpage index associated with fio, or the blkcnt
> recorded in fio. I think names like F2FS_FIO_LBLK and F2FS_FIO_BLKCNT
> may be better?

Looks fine to me. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
