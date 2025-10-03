Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC7BB796B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 18:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3rIhWb95znz0mV6cq65N5V0i3pOrB+qul544grhNfk=; b=ffMjIhYKQWvRATYUAMolqS/bxH
	RGbKeES9Fky7TqkjHB+7zkyCRbXLXYBCms7ziJ6RCn5cMhM7z9LnlmmSKtcV5vZg3mLhmtFCT2sOj
	FglE0XkYK1VJTpbmUjwUGVe1UFPajYVKKvWzO5iv784hQOarodpekwYDG+Vz55bBLuV4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4irk-0005Hd-Fr;
	Fri, 03 Oct 2025 16:42:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1v4irj-0005HW-5h
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 16:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kaGKa/GsHfvvz+I6tQ1XQm45DL6OZE5hJiJAwo8qivc=; b=awN1D9yPl1A7QFjVO2Inc6myl3
 bQ6jv0E99ugnBHuZAq7O6rDkkdzgwQ1aFNo2qmvIkqLUaanBNQOYNfE7KK2jAYa5qDeVK1DyVUsHU
 yLUlMWORppqyiZMYbwjd3aczMuKjkbGWVSPhAfpwnQx4fHaa4Y+bhenFsfz3g9m4BkCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kaGKa/GsHfvvz+I6tQ1XQm45DL6OZE5hJiJAwo8qivc=; b=iX4RlaCYwE3gY18qtUps8afmgr
 5++XeuyHESp+OlclJZ3u+kVCnisYS/y1XoGAgbKHLUZoB97Ly+QfV9wmPx2yw8TVPlWpSZXXvRiKV
 9zT5sk48jq49mTaDKAFyoT0I1hQu2nd9i0pI8hMzfGP80v7ZMwFtsp+RbTKP1lWSJLiM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4iri-0001AL-NK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 16:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1046363D84;
 Fri,  3 Oct 2025 16:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACB6C4CEFF;
 Fri,  3 Oct 2025 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759509751;
 bh=2vM9WbBxLoiNuv/ifCy0fu4bZYJPwZhrOYJXYV+rIOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVIn6FBVKBz4QYlzib5FZIUskpCeUR60qSL+NRIAHbT6RlQt3E0INPErmauR504q+
 L3NeFivZaFMX3TwmCI3lwvQC+sH2900k2mlQnkwl8cQy1LZK5ar4AYct0Aj7z46m/O
 X8D1Jva2J6KrmD3XA5Gsmzz3V944UyqHzQvdz/4gEKLKQ4YMwtO0NrUbB4pG3/os5X
 yyorYwivaV1hORnhPBjwua3eWeHx4abtdRi05aIxAT+uzo43u2snqHRAklrd+s5Ydu
 dChvjFg7XG8D/PniCji1PTdTR5348ZLm1C6lZK+cDThyfCplKLeRgwdS9QcnJtbiZp
 xyO9+0BSmpzLQ==
Date: Fri, 3 Oct 2025 09:42:27 -0700
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <20251003164227.GA1649@quark>
References: <20250915100451.810719-1-jprusakowski@google.com>
 <20250915100451.810719-2-jprusakowski@google.com>
 <20250915143951.GB1993@quark>
 <CAHwWncjUFzByau+oWh--Q3t-w6FjQ8kWG_fiOyEzLB=HHfdAsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHwWncjUFzByau+oWh--Q3t-w6FjQ8kWG_fiOyEzLB=HHfdAsg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 16, 2025 at 02:13:39PM +0200, Jan Prusakowski
 wrote: > On Mon, Sep 15, 2025 at 4:40 PM Eric Biggers <ebiggers@kernel.org>
 wrote: > > > > On Mon, Sep 15, 2025 at 12:04:51PM +0200, Jan Prusa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4iri-0001AL-NK
