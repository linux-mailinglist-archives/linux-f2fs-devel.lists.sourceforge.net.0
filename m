Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9087EA6E4A4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 21:50:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twok6-0000Lf-S6;
	Mon, 24 Mar 2025 20:49:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1twojx-0000LR-4W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 20:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xb1EcGN+DLdFqVyhIa6MKr7XqlCZ1puGiDPvwPhj3EA=; b=cxgRtWLFA0+Kkm5TE7PZ6Iil93
 gtApEjwFofBw+zfJzJFRwQZz/WQjHcQ1szpfQv9BaYtEOkrysTkHaixiTTeB+w4vi1E7xXYDys4Hi
 RdiXnjBLDLARUi99b6xGo7VxuHLho9XxU/mxgpv38GtyQ/XAQyZVVUigghWWW/irDWzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xb1EcGN+DLdFqVyhIa6MKr7XqlCZ1puGiDPvwPhj3EA=; b=DIn10xp1iGp4nS5n1l0BPocC90
 8MhOKZTGJAKVFjVHDbge+QMyMRajVYyR/HCYRA17hU/qkzKgrTurq2qWEMXRKfGxBX8HIPRKXvmo5
 odshnLHiNT4iLwOnC+bwjBEN7lwVs0N2InN4VIjU/I1pquTiu/KjyiswvBFp9FTVFyKY=;
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twojq-0002Y3-Ou for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 20:49:44 +0000
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-86d2fba8647so4754495241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Mar 2025 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742849373; x=1743454173; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xb1EcGN+DLdFqVyhIa6MKr7XqlCZ1puGiDPvwPhj3EA=;
 b=Z847nD05saVsIe7FVyT7d/K0Unb7h0+/h9N7ubU5vc+oLzxgq8DHy73qFd9uje1PZw
 JM7grQb/Buf4rXWyaru33izqCMWpmUc8DsFRcPlt8PnRiQMThcw+mM6ZLuBW+V7nJ0D6
 1qQzxSEGCa5oJIWKsLfc7f3AUnvioss8AqBRGAL9KoBh/gMB3qWQ/jT1wrrihz4wPi5c
 soKeyFICdNulFYQr78EMzfmqqpr+GoSbp8ACZ/XcicjOMpsk8TU8b9kTj7X8GiHC+qhr
 meptO3M5Q9EpewdYm5rNbeKngn34/kwfSzkC5VyPuzrPTUOJEmr+Cq+ob+Fcna8lvi/i
 j7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742849373; x=1743454173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xb1EcGN+DLdFqVyhIa6MKr7XqlCZ1puGiDPvwPhj3EA=;
 b=RxHjnbaw3WXS9XkWfhX/eplGzX5BDwPjFEdhIOKARpWHUUooq6QB6l0tn8qgxwovDG
 tmSqLJ0r8zSDn8DscwYtRZRINYFcOktLe7ICwVFPyPKVS2QI4r644Kigq57J1v5rhvrj
 Fdqs/G4Aq7nPcVHsq3ofuTre23pAMOKAm3A8n1qjFBxbrr1ITiF41yE6wtMncJywuU/e
 wSTvq9TZNCMI20aJYsC2/Hy5J2RznTreu874AVgGktV8BroPylvrwNATxxWz+8QcqPqd
 t34yiKc+XeCilY/0TOE8K8C782+lq1Z2D2lzePUOCzdlHecOgIpn/WtUXbgywth22QkC
 LoSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm99xGXbtEVIW0NILAh8e8o8l/7NxJzr+zPhIsdp8zPu36GbB2eKOVyFQIJcvxjzudRJecPMvuzXWApa2pOJfp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwejuyvjcB751NI6viO/jZvvECG3kCFCp+eVJTUFDLShDsCpx1b
 +3VRcD8njCFzPuNtiYv9gzgM/cSdIWazlweV4akIPvDB7AfirvdRgy3jpALh2+4Q2Gzgo58WGXy
 34vj2qggyiIb21c89Eaq3azrsupmQMkNA
