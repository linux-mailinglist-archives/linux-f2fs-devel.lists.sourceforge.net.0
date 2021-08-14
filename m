Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 932383EBF7F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 04:00:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEixm-0001P3-Mc; Sat, 14 Aug 2021 01:59:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mEixk-0001Oq-LB
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 01:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G92ySKbHSttJG28GxBMTuTWHbiwD902XWIByWw8Tdx8=; b=F+jyMrwaqinhlYRPJeT+qsSB5Q
 S99r+ThFJ0LVgcuN+P7/qtBaHST7+jxkh6I/sNUe2/0mPPdaRsaoZ8Kdncmh7Aeh/TdBYYVMNV3oM
 2N/IG/LM18Ud9Dl+YkkB2ENaCB7XItnIrJkuT6DphO65TD5OfE4Qba682XzMzUV9TzY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G92ySKbHSttJG28GxBMTuTWHbiwD902XWIByWw8Tdx8=; b=Y34czaM/QXiA+NU0d4Dqxhnq3V
 RcpNbavZa/4rO1ipSqS38iicPKd6QFW6YwwxieNQjVKKYqP4PIw8pfPV2lRGFJEUgjSDTvJv0VIQF
 udTWG8+Tq2J5/214orKTFmfuBQAaPP73iMAn/+DezQCRXK/VXaCBXEsr3uRBUhR6entU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEixZ-005fIu-D4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 01:59:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 047AF6103A;
 Sat, 14 Aug 2021 01:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628906367;
 bh=uH60sluU04NxgCXY9p0lCQ9nqdOl1r0r3BwNc1FCRbs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QSpGivX48oH4E7RdkGy3ohWeDHBfigThPz9AiMnZRXcgJjDGkbhAcNfp4079/C/bq
 h/f3yzNT3UMm+SMZnmS/QTW9eoIdwR0fzS7UXr5s7pHVp/JsXSQE97+9jptgTwIv1W
 w9HGCpbkYtvAa449kpmaA5UtyMQMG5EQ78SNkMs0az9OokcFVrS+C+nUzvdQ3uG6nb
 SUl/zqvCH28cnT7txTCEKdBIVbisAZRQauDUEkTyeGpkNITiOB5UtVkaYjvZngTzSL
 UI7845IQA/B5u6FCOVTqf5Yzg1DThcmIg5888sIwDmy/dbyP5HPCYsowXLZkDcpGKE
 D5NrZUBe+QvYA==
