Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 454186602E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jan 2023 16:18:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDoU0-0007ll-Nu;
	Fri, 06 Jan 2023 15:18:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1pDoTy-0007lf-U2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Alz05ZcNgoaQdFl2lti3Hdp2W/onZPDBRRL7a7nm+Vw=; b=kW+sZpa9KnP1Hgo7axn/DvTyNh
 JyDDs0LFNoRijJ/kj9bP/wDRzUtp6tNuRpYy75+/rx2y/6DUg/X3JHstXxnTokIxcsuGWa+lzvKPp
 +tbjXxrEzzeWav6pY0YwTvEFRe+GM1aW83NtIcsCNu/dTfRweD30EPx6Cr4Us5q7CZTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Alz05ZcNgoaQdFl2lti3Hdp2W/onZPDBRRL7a7nm+Vw=; b=HdF7PELutMRrR+7Y4V/FwK2lTE
 bnIvNJicGqj285m32lezEPmQTwTP3YVxDEqYzdbbyb8tvCmkciAo23auBELmSMD0EY6ljW0H8GNhh
 xxcpC2e+odG5Yn5ET0wdBLx1EbeVhEnV4QuaUoNejn8Ei36VOrwcWuAyg3PPE3e4BSyI=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDoTu-007Rd4-M1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:18:10 +0000
Received: by mail-yb1-f172.google.com with SMTP id j206so2198938ybj.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jan 2023 07:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Alz05ZcNgoaQdFl2lti3Hdp2W/onZPDBRRL7a7nm+Vw=;
 b=PX1oO8h0GsLspKuAzS/IfSdWv9HLBDXtlwZQHRHyf4JuLwx5U93Zmp0VWMorzkfPrL
 airHwmr7W+tm/LJK+Frx5LByKd2IF1gJllSOSQGG3HWNckii6Qm0iFIMPYn1QVhsjliA
 bzzl8yM5vsa9cd4KDMl60HDsVnwFnBlHyYb1RixYORAHiBVLwbletXEdXejRryPWc3cH
 emT3+3VayRWOwJpcbvBOHa4haIoTLil85BYB615tc1HcKXSCGIa/9EPpGH+RHk9QmlVB
 Xi3+TLUOlLe2HOKwF1SrSllmYIsrewRYxLrnua8r+A5gLgA6lzUw+1GGjGRwgDhsqgFV
 T2mg==
X-Gm-Message-State: AFqh2kpHINx+ykGgQhc97kq04x5YurlLedfO64hkXVmIW8r2WPL8aZy2
 SunBsWVo3RI2NWLmdv938TPAUsACvsQ/zw==
X-Google-Smtp-Source: AMrXdXtq8EcwGKk6B9bzZumgjoUU8nqaMEbwZubIrvKpxouWBz47AyhkvboRrXO80Xl5R0Z2REssLw==
X-Received: by 2002:a25:e6d6:0:b0:750:f231:f2f3 with SMTP id
 d205-20020a25e6d6000000b00750f231f2f3mr57357689ybh.44.1673018280725; 
 Fri, 06 Jan 2023 07:18:00 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 m15-20020a05620a24cf00b007055dce4cecsm651472qkn.97.2023.01.06.07.17.59
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 07:17:59 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 16so2236057ybc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jan 2023 07:17:59 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr557375ybg.543.1673018279290; Fri, 06
 Jan 2023 07:17:59 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
