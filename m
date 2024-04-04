Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2196898DDA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Apr 2024 20:21:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsRhh-0007NX-ML;
	Thu, 04 Apr 2024 18:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rsRhg-0007NR-0e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 18:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hCTjSQ3G8vwzoqRaOEC3cHI2iX+8hi+olDPLQuDHRkA=; b=dlDDQkyEJdMIOWwVpRi4jNZOJa
 Twfgoekc0jWm/02E0RFUvmZT+AMNo0u31TfOVPSxOtiw3LunJzIwgbvGhXQ/UEmizk6Iz7gjAuiRT
 Li7AMBkWCt1Z7ew/1htjz+FMBtQy9GVLdkdSoRimjj41fWpX2Kco6sXxD/JkV5wBN+OI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hCTjSQ3G8vwzoqRaOEC3cHI2iX+8hi+olDPLQuDHRkA=; b=Ws1g8EsS4r/icw26IGsFdiYep/
 5wBPtdRZ7aozmkMuYcy8fJuebgB8l6fU/hhS1AeOu+2wr4RG4htoAP1a+SvradcL8pzc27ZfGf8pc
 /tFGZ2Gyyfo85LVEWVy0pU3GlESN45n2rYPdr+FjeHAAIBrk7ot/uM+rZQJaBTOmXInU=;
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rsRhf-0006Jh-99 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 18:20:48 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5a7bbafb8c0so653152eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 Apr 2024 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712254842; x=1712859642; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCTjSQ3G8vwzoqRaOEC3cHI2iX+8hi+olDPLQuDHRkA=;
 b=C6F1emoiVy4bcoHZcyKJGDFt0LjECknxYQWo6lfoYat6CqkPphIhgo+mGJVCVHE412
 ulQ1e8fkSadz8j14s7NzvKf/pLir+Qym+CBru1vh3WQADUAesC1cmXy2fINAXAs2p5um
 26fcXKDVr98uX48bDyccm1kUzT02OKfqGMVjvjWlQ7D+Su11jZ87Uwk7cqanVjzdQ+YO
 f/oKQ/2nEuF5acHi3SsmJnreBP+MB2XXKc9oZXNRmIq5ORki0Cv/Vgl9G3TNPoUI7kjK
 3WpHkZDGyxs7Vxfqdcg8TQ0umsJ4pU5IuMzh+yahh4y9fHutFfKdCR7KcV2wbo5EvyFY
 pijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712254842; x=1712859642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCTjSQ3G8vwzoqRaOEC3cHI2iX+8hi+olDPLQuDHRkA=;
 b=UiI3CngMjZ2ImSyJpyS1OjwwmcV0tNHskUNIo0EEeKd9raBtszyatYrepknYb+p8wy
 k2xpC7pnKuA2dmmxdg6Hi2o0XyVmtrm5Z8/W1sI8FGWJmxWHxgWE3XWEKZVj7NX9EfIa
 LmmtPAthiNs0igYLJsy7x9MGrogCxz4OPUHtPP3rP7vuFJZAvLSOftd6oB1kA2cyO7lw
 G+EsR1NLP+N1ATlUifiGmlKSkyf8fYG8Ss0OY66RSwhg148ASFePMFppFzJJvCxi6zSe
 c+1XUAqEmnioPGlySY2LRHMAld8G3yRHeE3+CBb4ivK+sxodOpVZzGUUHY9mSp6oUDVE
 NncQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4qs12E6g2TUhWAJZbwkleESmuWcq8JU4kIHvNgchn6Fw/+X8TxYhVDko3VCI7JovSKErqAmcm9td0yM3y0D8RcqEOHVGAWGc1VMs+aBtQ0SC5R+e3rA==
X-Gm-Message-State: AOJu0YzK6qTm+jQdmeRUTsUGkqK7ndxqDkF6lgkHFT/iP3Sw+lvM9UWT
 Sap3x7w7ZzKhagFPW1N8MF21Cj/chnNAfKLmh/YnE/vilC5PdaFv+6Hag4vmGc//XnCMr6YSTna
 Vnwq4D8M0ZC9Utx1MO2xOYcrLJMs=
