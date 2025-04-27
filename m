Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC3A9DE77
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 03:50:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8rA6-0007FA-BU;
	Sun, 27 Apr 2025 01:50:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1u8rA4-0007F2-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 01:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVW22zqynRhaurB30bFNMQoMFzwX+d8CTfeiGCZ0dhI=; b=jFVrrF+odwz8sHYdkpSWVnJL6Z
 o6xAYeGYndPzr5Wx/qRpUqUjRLMpFNZNvhGElzj2OdmK6nV1b7RhnFhvshB64DzzmAwKla3GPZSBq
 i8cyLCZexgQ6cdcvYQI7DxUe6lOUNLp4ugQG125cEM+Qiw5bDcVB1iejzqZG5LcabPAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eVW22zqynRhaurB30bFNMQoMFzwX+d8CTfeiGCZ0dhI=; b=TFIOho1TX1OTbM9vq91wcijzhX
 4bQXhrmv/mUtglSFKFCnetPF9ZDblq3M+Bd85+OyFDNsLYKWm6EoUkks63MJh15r2BTX5GCMuO/Ic
 piGUTHqNaTHP+KsEO2+dMWQksfe6dST8Bc1f0x8UpgtY41rjxivgpwejMVKqCkM03+XQ=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u8r9p-0006gX-3V for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 01:50:28 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39d94327297so441362f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 26 Apr 2025 18:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745718601; x=1746323401; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVW22zqynRhaurB30bFNMQoMFzwX+d8CTfeiGCZ0dhI=;
 b=hQbdCFQUXjBj+0QwF2lOYuNG+nlJmvjgSW2jP+MQoIEJnLqO6K9ylmH3Elwp3PsnMQ
 iVKuvHEjvGt4BG9My4gpdYycRpLDhr3OcR4OkuqrHZh3RwncMmZJlITpF2BPtHi+uddi
 oFuy+/YvEqLHsDs0W0rhEXc3LVjyRhrQvwLM8na2JwSnp0BJ5c0/d98vYOyk/u7tP1k1
 QYy+OFx/aneFCSsckLzKdoZe592PPszucgyKMv62Kka/9yIJi7l/nt1s21W3ZbpEXPAv
 FNddefVdv+BjxlgJMy64y/1g7Mhi0iwgzpwol3A/uj76Efbfxg8lLOT88jTO7T+uNZjy
 zIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745718601; x=1746323401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVW22zqynRhaurB30bFNMQoMFzwX+d8CTfeiGCZ0dhI=;
 b=squHA7r43HQvdy60aLIYcsIb9LB3S3js/DCqlLD18K6LVY6Q7TxaZmNL3Jes+OTBrj
 0Olf8dRg/K60sUMyDtkL+D4cqcOtiWeUWtjXwYQ/FSgVEqtmm8qG/OPYcQYIzH0s+9yU
 qPsAtQ3VHQnr3tKBibQ8+2LuUlRUPXlB4QBtfb0RcG63RNr6ylN7br4nGYFUIHjB6dA5
 tccW++Ak0QrYiYUowiL44AY9BMjmwZdo4OOOfFXKkhJ9kEWFtFH64xPKFguq+OmZnAOm
 /wHLWLorJe/5Fady5gtvRDTw6DMbqGO6mvBSkrXIXA3YHiyPDQxl2jHLVs+xIbGlHLB7
 ApYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxkwYREEHTBCQlyup2N6bQ3THHp1sYzfVyUZlEjxQnV8rwSuthRtfgSJU1bdj/+oFo5lSViQ97YMuENiOm2vKx@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx4uAde2oGzK61PDf1e/bm5JBG6kNr4NDmXlZBx9qWPZ3nRmMv3
 GgrW7i3unH3bIB7uZCgOQC6L1u3n7FLERqgcSEhM04tMsEWv7F49By0qnvnMUxftmSWvDMqaInG
 u0Mfg9FdE0a+q/p4B+yDpHAnXQ4TtZFfI
X-Gm-Gg: ASbGncvIUz09boDncJyMsrbD6XXbrpQ3rT5cmeGf1cF3lEbY2PuAQj0opn3kGDWPu95
 jUvy0o1XKiDjxqE+FlSAS7EAloHQNrLps5plcxhtmOgKS+4b/urgdQzTrJ/+ubUAgOixkYqyn6N
 q9dgG2apQlGhOSPxF0yECqTx0=
