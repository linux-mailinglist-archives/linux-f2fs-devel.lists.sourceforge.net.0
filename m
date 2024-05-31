Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205A8D5888
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 04:16:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCroC-0000qI-Gy;
	Fri, 31 May 2024 02:15:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sCroB-0000q4-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 02:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SVZ+m5D5+txNLZWQ1wHkb88kpVVpmlzrHDUo9d6Wu3o=; b=aGSK8f2h0ESqMDJ/YMTvLV/hWB
 I4CsYihUhXQLL4YZ4bMPSizMkXvbClXQKwmTeBqbgXb2d9p8Itq9iECBYkGy382Kp8W+eef1Y9C2Z
 MBWMAhwOHXjawSH6eLfXinEXDOk0q3yrtBE0pVME79c6TmpOEQaFngcuQqIc9A42BNFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SVZ+m5D5+txNLZWQ1wHkb88kpVVpmlzrHDUo9d6Wu3o=; b=R31IRh/E82P7vO6yQFzeUBnGAK
 paRq2/3x2Bo8ponD9wuIgSK4RVQVCP8dJeVDHZ8nwR2aAdU0J6SIT+1X1+wRMBU2vYwLqstU1MvWe
 J6DkhrqMFoyl0NLg45KTiuXb6nAWKlTDbpuvPeYa6HAG8uKORs0nPbyFXi7LGk0GZ0vc=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sCroB-0004BH-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 02:15:55 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so478585f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 May 2024 19:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717121748; x=1717726548; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVZ+m5D5+txNLZWQ1wHkb88kpVVpmlzrHDUo9d6Wu3o=;
 b=eAZVaWJzeRyBnr+uHROVIHHncngTmIUIk/YWtATDcMsqXLgow/dclkLT6Ysmq9JzGQ
 eHibo6cOyrCPv23YAN7myVTveq/xaRTc72zTkf80H54cMaHSm0/ffSkOZgw+NSLSs6fi
 WrQRawwIDHxvBb+PmuacM2rv574pfakHjqDTIdySkiZwM6zT7UtXzGxzOp8Y4z7naZ9p
 GjsZVFiTFwVeBje9g8eEjNFlrAJK5ZjMQUcrDFbhmz1Xf9OVhegkf52CsxhNto8b98K0
 skigZzoUczhniQGTBT7q6IM6KBtb4gtUrMEnS3+rtriCnPrxDlyg4WQDl366cH1wTl17
 oARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717121748; x=1717726548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVZ+m5D5+txNLZWQ1wHkb88kpVVpmlzrHDUo9d6Wu3o=;
 b=MMXWtYKSOvxEPVIMkJITtn5Je9Z0XpUJB7wz+naIvF6HLHsDpxoY0z7NSB6xDeE11L
 TUa8lP0bUOMUobKxfk3BwU6IZ79qlfKmlhhMbIsmw4dcuXkrRFifxMONrSZrpEQjZ9dT
 FrXbdZEIQ66bS174j2M/qhJGhHDzjSxiIbPxUpsSgIUzYfriKF851EZYjP68jy3HfMZk
 1AAvRaOuv8T/MAwsuEcGhCc0TcGdVaASozKlUy1cdYueoNoc6462e3NYuijhZcRniKYX
 WuWl3ZVh2GU14V4M92xUMumE9v+H52Fbm0hBsW6K9NIxd0ho9rtuYoY4o511imIoma0Z
 3jSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQCB7Zs4YT6IjxQsKyXV45Uwpp468T8OFIxBRZ6bpP3dZrEMnwOS7G+BPrqE5iF6SgHy18cwc1YTb74F6SUmzl97BR0N0m2o2v948vTnDTAtuxM+Xi2A==
X-Gm-Message-State: AOJu0Yw/WY6I/dW/i1HTFPCGlcVty2axznWcCc616F8/mD+S72h6tJfo
 Q6Af1gxK/BJJTDejVL0Qd+0ERvVP6iFi7BCqY/KRhhp5fAbhV+ryGG0Y3zBqq6s3tph3ouFr4nJ
 E+i5BHIIp8ryDaWwvLuTlridqX+gMlAUd
