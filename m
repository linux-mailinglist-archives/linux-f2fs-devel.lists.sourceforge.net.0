Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3479ABBD9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 04:49:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3RR8-0007hH-VX;
	Wed, 23 Oct 2024 02:49:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t3RR2-0007h7-Nj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 02:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wiaRh5RUNm5O6Dddihn/O/4m6jy7rccRtfMj6bKeym0=; b=LNhZPPiVMLbIUO6RZcuLAEhr+3
 W5RctTjmIMQAMDXXILKo6NpZmgKDx8PvF/VrLq2omomxczrWVM2JSQqgp9crVlotE0CP40NSZL0Tl
 2xcj02Daxop/kAOWLptmr7WeNTYYPUDcSwv2iYkT18jBMaziBJqFMEfHIfUmFWhr2MxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wiaRh5RUNm5O6Dddihn/O/4m6jy7rccRtfMj6bKeym0=; b=QvZN3Y+h0+2Vcf5EJArS5j76Zz
 KBJGLpyVs/G4Xl1JNxShJU4iP4GQKGl3r/vyCxUJuIKN7qy9DMGucO5S0jgqnTTpOi3cadKdpa9ys
 xnTeZo0hLueh53cbCd0wwGkJqNCuQQSOeFM5wa6S+36bvM4JY0a6Re6N1rI4rWawMDng=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t3RR1-0004hb-DX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 02:49:20 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4315dfa3e0bso8205965e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Oct 2024 19:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729651753; x=1730256553; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiaRh5RUNm5O6Dddihn/O/4m6jy7rccRtfMj6bKeym0=;
 b=Iu6Xrl6cSxs6nQ6ejG1RpehLiHhO3P81J2+yqTQkme6BQg0XDLA2e6S2IqntECtlim
 G+M52y8Ks1FGbw0wKPcXOSTNpsbcWyv5Nlh2Soq43N8SqOQ/khVXQnsAA3Hajm6813h0
 qZADgG1TJNUcoqhtddb7F98u502iwCL3EzQLVTRtK71931KijwuNBZHHy/A8c+83e3f/
 E3cGTcuJWf2fHKRRGpEOJI7aQzEOmo8T0X7AnpFd8rb6w/5iJYlYnYTPYctthKVNLtjy
 INa6bAXY9q5LYft3JFWNGFSVgKKL7ovEkRC8m8OzQ8FyLjdu+5jnsw2GNE4QD3qTM4kB
 lRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729651753; x=1730256553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wiaRh5RUNm5O6Dddihn/O/4m6jy7rccRtfMj6bKeym0=;
 b=LR6PH66qRZ4F6qDgBDIhvbdjKtB5HSAmJQT0H2IySaWf22UPOQU345Gq9M/Mt4t6/V
 KGgKI5wWyRL3/Ds2cE6gD+fcrv0LFsvrCv169m2yWSL3FxYadIEpm8oSBzL2GZj14YVs
 Kc4RlBXU3oBGrfFoJ5a15WidaTUwYpBbm6cXF7q2Y1iMlkctoegz8QhN1OGmKKtqk1Y8
 EU1vqp9+FZpNSbhDsLhskye7sGSf/bWvZL52GtU8FxijXrDJ1js+XR83NH/v9FgGrvGZ
 4lO9qMvkpqixIcoP6IDlq/bs8A6SWAVL7CB3WzX5qLfDg5bfkYcxN7P0/ZnKJ/8jYYqE
 pLMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZJgxA6aab3r5zDAdUR9UksCJJigY/lfJgRi7Nk1yi1cLItivCja4kgPdfuAjpzS6bvzFf1j+E0yjzuCgks8iy@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyIE+BFzFJzrQ9EmNbXAiPGC7OHuoZR5q6IN6f/OzvLrxDQkstZ
 ntUiYMGiYY/PKaRaOxTHMa3aJshhXBi+tIdDXef38N/3AJTnI/YNIDDtLMM2FifvoB6RzQeNRYh
 dEyNTJUA+pIRSc1dBaMj+BLoOnLs=
X-Google-Smtp-Source: AGHT+IEUJoKVzePOgGPBj2D4HiQDP9RAbWYiWW3odar1X34BtNWzUhkR7VlayUrdPqiWROj0Jxkw/v7JTB3/9q89P0c=
X-Received: by 2002:a05:600c:3ba2:b0:42c:ba6c:d9a7 with SMTP id
 5b1f17b1804b1-431841b54e8mr3796195e9.4.1729651752539; Tue, 22 Oct 2024
 19:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <1729588481-29390-1-git-send-email-zhiguo.niu@unisoc.com>
 <28ad2c90-a95c-440a-ae6a-5fb19bacd252@kernel.org>