In-Reply-To: <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jan 2023 16:17:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
Message-ID: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi John, On Fri, Jan 6,
 2023 at 4:10 PM John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de> wrote: > On 12/27/22 09:35, Geert Uytterhoeven
 wrote: > > + /kisskb/src/include/linux/compiler_types.h: error: c [...] 
 Content analysis details:   (3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.172 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [geert.uytterhoeven[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pDoTu-007Rd4-M1
Subject: Re: [f2fs-dev] Build regressions/improvements in v6.2-rc1
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-f2fs-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSm9obiwKCk9uIEZyaSwgSmFuIDYsIDIwMjMgYXQgNDoxMCBQTSBKb2huIFBhdWwgQWRyaWFu
IEdsYXViaXR6CjxnbGF1Yml0ekBwaHlzaWsuZnUtYmVybGluLmRlPiB3cm90ZToKPiBPbiAxMi8y
Ny8yMiAwOTozNSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gICAgKyAva2lzc2tiL3Ny
Yy9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6IGVycm9yOiBjYWxsIHRvICdfX2NvbXBp
bGV0aW1lX2Fzc2VydF8yNjInIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBVbnN1cHBv
cnRlZCBhY2Nlc3Mgc2l6ZSBmb3Ige1JFQUQsV1JJVEV9X09OQ0UoKS46ICA9PiAzNTg6NDUKPiA+
ICAgICsgL2tpc3NrYi9zcmMvaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOiBlcnJvcjog
Y2FsbCB0byAnX19jb21waWxldGltZV9hc3NlcnRfMjYzJyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0
ZSBlcnJvcjogVW5zdXBwb3J0ZWQgYWNjZXNzIHNpemUgZm9yIHtSRUFELFdSSVRFfV9PTkNFKCku
OiAgPT4gMzU4OjQ1Cj4gPgo+ID4gSW4gZnVuY3Rpb24gJ2ZvbGxvd19wbWRfbWFzaycsCj4gPiAg
ICAgIGlubGluZWQgZnJvbSAnZm9sbG93X3B1ZF9tYXNrJyBhdCAva2lzc2tiL3NyYy9tbS9ndXAu
Yzo3MzU6OSwKPiA+ICAgICAgaW5saW5lZCBmcm9tICdmb2xsb3dfcDRkX21hc2snIGF0IC9raXNz
a2Ivc3JjL21tL2d1cC5jOjc1Mjo5LAo+ID4gICAgICBpbmxpbmVkIGZyb20gJ2ZvbGxvd19wYWdl
X21hc2snIGF0IC9raXNza2Ivc3JjL21tL2d1cC5jOjgwOTo5Ogo+ID4KPiA+IHNoNC1nY2MxMS9z
aC1kZWZjb25maWcgKEfDvG50ZXIgd29uZGVyZWQgaWYgcG1kX3Qgc2hvdWxkIHVzZSB1bmlvbikK
Pgo+IEknbSBzZWVpbmcgdGhpcywgdG9vLiBBbHNvIGZvciBzaDc3ODVsY3JfZGVmY29uZmlnLgo+
Cj4gPiBzaDQtZ2NjMTEvc2gtYWxsbW9kY29uZmlnIChJQ0UgPSBpbnRlcm5hbCBjb21waWxlciBl
cnJvcikKPgo+IEknbSBub3Qgc2VlaW5nIHRoaXMgb25lLCBidXQgSSBhbSBnZXR0aW5nIHRoaXMg
b25lIGluc3RlYWQ6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9hcmNoL3NoL2luY2x1ZGUv
YXNtL2h3X2lycS5oOjYsCj4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
aXJxLmg6NTk2LAo+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2FzbS1nZW5lcmlj
L2hhcmRpcnEuaDoxNywKPiAgICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC9zaC9pbmNsdWRl
L2FzbS9oYXJkaXJxLmg6OSwKPiAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC9oYXJkaXJxLmg6MTEsCj4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
aW50ZXJydXB0Lmg6MTEsCj4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
c2VyaWFsX2NvcmUuaDoxMywKPiAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC9zZXJpYWxfc2NpLmg6NiwKPiAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvc2gva2VybmVs
L2NwdS9zaDIvc2V0dXAtc2g3NjE5LmM6MTE6Cj4gLi9pbmNsdWRlL2xpbnV4L3NoX2ludGMuaDox
MDA6NjM6IGVycm9yOiBkaXZpc2lvbiAnc2l6ZW9mICh2b2lkICopIC8gc2l6ZW9mICh2b2lkKScg
ZG9lcyBub3QgY29tcHV0ZSB0aGUgbnVtYmVyIG9mIGFycmF5IGVsZW1lbnRzIFstV2Vycm9yPXNp
emVvZi1wb2ludGVyLWRpdl0KPiAgICAxMDAgfCAjZGVmaW5lIF9JTlRDX0FSUkFZKGEpIGEsIF9f
c2FtZV90eXBlKGEsIE5VTEwpID8gMCA6IHNpemVvZihhKS9zaXplb2YoKmEpCj4gICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCj4gLi9pbmNsdWRlL2xpbnV4L3NoX2ludGMuaDoxMDU6MzE6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyAnX0lOVENfQVJSQVknCj4gICAgMTA1IHwgICAgICAgICBfSU5UQ19BUlJB
WSh2ZWN0b3JzKSwgX0lOVENfQVJSQVkoZ3JvdXBzKSwgICAgICBcCj4gICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KClRoZSBlYXNpZXN0IGZpeCBmb3Ig
dGhlIGxhdHRlciBpcyB0byBkaXNhYmxlIENPTkZJR19XRVJST1IuClVuZm9ydHVuYXRlbHkgSSBk
b24ndCBrbm93IGEgc2ltcGxlIHNvbHV0aW9uIHRvIGdldCByaWQgb2YgdGhlIHdhcm5pbmcuCgpH
cntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
