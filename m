Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F689A972D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 05:39:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t35jx-0006TT-Ch;
	Tue, 22 Oct 2024 03:39:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t35jw-0006TN-FR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 03:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j7fTB/vjSRWh5ro/qmpUpfYdTk85sRIvtxXb1mU+ojU=; b=AOWUe5KmWgsK1IJKuflOzPvJUS
 oOnw9YA6CYpdlumEqd9uTeB8VGgo2S0FOewOBBbbZUJ6bmDhsjcmaWI42h3DquP9WprO4ub3sYNZS
 sYCAxquINvLLk4+C2oRlOmaSg/nQgSTJAAz+f9QTjwBjujUleqvtWmcyePVUKVEko7bA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j7fTB/vjSRWh5ro/qmpUpfYdTk85sRIvtxXb1mU+ojU=; b=kpJHO0oB834DnQSCJFN4Gie5gu
 WhUcxtbW/lv+Q5op+txnwlw1+62j7jTpHmNVAurXVObBfKtmvChKBLd9/uOQOpTtppHsPIoWL5lem
 kxdNoPD3X7I8hOLRnFTyCyFkmQFXVIlAZPHHGWpz6JgRsb/dZ4d4TWMzg72j5fcNx2E8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t35jv-0002Hp-Pf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 03:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE5DE5C5C0C;
 Tue, 22 Oct 2024 03:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E60C4CEC3;
 Tue, 22 Oct 2024 03:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729568358;
 bh=twcUz9QMvzx653qiRwcIDwO6wbHQwi/ZtZTaDK0o7Wk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YOuXkH+2610ZQJxUDwsiWwuSgAKYRREp1l1xzh1il6VSixDlOCX00zy8uWKlSSg94
 ym+oBv6kg+O8j7suxj3MJbU0BlABNVsrF66M2tjDRCBrpkZ6NlNYcCAE5uq9gZftUl
 WgT5ipM++RxShCjbNwi3LrtVdWVoqe24hvnx0SD7eROsXINinXU1F3ifguurKryZTe
 KWZg7w5ywS5Fyz29YFD/MTob6iCPqK8W5MyABcDm7zmZFuHFXVKDOs0jz+gOaCwDsF
 sSO/O5l5DZq8I4xn7Sir48bOA8AiTPAObE14f7X/g3YlR1xdUmA0d0lBdoVbfSt8Oa
 IIgeB23wDDe+w==
Message-ID: <febd8e72-acf6-4f33-9a49-4f09f4b5a25a@kernel.org>
Date: Tue, 22 Oct 2024 11:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?6Z+p5qOL?= <hanqi@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20241009102745.1390935-1-hanqi@vivo.com>
 <3fdd8fdd-8b80-4989-8cfd-78051bd85936@kernel.org>
 <7450a770-22cf-45e4-bc92-1812d1295eec@vivo.com>