X-Google-Smtp-Source: AGHT+IHPGeiiu47FUDDpgQkoqFhZCWQZi6JtgKQDL5jzut6zhAA+ynl+4+e/MN9+fvRi/yVxkuseDfV7OtF4U6xIPZ4=
X-Received: by 2002:a05:6359:45a9:b0:17f:56c9:95e4 with SMTP id
 no41-20020a05635945a900b0017f56c995e4mr3484609rwb.7.1712254841826; Thu, 04
 Apr 2024 11:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240328072136.3023135-1-chao@kernel.org>
In-Reply-To: <20240328072136.3023135-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 4 Apr 2024 11:20:30 -0700
Message-ID: <CACOAw_w0YgVtGGdb-2DQ6ROCc7YyXETWxWPiAB+D0qHt369fQQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Mar 28, 2024 at 12:23 AM Chao Yu wrote: > > From:
    Wenjie Qi > > If the max open zones of zoned devices are less than > the
   active logs of F2FS, the device may error due to > insufficient [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.161.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.161.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rsRhf-0006Jh-99
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: fix zoned block device information
 initialization
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
Cc: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTI6MjPigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gRnJvbTogV2VuamllIFFpIDxxd2podXN0QGdtYWlsLmNvbT4KPgo+IElm
IHRoZSBtYXggb3BlbiB6b25lcyBvZiB6b25lZCBkZXZpY2VzIGFyZSBsZXNzIHRoYW4KPiB0aGUg
YWN0aXZlIGxvZ3Mgb2YgRjJGUywgdGhlIGRldmljZSBtYXkgZXJyb3IgZHVlIHRvCj4gaW5zdWZm
aWNpZW50IHpvbmUgcmVzb3VyY2VzIHdoZW4gbXVsdGlwbGUgYWN0aXZlIGxvZ3MKPiBhcmUgYmVp
bmcgd3JpdHRlbiBhdCB0aGUgc2FtZSB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFp
IDxxd2podXN0QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gdjY6Cj4gLSBhZGQgY2hlY2sgY29uZGl0aW9uIHRvIGF2b2lkIHJlbW91
bnQgZmFpbHVyZS4KPiAgZnMvZjJmcy9mMmZzLmggIHwgIDEgKwo+ICBmcy9mMmZzL3N1cGVyLmMg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2Yy
ZnMuaAo+IGluZGV4IDA1NTA5MjlkYzZlNS4uNjk0ZjhhNTJjYjg0IDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtMTU1OSw2ICsxNTU5LDcg
QEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4KPiAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVE
Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgYmxvY2tzX3Blcl9ibGt6OyAgICAgICAgICAgLyogRjJG
UyBibG9ja3MgcGVyIHpvbmUgKi8KPiArICAgICAgIHVuc2lnbmVkIGludCBtYXhfb3Blbl96b25l
czsgICAgICAgICAgICAvKiBtYXggb3BlbiB6b25lIHJlc291cmNlcyBvZiB0aGUgem9uZWQgZGV2
aWNlICovCj4gICNlbmRpZgo+Cj4gICAgICAgICAvKiBmb3Igbm9kZS1yZWxhdGVkIG9wZXJhdGlv
bnMgKi8KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4g
aW5kZXggN2M0NTkyOTY3MWFkLi42NDI1NDA3ODI0NzEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9z
dXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTIzMjYsNiArMjMyNiwxNyBAQCBz
dGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdz
LCBjaGFyICpkYXRhKQo+ICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgZ290byBy
ZXN0b3JlX29wdHM7Cj4KPiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4gKyAgICAgICBp
ZiAoZjJmc19pc19tdWx0aV9kZXZpY2Uoc2JpKSAmJgoKV2h5IGRvIHdlIGNoZWNrIG11bHRpcGxl
IGRldmljZXMnIGNvbmRpdGlvbiBoZXJlPwoKVGhhbmtzLAoKPiArICAgICAgICAgICAgICAgc2Jp
LT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpIHsKPiArICAg
ICAgICAgICAgICAgZjJmc19lcnIoc2JpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICJ6b25l
ZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0IGxlYXN0ICV1IG9wZW4g
em9uZXMiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X29wZW5f
em9uZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+ICsgICAgICAgICAgICAgICBl
cnIgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICBnb3RvIHJlc3RvcmVfb3B0czsKPiArICAg
ICAgIH0KPiArI2VuZGlmCj4gKwo+ICAgICAgICAgLyogZmx1c2ggb3V0c3RhbmRpbmcgZXJyb3Jz
IGJlZm9yZSBjaGFuZ2luZyBmcyBzdGF0ZSAqLwo+ICAgICAgICAgZmx1c2hfd29yaygmc2JpLT5z
X2Vycm9yX3dvcmspOwo+Cj4gQEAgLTM4NjgsMTEgKzM4NzksMjQgQEAgc3RhdGljIGludCBpbml0
X2Jsa3pfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpKQo+ICAgICAgICAg
c2VjdG9yX3QgbnJfc2VjdG9ycyA9IGJkZXZfbnJfc2VjdG9ycyhiZGV2KTsKPiAgICAgICAgIHN0
cnVjdCBmMmZzX3JlcG9ydF96b25lc19hcmdzIHJlcF96b25lX2FyZzsKPiAgICAgICAgIHU2NCB6
b25lX3NlY3RvcnM7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4gICAg
ICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBpZiAoIWYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gKyAgICAgICBpZiAoYmRldl9pc196b25l
ZChGREVWKGRldmkpLmJkZXYpKSB7Cj4gKyAgICAgICAgICAgICAgIG1heF9vcGVuX3pvbmVzID0g
YmRldl9tYXhfb3Blbl96b25lcyhiZGV2KTsKPiArICAgICAgICAgICAgICAgaWYgKG1heF9vcGVu
X3pvbmVzICYmIChtYXhfb3Blbl96b25lcyA8IHNiaS0+bWF4X29wZW5fem9uZXMpKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X29wZW5fem9uZXMgPSBtYXhfb3Blbl96b25lczsK
PiArICAgICAgICAgICAgICAgaWYgKHNiaS0+bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihz
YmkpLmFjdGl2ZV9sb2dzKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIoc2Jp
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInpvbmVkOiBtYXggb3BlbiB6b25l
cyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm1heF9vcGVuX3pvbmVzLCBGMkZTX09QVElP
TihzYmkpLmFjdGl2ZV9sb2dzKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHpvbmVf
c2VjdG9ycyA9IGJkZXZfem9uZV9zZWN0b3JzKGJkZXYpOwo+ICAgICAgICAgaWYgKHNiaS0+Ymxv
Y2tzX3Blcl9ibGt6ICYmIHNiaS0+YmxvY2tzX3Blcl9ibGt6ICE9Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBTRUNUT1JfVE9fQkxPQ0soem9uZV9zZWN0b3JzKSkKPiBAQCAtNDE4
Niw2ICs0MjEwLDkgQEAgc3RhdGljIGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpCj4KPiAgICAgICAgIGxvZ2ljYWxfYmxrc2l6ZSA9IGJkZXZfbG9naWNhbF9i
bG9ja19zaXplKHNiaS0+c2ItPnNfYmRldik7Cj4gICAgICAgICBzYmktPmFsaWduZWRfYmxrc2l6
ZSA9IHRydWU7Cj4gKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ICsgICAgICAgc2JpLT5t
YXhfb3Blbl96b25lcyA9IFVJTlRfTUFYOwo+ICsjZW5kaWYKPgo+ICAgICAgICAgZm9yIChpID0g
MDsgaSA8IG1heF9kZXZpY2VzOyBpKyspIHsKPiAgICAgICAgICAgICAgICAgaWYgKGkgPT0gMCkK
PiAtLQo+IDIuNDAuMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
