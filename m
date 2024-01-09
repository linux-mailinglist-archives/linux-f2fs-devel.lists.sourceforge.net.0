Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8EC827F11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jan 2024 08:09:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rN6EV-0001mt-6v;
	Tue, 09 Jan 2024 07:09:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rN6ET-0001mn-Sw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jan 2024 07:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mWKZBm49HTKJsSVTqSFKBSK/qcMrSE6KA1YgsZXKd+s=; b=nAEfCej4+HU0iejKyK1nqi0Uif
 1FbqDGKyeXTiIq4i6ntZhG5EIj19zz6sOjHvQhbHA3YP46zYaOySvJ0lpP2vAh84y3aE+QKUL51+S
 cN5k09U7bodU8aGcibN8ip2fbgspGyffRjFoLGywt0s6eAU4/BVpiLqoeyGqUsmCcyHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mWKZBm49HTKJsSVTqSFKBSK/qcMrSE6KA1YgsZXKd+s=; b=RGljg0upNMFNrt8kDOyppCr+Fq
 y1vdQyDiV54VD8ORKeLr42snyHMA46PuESEscJJxrGLkCwbMmA0TFz1pWDywCfhI7epbDX3Y1JeWy
 /vOfJxOHJtPPUdh8VwUBBr+Tey6TwF6eY6NQJRBlTob1xeTn6uloH0vx0H1Y9jgdilqY=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rN6ER-0006jh-Hs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jan 2024 07:09:05 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4279b73b5feso20416781cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Jan 2024 23:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704784132; x=1705388932; darn=lists.sourceforge.net;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWKZBm49HTKJsSVTqSFKBSK/qcMrSE6KA1YgsZXKd+s=;
 b=FL6uZc+JnBzlzV0IUkov0cOa+lhy9lv6c144hSOV3f0T+WRtYZnoY7ijWrmhCCrRFx
 G/2cJ4gJTEaGaKOa5eSOYiqFmtFIQDRehYY1iyg0Oq0sXzBZ+ZGGue0QL84I4z6b1I9w
 Ucr6UuNr8lfe/zt/yxNZvvIN6gUcMj7BtBghpGoffP0PCb52quq+UBoywJ5SoOzntgyN
 2yIlpoQQM62eJgSPSfkvBNiwrLZZvabrSLoSePrlAdRI/cf0XLm7c0pRz73SswVUehdE
 Qsu/mb0h4ptBfZidpgv9iuybp8HL7OHslEsgcES8M4MSv8KODGLJKCqEVCZIC/YEqeMf
 aE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704784132; x=1705388932;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWKZBm49HTKJsSVTqSFKBSK/qcMrSE6KA1YgsZXKd+s=;
 b=rD+HyXa484n/QMaN6c0Zh/k4z1j7MRGkPBrJnIDLxRurhh0TEXIfODYtCyJTwJMvx2
 /judlDCqS1t3HvXyf7oRdx50vGXH/VKDLrwf6Op9yW1gN0i2hoBr4OOlKtW+dHyNS91n
 PaFs8wOsUUfc8PObRLHC9xl5WGfj66JTD4rJHXgun5HLH4VK5gSIfjMcSpVnQThqWRD5
 VjfJh3BGC64G1z1OttyPUH7hXVPO2HgeH6T/EjXx9QlkERH85VzKrVhQTx+thSIu57Gq
 6LuIIuAK199YW559PXp43s7Y/T5iUJsl2mfsu74SejIp1KXUHlHrpzdy49uy/HswTtID
 /OkA==
X-Gm-Message-State: AOJu0YxPOJPxiANYIVui2LXyfJ8pr28ARNRP1OblbskRy91EwwlCrqfg
 PSU9BL7VoXdNLq58reL/jHGHcQRxuRfgvAOsBZ0oCZZbDoYOkA==
X-Google-Smtp-Source: AGHT+IHyNz4lnf3pR9yAD3GY4+j+Tua6f4ik1QBbsJ0ck80NNcsn8VPe0EOqPlw5mtfd1rEUVcvQ8OKVe/7YPBGHXL8=
X-Received: by 2002:ac8:5a8b:0:b0:428:400c:ed0 with SMTP id
 c11-20020ac85a8b000000b00428400c0ed0mr6682061qtc.35.1704784132660; Mon, 08
 Jan 2024 23:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20240107131236.625-1-qwjhust@gmail.com>