X-Google-Smtp-Source: AGHT+IF4iUwHsaLLqp+I0p+Q6zkUZicoDg5VKVJFHSsPIujnQ9u2jwaFSn3Rvs1SJD1NAqrZGLzURSSArsk3vjG+rLU=
X-Received: by 2002:a05:6000:2507:b0:3a0:7119:cefa with SMTP id
 ffacd0b85a97d-3a074f83ff3mr1835784f8f.16.1745718600914; Sat, 26 Apr 2025
 18:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHJ8P3KgngtQdZP-fCOM-X5-16-JgRLYJeNFc2h4zNQu6uPS9g@mail.gmail.com>
 <ab8d88cb-bfb8-44eb-9cd8-89cf7216e728@kernel.org>
In-Reply-To: <ab8d88cb-bfb8-44eb-9cd8-89cf7216e728@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Sun, 27 Apr 2025 09:49:49 +0800
X-Gm-Features: ATxdqUF_Uw4-QYkDDU1lKrxXvpXLG9dEsvgcH2a7JGS1o0h3rvfnL-vaaJ4zZSQ
Message-ID: <CAHJ8P3LuRQ8AgYYfMic44MmO7WeV0Y+CZ9DtMDMQMbmXzu2FqQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao Chao Yu 于2025年4月25日周五 13:30写道： >
    > Zhiguo, > > On 4/25/25 13:11, Zhiguo Niu wrote: > > Hi Chao and Jaegeuk,
    > > > > I encountered a problem with node footer data being corrupted on
   [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.51 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.221.51 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.51 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.51 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1u8r9p-0006gX-3V
Subject: Re: [f2fs-dev] f2fs node footer data corruption in Android device
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbwoKQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NOaciDI15pel5ZGo
5LqUIDEzOjMw5YaZ6YGT77yaCj4KPiBaaGlndW8sCj4KPiBPbiA0LzI1LzI1IDEzOjExLCBaaGln
dW8gTml1IHdyb3RlOgo+ID4gSGkgQ2hhbyBhbmQgSmFlZ2V1aywKPiA+Cj4gPiBJIGVuY291bnRl
cmVkIGEgcHJvYmxlbSB3aXRoIG5vZGUgZm9vdGVyIGRhdGEgYmVpbmcgY29ycnVwdGVkIG9uIGFu
Cj4gPiBBbmRyb2lkIGRldmljZS4oa2VybmVsIHZlcnNpb24gNi42IGFuZCBhbmRyb2lkIHZlcnNp
b246MTUpCj4gPiBhZnRlciBJIG1lcmdlZCB0aGUgZm9sbG93aW5nIHBhdGNoZXMsIHRoZSBwcm9i
bGVtIHN0aWxsIGV4aXN0cy4KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy10b29scy5naXQvY29tbWl0Lz9oPWRldi10ZXN0Jmlk
PWViYTA4NDE0YzU4NWY5MDc2MGM0MzEyZjU3ZGVhNzhlYTQ1Y2I1Y2IKPiA+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy5naXQvY29t
bWl0L2ZzL2YyZnM/aD1kZXYtdGVzdCZpZD0xOTQyNmM0OTg4YWE4NTI5OGMxYjRjYWYyODg5ZDM3
ZWM1YzgwZmVhCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC9mcy9mMmZzP2g9ZGV2LXRlc3QmaWQ9YzJlY2Jh
MDI2NTg2Y2RhNmM3ZGMwZmU5ZTZlNjBlN2U5Mzg2YzNiZAo+ID4gYW5kIHRoZXJlIGlzIG5vIG5h
dF9iaXRzIGluIG1vdW50IG9wdGlvbi4KPiA+Cj4gPiBJIGFtIHN0aWxsIGRlYnVnZ2luZywgYW5k
IHdvdWxkIGxpa2UgdG8gYXNrIGRvIHlvdSBoYXZlIGFueSBvdGhlcgo+ID4gaGludHMgb3Igc3Vn
Z2VzdGlvbnM/Cj4gPiBUaGUgaXNzdWUgc2VlbSB0byBiZSBjbG9zZWx5IHJlbGF0ZWQgdG8gYWRi
IHJlbW91bnQuCj4gPgo+ID4gdGVzdCBzdGVwczoKPiA+IHBpbmcgMTI3LjAuMC4xIC1uIDIwID4g
bnVsCj4gPiBhZGIuZXhlIC1zIG15ZGV2aWNlICB3YWl0LWZvci1kZXZpY2UKPiA+IGFkYi5leGUg
IC1zIG15ZGV2aWNlIHJlYm9vdCBib290bG9hZGVyCj4gPiBmYXN0Ym9vdCAtcyBteWRldmljZSAg
ZXJhc2UgdXNlcmRhdGEKPiA+IGZhc3Rib290IC1zIG15ZGV2aWNlICBlcmFzZSBjYWNoZQo+ID4g
ZmFzdGJvb3QgLXMgbXlkZXZpY2UgIHJlYm9vdAo+ID4gcGluZyAxMjcuMC4wLjEgLW4gMzAgPiBu
dWwKPiA+IGFkYi5leGUgLXMgbXlkZXZpY2Ugd2FpdC1mb3ItZGV2aWNlCj4gPiBhZGIuZXhlIC1z
IG15ZGV2aWNlIHJvb3QKPiA+IGFkYi5leGUgLXMgbXlkZXZpY2UgcmVtb3VudAo+Cj4gQW55IGNo
YW5nZSBmb3IgbW91bnQgb3B0aW9uPyBDYW4geW91IHByb3ZpZGUgbW91bnQgb3B0aW9uIGJlZm9y
ZS9hZnRlcgo+IHJlbW91bnQ/Cj4KPiA+IGFkYi5leGUgLXMgbXlkZXZpY2Ugc2hlbGwgICBybSAt
cmYgL2RhdGEvc29tZWZpbGUvKgo+Cj4gSG93IGFib3V0IGVuYWJsaW5nIGFsbCBmMmZzIHRyYWNl
cG9pbnRzIHRvIGNhdGNoIGhvdyB0YXJnZXQgbm9kZSB3YXMKPiB1cGRhdGVkPwpUaGFua3MgZm9y
IHlvdXIgcXVpY2sgZmVlZGJhY2ssIHRoaXMgaXMgYSB1c2VmdWwgc3VnZ2VzdGlvbi4KVGhhbmtz
IGEgbG90Lgo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4gZG1lc2c6Cj4gPiBkbS01OTogdXNlcmRhdGEg
cGFydGl0aW9uLCBkbS03OiBzY3JhdGNoIGltYWdlIHBhcnRpdGlvbiBpcyBmb3IgYWRiIHJlbW91
bnQKPiA+IFsgICAgMy44OTM2MzBdIEYyRlMtZnMgKGRtLTU5KTogVXNpbmcgZW5jb2RpbmcgZGVm
aW5lZCBieSBzdXBlcmJsb2NrOgo+ID4gdXRmOC0xMi4xLjAgd2l0aCBmbGFncyAweDAKPiA+IFsg
ICAgMy45MzAyMTNdIEYyRlMtZnMgKGRtLTU5KTogTW91bnRlZCB3aXRoIGNoZWNrcG9pbnQgdmVy
c2lvbiA9IDM4NDg1YjJkCj4gPiBbICAgMjAuNTg0MTY5XSBGMkZTLWZzIChkbS03KTogTW91bnRl
ZCB3aXRoIGNoZWNrcG9pbnQgdmVyc2lvbiA9IDQyMTMwZWYKPiA+IFsgICAzOC4wMzkxMjJdIEYy
RlMtZnMgKGRtLTU5KTogaW5jb25zaXN0ZW50IG5vZGUgYmxvY2ssIG5pZDoxNDI2LAo+ID4gbm9k
ZV9mb290ZXJbbmlkOjEyOTU2NTAyMSxpbm86Mjc1NjA2MjI5OCxvZnM6MjY3ODI4NDUsY3B2ZXI6
NjQyMTcwMzE2NTE3OTgyNjkxMixibGthZGRyOjM1Nzc4NTExNDddCj4gPiBbICAgMzguMDQ4MzEw
XSBGMkZTLWZzIChkbS01OSk6IGluY29uc2lzdGVudCBub2RlIGJsb2NrLCBuaWQ6MTQyNiwKPiA+
IG5vZGVfZm9vdGVyW25pZDoxMjk1NjUwMjEsaW5vOjI3NTYwNjIyOTgsb2ZzOjI2NzgyODQ1LGNw
dmVyOjY0MjE3MDMxNjUxNzk4MjY5MTIsYmxrYWRkcjozNTc3ODUxMTQ3XQo+ID4gWyAgIDM4LjA1
MTcyNV0gRjJGUy1mcyAoZG0tNTkpOiBpbmNvbnNpc3RlbnQgbm9kZSBibG9jaywgbmlkOjE0MjYs
Cj4gPiBub2RlX2Zvb3RlcltuaWQ6MTI5NTY1MDIxLGlubzoyNzU2MDYyMjk4LG9mczoyNjc4Mjg0
NSxjcHZlcjo2NDIxNzAzMTY1MTc5ODI2OTEyLGJsa2FkZHI6MzU3Nzg1MTE0N10KPiA+IHRoYW5r
cwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
