Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uVk/OsZrL2qyAAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 05:04:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCE682F5C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 05:04:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=cjn5NYR7;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=OtURueSF;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=mResxtNA;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=gieWxAK8;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIoXm2GVuj5WHluF+EEOlGwL87GJ7PYjiPcDs9x+P5s=; b=cjn5NYR7x1yofJACTkZsScAmFy
	oEb06WLyMhoB86OCrNocDjwOH15wu12gYpghsjxqholeod/7wkTGKUDMYz7iEI5T1L0jAB8Yo1M1S
	M6vTTFyUWKo2/WinrQZOOKhEbuCbLoiPKRcWVEBAelOKq8KSthdfz5ioQM6bi8+CpB9A=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYxce-0001jN-IT;
	Mon, 15 Jun 2026 03:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wYxcd-0001jH-4n
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 03:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7RL67W0QSeHraShNTh9i+t3F4TleR8GK1j7DCrjYmT8=; b=OtURueSFPiQnK+PS8G/3YKFyx1
 OweZOitIZpgFQ6ob0C6zrvSnO5miysJPJqYqrztv8Yhg7NCN8AdhOSEyoVXWeigEpKcC5LOEfnUBf
 QtJztqe7kA1WP17lbVMoIh7Wt4p2SBzSySfVplas0leyFrLTWo9P1J3Wtl9sZGyxy2gU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7RL67W0QSeHraShNTh9i+t3F4TleR8GK1j7DCrjYmT8=; b=mResxtNAlKzR3SK1qI89pMzu68
 4F+CRi5Neyo6Y+Us/RvZT1td9jKXWyAARxEwpsVgDfTp9bp8A5+HBMygseo4Qt/UJsFOM6T2juHWm
 8xRJAl4SFCScDHEtLb3riZdHu0+4ZgD1s/nmkTFhtPHW2FzjKj4O9ihCmIh8VJbyfOLo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wYxcb-0007jX-Om for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 03:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5FEBC6008A;
 Mon, 15 Jun 2026 03:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409001F000E9;
 Mon, 15 Jun 2026 03:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781492651;
 bh=7RL67W0QSeHraShNTh9i+t3F4TleR8GK1j7DCrjYmT8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=gieWxAK8BnGfKekugqK7atBoQ/8MpmV/3A4BIsNSGlRBnmxY9AMo5AX3RbezzCzET
 /ao6F2OuEsXIvb6IhEEGvJwMJkGOuLzHllWzeGdpQQPAQc+Ce1rPL43qurssI8aCf7
 seNnhUM7CoGtDuG89kzVgTb7k1TVKugv24Bd2pIezSpzbCqWRztgrt3O0m1A6pUePZ
 YJlIZQogjM6skkLvtez6fl7RF8CdzOduN5Ze5SK8+b06bq83UNfijLma6RxPcjGNAH
 EtstkQsIRZVj9l45KjkCfrKIFrUTqzp/2o9rER56UO0E3e4Da2LeBvOcY1gHXvKMCA
 uZN7CaWmRdzTQ==
Message-ID: <48f1fbdb-fa94-4de1-92e4-8ebfd9e12be0@kernel.org>
Date: Mon, 15 Jun 2026 11:04:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <cover.1780003055.git.bvanassche@acm.org>
 <0e18152026cacd1e61fb5fb5483fc1d3c57bdc51.1780003055.git.bvanassche@acm.org>
 <a3431eb2-6224-401b-9aec-1c0abf840143@kernel.org>
 <7d8cd85c-2aa7-48fd-89af-39adabc89d97@acm.org>
 <acf21183-0505-401e-9a1c-dd91ff147b63@kernel.org>
 <6505b5e3-b4e8-41bb-bfb0-52e6e20f45f0@acm.org>
Content-Language: en-US
In-Reply-To: <6505b5e3-b4e8-41bb-bfb0-52e6e20f45f0@acm.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/13/26 05:03, Bart Van Assche wrote: > On 6/12/26 5:05
 AM, Chao Yu wrote: >> Actually, I'm worry about whether there is potential
 performance regression >> caused by enabling this by default, also [...] 
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
X-Headers-End: 1wYxcb-0007jX-Om
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: Run f2fs_write_end_io()
 asynchronously
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82BCE682F5C

On 6/13/26 05:03, Bart Van Assche wrote:
> On 6/12/26 5:05 AM, Chao Yu wrote:
>> Actually, I'm worry about whether there is potential performance regression
>> caused by enabling this by default, also a little bit concern about the affection for PC|laptop scenario which is used by individual user.
> 
> According to Gemini F2FS is primarily used on PC's and laptops to
> increase random write IOPS for rotating media (hard disks). I don't
> expect the performance impact of this patch series to be measurable for
> rotating media because the time required to queue and schedule work is
> very small compared to the I/O completion time for these devices.

Hmm, I suspect there is potential non rotating media user, scheduling
can be the bottleneck there, maybe.

> 
> I ran a new set of measurements on a UFS 4 test setup with zoned
> storage (ZUFS). On that test setup I see that the variation between test
> runs is much larger than the variation in test results with or without
> this patch series. In other words, I don't think that we have to worry
> about the performance impact of this patch series.

Well, it needs to be verified for each kernel version you backported, on ZUFS
or non ZUFS, right? I guess Randall or Leo may have time to assist to setup the
performance test. :)

Thanks,

> 
> Bart.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
