Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EB86F8EA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 04:33:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rgz54-0006C2-Cp;
	Mon, 04 Mar 2024 03:33:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rgz50-0006Bs-2U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 03:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXzQeUxGWlBH373XqQNyUnK789ftXqphQPOVNjBeEBo=; b=HMyPYqybaGco+68BG/HPWzVAVz
 oMBNJ2rkoApPT2GsMz90ogGaIf4ktWkIlAQytn2IIjYUNkeviOaIzR9M88KHvvxzWSMPbO21BoyJG
 Vwu7qmN3eYym3h73vtOeflTz6uT9aigvLROBE560nM8gGmF4lNkOtA93iByIDsu52GwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXzQeUxGWlBH373XqQNyUnK789ftXqphQPOVNjBeEBo=; b=VVEG69GqokiJsnDimZJlAPBMRx
 C+gjR7uPulhfCofG+P5TIXIXKpknt/BqqDkAIHg0ZZvmE8HMf28QV8aLiEJibG5v7crje/NVeCAI4
 QREjmjcPhZ+qGtmniViglITqsPCikeam33kdgDCIgFkDh9jK/XfGmmDwS7INu/Fa+jWQ=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rgz4p-0005ee-Hm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 03:33:30 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so6993757a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Mar 2024 19:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709523194; x=1710127994; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXzQeUxGWlBH373XqQNyUnK789ftXqphQPOVNjBeEBo=;
 b=i/Iuq80xyf+RXDMxivUAix0j4nUwZjLAb/e6Nrkmdrg+CdNAs6P32Ud2HgMz1cAFQ9
 3tidUd+AhWay/dtFM5TxSs3XqB6BboN+TuB6NJtX0ob2fsgG2xe7qVD+AjSeHA0Zb931
 vIoVNRoVoJ80XOQ3wdrmx2eR9R7/dzDJpvHayPlDLptUSLLcedAa6JhTBd12Xkqb4As4
 CpgDujynfOUzszfM/w3QgC7LUWsO0dlkpjCfPXPg0spIkggtkwsZazv+kzRe8H2n/Cco
 r6jVyme++bJUM/gLpg7WY36Q5eK2S+mTZs6W1lafk/+slR2Cg5Vsu8N3xmawZfnXSEql
 78tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709523194; x=1710127994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXzQeUxGWlBH373XqQNyUnK789ftXqphQPOVNjBeEBo=;
 b=KTTX0DEL/jKsYmFl10NfFs8A6UXQYvzhPABFrNjRKqijwZ/3y/ePL+s+2Ir6tbKUO5
 ANswCWm5UrxgKcj42z6qzWPZpjQrvkRCvBmVPzdYMzO1Mztu+wLyuXMtAvRBPL5CsWBy
 Y4GN/RZGqNoYeMTNtAbRPcCD7j9d3ucAcxgweWS2llpkzfu1Emjwkyb3uUr6MLgTZOi0
 xX2nt5tWj6ETnCMtX1bi/2GBFDa99bR8y8nw+346SIHqA9y+AXUHNPTFFl2B3K40Ur+k
 KGecAeReESQOLd5p1+kHnl3ZZyiTNi9VY4kb1IXh3gi7IxD6cFOrQxmSIeFP2DirUmcL
 XAHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX29t0+cnBRjesAlvwhE8VvCYbaMaEeI0JryUAQJAg9wXBUGvTIYEwG7kM/0eWj8n6xydcEfccc1kuNkrZxjxWQBdm8Gxes66rIBENRY5GY9RG8YCElYw==
X-Gm-Message-State: AOJu0Yw5rmTsqIAQ1LGIg1GV8XgMhDRC5NysCOWkGICq4r2QN1Pz0c2N
 Oax+l4q7wx2M23s/tEznwfvcSRPnhqrpr5q9+OtZfdPnEr8td+E1iOC03Ddz6Qr7EO2cFhZkR9K
 9etdzeC+44cBQgBxFhjRki7mZsmc=
X-Google-Smtp-Source: AGHT+IGz17seY6e3eCF7vnfl/hLXBedWth7fLNremT2TxQNnVfPVBrGM5Yn9Oe2DilkB1RlOTX6QmqJoOTapi29PXCQ=
X-Received: by 2002:aa7:d517:0:b0:566:78ff:b24e with SMTP id
 y23-20020aa7d517000000b0056678ffb24emr7172003edq.17.1709523193979; Sun, 03
 Mar 2024 19:33:13 -0800 (PST)
MIME-Version: 1.0
References: <1709292976-13118-1-git-send-email-zhiguo.niu@unisoc.com>
 <7dc371ad-2448-4dd4-9551-8caef0a00d48@kernel.org>