Content-Language: en-US
In-Reply-To: <7450a770-22cf-45e4-bc92-1812d1295eec@vivo.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/10/22 11:14, 韩棋 wrote: > 在 2024/10/22 10:53,
    Chao Yu 写道: >> On 2024/10/9 18:27, Qi Han wrote: >>> When the free segment
    is used up during CP disable, many write or >>> ioctl operatio [...] 
 
 Content analysis details:   (-5.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t35jv-0002Hp-Pf
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMC8yMiAxMToxNCwg6Z+p5qOLIHdyb3RlOgo+IOWcqCAyMDI0LzEwLzIyIDEwOjUz
LCBDaGFvIFl1IOWGmemBkzoKPj4gT24gMjAyNC8xMC85IDE4OjI3LCBRaSBIYW4gd3JvdGU6Cj4+
PiBXaGVuIHRoZSBmcmVlIHNlZ21lbnQgaXMgdXNlZCB1cCBkdXJpbmcgQ1AgZGlzYWJsZSwgbWFu
eSB3cml0ZSBvcgo+Pj4gaW9jdGwgb3BlcmF0aW9ucyB3aWxsIGdldCBFTk9TUEMgZXJyb3IgY29k
ZXMsIGV2ZW4gaWYgdGhlcmUgYXJlCj4+PiBzdGlsbCBtYW55IGJsb2NrcyBhdmFpbGFibGUuIFdl
IGNhbiByZXByb2R1Y2UgaXQgaW4gdGhlIGZvbGxvd2luZwo+Pj4gc3RlcHM6Cj4+Pgo+Pj4gZGQg
aWY9L2Rldi96ZXJvIG9mPWYyZnMuaW1nIGJzPTFNIGNvdW50PTU1Cj4+PiBta2ZzLmYyZnMgLWYg
ZjJmcy5pbWcKPj4+IG1vdW50IGYyZnMuaW1nIGYyZnNfZGlyIC1vIGNoZWNrcG9pbnQ9ZGlzYWJs
ZToxMCUKPj4+IGNkIGYyZnNfZGlyCj4+PiBkZCBpZj0vZGV2L3plcm8gb2Y9YmlnZmlsZSBicz0x
TSBjb3VudD01MAo+Pj4gc3luYwo+Pj4gcm0gYmlnZmlsZQo+Pj4gaT0xOyB3aGlsZSBbWyAkaSAt
bHQgMTAwMDAwMDAgXV07IGRvIChmaWxlX25hbWU9Li9maWxlJGk7IGRkIFwKPj4+IGlmPS9kZXYv
cmFuZG9tIG9mPSRmaWxlX25hbWUgYnM9MU0gY291bnQ9MCk7IGk9JCgoaSsxKSk7IGRvbmUKPj4+
IHN0YXQgLWYgLi8KPj4+Cj4+PiBJbiBmMmZzX25lZWRfU1NSKCkgZnVuY3Rpb24sIGl0IGlzIGFs
bG93ZWQgdG8gdXNlIFNTUiB0byBhbGxvY2F0ZQo+Pj4gYmxvY2tzIHdoZW4gQ1AgaXMgZGlzYWJs
ZWQsIHNvIGluIGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeSBmdW5jdGlvbiwKPj4+IGNhbiB3ZSBq
dWRnZSB0aGUgbnVtYmVyIG9mIGludmFsaWQgYmxvY2tzIHdoZW4gZnJlZSBzZWdtZW50IGlzIG5v
dAo+Pj4gZW5vdWdoLCBhbmQgcmV0dXJuIEVOT1NQQyBvbmx5IGlmIHRoZSBudW1iZXIgb2YgaW52
YWxpZCBibG9ja3MgaXMKPj4+IGFsc28gbm90IGVub3VnaD8KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBRaSBIYW4gPGhhbnFpQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiAgwqAgZnMvZjJmcy9zZWdtZW50
LmggfCAyMSArKysrKysrKysrKysrKysrKysrKysKPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuaCBiL2Zz
L2YyZnMvc2VnbWVudC5oCj4+PiBpbmRleCA3MWFkYjRhNDNiZWMuLjliZjBjZjNhNmEzMSAxMDA2
NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oCj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQu
aAo+Pj4gQEAgLTYzNywxMiArNjM3LDMzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoYXNfZW5vdWdo
X2ZyZWVfc2VjcyhzdHJ1Y3QKPj4+IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gIMKgwqDCoMKgwqAg
cmV0dXJuICFoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3Moc2JpLCBmcmVlZCwgbmVlZGVkKTsKPj4+
ICDCoCB9Cj4+PiAgwqAgK3N0YXRpYyBpbmxpbmUgYm9vbCBoYXNfZW5vdWdoX2F2YWlsYWJsZV9i
bG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbwo+Pj4gKnNiaSkKPj4+ICt7Cj4+PiArwqDCoMKgIHVu
c2lnbmVkIGludCB0b3RhbF9mcmVlX2Jsb2NrcyA9IHNiaS0+dXNlcl9ibG9ja19jb3VudCAtCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsaWRfdXNlcl9ibG9j
a3Moc2JpKSAtCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2Jp
LT5jdXJyZW50X3Jlc2VydmVkX2Jsb2NrczsKPj4+ICsKPj4+ICvCoMKgwqAgaWYgKHRvdGFsX2Zy
ZWVfYmxvY2tzIDw9IHNiaS0+dW51c2FibGVfYmxvY2tfY291bnQpCj4+PiArwqDCoMKgwqDCoMKg
wqAgdG90YWxfZnJlZV9ibG9ja3MgPSAwOwo+Pj4gK8KgwqDCoCBlbHNlCj4+PiArwqDCoMKgwqDC
oMKgwqAgdG90YWxfZnJlZV9ibG9ja3MgLT0gc2JpLT51bnVzYWJsZV9ibG9ja19jb3VudDsKPj4+
ICsKPj4+ICvCoMKgwqAgaWYgKHRvdGFsX2ZyZWVfYmxvY2tzID4gRjJGU19PUFRJT04oc2JpKS5y
b290X3Jlc2VydmVkX2Jsb2NrcykKPj4+ICvCoMKgwqDCoMKgwqDCoCB0b3RhbF9mcmVlX2Jsb2Nr
cyAtPSBGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzOwo+Pj4gK8KgwqDCoCBl
bHNlCj4+PiArwqDCoMKgwqDCoMKgwqAgdG90YWxfZnJlZV9ibG9ja3MgPSAwOwo+Pj4gKwo+Pj4g
K8KgwqDCoCByZXR1cm4gKHRvdGFsX2ZyZWVfYmxvY2tzID4gMCkgPyB0cnVlIDogZmFsc2U7Cj4+
Cj4+IENhbiB5b3UgcGxlYXNlIHJldXNlIGdldF9hdmFpbGFibGVfYmxvY2tfY291bnQoKSBhcyBt
dWNoIGFzIHBvc3NpYmxlPwo+PiBhbmQgY292ZXIgaXQgdy8gc3RhdF9sb2NrPwo+Pgo+PiBUaGFu
a3MsCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgd2lsbCBzZW5kIHRoZSB2
MiB2ZXJzaW9uIHBhdGNoIGxhdGVyLgoKQlRXLCBpdCBsb29rcyB5b3VyIHRlc3RjYXNlIHdvbid0
IGNyZWF0ZSBzcGFyc2UgYXZhaWxhYmxlIHNwYWNlIGluCnNlZ21lbnQgZm9yIGZvbGxvd2luZyBy
ZXVzZSBieSBTU1IsIGNhbiB5b3UgcGxlYXNlIHVwZGF0ZSB5b3VyCnRlc3RjYXNlPwoKVGhhbmtz
LAoKPiAKPj4KPj4+ICt9Cj4+PiArCj4+PiAgwqAgc3RhdGljIGlubGluZSBib29sIGYyZnNfaXNf
Y2hlY2twb2ludF9yZWFkeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+PiAgwqAgewo+Pj4g
IMKgwqDCoMKgwqAgaWYgKGxpa2VseSghaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FC
TEVEKSkpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4gIMKgwqDCoMKg
wqAgaWYgKGxpa2VseShoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSkKPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+PiArwqDCoMKgIGlmIChsaWtlbHkoaGFzX2Vu
b3VnaF9hdmFpbGFibGVfYmxvY2tzKHNiaSkpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiB0
cnVlOwo+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4gIMKgIH0KPj4KPj4KPiAKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
