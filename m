Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DF984C3C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 22:39:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stCJU-0006cu-QQ;
	Tue, 24 Sep 2024 20:39:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1stCJT-0006co-9U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 20:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9pDtP0TFeh4f8em2lTQ9/4Ega78aws9KodDKklh867Q=; b=CJSbFJSWUmFpMKWcFwGVuw3tN2
 AyIEeUImoxXlWxb9jTcXM1QIc5gZ5iw8rh0Gc/kv2CnGmcbnIp7mgfaM8nUFx0mRFdvBSKM6LGPMI
 37hdcXoByAfWuyLDgN+pkuGu1TFqZ1FmBDrRXtlHrOPHeQ7o8HM9CAf561jaGPrHaCdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9pDtP0TFeh4f8em2lTQ9/4Ega78aws9KodDKklh867Q=; b=csZP0gQLhUd28pv1LTT2TT47pU
 J5/1ZYoNVfG0dxIu4gp9Mx3KXLjnlea04svC19Kl35tFmfqP71BcsGuGnH9qx6rswMU/rc2bCGHpA
 Vefd7SB+0Tgmb803tcwxxC2wblbXTMJIq93MNP0ak5IJos1wBR6wrcZX0EUbncsrCJ8U=;
Received: from mail-vk1-f171.google.com ([209.85.221.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1stCJT-0006BF-Ch for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 20:39:11 +0000
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-502b405aa76so1482138e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Sep 2024 13:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727210340; x=1727815140; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pDtP0TFeh4f8em2lTQ9/4Ega78aws9KodDKklh867Q=;
 b=BSevR1q5SywPp67GYVi5Sx+M65W3WGW3ACCEQQax6LCJY4mtyiQBwZtlhLy/WmUcJO
 jACr1MFQDSmrAZyUWPDJltD4nnbKtUuXsMz1aOQ+EbUh0XUd8IbefletPIu8NvPjB72F
 83TlaQ7kyqXXdwW4N8XsGYe/bG4rnmHhzx4ypca/1XwO9jqZ+8lvOqb/a6INGlOzk4J6
 9xLNRTFvWJqxASQEDg5QDmhUpVbHQROsKoZ9wQDBX9sY3mxnUHrM5U3XkTu/LS1+3P0H
 uAhS9fqmbNfT1vl6ZNS/ukj6uMTCzvDVr6dR3jkD1QrNZ9R5W4RwiOwjWyxNBFbIqfvI
 zkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727210340; x=1727815140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pDtP0TFeh4f8em2lTQ9/4Ega78aws9KodDKklh867Q=;
 b=nLq5+5JxO4ivf06izbghYAZ7i77tLZZzBhXeYYrY/f6N1KUnQ58OvtZfTSUFieG6ji
 Had0CDCxmHfRzkUSU/iA1Lh2V8Bpyh5ytE95vjuvGSux1X+VIBBh0Ve+G6msf6WyAYGz
 J+sDqYXIhPVNbCnyo2n0OJe5bfLAuVKGhnRw5IYDjLxFya8TeKYhXWTxc+KNIwUAogBe
 gwV47NM41iN5oSFQE6hWl6r36I7n/TKVVQag1j5t7qvHg1d11834aZDPq8oF3XdlD0bI
 wqOyEzaft7PEGQmlrv5x0JIBPmx+zEgfmxxOPl2JHaDCttqKkSI1QYleAdHP4irjt8Rq
 BBSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/rSnVx0QAyBVQOeqdp3HpxY6ubXIkogaP+hocLizwnczjwH4tKHf7wHm3SWAubIdP1wNdKCs6mXqctvMPCLAS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzDChG7X4mqhnHvXGe6sITQHkpOK7r63gXL5mBC1BU/HHbBqbap
 eE1/HSGOSTtiC90nw6F4jw7w8+jLdKsJopbtf5ze58LI0bMJJXKqv2nm+MvvOGR7EDqZ8CYB1lg
 ouDOm9fB+sYHcq8bepWbvdFZQDfo=
X-Google-Smtp-Source: AGHT+IE3/viCbvqxP6nX7bP+UETwVo3ZV3e6Mbz9lMQ8f54XnKROpQG6cTrdUZ9HbQpc7P+xHrpBXoL2LMA8d4JzmkE=
X-Received: by 2002:a05:6122:4681:b0:4ef:6865:8ffd with SMTP id
 71dfb90a1353d-505c20a4069mr768586e0c.10.1727210340321; Tue, 24 Sep 2024
 13:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240924023007.2471817-1-chao@kernel.org>
In-Reply-To: <20240924023007.2471817-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 24 Sep 2024 13:38:48 -0700
Message-ID: <CACOAw_y_csdZmj26C8bXNVxRirq2XBYpiFXN2EnJTTdPr6BmAQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Sep 23, 2024 at 7:32 PM Chao Yu via Linux-f2fs-devel
    wrote: > > Do sanity check for extent info of device alias inode, in order
    to > avoid unexpected error caused by fuzz test. > > Cc: Dae [...] 
 
 Content analysis details:   (-0.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.171 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1stCJT-0006BF-Ch
Subject: Re: [f2fs-dev] [PATCH] f2fs: device alias: add sanity check for
 device alias inode
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBTZXAgMjMsIDIwMjQgYXQgNzozMuKAr1BNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IERvIHNhbml0eSBjaGVjayBmb3IgZXh0ZW50IGluZm8gb2YgZGV2aWNlIGFsaWFzIGlub2RlLCBp
biBvcmRlciB0bwo+IGF2b2lkIHVuZXhwZWN0ZWQgZXJyb3IgY2F1c2VkIGJ5IGZ1enogdGVzdC4K
Pgo+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPgo+IFRvIERhZWhvIGFuZCBKYWVn
ZXVrLAo+Cj4gTWVyZ2UgdGhpcyBpbnRvIGluaXRpYWwgcGF0Y2ggb3IgbWVyZ2UgaXQgc2VwYXJh
dGVseSBpcyBib3RoIGZpbmUKPiB0byBtZS4KCkkgYW0gZ29pbmcgdG8gbWVyZ2UgdGhpcyBpbnRv
IG15IG9uZS4gVGhhbmtzfiEKCj4KPiAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDMyICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2Fj
aGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiBpbmRleCAwYzhhNzA1ZmFhOGIuLjViZjll
NGMyYjQ5YyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4gKysrIGIvZnMv
ZjJmcy9leHRlbnRfY2FjaGUuYwo+IEBAIC0yNCw2ICsyNCw3IEBAIGJvb2wgc2FuaXR5X2NoZWNr
X2V4dGVudF9jYWNoZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqaXBhZ2UpCj4g
ICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ICAg
ICAgICAgc3RydWN0IGYyZnNfZXh0ZW50ICppX2V4dCA9ICZGMkZTX0lOT0RFKGlwYWdlKS0+aV9l
eHQ7Cj4gICAgICAgICBzdHJ1Y3QgZXh0ZW50X2luZm8gZWk7Cj4gKyAgICAgICBpbnQgZGV2aTsK
Pgo+ICAgICAgICAgZ2V0X3JlYWRfZXh0ZW50X2luZm8oJmVpLCBpX2V4dCk7Cj4KPiBAQCAtMzgs
NyArMzksMzYgQEAgYm9vbCBzYW5pdHlfY2hlY2tfZXh0ZW50X2NhY2hlKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIHN0cnVjdCBwYWdlICppcGFnZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGVp
LmJsaywgZWkuZm9mcywgZWkubGVuKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ICAgICAgICAgfQo+IC0gICAgICAgcmV0dXJuIHRydWU7Cj4gKwo+ICsgICAgICAgaWYgKCFJU19E
RVZJQ0VfQUxJQVNJTkcoaW5vZGUpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAr
Cj4gKyAgICAgICBmb3IgKGRldmkgPSAwOyBkZXZpIDwgc2JpLT5zX25kZXZzOyBkZXZpKyspIHsK
PiArICAgICAgICAgICAgICAgaWYgKEZERVYoZGV2aSkuc3RhcnRfYmxrICE9IGVpLmJsayB8fAo+
ICsgICAgICAgICAgICAgICAgICAgICAgIEZERVYoZGV2aSkuZW5kX2JsayAhPSBlaS5ibGsgKyBl
aS5sZW4pCgplaS5ibGsgKyBlaS5sZW4gLT4gZWkuYmxrICsgZWkubGVuIC0gMT8KCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoZGV2
aSA9PSAwKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZjJmc193YXJuKHNiaSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlczogaW5vZGUgKGlubz0lbHgpIGlzIGFuIGFs
aWFzIG9mIG1ldGEgZGV2aWNlIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fLCBpbm9kZS0+aV9pbm8pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGJkZXZf
aXNfem9uZWQoRkRFVihkZXZpKS5iZGV2KSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGYy
ZnNfd2FybihzYmksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXM6IGRldmlj
ZSBhbGlhcyBpbm9kZSAoaW5vPSVseCkncyBleHRlbnQgaW5mbyAiCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiWyV1LCAldSwgJXVdIG1hcHMgdG8gem9uZWQgYmxvY2sgZGV2aWNl
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBpbm9kZS0+aV9p
bm8sIGVpLmJsaywgZWkuZm9mcywgZWkubGVuKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgcmV0dXJu
IHRydWU7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgZjJmc193YXJuKHNiaSwgIiVzOiBkZXZp
Y2UgYWxpYXMgaW5vZGUgKGlubz0lbHgpJ3MgZXh0ZW50IGluZm8gIgo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICJbJXUsICV1LCAldV0gaXMgaW5jb25zaXN0ZW50IHcvIGFueSBkZXZpY2VzIiwK
PiArICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaW5vZGUtPmlfaW5vLCBlaS5ibGss
IGVpLmZvZnMsIGVpLmxlbik7Cj4gKyAgICAgICByZXR1cm4gZmFsc2U7Cj4gIH0KPgo+ICBzdGF0
aWMgdm9pZCBfX3NldF9leHRlbnRfaW5mbyhzdHJ1Y3QgZXh0ZW50X2luZm8gKmVpLAo+IC0tCj4g
Mi40MC4xCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
