Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83934E7FC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Mar 2021 14:54:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRDsz-0004Bv-UV; Tue, 30 Mar 2021 12:54:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andrealmeid@collabora.com>) id 1lRDsy-0004Be-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 12:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=11ux4kf1HOJE1PM70FWR5cHivxrNcC7/rQgBNzJB4vE=; b=JYpAgaY6Js+XvfvDvKuzkYdk8y
 JOHLAmzr0rSClfN6OTfx54wTdbZUjAifrQGp6AJ64RZl5LICqG6PfV1RJzz31mgz3fyRC8Msl2ktV
 jMu4+06qnXKuNUd1n3JkG2s8CVX0B9QP8guzKVPxElxBzLEykJaUn/PqD4MqXY+uKtjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=11ux4kf1HOJE1PM70FWR5cHivxrNcC7/rQgBNzJB4vE=; b=UnqvFneu8CnhT/FK2LnwqyzJqi
 4P29n9DnSIX2qWgsuYFd//2gM/8d/UUNZJQtfMXE0mjTxwz1ihhvpnMJaKC1sPYWsIQdbfOCg11m9
 i3smm379/3BdJtsVfQwgJjJRD4KfNIUq6/GOSqfJerOrujqBJzCcO14j3WRSbtmtRN/o=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lRDsu-0006Vh-JI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 12:54:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 8DE8A1F44E69
To: Eric Biggers <ebiggers@kernel.org>
References: <20210328144356.12866-1-andrealmeid@collabora.com>
 <20210328144356.12866-2-andrealmeid@collabora.com>
 <YGKDfo1vZfFXwG/v@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <8ea3ba8e-2699-8786-5ca3-33ee3c70961b@collabora.com>
Date: Tue, 30 Mar 2021 09:54:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGKDfo1vZfFXwG/v@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lRDsu-0006Vh-JI
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

