Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD849B8AC1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 06:48:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6kWc-0006sg-SY;
	Fri, 01 Nov 2024 05:48:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t6kWb-0006sa-Gq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 05:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tocm+9fQXJJcOvtJEq9rUApWO8EZrViX+kDeRul5gM0=; b=Js+E+P9YywaZiNCHcg5U8nH1wD
 chJz8UTD1za+GN/EF2StzDSCKLILeyd4D5BlPYz3gWNbTgLDINoaZTjy6fXvIxWF4MCyqxgfZPbro
 bv10fU77mXYRDWXkqMq38bjJzohCQ7gScEKMClwTBp1vQLZOqEpou19VCjvN0DPKJIT4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tocm+9fQXJJcOvtJEq9rUApWO8EZrViX+kDeRul5gM0=; b=YXwZAR2veNjynx/+c0zRZhZS6B
 mY23U5tzge45NMWVLwz5p9Ybi6GFluuUzfHHDG0pVGxVjcG7M7Qj1zYawjz7oilGPmkBADg20VWxZ
 G7UGPxGGY2wwXmXH18ZcDj+djBuXlfyHc7/NQUu+coE7HtnBgHUP9pDz+uX0OjfHqIoI=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t6kWb-0000ZP-Cn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 05:48:46 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37d4ee8d15aso118432f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Oct 2024 22:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730440114; x=1731044914; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tocm+9fQXJJcOvtJEq9rUApWO8EZrViX+kDeRul5gM0=;
 b=gHLxI8otjEn+QVszTB0nD37R5mPtwLmwu61kMFQzVOZxc5PtpjSm7OMTdOkhtEHaYn
 S9oFhOEYOPcAi8EPArzdyuPS7e+9xA5dQ7/koagqBJSfFDyfIbcmKpdM/CP3qIxHzULs
 e8HvhVqKGBcSYRSyr4MA0HL6mb4EpeZDi9u4mIo85dwJgpUPkCI7qRQr02sVo0EKQ0Dq
 9o73ssoQYNlTYR788lihUnmcL4SpL67To009Aug3RV9cVfs5rZWX4pNW0ezUPW5tUA7G
 tekpVJ7ERWIN2MxTa/ufXos2XPP0XErjA9uBqXsRNZJNv4//tzYEdjvJzSxyZnRwqie3
 lU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730440114; x=1731044914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tocm+9fQXJJcOvtJEq9rUApWO8EZrViX+kDeRul5gM0=;
 b=M9ACSz71xA+Lu2f+RBOB0gw7zmKwjyUNfxUU+hrFv6avO/AShndm7iLns+3FV/9Hff
 jW1lP/KAQasfR8ID6Z+/g8a7eBoL9DAIjQDcXAaGn9DqAtVIpXZKNCKAq6nHA4CBvioE
 DDuPunMCt0Wt4OBidWVKPw8mUwLESsivhTvOYeOLi9tdNhC8OvFNbtvxo5yhaDShV8iY
 GcHoUGuz47HTZjPgeCFwcuqU9gxMBW3hTopEJy9yzpllAQdKKrvs5H3qzSGUWgWwvhxT
 baE4k46u0QHBvPgvsa5NSrXCDkPLqqQ2hAzo2SL7TLS9c6kWVJe1aqX1V5j5pw6KjG1x
 jaAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRDR3g+cGWM5f6Dri6Wcx5rLh+GoEZ6tggEkQ/1OnEEl9GTm/e0fIxjmzIRsr38d2lrghbSJvhLl4yuLPn6/Dx@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxAdOh8bJKQFN4vDjAey+HE79wGDS2XZKDHI/KeIjofZW9+3L18
 oA7uFMcGOT+MgHFuy/Gein78ambNvF8ShBFkmkrB1PqEqNWR73q0EydsIhPG+UObvEDIoCQBtCG
 OzBXID4cFdmuu6L2WYHI+gF9MCeg=
X-Google-Smtp-Source: AGHT+IGLiqgrdhzH0+Qqr4PxQlkc+m8W6PfG2o5fVCbc8yQnEUgDRQ1v8Wd1Df8TSkcAlQ/SAmvjhvi+moj86g9SoYI=
X-Received: by 2002:a05:600c:3b8a:b0:42c:b8da:c79b with SMTP id
 5b1f17b1804b1-4319ad082c5mr83187225e9.5.1730440113534; Thu, 31 Oct 2024
 22:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <1730354393-19672-1-git-send-email-zhiguo.niu@unisoc.com>
 <1730354393-19672-2-git-send-email-zhiguo.niu@unisoc.com>
 <bf348748-46ba-47dd-a12d-5111be2df95e@kernel.org>
 <CAHJ8P3+VY6RYgrCPJRSjJp82qJaYGUyqR3vV3OGRO_Q774qxxw@mail.gmail.com>
