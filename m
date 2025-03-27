Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A668A7375A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 17:52:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txqTK-0004Ld-V6;
	Thu, 27 Mar 2025 16:52:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1txqTK-0004LX-2v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 16:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0U9geEjGC1dSN0o/JPxh2M8Qsd9akqfHr698kSw5Itk=; b=Lv1hDL2LPjdAHppMOFdBKbJ7mJ
 Lc15LOf0SJxjnU+n7HxgZodvbQGqHqMkKF2Py0UWU935g3+wv/ACdmLzjNmhYICOvtpiLawCh7p24
 TY8UH/q7074Scq14moNtbd3m1SAQSGmNNLl2CslSALPN5dTPA0C9ZWzqGvxe26ArjNns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0U9geEjGC1dSN0o/JPxh2M8Qsd9akqfHr698kSw5Itk=; b=isgbvKl6jZNkGoxTbsdC3R7hcn
 w01BvZTLVaysGxHptzXDPmg2ClLo0zUTfFCEP9NZSfQzPYJWeB0v66iLPaU2kgG6UMNXitPnNnWwO
 x8IyrcE9DcfFOn7lWIn5zXYHNImBFAeUfpKglsWMIIjl17ooUvxI0KOY4GydkUgMiGVU=;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txqT8-0003Yc-EO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 16:52:50 +0000
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-523f1b31cf8so558733e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Mar 2025 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743094352; x=1743699152; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0U9geEjGC1dSN0o/JPxh2M8Qsd9akqfHr698kSw5Itk=;
 b=J1OYZ/0jCU1v0WAZNKyJO5D3gM/BmLNJL125mSiEb3ioi0yAQq8XfwumgJ8ViP+0iO
 oaESo7xcH/Ar/gkG1M/rW7anAImUGL/qIbZmq5TCKZEFtur6iKLjmMns5cM4soMtSoGZ
 yzkypbFSK/st/ZJOn81QClSQAxP+z5Q3DUusJZawmcJUTGYfwPFbMmDFb5CAecXhM3oF
 zkRmKQt3gq2raKS136OvZIhJYYv5um/xaSibl3FqY55ag0EMKwdf7wVb5uTJqEKA5FMU
 5DyhLmYHk151zgSZCdTlftF9R0yMqbXY3CC18yJvbPzfKmNRGuwovxYk/m5IgS5LB1G5
 C6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743094352; x=1743699152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0U9geEjGC1dSN0o/JPxh2M8Qsd9akqfHr698kSw5Itk=;
 b=TrCz/k2TS764OLoAR3SyJWbKy9i9Zp3kbWXsPTZ99sYo5lI1K+zzz4y4duM4lwO7ic
 A4mcSYoKOfvkXNX2mpJ6EsDXAiQeI27Ufmq370PGvOtMCUTyIsUJ4n4886mzvk4OOaxf
 MAsF9g2m6f95vPt5tNMQKyvbg/6cvyLE7VVnTJqymm6ePlDShR2zMOf0XYobML0Gg60w
 f9VYP6xaTlR4MVdvNfzb9JA1kWK3ZjktrVHahlD1icuOPuD/Z78OwXXQe7NwY/JfOwky
 KSuQgtY++ibbqLhS0fTJvkdFwsa3UE8hZlv2e/u/tW3XwsgQ+pvuplQeU4W9s7jIP3Vz
 X+IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrPHoJIeYW9B6f5u3vFZx6jsM/TX/WtyXpDI97YfqrQKC58lCmeXP9UGOy2tgZ0Nad4/XUfnLCZgQYRB17yPe2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzWU1CWXqlN3dLTY1hN8vTJ47VQoo7MCLnDdH8/5WJMNcrfAvK+
 G7OmQUgSvqZYVvu/QWj6Wl2CPmq/Q6+04qnlBlZsutRBWA4Xn4WFtjGdzn5xtPql889FeNfdjDV
 Ca3yaTPRu0/6Pv5ivvzHUnvqtxeE=
X-Gm-Gg: ASbGnctngGLny++O9/wuHnY29GsN1bwBpQaNzSlD6zdbywqiiXiEeCA9USPkJLkOghv
 IjFKGrSbLJs4WB9BDivoiSOHfLHQjmhKf/qnm5tKWlFVs4/r2l3MMkxEiS9wJnBdpfSq487gbwy
 FdkGSc+TjuieaxHk0vMs0oPH0R5FYADHUvGhnaAFj1AnjeROHP7Ojyp+us
X-Google-Smtp-Source: AGHT+IGCz09iVTGSPqqF1CqBF3FJzQoNxDVcp1tO6jR5cZdlkxww/y+iDYhvmDIwk3NkuwM2baffknsAxRnZftPJMyQ=
X-Received: by 2002:a05:6122:3907:b0:520:51a4:b84f with SMTP id
 71dfb90a1353d-52600920c2cmr3889239e0c.4.1743094352260; Thu, 27 Mar 2025
 09:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250327055607.3829954-1-chao@kernel.org>
