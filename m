Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPgUNhgsBGoDFAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 09:45:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE752EE3B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 09:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCNW9f7Jtv34dhRcCiWXo0VDsasYRscuy9qAz7jIxAA=; b=ioEBSuKUezbBDn06Yq7J2kjxn6
	eEXLpscsi1Xm8fSzqr+b/liG0VpeI7O/WdiuAMwYmQsfT7J8nH1XrKHQkvLEMB6k+Wi3ZajBnG3Cg
	picUKFHjR/tbFk2XMjIhU9D4acQN9HtfmAImaw6mesMeZ9PmKWD7DIpR+Q+160s5skD0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wN4HT-0003H8-JV;
	Wed, 13 May 2026 07:45:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1wN4HK-0003Gu-HR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 07:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jfc9VamWO5q0xBx3b2s9XvXr4HRth56IxXIXv/8jUV8=; b=aB8Z1MYu9mMfefFBzzBijdo8rZ
 1L2AQYteYHp0TPn6N1WoLFqnnwQ6pvhRf8sd0IMVYl75K6A78l95a6EExBepUFyEfCPoaDEzVsfB6
 lpLU2dFdWj8tVpjjdxW+C/YB9eRRNLrE1jcg3ItMb0qFqmmdHit4kJdfDDuOpGrr1mCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jfc9VamWO5q0xBx3b2s9XvXr4HRth56IxXIXv/8jUV8=; b=gJhILEQ3hPVXMk5Ujq0jBjncAb
 R3KJbmApSZaCX0/L6nWbOLdt6fkItDc1AaTdPHCmFuhXESRL2d13314rs1Og+RX44h54/y8AYaKOW
 1AH99EjCJB5rSRP640trkLdPYHzTXR5+MckPKhOq79UY+ySm8lyk9Q59q4dkN2fDAW/c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wN4HG-0002mu-6u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 07:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 21E5F43DB5;
 Wed, 13 May 2026 07:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B4FC2BCB7;
 Wed, 13 May 2026 07:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778658300;
 bh=Dg2nW1p160NOCn5umFdjytzvydm/ZD4Y8VIlSf+k0CM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W88QhGV5fNBgG29b6A8+2aMpfRcsRHQN/DvQSObUW7md2OERCUFlHgf1cKsHqoq2S
 8ykZnWkud0SccegE0umMkD4j5jJ7KgzhBrzoBcb9I/I9zNm6SNrd0Urp9aI7aA2mFH
 Ls43dph0TYLcQ7SHMgIKKiqIjYNGHdG0bRvkSKaUSVLbUqXi1S0+3eREdcpqS6vbou
 pjHmEbKTKNOrbnUGt7tcluhtcMyTN3bE6oKaewls6oT44KMpU3eYtzejZxITRlsKNU
 MrtDtAfOwb3/X7OZISUgYCyAwxQnZAGj2NCGbnTCksT5zjWWNFVhk+szDVycr1iBRH
 EXReRb+kSdmJg==
Message-ID: <acd6428b-a352-4f7b-a349-b2c9e341fd87@kernel.org>
Date: Wed, 13 May 2026 16:44:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-10-hch@lst.de>
 <20260512170846.GJ9555@frogsfrogsfrogs> <20260513055806.GC1236@lst.de>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260513055806.GC1236@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/13/26 14:58, Christoph Hellwig wrote: > On Tue, May 12, 
 2026 at 10:08:46AM -0700, Darrick J. Wong wrote: >>> + /* Only one bdev per
 swap file for now. */ >>> + if (!sis->bdev) >>> + sis->bdev = b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wN4HG-0002mu-6u
Subject: Re: [f2fs-dev] [PATCH 09/12] swap: push down setting sis->bdev into
 ->swap_activate
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-mm@kvack.org, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Chris Li <chrisl@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, linux-btrfs@vger.kernel.org,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: EEAE752EE3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:djwong@kernel.org,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[dlemoal@kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

T24gNS8xMy8yNiAxNDo1OCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVHVlLCBNYXkg
MTIsIDIwMjYgYXQgMTA6MDg6NDZBTSAtMDcwMCwgRGFycmljayBKLiBXb25nIHdyb3RlOgo+Pj4g
KwkvKiBPbmx5IG9uZSBiZGV2IHBlciBzd2FwIGZpbGUgZm9yIG5vdy4gKi8KPj4+ICsJaWYgKCFz
aXMtPmJkZXYpCj4+PiArCQlzaXMtPmJkZXYgPSBiZGV2Owo+Pj4gKwllbHNlIGlmIChiZGV2ICE9
IHNpcy0+YmRldikKPj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pgo+PiBTaG91bGQgdGhpcyByZXR1
cm4gZXJyb3IgaWYgdGhlIGJkZXYgaXMgem9uZWQ/ICBBRkFJQ1QgWEZTIGFuZCB6b25lZnMKPj4g
YWxyZWFkeSBndWFyZCBhZ2FpbnN0IHRoaXMsIGJ1dCBvdGhlciBmc2VzIG1pZ2h0IGJlIG1vcmUg
bmHDr3ZlLgo+IAo+IFllcywgbm93IHRoYXQgdGhlIGJkZXYgaXMgcGFzc2VkIGRvd24gdG8gYWRk
X3N3YXBfZXh0ZW50IHdlIGNvdWxkCj4gY29uc29saWRhdGUgdGhlIGNoZWNrIGhlcmUuCgpIbW1t
Li4uIFdpdGggem9uZWZzLCBzd2FwIGZpbGVzIGNhbiBiZSBjcmVhdGVkIG9uIHRvcCBvZiBjb252
ZW50aW9uYWwgem9uZQpmaWxlcy4gU28gZW5mb3JjaW5nICJubyBzd2FwIG9uIHpvbmVkIGRldmlj
ZSIgaGVyZSB3b3VsZCBicmVhayB0aGF0LgoKCi0tIApEYW1pZW4gTGUgTW9hbApXZXN0ZXJuIERp
Z2l0YWwgUmVzZWFyY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
