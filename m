Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAAC36B2E3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Apr 2021 14:17:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lb0AZ-0006Kc-0Q; Mon, 26 Apr 2021 12:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lb0AX-0006KT-BC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 12:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LoLWGehswhUD0zv3EEg/63QqXTX4VGkeQ6kD9nwE4RM=; b=gt59LDF1ulwpsW6iKHyCMpon2p
 JLkrBhEr7MLtasWQGSW6oSJm0Eg32TEHVUXxXTI15qQW4j4sBgIYnxKMZsWojkqObTMHCFHfepN+y
 mxf0Eot6Gukv0/uDvKmhQbrsyn3pjIz48BU7xVgP7AplJ23m6ObHE3kOELNjTpx2P9Gs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LoLWGehswhUD0zv3EEg/63QqXTX4VGkeQ6kD9nwE4RM=; b=VfUMTIUABcfg4V2eAFjpg1j78/
 hMlrJ6DVQCAlpkYfq2t0YV38OlTDiIXqYgrxmRhjfLpphkE8D1KpAwKcyhG+473obNblEtrliLiMt
 P14WZZPoA0M2qoq/thOXWl7WqMlJ8BiIk2msYew2IPjY7eIkZuTJZyCU8RhDiV6G5vPE=;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lb0AM-0002D8-0f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 12:16:54 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id D022A5403DB;
 Mon, 26 Apr 2021 20:16:34 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Gao Xiang'" <hsiangkao@redhat.com>
References: <20210426021153.646-1-changfengnan@vivo.com>
 <20210426031902.GA3934275@xiangao.remote.csb>
 <004c01d73a78$12f23a30$38d6ae90$@vivo.com>
 <20210426090024.GB4042836@xiangao.remote.csb>
In-Reply-To: <20210426090024.GB4042836@xiangao.remote.csb>
Date: Mon, 26 Apr 2021 20:16:34 +0800
Message-ID: <004e01d73a95$ffff2b90$fffd82b0$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEDaFQ4pZvVc1HwAGtcmyMJeZE9VAD+gnKKAXzHkxgBfRiZ+axOkmFQ
Content-Language: zh-cn
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhhDH1ZMTB8dQxlLGkNMTklVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nkk6MBw*AT8cT1EVEzkuH0oh
 Qx1PFD5VSlVKTUpCT0hCSEJOSEpIVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBTUtJTDcG
X-HM-Tid: 0a790e1c20a3d995kuwsd022a5403db
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.40 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [59.111.176.40 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lb0AM-0002D8-0f
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiDnrZTlpI06ICBbUEFUQ0hdIGYyZnM6IGNv?=
	=?utf-8?q?mpress=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fco?=
	=?utf-8?q?mpress=5Foverwrite?=
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TWF5YmUgSSBzaG91bGQgaGF2ZSBiZWVuIGNsZWFyZXIuIFRoaXMgbW9kaWZpY2F0aW9uIGhhcyBu
b3RoaW5nIHRvIGRvIHdpdGggY2x1c3RlciBzaXplLCBhbmQgdGVzdCBpcyBvay4KRm9yIG5vdywg
ZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSB3aWxsIGNhbGN1bGF0ZSBudW1iZXIgb2Yg
dmFsaWQgYmxvY2tzIGluIGNvbXByZXNzZWQgY2x1c3RlciwgdGhlbiBkZWNpZGUgd2hldGhlciBu
ZWVkIHRvIHJlYWQgb3V0IHRoZSBvbGQgZGF0YSwgd2hlbiB3cml0ZSBwb3MgaXMgYmlnZ2VyIHRo
YW4gaW5vZGUgc2l6ZSwgaXQncyBvYnZpb3VzIHVubmVjZXNzYXJ5IHRvIGNhbGN1bGF0ZSwgYmVj
YXVzZSBpdCBhbHdheXMgcmV0dXJuIDAsIHNvIGNoZWNrIHBvcyBmaXJzdCB0byBhdm9pZCB0aGlz
IGNvbmRpdGlvbi4KU28gaW4gbXkgb3BpbmlvbiwgYXMgbG9uZyBhcyB0aGUgbm9kZSBzaXplIG1h
dGNoZXMgdGhlIHZhbGlkIGRhdGEgdGhlcmUgd2lsbCBiZSBubyBwcm9ibGVtLiAKSSBkb24ndCBx
dWl0ZSB1bmRlcnN0YW5kIHdoYXQgeW91IHNheSBwb3N0LUVPRiBiZWhhdmlvciBjaGFuZ2VzLCBi
dXQgSSBmb3VuZCBjb21wcmVzc2VkIGZpbGUgbm90IHN1cHBvcnQgRkFMTE9DX0ZMX1pFUk9fUkFO
R0UgZmxhZyBpbiBmYWxsb2NhdGUsIGlzIHRoaXMgb2sgPwoKLS0tLS3pgq7ku7bljp/ku7YtLS0t
LQrlj5Hku7bkuro6IEdhbyBYaWFuZyA8aHNpYW5na2FvQHJlZGhhdC5jb20+IArlj5HpgIHml7bp
l7Q6IDIwMjHlubQ05pyIMjbml6UgMTc6MDAK5pS25Lu25Lq6OiBjaGFuZ2ZlbmduYW5Adml2by5j
b20K5oqE6YCBOiBjaGFvQGtlcm5lbC5vcmc7IGphZWdldWtAa2VybmVsLm9yZzsgbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK5Li76aKYOiBSZTog562U5aSNOiBbZjJmcy1k
ZXZdIFtQQVRDSF0gZjJmczogY29tcHJlc3M6IGF2b2lkIHVubmVjZXNzYXJ5IGNoZWNrIGluIGYy
ZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUKCk9uIE1vbiwgQXByIDI2LCAyMDIxIGF0IDA0
OjQyOjIwUE0gKzA4MDAsIGNoYW5nZmVuZ25hbkB2aXZvLmNvbSB3cm90ZToKPiBUaGFuayB5b3Ug
Zm9yIHRoZSByZW1pbmRlciwgSSBoYWRuJ3QgdGhvdWdodCBhYm91dCBmYWxsb2NhdGUgYmVmb3Jl
Lgo+IEkgaGF2ZSBkb25lIHNvbWUgdGVzdHMgYW5kIHRoZSByZXN1bHRzIGFyZSBhcyBleHBlY3Rl
ZC4KPiBIZXJlIGlzIG15IHRlc3QgbWV0aG9kLCBjcmVhdGUgYSBjb21wcmVzc2VkIGZpbGUsIGFu
ZCB1c2UgZmFsbG9jYXRlIAo+IHdpdGgga2VlcCBzaXplLCB3aGVuIHdyaXRlIGRhdGEgdG8gZXhw
YW5kIGFyZWEsIGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUgYWx3YXlzIHJldHVybiAw
LCB0aGUgYmVoYXZpb3IgaXMgc2FtZSBhcyBteSBwYXRjaCAsIGFwcGx5IG15IHBhdGNoIGNhbiBh
dm9pZCB0aG9zZSBjaGVjay4KPiBJcyB0aGVyZSBhbnl0aGluZyBlbHNlIEkgaGF2ZW4ndCB0aG91
Z2h0IG9mPwoKTm9wZSwgSSBkaWRuJ3QgbG9vayBpbnRvIHRoZSBpbXBsZW1lbnRhdGlvbi4gSnVz
dCBhIHdpbGQgZ3Vlc3MuCgooSSBqdXN0IHdvbmRlcmVkIGlmIHRoZSBjbHVzdGVyIHNpemUgaXMg
c29tZXdoYXQgbGFyZ2UgKGUuZy4gNjRrKSwgIGJ1dCB3aXRoIGEgcGFydGlhbCBmYWxsb2NhdGUg
KGUuZy4gMTZrKSwgYW5kIGRvZXMgaXQgYmVoYXZlIG9rPwogb3Igc29tZSBvdGhlciBjb3JuZXIg
Y2FzZXMvY29uZGl0aW9ucyBhcmUgbmVlZGVkLikKCklmIHRoYXQgaXMgZmluZSwgSSBoYXZlIG5v
IHByb2JsZW0gYWJvdXQgdGhpcywgeWV0IGlfc2l6ZSBoZXJlIGlzIGdlbmVyYWxseSBzb21ld2hh
dCByaXNreSBzaW5jZSBhZnRlciBwb3N0LUVPRiBiZWhhdmlvciBjaGFuZ2VzIChlLmcuIHN1cHBv
cnRpbmcgRkFMTE9DX0ZMX1pFUk9fUkFOR0Ugd2l0aCBrZWVwIHNpemUgbGF0ZXIpLCBpdCBtYXkg
Y2F1c2Ugc29tZSBwb3RlbnRpYWwgcmVncmVzc2lvbi4KCj4gCj4gLS0tLS3pgq7ku7bljp/ku7Yt
LS0tLQo+IOWPkeS7tuS6ujogR2FvIFhpYW5nIDxoc2lhbmdrYW9AcmVkaGF0LmNvbT4KPiDlj5Hp
gIHml7bpl7Q6IDIwMjHlubQ05pyIMjbml6UgMTE6MTkKPiDmlLbku7bkuro6IEZlbmduYW4gQ2hh
bmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPiDmioTpgIE6IGNoYW9Aa2VybmVsLm9yZzsgamFl
Z2V1a0BrZXJuZWwub3JnOyAKPiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+IOS4u+mimDogUmU6IFtmMmZzLWRldl0gW1BBVENIXSBmMmZzOiBjb21wcmVzczogYXZvaWQg
dW5uZWNlc3NhcnkgY2hlY2sgaW4gCj4gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZQo+
IAo+IE9uIE1vbiwgQXByIDI2LCAyMDIxIGF0IDEwOjExOjUzQU0gKzA4MDAsIEZlbmduYW4gQ2hh
bmcgd3JvdGU6Cj4gPiB3aGVuIHdyaXRlIGNvbXByZXNzZWQgZmlsZSB3aXRoIE9fVFJVTkMsIHRo
ZXJlIHdpbGwgYmUgYSBsb3Qgb2YgCj4gPiB1bm5lY2Vzc2FyeSBjaGVjayB2YWxpZCBibG9ja3Mg
aW4gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSwgCj4gPiBlc3BlY2lhbGx5IHdoZW4g
d3JpdHRlbiBpbiBwYWdlIHNpemUsIHJlbW92ZSBpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBG
ZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4gCj4gRXZlbiB0aG91Z2ggSSBk
aWRuJ3QgbG9vayBpbnRvIHRoZSB3aG9sZSB0aGluZywgbXkgcmVhY3Rpb24gaGVyZSBpcyAKPiBy
b3VnaGx5IGhvdyB0byBoYW5kbGUgZmFsbG9jYXRlIHdpdGgga2VlcCBzaXplPyBEb2VzIGl0IHdv
cmsgYXMgZXhwZWN0ZWQ/Cj4gCj4gPiAtLS0KPiA+ICBmcy9mMmZzL2RhdGEuYyB8IDQgKysrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleCAKPiA+IGNmOTM1NDc0ZmZiYS4u
OWMzYjA4NDlmMzVlIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2Zz
L2YyZnMvZGF0YS5jCj4gPiBAQCAtMzI3MCw2ICszMjcwLDcgQEAgc3RhdGljIGludCBmMmZzX3dy
aXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLCAKPiA+IHN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nLAo+ID4gIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUp
Owo+ID4gIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7Cj4gPiAgCXBnb2ZmX3QgaW5kZXggPSAo
KHVuc2lnbmVkIGxvbmcgbG9uZykgcG9zKSA+PiBQQUdFX1NISUZUOwo+ID4gKwlwZ29mZl90IGVu
ZCA9IChpX3NpemVfcmVhZChpbm9kZSkgKyBQQUdFX1NJWkUgLSAxKSA+PiBQQUdFX1NISUZUOwo+
ID4gIAlib29sIG5lZWRfYmFsYW5jZSA9IGZhbHNlLCBkcm9wX2F0b21pYyA9IGZhbHNlOwo+ID4g
IAlibG9ja190IGJsa2FkZHIgPSBOVUxMX0FERFI7Cj4gPiAgCWludCBlcnIgPSAwOwo+ID4gQEAg
LTMzMDYsNiArMzMwNyw5IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmls
ZSAqZmlsZSwgCj4gPiBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiA+Cj4gPiAgCQkq
ZnNkYXRhID0gTlVMTDsKPiA+Cj4gPiArCQlpZiAoaW5kZXggPj0gZW5kKQo+ID4gKwkJCWdvdG8g
cmVwZWF0Owo+ID4gKwo+ID4gIAkJcmV0ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0
ZShpbm9kZSwgcGFnZXAsCj4gPiAgCQkJCQkJCWluZGV4LCBmc2RhdGEpOwo+ID4gIAkJaWYgKHJl
dCA8IDApIHsKPiA+IC0tCj4gPiAyLjI5LjAKPiAKPiAKPiAKPiAKPiAKPiAKPiAKCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