SGkgRXJpYywKCsOAcyAyMjo0OCBkZSAyOS8wMy8yMSwgRXJpYyBCaWdnZXJzIGVzY3JldmV1Ogo+
IE9uIFN1biwgTWFyIDI4LCAyMDIxIGF0IDExOjQzOjU0QU0gLTAzMDAsIEFuZHLDqSBBbG1laWRh
IHdyb3RlOgo+PiBGb3IgZGlyZWN0b3JpZXMgd2l0aCBuZWdhdGl2ZSBkZW50cmllcyB0aGF0IGFy
ZSBiZWNvbWluZyBjYXNlLWluc2Vuc2l0aXZlCj4+IGRpcnMsIHdlIG5lZWQgdG8gcmVtb3ZlIGFs
bCB0aG9zZSBuZWdhdGl2ZSBkZW50cmllcywgb3RoZXJ3aXNlIHRoZXkgd2lsbAo+PiBiZWNvbWUg
ZGFuZ2xpbmcgZGVudHJpZXMuIER1cmluZyB0aGUgY3JlYXRpb24gb2YgYSBuZXcgZmlsZSwgaWYg
YSBkX2hhc2gKPj4gY29sbGlzaW9uIGhhcHBlbnMgYW5kIHRoZSBuYW1lcyBtYXRjaCBpbiBhIGNh
c2UtaW5zZW5zaXRpdmUgd2F5LCB0aGUgbmFtZQo+PiBvZiB0aGUgZmlsZSB3aWxsIGJlIHRoZSBu
YW1lIGRlZmluZWQgYXQgdGhlIG5lZ2F0aXZlIGRlbnRyeSwgdGhhdCBtYXkgYmUKPj4gZGlmZmVy
ZW50IGZyb20gdGhlIHNwZWNpZmllZCBieSB0aGUgdXNlci4gVG8gcHJldmVudCB0aGlzIGZyb20K
Pj4gaGFwcGVuaW5nLCB3ZSBuZWVkIHRvIHJlbW92ZSBhbGwgZGVudHJpZXMgaW4gYSBkaXJlY3Rv
cnkuIEdpdmVuIHRoYXQgdGhlCj4+IGRpcmVjdG9yeSBtdXN0IGJlIGVtcHR5IGJlZm9yZSB3ZSBj
YWxsIHRoaXMgZnVuY3Rpb24gd2UgYXJlIHN1cmUgdGhhdAo+PiBhbGwgZGVudHJpZXMgdGhlcmUg
d2lsbCBiZSBuZWdhdGl2ZS4KPj4KPj4gQ3JlYXRlIGEgZnVuY3Rpb24gdG8gcmVtb3ZlIGFsbCBu
ZWdhdGl2ZSBkZW50cmllcyBmcm9tIGEgZGlyZWN0b3J5LCB0bwo+PiBiZSB1c2VkIGFzIGV4cGxh
aW5lZCBhYm92ZSBieSBmaWxlc3lzdGVtcyB0aGF0IHN1cHBvcnQgY2FzZS1pbnNlbnNpdGl2ZQo+
PiBsb29rdXBzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgQWxtZWlkYSA8YW5kcmVhbG1l
aWRAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICAgZnMvZGNhY2hlLmMgICAgICAgICAgICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvZGNhY2hlLmgg
fCAgMSArCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9mcy9kY2FjaGUuYyBiL2ZzL2RjYWNoZS5jCj4+IGluZGV4IDdkMjRmZjdlYjIwNi4u
ZmFmYjMwMTZkNmZkIDEwMDY0NAo+PiAtLS0gYS9mcy9kY2FjaGUuYwo+PiArKysgYi9mcy9kY2Fj
aGUuYwo+PiBAQCAtMTcyMyw2ICsxNzIzLDMzIEBAIHZvaWQgZF9pbnZhbGlkYXRlKHN0cnVjdCBk
ZW50cnkgKmRlbnRyeSkKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChkX2ludmFsaWRhdGUpOwo+
PiAgIAo+PiArLyoqCj4+ICsgKiBkX2NsZWFyX2Rpcl9uZWdfZGVudHJpZXMgLSBSZW1vdmUgbmVn
YXRpdmUgZGVudHJpZXMgaW4gYW4gaW5vZGUKPj4gKyAqIEBkaXI6IERpcmVjdG9yeSB0byBjbGVh
ciBuZWdhdGl2ZSBkZW50cmllcwo+PiArICoKPj4gKyAqIEZvciBkaXJlY3RvcmllcyB3aXRoIG5l
Z2F0aXZlIGRlbnRyaWVzIHRoYXQgYXJlIGJlY29taW5nIGNhc2UtaW5zZW5zaXRpdmUKPj4gKyAq
IGRpcnMsIHdlIG5lZWQgdG8gcmVtb3ZlIGFsbCB0aG9zZSBuZWdhdGl2ZSBkZW50cmllcywgb3Ro
ZXJ3aXNlIHRoZXkgd2lsbAo+PiArICogYmVjb21lIGRhbmdsaW5nIGRlbnRyaWVzLiBEdXJpbmcg
dGhlIGNyZWF0aW9uIG9mIGEgbmV3IGZpbGUsIGlmIGEgZF9oYXNoCj4+ICsgKiBjb2xsaXNpb24g
aGFwcGVucyBhbmQgdGhlIG5hbWVzIG1hdGNoIGluIGEgY2FzZS1pbnNlbnNpdGl2ZSwgdGhlIG5h
bWUgb2YKPj4gKyAqIHRoZSBmaWxlIHdpbGwgYmUgdGhlIG5hbWUgZGVmaW5lZCBhdCB0aGUgbmVn
YXRpdmUgZGVudHJ5LCB0aGF0IGNhbiBiZQo+PiArICogZGlmZmVyZW50IGZyb20gdGhlIHNwZWNp
ZmllZCBieSB0aGUgdXNlci4gVG8gcHJldmVudCB0aGlzIGZyb20gaGFwcGVuaW5nLCB3ZQo+PiAr
ICogbmVlZCB0byByZW1vdmUgYWxsIGRlbnRyaWVzIGluIGEgZGlyZWN0b3J5LiBHaXZlbiB0aGF0
IHRoZSBkaXJlY3RvcnkgbXVzdCBiZQo+PiArICogZW1wdHkgYmVmb3JlIHdlIGNhbGwgdGhpcyBm
dW5jdGlvbiB3ZSBhcmUgc3VyZSB0aGF0IGFsbCBkZW50cmllcyB0aGVyZSB3aWxsCj4+ICsgKiBi
ZSBuZWdhdGl2ZS4KPj4gKyAqLwo+PiArdm9pZCBkX2NsZWFyX2Rpcl9uZWdfZGVudHJpZXMoc3Ry
dWN0IGlub2RlICpkaXIpCj4+ICt7Cj4+ICsJc3RydWN0IGRlbnRyeSAqYWxpYXMsICpkZW50cnk7
Cj4+ICsKPj4gKwlobGlzdF9mb3JfZWFjaF9lbnRyeShhbGlhcywgJmRpci0+aV9kZW50cnksIGRf
dS5kX2FsaWFzKSB7Cj4+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnkoZGVudHJ5LCAmYWxpYXMtPmRf
c3ViZGlycywgZF9jaGlsZCkgewo+PiArCQkJZF9kcm9wKGRlbnRyeSk7Cj4+ICsJCQlkcHV0KGRl
bnRyeSk7Cj4+ICsJCX0KPj4gKwl9Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MKGRfY2xlYXJfZGly
X25lZ19kZW50cmllcyk7Cj4gCj4gQXMgQWwgYWxyZWFkeSBwb2ludGVkIG91dCwgdGhpcyBkb2Vz
bid0IHdvcmsgYXMgaW50ZW5kZWQsIGZvciBhIG51bWJlciBvZgo+IGRpZmZlcmVudCByZWFzb25z
Lgo+IAo+IERpZCB5b3UgY29uc2lkZXIganVzdCB1c2luZyBzaHJpbmtfZGNhY2hlX3BhcmVudCgp
PyAgVGhhdCBhbHJlYWR5IGRvZXMgd2hhdCB5b3UKPiBhcmUgdHJ5aW5nIHRvIGRvIGhlcmUsIEkg
dGhpbmsuCgpXaGVuIEkgd3JvdGUgdGhpcyBwYXRjaCwgSSBkaWRuJ3Qga25vdyBpdCwgYnV0IGFm
dGVyIEFsIFZpcm8gY29tbWVudHMgSSAKZ2V0IGJhY2sgdG8gdGhlIGNvZGUgYW5kIGZvdW5kIGl0
LCBhbmQgaXQgc2VlbXMgZG8gZG8gd2hhdCBJIGludGVuZCAKaW5kZWVkLCBhbmQgbXkgdGVzdCBp
cyBoYXBweSBhcyB3ZWxsLgoKPiAKPiBUaGUgaGFyZGVyIHBhcnQgKHdoaWNoIEkgZG9uJ3QgdGhp
bmsgeW91J3ZlIGNvbnNpZGVyZWQpIGlzIGhvdyB0byBlbnN1cmUgdGhhdAo+IGFsbCBuZWdhdGl2
ZSBkZW50cmllcyByZWFsbHkgZ2V0IGludmFsaWRhdGVkIGV2ZW4gaWYgdGhlcmUgYXJlIGxvb2t1
cHMgb2YgdGhlbQo+IGhhcHBlbmluZyBjb25jdXJyZW50bHkuICBDb25jdXJyZW50IGxvb2t1cHMg
Y2FuIHRha2UgdGVtcG9yYXJ5IHJlZmVyZW5jZXMgdG8gdGhlCj4gbmVnYXRpdmUgZGVudHJpZXMs
IHByZXZlbnRpbmcgdGhlbSBmcm9tIGJlaW5nIGludmFsaWRhdGVkLgo+IAoKSSBkaWRuJ3QgY29u
c2lkZXIgdGhhdCwgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIFNvIHRoaXMgbWVhbnMgdGhhdCAK
dGhvc2UgbG9va3VwcyB3aWxsIGluY3JlYXNlIHRoZSByZWZjb3VudCBvZiB0aGUgZGVudHJ5LCBh
bmQgaXQgd2lsbCBvbmx5IApnZXQgcmVhbGx5IGludmFsaWRhdGVkIHdoZW4gcmVmY291bnQgcmVh
Y2hlcyAwPyBPciBkbyB3b3VsZCBJIG5lZWQgdG8gCmNhbGwgZF9pbnZhbGlkYXRlKCkgYWdhaW4s
IHVudGlsIEkgc3VjY2VlZD8KCj4gLSBFcmljCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
