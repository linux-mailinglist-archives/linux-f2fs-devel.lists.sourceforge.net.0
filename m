Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F7B159BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 09:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMy/beIqjXzKKciQbQuKs0W/q9GCUpH8cwQRIzVfbhc=; b=K4NsNk7ER9h1qAX5ttMI7wjQIO
	oBpGqYFNb4AsIgnQ60np/SFtQNFRZCXCVXw7XlRI3SEGVy6bdqHy9NAsUDJ3HdWDjhYgbz5eKwTuB
	J3sAGDbNVwrUCfsriLOMCO+8440R6jNRDLKFK7pDsKD9kK82fh/SyAJSb1CUwPuRHQA8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uh1Q0-0007Pp-Rk;
	Wed, 30 Jul 2025 07:40:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uh1Pk-0007Oq-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 07:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OP7HVKpuwrbA9b+pZnCLeFsmOXv2Q2epIIvt+p6RZiI=; b=XQ4OHsvCNN0vkfleeCPZncrehJ
 4pKcoFdHUqieinzSX6/nf1JuraiCt5M4gZFIAawyYjGN/IhJXXBC/MA/EzSbKQzO82wpKrgWmfKsk
 Mi+dZepMeaShjjGZgXsr5XE08Kjo8L3eaS38cFLaRqD0b88Th8vrFsyXQsZG6x9L6q3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OP7HVKpuwrbA9b+pZnCLeFsmOXv2Q2epIIvt+p6RZiI=; b=bBnA47+JbVZvgygtCWRaCn9xu1
 d0nVc2EWiDe5CBRw08f3Qe93NeH1xwktTAtq2i7QRabTlvhDZL62K2AtEPgfnWP3HhvnTLwa4sS0E
 F+XYwPNX8pm62TTAeIQlZM5gbeWgf/WGhTWDnTOW0p0xD7VH2s60vocbM5mPeiS7Fo60=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uh1Pj-0000dI-Qi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 07:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 792AE46148;
 Wed, 30 Jul 2025 07:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E479CC4CEE7;
 Wed, 30 Jul 2025 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753861181;
 bh=X1H3hXqlaWnLdPy+eCeGsGly+LveFNvnklIQ86AB+L8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I3A0BGCT4vsXH+ff6hvd6LhE9ZdL5FXlPXWsHDh1JSLwvOYsJy8gLsKUN7WdUkBUW
 rbXuCk38RuA1xYlxi3af81BJ8d0LvSGBWvmbjHU1nJXRnBWFDD1ZirXDOlyC6WoB0x
 Rs4jy8HOaYU7FxJl3zmhjr9OjUFdv5w31G/37taQ493GJQfr+jEd4xqH2dNwXBAH3p
 lS5SXUqir1S5RXEGPPgSSGT4miFay7mBWE/DIgaGwHNngmqdPjoTTirZhAkO9wNj5m
 QlQkJ+DFLI/XQ8UUbKB1+1iIQKkvpIDYy/U1JpznTPHsEdNW/DLq2vz4QIw/OCR1hz
 KNg/gjQOJRhuA==
Message-ID: <ae41b064-f45b-4410-9854-f4c07ea1d0bf@kernel.org>
Date: Wed, 30 Jul 2025 15:39:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250721020231.2482090-1-chao@kernel.org>
 <CGME20250721020241epcas2p1481962181d9f81f127e122736923fe20@epcms2p6>
 <20250730015357epcms2p63d8a9d98265a526f959e33fa2d7c610b@epcms2p6>
