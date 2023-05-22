Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8070C0E5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 16:20:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q16Oq-0004ay-JM;
	Mon, 22 May 2023 14:20:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <butterflyhuangxx@gmail.com>) id 1q16Op-0004am-9H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 14:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oE7WKYKJoUyzqBoJ7pWcEG4sFnUkFiK40AdwSey28Ac=; b=QZzviNczkNlBQ6oU2O63BEn1w0
 xv5+Z/iRX9t2SfsfO9zg1IyMhjEzfyVSVatlgN6DrvDoFMa0K9xyvqNvnnFbBaU8/C3gaUZiBlRg3
 aYP7S+otMUZYSYfPL6cNlS6ieWFDwWthsqVP3KX+vA3pTQYJs5/m9bTj/2X5bRYKHNGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oE7WKYKJoUyzqBoJ7pWcEG4sFnUkFiK40AdwSey28Ac=; b=Scy7XvCidwH2uWVVQ3ZbwNrEF7
 aWAjM7Rh/OC89qCXyugX7lOvxPZDfkf7w2Lqvrs5yVRQkmSBGT2+LW1FtdwQft5z+CN3dUHLBWPYZ
 FOg238UvfgT8/YrOEKiHDXDOOc1S2Un3y4SfjxaU3s2lTKhYDxYnSswt4QQgjwnOr+lw=;
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q16Oo-0005vF-7C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 14:20:35 +0000
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-39415d3526bso2057265b6e.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 May 2023 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684765228; x=1687357228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oE7WKYKJoUyzqBoJ7pWcEG4sFnUkFiK40AdwSey28Ac=;
 b=DLHBFYV+EI+UyyiLhHQoMegk4asD7tHEkKjySGQ5rGv9bUgOoFwTZIKw3VbCC+RWRv
 BcRMH3sJ21rn37oFOVrazHyuXw4/Ajy/f5PDTeo1JNgBxh6LJGxghdVKmeUdbiv9SFsS
 XI7vqC6SMc91Kl5WIOxLgw1Qq9DCMbVCmXB55v72Vll/2Wz5mrD3IVR8od0dDFBWd4Ve
 poPcmJTGrM4zgey4FQGRu5JnbPIF7bliQmjdzUfBBSpay6hVIU5JMUkZ/SRlFra0EQog
 94Sq3cn5HC51ycEvYuMJ/8o+XUtVoj74fQBScpIso5aw2pkpFWcTWqk4FF7itHQDF2v4
 cYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684765228; x=1687357228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oE7WKYKJoUyzqBoJ7pWcEG4sFnUkFiK40AdwSey28Ac=;
 b=OmvgtXyqYajK4PNqGKen91iTfSpg19hYI7duzYU99lCdaHwMw4/vqeclyqR3wIQlXR
 QvSvX+1oeHhCYNflqXs4hue6OLABItj7Q0Jb3o/nfYU6RerMbwlOU6ojYYUPV+qL2m7C
 41XhjRz6L9PCqJVYgAJvbDwU9MqEYXG+IeTahhZajvaL3c9tCNIfFEKhkb6lKcV3iQ6U
 NmgMEPg821jjyI8b5fQubEs/alBIJPd2g6Q7KvH6XjP2fLMM9s8mUPry6ftqBma8347c
 0gcTDspR+Igvs42Ebs32vcnf7xrP+9704t/j22X81wxekGO2ynOn0kzYrQi7fObp+Uvk
 6z+g==
X-Gm-Message-State: AC+VfDyMytmXhd7GtmKG/+UfZBtQtMF9NsdFHczvZuoov///fdRoViF6
 rMG9RnEUY4H1SJMthhLMO0P1GOqAu1aG7itnzOWORmGMaso=
X-Google-Smtp-Source: ACHHUZ7eZ0GNtCudA8zuTJFy57Sa3xUxPzQs64UHXVeFTkbE3lJTRZFzUFIuPEU2YIlQBbcDa3zFUNetLeghNn/DbkI=
X-Received: by 2002:aca:1a06:0:b0:392:4511:d893 with SMTP id
 a6-20020aca1a06000000b003924511d893mr5038282oia.3.1684765228507; Mon, 22 May
 2023 07:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFcO6XMJC=u5aASRNCqfVi7tJwDJBYGCw5i13M-R8zXdB9-8Ew@mail.gmail.com>
 <986151e4-66ef-b76d-f66d-318017f34b5d@kernel.org>
 <CAFcO6XNEZVpyPNNuU9X0wub-hrWcfwWX1bP1MT3ggddfgPvmTg@mail.gmail.com>
 <c5bf15c0-932c-5466-3663-92ecebab4760@kernel.org>
