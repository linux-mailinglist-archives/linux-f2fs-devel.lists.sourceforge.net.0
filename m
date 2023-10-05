Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E529B7B990C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Oct 2023 02:04:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qoBqv-0006MB-JK;
	Thu, 05 Oct 2023 00:04:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qoBqu-0006M5-4p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Oct 2023 00:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xkg7+rczDvEf5vw76+FGOEqy3G1WsJgAGbY3dy46WG0=; b=QZlJpfDS4RdLs41m5+uO2u+mhZ
 cjMeZLHIKpnOQptek7cJ8kscA4ZTQsZ+HlBj2AYZ1gXR2LFYyUFykNWdHwKA5od9JyXyWS1i1beqD
 kDp3AM+YY6+U4nUOeZocCPUS9Lgz0lg4N7zfDRYY6vpKG6b64otSAiZ30tkXdTgkkvJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xkg7+rczDvEf5vw76+FGOEqy3G1WsJgAGbY3dy46WG0=; b=FLl6Soj08SBL7kRCcKiXZkxJYX
 UFaf6NmaZpd+eOoIo9jQaYKLOyCS9HIMMF1QrFwO0wUBGvdhD5yRT/jUJ8Uixem6hpQrejhlASVn6
 F0rP4Q696fkSD3bOyEnLl5m+Lw51yUx834HnVYfns15syldmUfXQhbUjRfdHIQGS5F1s=;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qoBqq-0004aK-3O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Oct 2023 00:04:28 +0000
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4526c6579afso309109137.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Oct 2023 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696464258; x=1697069058; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkg7+rczDvEf5vw76+FGOEqy3G1WsJgAGbY3dy46WG0=;
 b=MZDjnWtH4OETn+BxybZYmN06+tLA/sqWRugXt/IB9luTpqu6tdh1lTVLBp1Tmj5nJZ
 Lm2kDC5xRqNpGL8Swm4XvVLGcXuTY9q7H0dSYgfwTAvZ7m/i/yCsd88bGqLPe8WkmKEI
 34wpNM5TNHmNAxG02LoRI5LoMwQCPHvF4J7MGriTTYwC/aA+HP1bD1nZzXFNrnwkdakQ
 LyElKCVTHgolohIYgExNoEdsvj7y8gFJRMeq4BGPh/6gOTEjS32ONVlIoUTQWnMoYmvY
 lCCxKG81MerzOamY1J5qEZnxSz71ClsEe701Ldg6eqHOWbCcSpy1dTex/BR6ZHfhMzMY
 /ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696464258; x=1697069058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkg7+rczDvEf5vw76+FGOEqy3G1WsJgAGbY3dy46WG0=;
 b=dmmUJ5DvILivieY0jN9QOANdwOCrdQtD8hWZjbvQyz5i1bgoLu8M7TqV11IDtgmcIz
 V7/EZMvroVav2umwKzZL/vNn5Q5Oqf2r5rOge4NWr9kpR5DXW18Su0LAYYZ9axp9xiqg
 CWo7e4IKLIpOURJrQdHEluHjNGRmqk9tcjf+j+2ti2sYq2Ujx9IaNXwRPIFYpzChtjrO
 GzlGT/4D3ZtLaFf+PVZ6edtSylyjHNFZQS/y6WvYEWMXyITfLWrLqKy3t3tkWDDfNDC0
 gYn5Fv2flrLE9slEKbcDrO6f7NXrKwc7HD2PxhgacaiPEO6pVl6kilL+D7UqeZXyhCbq
 ltXQ==
X-Gm-Message-State: AOJu0Yw/KwrQKRj+6dOeCbbNF9a/KEYiz9N0Bhobt1BdQ9HeF9WoxwTJ
 gLtDSxSEKTxPbAQ6VpLB3nCtaCH59WYdCIz6Fmc=
X-Google-Smtp-Source: AGHT+IEkEy7nTZvm9Lo1GeI7LwD4zyd85KPs0KALc+yrS1+dsVdNI/ItufsM2wWbY3At4/Yvp+fWO2fpBLL86lPRrkw=
X-Received: by 2002:a05:6102:53c9:b0:455:dd1c:9653 with SMTP id
 bs9-20020a05610253c900b00455dd1c9653mr487841vsb.1.1696464258319; Wed, 04 Oct
 2023 17:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231003230155.355807-1-daeho43@gmail.com>
 <ZR30mNQEyRjzr0jm@google.com>
 <CACOAw_zSvAPTREb0dSv6srRuxuKxDZp4rMhLyWTk+uJ3WKSWKA@mail.gmail.com>
 <ZR37Xyr9HcVuLqxx@google.com>
