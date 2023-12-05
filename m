Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5980573A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 15:24:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAWLT-0005hn-Ue;
	Tue, 05 Dec 2023 14:24:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1rAWLT-0005hh-Bu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 14:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7XU6GHHiBgdkrXmdGsRu2k0uowM8mZD/GX6dh9pTT4=; b=TD39hpH+9JNwE71ZqgwPfcUau5
 1vJWRzWpIEHCdd+d1rfOYg9oEVaFsInVeyKWJgAbbIvwQpQ0FcAOwE6dTgCElOSwLsnr0nMth10UW
 c2LJBnkTvZhwtiZkgXBuU9A2lnbyMVmPOahCsSA7tm+J1sB5BDR0acbSLKllL+6lsaq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T7XU6GHHiBgdkrXmdGsRu2k0uowM8mZD/GX6dh9pTT4=; b=eVvUoew0xNLW43Xb0RQJJtwzH/
 CH0CXiL0GSV8Oqi8BM6y3fvX+hgqQ0l8+FOius/I8gL+aYRys/7BwD5CZK1H2s3yuoT0/np76isCg
 pjxefuN66uG4xMcbGtHXnmSiyERNx/rdnk7QAgTuD6PWuT/Ibu2lMB8HroEcr3yNWik4=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAWLP-00066Z-DF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 14:24:17 +0000
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a1b68ae40ffso322755766b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Dec 2023 06:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701786237; x=1702391037; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7XU6GHHiBgdkrXmdGsRu2k0uowM8mZD/GX6dh9pTT4=;
 b=Sz+RPPdYdfbS4dqSJyYPNLJIxnR5bG2UqIQVq0FuRM+GuukRHde/TSGTk9Al5BoxTL
 XZTGSr3jr2d8riJP947CfVePblVFpj22Gr62Z/QxIG+OW4Zj4ypYbTF7aaXi7F7XYBWZ
 MhlvwWoa+X/i2zEdy1xSQSPJoXEVsvDOo9OtbyFioPigX/6Azt7CNltXSI+9dcyShF1P
 +ZQtS+tslfRX6Pf+9MnMaGvndCIZcaeNScczBrQeTYbwgPFE3qFDZs9kXEccPGALMiWe
 U5sUhLiMFXnLsLBEsUth93EqVXfhAuTP+ZhXq6uw56EJU2hnjUPE/ZDEGNKjBxuo5euJ
 JOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701786237; x=1702391037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7XU6GHHiBgdkrXmdGsRu2k0uowM8mZD/GX6dh9pTT4=;
 b=YxSLukWlxvqZ424Sqa+HU1PSta2OVEWFP2VarKekDCHXvUNNejam/yLjxiOrf3e3uD
 4+69vxvjo0Sa3je5KPBBSFTTw8jWnAo7u9Oc7rQNbfplwVXDIVQ7ewB/httSUezHq3Hs
 bGPPRaznwYFFQ9BVkugk3l8FdqISkD9HdwgF2eLK9ciuAgLNE0x1bOaiW6o3OUVfJFyd
 AYsXjYKV5Gk+rh7o1bxYTBoEolEEh5iyu2Ek/CoMwZdqB8uZip9v7qc9kzZRASZ6BjCZ
 GLkbZ3qbnMDIlvDuNfSbc6OX6T2lAcvuQhC4IW6/6du5tX6D/BVbySeHeBcLOWKFsKVK
 MYCw==
X-Gm-Message-State: AOJu0Yzj22nO3/cCFBHixGSqK69zVgEMB6yYHJhjC6Y9bxFSmtat0ii0
 3NpKX42Esa8rbFMuoVJqRPxZBLfthSeM7KHLYxI=
