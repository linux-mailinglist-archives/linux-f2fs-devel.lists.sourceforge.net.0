Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FDA838BF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 07:57:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2kv2-0000f0-Ug;
	Thu, 10 Apr 2025 05:57:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u2kv1-0000es-2x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7HXWa2ZllTNIQK517I8cf2Dkabt9cIzMnBH/TCP5RJg=; b=WaQBmhxvXJJkaFWNxCoO4ALH6m
 a3LrO8l2db5fsR5QMT0JES5BwxH8i7Ia95t5F1YEJ/0w+LKiYbg9HS/H1O8H1tU6ytT5eoSZr0Zdj
 F6rxngfLxd1Mqj+wKTq/0rWjAIMASSqTzAFwYmvBIYXdlazSrlX/Zxu6xubxAENGldJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7HXWa2ZllTNIQK517I8cf2Dkabt9cIzMnBH/TCP5RJg=; b=ELRK5I637TkvGmD42yVweOCREO
 BHP7728mmZ9j+AtgwbQNnZY3TMtjKntqjgHo/+mqWGvPuO4miQDtYV/D5tBwOR9oYma/Rl5XOE8Ix
 4L4Db3yKmuVn2FbA0F+vh7gzYOuSqXGCWiKpbB7zABiyE5GWsAW9aZ/NfIVp+cVBbnUE=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u2kuk-0000Yt-NP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:57:42 +0000
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so654049a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Apr 2025 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744264635; x=1744869435; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HXWa2ZllTNIQK517I8cf2Dkabt9cIzMnBH/TCP5RJg=;
 b=WXS1Y0MRmlI+ckQG29Sj5UCfuP533kx6s9XVUsCeeSuI4TD5M9Mi4Ki3PFjMa8uPex
 Zk1QivlmU6KC1AoiIMrsF0TiECUcxsEGTeA5/oudIW09gSkaifGVPne5nZpsc0bjUjjS
 oZVT6Syjo7LGlfurezySkPFeqxSHWVFy4gTLh4vDykBUltcMU7MYzuyBA8YJsMqZRutk
 1gMw1h+s/1uOdIeAo6fgWre+iktdkFrsXzapgo+kwoqAbpfVpsgkF17mOgUhAVZkmw1y
 O3k0T8+WLtIThj221Izudli+r8xANzIj5pRYCrXIPOVXlWeFgwVi6xYLafwi9nE8YHyt
 CyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744264635; x=1744869435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HXWa2ZllTNIQK517I8cf2Dkabt9cIzMnBH/TCP5RJg=;
 b=rGldnTR73uxFWA0JYF6cgnxKllrvd9eb/gR/KnsNaLVEFccFu1NEUhoWPyKNqN+SM3
 a0Zs5/LSPJNUEgdDTvbvtZVwr9Eq7eke9V7+hLlWsVQwIIzJW4pQ4Vgfo3/GzQ5VrpQ2
 PZOU+a/8J7TzM7nggJaLaE3D9Lm65WQptRUAU7OKiK510dodxCZMSt2pTQj8xIvS2A5V
 5Pt/n0pw3rK3RAQtln+q28d1tnl1o+Zn9rkW1xOgsTEoOcyNwVyBYPAaydHSBRlKxho9
 1NRHupLeqUY0HY51CFfVFDER2IVIeKLwoDTw9Iu1hy8Nge5M1gC0bHtqnYkSTJi9TXcl
 /8UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG8adbnVeLMuc3wl2WuLcOFLV7wmWu43nuzmPswOmHy0x02Hxa3gQT9A47UTEKmet1AoOVfs0+nPG0gFMBmDR0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzRLBbCmSB9e1IB748AeZpIDsQRkEsi23Zlv/y4VksRkzJc1qlT
 hyGG38Nxg8n9Hb9IDCu7DYcUUDqrUflwsvdk4yw7QRL4FP92TsA+aGcwZ6WjRZvPrhltDudiKB3
 pY/L0TZL9YgPFmuLsXi7ZcJND7BqfGqVFDhE=
X-Gm-Gg: ASbGnctESjSz6HxPam1BwUPd93Ayign4HJ8/B7so8xY/aZtKAjDRUPZEVz+W1Wl3qJF
 O8rlwI39YMGlyynoloImTJYasiLXL9DDzaOmLLHbYaboy2PumMSnKkejOZqqXslV25aA6SB6q8l
 ji1CGFETBnKMWTDIBjTi6Gjuk=
X-Google-Smtp-Source: AGHT+IGfTt2V9rdKM46ytwcR7Ksh6s1p9tPg2XjdREhCe9MSchzLfuDT9ajW0cKXDgNUxsyoMClRPvBjJzfUK70b3NI=
X-Received: by 2002:a17:907:1c94:b0:aca:a171:8ae4 with SMTP id
 a640c23a62f3a-acabd129fcdmr75936166b.9.1744264634955; Wed, 09 Apr 2025
 22:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
