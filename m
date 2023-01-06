Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E46602C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jan 2023 16:10:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDoMh-0007dc-GG;
	Fri, 06 Jan 2023 15:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <glaubitz@zedat.fu-berlin.de>) id 1pDoMf-0007dW-9M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+EwS5gPWRuBK0knCKE80c3CmYTQUABv6Yjee2O85s/Q=; b=MsmbMzk9S69DUwa6z46JXJC/Fn
 8fCzZcMLw8XYEjrPI2Jv/2Fs5PpFF/0Qv+HaWviGpQ4ppwKSUNYFDVxzcG3d84L0zDxhm6c7nGNj0
 4ZEOPvHGdqFDqz2vRSnZwuyVhXnKn96EWBTKBDAJ18OFOgI5CLpSqJUV9xzcxKhQmGFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+EwS5gPWRuBK0knCKE80c3CmYTQUABv6Yjee2O85s/Q=; b=Hk3JZ5JMV3Z2cAS6ekWWvXK6MD
 KhVN29cv27Z012YnQiS1LyuUAQIR9OnVIuwN1jtALYjZMVzb5MeNPRL8PY1l+8DKyXzT8n9Q04dSv
 JAtx8F7VDMnbA7Q4Yy56gTaYDv2WMtrBBzc1Nu9IpHCti+nuJ+JWDRm0KgW05wLw1cys=;
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pDoMd-007RNX-B8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:10:37 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pDoMP-002xQU-QR; Fri, 06 Jan 2023 16:10:21 +0100
Received: from p57bd9807.dip0.t-ipconnect.de ([87.189.152.7]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pDoMP-000ZKo-K4; Fri, 06 Jan 2023 16:10:21 +0100
Message-ID: <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
Date: Fri, 6 Jan 2023 16:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.152.7
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Geert! On 12/27/22 09:35, Geert Uytterhoeven wrote: > +
 /kisskb/src/include/linux/compiler_types.h: error: call to
 '__compiletime_assert_262'
 declared with attribute error: Unsupported access size for {READ, [...] 
 Content analysis details:   (-1.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [130.133.4.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [130.133.4.66 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pDoMd-007RNX-B8
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
 amd-gfx@lists.freedesktop.org, linux-f2fs-devel@lists.sourceforge.net,
 kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgR2VlcnQhCgpPbiAxMi8yNy8yMiAwOTozNSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+
ICAgICsgL2tpc3NrYi9zcmMvaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOiBlcnJvcjog
Y2FsbCB0byAnX19jb21waWxldGltZV9hc3NlcnRfMjYyJyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0
ZSBlcnJvcjogVW5zdXBwb3J0ZWQgYWNjZXNzIHNpemUgZm9yIHtSRUFELFdSSVRFfV9PTkNFKCku
OiAgPT4gMzU4OjQ1Cj4gICAgKyAva2lzc2tiL3NyYy9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5
cGVzLmg6IGVycm9yOiBjYWxsIHRvICdfX2NvbXBpbGV0aW1lX2Fzc2VydF8yNjMnIGRlY2xhcmVk
IHdpdGggYXR0cmlidXRlIGVycm9yOiBVbnN1cHBvcnRlZCBhY2Nlc3Mgc2l6ZSBmb3Ige1JFQUQs
V1JJVEV9X09OQ0UoKS46ICA9PiAzNTg6NDUKPiAKPiBJbiBmdW5jdGlvbiAnZm9sbG93X3BtZF9t
YXNrJywKPiAgICAgIGlubGluZWQgZnJvbSAnZm9sbG93X3B1ZF9tYXNrJyBhdCAva2lzc2tiL3Ny
Yy9tbS9ndXAuYzo3MzU6OSwKPiAgICAgIGlubGluZWQgZnJvbSAnZm9sbG93X3A0ZF9tYXNrJyBh
dCAva2lzc2tiL3NyYy9tbS9ndXAuYzo3NTI6OSwKPiAgICAgIGlubGluZWQgZnJvbSAnZm9sbG93
X3BhZ2VfbWFzaycgYXQgL2tpc3NrYi9zcmMvbW0vZ3VwLmM6ODA5Ojk6Cj4gCj4gc2g0LWdjYzEx
L3NoLWRlZmNvbmZpZyAoR8O8bnRlciB3b25kZXJlZCBpZiBwbWRfdCBzaG91bGQgdXNlIHVuaW9u
KQoKSSdtIHNlZWluZyB0aGlzLCB0b28uIEFsc28gZm9yIHNoNzc4NWxjcl9kZWZjb25maWcuCgo+
IHNoNC1nY2MxMS9zaC1hbGxtb2Rjb25maWcgKElDRSA9IGludGVybmFsIGNvbXBpbGVyIGVycm9y
KQoKSSdtIG5vdCBzZWVpbmcgdGhpcyBvbmUsIGJ1dCBJIGFtIGdldHRpbmcgdGhpcyBvbmUgaW5z
dGVhZDoKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2FyY2gvc2gvaW5jbHVkZS9hc20vaHdfaXJx
Lmg6NiwKICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvaXJxLmg6NTk2LAog
ICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9oYXJkaXJxLmg6MTcs
CiAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3NoL2luY2x1ZGUvYXNtL2hhcmRpcnEuaDo5
LAogICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9oYXJkaXJxLmg6MTEsCiAg
ICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2ludGVycnVwdC5oOjExLAogICAg
ICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9zZXJpYWxfY29yZS5oOjEzLAogICAg
ICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9zZXJpYWxfc2NpLmg6NiwKICAgICAg
ICAgICAgICAgICAgZnJvbSBhcmNoL3NoL2tlcm5lbC9jcHUvc2gyL3NldHVwLXNoNzYxOS5jOjEx
OgouL2luY2x1ZGUvbGludXgvc2hfaW50Yy5oOjEwMDo2MzogZXJyb3I6IGRpdmlzaW9uICdzaXpl
b2YgKHZvaWQgKikgLyBzaXplb2YgKHZvaWQpJyBkb2VzIG5vdCBjb21wdXRlIHRoZSBudW1iZXIg
b2YgYXJyYXkgZWxlbWVudHMgWy1XZXJyb3I9c2l6ZW9mLXBvaW50ZXItZGl2XQogICAxMDAgfCAj
ZGVmaW5lIF9JTlRDX0FSUkFZKGEpIGEsIF9fc2FtZV90eXBlKGEsIE5VTEwpID8gMCA6IHNpemVv
ZihhKS9zaXplb2YoKmEpCiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgouL2luY2x1ZGUvbGludXgvc2hfaW50Yy5o
OjEwNTozMTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdfSU5UQ19BUlJBWScKICAgMTA1
IHwgICAgICAgICBfSU5UQ19BUlJBWSh2ZWN0b3JzKSwgX0lOVENfQVJSQVkoZ3JvdXBzKSwgICAg
ICBcCiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+CgpB
ZHJpYW4KCi0tIAogIC4nJ2AuICBKb2huIFBhdWwgQWRyaWFuIEdsYXViaXR6CjogOicgOiAgRGVi
aWFuIERldmVsb3BlcgpgLiBgJyAgIFBoeXNpY2lzdAogICBgLSAgICBHUEc6IDYyRkYgOEE3NSA4
NEUwIDI5NTYgOTU0NiAgMDAwNiA3NDI2IDNCMzcgRjVCNSBGOTEzCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
