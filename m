Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083F7CA3DC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 11:16:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsJiL-0007Ut-IU;
	Mon, 16 Oct 2023 09:16:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1qsJiJ-0007Um-Kn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 09:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3FwdJg2ESwHU12LbRl+SXH4clXzUSlhz/qOQqxgChOg=; b=IEfUGluwru0JUtl4APZ3ZXZJj5
 TKC/RuvKngvhRk7L4e0wkfZ191JLva/fdMs5V/c3C1n0pKeJxRC0c7OnzzmGSkVHfwSd1hDytIXDV
 IAzliSRLdXuypgHDGaWiQW5YC9wzfogcHAdTe/Ys/XlJMgLoz8lE3n9UJA2BcfbFCv3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3FwdJg2ESwHU12LbRl+SXH4clXzUSlhz/qOQqxgChOg=; b=evEFdoMH17lWgcExdCuipSF+2f
 29ZFICGr7fPjVYS/lYy7LkfSR9yM2Pqe7+bkoUwAlsqGaENO/sITlDeMxlGJ2dUggLAuLd/fBuvhP
 4+VhcPYu6h/KC3FnmM0GW3FKJI+4/6knfH0hDPdWW+0womj4pDAWi3/DoJYbxdzb1C9c=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qsJiG-00GEu4-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 09:16:40 +0000
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso8832866a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Oct 2023 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697447790; x=1698052590; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FwdJg2ESwHU12LbRl+SXH4clXzUSlhz/qOQqxgChOg=;
 b=adbROTAY7hmiJmIOasm9Rx9O30AVaNwiTP1XS8aE7LAQki+Li9ewtLvcpQ64g6GQA9
 25eXeuUYaLzncnTQVutlkuRPb1+DeNZ7wfguGSDaKtpqrwvx7rosXfalt11E4sH1ppMi
 +RKCozmoJZbLLVvFbWf6dWrnkHot+vaI9P2F1izkhSBAt+mcOzgKYxb4O+O/nARpIEw/
 /fp6upi2Z8V4rvaLH7pxdSbuIyZ+kbAP4inr2E4/eoT/9yni8z+INQAjug6hc5jqK8Rq
 RLQZhwzIttXnelmpSldqCoQK9z6j5gWdzDbK1dvZFlXwp2j4H4ReOG5dDBflqgqDznWh
 AtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697447790; x=1698052590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FwdJg2ESwHU12LbRl+SXH4clXzUSlhz/qOQqxgChOg=;
 b=XExRK451sPkx6E2HQ+RLJ9ZkKrPYoMZDIf+eXO0WWXM7+uUZswZKBTe7c9g2Gl0+nu
 ZNqlk5Dyuu8/x5aGmoXQ6MMpT4MAwHUazpq2iwjlrjiE3qcmYrNyUW6EsfxQxndTGvZq
 XsZXdclnIW38b++sfTIsG+7E9rVnCWTD/B/KKUUQfG+x1q/NNbSIY2FC2byKzgwAy2C6
 K8hxIIZzoU/uYH1daqLrlOMbA9dneJqsmnyfcGSBOHujUP3FyP+dG1UIF2mh6VevxaQp
 /aWJ3wy+rzUD6Azhb1iBFZg+eYTuUuZtS+QcMWYxuAhKV/Q1yoKej27G6aFXFrriIxmJ
 9P1Q==
X-Gm-Message-State: AOJu0YxUmNExCMROuxA5zXnA/68tBpScsl16QGu/jzpWlC59JYnt2u01
 04gDUHCuQOsHOMpRaLquKNsWnRR1ypln3Ylm2I56MSEH
X-Google-Smtp-Source: AGHT+IGNn3pHZquWoipKZMsvzUIeEiiGCnuz0jXKSt5Nx+h+AzFQEQGqfh7s6XMtl5w3ZkbiDQwx4RQfnnv2hns5G0s=
X-Received: by 2002:a50:c8ca:0:b0:530:ec02:babd with SMTP id
 k10-20020a50c8ca000000b00530ec02babdmr5868072edh.9.1697447790261; Mon, 16 Oct
 2023 02:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <1697194703-21371-1-git-send-email-zhiguo.niu@unisoc.com>
 <1880a7c4-9ab9-8e6d-f1d4-c2172a99685c@kernel.org>
 <CAHJ8P3J+Rnx4dUDGesdrtajDdP_SxDaM6yyYbHRt4ij_wVGhsg@mail.gmail.com>
 <4409f648-40f6-c28a-ebe0-d2c69ecd11fc@kernel.org>
