Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C210A21E3A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 01:34:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jv7y7-0001AW-MD; Mon, 13 Jul 2020 23:34:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jv7y7-0001AQ-7E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 23:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iPlwZLEf957rsHoErr6aojVCP3wiKliM72hie8kI42o=; b=iaht2tWc872TzIXeFpQCOZWf+U
 FP808SiHjxoU/PH+uRRw2WQaLVPTcVnMzlXpzkIv4QfMMeT5xuskMZ0BCXKFTfjE4ISTtXxFv7XiW
 0PLxjYZbJc+6KIaiNgea5fCWEXjmmYbVdbhqSFDPKv8BA8m6WlDVZN50+JEmlMOTiIgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iPlwZLEf957rsHoErr6aojVCP3wiKliM72hie8kI42o=; b=O7X2rVC54fGrYg/tBlQQc7IYQ3
 IiBzoKUQvYNAzREF9Qr6PEf2G0yKmFHjOosHQ0/v7bmRDSbHr+QA5skZSgpDdtMVIujDTgM/x+0Av
 3D9+Bw0KcHJDozF/opjhwgzUTXotY+Aoyvx73Xu8RPGBCGsbHbgH6fTNDUjGb3WFIggc=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jv7y3-0067em-BA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 23:34:43 +0000
Received: by mail-lj1-f195.google.com with SMTP id r19so20190710ljn.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jul 2020 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iPlwZLEf957rsHoErr6aojVCP3wiKliM72hie8kI42o=;
 b=oNOifc9X4sWNDauS/C1cyTPlb4XXtVA/IlPIL5DBGvUI8zsqO9kih58dutNwTGGCFu
 qpYPHW1jSfNVIocTrNz3sUyPUEqzA75EyLJNpsHnUGRcm73LyU0vhYMFiKuAb5p22FRT
 3oIyCIlASG92CIDyPhCoaAq+rkP+m706kONTW9Tael4sHbFyimyhbw+ptfe0FDJOi5j2
 jBLiIS/jsCMWTvMuo2jNHmM9LbZnwuF09+lHYyAnzNKZ1h7vg051svc7Wy78kA6fe4tF
 7GGIUnttld8+52xJfK4IJ8M2U+Sd6XaFtbp7OUWLE3KLTnWKDoPSv8LBLxrfUBBZkK5A
 4CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iPlwZLEf957rsHoErr6aojVCP3wiKliM72hie8kI42o=;
 b=MvfTrRXn1zDnCtxnQ8OzxsaPeJcb5pQSH9eiy4l99fLVqzRU02MGMWZR7PK2fVegQU
 tTailyTNhrRTkD1yuUoKbn9MWGv1V6vTW47Bww5vgmxiH8f2ItZGv/0iuFL66UVR3H1q
 rd9kIYxQcNeCwbObcGMKzm+Nj0sk/JaVut5OFV5Dtk1SqHw8rjCNSI5EM+JQC2WOh6Dn
 n7Zn2TvwiH7tRBZStLpxCWDaDBY4POUdtjwM3QzAmgicKD20JrxvVA+5TfeGLNojZDpR
 iqRduetpY5EIvxmyE5PMdkC6/OYj3Nuf9ZhVvhMYRiZtwr0GDu2AVXAeaAEOwbrNDOCN
 /3FQ==
X-Gm-Message-State: AOAM530rHuvRrY9beWVggKOriaGwJuU2PEpceYz5jSZ2FbmJtXimK9pX
 zi+ckYXsspH59TV6lCrsRD/0ZMFPddUOscXyzV4=
X-Google-Smtp-Source: ABdhPJwpaXJtycdwke2vzHT5yegJx5MA1ubzpxr7J8dvz7p0GZolC7Tp90ky1cfIZC1pdyAJbsbZvcVTpRdHFiKFS0w=
X-Received: by 2002:a2e:8954:: with SMTP id b20mr964793ljk.262.1594683272671; 
 Mon, 13 Jul 2020 16:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
