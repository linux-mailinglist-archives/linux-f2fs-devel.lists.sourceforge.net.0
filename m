Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE72CCE34
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 06:04:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkgmb-0006cf-8V; Thu, 03 Dec 2020 05:03:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mirq-linux@rere.qmqm.pl>)
 id 1kkgmZ-0006cU-I6; Thu, 03 Dec 2020 05:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zWjVPDL+GyHzq8zCbOh9R2tK7RUBGxtuqX2e9hQyftM=; b=Aw97WrUmpe/WMpmXYOFCNAl0pB
 bKk2L81+CPdfmH02fYND9RgBwLn+ByVsysTs2+7fAOX1FERDVTTQO12omjRe2Tx1YamETertiQocw
 Qd751LJQP6ScexrDewNYz+KOl//Rd3nZho2IazsDF56llQ+0EZy7OhgNPY/T+52f66z8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zWjVPDL+GyHzq8zCbOh9R2tK7RUBGxtuqX2e9hQyftM=; b=E+EKB37SUtxFy2jTfx7RjPD77x
 PqIGbxQm9EaG00Mqm12aszLJA+VgbfGAYK3l2u7YZhqD+jSm0Jb4ZPmhJ1Fub1B+QufEQK5MSPPij
 65CYxtCfdjyxtYwwwuTVfsBC04JXo/WGxLntvSyQx2yH0eb8YK2rsZ6lv83Vo+WjOGOc=;
Received: from rere.qmqm.pl ([91.227.64.183])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkgmR-00H5rZ-N5; Thu, 03 Dec 2020 05:03:55 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CmkJD0zqWzKw;
 Thu,  3 Dec 2020 06:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1606971821; bh=f1Gb4SxxHN59H8iTXv8TYBBgv5t2nfeo2X3YmFgqJD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YaOmlBl+agVMGrEhHyHN43s0EAVir9GS1+Wbt79yyOdWZUIShpjbV5gdth7ujxMF2
 LSffLJcu0U4U70+5sYBJw8pBWz7CNfN5732TbuuRaN6H1/8fmqgUplaYHdTehFragR
 9i5S5laWX2M6JdZ+n5jWUsUUVMpbga9Ckv9R13QZHIghDsSwWPLyz/fh4P4jergT3z
 sAyk4ncmYVg6AboZAOF++YIMpeWs3PY553ogwZUWkjf5yd0bP6Ds3v6NqIEeC0rXzw
 UoUGFLvULO2bEDhEdW6B5nm46ACSZFeIFDP6sUC6I51iCs8rVdxxCFaFX6ek3vOvC6
 OSUKxG/KTv5XQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 3 Dec 2020 06:03:35 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <20201203050335.GA1532@qmqm.qmqm.pl>
References: <20201202203242.1187898-1-nickrterrell@gmail.com>
 <20201202203242.1187898-2-nickrterrell@gmail.com>
 <20201203011606.GA20621@qmqm.qmqm.pl>
 <297D9C8B-5F4D-4E3B-A5FD-DA292D8BA12A@fb.com>
 <20201203031429.GA13095@qmqm.qmqm.pl>
 <85E09AFA-F1ED-41CB-B712-7FA75374478F@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85E09AFA-F1ED-41CB-B712-7FA75374478F@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kkgmR-00H5rZ-N5
