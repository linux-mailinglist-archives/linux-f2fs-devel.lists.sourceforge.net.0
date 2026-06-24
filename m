Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T0+4BEmVO2oJaAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 10:28:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F756BC907
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 10:28:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QrwznR3a;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fhN6Iy2w;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=BrwVxBkU;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=nbjVXSoh;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPpYlkOtrFZ4JCnL+AW5Qsn0G0g6CGZVkfpKzrdUl1M=; b=QrwznR3aagyC1I4bz+H76nP2w6
	E2P2RWl1M/XEkhil6bwbiobyCHfw/EPKG5BAfpDUOsmX4Mrg5YUnnMKn+QySwf22bfjS9k/5x3x2k
	1FotZqQHLz0LKXVDrpQbLJZ7vD9w3UOC66wWVDen1VWT4lXuaEJ1NK35bbHsnr0sJpfY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcIyZ-0007pi-N7;
	Wed, 24 Jun 2026 08:28:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wcIyT-0007n9-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 08:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wfh/P99IwchT4VHP5S2uoDUD6OJUbSYALHpjt96hxt8=; b=fhN6Iy2wI7munOajXvvuM+/cLK
 LbdiCgJ/of2+m59RWs3d8Hh0GeYSmm1pYKJoQwhnVmvWdDSZSHCcUwDZMm84RDqORH3KsD9uKiDzC
 3tbIZfeRS0yXZuhYHZRd6Lwn7FZVPlT5lXB8x3vqninu76kJKeUM0ymEaHjx0NtBZhQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wfh/P99IwchT4VHP5S2uoDUD6OJUbSYALHpjt96hxt8=; b=BrwVxBkUBBu6xe+nnyj10fBq9f
 HnR2h45i5uh7zXja1d/dfzWmwaNoZKfceV8aBFbu+ltDU3uCQSPF4Suib7gPxs1fjT2Dj9J2/CJs8
 sHM5kCgk4jLSoC8CLg3SIT0ha9MKW2nq8On0I0qLpV4DQcau7eGMycRYjrB8nmXEINZQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcIyO-0005r4-1I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 08:28:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 24730402F9;
 Wed, 24 Jun 2026 08:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6E71F000E9;
 Wed, 24 Jun 2026 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782289710;
 bh=Wfh/P99IwchT4VHP5S2uoDUD6OJUbSYALHpjt96hxt8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=nbjVXSoh8lGDMcEIFETBOWr5/TbVI4Pz/S7rlr+ncCl83wfEgJHEb7rLLiajGp/E3
 +yHKC/8QmnNc2OAVgoUzViGGC0hCoFKu6+4k/WTGpAhZqiobITU5USuzX1Q9+9DpsU
 85I+VhDlDkE+l4R+pU1fRN+oDhLs1y3Bb+Nb5uHFxzVRq+AR7qPv6qKr0Fk5zl/mJt
 OP30YI7TfSb3Zk6aKMKKeXMfsRYynv8QyFwclKvvtS2CnByblgsuB5o+pFzppXrZTZ
 pA7UydHKJrEdOqukbouVQwh0FPC/iiNRMejeDZKRJxS7TbZ5AZs3ga7zRGhV6pSRJc
 RLeut/SZoFwxA==
Message-ID: <d25d1fb2-de6d-4a92-a798-fd304e8e5654@kernel.org>
Date: Wed, 24 Jun 2026 16:28:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>
References: <20260622011539.2292553-1-chao@kernel.org>
 <20260623232926.GA7864@quark>
Content-Language: en-US
In-Reply-To: <20260623232926.GA7864@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/24/26 07:29, Eric Biggers wrote: > On Mon, Jun 22, 2026
 at 01:15:39AM +0000, Chao Yu wrote: >> As part of the linux kernel's migration
 to folio-based APIs, introduce >> fscrypt_finalize_bounce_fo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wcIyO-0005r4-1I
Subject: Re: [f2fs-dev] [PATCH] fscrypt,
 f2fs: introduce fscrypt_finalize_bounce_folio() for cleanup
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96F756BC907

On 6/24/26 07:29, Eric Biggers wrote:
> On Mon, Jun 22, 2026 at 01:15:39AM +0000, Chao Yu wrote:
>> As part of the linux kernel's migration to folio-based APIs, introduce
>> fscrypt_finalize_bounce_folio() as the folio equivalent of
>> fscrypt_finalize_bounce_page(), and clean up f2fs codes with this new
>> helper.
>>
>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>> Cc: Eric Biggers <ebiggers@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>
>> Is it worth to introduce fscrypt_finalize_bounce_folio(), then try to
>> do clean in f2fs_write_end_bio() first, and then replace
>> fscrypt_finalize_bounce_page() later?
> 
> I'm working on making ext4 and f2fs always do file contents
> en/decryption using fscrypt_set_bio_crypt_ctx(), which already supports
> large folios and doesn't require the filesystem to manage bounce
> buffers.  I don't think these minor tweaks to the other implementation
> (which don't actually make it support large folios) accomplish anything
> useful, and we should focus on removing it instead.

Good, I see your patchset removing those codes, let's ignore current patch.

Thanks,

> 
> - Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