In-Reply-To: <4409f648-40f6-c28a-ebe0-d2c69ecd11fc@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 16 Oct 2023 17:16:18 +0800
Message-ID: <CAHJ8P3KK+C-4HJxnJYLH4v20QQt_Ki0_6f2exPJQFCUmPACXPg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Chao, On Mon, Oct 16, 2023 at 5:07 PM Chao Yu wrote:
    > > Zhiguo, > > On 2023/10/16 17:02, Zhiguo Niu wrote: > > Dear Chao, > >
    > > On Mon, Oct 16, 2023 at 3:37 PM Chao Yu wrote: > >> > >> On 2023/10
    [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.45 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1qsJiG-00GEu4-RQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error path of
 __f2fs_build_free_nids
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBDaGFvLAoKT24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNTowN+KAr1BNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBaaGlndW8sCj4KPiBPbiAyMDIzLzEwLzE2IDE3OjAy
LCBaaGlndW8gTml1IHdyb3RlOgo+ID4gRGVhciBDaGFvLAo+ID4KPiA+IE9uIE1vbiwgT2N0IDE2
LCAyMDIzIGF0IDM6MzfigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+
Cj4gPj4gT24gMjAyMy8xMC8xMyAxODo1OCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+Pj4gU0JJX05F
RURfRlNDSyBzaG91bGQgYmUgc2V0IGZvciBmc2NrIGhhcyBhIGNoYW5jZSB0bwo+ID4+PiByZXBh
aXIgaW4gY2FzZSBvZiBzY2FuX25hdF9wYWdlIGZhaWwgaW4gcnVuIHRpbWUuCj4gPj4+Cj4gPj4+
IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pgo+
ID4+IEhpIFpoaWd1bywKPiA+Pgo+ID4+IENhbiB5b3UgcGxlYXNlIGNoZWNrIGJlbG93IHVwZGF0
ZT8KPiA+Pgo+ID4+ICAgRnJvbSA5YTM0NTlkMmQ2MmExMmY4NzA4ZDcyYWE3ODA4YTFkZWY5Zjlk
OTJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4+IEZyb206IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KPiA+PiBEYXRlOiBGcmksIDEzIE9jdCAyMDIzIDE4OjU4OjIzICsw
ODAwCj4gPj4gU3ViamVjdDogW1BBVENIXSBmMmZzOiBmaXggZXJyb3IgcGF0aCBvZiBfX2YyZnNf
YnVpbGRfZnJlZV9uaWRzCj4gPj4KPiA+PiBJZiBOQVQgaXMgY29ycnVwdGVkLCBsZXQgc2Nhbl9u
YXRfcGFnZSgpIHJldHVybiBFRlNDT1JSVVBURUQsIHNvIHRoYXQsCj4gPj4gY2FsbGVyIGNhbiBz
ZXQgU0JJX05FRURfRlNDSyBmbGFnIGludG8gY2hlY2twb2ludCBmb3IgbGF0ZXIgcmVwYWlyIGJ5
Cj4gPj4gZnNjay4KPiA+Pgo+ID4+IEFsc28sIHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBm
c2NvcnJ1cHRlZCBlcnJvciBmbGFnLCBhbmQgaW4gYWJvdmUKPiA+PiBzY2VuYXJpbywgaXQgd2ls
bCBwZXJzaXN0IHRoZSBlcnJvciBmbGFnIGludG8gc3VwZXJibG9jayBzeW5jaHJvbm91c2x5Cj4g
Pj4gdG8gYXZvaWQgaXQgaGFzIG5vIGx1Y2sgdG8gdHJpZ2dlciBhIGNoZWNrcG9pbnQgdG8gcmVj
b3JkIFNCSV9ORUVEX0ZTQ0suCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6
aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICAgIGZzL2YyZnMvbm9kZS5jICAgICAgICAgIHwgMTEg
KysrKysrKysrLS0KPiA+PiAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8ICAxICsKPiA+PiAg
ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4K
PiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+ID4+IGlu
ZGV4IGEyYjJjNmM3ZjY2ZC4uNTdkOWRkM2E0M2JjIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMv
bm9kZS5jCj4gPj4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPiA+PiBAQCAtMjM4OSw3ICsyMzg5LDcg
QEAgc3RhdGljIGludCBzY2FuX25hdF9wYWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+
PiAgICAgICAgICAgICAgICAgIGJsa19hZGRyID0gbGUzMl90b19jcHUobmF0X2Jsay0+ZW50cmll
c1tpXS5ibG9ja19hZGRyKTsKPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKGJsa19hZGRy
ID09IE5FV19BRERSKQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZTQ09SUlVQVEVEOwo+ID4+
Cj4gPj4gICAgICAgICAgICAgICAgICBpZiAoYmxrX2FkZHIgPT0gTlVMTF9BRERSKSB7Cj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIGFkZF9mcmVlX25pZChzYmksIHN0YXJ0X25pZCwgdHJ1
ZSwgdHJ1ZSk7Cj4gPj4gQEAgLTI1MDQsNyArMjUwNCwxNCBAQCBzdGF0aWMgaW50IF9fZjJmc19i
dWlsZF9mcmVlX25pZHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4+Cj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX3VwX3JlYWQoJm5tX2ktPm5hdF90cmVlX2xvY2spOwo+ID4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiTkFUIGlzIGNvcnJ1cHQs
IHJ1biBmc2NrIHRvIGZpeCBpdCIpOwo+ID4+ICsKPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChyZXQgPT0gLUVGU0NPUlJVUFRFRCkgewo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2VycihzYmksICJOQVQgaXMgY29ycnVwdCwg
cnVuIGZzY2sgdG8gZml4IGl0Iik7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0spOwo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2hhbmRsZV9lcnJvcihzYmksCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH0KPiA+PiArCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4+ICAgICAgICAgICAg
ICAgICAgfQo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCBiL2luY2x1
ZGUvbGludXgvZjJmc19mcy5oCj4gPj4gaW5kZXggMDdlZDY5YzI4NDBkLi4wMzlmZTBjZThkODMg
MTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiA+PiArKysgYi9pbmNs
dWRlL2xpbnV4L2YyZnNfZnMuaAo+ID4+IEBAIC0xMDQsNiArMTA0LDcgQEAgZW51bSBmMmZzX2Vy
cm9yIHsKPiA+PiAgICAgICAgICBFUlJPUl9DT1JSVVBURURfVkVSSVRZX1hBVFRSLAo+ID4+ICAg
ICAgICAgIEVSUk9SX0NPUlJVUFRFRF9YQVRUUiwKPiA+PiAgICAgICAgICBFUlJPUl9JTlZBTElE
X05PREVfUkVGRVJFTkNFLAo+ID4+ICsgICAgICAgRVJST1JfSU5DT05TSVNURU5UX05BVCwKPiA+
PiAgICAgICAgICBFUlJPUl9NQVgsCj4gPj4gICAgfTsKPiA+Pgo+ID4+IC0tCj4gPj4gMi40MC4x
Cj4gPgo+ID4gVGhhbmsgeW91IGZvciB5b3VyIHVwZGF0ZXMgYW5kIHRoZXNlIHVwZGF0ZXMgYXJl
IG1vcmUgcmVhc29uYWJsZSBiYXNlZAo+ID4gb24gdGhlIGxhdGVzdCBjb2RlLgo+ID4gSW4gYWRk
aXRpb24sICBJIGFsc28gbW9kaWZpZWQgdGhlIGZvbGxvd2luZyBjb2RlIGFmdGVyIEkgY2hlY2tl
ZCB0aGUKPiA+IHJlbGF0ZWQgZmxvdyBvZiBmMmZzX2hhbmRsZV9lcnJvci4KPiA+IEVSUk9SX0lO
Q09OU0lTVEVOVF9GT09URVIgaXMgcmV1c2VkIGhlcmUsICAgYW55IHN1Z2dlc3Rpb25zIGZvciB0
aGlzPwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMKPiA+
IGluZGV4IGQ5ZTYwODcuLjk0ZjVjN2YgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+
ID4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPiA+IEBAIC0xNDY3LDYgKzE0NjcsNyBAQCBzdGF0aWMg
c3RydWN0IHBhZ2UgKl9fZ2V0X25vZGVfcGFnZShzdHJ1Y3QKPiA+IGYyZnNfc2JfaW5mbyAqc2Jp
LCBwZ29mZl90IG5pZCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mc19vZl9ub2Rl
KHBhZ2UpLCBjcHZlcl9vZl9ub2RlKHBhZ2UpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbmV4dF9ibGthZGRyX29mX25vZGUocGFnZSkpOwo+ID4gICAgICAgICAgc2V0X3NiaV9mbGFn
KHNiaSwgU0JJX05FRURfRlNDSyk7Cj4gPiArICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwg
RVJST1JfSU5DT05TSVNURU5UX0ZPT1RFUik7Cj4gPiAgICAgICAgICBlcnIgPSAtRUlOVkFMOwo+
Cj4gZXJyID0gLUVGU0NPUlJVUFRFRDsKPgo+ID4gICBvdXRfZXJyOgo+ID4gICAgICAgICAgQ2xl
YXJQYWdlVXB0b2RhdGUocGFnZSk7Cj4gPgo+ID4gSWYgeW91IGhhdmUgbm8gb3RoZXIgc3VnZ2Vz
dGlvbnMsIEkgd2lsbCB1cGRhdGUgdGhlICJQQVRDSCBWMiIKPgo+IEhvdyBhYm91dCBjaGFuZ2lu
ZyBhYm92ZSBjb2RlIGluIHNlcGFyYXRlZCBwYXRjaD8KT0ssIEkgd2lsbCBkbyB0aGlzIGFzIHlv
dXIgc3VnZ2VzdGlvbnMuClRoYW5rcyEKPgo+IFRoYW5rcywKPgo+ICA+IFRoYW5rcyEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
