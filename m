Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BEACCB7C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 18:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQhGVRwVIv+72vlAlmwJtevqEnomtgSiG3LQXUuMQSU=; b=Dxodq1/jjE0PftGsSxpNoeTVDB
	VYfYHnHGaieN8Jam3tjfiOXEKsm1dZZmJ8a2PyzGwo2K6DgUUa9mJzD46IOQg12DiaMtOjhnLjkez
	k9cz29wmsrk46J62gWNjwjKmKqLwGdHw3VIGyw4xJz1+yty0D89pXF7GO2M9UZS//o/E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMUu4-0001JB-A5;
	Tue, 03 Jun 2025 16:54:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uMUu3-0001J5-NJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 16:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ne6to4SSZ0+b7v5LsSXKG8SSmXeSgITXbtXtBYdXFmU=; b=c5E8Kp5E0Z9Kc4XNmvp3TZt6qp
 OJiXtUuoJ6jSrokjobCvherNsD8ium/uFe4qUZNDGv3LsVE6oX6mz08COT6kvUoTb2mE6bXomU5+H
 CAA94xU4XabwRek8eRLB7defSRMXM5RoNI5s2mtZ7im1ldOEwHb7tPUYf022De2lRRAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ne6to4SSZ0+b7v5LsSXKG8SSmXeSgITXbtXtBYdXFmU=; b=bAFRE0IHbELX1CkLZzMwQbmp2G
 5fjZRmXj/YBCarwM7dz3LfUgOIE09lm/lY3yLn4pb7588l7sFJl5F+IuwVQP7oxxl0A1vkqmakn14
 iJCUrtDWWkbBaFTtSTdg4AGW7hO/GmQwqa8e4Zebr4cqHnxSgkSVZbMPzys+vDbt0odI=;
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMUu3-00055Y-2J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 16:54:19 +0000
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5240a432462so25904e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Jun 2025 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748969653; x=1749574453; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne6to4SSZ0+b7v5LsSXKG8SSmXeSgITXbtXtBYdXFmU=;
 b=O9C3SeUV5+/2BcmvISwJFMUBOylk077WM2wCGP8iMIiEqQ2mRBf7M/66Myc6pNnJx9
 G7ZhARVgsnVWfkpMlO8gbCef+BBMmpi2zSxZLusy76/zMNuuiuYNET3RS9O+gly42Q2S
 CQWJsGlkifYfJhYk4Bf4EJdi8PTZfIekbKXH6uphL0pSdugKP0lOHi0s4WKmF7CkRosL
 jVzNsgGIBJMVAsobnlcF4tG3iN34ccybhbHqzAhT9oMQRC2qjLbsFkNbu31HWGalgNY1
 tqCIcjAMyEp4sp8DECEA+zCfNFyjNmT7Cm8mbILlioGUBXtwQWjzDG/eQJIevB92YbvM
 uxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748969653; x=1749574453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ne6to4SSZ0+b7v5LsSXKG8SSmXeSgITXbtXtBYdXFmU=;
 b=KX8eMvzRzDkea1FXf7p7AZKPY3JKk+r7zeOBCPqkJnP32VUqJ5e0oRrlamLWpGOFtR
 c4U7UagYKeDpXN2afEtitwBX7XfVeT+Hty00eDkZwdFLLGldjcaS23AMUwgqJdE4+V7l
 CqjES6rgUNk7+h3aaAwmhHs3QbBu86MR/H1tUdkZkuWC7uSu1hBNmYz+2tzEzda4l5Ug
 9uDLx/JMqDd9D2bh4fl+bNqu/B2gze/B4RRG2TZCbneNz1IS0qSTviVO3+RSOluoPWhN
 M98YcVPICqo5SZn7opKYnvVfYBxdz3DbzLW4lNfAsLj0sd0ZSDqkmb97tIRH/JWOR+ul
 Nx8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQYOsktZvN+JdEEG84IbsFVE/9kbi7FPpx+9LNNu0ZZx5OzfAc80pMTp+Hhb8E2h9LT1YW+7D0DVupf1HHrjLD@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyPjU8oulpnSrfClWQmrWPEqaAscU9YnTFDVy5ffuxdle9rh+PX
 opAQLvS2FM/lGO30ypDVsG683mosFX+jZ4jWab3S0hiXv22HslDcYCusFNGhG7puXLymWQYhbMv
 oWXWJSH1N5ZkREC3mtQQEvg6Q8d5M42I=
