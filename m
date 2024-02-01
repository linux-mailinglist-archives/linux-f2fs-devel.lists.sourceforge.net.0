Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E684845BB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 16:38:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVZ8h-0005AT-OA;
	Thu, 01 Feb 2024 15:38:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rVZ8f-0005AD-KQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 15:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3D22Un3/go87mbr1Mhl5zC05s5c/j7TuagOLXFOoVAE=; b=ZwvS4++dolkKXVzTVezpXJxo1c
 kKh5fqJlltGcPDDTMVEqEOehdGLTIR2lYfD0PmeTsTpv6WHrvlHS/8O8v6QSwW/KBGmliYR/7aiNW
 Dmb9l2mbKjJHK4EDgZp44Toi4Nrqo7UF0leu59MuufAUS/tUuxXlHkpqhOCiri8l/+H4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3D22Un3/go87mbr1Mhl5zC05s5c/j7TuagOLXFOoVAE=; b=ZYa+iWrquBiPBQPDmqxDYdW9j6
 dPLpyNmmu9xIVca0BdjDiPEpD7pwhNoEOPvDR3OLA3WV2kg7uTSxDSTekummxKnSelqAQFl+hEtBr
 wzYd8soSb/XiPmuYlUkEDkDvibem9obX9Q8/bWnJY6BCFLUAIljh+oO7acGPXGudiHqY=;
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rVZ8e-0001dW-P2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 15:38:06 +0000
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-42a9199cfd2so6402021cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Feb 2024 07:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706801879; x=1707406679; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3D22Un3/go87mbr1Mhl5zC05s5c/j7TuagOLXFOoVAE=;
 b=ZzgZyf5llrm8U6TtteCZwBi1JlFaHRvGEUjBVxrPATFY6DVPkcEBv+iFWXpxdMDPfk
 QgbrXHcSA6jW6brgU6cDq/avf9qFETJSD9JGnl2iPg57of0BLymbGmZ2MlwBPiyUCfYU
 kNdfaxQ8MYz//m6SBJ0bVl9Md+x2X0WhfJp2keCMSYwmgAuiZl3nWQ8d+chV3QY7Ijsz
 tffobXm4BGDzS0dqh2BjDLek60Z9704pBZGrLiHS6bFs09ZHsP4yvAGgeR5P/WgguKJ6
 j8zIPPYxDqR1BkFvePl0/Q6LWvkTH/F8CNxyy0L39eil47shvtzWPEWNeP6/eSZIRaE3
 Afzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706801879; x=1707406679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3D22Un3/go87mbr1Mhl5zC05s5c/j7TuagOLXFOoVAE=;
 b=OLAMXHF5ILLxJYh11uOUwifrK/9N+lHI4PIGxwGP/BXo5wRvGdcGyNIQ5/tV/Mv4xR
 ouqhEdE597+oKmDHpDC+Ykq/3DOWXd/RBLaMw5Sg56cxcbp2oCLabDTFSNBPKI9bP3nT
 kwkwDrhJhutw8K3nnvmWrHBezNBs2t3WSXKJrl7/JnV/ArDm6QKmYEU0/qVQOJPkAyZ/
 rrz47TeZwGIMaVbJqZrBdfYoqDTpsy+shTxxr+46GMdxxxywqVRMWzzUb2Bt3aQzD7Qh
 j6TVzZlUScQDnTFg05jdyehIhf+UPkiVHh9QlcHMlIVQNZdcdFuEJXyRcmSkU0duYovi
 STqw==
X-Gm-Message-State: AOJu0YxDlNRCKZDdorpaNbA+itFFE+njuVnsSApujK2CutLkd6lGhNDX
 Kz5bvsY+p1qvmsDxispKRLs6pDNtZs8feeEIFqXwYiBzvrKqOdQv55rvHzdsAtLudiNr8P4zgxu
 aOiPatgpLFjmhykQ/pdI3lgf/dNs=
X-Google-Smtp-Source: AGHT+IFIV+HhJpXd/G2A60dyv4hp507KJye/46cghdPTGAhJIbcBSl/FHR2DsUhbxionxZ/MlToCdXInxaorheMZiU4=
X-Received: by 2002:ac8:7d4f:0:b0:42b:ef60:192 with SMTP id
 h15-20020ac87d4f000000b0042bef600192mr2812346qtb.13.1706801879379; Thu, 01
 Feb 2024 07:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20240123081258.700-1-qwjhust@gmail.com>
 <cedb4875-5795-4789-a010-a9c66fa61707@oppo.com>
 <6e91f64a-638c-465d-8fb2-ed70231db23a@kernel.org>