Content-Language: en-US
In-Reply-To: <20250730015357epcms2p63d8a9d98265a526f959e33fa2d7c610b@epcms2p6>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daejun Thanks for the comments. On 7/30/25 09:53, Daejun
 Park wrote: > Hi Chao Yu, > >> + lfs_dio_write = (flag == F2FS_GET_BLOCK_DIO
 && f2fs_lfs_mode(sbi) && >> + map->m_may_create); >> + > > Consider moving
 the lfs_dio_write assig [...] 
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
X-Headers-End: 1uh1Pj-0000dI-Qi
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't break allocation when crossing
 contiguous sections
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgRGFlanVuCgpUaGFua3MgZm9yIHRoZSBjb21tZW50cy4KCk9uIDcvMzAvMjUgMDk6NTMsIERh
ZWp1biBQYXJrIHdyb3RlOgo+IEhpIENoYW8gWXUsCj4gCj4+ICsgwqAgwqAgwqAgwqBsZnNfZGlv
X3dyaXRlID0gKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmIGYyZnNfbGZzX21vZGUoc2Jp
KSAmJgo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
bWFwLT5tX21heV9jcmVhdGUpOwo+PiArCj4gCj4gQ29uc2lkZXIgbW92aW5nIHRoZSBsZnNfZGlv
X3dyaXRlIGFzc2lnbm1lbnQgdG8ganVzdCBhZnRlciB0aGUgaWYgKCFtYXAtPm1fbWF5X2NyZWF0
ZSDigKYpIGNoZWNrCj4gc28gaXQgaXNu4oCZdCBldmFsdWF0ZWQgd2hlbiBjcmVhdGlvbiBpc27i
gJl0IGFsbG93ZWQuCgpDb3JyZWN0LgoKSXQncyB0b28gbGF0ZSB0byBjbGVhbiB1cCB0aGUgY29k
ZSBhcyBpdCBpcyBuZWFyIHRvIHRoZSBtZXJnZSB3aW5kb3cuCgo+IAo+PiBAQCAtNDE3MSw2ICs0
MTcyLDEwIEBAIHN0YXRpYyBpbnQgZjJmc19pb21hcF9iZWdpbihzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBsb2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuZ3RoLAo+PiDCoCDCoCDCoCDCoCDCoG1hcC5tX25l
eHRfcGdvZnMgPSAmbmV4dF9wZ29mczsKPj4gwqAgwqAgwqAgwqAgwqBtYXAubV9zZWdfdHlwZSA9
IGYyZnNfcndfaGludF90b19zZWdfdHlwZShGMkZTX0lfU0IoaW5vZGUpLAo+PiDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlub2RlLT5pX3dyaXRlX2hpbnQpOwo+PiArIMKgIMKgIMKgIMKgaWYgKGZsYWdzICYg
SU9NQVBfV1JJVEUgJiYgaW9tYXAtPnByaXZhdGUpIHsKPiAKPiBTaW5jZSBpb21hcC0+cHJpdmF0
ZSBpcyBvbmx5IHNldCBvbiB0aGUgTEZTIERJTyBwYXRoLCB5b3UgY2FuIGRyb3AgdGhlIGZsYWdz
ICYgSU9NQVBfV1JJVEUgYW5kCj4gdGVzdCB0aGUgcG9pbnRlciBkaXJlY3RseS4KCldlbGwsIHRo
YXQncyByaWdodCwgYnV0IEkgc3RpbGwgd2FudCB0byBjaGVjayB0aGlzIGNvbmRpdGlvbiBleHBs
aWNpdGx5CnRvIGF2b2lkIGFueSBtaXNzaW5nIGNhc2Ugb3IgZnVydGhlciBtaXN1bmRlcnN0YW5k
aW5nIG9uIHRoZSBjb2RlLiA6KQoKVGhhbmtzLAoKPiAKPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1hcC5tX2xhc3RfcGJsayA9ICh1bnNpZ25lZCBsb25nKWlvbWFwLT5wcml2YXRlOwo+PiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW9tYXAtPnByaXZhdGUgPSBOVUxMOwo+PiArIMKgIMKg
IMKgIMKgfQo+Pgo+PiDCoCDCoCDCoCDCoCDCoC8qCj4+IMKgIMKgIMKgIMKgIMKgICogSWYgdGhl
IGJsb2NrcyBiZWluZyBvdmVyd3JpdHRlbiBhcmUgYWxyZWFkeSBhbGxvY2F0ZWQsCj4+IEBAIC00
MjA5LDYgKzQyMTQsOSBAQCBzdGF0aWMgaW50IGYyZnNfaW9tYXBfYmVnaW4oc3RydWN0IGlub2Rl
ICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbmd0aCwKPj4gwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpb21hcC0+ZmxhZ3MgPSBJT01BUF9GX01FUkdFRDsKPj4gwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpb21hcC0+YmRldiA9IG1hcC5tX2JkZXY7Cj4+IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaW9tYXAtPmFkZHIgPSBGMkZTX0JMS19UT19CWVRFUyhtYXAubV9wYmxrKTsK
Pj4gKwo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGZsYWdzICYgSU9NQVBfV1JJVEUg
JiYgbWFwLm1fbGFzdF9wYmxrKQo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW9tYXAtPnByaXZhdGUgPSAodm9pZCAqKW1hcC5tX2xhc3RfcGJsazsKPiAKPiBMaWtld2lz
ZSwgY2hlY2tpbmcgb25seSBtYXAubV9sYXN0X3BibGsgaXMgc3VmZmljaWVudCBmb3IgcmVzdG9y
aW5nLgo+IAo+IFJldmlld2VkLWJ5OiBEYWVqdW4gUGFyayA8ZGFlanVuNy5wYXJrQHNhbXN1bmcu
Y29tPgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