In-Reply-To: <20240107131236.625-1-qwjhust@gmail.com>
From: =?UTF-8?B?5LqT5paH5p2w?= <qwjhust@gmail.com>
Date: Tue, 9 Jan 2024 15:08:41 +0800
Message-ID: <CAGFpFsQsRm0s3OG1zENHSgPB+TcbGG6NKXKhugCYnzX=shf00A@mail.gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, guoweichao@oppo.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  This patch has been merged into the new patch. [PATCH v2]
   f2fs: fix max open zone constraints Wenjie 于2024年1月7日周日 21:12写道：
    > > From: Wenjie Qi > > BUG: kernel NULL pointer dereference, address: 0000000000000014
    > RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs] > Call [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rN6ER-0006jh-Hs
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhpcyBwYXRjaCBoYXMgYmVlbiBtZXJnZWQgaW50byB0aGUgbmV3IHBhdGNoLgoKW1BBVENIIHYy
XSBmMmZzOiBmaXggbWF4IG9wZW4gem9uZSBjb25zdHJhaW50cwpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwMTA5MDM1ODA0LjY0Mi0xLXF3amh1c3RAZ21haWwu
Y29tLwoKCldlbmppZSA8cXdqaHVzdEBnbWFpbC5jb20+IOS6jjIwMjTlubQx5pyIN+aXpeWRqOaX
pSAyMToxMuWGmemBk++8mgo+Cj4gRnJvbTogV2VuamllIFFpIDxxd2podXN0QGdtYWlsLmNvbT4K
Pgo+IEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAw
MDAwMDAwMDAxNAo+IFJJUDogMDAxMDpmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKzB4NmNmLzB4Nzgw
IFtmMmZzXQo+IENhbGwgVHJhY2U6Cj4gPFRBU0s+Cj4gPyBzaG93X3JlZ3MrMHg2ZS8weDgwCj4g
PyBfX2RpZSsweDI5LzB4NzAKPiA/IHBhZ2VfZmF1bHRfb29wcysweDE1NC8weDRhMAo+ID8gcHJi
X3JlYWRfdmFsaWQrMHgyMC8weDMwCj4gPyBfX2lycV93b3JrX3F1ZXVlX2xvY2FsKzB4MzkvMHhk
MAo+ID8gaXJxX3dvcmtfcXVldWUrMHgzNi8weDcwCj4gPyBkb191c2VyX2FkZHJfZmF1bHQrMHgz
MTQvMHg2YzAKPiA/IGV4Y19wYWdlX2ZhdWx0KzB4N2QvMHgxOTAKPiA/IGFzbV9leGNfcGFnZV9m
YXVsdCsweDJiLzB4MzAKPiA/IGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUrMHg2Y2YvMHg3ODAgW2Yy
ZnNdCj4gPyBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKzB4NzM2LzB4NzgwIFtmMmZzXQo+IGRvX3dy
aXRlX3BhZ2UrMHg1MC8weDE3MCBbZjJmc10KPiBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGErMHg2
MS8weGIwIFtmMmZzXQo+IGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlKzB4M2Y4LzB4NjYwIFtmMmZz
XQo+IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDViYi8weDdhMCBbZjJmc10KPiBmMmZz
X3dyaXRlX2NhY2hlX3BhZ2VzKzB4M2RhLzB4YmUwIFtmMmZzXQo+IC4uLgo+Cj4gSXQgaXMgcG9z
c2libGUgdGhhdCBvdGhlciB0aHJlYWRzIGhhdmUgYWRkZWQgdGhpcyBmaW8gdG8gaW8tPmJpbwo+
IGFuZCBzdWJtaXR0ZWQgdGhlIGlvLT5iaW8gYmVmb3JlIGVudGVyaW5nIGYyZnNfc3VibWl0X3Bh
Z2Vfd3JpdGUoKS4KPiBBdCB0aGlzIHBvaW50IGlvLT5iaW8gPSBOVUxMLgo+IElmIGlzX2VuZF96
b25lX2Jsa2FkZHIoc2JpLCBmaW8tPm5ld19ibGthZGRyKSBvZiB0aGlzIGZpbyBpcyB0cnVlLAo+
IHRoZW4gYW4gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGVycm9yIG9jY3VycyBhdCBiaW9fZ2V0
KGlvLT5iaW8pLgo+IEluIHRoaXMgY2FzZSwgdGhlIGNvZGUgdG8gZGV0ZXJtaW5lIHRoZSB6b25l
IGVuZCBjYW4gc2ltcGx5IGJlIHNraXBwZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZW5qaWUgUWkg
PHF3amh1c3RAZ21haWwuY29tPgo+IC0tLQo+ICBmcy9mMmZzL2RhdGEuYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGluZGV4IDE4OTY5MjhjYWU3Ny4u
ZDA4ZTkyYmIyNjIxIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJm
cy9kYXRhLmMKPiBAQCAtMTEwMCw3ICsxMTAwLDcgQEAgdm9pZCBmMmZzX3N1Ym1pdF9wYWdlX3dy
aXRlKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPiAgICAgICAgICAgICAgICAgZ290byBuZXh0
Owo+ICBvdXQ6Cj4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+IC0gICAgICAgaWYgKGYy
ZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgYnR5cGUgPCBNRVRBICYmCj4gKyAgICAgICBpZiAo
aW8tPmJpbyAmJiBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIGJ0eXBlIDwgTUVUQSAmJgo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2VuZF96b25lX2Jsa2FkZHIoc2JpLCBmaW8tPm5l
d19ibGthZGRyKSkgewo+ICAgICAgICAgICAgICAgICBzcGluX2xvY2tfYmgoJnNiaS0+YXZhaWxh
YmxlX2FjdGl2ZV96b25lc19sb2NrKTsKPiAgICAgICAgICAgICAgICAgaWYgKHNiaS0+YXZhaWxh
YmxlX2FjdGl2ZV96b25lcyA+IDApIHsKPiAtLQo+IDIuMzQuMQo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