X-Google-Smtp-Source: AGHT+IHRWJN+gxDchzmDSqJk6zLAuQIT1nOSjWlbD6Rv+4uUgrbaWgOh/7ArTSHrMuvTdEVXCutlfFw3zw5BoONSCjE=
X-Received: by 2002:a5d:4808:0:b0:354:fca5:4190 with SMTP id
 ffacd0b85a97d-35e0f289f41mr212647f8f.41.1717121748147; Thu, 30 May 2024
 19:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <1d67715b-5f88-4940-969d-e098fd80ae2a@kernel.org>
 <CAHJ8P3LXYWQ+bLZHPn_5FLu3oi83ei8C9ZCzAXwa9oBdEKVDNA@mail.gmail.com>
 <CAHJ8P3+ro9YsU7jZWeAfiUh9uNFEj_=Wiaf2YRLVLBD5_9fM0g@mail.gmail.com>
 <0a4b5b40-1532-44a4-a4d6-601ceced20a4@kernel.org>
In-Reply-To: <0a4b5b40-1532-44a4-a4d6-601ceced20a4@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 31 May 2024 10:15:36 +0800
Message-ID: <CAHJ8P3J1_Yg3FAruR0zPQdDnbw_GbT7wOKON3-xzBr32+HU_6w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, May 31, 2024 at 10:04 AM Chao Yu wrote: > > On 2024/5/30
    17:49, Zhiguo Niu wrote: > > On Mon, May 27, 2024 at 12:07 PM Zhiguo Niu
    wrote: > >> > >> On Mon, May 27, 2024 at 11:49 AM Ch [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.42 listed in sa-accredit.habeas.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.42 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.221.42 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCroB-0004BH-RQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTA6MDTigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyNC81LzMwIDE3OjQ5LCBaaGlndW8gTml1IHdyb3RlOgo+ID4g
T24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgMTI6MDfigK9QTSBaaGlndW8gTml1IDxuaXV6aGlndW84
NEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgMTE6
NDnigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Pgo+ID4+PiBPbiAy
MDI0LzUvMjAgMTk6MzYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+PiBOb3cgYXRnYyBjYW4gYmUg
ZW5hYmxlZCBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cj4gPj4+PiAtQVRHQyBt
b3VudCBvcHRpb24gaXMgc2V0Cj4gPj4+PiAtZWxhcHNlZF90aW1lIGlzIG1vcmUgdGhhbiBhdGdj
X2FnZV90aHJlc2hvbGQgYWxyZWFkeQo+ID4+Pj4gYnV0IHRoZXNlIGNvbmRpdGlvbnMgYXJlIGNo
ZWNrIHdoZW4gdW1vdW50ZWQtPm1vdW50ZWQgZGV2aWNlIGFnYWluLgo+ID4+Pj4gSWYgdGhlIGRl
dmljZSBoYXMgbm90IGJlIHVtb3VudGVkLT5tb3VudGVkIGZvciBhIGxvbmcgdGltZSwgYXRnYyBj
YW4KPiA+Pj4+IG5vdCB3b3JrIGV2ZW4gdGhlIGFib3ZlIGNvbmRpdGlvbnMgbWV0Lgo+ID4+Pgo+
ID4+PiBaaGlndW8sIEkgZGlkbid0IGdldCBpdCwgY2FuIHlvdSBwbGVhc2UgZXhwbGFpbiBtb3Jl
IGFib3V0IHRoaXMgaXNzdWU/Cj4gPj4+Cj4gPj4+IFRoYW5rcywKPiA+PiBIaSBDaGFvLAo+ID4+
Cj4gPj4gQXQgcHJlc2VudCwgdGhlIHBvaW50IG9mIGF0Z2MgZW5hbGUgaXMgY2hlY2tlZCBkdXJp
bmcgdGhlIG1vdW50Cj4gPj4gcHJvY2Vzcy4gV2hhdCBJIG1lYW4gaXMgdGhhdCBpZiBhIGRldmlj
ZSBoYXMgbm90IGJlZW4gcmVib290ZWQKPiA+PiAocmUtbW91bnRlZCkgZm9yIGEgbG9uZyB0aW1l
LCBldmVuIGlmIHRoZSBhYm92ZSB0d28gY29uZGl0aW9ucyBhcmUKPiA+PiBtZXQoQVRHQyBtb3Vu
dCBvcHRpb24gaXMgc2V0LCBhbmQgdGhlIGRldmljZSBoYXMgYmVlbiBwb3dlcmVkIG9uIGxvbmcK
PiA+PiBlbm91Z2jvvIwgbW9yZSB0aGFuIGF0Z2MgZGVmYXVsdCB0aHJlc2hvbGQgKSwgYXRnYyBj
YW5ub3QgYmUgZHluYW1pY2FsbHkKPiA+PiBlbmFibGVkLgo+ID4+Cj4gPj4gSWYgdGhlIHVzZXIg
aXMgdXNlZCB0byBub3QgcmVzdGFydGluZyB0aGUgcGhvbmUgYWZ0ZXIgdHVybmluZyBpdCBvbiwK
PiA+PiBpdCB3aWxsIGJlIGRpZmZpY3VsdCB0byB1c2UgYXRnYy4KPiA+PiB0aGFua3MhCj4gPiBI
aSBDaGFvLAo+ID4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9yIGNvbW1lbnRzIG9uIHRo
aXM/Cj4KPiBaaGlndW8sCj4KPiBJIHJlbWVtYmVyIHRoYXQgYXRnYyBjYW4gbm90IGJlIGVuYWJs
ZWQgYXQgcnVudGltZSBkdWUgdG8gc29tZSByZWFzb25zLCBidXQKPiBJIG5lZWQgc29tZSB0aW1l
IHRvIHJlY2FsbCBhbmQgY2hlY2sgdGhlIGRldGFpbHMuLi4KPgo+IFRoYW5rcywKSGkgQ2hhbywK
T0ssIFRoYW5rcyBmb3IgeW91ciBoZWxwLgo+Cj4gPiB0aGFua3PvvIEKPiA+Cj4gPj4+Cj4gPj4+
Pgo+ID4+Pj4gSXQgaXMgYmV0dGVyIHRvIGVuYWJsZSBhdGdjIGR5bmFtaWNsbHkgd2hlbiB1c2Vy
IGNoYW5nZSBhdGdjX2FnZV90aHJlc2hvbGQKPiA+Pj4+IG1lYW53aGlsZSB0aGlzIHZhbGUgaXMg
bGVzcyB0aGFuIGVsYXBzZWRfdGltZSBhbmQgQVRHQyBtb3VudCBvcHRpb24gaXMgb24uCj4gPj4+
Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29t
Pgo+ID4+Pj4gLS0tCj4gPj4+PiAgICBmcy9mMmZzL2YyZnMuaCAgICB8ICAxICsKPiA+Pj4+ICAg
IGZzL2YyZnMvc2VnbWVudC5jIHwgIDkgKysrKy0tLS0tCj4gPj4+PiAgICBmcy9mMmZzL3N5c2Zz
LmMgICB8IDE2ICsrKysrKysrKysrKysrKysKPiA+Pj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4+Pj4gaW5kZXggMTk3NGI2YS4uZTQ0
MWQyZCAxMDA2NDQKPiA+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPj4+PiArKysgYi9mcy9m
MmZzL2YyZnMuaAo+ID4+Pj4gQEAgLTM2OTQsNiArMzY5NCw3IEBAIHZvaWQgZjJmc19jbGVhcl9w
cmVmcmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4+ICAgIGludCBm
MmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPj4+PiAg
ICB2b2lkIGYyZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsK
PiA+Pj4+ICAgIHZvaWQgZjJmc19yZXN0b3JlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpOwo+ID4+Pj4gK2ludCBmMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpKTsKPiA+Pj4+ICAgIGludCBmMmZzX2FsbG9jYXRlX3NlZ21lbnRfZm9yX3Jl
c2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLAo+ID4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0YXJ0LCB1bnNpZ25l
ZCBpbnQgZW5kKTsKPiA+Pj4+ICAgIGludCBmMmZzX2FsbG9jYXRlX25ld19zZWN0aW9uKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsIGJvb2wgZm9yY2UpOwo+ID4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+Pj4+IGluZGV4
IDcxZGM4MDQyLi40NDkyM2Q0IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMK
PiA+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+PiBAQCAtMjkzMSwxNCArMjkzMSwx
MSBAQCBzdGF0aWMgaW50IGdldF9hdHNzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgaW50IHR5cGUsCj4gPj4+PiAgICAgICAgcmV0dXJuIHJldDsKPiA+Pj4+ICAgIH0KPiA+Pj4+
Cj4gPj4+PiAtc3RhdGljIGludCBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpCj4gPj4+PiAraW50IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkpCj4gPj4+PiAgICB7Cj4gPj4+PiAgICAgICAgc3RydWN0IGN1cnNlZ19p
bmZvICpjdXJzZWcgPSBDVVJTRUdfSShzYmksIENVUlNFR19BTExfREFUQV9BVEdDKTsKPiA+Pj4+
ICAgICAgICBpbnQgcmV0ID0gMDsKPiA+Pj4+Cj4gPj4+PiAtICAgICBpZiAoIXNiaS0+YW0uYXRn
Y19lbmFibGVkKQo+ID4+Pj4gLSAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4+IC0KPiA+Pj4+
ICAgICAgICBmMmZzX2Rvd25fcmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4gPj4+Pgo+
ID4+Pj4gICAgICAgIG11dGV4X2xvY2soJmN1cnNlZy0+Y3Vyc2VnX211dGV4KTsKPiA+Pj4+IEBA
IC0yOTU1LDcgKzI5NTIsOSBAQCBzdGF0aWMgaW50IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Pj4+ICAgIH0KPiA+Pj4+ICAgIGludCBmMmZzX2lu
aXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Pj4+ICAgIHsKPiA+
Pj4+IC0gICAgIHJldHVybiBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ID4+Pj4gKyAg
ICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCkKPiA+Pj4+ICsgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gPj4+PiArICAgICByZXR1cm4gZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSk7Cj4gPj4+
PiAgICB9Cj4gPj4+Pgo+ID4+Pj4gICAgc3RhdGljIHZvaWQgX19mMmZzX3NhdmVfaW5tZW1fY3Vy
c2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUpCj4gPj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4gPj4+PiBpbmRleCAwOWQzZWNm
Li43MjY3NmM1IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4gPj4+PiArKysg
Yi9mcy9mMmZzL3N5c2ZzLmMKPiA+Pj4+IEBAIC02NzMsNiArNjczLDIyIEBAIHN0YXRpYyBzc2l6
ZV90IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gPj4+PiAgICAgICAgICAgICAg
ICByZXR1cm4gY291bnQ7Cj4gPj4+PiAgICAgICAgfQo+ID4+Pj4KPiA+Pj4+ICsgICAgIGlmICgh
c3RyY21wKGEtPmF0dHIubmFtZSwgImF0Z2NfYWdlX3RocmVzaG9sZCIpKSB7Cj4gPj4+PiArICAg
ICAgICAgICAgIGlmICh0IDwgMCkKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+Pj4+ICsgICAgICAgICAgICAgc2JpLT5hbS5hZ2VfdGhyZXNob2xkID0gdDsK
PiA+Pj4+ICsgICAgICAgICAgICAgaWYgKHNiaS0+YW0uYXRnY19lbmFibGVkKQo+ID4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAg
ICAgICAgaWYgKHRlc3Rfb3B0KHNiaSwgQVRHQykgJiYKPiA+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICBsZTY0X3RvX2NwdShzYmktPmNrcHQtPmVsYXBzZWRfdGltZSkgPj0gdCkgewo+ID4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIGlmIChmMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKSkKPiA+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0gdHJ1ZTsKPiA+Pj4+
ICsgICAgICAgICAgICAgfQo+ID4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gPj4+
PiArICAgICB9Cj4gPj4+PiArCj4gPj4+PiAgICAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1l
LCAiZ2Nfc2VnbWVudF9tb2RlIikpIHsKPiA+Pj4+ICAgICAgICAgICAgICAgIGlmICh0IDwgTUFY
X0dDX01PREUpCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+Z2Nfc2VnbWVudF9t
b2RlID0gdDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