In-Reply-To: <20200713181152.GC2910046@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 14 Jul 2020 08:34:21 +0900
Message-ID: <CACOAw_y2A6qLMCAt5UBNYvKp4AJrrYFm4_0ShC-Os3J5zzMg4Q@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jv7y3-0067em-BA
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SXQncyBjb3JyZWN0fiA6KQoKMjAyMOuFhCA37JuUIDE07J28ICjtmZQpIOyYpOyghCAzOjExLCBK
YWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBIaSBEYWVo
bywKPgo+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzLgo+Cj4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1ay9mMmZzLmdpdC9jb21taXQvP2g9
ZGV2JmlkPTM1MjQ1MTgwNDU5YWViZjZkNzBmZGU4OGE1MzhmMDQwMGE3OTRhYTYKPgo+IFRoYW5r
cywKPgo+IE9uIDA3LzEzLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZyb206IERhZWhvIEplb25n
IDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gQ2hhbmdlZCB0aGUgd2F5IG9mIGhhbmRs
aW5nIHJhbmdlLmxlbiBvZiBGMkZTX0lPQ19TRUNfVFJJTV9GSUxFLgo+ID4gIDEuIEFkZGVkIC0x
IHZhbHVlIHN1cHBvcnQgZm9yIHJhbmdlLmxlbiB0byBzZWN1cmUgdHJpbSB0aGUgd2hvbGUgYmxv
Y2tzCj4gPiAgICAgc3RhcnRpbmcgZnJvbSByYW5nZS5zdGFydCByZWdhcmRsZXNzIG9mIGlfc2l6
ZS4KPiA+ICAyLiBJZiB0aGUgZW5kIG9mIHRoZSByYW5nZSBwYXNzZXMgb3ZlciB0aGUgZW5kIG9m
IGZpbGUsIGl0IG1lYW5zIHVudGlsCj4gPiAgICAgdGhlIGVuZCBvZiBmaWxlIChpX3NpemUpLgo+
ID4gIDMuIGlnbm9yZWQgdGhlIGNhc2Ugb2YgdGhhdCByYW5nZS5sZW4gaXMgemVybyB0byBwcmV2
ZW50IHRoZSBmdW5jdGlvbgo+ID4gICAgIGZyb20gbWFraW5nIGVuZF9hZGRyIHplcm8gYW5kIHRy
aWdnZXJpbmcgZGlmZmVyZW50IGJlaGF2aW91ciBvZgo+ID4gICAgIHRoZSBmdW5jdGlvbi4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+
ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gIC0gQ2hhbmdlZCAtMSByYW5nZS5sZW4gb3B0
aW9uIHRvIG1lYW4gdGhlIHdob2xlIGJsb2NrcyBzdGFydGluZyBmcm9tCj4gPiAgICByYW5nZS5z
dGFydCByZWdhcmRsZXNzIG9mIGlfc2l6ZQo+ID4gLS0tCj4gPiAgZnMvZjJmcy9maWxlLmMgfCAy
MyArKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxl
LmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gaW5kZXggMzY4YzgwZjhlMmExLi4yNDg1ODQxZTNiMmQg
MTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gKysrIGIvZnMvZjJmcy9maWxlLmMK
PiA+IEBAIC0zNzkyLDcgKzM3OTIsNyBAQCBzdGF0aWMgaW50IGYyZnNfc2VjX3RyaW1fZmlsZShz
dHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAgICBwZ29mZl90IGlu
ZGV4LCBwZ19lbmQ7Cj4gPiAgICAgICBibG9ja190IHByZXZfYmxvY2sgPSAwLCBsZW4gPSAwOwo+
ID4gICAgICAgbG9mZl90IGVuZF9hZGRyOwo+ID4gLSAgICAgYm9vbCB0b19lbmQ7Cj4gPiArICAg
ICBib29sIHRvX2VuZCA9IGZhbHNlOwo+ID4gICAgICAgaW50IHJldCA9IDA7Cj4gPgo+ID4gICAg
ICAgaWYgKCEoZmlscC0+Zl9tb2RlICYgRk1PREVfV1JJVEUpKQo+ID4gQEAgLTM4MTMsMjMgKzM4
MTMsMjMgQEAgc3RhdGljIGludCBmMmZzX3NlY190cmltX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAs
IHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gICAgICAgZmlsZV9zdGFydF93cml0ZShmaWxwKTsKPiA+
ICAgICAgIGlub2RlX2xvY2soaW5vZGUpOwo+ID4KPiA+IC0gICAgIGlmIChmMmZzX2lzX2F0b21p
Y19maWxlKGlub2RlKSB8fCBmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpIHsKPiA+ICsgICAg
IGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSB8fCBmMmZzX2NvbXByZXNzZWRfZmlsZShp
bm9kZSkgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICByYW5nZS5zdGFydCA+PSBpbm9kZS0+
aV9zaXplKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gPiAgICAgICAgICAg
ICAgIGdvdG8gZXJyOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIGlmIChyYW5nZS5zdGFydCA+
PSBpbm9kZS0+aV9zaXplKSB7Cj4gPiAtICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gPiAr
ICAgICBpZiAocmFuZ2UubGVuID09IDApCj4gPiAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4g
LSAgICAgfQo+ID4KPiA+IC0gICAgIGlmIChpbm9kZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQgPCBy
YW5nZS5sZW4pIHsKPiA+IC0gICAgICAgICAgICAgcmV0ID0gLUUyQklHOwo+ID4gLSAgICAgICAg
ICAgICBnb3RvIGVycjsKPiA+ICsgICAgIGlmIChpbm9kZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQg
PiByYW5nZS5sZW4pIHsKPiA+ICsgICAgICAgICAgICAgZW5kX2FkZHIgPSByYW5nZS5zdGFydCAr
IHJhbmdlLmxlbjsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgIGVuZF9hZGRy
ID0gcmFuZ2UubGVuID09ICh1NjQpLTEgPwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNiaS0+
c2ItPnNfbWF4Ynl0ZXMgOiBpbm9kZS0+aV9zaXplOwo+ID4gKyAgICAgICAgICAgICB0b19lbmQg
PSB0cnVlOwo+ID4gICAgICAgfQo+ID4gLSAgICAgZW5kX2FkZHIgPSByYW5nZS5zdGFydCArIHJh
bmdlLmxlbjsKPiA+Cj4gPiAtICAgICB0b19lbmQgPSAoZW5kX2FkZHIgPT0gaW5vZGUtPmlfc2l6
ZSk7Cj4gPiAgICAgICBpZiAoIUlTX0FMSUdORUQocmFuZ2Uuc3RhcnQsIEYyRlNfQkxLU0laRSkg
fHwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAoIXRvX2VuZCAmJiAhSVNfQUxJR05FRChlbmRf
YWRkciwgRjJGU19CTEtTSVpFKSkpIHsKPiA+ICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsK
PiA+IEBAIC0zODQ2LDcgKzM4NDYsOCBAQCBzdGF0aWMgaW50IGYyZnNfc2VjX3RyaW1fZmlsZShz
dHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAgICBkb3duX3dyaXRl
KCZGMkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4gPiAgICAgICBkb3duX3dyaXRl
KCZGMkZTX0koaW5vZGUpLT5pX21tYXBfc2VtKTsKPiA+Cj4gPiAtICAgICByZXQgPSBmaWxlbWFw
X3dyaXRlX2FuZF93YWl0X3JhbmdlKG1hcHBpbmcsIHJhbmdlLnN0YXJ0LCBlbmRfYWRkciAtIDEp
Owo+ID4gKyAgICAgcmV0ID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZShtYXBwaW5nLCBy
YW5nZS5zdGFydCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICB0b19lbmQgPyBMTE9OR19NQVgg
OiBlbmRfYWRkciAtIDEpOwo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gPgo+ID4gLS0KPiA+IDIuMjcuMC4zODMuZzA1MDMxOWMyYWUtZ29vZwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