In-Reply-To: <6e91f64a-638c-465d-8fb2-ed70231db23a@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Thu, 1 Feb 2024 23:37:45 +0800
Message-ID: <CAGFpFsQ2B0yvT35K+wn=XW7rMPkc-m3zU_FiVRAzX3psFT6QMA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, Yes, I also agree with using bdev_max_open_zones()
 instead of bdev_max_active_zones(). I will submit a revised version as soon
 as possible. Thanks, 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.175 listed in list.dnswl.org]
 0.1 URIBL_SBL_A Contains URL's A record listed in the Spamhaus SBL
 blocklist [URIs: zonedstorage.io]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVZ8e-0001dW-P2
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix zoned block device information
 initialization
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgYWxsLAoKWWVzLCBJIGFsc28gYWdyZWUgd2l0aCB1c2luZyBiZGV2X21heF9vcGVuX3pvbmVz
KCkgaW5zdGVhZCBvZgpiZGV2X21heF9hY3RpdmVfem9uZXMoKS4KSSB3aWxsIHN1Ym1pdCBhIHJl
dmlzZWQgdmVyc2lvbiBhcyBzb29uIGFzIHBvc3NpYmxlLgoKVGhhbmtzLAoKT24gVGh1LCBGZWIg
MSwgMjAyNCBhdCAxMDo0N+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBPbiAyMDI0LzEvMjMgMTc6MTgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gPiBIaSBXZW5qaWUs
Cj4gPiBJdCBzZWVtcyBtb3JlIHJlYXNvbmFibGUgdG8gdXNlIGJkZXZfbWF4X29wZW5fem9uZXMg
aW5zdGVhZCBvZgo+ID4gYmRldl9tYXhfYWN0aXZlX3pvbmVzLgo+Cj4gSGkgYWxsLAo+Cj4gSSBn
dWVzcyBpdCBuZWVkcyB0byBiZSBpbml0aWFsaXplZCB3LyBiZGV2X21heF9vcGVuX3pvbmVzKCks
IGR1ZQo+IHRvIHRoZSBtYXggb2Ygb3BlbiB6b25lcyBvZiB6b25lZCBkZXZpY2UgbGltaXRzIHRo
ZSBudW1iZXIgb2YKPiB6b25lcyB0aGF0IGEgaG9zdCBzb2Z0d2FyZSBjYW4gc2ltdWx0YW5lb3Vz
bHkgd3JpdGUgWzFdLCByaWdodD8KPgo+IFsxXSBodHRwczovL3pvbmVkc3RvcmFnZS5pby9kb2Nz
L2ludHJvZHVjdGlvbi96b25lZC1zdG9yYWdlI2FjdGl2ZS16b25lcy1saW1pdAo+Cj4gVGhhbmtz
LAo+Cj4gPgo+ID4gSWYgYW4gTlZNZSBkZXZpY2UgaGFzIG11bHRpcGxlIG5hbWVzcGFjZXMsIGFu
ZCB0aGUgZGV2aWNlIGNvbnRhaW5zIGEKPiA+IHRvdGFsIG9mIDExIG9wZW4gem9uZXMsIHR3byBv
ZiB0aGUgbmFtZXNwYWNlcywgbnZtZTBuMSBhbmQgbnZtZTBuMiwgZWFjaAo+ID4gY29ycmVzcG9u
ZCB0byBhbiBpbnN0YW5jZSBvZiB0aGUgRjJGUyBmaWxlc3lzdGVtLCBhbmQgYm90aCBmaWxlc3lz
dGVtCj4gPiBpbnN0YW5jZXMgY2FuIGJlIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseS4gU2luY2Ug
bXVsdGlwbGUgbmFtZXNwYWNlcwo+ID4gc2hhcmUgYWxsIG9wZW4gem9uZXMsIHRoZSBudW1iZXIg
b2Ygb3BlbiB6b25lcyBpcyBub3QgZXF1YWwgdG8gdGhlCj4gPiBudW1iZXIgb2Ygb3BlbiB6b25l
cyBhdmFpbGFibGUgdG8gRjJGUyBpbiBhIG11bHRpLW5hbWVzcGFjZSBzY2VuYXJpby4KPiA+IFRo
aXMgcGF0Y2ggZG9lcyBub3QgeWV0IGNvdmVyIHRoaXMgc2NlbmFyaW8uCj4gPgo+ID4gT24gMS8y
My8yMDI0IDQ6MTIgUE0sIFdlbmppZSBRaSB3cm90ZToKPiA+PiBJZiB0aGUgbWF4IGFjdGl2ZSB6
b25lcyBvZiB6b25lZCBkZXZpY2VzIGFyZSBsZXNzIHRoYW4KPiA+PiB0aGUgYWN0aXZlIGxvZ3Mg
b2YgRjJGUywgdGhlIGRldmljZSBtYXkgZXJyb3IgZHVlIHRvCj4gPj4gaW5zdWZmaWNpZW50IHpv
bmUgcmVzb3VyY2VzIHdoZW4gbXVsdGlwbGUgYWN0aXZlIGxvZ3MgYXJlCj4gPj4gYmVpbmcgd3Jp
dHRlbiBhdCB0aGUgc2FtZSB0aW1lLiBJZiB0aGlzIHZhbHVlIGlzIDAsIHRoZXJlIGlzIG5vIGxp
bWl0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFpIDxxd2podXN0QGdtYWlsLmNv
bT4KPiA+PiAtLS0KPiA+PiAgICBmcy9mMmZzL2YyZnMuaCAgfCAgMSArCj4gPj4gICAgZnMvZjJm
cy9zdXBlci5jIHwgMTggKysrKysrKysrKysrKysrKysrCj4gPj4gICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmgg
Yi9mcy9mMmZzL2YyZnMuaAo+ID4+IGluZGV4IDY1Mjk0ZTNiMGJlZi4uNjY5Zjg0ZjZiMGU1IDEw
MDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgK
PiA+PiBAQCAtMTU1MSw2ICsxNTUxLDcgQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4gPj4KPiA+
PiAgICAjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPiA+PiAgICAgIHVuc2lnbmVkIGludCBi
bG9ja3NfcGVyX2Jsa3o7ICAgICAgICAgICAvKiBGMkZTIGJsb2NrcyBwZXIgem9uZSAqLwo+ID4+
ICsgICAgdW5zaWduZWQgaW50IG1heF9hY3RpdmVfem9uZXM7ICAgICAgICAgIC8qIG1heCB6b25l
IHJlc291cmNlcyBvZiB0aGUgem9uZWQgZGV2aWNlICovCj4gPj4gICAgI2VuZGlmCj4gPj4KPiA+
PiAgICAgIC8qIGZvciBub2RlLXJlbGF0ZWQgb3BlcmF0aW9ucyAqLwo+ID4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+PiBpbmRleCAyMDZkMDNjODJk
OTYuLmFlZjQxYjU0MDk4YyAxMDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+PiAr
KysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+PiBAQCAtMjM4NSw2ICsyMzg1LDE2IEBAIHN0YXRpYyBp
bnQgZjJmc19yZW1vdW50KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCAqZmxhZ3MsIGNoYXIg
KmRhdGEpCj4gPj4gICAgICBpZiAoZXJyKQo+ID4+ICAgICAgICAgICAgICBnb3RvIHJlc3RvcmVf
b3B0czsKPiA+Pgo+ID4+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPiA+PiArICAgIGlm
IChzYmktPm1heF9hY3RpdmVfem9uZXMgJiYgc2JpLT5tYXhfYWN0aXZlX3pvbmVzIDwgRjJGU19P
UFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+ID4+ICsgICAgICAgICAgICBmMmZzX2VycihzYmks
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgInpvbmVkOiBtYXggYWN0aXZlIHpvbmVzICV1IGlz
IHRvbyBzbWFsbCwgbmVlZCBhdCBsZWFzdCAldSBhY3RpdmUgem9uZXMiLAo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96b25lcywgRjJGU19PUFRJT04o
c2JpKS5hY3RpdmVfbG9ncyk7Cj4gPj4gKyAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4gPj4g
KyAgICAgICAgICAgIGdvdG8gcmVzdG9yZV9vcHRzOwo+ID4+ICsgICAgfQo+ID4+ICsjZW5kaWYK
PiA+PiArCj4gPj4gICAgICAvKiBmbHVzaCBvdXRzdGFuZGluZyBlcnJvcnMgYmVmb3JlIGNoYW5n
aW5nIGZzIHN0YXRlICovCj4gPj4gICAgICBmbHVzaF93b3JrKCZzYmktPnNfZXJyb3Jfd29yayk7
Cj4gPj4KPiA+PiBAQCAtMzkzMiw2ICszOTQyLDE0IEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2lu
Zm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2aSkKPiA+PiAgICAgIGlmICghZjJm
c19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPiA+PiAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPj4K
PiA+PiArICAgIHNiaS0+bWF4X2FjdGl2ZV96b25lcyA9IGJkZXZfbWF4X2FjdGl2ZV96b25lcyhi
ZGV2KTsKPiA+PiArICAgIGlmIChzYmktPm1heF9hY3RpdmVfem9uZXMgJiYgc2JpLT5tYXhfYWN0
aXZlX3pvbmVzIDwgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+ID4+ICsgICAgICAg
ICAgICBmMmZzX2VycihzYmksCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgInpvbmVkOiBtYXgg
YWN0aXZlIHpvbmVzICV1IGlzIHRvbyBzbWFsbCwgbmVlZCBhdCBsZWFzdCAldSBhY3RpdmUgem9u
ZXMiLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96
b25lcywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4gPj4gKyAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4+ICsgICAgfQo+ID4+ICsKPiA+PiAgICAgIHpvbmVfc2VjdG9ycyA9
IGJkZXZfem9uZV9zZWN0b3JzKGJkZXYpOwo+ID4+ICAgICAgaWYgKCFpc19wb3dlcl9vZl8yKHpv
bmVfc2VjdG9ycykpIHsKPiA+PiAgICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiRjJGUyBkb2Vz
IG5vdCBzdXBwb3J0IG5vbiBwb3dlciBvZiAyIHpvbmUgc2l6ZXNcbiIpOwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