X-Gm-Gg: ASbGncsZZRmvvcXOgyD5tcZVBevse9DNzp/BxQQ8rCpQR4zQog4cRc7uxLKZI0+u3U5
 b2/h2wq8ObHyA+DtFBVQrv55c4evwksnNIKMapvLxwNt4X5tbJzYmP63dU/8qHlryIv6qlIGrZV
 Awv482EMSL3LfKpwSy+83wThPEdFypXBgQYK77zYv0CW3kYh71c9QhFgRUSKo=
X-Google-Smtp-Source: AGHT+IFYQ+znrERpUK/T2yZcjOgHwC0eeQV21cqyzOJ6TxJ8aQHzm3tW40+u9aH3j036JC0dMADHtPUzcsF4Ywqp65Y=
X-Received: by 2002:a05:6102:2ac7:b0:4bb:cbbc:38 with SMTP id
 ada2fe7eead31-4c50d47bb1amr10510750137.5.1742849372565; Mon, 24 Mar 2025
 13:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250324114935.3087821-1-chao@kernel.org>
In-Reply-To: <20250324114935.3087821-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 24 Mar 2025 13:49:21 -0700
X-Gm-Features: AQ5f1JrmUa_GWVxdHKrgfz3iluAHNC70SVuKD8rE7iWmikL7TRxcoM4t5WcKpLg
Message-ID: <CACOAw_zQ1+yMknJ76B+H2-N=BfY4a85Yjwicip5UTQu9GLZQdA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 24, 2025 at 4:54 AM Chao Yu via Linux-f2fs-devel
    wrote: > > A zoned device can has both conventional zones and sequential
   zones, > so we should not treat first segment of zoned device [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.50 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.50 listed in sa-accredit.habeas.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.50 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1twojq-0002Y3-Ou
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: zone: fix to calculate
 first_zoned_segno correctly
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgNDo1NOKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IEEgem9uZWQgZGV2aWNlIGNhbiBoYXMgYm90aCBjb252ZW50aW9uYWwgem9uZXMgYW5kIHNlcXVl
bnRpYWwgem9uZXMsCj4gc28gd2Ugc2hvdWxkIG5vdCB0cmVhdCBmaXJzdCBzZWdtZW50IG9mIHpv
bmVkIGRldmljZSBhcyBmaXJzdF96b25lZF9zZWdubywKPiBpbnN0ZWFkLCB3ZSBuZWVkIHRvIGNo
ZWNrIHpvbmUgdHlwZSBmb3IgZWFjaCB6b25lIGR1cmluZyB0cmF2ZXJzaW5nIHpvbmVkCj4gZGV2
aWNlIHRvIGZpbmQgZmlyc3Rfem9uZWRfc2Vnbm8uCj4KPiBPdGhlcndpc2UsIGZvciBiZWxvdyBj
YXNlLCBmaXJzdF96b25lZF9zZWdubyB3aWxsIGJlIDAsIHdoaWNoIGNvdWxkIGJlCj4gd3Jvbmcu
Cj4KPiBjcmVhdGVfbnVsbF9ibGsgNTEyIDIgMTAyNCAxMDI0Cj4gbWtmcy5mMmZzIC1tIC9kZXYv
bnVsbGIwCj4KPiBGaXhlczogOTcwM2Q2OWQ5ZDE1ICgiZjJmczogc3VwcG9ydCBmaWxlIHBpbm5p
bmcgZm9yIHpvbmVkIGRldmljZXMiKQo+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0K
PiAgZnMvZjJmcy9mMmZzLmggICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KPiAgZnMvZjJmcy9z
ZWdtZW50LmMgfCAgMiArLQo+ICBmcy9mMmZzL3N1cGVyLmMgICB8IDMyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZz
L2YyZnMuaAo+IGluZGV4IGNhODg0ZTM5YTVmZi4uM2RlYTAzN2ZhYTU1IDEwMDY0NAo+IC0tLSBh
L2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtNDYzMCwxMiArNDYz
MCwxNiBAQCBGMkZTX0ZFQVRVUkVfRlVOQ1MocmVhZG9ubHksIFJPKTsKPiAgRjJGU19GRUFUVVJF
X0ZVTkNTKGRldmljZV9hbGlhcywgREVWSUNFX0FMSUFTKTsKPgo+ICAjaWZkZWYgQ09ORklHX0JM
S19ERVZfWk9ORUQKPiAtc3RhdGljIGlubGluZSBib29sIGYyZnNfYmxrel9pc19zZXEoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2aSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja190IGJsa2FkZHIpCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX3pv
bmVfaXNfc2VxKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmksCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgem9uZSkKPiAgewo+IC0gICAgICAgdW5zaWduZWQgaW50IHpubyA9IGJsa2FkZHIgLyBzYmkt
PmJsb2Nrc19wZXJfYmxrejsKPiArICAgICAgIHJldHVybiB0ZXN0X2JpdCh6b25lLCBGREVWKGRl
dmkpLmJsa3pfc2VxKTsKPiArfQo+Cj4gLSAgICAgICByZXR1cm4gdGVzdF9iaXQoem5vLCBGREVW
KGRldmkpLmJsa3pfc2VxKTsKPiArc3RhdGljIGlubGluZSBib29sIGYyZnNfYmxrel9pc19zZXEo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2aSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBibGth
ZGRyKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gZjJmc196b25lX2lzX3NlcShzYmksIGRldmksIGJs
a2FkZHIgLyBzYmktPmJsb2Nrc19wZXJfYmxreik7Cj4gIH0KPiAgI2VuZGlmCj4KPiBAQCAtNDcx
MSw5ICs0NzE1LDEzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX3ZhbGlkX3Bpbm5lZF9hcmVh
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBibG9ja190IGJsa2FkZHIpCj4gIHsKPiAgICAgICAgIGlmIChmMmZzX3Ni
X2hhc19ibGt6b25lZChzYmkpKSB7Cj4gKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ICAg
ICAgICAgICAgICAgICBpbnQgZGV2aSA9IGYyZnNfdGFyZ2V0X2RldmljZV9pbmRleChzYmksIGJs
a2FkZHIpOwo+Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAhYmRldl9pc196b25lZChGREVWKGRl
dmkpLmJkZXYpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gIWYyZnNfYmxrel9pc19zZXEoc2Jp
LCBkZXZpLCBibGthZGRyKTsKPiArI2Vsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
Cj4gKyNlbmRpZgo+ICAgICAgICAgfQo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IGluZGV4IDM5
NmVmNzFmNDFlMy4uZGMzNjBiNGIwNTY5IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5j
Cj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtMzMxMSw3ICszMzExLDcgQEAgaW50IGYy
ZnNfYWxsb2NhdGVfcGlubmluZ19zZWN0aW9uKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPgo+
ICAgICAgICAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgZXJyID09IC1FQUdBSU4g
JiYgZ2NfcmVxdWlyZWQpIHsKPiAgICAgICAgICAgICAgICAgZjJmc19kb3duX3dyaXRlKCZzYmkt
PmdjX2xvY2spOwo+IC0gICAgICAgICAgICAgICBlcnIgPSBmMmZzX2djX3JhbmdlKHNiaSwgMCwg
R0VUX1NFR05PKHNiaSwgRkRFVigwKS5lbmRfYmxrKSwKPiArICAgICAgICAgICAgICAgZXJyID0g
ZjJmc19nY19yYW5nZShzYmksIDAsIHNiaS0+Zmlyc3Rfem9uZWRfc2Vnbm8gLSAxLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgWk9ORURfUElOX1NFQ19SRVFVSVJFRF9D
T1VOVCk7Cj4gICAgICAgICAgICAgICAgIGYyZnNfdXBfd3JpdGUoJnNiaS0+Z2NfbG9jayk7Cj4K
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gaW5kZXgg
MDExOTI1ZWU1NGY4Li5iMjM0MjM2NjAyMGEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zdXBlci5j
Cj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTQzMDcsMTIgKzQzMDcsMjYgQEAgc3RhdGlj
IHZvaWQgZjJmc19yZWNvcmRfZXJyb3Jfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4K
PiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZ2V0X2ZpcnN0X3pvbmVkX3NlZ25vKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgewo+IC0gICAgICAgaW50IGRldmk7Cj4gKyNpZmRlZiBD
T05GSUdfQkxLX0RFVl9aT05FRAo+ICsgICAgICAgdW5zaWduZWQgaW50IHNlZ25vOwo+ICsgICAg
ICAgaW50IGRldmksIGk7Cj4KPiAtICAgICAgIGZvciAoZGV2aSA9IDA7IGRldmkgPCBzYmktPnNf
bmRldnM7IGRldmkrKykKPiAtICAgICAgICAgICAgICAgaWYgKGJkZXZfaXNfem9uZWQoRkRFVihk
ZXZpKS5iZGV2KSkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gR0VUX1NFR05PKHNi
aSwgRkRFVihkZXZpKS5zdGFydF9ibGspOwo+IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICBp
ZiAoIWYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBO
VUxMX1NFR05POwo+ICsKPiArICAgICAgIGZvciAoZGV2aSA9IDA7IGRldmkgPCBzYmktPnNfbmRl
dnM7IGRldmkrKykgewo+ICsgICAgICAgICAgICAgICBpZiAoIWJkZXZfaXNfem9uZWQoRkRFVihk
ZXZpKS5iZGV2KSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAg
ICAgICAgICAgICAgIHNlZ25vID0gR0VUX1NFR05PKHNiaSwgRkRFVihkZXZpKS5zdGFydF9ibGsp
Owo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgRkRFVihkZXZpKS50b3RhbF9zZWdt
ZW50czsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGYyZnNfem9uZV9pc19z
ZXEoc2JpLCBkZXZpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0VUX1pPTkVf
RlJPTV9TRUcoc2JpLCBzZWdubyArIGkpKSkKCk1heWJlIHdlIGNhbiBjaGVjayBpdCB3aXRoIGEg
em9uZSB1bml0PwoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBzZWdu
byArIGk7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArI2VuZGlmCj4gKyAgICAg
ICByZXR1cm4gTlVMTF9TRUdOTzsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgZjJmc19zY2FuX2Rldmlj
ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+IEBAIC00MzQ5LDYgKzQzNjMsMTQgQEAgc3Rh
dGljIGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICNl
bmRpZgo+Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbWF4X2RldmljZXM7IGkrKykgewo+ICsg
ICAgICAgICAgICAgICBpZiAobWF4X2RldmljZXMgPT0gMSkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIEZERVYoaSkudG90YWxfc2VnbWVudHMgPQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGUzMl90b19jcHUocmF3X3N1cGVyLT5zZWdtZW50X2NvdW50X21haW4pOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIEZERVYoaSkuc3RhcnRfYmxrID0gMDsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBGREVWKGkpLmVuZF9ibGsgPSBGREVWKGkpLnRvdGFsX3NlZ21lbnRzICoK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCTEtTX1BF
Ul9TRUcoc2JpKTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAgICAgICAgaWYg
KGkgPT0gMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBGREVWKDApLmJkZXZfZmlsZSA9IHNi
aS0+c2ItPnNfYmRldl9maWxlOwo+ICAgICAgICAgICAgICAgICBlbHNlIGlmICghUkRFVihpKS5w
YXRoWzBdKQo+IC0tCj4gMi40OC4xCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