In-Reply-To: <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Wed, 9 Apr 2025 22:57:03 -0700
X-Gm-Features: ATxdqUHbUWWEsU3N8Pr46LtgCy9LWaofDCQSSlPe7Q49qrowNn7Vr6C7avMd6t8
Message-ID: <CAD14+f3CQr2FgUc8Ut6=O0gOd6cAmYyadSNBt9SVnishdzc4kQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao, On Wed, Apr 9, 2025 at 10:52 PM Chao Yu wrote:
   > > On 4/6/25 16:30, Juhyung Park wrote: > > Hi all, > > > > I also encountered
    something similar a while back with resizing but > > didn't report it [...]
    
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: arter97.com]
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.47 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.47 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1u2kuk-0000Yt-NP
Subject: Re: [f2fs-dev] Resize metadata corruption
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
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCk9uIFdlZCwgQXByIDksIDIwMjUgYXQgMTA6NTLigK9QTSBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gNC82LzI1IDE2OjMwLCBKdWh5dW5nIFBhcmsgd3Jv
dGU6Cj4gPiBIaSBhbGwsCj4gPgo+ID4gSSBhbHNvIGVuY291bnRlcmVkIHNvbWV0aGluZyBzaW1p
bGFyIGEgd2hpbGUgYmFjayB3aXRoIHJlc2l6aW5nIGJ1dAo+ID4gZGlkbid0IHJlcG9ydCBpdCBh
bmQganVzdCBtYW51YWxseSBtaWdyYXRlZCB0aGUgZmlsZXMuCj4KPiBIaSBKdWh5dW5nLAo+Cj4g
RGlkIHlvdSBkZXZlbG9wIGFuIGluZGl2aWR1YWwgdG9vbCB0byBtaWdyYXRlIHNwZWNpZmllZCBp
bm9kZSB0byB0YXJnZXQKPiBibG9jayBhZGRyZXNzPwoKTm9wZS4gQW5kIG5laXRoZXIgZGlkIEB1
cGxpbmtyIHVzZSBhbnkgY3VzdG9tIHRvb2xzIHRvIG1lc3MgYXJvdW5kIHRoZQpmMmZzIHBhcnRp
dGlvbi4KCj4KPiA+IEkgYXNzaXN0ZWQgaGltIHRvIGVuc3VyZSB1c2luZyB0aGUgbGF0ZXN0IGtl
cm5lbC9mMmZzLXRvb2xzLCBidXQgaGlzCj4gPiBtZXRhZGF0YSBzZWVtcyBwcmV0dHkgYmFkIHJp
Z2h0IG5vdyBhbmQgSSBzdWdnZXN0ZWQgaGltIHRvIGFzayB0aGUKPiA+IG1haWxpbmcgbGlzdCBk
aXJlY3RseS4KPgo+IEkgY2hlY2tlZCB0aGUgbG9nLCBJIGd1ZXNzIGl0IGFjdHVhbGx5IHNlZW1z
IHByZXR0eSBiYWQuLi4gSSBndWVzcyB3ZQo+IG5lZWQgdG8gZmluZCBvdXQgdGhvc2UgZmlsZSB3
aGljaCBoYXMgbm90IGJlZW4gbWlncmF0ZWQgY29ycmVjdGx5LCBhbmQKPiB0cnkgdG8gY29ycmVj
dCB0aGVtLCBtYXkgYmUgdy8gYSBuZXcgdG9vbC4KClllYWgsIGhhdmluZyBmc2NrLmYyZnMgc2Vn
ZmF1bHQgbWlkLXdheSBwb3N0IHJlc2l6ZSB3b24ndCBoZWxwIGVpdGhlci4KCj4KPiBUbyBKYWVn
ZXVrLCBhbnkgdGhvdWdodHMgYWJvdXQgdGhpcyBwcm9ibGVtPwo+Cj4gPgo+ID4gVGhlIFVSTCB0
aGVyZSBzaG91bGQgYmUgaHR0cHM6Ly9hcnRlcjk3LmNvbS8uZjJmcy0yMDI1MDQwNi9mc2NrLmxv
ZyAsCj4gPiBhIGxpdHRsZSB0eXBvIHRoZXJlLgo+Cj4gVGhhbmtzLCBJIGRpZG4ndCBub3RpY2Ug
dGhpcyBwcmV2aW91c2x5Lgo+Cj4gPgo+ID4gQ2FuIHdlIGhhdmUgc29tZSBzb3J0IG9mIENJL2F1
dG9tYXRlZCB0ZXN0aW5nIGZvciB0aGUgcmVzaXppbmcgYXMgd2VsbD8KPgo+IEFncmVlZCwgd2ls
bCB3b3JrIG9uIHNvbWUgdGVzdGNhc2VzIGZvciByZXNpemUuZjJmcyB3aGVuIEkgZ2V0IHNvbWUg
ZnJlZQo+IHNsb3RzLgoKU2hvdWxkIHdlIG1hcmsgdGhpcyBleHBlcmltZW50YWwgZm9yIHRoZSB0
aW1lIGJlaW5nPwoKVGhhbmtzLgoKPgo+IFRoYW5rcywKPgo+ID4KPiA+IFRoYW5rcy4KPiA+Cj4g
PiBPbiBTdW4sIEFwciA2LCAyMDI1IGF0IDE6MjbigK9BTSB1cGxpbmtyLS0tIHZpYSBMaW51eC1m
MmZzLWRldmVsCj4gPiA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdy
b3RlOgo+ID4+Cj4gPj4gSGVsbG8gZXZlcnlvbmUsCj4gPj4KPiA+PiBJIGFtIGhhdmluZyB0cm91
YmxlIHdpdGggRjJGUy4gU3BlY2lmaWNhbGx5LCBJIGJlbGlldmUgbWV0YWRhdGEgZ290Cj4gPj4g
Y29ycnVwdGVkIHdoZW4gSSByZXNpemVkIGl0LiBJIGhhdmUgYSA1MTIgR0IgZHJpdmUuIE15IEYy
RlMgcGFydGl0aW9uCj4gPj4gd2FzIGFwcHJveGltYXRlbHkgbG9jYXRlZCBvbiAzNjktNDk3IEdC
ICgxMjggR0Igc2l6ZSkuIFVzaW5nIEdQYXJ0ZWQsIEkKPiA+PiByZXNpemVkIGl0IHRvIDAuNS00
OTcgR0IuIFdoaWxlIHRoZSBwYXJ0aXRpb24gcmVzaXppbmcgd2VudCB0aHJvdWdoCj4gPj4gc3Vj
Y2Vzc2Z1bGx5LCBmaWxlc3lzdGVtIHJlc2l6aW5nIGluaXRpYWxseSBmYWlsZWQgd2l0aCAiTW91
bnQgdW5jbGVhbgo+ID4+IGltYWdlIHRvIHJlcGxheSBsb2ciLiBJIGhhdmUgZG9uZSB0aGF0IGFu
ZCByZXRyaWVkIHJlc2l6aW5nLgo+ID4+Cj4gPj4gQWZ0ZXJ3YXJkcywgaG93ZXZlciwgZnNjayBz
dGFydGVkIGdpdmluZyBvdXQgYSBsb3Qgb2YgZXJyb3JzLCBhdCBvbmUKPiA+PiBwb2ludCBpdCBh
c2tlZCBpZiBJIHdpc2hlZCB0byByZXN0b3JlIGxvc3QgZGF0YSwgd2hpY2ggSSBhZ3JlZWQgdG8u
IExvZ3MKPiA+PiBzcGVjaWZpZWQgYSBsb3Qgb2YgbXkgZmlsZXMgKHdoaWNoIEkgY291bGQgdGVs
bCBieSBmaWxlbmFtZXMpIGFuZAo+ID4+IG1pZC13YXkgdGhyb3VnaCB0aGUgcHJvY2VzcywgaXQg
c2VnZmF1bHRlZC4gTm93LCB3aGVuIEkgcnVuIGZzY2ssIG5vCj4gPj4gZmlsZXMgYXJlIGFza2Vk
IHRvIGJlIHJlc3RvcmVkLCBhbmQgaXQgY29tcGxldGVzIHN1Y2Nlc3NmdWxseS4gSG93ZXZlciwK
PiA+PiB3aGVuIEkgYXR0ZW1wdCB0byBtb3VudCBpdCwgSSBnZXQgYW4gZXJyb3Igc2F5aW5nICJT
dHJ1Y3R1cmUgbmVlZHMKPiA+PiBjbGVhbmluZyIuCj4gPj4KPiA+PiBDb3VsZCBzb21lb25lIGhl
bHAgbWUgcmVzdG9yZSBteSBtZXRhZGF0YSAoYXQgbGVhc3QsIGxvbmcgZW5vdWdoIHRvCj4gPj4g
ZXh0cmFjdCBteSBmaWxlcyk/IFRoYW5rcy4KPiA+Pgo+ID4+IGRtZXNnIGxvZ3M6Cj4gPj4KPiA+
PiBbICAgOTYuMTg0MTI3XSBGMkZTLWZzIChudm1lMG4xcDUpOiBNaXNtYXRjaCB2YWxpZCBibG9j
a3MgNzY5IHZzLiA2OAo+ID4+IFsgICA5Ni4xODgwNTBdIEYyRlMtZnMgKG52bWUwbjFwNSk6IEZh
aWxlZCB0byBpbml0aWFsaXplIEYyRlMgc2VnbWVudAo+ID4+IG1hbmFnZXIgKC0xMTcpCj4gPj4K
PiA+PiBmc2NrLmYyZnMgLS1kcnktcnVuIC1kIDMgbG9nczogaHR0cHM6Ly9hcnRlci5jb20vLmYy
ZnMtMjAyNTA0MDYvZnNjay5sb2cKPiA+Pgo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+ID4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