In-Reply-To: <ZR37Xyr9HcVuLqxx@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 4 Oct 2023 17:04:07 -0700
Message-ID: <CACOAw_weaNhBUpeR9xnkPYQCu6RO-AkUZeJGJYh9tokdUtATKg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Oct 4, 2023 at 4:55 PM Jaegeuk Kim wrote: > > On
    10/04, Daeho Jeong wrote: > > On Wed, Oct 4, 2023 at 4:26 PM Jaegeuk Kim
    wrote: > > > > > > On 10/03, Daeho Jeong wrote: > > > > From: [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1qoBqq-0004aK-3O
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: use proper address entry count
 for direct nodes
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA0OjU14oCvUE0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMC8wNCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBPbiBX
ZWQsIE9jdCA0LCAyMDIzIGF0IDQ6MjbigK9QTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwu
b3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gMTAvMDMsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
PiA+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+ID4KPiA+
ID4gPiBGb3IgZGlyZWN0IG5vZGVzLCB3ZSBoYXZlIHRvIHVzZSBERUZfQUREUlNfUEVSX0JMT0NL
Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdA
Z29vZ2xlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZnNjay9mc2NrLmMgfCAyICstCj4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5jIGIvZnNjay9mc2NrLmMKPiA+ID4gPiBp
bmRleCA3OGZmZGI2Li41NmE3ZDMxIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2ZzY2svZnNjay5jCj4g
PiA+ID4gKysrIGIvZnNjay9mc2NrLmMKPiA+ID4gPiBAQCAtMjg5NCw3ICsyODk0LDcgQEAgc3Rh
dGljIHZvaWQgZnNja19mYWlsZWRfcmVjb25uZWN0X2ZpbGVfZG5vZGUoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLAo+ID4gPiA+ICAgICAgIGZzY2stPmNoay52YWxpZF9ibGtfY250LS07Cj4gPiA+
ID4gICAgICAgZjJmc19jbGVhcl9tYWluX2JpdG1hcChzYmksIG5pLmJsa19hZGRyKTsKPiA+ID4g
Pgo+ID4gPiA+IC0gICAgIGZvciAoaSA9IDA7IGkgPCBBRERSU19QRVJfQkxPQ0soJm5vZGUtPmkp
OyBpKyspIHsKPiA+ID4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgREVGX0FERFJTX1BFUl9CTE9D
SzsgaSsrKSB7Cj4gPiA+Cj4gPiA+IEl0IHNlZW1zIHdlIG5lZWQgdG8gdXNlIHRoZSBpbm9kZSBi
bG9jayBwYXNzaW5nIGJ5IGZzY2tfZmFpbGVkX3JlY29ubmVjdF9maWxlKCkuCj4gPgo+ID4gVGhp
cyBmdW5jdGlvbiBpcyBmb3IgZGlyZWN0IG5vZGVzLiBJcyBpdCBjb3JyZWN0IHRvIHVzZSBpbm9k
ZSBibG9jayBoZXJlPwo+Cj4gIDUyMyB1bnNpZ25lZCBpbnQgYWRkcnNfcGVyX2Jsb2NrKHN0cnVj
dCBmMmZzX2lub2RlICppKQo+ICA1MjQgewo+ICA1MjUgICAgICAgICBpZiAoIUxJTlVYX1NfSVNS
RUcobGUxNl90b19jcHUoaS0+aV9tb2RlKSkgfHwKPiAgNTI2ICAgICAgICAgICAgICAgICAgICAg
ICAgICEobGUzMl90b19jcHUoaS0+aV9mbGFncykgJiBGMkZTX0NPTVBSX0ZMKSkKPiAgNTI3ICAg
ICAgICAgICAgICAgICByZXR1cm4gREVGX0FERFJTX1BFUl9CTE9DSzsKPiAgNTI4ICAgICAgICAg
cmV0dXJuIEFMSUdOX0RPV04oREVGX0FERFJTX1BFUl9CTE9DSywgMSA8PCBpLT5pX2xvZ19jbHVz
dGVyX3NpemUpOwo+ICA1MjkgfQo+Cj4gSWYgdGhlIGlub2RlIGlzIGNvbXByZXNzZWQsIGl0IHNl
ZW1zIGl0IGhhcyB0byBiZSBhbGlnbmVkIHRvIGNsdXN0ZXIgc2l6ZS4KCm1ha2VzIHNlbnNlLiBU
aGFua3N+IQoKPgo+ID4KPiA+ID4KPiA+ID4gPiAgICAgICAgICAgICAgIGFkZHIgPSBsZTMyX3Rv
X2NwdShub2RlLT5kbi5hZGRyW2ldKTsKPiA+ID4gPiAgICAgICAgICAgICAgIGlmICghYWRkcikK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+Cj4gPiA+IDMwMTIg
ICAgICAgICAgICAgICAgICAgICAgICAgZnNjay0+Y2hrLnZhbGlkX2Jsa19jbnQtLTsKPiA+ID4g
MzAxMyAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYWRkciA9PSBORVdfQUREUikKPiA+ID4K
PiA+ID4gQW5kLCB3ZSBhbHNvIG5lZWQgdG8gc2tpcCBpZiBhZGRyID09IENPTVBSRVNTX0FERFIg
aGVyZT8KPiA+ID4KPiA+ID4gMzAxNCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ID4gPiAzMDE1ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfY2xlYXJfbWFp
bl9iaXRtYXAoc2JpLCBhZGRyKTsKPiA+ID4gMzAxNiAgICAgICAgICAgICAgICAgfQo+ID4gPgo+
ID4gPiA+IC0tCj4gPiA+ID4gMi40Mi4wLjU4Mi5nOGNjZDIwZDcwZC1nb29nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
