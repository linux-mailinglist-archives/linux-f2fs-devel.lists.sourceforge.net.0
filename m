Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96434BD0B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 17:49:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQXfJ-0007ox-Ux; Sun, 28 Mar 2021 15:49:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andrealmeid@collabora.com>) id 1lQXfH-0007oi-JN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 15:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rK48kvdE8cntcL0WMtevHC7U8gwoF2TyGi6R18AnLus=; b=AHWjuVXB+9ijmmZMb68c+pmkL7
 +91T81ZTs1M0TKnc/vrBtj8rwmyZr3aFxFaNnNpJau2Ja1Z7DfZgqYr6Bcy5YrlPOLiOLY1PJKPKc
 B21/ofqM+wuURsay6c7zKTFnqJzKTfih0ixG9SqZdIChmkCfrNe4Lm+GTYPtr2Tx9BOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rK48kvdE8cntcL0WMtevHC7U8gwoF2TyGi6R18AnLus=; b=ET3bPKt2aXJX13q4KpGh7UfCvQ
 bT666YvmloEllobSgXqePN/GaJ4MhOpMokHrkpJOaroaTbwdmXT4Qm0WJKZPzPFH2IuW2pIsCM8Td
 idXOzVgisFOD69WqEGdywoVvefkgbWu04PNYikGV1NoXnMgKPeaNzXBmf/+HUbgmG6w0=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lQXfA-004rcT-R9
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 15:49:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 9D0AA1F4629A
To: Matthew Wilcox <willy@infradead.org>
References: <20210328144356.12866-1-andrealmeid@collabora.com>
 <20210328144356.12866-2-andrealmeid@collabora.com>
 <20210328150715.GA33249@casper.infradead.org>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <74ca03a0-1975-8b9f-f9af-c15946580904@collabora.com>
Date: Sun, 28 Mar 2021 12:49:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210328150715.GA33249@casper.infradead.org>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lQXfA-004rcT-R9
Subject: Re: [f2fs-dev] [PATCH 1/3] fs/dcache: Add d_clear_dir_neg_dentries()
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
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Daniel Rosenberg <drosen@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, kernel@collabora.com, krisman@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