In-Reply-To: <20250327055607.3829954-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Mar 2025 09:52:21 -0700
X-Gm-Features: AQ5f1JpoKRV12elFxx8bZoDusEy8_a4__lIWxXI51QMV49qwD_J8Hp6i152yLOg
Message-ID: <CACOAw_y1n9+_FmMZv20hNbP8pBWm4adC3qKQQom4_Wsx1qryrg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Mar 26, 2025 at 10:59 PM Chao Yu via Linux-f2fs-devel
    wrote: > > 1. After we start atomic write in a database file, before committing
    > all data, we'd better not set inode w/ vfs dirty sta [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.182 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.221.182 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.182 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1txqT8-0003Yc-EO
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set atomic write status more
 clear
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTA6NTnigK9QTSBDaGFvIFl1IHZpYSBMaW51eC1mMmZz
LWRldmVsCjxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4K
PiAxLiBBZnRlciB3ZSBzdGFydCBhdG9taWMgd3JpdGUgaW4gYSBkYXRhYmFzZSBmaWxlLCBiZWZv
cmUgY29tbWl0dGluZwo+IGFsbCBkYXRhLCB3ZSdkIGJldHRlciBub3Qgc2V0IGlub2RlIHcvIHZm
cyBkaXJ0eSBzdGF0dXMgdG8gYXZvaWQKPiByZWR1bmRhbnQgdXBkYXRlcywgaW5zdGVhZCwgd2Ug
b25seSBzZXQgaW5vZGUgdy8gYXRvbWljIGRpcnR5IHN0YXR1cy4KPgo+IDIuIEFmdGVyIHdlIGNv
bW1pdCBhbGwgZGF0YSwgYmVmb3JlIGNvbW1pdHRpbmcgbWV0YWRhdGEsIHdlIG5lZWQgdG8KPiBj
bGVhciBhdG9taWMgZGlydHkgc3RhdHVzLCBhbmQgc2V0IHZmcyBkaXJ0eSBzdGF0dXMgdG8gYWxs
b3cgdmZzIGZsdXNoCj4gZGlydHkgaW5vZGUuCj4KPiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvamVv
bmdAZ29vZ2xlLmNvbT4KPiBSZXBvcnRlZC1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlz
b2MuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0K
PiAgZnMvZjJmcy9pbm9kZS5jICAgfCA0ICsrKy0KPiAgZnMvZjJmcy9zZWdtZW50LmMgfCA2ICsr
KysrKwo+ICBmcy9mMmZzL3N1cGVyLmMgICB8IDQgKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9p
bm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jCj4gaW5kZXggNWM4NjM0ZWFlZjdiLi5mNTk5MWU4NzUx
YjkgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4gKysrIGIvZnMvZjJmcy9pbm9kZS5j
Cj4gQEAgLTM0LDcgKzM0LDkgQEAgdm9pZCBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBib29sIHN5bmMpCj4gICAgICAgICBpZiAoZjJmc19pbm9kZV9kaXJ0
aWVkKGlub2RlLCBzeW5jKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gLSAgICAgICBp
ZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpCj4gKyAgICAgICAvKiBvbmx5IGF0b21pYyBm
aWxlIHcvIEZJX0FUT01JQ19DT01NSVRURUQgY2FuIGJlIHNldCB2ZnMgZGlydHkgKi8KPiArICAg
ICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSAmJgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCkpCj4g
ICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAgICAgbWFya19pbm9kZV9kaXJ0eV9zeW5j
KGlub2RlKTsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21l
bnQuYwo+IGluZGV4IGRjMzYwYjRiMDU2OS4uN2MxMTNiNDQ2ZjYzIDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvc2VnbWVudC5jCj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtMzc2LDcgKzM3
NiwxMyBAQCBzdGF0aWMgaW50IF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUpCj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBzYmktPmNvbW1p
dHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4gICAgICAgICAgICAg
ICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKTsKPiArCj4gKyAg
ICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIGlub2RlIG1heSBoYXMgbm8gRklf
QVRPTUlDX0RJUlRJRUQgZmxhZyBkdWUgdG8gbm8gd3JpdGUKPiArICAgICAgICAgICAgICAgICog
YmVmb3JlIGNvbW1pdC4KPiArICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIGlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLyogY2xlYXIgYXRvbWljIGRpcnR5IHN0YXR1cyBhbmQgc2V0IHZm
cyBkaXJ0eSBzdGF0dXMgKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICBjbGVhcl9pbm9kZV9m
bGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ICAgICAgICAgICAgICAg
ICB9Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGlu
ZGV4IDlhNDJhMTMyM2Y0Mi4uYTVjYzlmNmVlMTZhIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3Vw
ZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+IEBAIC0xNTMyLDcgKzE1MzIsOSBAQCBpbnQg
ZjJmc19pbm9kZV9kaXJ0aWVkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykKPiAgICAg
ICAgIH0KPiAgICAgICAgIHNwaW5fdW5sb2NrKCZzYmktPmlub2RlX2xvY2tbRElSVFlfTUVUQV0p
Owo+Cj4gLSAgICAgICBpZiAoIXJldCAmJiBmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSkKPiAr
ICAgICAgIC8qIGlmIGF0b21pYyB3cml0ZSBpcyBub3QgY29tbWl0dGVkLCBzZXQgaW5vZGUgdy8g
YXRvbWljIGRpcnR5ICovCj4gKyAgICAgICBpZiAoIXJldCAmJiBmMmZzX2lzX2F0b21pY19maWxl
KGlub2RlKSAmJgo+ICsgICAgICAgICAgICAgICAgICAgICAgICFpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCkpCj4gICAgICAgICAgICAgICAgIHNldF9pbm9kZV9m
bGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4g
LS0KPiAyLjQ5LjAKPgoKUmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+CgpUaGFua3MuCgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
