Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EF3E8803
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 04:29:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDdzu-0004Q7-Vu; Wed, 11 Aug 2021 02:29:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mDdzu-0004Q1-2i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kE+I1TaiMJQLoselXSJAfiV79cAKFGZjgQ9n+mswblk=; b=nWIdkaoxlooGaVTxNfJC1p774F
 BO44vSwZGoZmM+2cSX/vPFr7a+uiMK3wfsWlM+WpYsLLmwJUgy0gI0JZ9CNEhtvuv88R4k/LzOQXE
 3/utfSu/1062OdmPiJFOEI/wJ2HFX0jA901egIYMoulNfnDZika2XwUokLU2gbSOhdB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kE+I1TaiMJQLoselXSJAfiV79cAKFGZjgQ9n+mswblk=; b=BLH1YEf1g8rTi3tx6Qnuj1lie3
 6JwMnnG5CY8kEQqePzqgMdnunzxSmIBhB2yAqd5tw5hkHwC0i1acIjIzwvVLJ1IzzbLpvy0gwhDmV
 cP4COSQNJyLZcMsV8s1u7gfjIFvQ9lydYBL1Vhgytu7wyH1/YLLj2iZlSVq3OzuvJYAg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDdzq-002WS1-Hm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:29:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24C3560EBD;
 Wed, 11 Aug 2021 02:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628648961;
 bh=4IZdr8k+PNRjUQnEj6zj12v4Y16D7O92c605S9nXu3E=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Q96/MUZ+rrYfe48Vaa2Q76Q+g4v/+K7TvQrT60ynisI67xnIDGE3jAtJLXHRbp7cJ
 kuUb3m6K4vymGFegSNJpi32pyvsXTozd3dFUHIxFY4o0qh5CBOo3fb6cU9hlOAMiwz
 Md/FApvTkhXaaoVCZX4gtYd2UjaEkSi8jUSlXQj3hChMEzgV62ou94owtBIE+aAg8H
 OFTGcTaO21KYdQdk1OJAB7WFNvLL+1hqZX0J6yjzF6BT18grPaQ6TTKaNQxlOrlnUM
 leH/2y016ggl5U7LiudX5BjNRfDCZhd5p8oVXT38osMWPNl4LgwK5tKOWY9ZLo6bY5
 CHbqEZA6Z0dMQ==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210810033934.123709-1-changfengnan@vivo.com>
 <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
 <f7ec12e5-3bba-af4f-c6b6-3193b39d74dd@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <3fbf4652-3263-29cc-0a9f-9bdd157d0548@kernel.org>
Date: Wed, 11 Aug 2021 10:29:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f7ec12e5-3bba-af4f-c6b6-3193b39d74dd@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mDdzq-002WS1-Hm
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: avoid duplicate counting of
 valid blocks when read compressed file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzExIDEwOjE3LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjEv
OC8xMSAxMDowNywgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMS84LzEwIDExOjM5LCBGZW5nbmFu
IENoYW5nIHdyb3RlOgo+Pj4gU2luY2UgY2x1c3RlciBpcyBiYXNpYyB1bml0IG9mIGNvbXByZXNz
aW9uLCBvbmUgY2x1c3RlciBpcyBjb21wcmVzc2VkIG9yCj4+PiBub3QsIHNvIHdlIGNhbiBjYWxj
dWxhdGUgdmFsaWQgYmxvY2tzIG9ubHkgZm9yIGZpcnN0IHBhZ2UgaW4gY2x1c3RlciwKPj4+IHRo
ZSBvdGhlciBwYWdlcyBqdXN0IHNraXAuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBD
aGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiAgwqAgZnMvZjJmcy9jb21w
cmVzcy5jIHzCoCAxICsKPj4+ICDCoCBmcy9mMmZzL2RhdGEuY8KgwqDCoMKgIHwgMTkgKysrKysr
KysrKysrKystLS0tLQo+Pj4gIMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqAgfMKgIDEgKwo+Pj4g
IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5j
Cj4+PiBpbmRleCA3ZGJmZDY5NjViOTcuLjcxNzY4ZjE1NzUyYSAxMDA2NDQKPj4+IC0tLSBhL2Zz
L2YyZnMvY29tcHJlc3MuYwo+Pj4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+PiBAQCAtMTUy
LDYgKzE1Miw3IEBAIHZvaWQgZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eChzdHJ1Y3QgY29tcHJl
c3NfY3R4Cj4+PiAqY2MsIGJvb2wgcmV1c2UpCj4+PiAgwqDCoMKgwqDCoCBjYy0+cnBhZ2VzID0g
TlVMTDsKPj4+ICDCoMKgwqDCoMKgIGNjLT5ucl9ycGFnZXMgPSAwOwo+Pj4gIMKgwqDCoMKgwqAg
Y2MtPm5yX2NwYWdlcyA9IDA7Cj4+PiArwqDCoMKgIGNjLT5uY19jbHVzdGVyX2lkeCA9IE5VTExf
Q0xVU1RFUjsKPj4+ICDCoMKgwqDCoMKgIGlmICghcmV1c2UpCj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgIGNjLT5jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsKPj4+ICDCoCB9Cj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gaW5kZXggZGY1ZThkOGM2
NTRlLi5iYzVjMGQ5NGE2ZmEgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4gKysr
IGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBAIC0yMjk0LDYgKzIyOTQsNyBAQCBzdGF0aWMgaW50IGYy
ZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBpbm9kZQo+Pj4gKmlub2RlLAo+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoCAubG9nX2NsdXN0ZXJfc2l6ZSA9IEYyRlNfSShpbm9kZSktPmlfbG9nX2NsdXN0
ZXJfc2l6ZSwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgLmNsdXN0ZXJfc2l6ZSA9IEYyRlNfSShp
bm9kZSktPmlfY2x1c3Rlcl9zaXplLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAuY2x1c3Rlcl9p
ZHggPSBOVUxMX0NMVVNURVIsCj4+PiArwqDCoMKgwqDCoMKgwqAgLm5jX2NsdXN0ZXJfaWR4ID0g
TlVMTF9DTFVTVEVSLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAucnBhZ2VzID0gTlVMTCwKPj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqAgLmNwYWdlcyA9IE5VTEwsCj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgIC5ucl9ycGFnZXMgPSAwLAo+Pj4gQEAgLTIzMzEsMTIgKzIzMzIsMjAgQEAgc3RhdGljIGlu
dCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUKPj4+ICppbm9kZSwKPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0ID0gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZWxzZSBpZiAoIXJldCkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xVU1RFUikgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoY2MubmNfY2x1c3Rlcl9pZHggIT0gTlVMTF9DTFVTVEVSKQo+Pgo+
PiBPbmNlIGNjLm5jX2NsdXN0ZXJfaWR4IHdhcyBzZXQsIHRoaXMgY29uZGl0aW9uIHdpbGwgYWx3
YXlzIGZvcmNlIHRvIHJlYWRpbmcKPj4gc2luZ2xlIHBhZ2U/IGR1ZSB0byAiY2MubmNfY2x1c3Rl
cl9pZHggPSBOVUxMX0NMVVNURVI7IiB3aWxsIG5ldmVyIGJlCj4+IGNhbGxlZC4KPiBZZXMsIGNj
Lm5jX2NsdXN0ZXJfaWR4IG9ubHkgd2lsbCBiZSBzZXQgZm9yIG5vdCBmaXJzdCBwYWdlIG9mCj4g
bm9uLWNvbXByZXNzIGNsdXN0ZXIsIGFuZCBjYy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RF
Ujsgd2lsbCBiZQo+IGNhbGxlZCBmb3IgY29tcHJlc3NlZCBjbHVzdGVyLgoKSSBtZWFuIGNjLm5j
X2NsdXN0ZXJfaWR4ID0gTlVMTF9DTFVTVEVSIHdpbGwgbmV2ZXIgYmUgY2FsbGVkIG9uY2UKY2Mu
bmNfY2x1c3Rlcl9pZHggd2FzIHNldD8KClRoYW5rcywKCj4+Cj4+IFRoYW5rcywKPj4KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3Bh
Z2U7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfaXNfY29t
cHJlc3NlZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRleCk7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjYy5uY19jbHVzdGVyX2lkeCA9IHBhZ2UtPmluZGV4ID4+Cj4+
PiBjYy5sb2dfY2x1c3Rlcl9zaXplOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gcmVhZF9zaW5nbGVfcGFnZTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
Yy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2luaXRfY29t
cHJlc3NfY3R4KCZjYyk7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkK
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3Bh
Z2U7Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4g
aW5kZXggZTk3YjRkOGM1ZWZjLi5lOWI2ODkwYTNmMTkgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L2YyZnMuaAo+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+IEBAIC0xNDcxLDYgKzE0NzEsNyBA
QCBzdHJ1Y3QgY29tcHJlc3NfZGF0YSB7Cj4+PiAgwqAgc3RydWN0IGNvbXByZXNzX2N0eCB7Cj4+
PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2RlO8KgwqDCoMKgwqDCoMKgIC8qIGlub2Rl
IHRoZSBjb250ZXh0IGJlbG9uZyB0byAqLwo+Pj4gIMKgwqDCoMKgwqAgcGdvZmZfdCBjbHVzdGVy
X2lkeDvCoMKgwqDCoMKgwqDCoCAvKiBjbHVzdGVyIGluZGV4IG51bWJlciAqLwo+Pj4gK8KgwqDC
oCBwZ29mZl90IG5jX2NsdXN0ZXJfaWR4O8KgwqDCoMKgwqDCoMKgIC8qIGNsdXN0ZXIgaW5kZXgg
bnVtYmVyIGZvcgo+Pj4gbm9uLWNvbXByZXNzZWQgY2x1c3RlciB1c2UqLwo+Pj4gIMKgwqDCoMKg
wqAgdW5zaWduZWQgaW50IGNsdXN0ZXJfc2l6ZTvCoMKgwqAgLyogcGFnZSBjb3VudCBpbiBjbHVz
dGVyICovCj4+PiAgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbG9nX2NsdXN0ZXJfc2l6ZTvCoMKg
wqAgLyogbG9nIG9mIGNsdXN0ZXIgc2l6ZSAqLwo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IHBhZ2Ug
KipycGFnZXM7wqDCoMKgwqDCoMKgwqAgLyogcGFnZXMgc3RvcmUgcmF3IGRhdGEgaW4gY2x1c3Rl
ciAqLwo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