In-Reply-To: <c5bf15c0-932c-5466-3663-92ecebab4760@kernel.org>
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Mon, 22 May 2023 22:20:16 +0800
Message-ID: <CAFcO6XPhm1_9rKNzM1YWVoH5aPxMyFSgO-nXkf2a=Mqn9xvFEw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  I have tested the patch, it works fine. Regards, butt3rflyh4ck.
    On Mon, May 22, 2023 at 8:44 PM Chao Yu wrote: > > On 2023/5/22 11:58,
   butt3rflyh4ck wrote: > > OK, the attachment is a reproducer. > > Thank you!
    > > I've figured out a patch, could you please ha [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.172 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [butterflyhuangxx[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q16Oo-0005vF-7C
Subject: Re: [f2fs-dev] A null-ptr-deref bug in f2fs_write_end_io
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SSBoYXZlIHRlc3RlZCB0aGUgcGF0Y2gsIGl0IHdvcmtzIGZpbmUuCgoKUmVnYXJkcywKIGJ1dHQz
cmZseWg0Y2suCgpPbiBNb24sIE1heSAyMiwgMjAyMyBhdCA4OjQ04oCvUE0gQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDIwMjMvNS8yMiAxMTo1OCwgYnV0dDNyZmx5aDRj
ayB3cm90ZToKPiA+IE9LLCB0aGUgYXR0YWNobWVudCBpcyBhIHJlcHJvZHVjZXIuCj4KPiBUaGFu
ayB5b3UhCj4KPiBJJ3ZlIGZpZ3VyZWQgb3V0IGEgcGF0Y2gsIGNvdWxkIHlvdSBwbGVhc2UgaGF2
ZSBhIHRyeSB3LyB0aGlzIHBhdGNoPwo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZjJmcy1kZXZlbC8yMDIzMDUyMjEyNDIwMy4zODM4MzYwLTEtY2hhb0BrZXJuZWwub3JnLwo+Cj4g
VGhhbmtzLAo+Cj4gPgo+ID4gUmVnYXJkcy4KPiA+ICAgYnV0dDNyZmx5aDRjay4KPiA+Cj4gPiBP
biBGcmksIE1heSAxOSwgMjAyMyBhdCAxMToyNOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSwKPiA+Pgo+ID4+IFRoYW5rcyBmb3IgdGhlIHJlcG9ydCwg
aXQgd2lsbCBiZSBoZWxwZnVsIGlmIHlvdSBjYW4gcHJvdmlkZSBhCj4gPj4gcmVwcm9kdWNlci4K
PiA+Pgo+ID4+IE9uIDIwMjMvNS8xOSAxNToxMywgYnV0dDNyZmx5aDRjayB3cm90ZToKPiA+Pj4g
SGksIHRoZXJlIGlzIGEgbnVsbC1wdHItZGVyZWYgIGJ1ZyBpbiBmMmZzX3dyaXRlX2VuZF9pbyBp
bgo+ID4+PiBmcy9mMmZzL2RhdGEuYywgSSByZXByb2R1Y2UgaXQgaW4gdGhlIGxhdGVzdCBrZXJu
ZWwgdG9vLgo+ID4+Pgo+ID4+PiAjUXVpY2sgZGVzY3JpcHRpb24KPiA+Pj4gV2hlbiBhIHRocmVh
ZCBhbHdheXMgY2FsbHMgRjJGU19JT0NfUkVTSVpFX0ZTIHRvICByZXNpemUgZnMsIGlmIHJlc2l6
ZQo+ID4+PiBmcyBpcyBmYWlsZWQsIGYyZnMga2VybmVsIHRocmVhZCB3b3VsZCAgaW52b2tlIGNh
bGxiYWNrIGZ1bmN0aW9uIHRvCj4gPj4+IHVwZGF0ZQo+ID4+PiBmMmZzIGlvIGluZm8sIGl0IHdv
dWxkIGNhbGwgIGYyZnNfd3JpdGVfZW5kX2lvIGFuZCBtYXkgdHJpZ2dlcgo+ID4+PiBudWxsLXB0
ci1kZXJlZiBpbiBOT0RFX01BUFBJTkcuCj4gPj4+IGBgYAo+ID4+PiBzdGF0aWMgaW5saW5lIHN0
cnVjdCBhZGRyZXNzX3NwYWNlICpOT0RFX01BUFBJTkcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
KQo+ID4+PiB7Cj4gPj4+IHJldHVybiBzYmktPm5vZGVfaW5vZGUtPmlfbWFwcGluZzsKPiA+Pj4g
fQo+ID4+PiBgYGAKPiA+Pj4gdGhlcmUgaXMgZGVyZWYgaW4gc2JpLgo+ID4+Pgo+ID4+PiAjY3Jh
c2ggbG9nCj4gPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
Pj4gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNhbm9uaWNhbCBh
ZGRyZXNzCj4gPj4+IDB4ZGZmZmZjMDAwMDAwMDAwNjogMDAwMCBbIzFdIFBSRUVNUFQgU01QIEtB
U0FOCj4gPj4+IEtBU0FOOiBudWxsLXB0ci1kZXJlZiBpbiByYW5nZSBbMHgwMDAwMDAwMDAwMDAw
MDMwLTB4MDAwMDAwMDAwMDAwMDAzN10KPiA+Pj4gQ1BVOiAwIFBJRDogMTcgQ29tbToga3NvZnRp
cnFkLzAgTm90IHRhaW50ZWQgNi40LjAtcmMxICMxOAo+ID4+PiBIYXJkd2FyZSBuYW1lOiBRRU1V
IFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjE1LjAtMSAwNC8wMS8y
MDE0Cj4gPj4+IFJJUDogMDAxMDpOT0RFX01BUFBJTkcgZnMvZjJmcy9mMmZzLmg6MTk3MiBbaW5s
aW5lXQo+ID4+PiBSSVA6IDAwMTA6ZjJmc193cml0ZV9lbmRfaW8rMHg3MjcvMHgxMDUwIGZzL2Yy
ZnMvZGF0YS5jOjM3MAo+ID4+PiBDb2RlOiAwMCAwMCA0OCA4OSBmOCA0OCBjMSBlOCAwMyA4MCAz
YyAxOCAwMCAwZiA4NSBiMyAwNyAwMCAwMCA0OCA4Ygo+ID4+PiA0NCAyNCAwOCA0YyA4YiBhOCA2
MCAwMSAwMCAwMCA0OSA4ZCA3ZCAzMCA0OCA4OSBmOCA0OCBjMSBlOCAwMyA8ODA+IDNjCj4gPj4+
IDE4IDAwIDBmIDg1IDljIDA3IDAwIDAwIDRkIDNiIDc1IDMwIDBmIDg0IDEwIDA0IDAwIDAwIGU4
IDEwCj4gPj4+IFJTUDogMDAxODpmZmZmYzkwMDAwNDJmYzc4IEVGTEFHUzogMDAwMTAyMTYKPiA+
Pj4gUkFYOiAwMDAwMDAwMDAwMDAwMDA2IFJCWDogZGZmZmZjMDAwMDAwMDAwMCBSQ1g6IDAwMDAw
MDAwMDAwMDAxMDAKPiA+Pj4gUkRYOiBmZmZmODg4MDEzZDE4MDAwIFJTSTogZmZmZmZmZmY4M2E5
M2E0ZCBSREk6IDAwMDAwMDAwMDAwMDAwMzAKPiA+Pj4gUkJQOiBmZmZmZWEwMDAwOWU2OTAwIFIw
ODogMDAwMDAwMDAwMDAwMDAwMSBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4gUjEwOiAwMDAw
MDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmZlYTAwMDA5ZTY5MDAK
PiA+Pj4gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZjg4ODAyYTNjZWM0OCBSMTU6IDAw
MDAwMDAwMDAwMDAwMDAKPiA+Pj4gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4
ODgwMmNhMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+ID4+PiBDUzogIDAwMTAg
RFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gPj4+IENSMjogMDAwMDU1
NWZhZjE5NDAwMCBDUjM6IDAwMDAwMDAwMjUxYmQwMDAgQ1I0OiAwMDAwMDAwMDAwNzUwZWYwCj4g
Pj4+IFBLUlU6IDU1NTU1NTU0Cj4gPj4+IENhbGwgVHJhY2U6Cj4gPj4+ICAgIDxUQVNLPgo+ID4+
PiAgICBiaW9fZW5kaW8rMHg1YWYvMHg2YzAgYmxvY2svYmlvLmM6MTYwOAo+ID4+PiAgICByZXFf
YmlvX2VuZGlvIGJsb2NrL2Jsay1tcS5jOjc2MSBbaW5saW5lXQo+ID4+PiAgICBibGtfdXBkYXRl
X3JlcXVlc3QrMHg1Y2MvMHgxNjkwIGJsb2NrL2Jsay1tcS5jOjkwNgo+ID4+PiAgICBibGtfbXFf
ZW5kX3JlcXVlc3QrMHg1OS8weDRjMCBibG9jay9ibGstbXEuYzoxMDIzCj4gPj4+ICAgIGxvX2Nv
bXBsZXRlX3JxKzB4MWM2LzB4MjgwIGRyaXZlcnMvYmxvY2svbG9vcC5jOjM3MAo+ID4+PiAgICBi
bGtfY29tcGxldGVfcmVxcysweGFkLzB4ZTAgYmxvY2svYmxrLW1xLmM6MTEwMQo+ID4+PiAgICBf
X2RvX3NvZnRpcnErMHgxZDQvMHg4ZWYga2VybmVsL3NvZnRpcnEuYzo1NzEKPiA+Pj4gICAgcnVu
X2tzb2Z0aXJxZCBrZXJuZWwvc29mdGlycS5jOjkzOSBbaW5saW5lXQo+ID4+PiAgICBydW5fa3Nv
ZnRpcnFkKzB4MzEvMHg2MCBrZXJuZWwvc29mdGlycS5jOjkzMQo+ID4+PiAgICBzbXBib290X3Ro
cmVhZF9mbisweDY1OS8weDllMCBrZXJuZWwvc21wYm9vdC5jOjE2NAo+ID4+PiAgICBrdGhyZWFk
KzB4MzNlLzB4NDQwIGtlcm5lbC9rdGhyZWFkLmM6Mzc5Cj4gPj4+ICAgIHJldF9mcm9tX2Zvcmsr
MHgxZi8weDMwIGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlM6MzA4Cj4gPj4+ICAgIDwvVEFTSz4K
PiA+Pj4gTW9kdWxlcyBsaW5rZWQgaW46Cj4gPj4+IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAw
MDAwMDAgXS0tLQo+ID4+PiBSSVA6IDAwMTA6Tk9ERV9NQVBQSU5HIGZzL2YyZnMvZjJmcy5oOjE5
NzIgW2lubGluZV0KPiA+Pj4gUklQOiAwMDEwOmYyZnNfd3JpdGVfZW5kX2lvKzB4NzI3LzB4MTA1
MCBmcy9mMmZzL2RhdGEuYzozNzAKPiA+Pj4gQ29kZTogMDAgMDAgNDggODkgZjggNDggYzEgZTgg
MDMgODAgM2MgMTggMDAgMGYgODUgYjMgMDcgMDAgMDAgNDggOGIKPiA+Pj4gNDQgMjQgMDggNGMg
OGIgYTggNjAgMDEgMDAgMDAgNDkgOGQgN2QgMzAgNDggODkgZjggNDggYzEgZTggMDMgPDgwPiAz
Ywo+ID4+PiAxOCAwMCAwZiA4NSA5YyAwNyAwMCAwMCA0ZCAzYiA3NSAzMCAwZiA4NCAxMCAwNCAw
MCAwMCBlOCAxMAo+ID4+PiBSU1A6IDAwMTg6ZmZmZmM5MDAwMDQyZmM3OCBFRkxBR1M6IDAwMDEw
MjE2Cj4gPj4+IFJBWDogMDAwMDAwMDAwMDAwMDAwNiBSQlg6IGRmZmZmYzAwMDAwMDAwMDAgUkNY
OiAwMDAwMDAwMDAwMDAwMTAwCj4gPj4+IFJEWDogZmZmZjg4ODAxM2QxODAwMCBSU0k6IGZmZmZm
ZmZmODNhOTNhNGQgUkRJOiAwMDAwMDAwMDAwMDAwMDMwCj4gPj4+IFJCUDogZmZmZmVhMDAwMDll
NjkwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDEgUjA5OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+IFIx
MDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZmZWEwMDAw
OWU2OTAwCj4gPj4+IFIxMzogMDAwMDAwMDAwMDAwMDAwMCBSMTQ6IGZmZmY4ODgwMmEzY2VjNDgg
UjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+IEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBH
UzpmZmZmODg4MDJjYTAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4gQ1M6
ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+ID4+PiBDUjI6
IDAwMDA1NTVmYWYxOTQwMDAgQ1IzOiAwMDAwMDAwMDI1MWJkMDAwIENSNDogMDAwMDAwMDAwMDc1
MGVmMAo+ID4+PiBQS1JVOiA1NTU1NTU1NAo+ID4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4+Pgo+ID4+PiAjIG5ldyBjcmFzaCBsb2cgaW4gbGF0ZXN0IGtlcm5lbAo+ID4+PiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+Pj4gWyAgMTkzLjY5NTE2NF1bIFQ4MTc0XSBsb29wMDogZGV0ZWN0
ZWQgY2FwYWNpdHkgY2hhbmdlIGZyb20gMCB0byAyNjQxOTIKPiA+Pj4gWyAgMTkzLjY5NjQ2N11b
IFQ4MTc0XSBGMkZTLWZzIChsb29wMCk6IE1hZ2ljIE1pc21hdGNoLAo+ID4+PiB2YWxpZCgweGYy
ZjUyMDEwKSAtIHJlYWQoMHgwKQo+ID4+PiBbICAxOTMuNjk2ODc1XVsgVDgxNzRdIEYyRlMtZnMg
KGxvb3AwKTogQ2FuJ3QgZmluZCB2YWxpZCBGMkZTCj4gPj4+IGZpbGVzeXN0ZW0gaW4gMnRoIHN1
cGVyYmxvY2sKPiA+Pj4gWyAgMTkzLjY5ODM2M11bIFQ4MTc0XSBGMkZTLWZzIChsb29wMCk6IGlu
dmFsaWQgY3JjX29mZnNldDogMAo+ID4+PiBbICAxOTMuNzAwNDU0XVsgVDgxNzRdIEYyRlMtZnMg
KGxvb3AwKTogRGlzYWJsZSBuYXRfYml0cyBkdWUgdG8KPiA+Pj4gaW5jb3JyZWN0IGNwX3ZlciAo
NDU0MjM1OTkxMjk2MjMxNjk3NywgMCkKPiA+Pj4gWyAgMTkzLjcxNjU5NF1bIFQ4MTc0XSBGMkZT
LWZzIChsb29wMCk6IFRyeSB0byByZWNvdmVyIDJ0aCBzdXBlcmJsb2NrLCByZXQ6IDAKPiA+Pj4g
WyAgMTkzLjcxNzEwMl1bIFQ4MTc0XSBGMkZTLWZzIChsb29wMCk6IE1vdW50ZWQgd2l0aCBjaGVj
a3BvaW50Cj4gPj4+IHZlcnNpb24gPSAzZTE3ZGFiMQo+ID4+PiBbICAxOTMuNzQzMzMwXVsgVDgx
NzRdIEYyRlMtZnMgKGxvb3AwKTogRm9yIHJlc2l6ZTogY3Vyc2VnIG9mIHR5cGUgMDogNDYgPT0+
IDQKPiA+Pj4gWyAgMTkzLjc0MzkwNF1bIFQ4MTc0XSBGMkZTLWZzIChsb29wMCk6IEZvciByZXNp
emU6IGN1cnNlZyBvZiB0eXBlIDM6IDUyID09PiA2Cj4gPj4+IFsgIDE5My43NDU2OTBdWyBUODE3
NF0gRjJGUy1mcyAobG9vcDApOiBGb3IgcmVzaXplOiBjdXJzZWcgb2YgdHlwZSA0OiA1MCA9PT4g
OAo+ID4+PiBbICAxOTMuNzQ2MTA4XVsgVDgxNzRdIEYyRlMtZnMgKGxvb3AwKTogRm9yIHJlc2l6
ZTogY3Vyc2VnIG9mIHR5cGUgNTogNDggPT0+IDEwCj4gPj4+IFsgIDE5My43NTE4NTddWyBUODE3
NF0gRjJGUy1mcyAobG9vcDApOiByZXNpemVfZnMgZmFpbGVkLCBzaG91bGQgcnVuCj4gPj4+IGZz
Y2sgdG8gcmVwYWlyIQo+ID4+PiBbICAxOTMuNzgwMjgzXVsgICAgQzBdIGdlbmVyYWwgcHJvdGVj
dGlvbiBmYXVsdCwgcHJvYmFibHkgZm9yCj4gPj4+IG5vbi1jYW5vbmljYWwgYWRkcmVzcyAweGRm
ZmZmYzAwMDAwMDAwMDY6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBLQVNBTgo+ID4+PiBbICAxOTMu
NzgxMDI3XVsgICAgQzBdIEtBU0FOOiBudWxsLXB0ci1kZXJlZiBpbiByYW5nZQo+ID4+PiBbMHgw
MDAwMDAwMDAwMDAwMDMwLTB4MDAwMDAwMDAwMDAwMDAzN10KPiA+Pj4gWyAgMTkzLjc4MTU3Ml1b
ICAgIEMwXSBDUFU6IDAgUElEOiAxNyBDb21tOiBrc29mdGlycWQvMCBOb3QgdGFpbnRlZAo+ID4+
PiA2LjQuMC1yYzItMDAxNjMtZzJkMWJjYmM2Y2Q3MC1kaXJ0eSAjMTcKPiA+Pj4gWyAgMTkzLjc4
MjIwMV1bICAgIEMwXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQ
SUlYLAo+ID4+PiAxOTk2KSwgQklPUyAxLjE1LjAtMSAwNC8wMS8yMDE0Cj4gPj4+IFsgIDE5My43
ODI3MjddWyAgICBDMF0gUklQOiAwMDEwOmYyZnNfd3JpdGVfZW5kX2lvKzB4NzI3LzB4MTA1MAo+
ID4+PiBbICAxOTMuNzgzMDgzXVsgICAgQzBdIENvZGU6IDAwIDAwIDQ4IDg5IGY4IDQ4IGMxIGU4
IDAzIDgwIDNjIDE4IDAwIDBmCj4gPj4+IDg1IGIzIDA3IDAwIDAwIDQ4IDhiIDQ0IDI0IDA4IDRj
IDhiIGE4IDYwIDAxIDAwIDAwIDQ5IDhkIDdkIDMwIDQ4IDg5Cj4gPj4+IGY4IDQ4IGMxIGU4IDAz
IDw4MD4gM2MgMTggMDAgMGYgODUgOWMgMDcgMDAgMDAgNGQgM2IgNzUgMzAgMGYgMAo+ID4+PiBb
ICAxOTMuNzg0MjY4XVsgICAgQzBdIFJTUDogMDAxODpmZmZmYzkwMDAwNDJmYzc4IEVGTEFHUzog
MDAwMTAyMTYKPiA+Pj4gWyAgMTkzLjc4NDYyOV1bICAgIEMwXSBSQVg6IDAwMDAwMDAwMDAwMDAw
MDYgUkJYOiBkZmZmZmMwMDAwMDAwMDAwCj4gPj4+IFJDWDogMDAwMDAwMDAwMDAwMDEwMAo+ID4+
PiBbICAxOTMuNzg1MTA5XVsgICAgQzBdIFJEWDogZmZmZjg4ODAxM2QxODAwMCBSU0k6IGZmZmZm
ZmZmODNhOTU4OGQKPiA+Pj4gUkRJOiAwMDAwMDAwMDAwMDAwMDMwCj4gPj4+IFsgIDE5My43ODU1
NzZdWyAgICBDMF0gUkJQOiBmZmZmZWEwMDAxNDNlNzQwIFIwODogMDAwMDAwMDAwMDAwMDAwMQo+
ID4+PiBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4gWyAgMTkzLjc4NjA1MV1bICAgIEMwXSBS
MTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+IFIxMjogZmZm
ZmVhMDAwMTQzZTc0MAo+ID4+PiBbICAxOTMuNzg2NTcxXVsgICAgQzBdIFIxMzogMDAwMDAwMDAw
MDAwMDAwMCBSMTQ6IGZmZmY4ODgwNDE0MjM3MzgKPiA+Pj4gUjE1OiAwMDAwMDAwMDAwMDAwMDAw
Cj4gPj4+IFsgIDE5My43ODcwNTVdWyAgICBDMF0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDAp
Cj4gPj4+IEdTOmZmZmY4ODgwMmNhMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+
ID4+PiBbICAxOTMuNzg3NjIwXVsgICAgQzBdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBD
UjA6IDAwMDAwMDAwODAwNTAwMzMKPiA+Pj4gWyAgMTkzLjc4Nzk5N11bICAgIEMwXSBDUjI6IDAw
MDA1NjA1NmZkODcwMDAgQ1IzOiAwMDAwMDAwMDFiNTQ2MDAwCj4gPj4+IENSNDogMDAwMDAwMDAw
MDAwMDZmMAo+ID4+PiBbICAxOTMuNzg4NTg1XVsgICAgQzBdIENhbGwgVHJhY2U6Cj4gPj4+IFsg
IDE5My43ODg4NjNdWyAgICBDMF0gIDxUQVNLPgo+ID4+PiBbICAxOTMuNzg5MTE1XVsgICAgQzBd
ICA/IGJpb191bmluaXQrMHgxYjcvMHg0MTAKPiA+Pj4gWyAgMTkzLjc4OTUwOV1bICAgIEMwXSAg
PyBmMmZzX3dyaXRlX2VuZCsweGE4MC8weGE4MAo+ID4+PiBbICAxOTMuNzkwMDUzXVsgICAgQzBd
ICBiaW9fZW5kaW8rMHg1YWYvMHg2YzAKPiA+Pj4gWyAgMTkzLjc5MDUyMl1bICAgIEMwXSAgYmxr
X3VwZGF0ZV9yZXF1ZXN0KzB4NWNjLzB4MTY5MAo+ID4+PiBbICAxOTMuNzkxMTcxXVsgICAgQzBd
ICBibGtfbXFfZW5kX3JlcXVlc3QrMHg1OS8weDRjMAo+ID4+PiBbICAxOTMuNzkxNjk1XVsgICAg
QzBdICBsb19jb21wbGV0ZV9ycSsweDFjNi8weDI4MAo+ID4+PiBbICAxOTMuNzkyMjQ3XVsgICAg
QzBdICBibGtfY29tcGxldGVfcmVxcysweGFkLzB4ZTAKPiA+Pj4gWyAgMTkzLjc5Mjc1OV1bICAg
IEMwXSAgX19kb19zb2Z0aXJxKzB4MWQ0LzB4OGVmCj4gPj4+IFsgIDE5My43OTMzMTJdWyAgICBD
MF0gID8gX19pcnFfZXhpdF9yY3UrMHgxOTAvMHgxOTAKPiA+Pj4gWyAgMTkzLjc5MzgwNV1bICAg
IEMwXSAgcnVuX2tzb2Z0aXJxZCsweDMxLzB4NjAKPiA+Pj4gWyAgMTkzLjc5NDE4M11bICAgIEMw
XSAgc21wYm9vdF90aHJlYWRfZm4rMHg2NTkvMHg5ZTAKPiA+Pj4gWyAgMTkzLjc5NDU3Nl1bICAg
IEMwXSAgPyBzb3J0X3JhbmdlKzB4MzAvMHgzMAo+ID4+PiBbICAxOTMuNzk0OTAwXVsgICAgQzBd
ICBrdGhyZWFkKzB4MzNlLzB4NDQwCj4gPj4+IFsgIDE5My43OTUyNjNdWyAgICBDMF0gID8ga3Ro
cmVhZF9jb21wbGV0ZV9hbmRfZXhpdCsweDQwLzB4NDAKPiA+Pj4gWyAgMTkzLjc5NTkwN11bICAg
IEMwXSAgcmV0X2Zyb21fZm9yaysweDFmLzB4MzAKPiA+Pj4gWyAgMTkzLjc5NjMyNF1bICAgIEMw
XSAgPC9UQVNLPgo+ID4+PiBbICAxOTMuNzk2Njg5XVsgICAgQzBdIE1vZHVsZXMgbGlua2VkIGlu
Ogo+ID4+PiBbICAxOTMuNzk3MTg5XVsgICAgQzBdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAw
MDAwMDAgXS0tLQo+ID4+PiBbICAxOTMuNzk3NjM1XVsgICAgQzBdIFJJUDogMDAxMDpmMmZzX3dy
aXRlX2VuZF9pbysweDcyNy8weDEwNTAKPiA+Pj4gWyAgMTkzLjc5ODE4Ml1bICAgIEMwXSBDb2Rl
OiAwMCAwMCA0OCA4OSBmOCA0OCBjMSBlOCAwMyA4MCAzYyAxOCAwMCAwZgo+ID4+PiA4NSBiMyAw
NyAwMCAwMCA0OCA4YiA0NCAyNCAwOCA0YyA4YiBhOCA2MCAwMSAwMCAwMCA0OSA4ZCA3ZCAzMCA0
OCA4OQo+ID4+PiBmOCA0OCBjMSBlOCAwMyA8ODA+IDNjIDE4IDAwIDBmIDg1IDljIDA3IDAwIDAw
IDRkIDNiIDc1IDMwIDBmIDAKPiA+Pj4gWyAgMTkzLjc5OTU1OV1bICAgIEMwXSBSU1A6IDAwMTg6
ZmZmZmM5MDAwMDQyZmM3OCBFRkxBR1M6IDAwMDEwMjE2Cj4gPj4+IFsgIDE5My43OTk5NDVdWyAg
ICBDMF0gUkFYOiAwMDAwMDAwMDAwMDAwMDA2IFJCWDogZGZmZmZjMDAwMDAwMDAwMAo+ID4+PiBS
Q1g6IDAwMDAwMDAwMDAwMDAxMDAKPiA+Pj4gWyAgMTkzLjgwMDMyOV1bICAgIEMwXSBSRFg6IGZm
ZmY4ODgwMTNkMTgwMDAgUlNJOiBmZmZmZmZmZjgzYTk1ODhkCj4gPj4+IFJESTogMDAwMDAwMDAw
MDAwMDAzMAo+ID4+PiBbICAxOTMuODAwNjY2XVsgICAgQzBdIFJCUDogZmZmZmVhMDAwMTQzZTc0
MCBSMDg6IDAwMDAwMDAwMDAwMDAwMDEKPiA+Pj4gUjA5OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+
IFsgIDE5My44MDEwNDddWyAgICBDMF0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAw
MDAwMDAwMDAwMAo+ID4+PiBSMTI6IGZmZmZlYTAwMDE0M2U3NDAKPiA+Pj4gWyAgMTkzLjgwMTUw
M11bICAgIEMwXSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmODg4MDQxNDIzNzM4Cj4g
Pj4+IFIxNTogMDAwMDAwMDAwMDAwMDAwMAo+ID4+PiBbICAxOTMuODAyMDY5XVsgICAgQzBdIEZT
OiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKQo+ID4+PiBHUzpmZmZmODg4MDJjYTAwMDAwKDAwMDAp
IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4gWyAgMTkzLjgwMjgwNF1bICAgIEMwXSBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gPj4+IFsgIDE5
My44MDMzNTZdWyAgICBDMF0gQ1IyOiAwMDAwNTYwNTZmZDg3MDAwIENSMzogMDAwMDAwMDAxYjU0
NjAwMAo+ID4+PiBDUjQ6IDAwMDAwMDAwMDAwMDA2ZjAKPiA+Pj4gWyAgMTkzLjgwNDA0Nl1bICAg
IEMwXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVy
cnVwdAo+ID4+PiBbICAxOTMuODA0NzQ4XVsgICAgQzBdIEtlcm5lbCBPZmZzZXQ6IGRpc2FibGVk
Cj4gPj4+IFsgIDE5My44MDUwODZdWyAgICBDMF0gUmVib290aW5nIGluIDg2NDAwIHNlY29uZHMu
Lgo+ID4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4+Cj4gPj4+IElmIG5lZWRl
ZCwgSSB3b3VsZCBwcm92aWRlIHJlcHJvZHVjZS4KPiA+Pj4KPiA+Pj4gUmVnYXJkcywKPiA+Pj4g
ICAgYnV0dDNyZmx5aDRjay4KPiA+Pj4KPiA+Pj4KPiA+Pj4KPiA+Cj4gPgo+ID4KCgoKLS0gCkFj
dGl2ZSBEZWZlbnNlIExhYiBvZiBWZW51c3RlY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
