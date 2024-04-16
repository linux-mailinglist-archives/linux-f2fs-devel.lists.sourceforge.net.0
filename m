Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B18A6973
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 13:13:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwgkM-0002aE-TF;
	Tue, 16 Apr 2024 11:13:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rwgkM-0002a7-71
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 11:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PbUPOuMnOE/umSxfXm7CSrZKzlxGjr6mzObmpaJH4IE=; b=BLMyAxW2eX6E/RqZjpR7Cg+mNV
 qNx7BUkQaAHXk1cv9iHxGL4zoP+RvoYuoX1ZwJQ6YTgXGho5lG8jup0kfFws38qkDV7J+NJtaqhEk
 nwTZwnz8zXOJzyDSYnfJ0QiAVx3OCOJAB7MRc+ufY2+0x8PTFRxUuB+nb7AGP40tlKtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PbUPOuMnOE/umSxfXm7CSrZKzlxGjr6mzObmpaJH4IE=; b=i2BRFOjbDQ6PRNVG0EohhPIHND
 v99awd0fN+QWqgsSJk62aKbFscp4vYnN6aSfUekHu9IIFvGlhS7oz4nFOOWpr1QXIP77OjiHlfzTA
 6LOmThOY9757l5rsbV503mEbLQF/ZvbkLaluiP7WMb+IcthbgWds8NewgMNCKP/MJGUw=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgkL-0005VG-UZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 11:13:06 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so2235439f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 04:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713265974; x=1713870774; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbUPOuMnOE/umSxfXm7CSrZKzlxGjr6mzObmpaJH4IE=;
 b=Mc6VLZ2/KBAZNxV+dwj3q8xk9+iu1j72MtGA7JAyFQFN6/NYmPqT8FnKYTUba4srNr
 Cd4abmUuor7wsrZ+LgqmjRBPLk+RK0tOnaj389YtawlRZx9cfUpD1E8gJolhQBAoO25y
 RaUkI9Osv5TzMPv8fjoDtEgStZlPJvXI6ah4XSq+hyqmBqS6nRmu5/WnQXjjC/R72WXz
 ds8aBa0otK83oJuuhXwXgE3Yzcmla8w9y8YY6WOnmyDai77g4oLrG8mZyEVgu+HI1Gd/
 XE3PQzr+YcOi0V/YMaDqx4A8nXnc3EDyR9ej6/ScTJRgSrXDgEDANHqNR1KuaQTibsnQ
 LFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713265974; x=1713870774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbUPOuMnOE/umSxfXm7CSrZKzlxGjr6mzObmpaJH4IE=;
 b=ju+vE9xHkRpbue8rPUB/EkZ1dHMoODcXu4DYJgO8CUAeG908QUJ3SFug1S1mI8SGur
 QCff6WFQtKrILFmOZk7q+ehSAAeTMMp8Mhj13TDqsYnIdLT3dGINX2rmzkPyKGpB1Dxu
 yFc7j9QBPgUSPFK70bTki8JlR5HSf1jgmnZDfHFSZ6xIweloUUA42UxUyRqQyGD0kHo3
 ICMPUOKzZzjuechFGlKOs9gwNF20/hXOgax59nVW5R9Fypoi2eca4rGOh4tTGfEnafLR
 RnMH2avLD+/PglGpFI+0/jSM+HjTpNcX7LvzbzIhMT0t8Pl4EI2xdD4gcoRTNYIREpD0
 Y9gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxTO0MLLo8Xu/Ya/pvmKRKqgePtw1vV/dMiOahoTt41co+WDSmNK3G2UYaT99ejh9718tub6zHlCuClBb8saqgZYJSB13BrqmMKfNbcwTxo5g7GjgOgA==
