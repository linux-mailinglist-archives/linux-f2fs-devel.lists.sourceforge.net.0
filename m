Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFACC378CA3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 15:16:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg5ls-0006GF-UL; Mon, 10 May 2021 13:16:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ecree.xilinx@gmail.com>)
 id 1lg5lq-0006Fq-Kf; Mon, 10 May 2021 13:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=; b=IjbR+lld4tuLWe37jilAO/KrYG
 n7pQWOE8H7aWDtI1nIdpD+VAC56OiQylKXKeU2sYLigXNuzjfCidQjWb4qf069c/kKJ23SMlf4QKT
 XT8NujkvkSldq0B0VBC/HHrYQ1ihVXYsck+aDTQwahdiAWiBVZucdXYpy7pu/KUiHz3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=; b=lmOkSUrIwKIV9enKciDO4LCer4
 S1yEPC1Y+dZbBISJRMFgLvNPbAai6gsdMLpB4i2P+2yx4KjUT0Iml/bXFXWGRqjAu1CaakLZ/6u4U
 Fid0Fo9a6lzGovVbEeZQEf6d2FNAnCkth8qSCUJSM2PEo37YMY9ts8E0tfA7Sor12Z80=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lg5lo-0006tg-FS; Mon, 10 May 2021 13:16:26 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so8860093wmv.1; 
 Mon, 10 May 2021 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=;
 b=GfQpYA/u/ESXNzCwhJN35I1L0Sb2vRVeukRNG83W8xG2OMlDA6+i5W0OODo/+LWE9E
 ivWW5//Dci3M+PXPgJnH/odM7KtTO7yjQKrEe7KAvh4E7fvrd/ZuLkJAZP62sWtsDMuB
 AIqgCRqoTLZzj0iGC6/REa3QuGlmZjiRxifV0mZYrMLJSap8JjiujnvbMmFTzTlx+O95
 x9XnwiLNDr5qqWcsdoyW+ETG1hWAlzA+FW12aKJEwh2j5DlnppfpjkE6ahf9DAyZ8V+v
 c4HLN0tsaWZM2+zfMzrOFU3u/mXI98pyg6LlDYSgFBtDuHlk1DmX0lhge4HX1KOLhtwA
 z+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=;
 b=bERUrHWv6JTEoR88qxwwgo3li007bU3iA3Tgtyug9wSkPGZkDLk4pOEPqj4dhFHg8a
 +PRBC47rQaxupBjlAeozEWoFpxEhbyms3J3dzITNbxji1RZ1izSFGQvBsH33qQYFnORg
 ARRY5e5vG1zIJPyfn8FvouJz9N7hc/n7vp/nONRtndzK8Prjts4gXJKQ/Co6WQnWUZGE
 5NksAuGivSMpLTefRIuxZT29JUDXHfCk45CREoeeGuxWly5NlQjF0ks6gq7rgs96Ep9/
 OdQuIHYygRaLHALdm/zvXgL1jjLQ2xB/u9IqISPonwNRY/tNUYKUuZjbW0zgkRWNDVEr
 u5Ig==
X-Gm-Message-State: AOAM531/PBKY7fApybUiEDWpDDClrGDfDFxHBAnRZKD9v/a+FLl43+Yk
 frVdOP6V2kvOR31PO7UK9b0=
X-Google-Smtp-Source: ABdhPJysoQ4YBpE1J87NsTC/Z24p8NQqGLKPSudpVCmtLwZFhM2Wy0R7/k0aKiXMKdpTI23nPdYVEw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr36980376wmo.95.1620652578722; 
 Mon, 10 May 2021 06:16:18 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id s1sm27945073wmj.8.2021.05.10.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:16:17 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