To: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
References: <ALgAlACUD67cbvnqcwuTRaqA.3.1628879583910.Hmail.frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <25e44e70-eca6-5e48-fca1-844f76ea3a06@kernel.org>
Date: Sat, 14 Aug 2021 09:59:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ALgAlACUD67cbvnqcwuTRaqA.3.1628879583910.Hmail.frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEixZ-005fIu-D4
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: introduce
 proc/fs/f2fs/<dev>/fsck_stack node
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzE0IDI6MzMsIOadjuaJrOmfrCB3cm90ZToKPiBGcm9tOiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4gRGF0ZTogMjAyMS0wOC0xMyAyMjo0NDo0OQo+IFRvOiAgWWFuZ3RhbyBM
aSA8ZnJhbmsubGlAdml2by5jb20+LGphZWdldWtAa2VybmVsLm9yZwo+IENjOiAgbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS8yXSBmMmZzOiBpbnRyb2R1Y2UgcHJvYy9mcy9m
MmZzLzxkZXY+L2ZzY2tfc3RhY2sgbm9kZT5PbiAyMDIxLzgvMTMgMjA6MzIsIFlhbmd0YW8gTGkg
d3JvdGU6Cj4+PiBTQklfTkVFRF9GU0NLIGlzIGFuIGluZGljYXRvciB0aGF0IGZzY2suZjJmcyBu
ZWVkcyB0byBiZSB0cmlnZ2VyZWQsCj4+PiB0aGlzIGZsYWcgaXMgc2V0IGluIHRvbyBtYW55IHBs
YWNlcy4gRm9yIHNvbWUgc2NlbmVzIHRoYXQgYXJlIG5vdCB2ZXJ5Cj4+PiByZXByb2R1Y2libGUs
IGFkZGluZyBzdGFjayBpbmZvcm1hdGlvbiB3aWxsIGhlbHAgbG9jYXRlIHRoZSBwcm9ibGVtLgo+
Pj4KPj4+IExldCdzIGV4cG9zZSBhbGwgZnNjayBzdGFjayBoaXN0b3J5IGluIHByb2Nmcy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KPj4+IC0t
LQo+Pj4gdjU6Cj4+PiAtZml4IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdzdGFj
a190cmFjZV9zYXZlJwo+Pj4gICAgZnMvZjJmcy9mMmZzLmggIHwgMzQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQo+Pj4gICAgZnMvZjJmcy9zeXNmcy5jIHwgMjYgKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2Zz
L2YyZnMvZjJmcy5oCj4+PiBpbmRleCA2N2ZhYTQzY2MxNDEuLmNiZDA2ZGVhM2M2YSAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAg
LTI0LDYgKzI0LDggQEAKPj4+ICAgICNpbmNsdWRlIDxsaW51eC9xdW90YW9wcy5oPgo+Pj4gICAg
I2luY2x1ZGUgPGxpbnV4L3BhcnRfc3RhdC5oPgo+Pj4gICAgI2luY2x1ZGUgPGNyeXB0by9oYXNo
Lmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3N0YWNrZGVwb3QuaD4KPj4+ICsjaW5jbHVkZSA8bGlu
dXgvc3RhY2t0cmFjZS5oPgo+Pj4gICAgCj4+PiAgICAjaW5jbHVkZSA8bGludXgvZnNjcnlwdC5o
Pgo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2ZzdmVyaXR5Lmg+Cj4+PiBAQCAtMTE5LDYgKzEyMSw4
IEBAIHR5cGVkZWYgdTMyIG5pZF90Owo+Pj4gICAgCj4+PiAgICAjZGVmaW5lIENPTVBSRVNTX0VY
VF9OVU0JCTE2Cj4+PiAgICAKPj4+ICsjZGVmaW5lIEZTQ0tfU1RBQ0tfREVQVEggNjQKPj4+ICsK
Pj4+ICAgIHN0cnVjdCBmMmZzX21vdW50X2luZm8gewo+Pj4gICAgCXVuc2lnbmVkIGludCBvcHQ7
Cj4+PiAgICAJaW50IHdyaXRlX2lvX3NpemVfYml0czsJCS8qIFdyaXRlIElPIHNpemUgYml0cyAq
Lwo+Pj4gQEAgLTE3ODYsNiArMTc5MCw4IEBAIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+Pj4gICAg
CXVuc2lnbmVkIGludCBjb21wcmVzc193YXRlcm1hcms7CS8qIGNhY2hlIHBhZ2Ugd2F0ZXJtYXJr
ICovCj4+PiAgICAJYXRvbWljX3QgY29tcHJlc3NfcGFnZV9oaXQ7CQkvKiBjYWNoZSBoaXQgY291
bnQgKi8KPj4+ICAgICNlbmRpZgo+Pj4gKwlkZXBvdF9zdGFja19oYW5kbGVfdCAqZnNja19zdGFj
azsKPj4+ICsJdW5zaWduZWQgaW50IGZzY2tfY291bnQ7Cj4+PiAgICB9Owo+Pj4gICAgCj4+PiAg
ICBzdHJ1Y3QgZjJmc19wcml2YXRlX2RpbyB7Cj4+PiBAQCAtMTk5Nyw5ICsyMDAzLDM1IEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBpc19zYmlfZmxhZ19zZXQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCB1bnNpZ25lZCBpbnQgdHlwZSkKPj4+ICAgIAlyZXR1cm4gdGVzdF9iaXQodHlwZSwgJnNiaS0+
c19mbGFnKTsKPj4+ICAgIH0KPj4+ICAgIAo+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfc2Jp
X2ZsYWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgdHlwZSkKPj4+ICtz
dGF0aWMgdm9pZCBzZXRfc2JpX2ZsYWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25l
ZCBpbnQgdHlwZSkKPj4+ICAgIHsKPj4+ICAgIAlzZXRfYml0KHR5cGUsICZzYmktPnNfZmxhZyk7
Cj4+PiArCj4+PiArCWlmICh1bmxpa2VseSh0eXBlID09ICBTQklfTkVFRF9GU0NLKSkgewo+Pgo+
PiBIbW0uLi4gSSBkb24ndCBrbm93IHdoYXQgdG8gc2F5Li4uCj4gCj4gU29ycnksIG1heWJlIHRo
ZXJlIGlzIGEgcHJvYmxlbSB3aXRoIG15IHZpbSBjb25maWd1cmF0aW9uLgo+IFRoZSBzdHJhbmdl
IHRoaW5nIGlzIHRoYXQgY2hlY2twYXRjaC5wbCBkaWRuJ3QgY2hlY2sgaXQgb3V0Lgo+IAo+Pgo+
Pj4gKwkJdW5zaWduZWQgbG9uZyBlbnRyaWVzW0ZTQ0tfU1RBQ0tfREVQVEhdOwo+Pj4gKwkJZGVw
b3Rfc3RhY2tfaGFuZGxlX3Qgc3RhY2ssICpuZXc7Cj4+PiArCQl1bnNpZ25lZCBpbnQgbnJfZW50
cmllczsKPj4+ICsJCWludCBpOwo+Pj4gKwo+Pj4gKwkJbnJfZW50cmllcyA9IHN0YWNrX3RyYWNl
X3NhdmUoZW50cmllcywgQVJSQVlfU0laRShlbnRyaWVzKSwgMCk7Cj4+PiArCQlucl9lbnRyaWVz
ID0gZmlsdGVyX2lycV9zdGFja3MoZW50cmllcywgbnJfZW50cmllcyk7Cj4+PiArCQlzdGFjayA9
IHN0YWNrX2RlcG90X3NhdmUoZW50cmllcywgbnJfZW50cmllcywgR0ZQX0tFUk5FTCk7Cj4+PiAr
CQlpZiAoIXN0YWNrKQo+Pj4gKwkJCXJldHVybjsKPj4+ICsKPj4+ICsJCS8qIFRyeSB0byBmaW5k
IGFuIGV4aXN0aW5nIGVudHJ5IGZvciB0aGlzIGJhY2t0cmFjZSAqLwo+Pj4gKwkJZm9yIChpID0g
MDsgaSA8IHNiaS0+ZnNja19jb3VudDsgaSsrKQo+Pj4gKwkJCWlmIChzYmktPmZzY2tfc3RhY2tb
aV0gPT0gc3RhY2spCj4+Cj4+IHN0YWNrIG5lZWQgdG8gYmUgcmVsZWFzZWQgaGVyZT8KPiAKPiBX
ZSBjYW4ndCByZW1vdmUgc3RhY2sgZnJvbSBkZXBvdCwgYXMgd2Ugc3RvcmUgdGhlbSBjb250aWd1
b3VzbHkgb25lIGFmdGVyCj4gYW5vdGhlciBpbiBhIGNvbnRpZ3VvdXMgbWVtb3J5IGFsbG9jYXRp
b24uCj4gCj4gT3Igd2UgY2FuIGxpbWl0IHRoZSByZWNvcmRlZCBzdGFjayBudW1iZXIuCj4gCj4g
JCBncmVwIC1uciAiU0JJX05FRURfRlNDSyIgZnMvZjJmcy8gLS1pbmNsdWRlPSouYyAtLWluY2x1
ZGU9Ki5oIHwgd2MgLWwKPiA1Mwo+ICQgZ3JlcCAtbnIgImYyZnNfYnVnX29uIiBmcy9mMmZzLyAt
LWluY2x1ZGU9Ki5jIC0taW5jbHVkZT0qLmggfCB3YyAtbAo+IDEzNQoKSSBkaWRuJ3QgbG9vayBp
bnRvIGRldGFpbHMgb2Ygc3RhY2tfZGVwb3Rfc2F2ZSgpLCB0d28gc3RhY2sgaGFuZGxlcyBmcm9t
IGJlbG93CmNhbGwgcGF0aHMgd2lsbCBiZSB0aGUgc2FtZT8KCi0gbW92ZV9kYXRhX2Jsb2NrCiAg
LSBmMmZzX3dhaXRfb25fcGFnZV93cml0ZWJhY2sKICAgLSBmMmZzX2J1Z19vbgoKLSByYV9kYXRh
X2Jsb2NrCiAgLSBmMmZzX3dhaXRfb25fcGFnZV93cml0ZWJhY2sKICAgLSBmMmZzX2J1Z19vbgoK
SWYgdGhleSBoYXZlIGRpZmZlcmVudCBzdGFjayBoYW5kbGVzLCBjb21iaW5hdGlvbiBudW1iZXIg
b2YKc2V0X3NiaV9mbGFnKE5FRURfRlNDSykvZjJmc19idWdfb24gYW5kIHRoZWlyIGNhbGxlcnMg
d2lsbCBiZSBmYXIgbW9yZSB0aGFuIHR3bwpodW5kcmVkLgoKVGhhbmtzLAoKPiAKPiBTaW5jZSB3
ZSBvbmx5IGhhdmUgdHdvIGh1bmRyZWQgcG9zc2libGUgc2V0dGluZ3MgaGVyZSwgY29uc2lkZXJp
bmcgdGhhdAo+IHRoZSBzYW1lIHN0YWNrIHdpbGwgbm90IGJlIHJlY29yZGVkLCBhbmQgdGhlIHBy
b2JhYmlsaXR5IG9mIG9jY3VycmVuY2Ugd2lsbAo+IG5vdCBiZSBoaWdoLCBzbyBpdCBpcyBhY2Nl
cHRhYmxlIG5vdCB0byByZWxlYXNlPwo+IAo+IElmIHRoaXMgaXMgdGhlIGNhc2UsIHRoZSBzdWJz
ZXF1ZW50IGFsbG9jYXRpb24gZG9lcyBub3QgbmVlZCB0byBiZSByZWxlYXNlZC4KPiAKPiBUaHgs
Cj4gWWFuZ3Rhbwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