X-Google-Smtp-Source: AGHT+IHmjQYO8Lbz0AV3t/9F250TBl3CqhhD6m/ina5u1sK3EV3LtWkK0nPmDiX1Pkv1pnEGvjIvN7xUJ/csGiAx/rc=
X-Received: by 2002:a17:906:73cf:b0:a1c:c376:85ca with SMTP id
 n15-20020a17090673cf00b00a1cc37685camr248747ejl.216.1701786236507; Tue, 05
 Dec 2023 06:23:56 -0800 (PST)
MIME-Version: 1.0
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
 <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
 <649a3bc4-58bb-1dc8-85fb-a56e47b3d5c9@linux.alibaba.com>
 <CAD14+f1u6gnHLhGSoQxL9wLq9vDYse+Ac8zxep-O2E8hHreT2w@mail.gmail.com>
 <275f025d-e2f1-eaff-6af1-e909d370cee0@linux.alibaba.com>
 <CAD14+f3zgwgUugjnB7UGCYh4j3iXYsvv_DJ3yvwduA1xf3xn=A@mail.gmail.com>
 <d7c7ea8c-6e2f-e8d8-88c3-4952c506ed13@linux.alibaba.com>
In-Reply-To: <d7c7ea8c-6e2f-e8d8-88c3-4952c506ed13@linux.alibaba.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 5 Dec 2023 23:23:44 +0900
Message-ID: <CAD14+f2hPLv6RPZdYyi8q8SQGiBox2fYUaWwuBEjEbZKQdyU7g@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Gao, On Tue, Dec 5, 2023 at 4:32 PM Gao Xiang wrote:
   > > Hi Juhyung, > > On 2023/12/4 11:41, Juhyung Park wrote: > > ... > > >
   >> > >> - Could you share the full message about the output of `lscpu`? >
   [...] 
 
 Content analysis details:   (2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.218.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rAWLP-00066Z-DF
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgR2FvLAoKT24gVHVlLCBEZWMgNSwgMjAyMyBhdCA0OjMy4oCvUE0gR2FvIFhpYW5nIDxoc2lh
bmdrYW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gSGkgSnVoeXVuZywKPgo+IE9uIDIw
MjMvMTIvNCAxMTo0MSwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+Cj4gLi4uCj4gPgo+ID4+Cj4gPj4g
LSBDb3VsZCB5b3Ugc2hhcmUgdGhlIGZ1bGwgbWVzc2FnZSBhYm91dCB0aGUgb3V0cHV0IG9mIGBs
c2NwdWA/Cj4gPgo+ID4gU3VyZToKPiA+Cj4gPiBBcmNoaXRlY3R1cmU6ICAgICAgICAgICAgeDg2
XzY0Cj4gPiAgICBDUFUgb3AtbW9kZShzKTogICAgICAgIDMyLWJpdCwgNjQtYml0Cj4gPiAgICBB
ZGRyZXNzIHNpemVzOiAgICAgICAgIDM5IGJpdHMgcGh5c2ljYWwsIDQ4IGJpdHMgdmlydHVhbAo+
ID4gICAgQnl0ZSBPcmRlcjogICAgICAgICAgICBMaXR0bGUgRW5kaWFuCj4gPiBDUFUocyk6ICAg
ICAgICAgICAgICAgICAgOAo+ID4gICAgT24tbGluZSBDUFUocykgbGlzdDogICAwLTcKPiA+IFZl
bmRvciBJRDogICAgICAgICAgICAgICBHZW51aW5lSW50ZWwKPiA+ICAgIEJJT1MgVmVuZG9yIElE
OiAgICAgICAgSW50ZWwoUikgQ29ycG9yYXRpb24KPiA+ICAgIE1vZGVsIG5hbWU6ICAgICAgICAg
ICAgMTF0aCBHZW4gSW50ZWwoUikgQ29yZShUTSkgaTctMTE4NUc3IEAgMy4wMEdIego+ID4gICAg
ICBCSU9TIE1vZGVsIG5hbWU6ICAgICAxMXRoIEdlbiBJbnRlbChSKSBDb3JlKFRNKSBpNy0xMTg1
RzcgQCAzLjAwR0h6IE5vbmUgQ1BVCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBAIDMu
MEdIego+ID4gICAgICBCSU9TIENQVSBmYW1pbHk6ICAgICAxOTgKPiA+ICAgICAgQ1BVIGZhbWls
eTogICAgICAgICAgNgo+ID4gICAgICBNb2RlbDogICAgICAgICAgICAgICAxNDAKPiA+ICAgICAg
VGhyZWFkKHMpIHBlciBjb3JlOiAgMgo+ID4gICAgICBDb3JlKHMpIHBlciBzb2NrZXQ6ICA0Cj4g
PiAgICAgIFNvY2tldChzKTogICAgICAgICAgIDEKPiA+ICAgICAgU3RlcHBpbmc6ICAgICAgICAg
ICAgMQo+ID4gICAgICBDUFUocykgc2NhbGluZyBNSHo6ICA2MCUKPiA+ICAgICAgQ1BVIG1heCBN
SHo6ICAgICAgICAgNDgwMC4wMDAwCj4gPiAgICAgIENQVSBtaW4gTUh6OiAgICAgICAgIDQwMC4w
MDAwCj4gPiAgICAgIEJvZ29NSVBTOiAgICAgICAgICAgIDU5OTAuNDAKPiA+ICAgICAgRmxhZ3M6
ICAgICAgICAgICAgICAgZnB1IHZtZSBkZSBwc2UgdHNjIG1zciBwYWUgbWNlIGN4OCBhcGljIHNl
cCBtdHJyIHBnZSBtYwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBhIGNtb3YgcGF0IHBz
ZTM2IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3NlIHNzZTIgc3MKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaHQgdG0gcGJlIHN5c2NhbGwgbnggcGRwZTFnYiByZHRzY3AgbG0gY29u
c3RhbnRfdHNjIGFydAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJjaF9wZXJmbW9u
IHBlYnMgYnRzIHJlcF9nb29kIG5vcGwgeHRvcG9sb2d5IG5vbnN0b3BfCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHRzYyBjcHVpZCBhcGVyZm1wZXJmIHRzY19rbm93bl9mcmVxIHBuaSBw
Y2xtdWxxZHEgZHRlczYKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNCBtb25pdG9yIGRz
X2NwbCB2bXggc214IGVzdCB0bTIgc3NzZTMgc2RiZyBmbWEgY3gxNiB4dAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBwciBwZGNtIHBjaWQgc3NlNF8xIHNzZTRfMiB4MmFwaWMgbW92YmUg
cG9wY250IHRzY19kZWFkCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpbmVfdGltZXIg
YWVzIHhzYXZlIGF2eCBmMTZjIHJkcmFuZCBsYWhmX2xtIGFibSAzZG5vd3AKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVmZXRjaCBjcHVpZF9mYXVsdCBlcGIgY2F0X2wyIGNkcF9sMiBz
c2JkIGlicnMgaWJwYiBzdAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBpYnAgaWJyc19l
bmhhbmNlZCB0cHJfc2hhZG93IGZsZXhwcmlvcml0eSBlcHQgdnBpZCBlcHRfCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGFkIGZzZ3NiYXNlIHRzY19hZGp1c3QgYm1pMSBhdngyIHNtZXAg
Ym1pMiBlcm1zIGludnBjaWQKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJkdF9hIGF2
eDUxMmYgYXZ4NTEyZHEgcmRzZWVkIGFkeCBzbWFwIGF2eDUxMmlmbWEgY2xmbAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICB1c2hvcHQgY2x3YiBpbnRlbF9wdCBhdng1MTJjZCBzaGFfbmkg
YXZ4NTEyYncgYXZ4NTEydmwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgeHNhdmVvcHQg
eHNhdmVjIHhnZXRidjEgeHNhdmVzIHNwbGl0X2xvY2tfZGV0ZWN0IGR0aGVybQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaWRhIGFyYXQgcGxuIHB0cyBod3AgaHdwX25vdGlmeSBod3Bf
YWN0X3dpbmRvdyBod3BfZXBwCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBod3BfcGtn
X3JlcSB2bm1pIGF2eDUxMnZibWkgdW1pcCBwa3Ugb3Nwa2UgYXZ4NTEyX3ZibWkKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMiBnZm5pIHZhZXMgdnBjbG11bHFkcSBhdng1MTJfdm5uaSBh
dng1MTJfYml0YWxnIHRtZSBhdgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICB4NTEyX3Zw
b3BjbnRkcSByZHBpZCBtb3ZkaXJpIG1vdmRpcjY0YiBmc3JtIGF2eDUxMl92cDJpCj4KPiBTaWdo
LCBJJ3ZlIGJlZW4gdGhpbmtpbmcuICBIZXJlIEZTUk0gaXMgdGhlIG1vc3Qgc2lnbmlmaWNhbnQg
ZGlmZmVyZW5jZSBiZXR3ZWVuCj4gb3VyIGVudmlyb25tZW50cywgY291bGQgeW91IG9ubHkgdHJ5
IHRoZSBmb2xsb3dpbmcgZGlmZiB0byBzZWUgaWYgdGhlcmUncyBhbnkKPiBkaWZmZXJlbmNlIGFu
eW1vcmU/ICh3aXRob3V0IHRoZSBwcmV2aW91cyBkaXNhYmxlIHBhdGNoLikKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9saWIvbWVtbW92ZV82NC5TIGIvYXJjaC94ODYvbGliL21lbW1vdmVfNjQu
Uwo+IGluZGV4IDFiNjBhZTgxZWNkOC4uMWI1MmE5MTMyMzNjIDEwMDY0NAo+IC0tLSBhL2FyY2gv
eDg2L2xpYi9tZW1tb3ZlXzY0LlMKPiArKysgYi9hcmNoL3g4Ni9saWIvbWVtbW92ZV82NC5TCj4g
QEAgLTQxLDkgKzQxLDcgQEAgU1lNX0ZVTkNfU1RBUlQoX19tZW1tb3ZlKQo+ICAgI2RlZmluZSBD
SEVDS19MRU4gICAgIGNtcCAkMHgyMCwgJXJkeDsgamIgMWYKPiAgICNkZWZpbmUgTUVNTU9WRV9C
WVRFUyBtb3ZxICVyZHgsICVyY3g7IHJlcCBtb3ZzYjsgUkVUCj4gICAuTG1lbW1vdmVfYmVnaW5f
Zm9yd2FyZDoKPiAtICAgICAgIEFMVEVSTkFUSVZFXzIgX19zdHJpbmdpZnkoQ0hFQ0tfTEVOKSwg
XAo+IC0gICAgICAgICAgICAgICAgICAgICBfX3N0cmluZ2lmeShDSEVDS19MRU47IE1FTU1PVkVf
QllURVMpLCBYODZfRkVBVFVSRV9FUk1TLCBcCj4gLSAgICAgICAgICAgICAgICAgICAgIF9fc3Ry
aW5naWZ5KE1FTU1PVkVfQllURVMpLCBYODZfRkVBVFVSRV9GU1JNCj4gKyAgICAgICBDSEVDS19M
RU4KPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIG1vdnNxIGluc3RydWN0aW9uIGhhdmUgbWFu
eSBzdGFydHVwIGxhdGVuY3kKCll1cCwgdGhhdCBhbHNvIHNlZW1zIHRvIGZpeCBpdC4KQXJlIHdl
IGxvb2tpbmcgYXQgYSBwb3RlbnRpYWwgbWVtbW92ZSBpc3N1ZT8KCj4KPiBUaGFua3MsCj4gR2Fv
IFhpYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