In-Reply-To: <7dc371ad-2448-4dd4-9551-8caef0a00d48@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 4 Mar 2024 11:33:02 +0800
Message-ID: <CAHJ8P3+ZBuBu9Sdpm_6fxhY2sVyu97dXFKKLdtEF4shi_3Fs1Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 4, 2024 at 11:19 AM Chao Yu wrote: > > On 2024/3/1
    19:36, Zhiguo Niu wrote: > > new_curseg may return error if get_new_segment
    fail, so its result > > should be check in its caller f2f [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.50 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rgz4p-0005ee-Hm
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check result of new_curseg in
 f2fs_allocate_segment_for_resize
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgNCwgMjAyNCBhdCAxMToxOeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzMvMSAxOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IG5l
d19jdXJzZWcgbWF5IHJldHVybiBlcnJvciBpZiBnZXRfbmV3X3NlZ21lbnQgZmFpbCwgc28gaXRz
IHJlc3VsdAo+ID4gc2hvdWxkIGJlIGNoZWNrIGluIGl0cyBjYWxsZXIgZjJmc19hbGxvY2F0ZV9z
ZWdtZW50X2Zvcl9yZXNpemUsCj4gPiBhbG9zIHBhc3MgdGhpcyByZXN1bHRzIHRvIGZyZWVfc2Vn
bWVudF9yYW5nZS4KPgo+IFpoaWd1bywKPgo+IFdoYXQgYWJvdXQgaGFuZGxpbmcgYWxsIGVycm9y
IHBhdGhzIG9mIG5ld19jdXJzZWcoKSBhbmQgY2hhbmdlX2N1cnNlZygpCj4gaW4gb25lIHBhdGNo
PwpEZWFyIENoYW8sCgpEbyB5b3UgbWVhbiB0byBtZXJnZSBpdCB3aXRoIHRoZSBwcmV2aW91cyBw
YXRjaCDigJxmMmZzOiBmaXggdG8gY2hlY2sKcmV0dXJuIHZhbHVlIG9mIGYyZnNfZ2NfcmFuZ2Xi
gJ0/CkJlY2F1c2UgaW4gYWRkaXRpb24gdG8gbmV3X2N1cnNlZy9jaGFuZ2VfY3Vyc2VnIGVycm9y
IGhhbmRsaW5nLCB0aGVyZQphcmUgc29tZSBvdGhlciBjaGFuZ2VzIGluIHRoZSBwcmV2aW91cyBw
YXRjaC4KYmVzaWRlcywgSSBzZWFyY2hlZCBmb3IgbmV3IHJlbGF0ZWQgY29kZXMsIGFuZCB0aGVy
ZSBzaG91bGQgYmUgdGhlCm9ubHkgcGxhY2UgbGVmdCB3aXRob3V0IGVycm9yIGhhbmRsaW5nIGFi
b3V0IG5ld19jdXJzZWcvCmNoYW5nZV9jdXJzZWcgLgoKdGhhbmtzIQo+Cj4gVGhhbmtzLAo+Cj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+
ID4gLS0tCj4gPiAgIGZzL2YyZnMvZjJmcy5oICAgIHwgMiArLQo+ID4gICBmcy9mMmZzL2djLmMg
ICAgICB8IDcgKysrKystLQo+ID4gICBmcy9mMmZzL3NlZ21lbnQuYyB8IDkgKysrKysrKy0tCj4g
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gaW5k
ZXggNDMzMTAxMi4uMzlkZGE3ZCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiAr
KysgYi9mcy9mMmZzL2YyZnMuaAo+ID4gQEAgLTM3MDEsNyArMzcwMSw3IEBAIHZvaWQgZjJmc19j
bGVhcl9wcmVmcmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgdm9p
ZCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiAg
IHZvaWQgZjJmc19zYXZlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+
ID4gICB2b2lkIGYyZnNfcmVzdG9yZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKTsKPiA+IC12b2lkIGYyZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4gPiAraW50IGYyZnNfYWxsb2NhdGVfc2VnbWVu
dF9mb3JfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzdGFydCwgdW5z
aWduZWQgaW50IGVuZCk7Cj4gPiAgIGludCBmMmZzX2FsbG9jYXRlX25ld19zZWN0aW9uKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsIGJvb2wgZm9yY2UpOwo+ID4gICBpbnQgZjJm
c19hbGxvY2F0ZV9waW5uaW5nX3NlY3Rpb24oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPiA+IGluZGV4IGM2MGI3
NDcuLjdhNDU4ZmEgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+ICsrKyBiL2ZzL2Yy
ZnMvZ2MuYwo+ID4gQEAgLTIwMzcsOCArMjAzNywxMSBAQCBzdGF0aWMgaW50IGZyZWVfc2VnbWVu
dF9yYW5nZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiAgICAgICBtdXRleF91bmxvY2so
JkRJUlRZX0koc2JpKS0+c2VnbGlzdF9sb2NrKTsKPiA+Cj4gPiAgICAgICAvKiBNb3ZlIG91dCBj
dXJzZWdzIGZyb20gdGhlIHRhcmdldCByYW5nZSAqLwo+ID4gLSAgICAgZm9yICh0eXBlID0gQ1VS
U0VHX0hPVF9EQVRBOyB0eXBlIDwgTlJfQ1VSU0VHX1BFUlNJU1RfVFlQRTsgdHlwZSsrKQo+ID4g
LSAgICAgICAgICAgICBmMmZzX2FsbG9jYXRlX3NlZ21lbnRfZm9yX3Jlc2l6ZShzYmksIHR5cGUs
IHN0YXJ0LCBlbmQpOwo+ID4gKyAgICAgZm9yICh0eXBlID0gQ1VSU0VHX0hPVF9EQVRBOyB0eXBl
IDwgTlJfQ1VSU0VHX1BFUlNJU1RfVFlQRTsgdHlwZSsrKSB7Cj4gPiArICAgICAgICAgICAgIGVy
ciA9IGYyZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHNiaSwgdHlwZSwgc3RhcnQsIGVu
ZCk7Cj4gPiArICAgICAgICAgICAgIGlmIChlcnIpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4gPiArICAgICB9Cj4gPgo+ID4gICAgICAgLyogZG8gR0MgdG8gbW92ZSBvdXQg
dmFsaWQgYmxvY2tzIGluIHRoZSByYW5nZSAqLwo+ID4gICAgICAgZXJyID0gZjJmc19nY19yYW5n
ZShzYmksIHN0YXJ0LCBlbmQsIGRyeV9ydW4sIDApOwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IGluZGV4IDFiYjMwMTkuLjJhMDdiOWQg
MTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gKysrIGIvZnMvZjJmcy9zZWdt
ZW50LmMKPiA+IEBAIC0zMDcxLDExICszMDcxLDEyIEBAIHN0YXRpYyBib29sIG5lZWRfbmV3X3Nl
ZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlKQo+ID4gICAgICAgcmV0dXJuIGZh
bHNlOwo+ID4gICB9Cj4gPgo+ID4gLXZvaWQgZjJmc19hbGxvY2F0ZV9zZWdtZW50X2Zvcl9yZXNp
emUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiA+ICtpbnQgZjJmc19hbGxv
Y2F0ZV9zZWdtZW50X2Zvcl9yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlw
ZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHN0YXJ0LCB1bnNpZ25lZCBpbnQgZW5kKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgY3Vyc2Vn
X2luZm8gKmN1cnNlZyA9IENVUlNFR19JKHNiaSwgdHlwZSk7Cj4gPiAgICAgICB1bnNpZ25lZCBp
bnQgc2Vnbm87Cj4gPiArICAgICBpbnQgZXJyID0gMDsKPiA+Cj4gPiAgICAgICBmMmZzX2Rvd25f
cmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4gPiAgICAgICBtdXRleF9sb2NrKCZjdXJz
ZWctPmN1cnNlZ19tdXRleCk7Cj4gPiBAQCAtMzA4OSw3ICszMDkwLDEwIEBAIHZvaWQgZjJmc19h
bGxvY2F0ZV9zZWdtZW50X2Zvcl9yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQg
dHlwZSwKPiA+ICAgICAgICAgICAgICAgY2hhbmdlX2N1cnNlZyhzYmksIHR5cGUpOwo+ID4gICAg
ICAgZWxzZQo+ID4gICAgICAgICAgICAgICBuZXdfY3Vyc2VnKHNiaSwgdHlwZSwgdHJ1ZSk7Cj4g
PiAtCj4gPiArICAgICBpZiAoY3Vyc2VnLT5zZWdubyA9PSBOVUxMX1NFR05PKSB7Cj4gPiArICAg
ICAgICAgICAgIGVyciA9IC1FTk9TUEM7Cj4gPiArICAgICAgICAgICAgIGdvdG8gdW5sb2NrOwo+
ID4gKyAgICAgfQo+ID4gICAgICAgc3RhdF9pbmNfc2VnX3R5cGUoc2JpLCBjdXJzZWcpOwo+ID4K
PiA+ICAgICAgIGxvY2F0ZV9kaXJ0eV9zZWdtZW50KHNiaSwgc2Vnbm8pOwo+ID4gQEAgLTMxMDIs
NiArMzEwNiw3IEBAIHZvaWQgZjJmc19hbGxvY2F0ZV9zZWdtZW50X2Zvcl9yZXNpemUoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiA+Cj4gPiAgICAgICBtdXRleF91bmxvY2so
JmN1cnNlZy0+Y3Vyc2VnX211dGV4KTsKPiA+ICAgICAgIGYyZnNfdXBfcmVhZCgmU01fSShzYmkp
LT5jdXJzZWdfbG9jayk7Cj4gPiArICAgICByZXR1cm4gZXJyOwo+ID4gICB9Cj4gPgo+ID4gICBz
dGF0aWMgaW50IF9fYWxsb2NhdGVfbmV3X3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBpbnQgdHlwZSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