Subject: Re: [f2fs-dev] [PATCH v6 1/3] lib: zstd: Add kernel-specific API
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDM6NTk6MjFBTSArMDAwMCwgTmljayBUZXJyZWxsIHdy
b3RlOgo+IE9uIERlYyAyLCAyMDIwLCBhdCA3OjE0IFBNLCBNaWNoYcWCIE1pcm9zxYJhdyA8bWly
cS1saW51eEByZXJlLnFtcW0ucGw+IHdyb3RlOgo+ID4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQg
MDE6NDI6MDNBTSArMDAwMCwgTmljayBUZXJyZWxsIHdyb3RlOgo+ID4+IE9uIERlYyAyLCAyMDIw
LCBhdCA1OjE2IFBNLCBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+
IHdyb3RlOgo+ID4+PiBPbiBXZWQsIERlYyAwMiwgMjAyMCBhdCAxMjozMjo0MFBNIC0wODAwLCBO
aWNrIFRlcnJlbGwgd3JvdGU6Cj4gPj4+PiBGcm9tOiBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZi
LmNvbT4KPiA+Pj4+IAo+ID4+Pj4gVGhpcyBwYXRjaDoKPiA+Pj4+IC0gTW92ZXMgYGluY2x1ZGUv
bGludXgvenN0ZC5oYCAtPiBgbGliL3pzdGQvenN0ZC5oYAo+ID4+Pj4gLSBBZGRzIGEgbmV3IEFQ
SSBpbiBgaW5jbHVkZS9saW51eC96c3RkLmhgIHRoYXQgaXMgZnVuY3Rpb25hbGx5Cj4gPj4+PiBl
cXVpdmFsZW50IHRvIHRoZSBpbi11c2Ugc3Vic2V0IG9mIHRoZSBjdXJyZW50IEFQSS4gRnVuY3Rp
b25zIGFyZQo+ID4+Pj4gcmVuYW1lZCB0byBhdm9pZCBzeW1ib2wgY29sbGlzaW9ucyB3aXRoIHpz
dGQsIHRvIG1ha2UgaXQgY2xlYXIgaXQgaXMKPiA+Pj4+IG5vdCB0aGUgdXBzdHJlYW0genN0ZCBB
UEksIGFuZCB0byBmb2xsb3cgdGhlIGtlcm5lbCBzdHlsZSBndWlkZS4KPiA+Pj4+IC0gVXBkYXRl
cyBhbGwgY2FsbGVycyB0byB1c2UgdGhlIG5ldyBBUEkuCj4gPj4+PiAKPiA+Pj4+IFRoZXJlIGFy
ZSBubyBmdW5jdGlvbmFsIGNoYW5nZXMgaW4gdGhpcyBwYXRjaC4gU2luY2UgdGhlcmUgYXJlIG5v
Cj4gPj4+PiBmdW5jdGlvbmFsIGNoYW5nZSwgSSBmZWx0IGl0IHdhcyBva2F5IHRvIHVwZGF0ZSBh
bGwgdGhlIGNhbGxlcnMgaW4gYQo+ID4+Pj4gc2luZ2xlIHBhdGNoLCBzaW5jZSBvbmNlIHRoZSBB
UEkgaXMgYXBwcm92ZWQsIHRoZSBjYWxsZXJzIGFyZQo+ID4+Pj4gbWVjaGFuaWNhbGx5IGNoYW5n
ZWQuCj4gPj4+IFsuLi5dCj4gPj4+PiAtLS0gYS9saWIvZGVjb21wcmVzc191bnpzdGQuYwo+ID4+
Pj4gKysrIGIvbGliL2RlY29tcHJlc3NfdW56c3RkLmMKPiA+Pj4gWy4uLl0KPiA+Pj4+IHN0YXRp
YyBpbnQgSU5JVCBoYW5kbGVfenN0ZF9lcnJvcihzaXplX3QgcmV0LCB2b2lkICgqZXJyb3IpKGNo
YXIgKngpKQo+ID4+Pj4gewo+ID4+Pj4gLQljb25zdCBpbnQgZXJyID0gWlNURF9nZXRFcnJvckNv
ZGUocmV0KTsKPiA+Pj4+IC0KPiA+Pj4+IC0JaWYgKCFaU1REX2lzRXJyb3IocmV0KSkKPiA+Pj4+
ICsJaWYgKCF6c3RkX2lzX2Vycm9yKHJldCkpCj4gPj4+PiAJCXJldHVybiAwOwo+ID4+Pj4gCj4g
Pj4+PiAtCXN3aXRjaCAoZXJyKSB7Cj4gPj4+PiAtCWNhc2UgWlNURF9lcnJvcl9tZW1vcnlfYWxs
b2NhdGlvbjoKPiA+Pj4+IC0JCWVycm9yKCJaU1REIGRlY29tcHJlc3NvciByYW4gb3V0IG9mIG1l
bW9yeSIpOwo+ID4+Pj4gLQkJYnJlYWs7Cj4gPj4+PiAtCWNhc2UgWlNURF9lcnJvcl9wcmVmaXhf
dW5rbm93bjoKPiA+Pj4+IC0JCWVycm9yKCJJbnB1dCBpcyBub3QgaW4gdGhlIFpTVEQgZm9ybWF0
ICh3cm9uZyBtYWdpYyBieXRlcykiKTsKPiA+Pj4+IC0JCWJyZWFrOwo+ID4+Pj4gLQljYXNlIFpT
VERfZXJyb3JfZHN0U2l6ZV90b29TbWFsbDoKPiA+Pj4+IC0JY2FzZSBaU1REX2Vycm9yX2NvcnJ1
cHRpb25fZGV0ZWN0ZWQ6Cj4gPj4+PiAtCWNhc2UgWlNURF9lcnJvcl9jaGVja3N1bV93cm9uZzoK
PiA+Pj4+IC0JCWVycm9yKCJaU1RELWNvbXByZXNzZWQgZGF0YSBpcyBjb3JydXB0Iik7Cj4gPj4+
PiAtCQlicmVhazsKPiA+Pj4+IC0JZGVmYXVsdDoKPiA+Pj4+IC0JCWVycm9yKCJaU1RELWNvbXBy
ZXNzZWQgZGF0YSBpcyBwcm9iYWJseSBjb3JydXB0Iik7Cj4gPj4+PiAtCQlicmVhazsKPiA+Pj4+
IC0JfQo+ID4+Pj4gKwllcnJvcigiWlNURCBkZWNvbXByZXNzaW9uIGZhaWxlZCIpOwo+ID4+Pj4g
CXJldHVybiAtMTsKPiA+Pj4+IH0KPiA+Pj4gCj4gPj4+IFRoaXMgbG9vc2VzIGRpYWdub3N0aWNz
IHNwZWNpZmljaXR5IC0gaXMgdGhpcyBpbnRlbmRlZD8gQXQgbGVhc3QgdGhlCj4gPj4+IG91dC1v
Zi1tZW1vcnkgY29uZGl0aW9uIHNlZW1zIHVzZWZ1bCB0byBkaXN0aW5ndWlzaC4KPiA+PiAKPiA+
PiBHb29kIHBvaW50LiBUaGUgenN0ZCBBUEkgbm8gbG9uZ2VyIGV4cG9zZXMgdGhlIGVycm9yIGNv
ZGUgZW51bSwKPiA+PiBidXQgaXQgZG9lcyBleHBvc2UgenN0ZF9nZXRfZXJyb3JfbmFtZSgpIHdo
aWNoIGNhbiBiZSB1c2VkIGhlcmUuCj4gPj4gSSB3YXMgdGhpbmtpbmcgdGhhdCB0aGUgc3RyaW5n
IG5lZWRlZCB0byBiZSBzdGF0aWMgZm9yIHNvbWUgcmVhc29uLCBidXQKPiA+PiB0aGF0IGlzIG5v
dCB0aGUgY2FzZS4gSSB3aWxsIG1ha2UgdGhhdCBjaGFuZ2UuCj4gPj4gCj4gPj4+PiArc2l6ZV90
IHpzdGRfY29tcHJlc3Nfc3RyZWFtKHpzdGRfY3N0cmVhbSAqY3N0cmVhbSwKPiA+Pj4+ICsJc3Ry
dWN0IHpzdGRfb3V0X2J1ZmZlciAqb3V0cHV0LCBzdHJ1Y3QgenN0ZF9pbl9idWZmZXIgKmlucHV0
KQo+ID4+Pj4gK3sKPiA+Pj4+ICsJWlNURF9vdXRCdWZmZXIgbzsKPiA+Pj4+ICsJWlNURF9pbkJ1
ZmZlciBpOwo+ID4+Pj4gKwlzaXplX3QgcmV0Owo+ID4+Pj4gKwo+ID4+Pj4gKwltZW1jcHkoJm8s
IG91dHB1dCwgc2l6ZW9mKG8pKTsKPiA+Pj4+ICsJbWVtY3B5KCZpLCBpbnB1dCwgc2l6ZW9mKGkp
KTsKPiA+Pj4+ICsJcmV0ID0gWlNURF9jb21wcmVzc1N0cmVhbShjc3RyZWFtLCAmbywgJmkpOwo+
ID4+Pj4gKwltZW1jcHkob3V0cHV0LCAmbywgc2l6ZW9mKG8pKTsKPiA+Pj4+ICsJbWVtY3B5KGlu
cHV0LCAmaSwgc2l6ZW9mKGkpKTsKPiA+Pj4+ICsJcmV0dXJuIHJldDsKPiA+Pj4+ICt9Cj4gPj4+
IAo+ID4+PiBJcyBhbGwgdGhpcyBjb3B5aW5nIG5lY2Vzc2FyeT8gSG93IGlzIGl0IGRpZmZlcmVu
dCBmcm9tIHR5cGUtcHVubmluZyBieQo+ID4+PiBkaXJlY3QgcG9pbnRlciBjYXN0Pwo+ID4+IAo+
ID4+IElmIGJyZWFraW5nIHN0cmljdCBhbGlhc2luZyBhbmQgdHlwZS1wdW5uaW5nIGJ5IHBvaW50
ZXIgY2FzaW5nIGlzIG9rYXksIHRoZW4KPiA+PiB3ZSBjYW4gZG8gdGhhdCBoZXJlLiBUaGVzZSBt
ZW1jcHlzIHdpbGwgYmUgbmVnbGlnaWJsZSBmb3IgcGVyZm9ybWFuY2UsIGJ1dAo+ID4+IHR5cGUt
cHVubmluZyB3b3VsZCBiZSBtb3JlIHN1Y2NpbmN0IGlmIGFsbG93ZWQuCj4gPiAKPiA+IEFoLCB0
aGlzIG1pZ2h0IGJyZWFrIExUTyBidWlsZHMgZHVlIHRvIHN0cmljdCBhbGlhc2luZyB2aW9sYXRp
b24uCj4gPiBTbyBJIHdvdWxkIHN1Z2dlc3QgdG8ganVzdCAjZGVmaW5lIHRoZSBaU1REIG5hbWVz
IHRvIGtlcm5lbCBvbmVzCj4gPiBmb3IgdGhlIGxpYnJhcnkgY29kZS4gIFVubGVzcyB0aGVyZSBp
cyBhIGNsZWFuZXIgc29sdXRpb24uLi4KPiAKPiBJIGRvbuKAmXQgd2FudCB0byBkbyB0aGF0IGJl
Y2F1c2UgSSB3YW50IGluIHRoZSAzcmQgc2VyaWVzIG9mIHRoZSBwYXRjaHNldCBJIHVwZGF0ZQo+
IHRvIHpzdGQtMS40LjYuIEFuZCBJ4oCZbSB1c2luZyB6c3RkLTEuNC42IGFzLWlzIGluIHVwc3Ry
ZWFtLiBUaGlzIGFsbG93cyB1cyB0byBrZWVwCj4gdGhlIGtlcm5lbCB2ZXJzaW9uIHVwIHRvIGRh
dGUsIHNpbmNlIHRoZSBwYXRjaCB0byB1cGRhdGUgdG8gYSBuZXcgdmVyc2lvbiBjYW4gYmUKPiBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSAoYW5kIG1hbnVhbGx5IHRlc3RlZCksIHNvIGl0IGRvZXNu
4oCZdCBmYWxsIHllYXJzIGJlaGluZAo+IHVwc3RyZWFtIGFnYWluLgo+IAo+IFRoZSBhbHRlcm5h
dGl2ZSB3b3VsZCBiZSB0byBtYWtlIHVwc3RyZWFtIHpzdGTigJlzIGhlYWRlciBwdWJsaWMgYW5k
Cj4gI2RlZmluZSB6c3RkX2luX2J1ZmZlciBaU1REX2luQnVmZmVyLiBCdXQgdGhhdCB3b3VsZCBt
YWtlIHpzdGTigJlzIGhlYWRlcgo+IHB1YmxpYywgd2hpY2ggd291bGQgc29tZXdoYXQgZGVmZWF0
IHRoZSBwdXJwb3NlIG9mIGhhdmluZyBhIGtlcm5lbCB3cmFwcGVyLgoKSSB0aG91Z2h0IHRoZSBw
cm9ibGVtIHdhcyBBUEkgc3R5bGUgc3BpbGwtb3ZlciBmcm9tIHRoZSBsaWJyYXJ5IHRvIG90aGVy
IHBhcnRzCm9mIHRoZSBrZXJuZWwuICBBIGhlYWRlci1vbmx5IHdyYXBwZXIgY2FuIHN0b3AgdGhp
cy4gIEknbSBub3Qgc3VyZSBzeW1ib2wKdmlzaWJpbGl0eSAobmFtZXNwYWNlIHBvbGx1dGlvbikg
d2FzIGEgY29uY2Vybi4KCkJlc3QgUmVnYXJkcwpNaWNoYcWCIE1pcm9zxYJhdwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
