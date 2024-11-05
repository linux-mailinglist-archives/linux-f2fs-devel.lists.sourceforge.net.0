Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED79BC6FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 08:28:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8DzL-0005ZP-Oy;
	Tue, 05 Nov 2024 07:28:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8DzK-0005ZI-IO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 07:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NR+0fJY21qOQ4pKy7qaBE0+v2RefTjKds+lqx/Uls8U=; b=J8IY0KqFFsHwZ3rkcxEoM1zHjX
 w/PFHmy3LtGcQwQ7xOFvTlILJtn2PnXtpIMBvMgt4gcI5O9bVjnuRW5rbMCqHS0hclU3hJkwFZqcA
 YRmNzfsQO8Boxzd3q1LjBOnlRdvJK8MLKD66sRGrVCuij8xv+gdZxHdvpuxJ8g5O7fFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NR+0fJY21qOQ4pKy7qaBE0+v2RefTjKds+lqx/Uls8U=; b=AKyGXm2HBAFLnelgaX80pOHtax
 KtOii0C1QaZb25lj9ID6G0XMHW/KoyN/riyG6+1UMhecJVYst5FLxuvyzFJVmTaDdfIWnNTKlb7Ew
 Ulxh13o2GtVgFvbSSq5i+kBvJh8aMtVJPoLOMQMGhUXwT4GeMWCqUuqrbJp7TJG82lFk=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8DzI-00022r-VI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 07:28:29 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43155a6c3a6so4708945e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Nov 2024 23:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730791697; x=1731396497; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NR+0fJY21qOQ4pKy7qaBE0+v2RefTjKds+lqx/Uls8U=;
 b=cUxzUafuTbTQaHONKMnbk1OSciy3MO5rnIhwonLpsYCh5bZgU0/4b/rmyUdHSCdICl
 zMlkBIxyP5eiBBZhitghCmKYaP0JIWdA4rxxVvwUxW+If5SyWqEgFE3OuASKv4YomZc5
 BdYi2OK0Gziwf95JjOXvi0gV4EZ5NymEAlCoPrz2G/TRrLqSrqgJR6h5e5cdOxPchoSQ
 ZIwDhHh+LqeMxQSSatoj4d6B6ozizfINHEF2gUIXLrwIWw+LmsW/OLWfkOANtuEwPufb
 IhIeiLhOxiAKKVoryV5HDBpunAmP+6EuCnuIN7cpVvGXDlvC6nbTNPJKMILBrUeLTSDL
 cqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730791697; x=1731396497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NR+0fJY21qOQ4pKy7qaBE0+v2RefTjKds+lqx/Uls8U=;
 b=OnYf1HOFrUL48bS0u9MXUlq2tNb75YacmVKr2PH1QiK6xvUJKMLk/HYFwvRkAJ4Lo1
 IL0Ibmg/NPwLAmcYEJeQcL1BmZU1FprUKf+cYr9hk95Tpqde02AHBGQNpSmRvlOLBmFC
 IyTipVGH8gCTHEAJenHc1i9lVXWdIA4JsUsKX7pECyNXBNiMskAy1g83/la8A9jSg7+H
 I9ZvJ+oS9hCWt5Hsfah1FTwpIXRrfjhp3DqDCkSBZN3wRPn8lQWQU8XyWCDEns1CUkmq
 J72h23iohEwDVtVIBc8fx8ZjgFp/SxFfbpYlXMaCsbWMOrb4XqT2QrpY+rIO77m6ZHhQ
 032Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ4oW3tJ7ZqmfKzZmR3Eeg0Ndg30HBaexosptZ8GU7vRWHSh2e/cER2/rgwn21ZUWCq8Cp86gHsI3JOQRrsQ4P@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwggCAx5+jF7OLmT9vvLIKvvYe1zWLDexSRIa8+TVZHotLiDVfS
 4g19fZGpAHPhcW/so5vwBP7Bhu/tYpwvrQdLPbdmDWbhKmUsJkJ73rQgt7t9sbTfRoEnLckOCX5
 eYxwzseGrhqvIQ817t4GkNrD+VWRH526Z
X-Google-Smtp-Source: AGHT+IEGT+on1DX3p1vF1HvZpo63Gp5w5OxpW/OQ7mVoa4w2wrlFBXlYD17R3fdF7NX+uCMUjx3EuFafgtg1dRcutLI=
X-Received: by 2002:a05:6000:4588:b0:381:d004:83c2 with SMTP id
 ffacd0b85a97d-381d0048465mr2733931f8f.5.1730791697099; Mon, 04 Nov 2024
 23:28:17 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