Subject: Re: [f2fs-dev] [PATCH v2 1/1] common/encrypt: Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBTZXAgMTYsIDIwMjUgYXQgMDI6MTM6MzlQTSArMDIwMCwgSmFuIFBydXNha293c2tp
IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDQ6NDDigK9QTSBFcmljIEJpZ2dlcnMg
PGViaWdnZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgU2VwIDE1LCAyMDI1
IGF0IDEyOjA0OjUxUE0gKzAyMDAsIEphbiBQcnVzYWtvd3NraSB3cm90ZToKPiA+ID4gY29tbW9u
L2VuY3J5cHQ6IERvIG5vdCBydW4gX3ZlcmlmeV9jaXBoZXJ0ZXh0X2Zvcl9lbmNyeXB0aW9uX3Bv
bGljeSBvbiBjb21wcmVzc2VkIEZTCj4gPgo+ID4gQSBiZXR0ZXIgdGl0bGUgd291bGQgYmUgc29t
ZXRoaW5nIGxpa2UKPiA+ICJjb21tb24vZW5jcnlwdDogRXhwbGljaXRseSBzZXQgdGhlIHRlc3Qg
ZmlsZSB0byB1bmNvbXByZXNzZWQiLgo+IAo+IEFncmVlZCwgd2lsbCBmaXggdGhhdCBpbiB2My4K
PiAKPiA+ID4gQEAgLTc5MCw2ICs3OTAsMTMgQEAgX2RvX3ZlcmlmeV9jaXBoZXJ0ZXh0X2Zvcl9l
bmNyeXB0aW9uX3BvbGljeSgpCj4gPiA+ICAgICAgIF9zZXRfZW5jcG9saWN5ICRkaXIgJGtleXNw
ZWMgJHNldF9lbmNwb2xpY3lfYXJncyAtZiAkcG9saWN5X2ZsYWdzCj4gPiA+ICAgICAgIGZvciBz
cmMgaW4gJHRtcC50ZXN0ZmlsZV8qOyBkbwo+ID4gPiAgICAgICAgICAgICAgIGRzdD0kZGlyLyR7
c3JjIyMqLn0KPiA+ID4gKyAgICAgICAgICAgICAjIFRvIG1ha2Ugc3VyZSB0aGUgdGVzdCBmaWxl
IGlzIG5vdCBjb21wcmVzc2VkIHdlIGNyZWF0ZSBhbiBlbXB0eSBvbmUKPiA+ID4gKyAgICAgICAg
ICAgICAjIGFuZCBkaXNhYmxlIGNvbXByZXNzaW9uIGZpcnN0IChGMkZTIHdvbid0IGFsbG93IHJl
c2V0dGluZyB0aGUKPiA+ID4gKyAgICAgICAgICAgICAjIGNvbXByZXNzaW9uIGZsYWcgaWYgdGhl
IGZpbGUgaGFzIGRhdGEgYWxyZWFkeSBpbiBpdCkuCj4gPiA+ICsgICAgICAgICAgICAgdG91Y2gg
JGRzdAo+ID4gPiArICAgICAgICAgICAgIGlmIGxzYXR0ciAkZHN0IHwgZ3JlcCAtcUUgIi4rYy4r
ICRkc3QiIDsgdGhlbgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY2hhdHRyIC1jICRkc3QK
PiA+ID4gKyAgICAgICAgICAgICBmaQo+ID4gPiAgICAgICAgICAgICAgIGNwICRzcmMgJGRzdAo+
ID4gPiAgICAgICAgICAgICAgIGlub2RlPSQoc3RhdCAtYyAlaSAkZHN0KQo+ID4gPiAgICAgICAg
ICAgICAgIGJsb2NrbGlzdD0kKF9nZXRfY2lwaGVydGV4dF9ibG9ja19saXN0ICRkc3QpCj4gPgo+
ID4gSXMgYWRkaW5nICdtJyAoRlNfTk9DT01QX0ZMKSBuZWVkZWQgdG9vPyAgSWYgbm90LCB3aHkg
ZG9lcyBpdCBleGlzdD8KPiAKPiBJbiBteSBzZXR1cCBmaWxlcyBjcmVhdGVkIGhhdmUgRlNfQ09N
UFJfRkwgc2V0IGZyb20gdGhlIHN0YXJ0LiBKdXN0IGNsZWFyaW5nCj4gRlNfQ09NUFJfRkwgYXBw
ZWFycyB0byBoZWxwIGFzIG5vdyBhbGwgdGhlIHRlc3RzIHVzaW5nCj4gX3ZlcmlmeV9jaXBoZXJ0
ZXh0X2Zvcl9lbmNyeXB0aW9uX3BvbGljeQo+IHBhc3Mgd2hlbiBJIHJ1biB0aGVtIG9uIGYyZnMg
d2l0aCAiLW8gY29tcHJlc3NfZXh0ZW5zaW9uPSoiLgo+IAo+IERvIHlvdSB0aGluayB3ZSBzaG91
bGQgYWRkICdtJyAoRlNfTk9DT01QX0ZMKSBhcyB3ZWxsIGp1c3QgaW4gY2FzZSBzb21lIG90aGVy
IEZTCj4gYmVoYXZlcyBkaWZmZXJlbnRseT8gRG8geW91IGhhdmUgYW55IGlkZWFzIG9uIHdoYXQg
b3RoZXIgRlMgSSBzaG91bGQgY2hlY2s/CgpJIHRoaW5rIHNvLiAgSXQgZG9lc24ndCBsb29rIGxp
a2UgZjJmcyBkb2VzIGFueXRoaW5nIHdpdGggRlNfTk9DT01QX0ZMLApvdGhlciB0aGFuIGVuZm9y
Y2UgdGhhdCBpdCdzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIEZTX0NPTVBSX0ZMLiAgQnV0CnRo
ZXJlIGNvdWxkIGJlIGZpbGVzeXN0ZW1zIHdoZXJlIDAgZ2l2ZXMgdGhlIGRlZmF1bHQgYmVoYXZp
b3IgKHdoaWNoCmNvdWxkIGJlIGNvbXByZXNzKSBhbmQgRlNfTk9DT01QX0ZMIGlzIG5lZWRlZCB0
byBkaXNhYmxlIGNvbXByZXNzaW9uLgoKYnRyZnMgbWlnaHQgZG8gdGhhdCwgYWN0dWFsbHkuICBJ
dCBkb2Vzbid0IHN1cHBvcnQgZW5jcnlwdGlvbiB5ZXQsCnRob3VnaCwgc28gdGhlc2UgdGVzdHMg
Y2FuJ3QgYmUgcnVuIG9uIGJ0cmZzLgoKSSB3b3VsZCBqdXN0IGFkZCBGU19OT0NPTVBfRkwgYW5k
IG1ha2Ugc3VyZSBpdCBzdGlsbCB3b3JrcyBvbiBmMmZzLgoKLSBFcmljCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