X-Gm-Message-State: AOJu0YyD6itCMK0rwjyreQUU5s71RICADkeoNLoHDTqE6dZJYbFm7Ozc
 0eB8j1AyihFBZfMp4NPtdBCa+xm9r9g6Czu8IiDqrweXWwL5f6dPicghBYD2k7UU0Lciti05Oot
 kaNJ39sc8D/qqoCo5n6sMGkliVF/2VR+s
X-Google-Smtp-Source: AGHT+IGlI9ysPcM/q8sX+RFxS+WBZPDDviQVyn1Ru5atuIOSfW45bZ3ZVP68betYRom20iMbJdzPzFEN26pdF/yIR5U=
X-Received: by 2002:a5d:5248:0:b0:346:20ea:2e5e with SMTP id
 k8-20020a5d5248000000b0034620ea2e5emr2033673wrc.21.1713265974040; Tue, 16 Apr
 2024 04:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240416072108.5819-1-chao@kernel.org>
 <20240416072108.5819-2-chao@kernel.org>
In-Reply-To: <20240416072108.5819-2-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 16 Apr 2024 19:12:42 +0800
Message-ID: <CAHJ8P3J4Z7QJ=kpd_Nt+TGX2ZD8HH5YQWmbPsbS7+DeN2NrxyA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 16, 2024 at 3:22 PM Chao Yu wrote: > > After
    commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size"), > F2FS_BLKSIZE
    equals to PAGE_SIZE, remove unnecessary check condition. > > [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.221.46 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1rwgkL-0005VG-UZ
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: remove unnecessary block size
 check in init_f2fs_fs()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMzoyMuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBBZnRlciBjb21taXQgZDdlOWE5MDM3ZGUyICgiZjJmczogU3VwcG9ydCBC
bG9jayBTaXplID09IFBhZ2UgU2l6ZSIpLAo+IEYyRlNfQkxLU0laRSBlcXVhbHMgdG8gUEFHRV9T
SVpFLCByZW1vdmUgdW5uZWNlc3NhcnkgY2hlY2sgY29uZGl0aW9uLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL3N1cGVyLmMgfCA2
IC0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiBpbmRleCA2ZDFlNGZjNjI5ZTIu
LjMyYWE2ZDZmYTg3MSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiArKysgYi9mcy9m
MmZzL3N1cGVyLmMKPiBAQCAtNDkzMywxMiArNDkzMyw2IEBAIHN0YXRpYyBpbnQgX19pbml0IGlu
aXRfZjJmc19mcyh2b2lkKQo+ICB7Cj4gICAgICAgICBpbnQgZXJyOwo+Cj4gLSAgICAgICBpZiAo
UEFHRV9TSVpFICE9IEYyRlNfQkxLU0laRSkgewo+IC0gICAgICAgICAgICAgICBwcmludGsoIkYy
RlMgbm90IHN1cHBvcnRlZCBvbiBQQUdFX1NJWkUoJWx1KSAhPSBCTE9DS19TSVpFKCVsdSlcbiIs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUsIEYyRlNfQkxLU0la
RSk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0gICAgICAgfQo+IC0KPiAg
ICAgICAgIGVyciA9IGluaXRfaW5vZGVjYWNoZSgpOwo+ICAgICAgICAgaWYgKGVycikKPiAgICAg
ICAgICAgICAgICAgZ290byBmYWlsOwpEZWFyIENoYW8sCgpDYW4geW91IGhlbHAgbW9kaWZ5IHRo
ZSBmb2xsb3dpbmcgIGNvbW1lbnQgbXNnIHRvZ2V0aGVyIHdpdGggdGhpcyBwYXRjaD8KVGhleSBh
cmUgYWxzbyByZWxhdGVkIHRvIGNvbW1pdCBkN2U5YTkwMzdkZTIgKCJmMmZzOiBTdXBwb3J0IEJs
b2NrClNpemUgPT0gUGFnZSBTaXplIikuCklmIHlvdSB0aGluayB0aGVyZSBpcyBhIG1vcmUgc3Vp
dGFibGUgZGVzY3JpcHRpb24sIHBsZWFzZSBoZWxwIG1vZGlmeQppdCBkaXJlY3RseS4KdGhhbmtz
77yBCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaAppbmRleCBhMzU3Mjg3Li4yNDFlN2IxOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9mMmZzX2ZzLmgKKysrIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKQEAgLTM5NCw3ICsz
OTQsOCBAQCBzdHJ1Y3QgZjJmc19uYXRfYmxvY2sgewoKIC8qCiAgKiBGMkZTIHVzZXMgNCBieXRl
cyB0byByZXByZXNlbnQgYmxvY2sgYWRkcmVzcy4gQXMgYSByZXN1bHQsIHN1cHBvcnRlZCBzaXpl
IG9mCi0gKiBkaXNrIGlzIDE2IFRCIGFuZCBpdCBlcXVhbHMgdG8gMTYgKiAxMDI0ICogMTAyNCAv
IDIgc2VnbWVudHMuCisgKiBkaXNrIGlzIDE2IFRCIGZvciBhIDRLIHBhZ2Ugc2l6ZSBhbmQgNjQg
VEIgZm9yIGEgMTZLIHBhZ2Ugc2l6ZSBhbmQgaXQgZXF1YWxzCisgKiB0byAxNiAqIDEwMjQgKiAx
MDI0IC8gMiBzZWdtZW50cy4KICAqLwogI2RlZmluZSBGMkZTX01BWF9TRUdNRU5UICAgICAgICgo
MTYgKiAxMDI0ICogMTAyNCkgLyAyKQoKQEAgLTQyNCw4ICs0MjUsMTAgQEAgc3RydWN0IGYyZnNf
c2l0X2Jsb2NrIHsKIC8qCiAgKiBGb3Igc2VnbWVudCBzdW1tYXJ5CiAgKgotICogT25lIHN1bW1h
cnkgYmxvY2sgY29udGFpbnMgZXhhY3RseSA1MTIgc3VtbWFyeSBlbnRyaWVzLCB3aGljaCByZXBy
ZXNlbnRzCi0gKiBleGFjdGx5IG9uZSBzZWdtZW50IGJ5IGRlZmF1bHQuIE5vdCBhbGxvdyB0byBj
aGFuZ2UgdGhlIGJhc2ljIHVuaXRzLgorICogT25lIHN1bW1hcnkgYmxvY2sgd2l0aCA0S0Igc2l6
ZSBjb250YWlucyBleGFjdGx5IDUxMiBzdW1tYXJ5IGVudHJpZXMsIHdoaWNoCisgKiByZXByZXNl
bnRzIGV4YWN0bHkgb25lIHNlZ21lbnQgd2l0aCAyTUIgc2l6ZS4KKyAqIFNpbWlsYXJseSwgaW4g
dGhlIGNhc2Ugb2YgMTZrIGJsb2NrIHNpemUsIGl0IHJlcHJlc2VudHMgb25lCnNlZ21lbnQgd2l0
aCA4TUIgc2l6ZS4KKyAqIE5vdCBhbGxvdyB0byBjaGFuZ2UgdGhlIGJhc2ljIHVuaXRzLgogICoK
ICAqIE5PVEU6IEZvciBpbml0aWFsaXppbmcgZmllbGRzLCB5b3UgbXVzdCB1c2Ugc2V0X3N1bW1h
cnkKICAqCkBAIC01NTYsNiArNTU5LDcgQEAgc3RydWN0IGYyZnNfc3VtbWFyeV9ibG9jayB7Cgog
LyoKICAqIHNwYWNlIHV0aWxpemF0aW9uIG9mIHJlZ3VsYXIgZGVudHJ5IGFuZCBpbmxpbmUgZGVu
dHJ5ICh3L28gZXh0cmEKcmVzZXJ2YXRpb24pCisgKiB3aGVuIGJsb2NrIHNpemUgaXMgNEtCLgoK
Cgo+IC0tCj4gMi40MC4xCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