In-Reply-To: <CAHJ8P3+VY6RYgrCPJRSjJp82qJaYGUyqR3vV3OGRO_Q774qxxw@mail.gmail.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 1 Nov 2024 13:48:22 +0800
Message-ID: <CAHJ8P3LFDBwgm1SUr3A3fNOLbP37vybPLuUJ=aYBtKgEh66BfQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Zhiguo Niu 于2024年11月1日周五 11:27写道： > > Chao
    Yu 于2024年11月1日周五 10:36写道： > > > > On 2024/10/31 13:59,
   Zhiguo Niu wrote: > > > If user give a file size as "length" p [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.50 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t6kWb-0000ZP-Cn
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix to adjust appropriate length
 for fiemap
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
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WmhpZ3VvIE5pdSA8bml1emhpZ3VvODRAZ21haWwuY29tPiDkuo4yMDI05bm0MTHmnIgx5pel5ZGo
5LqUIDExOjI35YaZ6YGT77yaCj4KPiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTl
ubQxMeaciDHml6XlkajkupQgMTA6MzblhpnpgZPvvJoKPiA+Cj4gPiBPbiAyMDI0LzEwLzMxIDEz
OjU5LCBaaGlndW8gTml1IHdyb3RlOgo+ID4gPiBJZiB1c2VyIGdpdmUgYSBmaWxlIHNpemUgYXMg
Imxlbmd0aCIgcGFyYW1ldGVyIGZvciBmaWVtYXAKPiA+ID4gb3BlcmF0aW9ucywgYnV0IHRoaXMg
c2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+ID4gPiBpdCB3aWxsIHNob3cgMiBzZWdt
ZW50cyBmaWVtYXAgcmVzdWx0cyBldmVuIHRoaXMgd2hvbGUgZmlsZQo+ID4gPiBpcyBjb250aWd1
b3VzIG9uIGRpc2ssIHN1Y2ggYXMgdGhlIGZvbGxvd2luZyByZXN1bHRzLCBwbGVhc2UKPiA+ID4g
bm90ZSB0aGF0IHRoaXMgZjJmc19pbyBoYXMgYmVlbiBtb2RpZmllZCBmb3IgdGVzdGluZy4KPiA+
ID4KPiA+ID4gICAuL2YyZnNfaW8gZmllbWFwIDAgMTkzMDQgeWxvZy9hbmFseXplci5weQo+ID4g
PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTkzMDQKPiA+ID4gICAgICAgICAgbG9naWNhbCBh
ZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPiA+ID4gMCAg
ICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAwMDAwMDAwMDAwNDAwMCAw
MDAwMTAwMAo+ID4gPiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAwMDAyMGJhZTAwMCAw
MDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4gPiA+Cj4gPiA+IGFmdGVyIHRoaXMgcGF0Y2g6Cj4g
PiA+ICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MzA0IHlsb2cvYW5hbHl6ZXIucHkKPiA+ID4gRmll
bWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MzA0Cj4gPiA+ICAgICAgIGxvZ2ljYWwgYWRkci4gICAg
cGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4gPiA+IDAgICAgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAwCj4g
Pgo+ID4gV2h5IGlzIEZJRU1BUF9FWFRFTlRfTEFTVCBtaXNzaW5nIGluICMwIGV4dGVudD8gQXMg
d2UgY2FuIHNlZSBpdAo+ID4gaW4gIzEgZXh0ZW50IGJlZm9yZSB5b3VyIGNoYW5nZS4KPiBIaSBD
aGFvLAo+IGZvciBub3JtYWwgZmllbWFwLCB3ZSBqdXN0ICBjYW4gdGFnICBGSUVNQVBfRVhURU5U
X0xBU1QgaW4gdGhlIGZvbGxvd2luZzoKPgo+IC8qIEhPTEUgKi8KPiBpZiAoIWNvbXByX2NsdXN0
ZXIgJiYgIShtYXAubV9mbGFncyAmIEYyRlNfTUFQX0ZMQUdTKSkgewo+IHN0YXJ0X2JsayA9IG5l
eHRfcGdvZnM7Cj4KPiBpZiAoYmxrc190b19ieXRlcyhpbm9kZSwgc3RhcnRfYmxrKSA8IGJsa3Nf
dG9fYnl0ZXMoaW5vZGUsCj4gbWF4X2lub2RlX2Jsb2Nrcyhpbm9kZSkpKQo+IGdvdG8gcHJlcF9u
ZXh0Owo+Cj4gZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9MQVNUOwo+IH0KPiBidXQgYWZ0ZXIgdGhp
cyBwYXRjaCwgaWYgZmlsZSBsZW5ndGggPSAxOTMwNCwgYmxrIGxlbiA9NShwYWdlIHNpemU9NDA5
NiksCj4gYW5kIGYyZnNfbWFwX2Jsb2NrcyB3aWxsIHJ1biBvbmNlIGlmIHRoZSBmaWxlIGlzICBj
b250aWd1b3VzIG9uIGRpc2ssCj4gYW5kIHdpbGwgdGFnCj4gRjJGU19NQVBfRkxBR1MgdG8gbWFw
Lm1fZmxhZ3MsIHNvIHRoZSBmb2xsb3dpbmcgY2FzZSB3aWxsIG5vdCBydW4uCj4gdGhlbgo+Cj4g
aWYgKHNpemUpIHsKPiBmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPiBpZiAoSVNfRU5D
UllQVEVEKGlub2RlKSkKPiBmbGFncyB8PSBGSUVNQVBfRVhURU5UX0RBVEFfRU5DUllQVEVEOwo+
Cj4gcmV0ID0gZmllbWFwX2ZpbGxfbmV4dF9leHRlbnQoZmllaW5mbywgbG9naWNhbCwKPiBwaHlz
LCBzaXplLCBmbGFncyk7Cj4gdHJhY2VfZjJmc19maWVtYXAoaW5vZGUsIGxvZ2ljYWwsIHBoeXMs
IHNpemUsIGZsYWdzLCByZXQpOwo+IGlmIChyZXQpCj4gZ290byBvdXQ7Cj4gc2l6ZSA9IDA7Cj4g
fQo+IGZpZW1hcF9maWxsX25leHRfZXh0ZW50IHdpbGwgcmV0dXJuIDEsIHRoZW4gZ28gb3V0ICwg
dGhpcyBmaWVtYXAgZmxvdyBmaW5pc2hlcy4KPgo+ID4KPiA+IDEgICAgICAgMDAwMDAwMDAwMDAw
NDAwMCAwMDAwMDAwMDIwYmFlMDAwIDAwMDAwMDAwMDAwMDEwMDAgMDAwMDEwMDEKPiBidXQgYmFj
ayB0byB0aGlzIGNhc2UsIGJlY2F1c2UKPgo+IG5leHQ6Cj4gbWVtc2V0KCZtYXAsIDAsIHNpemVv
ZihtYXApKTsKPiBtYXAubV9sYmxrID0gc3RhcnRfYmxrOwo+IG1hcC5tX2xlbiA9IGJ5dGVzX3Rv
X2Jsa3MoaW5vZGUsIGxlbik7Cj4gbWFwLm1fbmV4dF9wZ29mcyA9ICZuZXh0X3Bnb2ZzOwo+IG1h
cC5tX3NlZ190eXBlID0gTk9fQ0hFQ0tfVFlQRTsKPgo+IG1hcC5tX2xlbiB3aWxsIG5vdCAgcmVk
dWNlIHRoZSBwYXJ0IHRoYXQgaGFzIGJlZWQgbWFwZWQgZXZlbiBtYXAubV9sYmsKPiBoYXMgY2hh
bmdlZCwKPiBmb3IgZXhhbXBsZSwgaWYgZmlsZSBsZW5ndGggPSAxOTMwNCwgYmVmb3JlIHBhdGNo
LCBtYXAubV9sZW49NCwKPiBhZnRlciBvbmNlIGYyZnNfbWFwX2Jsb2NrLCAgbWFwLm1fbGJrPTQs
IG1hcC5tX2xlbiBzdGlsbCA9NCwgc28KPiB0aGVyZSB3aWxsIGJlICJIT0xFIiBjYXNlIGluIHRo
ZSBmb2xsb3ctdXAgZjJmc19tYXBfYmxvY2sKPiBzbyBpdCB3aWxsIGxvb3AgdW50aWwgc3RhcnRf
YmxrIHJlYWNoZXMgdGhlIG1heGJ5dGVzLgo+IC8qIEhPTEUgKi8KPiBpZiAoIWNvbXByX2NsdXN0
ZXIgJiYgIShtYXAubV9mbGFncyAmIEYyRlNfTUFQX0ZMQUdTKSkgewo+IHN0YXJ0X2JsayA9IG5l
eHRfcGdvZnM7Cj4KPiBpZiAoYmxrc190b19ieXRlcyhpbm9kZSwgc3RhcnRfYmxrKSA8IGJsa3Nf
dG9fYnl0ZXMoaW5vZGUsCj4gbWF4X2lub2RlX2Jsb2Nrcyhpbm9kZSkpKQo+IGdvdG8gcHJlcF9u
ZXh0Owo+Cj4gZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9MQVNUOwo+IH0KPgo+IHRoZXJlIGlzIGFu
b3RoZXIgY2FzZSBiZWZvcmUgdGhpcyBwYXRjaCwgZmlsZSBzaXplID0gNSBibG9ja3MsIGlmIHdl
Cj4gcGFzcyB0aGUgbGVuIG5vdAo+IGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byA177yMIGl0IHdp
bGwgbm90IHRhZyBGSUVNQVBfRVhURU5UX0xBU1QKPgo+ICAjIC4vZjJmc19pb19uZXcgZmllbWFw
IDAgNCBmaWxlLmFwawo+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSA0Cj4gICAgICAgICBsb2dp
Y2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+IDAg
ICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwNzBlMDhmMDAwIDAwMDAwMDAwMDAwMDQwMDAg
MDAwMDEwMDgKPgo+IGJ1dCBpZiBsZW4gZXF1YWwgb3IgZ3JlYXRlciB0aGFuIDUsICAgaXQgd2ls
bCB0YWcgRklFTUFQX0VYVEVOVF9MQVNUCj4gICMgLi9mMmZzX2lvX25ldyBmaWVtYXAgMCA1IGZp
bGUuYXBrCj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDUKPiAgICAgICAgIGxvZ2ljYWwgYWRk
ci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4gMCAgICAgICAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDA3MGUwOGYwMDAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMTAw
OAo+IDEgICAgICAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMDAwNzBlMDkwMDAwIDAwMDAwMDAwMDAw
MDEwMDAgMDAwMDEwMDEKPiB0aGFua3MhCkhpIENoYW8sIHBscyBpZ25vcmUgdGhpcyByZXBseSAs
IEkgd2lsbCBjb25maXJtIHlvdXIgcXVlc3Rpb25zLgp0aGFua3MgYSBsb3R+Cj4gPgo+ID4gVGhh
bmtzLAo+ID4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5p
dUB1bmlzb2MuY29tPgo+ID4gPiAtLS0KPiA+ID4gZjJmc19pbyBoYXMgYmVlbiBtb2RpZmllZCBm
b3IgdGVzdGluZywgdGhlIGxlbmd0aCBmb3IgZmllbWFwIGlzCj4gPiA+IHJlYWwgZmlsZSBzaXpl
LCBub3QgYmxvY2sgbnVtYmVyCj4gPiA+IC0tLQo+ID4gPiAgIGZzL2YyZnMvZGF0YS5jIHwgNCAr
Ky0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRh
LmMKPiA+ID4gaW5kZXggOTBmYThhYi4uOGM5YmI0MiAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPiA+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+ID4gQEAgLTE5NjYsOCArMTk2
Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFw
X2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gPiA+ICAgICAgIH0KPiA+ID4KPiA+ID4gLSAgICAgaWYgKGJ5dGVzX3RvX2Jsa3MoaW5v
ZGUsIGxlbikgPT0gMCkKPiA+ID4gLSAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlu
b2RlLCAxKTsKPiA+ID4gKyAgICAgaWYgKGxlbiAmIChibGtzX3RvX2J5dGVzKGlub2RlLCAxKSAt
IDEpKQo+ID4gPiArICAgICAgICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRl
cyhpbm9kZSwgMSkpOwo+ID4gPgo+ID4gPiAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtz
KGlub2RlLCBzdGFydCk7Cj4gPiA+ICAgICAgIGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgc3RhcnQgKyBsZW4gLSAxKTsKPiA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