Date: Mon, 10 May 2021 14:16:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210510135518.305cc03d@coco.lan>
Content-Language: en-GB
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (ecree.xilinx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg5lo-0006tg-FS
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMDUvMjAyMSAxMjo1NSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IFRoZSBt
YWluIHBvaW50IG9uIHRoaXMgc2VyaWVzIGlzIHRvIHJlcGxhY2UganVzdCB0aGUgb2NjdXJyZW5j
ZXMKPiB3aGVyZSBBU0NJSSByZXByZXNlbnRzIHRoZSBzeW1ib2wgZXF1YWxseSB3ZWxsCgo+IAkt
IFUrMjAxNCAoJ+KAlCcpOiBFTSBEQVNICkVtIGRhc2ggaXMgbm90IHRoZSBzYW1lIHRoaW5nIGFz
IGh5cGhlbi1taW51cywgYW5kIHRoZSBsYXR0ZXIgZG9lcyBub3QKIHNlcnZlICdlcXVhbGx5IHdl
bGwnLiAgUGVvcGxlIHVzZSBlbSBkYXNoZXMgYmVjYXVzZSDigJQgZXZlbiBpbgogbW9ub3NwYWNl
IGZvbnRzIOKAlCB0aGV5IG1ha2UgdGV4dCBlYXNpZXIgdG8gcmVhZCBhbmQgY29tcHJlaGVuZCwg
d2hlbgogdXNlZCBjb3JyZWN0bHkuCkkgYWNjZXB0IHRoYXQgc29tZSBvZiB0aGUgb3RoZXIgZGlz
dGluY3Rpb25zIOKAlCBsaWtlIGVuIGRhc2hlcyDigJQgYXJlCiBuZWVkbGVzc2x5IHBlZGFudGlj
ICh0aG91Z2ggSSBkb24ndCBkb3VidCB0aGVyZSBpcyBzb21lb25lIG91dCB0aGVyZQogd2hvIHdp
bGwgZ2xhZGx5IGRlZmVuZCB0aGVtIHdpdGggdGhlIHNhbWUgZmVydm91ciB3aXRoIHdoaWNoIEkg
YXJndWUKIGZvciB0aGUgZW0gZGFzaCkgYW5kIEkgd291bGRuJ3QgdGFrZSB0aGUgdHJvdWJsZSB0
byB1c2UgdGhlbSBteXNlbGY7CiBidXQgSSB0aGluayB0aGVyZSBpcyBhIHJlYXNvbmFibGUgYXNz
dW1wdGlvbiB0aGF0IHdoZW4gc29tZW9uZSBnb2VzCiB0byB0aGUgZWZmb3J0IG9mIHVzaW5nIGEg
VW5pY29kZSBwdW5jdHVhdGlvbiBtYXJrIHRoYXQgaXMgc2VtYW50aWMKIChyYXRoZXIgdGhhbiBt
ZXJlbHkgdHlwb2dyYXBoaWNhbCksIHRoZXkgcHJvYmFibHkgaGFkIGEgcmVhc29uIGZvcgogZG9p
bmcgc28uCgo+IAktIFUrMjAxOCAoJ+KAmCcpOiBMRUZUIFNJTkdMRSBRVU9UQVRJT04gTUFSSwo+
IAktIFUrMjAxOSAoJ+KAmScpOiBSSUdIVCBTSU5HTEUgUVVPVEFUSU9OIE1BUksKPiAJLSBVKzIw
MWMgKCfigJwnKTogTEVGVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKPiAJLSBVKzIwMWQgKCfigJ0n
KTogUklHSFQgRE9VQkxFIFFVT1RBVElPTiBNQVJLCihUaGVzZSBhcmUgcHVyZWx5IHR5cG9ncmFw
aGljLCBJIGhhdmUgbm8gcHJvYmxlbSB3aXRoIGR1bXBpbmcgdGhlbS4pCgo+IAktIFUrMDBkNyAo
J8OXJyk6IE1VTFRJUExJQ0FUSU9OIFNJR04KUHJlc3VtYWJseSB0aGlzIGlzIGFwcGVhcmluZyBp
biBtYXRoZW1hdGljYWwgZm9ybXVsYWUsIGluIHdoaWNoIGNhc2UKIGNoYW5naW5nIGl0IHRvICd4
JyBsb3NlcyBzZW1hbnRpYyBpbmZvcm1hdGlvbi4KCj4gVXNpbmcgdGhlIGFib3ZlIHN5bWJvbHMg
d2lsbCBqdXN0IHRyaWNrIHRvb2xzIGxpa2UgZ3JlcCBmb3Igbm8gZ29vZAo+IHJlYXNvbi4KTkJT
UCwgc3VyZS4gIFRoYXQgb25lJ3MgcHJvYmFibHkgYW4gYXJ0ZWZhY3Qgb2Ygc29tZSBkb2N1bWVu
dCBmb3JtYXQKIGNvbnZlcnNpb24gc29tZXdoZXJlIGFsb25nIHRoZSBsaW5lLCBhbnl3YXkuCkJ1
dCB3aGF0IGtpbmRzIG9mIHRoaW5ncyB3aXRoIMOXIG9yIOKAlCBpbiBhcmUgZ29pbmcgdG8gYmUg
Z3JlcHQgZm9yPwoKSWYgdGhlcmUgYXJlIGVtIGRhc2hlcyBseWluZyBhcm91bmQgdGhhdCBzZW1h
bnRpY2FsbHkgX3Nob3VsZF8gYmUKIGh5cGhlbi1taW51cyAob25lIG9mIHlvdXIgcGF0Y2hlcyBJ
J3ZlIHNlZW4sIGZvciBpbnN0YW5jZSwgZml4ZXMgYW4KICplbiogZGFzaCBtb29ubGlnaHRpbmcg
YXMgdGhlIG9wdGlvbiBjaGFyYWN0ZXIgaW4gYW4gYGV0aHRvb2xgCiBjb21tYW5kIGxpbmUpLCB0
aGVuIHN1cmUsIGNvbnZlcnQgdGhlbS4KQnV0IGFueSB0aW1lIHNvbWVvbmUgaXMgdXNpbmcgYSBV
bmljb2RlIGNoYXJhY3RlciB0byAqZXhwcmVzcwogc2VtYW50aWNzKiwgZXZlbiBpZiB5b3UgaGFw
cGVuIHRvIHRoaW5rIHRoZSBzZW1hbnRpYyBkaXN0aW5jdGlvbgogaW52b2x2ZWQgaXMgYSBwZWRh
bnRpYyBvciB1bmltcG9ydGFudCBvbmUsIEkgdGhpbmsgeW91IG5lZWQgYW4KIGV4cGxpY2l0IGdy
ZXAgY2FzZSB0byBqdXN0aWZ5IEFTQ0lJZnlpbmcgaXQuCgotZWQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