w4BzIDEyOjA3IGRlIDI4LzAzLzIxLCBNYXR0aGV3IFdpbGNveCBlc2NyZXZldToKPiBPbiBTdW4s
IE1hciAyOCwgMjAyMSBhdCAxMTo0Mzo1NEFNIC0wMzAwLCBBbmRyw6kgQWxtZWlkYSB3cm90ZToK
Pj4gKy8qKgo+PiArICogZF9jbGVhcl9kaXJfbmVnX2RlbnRyaWVzIC0gUmVtb3ZlIG5lZ2F0aXZl
IGRlbnRyaWVzIGluIGFuIGlub2RlCj4+ICsgKiBAZGlyOiBEaXJlY3RvcnkgdG8gY2xlYXIgbmVn
YXRpdmUgZGVudHJpZXMKPj4gKyAqCj4+ICsgKiBGb3IgZGlyZWN0b3JpZXMgd2l0aCBuZWdhdGl2
ZSBkZW50cmllcyB0aGF0IGFyZSBiZWNvbWluZyBjYXNlLWluc2Vuc2l0aXZlCj4+ICsgKiBkaXJz
LCB3ZSBuZWVkIHRvIHJlbW92ZSBhbGwgdGhvc2UgbmVnYXRpdmUgZGVudHJpZXMsIG90aGVyd2lz
ZSB0aGV5IHdpbGwKPj4gKyAqIGJlY29tZSBkYW5nbGluZyBkZW50cmllcy4gRHVyaW5nIHRoZSBj
cmVhdGlvbiBvZiBhIG5ldyBmaWxlLCBpZiBhIGRfaGFzaAo+PiArICogY29sbGlzaW9uIGhhcHBl
bnMgYW5kIHRoZSBuYW1lcyBtYXRjaCBpbiBhIGNhc2UtaW5zZW5zaXRpdmUsIHRoZSBuYW1lIG9m
Cj4+ICsgKiB0aGUgZmlsZSB3aWxsIGJlIHRoZSBuYW1lIGRlZmluZWQgYXQgdGhlIG5lZ2F0aXZl
IGRlbnRyeSwgdGhhdCBjYW4gYmUKPj4gKyAqIGRpZmZlcmVudCBmcm9tIHRoZSBzcGVjaWZpZWQg
YnkgdGhlIHVzZXIuIFRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmluZywgd2UKPj4gKyAqIG5l
ZWQgdG8gcmVtb3ZlIGFsbCBkZW50cmllcyBpbiBhIGRpcmVjdG9yeS4gR2l2ZW4gdGhhdCB0aGUg
ZGlyZWN0b3J5IG11c3QgYmUKPj4gKyAqIGVtcHR5IGJlZm9yZSB3ZSBjYWxsIHRoaXMgZnVuY3Rp
b24gd2UgYXJlIHN1cmUgdGhhdCBhbGwgZGVudHJpZXMgdGhlcmUgd2lsbAo+PiArICogYmUgbmVn
YXRpdmUuCj4+ICsgKi8KPiAKPiBUaGlzIGlzIHF1aXRlIHRoZSBsYW5kbWluZSBvZiBhIGZ1bmN0
aW9uLiAgSXQgX2Fzc3VtZXNfIHRoYXQgdGhlIGRpcmVjdG9yeQo+IGlzIGVtcHR5LCBhbmQgY2xl
YXJzIGFsbCBkZW50cmllcyBpbiBpdC4KPiAKPj4gK3ZvaWQgZF9jbGVhcl9kaXJfbmVnX2RlbnRy
aWVzKHN0cnVjdCBpbm9kZSAqZGlyKQo+PiArewo+PiArCXN0cnVjdCBkZW50cnkgKmFsaWFzLCAq
ZGVudHJ5Owo+PiArCj4+ICsJaGxpc3RfZm9yX2VhY2hfZW50cnkoYWxpYXMsICZkaXItPmlfZGVu
dHJ5LCBkX3UuZF9hbGlhcykgewo+PiArCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGRlbnRyeSwgJmFs
aWFzLT5kX3N1YmRpcnMsIGRfY2hpbGQpIHsKPj4gKwkJCWRfZHJvcChkZW50cnkpOwo+PiArCQkJ
ZHB1dChkZW50cnkpOwo+PiArCQl9Cj4gCj4gSSB3b3VsZCBiZSBoYXBwaWVyIGlmIGl0IGluY2x1
ZGVkIGEgY2hlY2sgZm9yIG5lZ2F0aXZpdHkuICBkX2lzX25lZ2F0aXZlKCkKPiBvciBtYXliZSB0
aGlzIG5ld2ZhbmdsZWQgZF9yZWFsbHlfaXNfbmVnYXRpdmUoKSAoaSBoYXZlbid0IHN0YXllZCB1
cAo+IHRvIHNwZWVkIG9uIHRoZSBwcmVjaXNlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvKQo+
IAoKTWFrZXMgc2Vuc2UuIEFuZCBnaXZlbiB0aGF0IHRoaXMgb25seSBtYWtlcyBzZW5zZSBpZiB0
aGUgZGlyZWN0b3J5IGlzIAplbXB0eSwgaWYgaXQgZm91bmRzIGEgbm9uLW5lZ2F0aXZlIGRlbnRy
eSwgaXQgc2hvdWxkIHJldHVybiBzb21lIGVycm9yIApyaWdodD8KCj4+ICsJfQo+PiArfQo+PiAr
RVhQT1JUX1NZTUJPTChkX2NsZWFyX2Rpcl9uZWdfZGVudHJpZXMpOwo+IAo+IEknZCByYXRoZXIg
c2VlIHRoaXMgX0dQTCBmb3Igc3VjaCBhbiBpbnRlcm5hbCB0aGluZy4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