X-Gm-Gg: ASbGncuWugdMbgFsGrRK3HYVuwrlEdktIPLkElJwNGsHkRFxRm3KDo8pELmoz7sQSuB
 OTjkG4mGd7u+6RjKOym//rMciUaEID5eQifNUQpusdbDF/r5T3hvmjk4/nmsVcRiYUu60nkfyMW
 MwucuUKVN/dNbsB2laNAst+fYGT/gwUp9y13AjZXc3Yb8LtBY4gCqiVlJlxVAEGMI=
X-Google-Smtp-Source: AGHT+IE7IgFO0B3aKxs0VXwJm8FM0kJxx2OSQh4fj6glvX/e7XP4HpcJ6AJe54Zj1RZqOsdjXqlEsKG1XELfSQIDPjs=
X-Received: by 2002:a05:6122:3105:b0:530:7e05:2029 with SMTP id
 71dfb90a1353d-530ba56e670mr3211987e0c.6.1748969653026; Tue, 03 Jun 2025
 09:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250603072618.16171-1-chao@kernel.org>
 <CACOAw_wNX1Bn2FofztAujxSZ3n+R3genZ-_SwvZHs=8K5Lt-Jw@mail.gmail.com>
In-Reply-To: <CACOAw_wNX1Bn2FofztAujxSZ3n+R3genZ-_SwvZHs=8K5Lt-Jw@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 3 Jun 2025 09:54:01 -0700
X-Gm-Features: AX0GCFtm_o9h9OXIgQOo3Ae7qZzPDhjHveTNvzrKxtT-PTgVC1pWNdfVaIPV_FM
Message-ID: <CACOAw_wH5AvS7C_dVOYz_Gf7Bi0-oYKHC7Z7fC8pJU6hjzOfPw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 3, 2025 at 9:52 AM Daeho Jeong wrote: > > On
    Tue, Jun 3, 2025 at 12:29 AM Chao Yu via Linux-f2fs-devel > wrote: > >
   > > fsck.c: In function ‘chk_and_fix_wp_with_sit’: > > fsck. [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.177 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.177 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.221.177 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.177 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1uMUu3-00055Y-2J
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix to avoid using uninitialized
 buffer
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
Cc: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMywgMjAyNSBhdCA5OjUy4oCvQU0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDMsIDIwMjUgYXQgMTI6MjnigK9BTSBDaGFv
IFl1IHZpYSBMaW51eC1mMmZzLWRldmVsCj4gPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0PiB3cm90ZToKPiA+Cj4gPiBmc2NrLmM6IEluIGZ1bmN0aW9uIOKAmGNoa19hbmRf
Zml4X3dwX3dpdGhfc2l04oCZOgo+ID4gZnNjay5jOjM1Mjk6MTc6IGVycm9yOiB2YXJpYWJsZS1z
aXplZCBvYmplY3QgbWF5IG5vdCBiZSBpbml0aWFsaXplZAo+ID4gIDM1MjkgfCAgICAgICAgICAg
ICAgICAgY2hhciBidWZmZXJbRjJGU19CTEtTSVpFXSA9IHt9Owo+ID4gICAgICAgfCAgICAgICAg
ICAgICAgICAgXn5+fgo+ID4KPiA+IFRoZSByZWFzb24gaXMgRjJGU19CTEtTSVpFIG1hY3JvIGlz
IGRlZmluZWQgdy8gYy5ibGtzaXplLCBsZXQncyB1c2UKPiA+IGNhbGxvYygpIHRvIGFsbG9jYXRl
IHplcm9lZCBtZW1vcnkgdG8gZml4IHRoaXMgaXNzdWUuCj4gPgo+ID4gQ2M6IERhZWhvIEplb25n
IDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBmc2NrL2ZzY2suYyB8IDcgKysrKysrLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZnNjay9mc2NrLmMgYi9mc2NrL2ZzY2suYwo+ID4gaW5kZXggNGQwNWUxYi4uYmIz
OWY4YiAxMDA2NDQKPiA+IC0tLSBhL2ZzY2svZnNjay5jCj4gPiArKysgYi9mc2NrL2ZzY2suYwo+
ID4gQEAgLTM1MjYsNyArMzUyNiw3IEBAIHN0YXRpYyBpbnQgY2hrX2FuZF9maXhfd3Bfd2l0aF9z
aXQoaW50IFVOVVNFRChpKSwgdm9pZCAqYmxrem9uZSwgdm9pZCAqb3BhcXVlKQo+ID4KPiA+ICAg
ICAgICAgcmV0ID0gZjJmc19maW5pc2hfem9uZSh3cGQtPmRldl9pbmRleCwgYmxreik7Cj4gPiAg
ICAgICAgIGlmIChyZXQpIHsKPiA+IC0gICAgICAgICAgICAgICB1OCBidWZmZXJbRjJGU19CTEtT
SVpFXSA9IHt9Owo+ID4gKyAgICAgICAgICAgICAgIHU4ICpidWZmZXI7Cj4gPiAgICAgICAgICAg
ICAgICAgdTY0IGJsa19hZGRyID0gd3BfYmxvY2s7Cj4gPiAgICAgICAgICAgICAgICAgdTY0IGZp
bGxfc2VjdHMgPSBibGtfem9uZV9sZW5ndGgoYmxreikgLQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgKGJsa196b25lX3dwX3NlY3RvcihibGt6KSAtIGJsa196b25lX3NlY3RvcihibGt6KSk7
Cj4gPiBAQCAtMzUzNCw2ICszNTM0LDkgQEAgc3RhdGljIGludCBjaGtfYW5kX2ZpeF93cF93aXRo
X3NpdChpbnQgVU5VU0VEKGkpLCB2b2lkICpibGt6b25lLCB2b2lkICpvcGFxdWUpCj4gPiAgICAg
ICAgICAgICAgICAgc3RydWN0IHNlZ19lbnRyeSAqc2UgPSBnZXRfc2VnX2VudHJ5KHNiaSwgd3Bf
c2Vnbm8pOwo+ID4gICAgICAgICAgICAgICAgIGVudW0gcndfaGludCB3aGludCA9IGYyZnNfaW9f
dHlwZV90b19yd19oaW50KHNlLT50eXBlKTsKPiA+Cj4gPiArICAgICAgICAgICAgICAgYnVmZmVy
ID0gY2FsbG9jKEYyRlNfQkxLU0laRSwgMSk7Cj4gPiArICAgICAgICAgICAgICAgQVNTRVJUKGJ1
ZmZlcik7Cj4gPiArCj4gPiAgICAgICAgICAgICAgICAgcHJpbnRmKCJbRlNDS10gRmluaXNoaW5n
IHpvbmUgZmFpbGVkOiAlc1xuIiwgZGV2LT5wYXRoKTsKPiA+ICAgICAgICAgICAgICAgICB3aGls
ZSAobGVuLS0pIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGRldl9maWxsX2Js
b2NrKGJ1ZmZlciwgYmxrX2FkZHIrKywgd2hpbnQpOwo+ID4gQEAgLTM1NDIsNiArMzU0NSw4IEBA
IHN0YXRpYyBpbnQgY2hrX2FuZF9maXhfd3Bfd2l0aF9zaXQoaW50IFVOVVNFRChpKSwgdm9pZCAq
Ymxrem9uZSwgdm9pZCAqb3BhcXVlKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAg
ICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgZnJlZShidWZmZXIpOwo+ID4gICAgICAgICB9
Cj4gPgo+ID4gICAgICAgICBpZiAoIXJldCkKPiA+IC0tCj4gPiAyLjQwLjEKPiA+Cj4KPiBSZXZp
ZXdlZC1ieTogQ2hhbyBZdSA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Cj4gVGhhbmtzLAoKT29w
cywKClJldmlld2VkLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKVGhh
bmtzLAoKPgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