In-Reply-To: <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 5 Nov 2024 15:28:06 +0800
Message-ID: <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月5日周二 15:04写道： > > On 2024/11/4
    9:56, Zhiguo Niu wrote: > > If user give a file size as "length" parameter
    for fiemap > > operations, but if this size is non-block [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8DzI-00022r-VI
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropriate length
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDE1OjA0
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IElm
IHVzZXIgZ2l2ZSBhIGZpbGUgc2l6ZSBhcyAibGVuZ3RoIiBwYXJhbWV0ZXIgZm9yIGZpZW1hcAo+
ID4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVk
LAo+ID4gaXQgd2lsbCBzaG93IDIgc2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdo
b2xlIGZpbGUKPiA+IGlzIGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5n
IHJlc3VsdHM6Cj4gPgo+ID4gICAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXpl
ci5weQo+ID4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPiAgICAgICAgICBsb2dp
Y2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4g
MCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAwMDAwMDAwMDAwNDAw
MCAwMDAwMTAwMAo+ID4gMSAgICAgICAwMDAwMDAwMDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAg
MDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+ID4KPiA+IGFmdGVyIHRoaXMgcGF0Y2g6Cj4gPiAu
L2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4gRmllbWFwOiBvZmZz
ZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPiAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRk
ci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4gPiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4gLS0tCj4gPiBWMjog
Y29ycmVjdCBjb21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4gPiBmMmZz
X2lvIGhhcyBiZWVuIG1vZGlmaWVkIGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAg
aXMKPiA+IHJlYWwgZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4gPiAtLS0KPiA+ICAgZnMv
ZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9m
cy9mMmZzL2RhdGEuYwo+ID4gaW5kZXggMzA2Yjg2YjAuLjlmYzIyOWQgMTAwNjQ0Cj4gPiAtLS0g
YS9mcy9mMmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC0xOTY2LDgg
KzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZp
ZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+ICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
bGVuKSA9PSAwKQo+ID4gLSAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAx
KTsKPiA+ICsgICAgIGlmIChsZW4gJiAoYmxrc190b19ieXRlcyhpbm9kZSwgMSkgLSAxKSkKPiA+
ICsgICAgICAgICAgICAgbGVuID0gcm91bmRfdXAobGVuLCBibGtzX3RvX2J5dGVzKGlub2RlLCAx
KSk7Cj4KPiBIb3cgZG8geW91IHRoaW5rIG9mIGdldHRpbmcgcmlkIG9mIGFib3ZlIGFsaWdubWVu
dCBmb3IgbGVuPwo+Cj4gPgo+ID4gICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgc3RhcnQpOwo+ID4gICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFy
dCArIGxlbiAtIDEpOwo+Cj4gQW5kIHJvdW5kIHVwIGVuZCBwb3NpdGlvbiB3LzoKPgo+IGxhc3Rf
YmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgcm91bmRfdXAoc3RhcnQgKyBsZW4gLSAxLCBGMkZT
X0JMS1NJWkUpKTsKSGkgQ2hhbywKSSB0aGluayB0aGlzIHdpbGwgY2hhbmdlIHRoZSBjdXJyZW50
IGNvZGUgbG9naWMKLS0tLS0tLS0tLS0tLQppZiAoc3RhcnRfYmxrID4gbGFzdF9ibGspCiAgICBn
b3RvIG91dDsKLS0tLS0tLS0tLS0tLQpmb3IgZXhhbXBsZSwgYSBmaWxlIHdpdGggc2l6ZSAxOTAw
NiwgYnV0IHRoZSBsZW5ndGggZnJvbSB0aGUgdXNlciBpcyAxNjM4NC4KYmVmb3JlIHRoaXMgbW9k
aWZpY2F0aW9uLCAgbGFzdF9ibGsgPSAgYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQgKwpsZW4g
LSAxKSA9IChpbm9kZSwgMTYzODMpID0gMwphZnRlciB0aGUgZmlyc3QgZjJmc19tYXBfYmxvY2tz
KCkuIHN0YXJ0X2JsayBjaGFuZ2UgdG8gYmUgNCwKYWZ0ZXIgdGhlIHNlY29uZCBmMmZzX21hcF9i
bG9ja3MoKSwgZmllbWFwX2ZpbGxfbmV4X2V4dGVuIHdpbGwgYmUKY2FsbGVkIHRvIGZpbGwgdXNl
ciBwYXJhbWV0ZXIgYW5kIHRoZW4Kd2lsbCBnb3RvIG91dCBiZWNhdXNlIHN0YXJ0X2JsayA+IGxh
c3RfYmxrLCB0aGVuIGZpZW1hcCBmbG93IGZpbmlzaGVzLgpidXQgYWZ0ZXIgdGhpcyBtb2RpZmlj
YXRpb24sIGxhc3RfYmxrIHdpbGwgYmUgNAp3aWxsIGRvIGYyZnNfbWFwX2Jsb2NrcygpIHVudGls
IHJlYWNoIHRoZSBtYXhfZmlsZV9ibG9ja3MoaW5vZGUpCnRoYW5rc++8gQo+Cj4gVGhhbmtzLAo+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
