Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E09D1BD8E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 01:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYQGsG4yzKXcpDVEyksv3o6pHL+aytpLPA1gXbrVpQ0=; b=F8+7nXjJFyz3FooaOrJlfsHlEB
	BaxhCJv0gjf7ZBPOTD4a+Y9kFUOt7K7a/JB68eR/ahlzyJeMKg5PY+2l6bXTIta/dBRSLRP3VpWVg
	IMCJbXHNqKc8ivWxCcaNYLc6H04BFZ15NU4L0F8InDaQkGKMc8KwqJ3fVipN8yAha1uA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfp24-00085M-Ai;
	Wed, 14 Jan 2026 00:46:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <linkinjeon@kernel.org>) id 1vfp23-00085G-I5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 00:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zkcxvaI8I2E99ca2DQiL6AIHbYg5o0RQfZEDZKQZZ9M=; b=cLbvpHmcbeBTrU6DMOaMSmq63I
 8dOCQAMu1drsblUIuWtQdCsBGmChK/eonjPKzp+Y2CDvZYqT7RD2VFcE4jP2AQpLMoVo1/YwG6PkC
 OZIkT03RKtTOpas05GZQPPkTkd6/Bzvqf3gwDs7LHye7bHJOajJLJhwLI/OIsofNM2FU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zkcxvaI8I2E99ca2DQiL6AIHbYg5o0RQfZEDZKQZZ9M=; b=hhjrwJgOBz2yefrw5XIR533fEP
 EKHqM3SOfo8zn1gaXw3FH803LC4/5tPL+r2JB+ugC6B6N9EVTo/SHWWwSl5eYo2Hy4MMQPPPDjWRq
 8A06AemOtg9kRT0vynQLtRPRjwSCy6+4y/trWWmmq6bStHRqUeeD6tNQsWIzaL1RdOxs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfp23-0001y2-2p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 00:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7354260097
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B10C19425
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768351592;
 bh=zkcxvaI8I2E99ca2DQiL6AIHbYg5o0RQfZEDZKQZZ9M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oR8Gtqt6yefBIRJt8fwEoRN0l+2PQpQ9KjBYDzYVqoBhvPlHRh68Vz8rLOI4sZVs3
 JxVL5gEBZsKoNubnH5IvbtSsO7et/GdRrOc4xC8hKgC1gKQ6f7AB5rSENHsv3l040J
 TlO0jlDVaeMVD7DRvmT+bxB3vOhytH+1ceGmuacyThjilq4RW18+JGwux1DSTAR3M9
 wGTnvCflyagvNHLOWzob6vlW5GoGwdgEoIDy/3F8XORlqNYVtCU4+6ppP59r06wd/0
 GJ0bmEZrmCPciykUgR9T7rDVc8HHIMvwazJf47bDG2oVCmypF9f+vKmzFHiGRaQbwB
 Y6apb2eVqPXhg==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so13006997a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 16:46:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXyW4lOT8/Kym4yqTJINtOQI511lzDQtbnO5SZjMy09FJmpj/uU9XZh0F9qUtUbxlSSKzQKcY+iQ1ltx53kD/tG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyjhazX95sQ42catZJIhbZIaE6Ag2sXdduuKfPnIuRZCtpfAzzo
 evmi2rq7aCVwa2LCumUOnAyz7AEpJNvKRfkqTN+shhxe7/MrSiXG0l3s2bD9SOgI94KX/gT1yl9
 hEM/uFAeHPAnnaO6FiyhUjNvCqA2N4dQ=
X-Received: by 2002:a17:907:7247:b0:b87:2579:b6cc with SMTP id
 a640c23a62f3a-b876124f9b1mr84211866b.37.1768351590667; Tue, 13 Jan 2026
 16:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-17-cel@kernel.org>