In-Reply-To: <28ad2c90-a95c-440a-ae6a-5fb19bacd252@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 23 Oct 2024 10:49:01 +0800
Message-ID: <CAHJ8P3++emTdFd0NYUxqVr47dsRmfiCWLpCUuK+TN60pN_4fTA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年10月23日周三 10:42写道： > > On 2024/10/22
    17:14, Zhiguo Niu wrote: > > GC_URGENT_MID is introduced by commit > > d98af5f45520
    ("f2fs: introduce gc_urgent_mid mode"), aim to [...] 
 
 Content analysis details:   (-1.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.49 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t3RR1-0004hb-DX
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid use GC_AT when setting
 gc_mode as GC_URGENT_MID
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTDmnIgyM+aXpeWRqOS4iSAxMDo0
MuWGmemBk++8mgo+Cj4gT24gMjAyNC8xMC8yMiAxNzoxNCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
IEdDX1VSR0VOVF9NSUQgaXMgaW50cm9kdWNlZCBieSBjb21taXQKPiA+IGQ5OGFmNWY0NTUyMCAo
ImYyZnM6IGludHJvZHVjZSBnY191cmdlbnRfbWlkIG1vZGUiKSwgYWltIHRvIGRvZXMgR0MKPiA+
IGZvcmNpYmx5IHVzZXMgY29zdCBiZW5lZml0IEdDIGFwcHJvYWNoLCBidXQgaWYgQVRHQyBpcyBl
bmFibGVkIGF0Cj4gPiB0aGUgc2FtZSB0aW1lLCBBZ2UtdGhyZXNob2xkIGFwcHJvYWNoIHdpbGwg
YmUgc2VsZWN0ZWQsIHdoaWNoIGNhbiBvbmx5Cj4gPiBkbyBhbW91bnQgb2YgR0MgYW5kIGl0IGlz
IG11Y2ggbGVzcyB0aGFuIHRoZSBudW1iZXJzIG9mIENCIGFwcHJvYWNoLgo+Cj4gZ2MgdXJnZW50
IGxvdygyKTogbG93ZXJzIHRoZSBiYXIgb2YgY2hlY2tpbmcgSS9PIGlkbGluZyBpbgo+ICAgICAg
ICAgICAgICAgICAgIG9yZGVyIHRvIHByb2Nlc3Mgb3V0c3RhbmRpbmcgZGlzY2FyZCBjb21tYW5k
cyBhbmQgR0MgYQo+ICAgICAgICAgICAgICAgICAgIGxpdHRsZSBiaXQgYWdncmVzc2l2ZWx5LiB1
c2VzIGNvc3QgYmVuZWZpdCBHQyBhcHByb2FjaC4KPgo+IEdDX1VSR0VOVF9MT1cgdXNlcyBDQiBh
bGdvcml0aG0gYXMgd2VsbD8KSGkgQ2hhby4KT0gsIHllcywgdGhhbmtzIQo+Cj4gVGhhbmtzLAo+
Cj4gPgo+ID4gc29tZSB0cmFjZXM6Cj4gPiAgICBmMmZzX2djLTI1NDo0OC0zOTYgICAgIFswMDdd
IC4uLi4uIDIzMTE2MDAuNjg0MDI4OiBmMmZzX2djX2JlZ2luOiBkZXYgPSAoMjU0LDQ4KSwgZ2Nf
dHlwZSA9IEJhY2tncm91bmQgR0MsIG5vX2JhY2tncm91bmRfR0MgPSAwLCBucl9mcmVlX3NlY3Mg
PSAwLCBub2RlcyA9IDEwNTMsIGRlbnRzID0gMiwgaW1ldGEgPSAxOCwgZnJlZV9zZWM6NDQ4OTgs
IGZyZWVfc2VnOjQ0ODk4LCByc3Zfc2VnOjIzOSwgcHJlZnJlZV9zZWc6MAo+ID4gICAgZjJmc19n
Yy0yNTQ6NDgtMzk2ICAgICBbMDA3XSAuLi4uLiAyMzExNjAwLjY4NDUyNzogZjJmc19nZXRfdmlj
dGltOiBkZXYgPSAoMjU0LDQ4KSwgdHlwZSA9IE5vIFRZUEUsIHBvbGljeSA9IChCYWNrZ3JvdW5k
IEdDLCBMRlMtbW9kZSwgQWdlLXRocmVzaG9sZCksIHZpY3RpbSA9IDEwLCBjb3N0ID0gNDI5NDM2
NDk3NSwgb2ZzX3VuaXQgPSAxLCBwcmVfdmljdGltX3NlY25vID0gLTEsIHByZWZyZWUgPSAwLCBm
cmVlID0gNDQ4OTgKPiA+ICAgIGYyZnNfZ2MtMjU0OjQ4LTM5NiAgICAgWzAwN10gLi4uLi4gMjMx
MTYwMC43MTQ4MzU6IGYyZnNfZ2NfZW5kOiBkZXYgPSAoMjU0LDQ4KSwgcmV0ID0gMCwgc2VnX2Zy
ZWVkID0gMCwgc2VjX2ZyZWVkID0gMCwgbm9kZXMgPSAxNTYyLCBkZW50cyA9IDIsIGltZXRhID0g
MTgsIGZyZWVfc2VjOjQ0ODk4LCBmcmVlX3NlZzo0NDg5OCwgcnN2X3NlZzoyMzksIHByZWZyZWVf
c2VnOjAKPiA+ICAgIGYyZnNfZ2MtMjU0OjQ4LTM5NiAgICAgWzAwN10gLi4uLi4gMjMxMTYwMC43
MTQ4NDM6IGYyZnNfYmFja2dyb3VuZF9nYzogZGV2ID0gKDI1NCw0OCksIHdhaXRfbXMgPSA1MCwg
cHJlZnJlZSA9IDAsIGZyZWUgPSA0NDg5OAo+ID4gICAgZjJmc19nYy0yNTQ6NDgtMzk2ICAgICBb
MDA3XSAuLi4uLiAyMzExNjAwLjc3MTc4NTogZjJmc19nY19iZWdpbjogZGV2ID0gKDI1NCw0OCks
IGdjX3R5cGUgPSBCYWNrZ3JvdW5kIEdDLCBub19iYWNrZ3JvdW5kX0dDID0gMCwgbnJfZnJlZV9z
ZWNzID0gMCwgbm9kZXMgPSAxNTYyLCBkZW50cyA9IDIsIGltZXRhID0gMTgsIGZyZWVfc2VjOjQ0
ODk4LCBmcmVlX3NlZzo0NDg5OCwgcnN2X3NlZzoyMzksIHByZWZyZWVfc2VnOgo+ID4gICAgZjJm
c19nYy0yNTQ6NDgtMzk2ICAgICBbMDA3XSAuLi4uLiAyMzExNjAwLjc3MjI3NTogZjJmc19nY19l
bmQ6IGRldiA9ICgyNTQsNDgpLCByZXQgPSAtNjEsIHNlZ19mcmVlZCA9IDAsIHNlY19mcmVlZCA9
IDAsIG5vZGVzID0gMTU2MiwgZGVudHMgPSAyLCBpbWV0YSA9IDE4LCBmcmVlX3NlYzo0NDg5OCwg
ZnJlZV9zZWc6NDQ4OTgsIHJzdl9zZWc6MjM5LCBwcmVmcmVlX3NlZzowCj4gPgo+ID4gRml4ZXM6
IGQ5OGFmNWY0NTUyMCAoImYyZnM6IGludHJvZHVjZSBnY191cmdlbnRfbWlkIG1vZGUiKQo+ID4g
U2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4gLS0t
Cj4gPiAgIGZzL2YyZnMvZ2MuYyB8IDEgKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4g
PiBpbmRleCBlNDBiZGQxLi5kYWVjZjY5IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9nYy5jCj4g
PiArKysgYi9mcy9mMmZzL2djLmMKPiA+IEBAIC0yNTcsNiArMjU3LDcgQEAgc3RhdGljIGludCBz
ZWxlY3RfZ2NfdHlwZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBnY190eXBlKQo+ID4K
PiA+ICAgICAgIHN3aXRjaCAoc2JpLT5nY19tb2RlKSB7Cj4gPiAgICAgICBjYXNlIEdDX0lETEVf
Q0I6Cj4gPiArICAgICBjYXNlIEdDX1VSR0VOVF9NSUQ6Cj4gPiAgICAgICAgICAgICAgIGdjX21v
ZGUgPSBHQ19DQjsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBjYXNlIEdDX0lE
TEVfR1JFRURZOgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