In-Reply-To: <20260112174629.3729358-17-cel@kernel.org>
Date: Wed, 14 Jan 2026 09:46:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9kFLQmPPGsJ5rTGSqbXp2fA_Hh4-z0BDbGb2_HCQvgUw@mail.gmail.com>
X-Gm-Features: AZwV_QhgKLMAC1WJlShWVjG76Ssk-76f2CnnHyXv102pHNTEx_UlWkY-EEEsYVs
Message-ID: <CAKYAXd9kFLQmPPGsJ5rTGSqbXp2fA_Hh4-z0BDbGb2_HCQvgUw@mail.gmail.com>
To: Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 13, 2026 at 2:47 AM Chuck Lever <cel@kernel.org>
 wrote: > > From: Chuck Lever <chuck.lever@oracle.com> > > ksmbd hard-codes
 FILE_CASE_SENSITIVE_SEARCH and > FILE_CASE_PRESERVED_NAMES in FS [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfp23-0001y2-2p
Subject: Re: [f2fs-dev] [PATCH v3 16/16] ksmbd: Report filesystem case
 sensitivity via FS_ATTRIBUTE_INFORMATION
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
From: Namjae Jeon via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, linux-nfs@vger.kernel.org, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMjo0N+KAr0FNIENodWNrIExldmVyIDxjZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDaHVjayBMZXZlciA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNv
bT4KPgo+IGtzbWJkIGhhcmQtY29kZXMgRklMRV9DQVNFX1NFTlNJVElWRV9TRUFSQ0ggYW5kCj4g
RklMRV9DQVNFX1BSRVNFUlZFRF9OQU1FUyBpbiBGU19BVFRSSUJVVEVfSU5GT1JNQVRJT04gcmVz
cG9uc2VzLAo+IGluY29ycmVjdGx5IGluZGljYXRpbmcgYWxsIGV4cG9ydHMgYXJlIGNhc2Utc2Vu
c2l0aXZlLiBUaGlzIGJyZWFrcwo+IGNsaWVudHMgYWNjZXNzaW5nIGNhc2UtaW5zZW5zaXRpdmUg
ZmlsZXN5c3RlbXMgbGlrZSBleEZBVCBvcgo+IGV4dDQvZjJmcyBkaXJlY3RvcmllcyB3aXRoIGNh
c2Vmb2xkIGVuYWJsZWQuCj4KPiBRdWVyeSBhY3R1YWwgY2FzZSBiZWhhdmlvciB2aWEgdmZzX2Zp
bGVhdHRyX2dldCgpIGFuZCByZXBvcnQgYWNjdXJhdGUKPiBhdHRyaWJ1dGVzIHRvIFNNQiBjbGll
bnRzLiBGaWxlc3lzdGVtcyB3aXRob3V0IC0+ZmlsZWF0dHJfZ2V0IGNvbnRpbnVlCj4gcmVwb3J0
aW5nIGRlZmF1bHQgUE9TSVggYmVoYXZpb3IgKGNhc2Utc2Vuc2l0aXZlLCBjYXNlLXByZXNlcnZp
bmcpLgo+Cj4gU01CJ3MgRlNfQVRUUklCVVRFX0lORk9STUFUSU9OIHJlcG9ydHMgcGVyLXNoYXJl
IGF0dHJpYnV0ZXMgZnJvbSB0aGUKPiBzaGFyZSByb290LCBub3QgcGVyLWZpbGUuIFNoYXJlcyBt
aXhpbmcgY2FzZWZvbGQgYW5kIG5vbi1jYXNlZm9sZAo+IGRpcmVjdG9yaWVzIHJlcG9ydCB0aGUg
cm9vdCBkaXJlY3RvcnkncyBiZWhhdmlvci4KPgo+IFNpZ25lZC1vZmYtYnk6IENodWNrIExldmVy
IDxjaHVjay5sZXZlckBvcmFjbGUuY29tPgpBY2tlZC1ieTogTmFtamFlIEplb24gPGxpbmtpbmpl
b25Aa2VybmVsLm9yZz4KVGhhbmtzIQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
