Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEF89C13CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 02:53:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9EC5-0003RR-D8;
	Fri, 08 Nov 2024 01:53:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t9EC4-0003RJ-Tx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g6iszzv7cvyfxc67RtDE1FElxuvz0aWSZ5YwOIqG6hs=; b=YYHmAJaECslqvHRiKfqvPnlGMs
 ag4w5W+w96j5OsDt5Bjd8eYmJiC1ZOiK9nuCSQ7IJBNkA0UOui11xHyNLcASeZVL7Lmxs/ldPyK9t
 WaIePKRJ896CJ8KKWg+9TTd5Yfv6mUGF91jdusRwQOlrxSO8hSpLSYSSoEEgbu4ORPQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g6iszzv7cvyfxc67RtDE1FElxuvz0aWSZ5YwOIqG6hs=; b=gj0lfSjnqTAN5k+VeHj3n67/q4
 +oaAdV+Idz2Kv2PdvS7Fw+ow6Gp7JAKDNgJTbLWM40VOHV713O96VmfAjPSUt8zMhIenb4WZKrxcp
 WYXPKRV7Cf+TpxMg9vSshttLWxAUAz2YlOridGuJ83BVDSrV9JLN77QmtefkidtynBPs=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9EC4-0007ay-7Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:53:49 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37ece998fe6so110444f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Nov 2024 17:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731030817; x=1731635617; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6iszzv7cvyfxc67RtDE1FElxuvz0aWSZ5YwOIqG6hs=;
 b=njT+YrxYKC4AGXTfrOi5Amcv/tpGBefgumYQRkJ/2q/QNq0KEMeU5C5hRWmKRY1smx
 MjKKcdTssWakFTVy9nEZWAZVI6ZxuNjHezRoGvGXrztWgEW1JnDkKvjXMVuhwRWpDdhP
 mXVa8clVnrH+dIx34LnGX46AuRRh0XwS75UQvQ8GkJrzcP/TpebXev+vaoA8dwDdnIsA
 Oh5ywnsQ3NjawnNh0JAapKJXV1obeyV06Xm8mgAxqFj9G+UFRFus7ZVy4C5bDI0saY8E
 ExhCx6pwPXcy3MDKBXoG3ekdIBLLMmrA+NGJZEDiOljFkCD6cqo7UlrZMQS3EBiB2i74
 lWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731030817; x=1731635617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g6iszzv7cvyfxc67RtDE1FElxuvz0aWSZ5YwOIqG6hs=;
 b=COAf9GawSlhFgyerC+8Gu59GXP1OOqv+NYQ++SSYPC3ODC49OqSSR0eaZWLSsiLRYp
 AmBTYUUYS4ZPVT5o0iOKethTT5qTxLTRNQfB8nE8Pdr34UGhxT8ISKb+MhEKuciE12nv
 h7N9Dpk0Fl+jIh/janDPdfF5vaIO6ykJ9Y8I5bysb5psY9+7CTLqR5x4km/FW9DtgQwl
 e8kVr8OfxdF0uaU/auYF1cb9a4sHz01274eEA9kVi7KHa87V5/ldJFhlRmKKxHn0ngBi
 zf02PWSBBpYXR+vpioe8LUjwMPcKq2DpYtdO5TyKpbjXdPapT+ThwaCmTXO9zv47frJ/
 bHLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGfuhIek4gmHlIxLzjM3c56x2hjyuNQpKRi9Cn3EQI2uVkkYTerBmg7xTQLZlkUTX3xbyZu58T0lCM8IO/hkLr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxZnDpGMG/DptrCXzCGpFHeJSdg1hgcJosoHBmLZ0NgFktKYA5H
 3w3M28yzlyW8UQ17k2/+870BDClRtUVX23wDPXre5CzF5tZGPoMefoBdMkbU6cbf1Me10/VxTML
 K3IJ8T+tC+B0E794cCKMFLhdYYuk=
X-Google-Smtp-Source: AGHT+IGgNIKoU99YePnICd4cm2bjzqJfA+hS0vhBjQkQCnwLsURxcSPUeHxtI9hZhTYEByIrD5F6okwSP8weEiNgMgE=
X-Received: by 2002:a05:6000:1863:b0:375:bb30:6525 with SMTP id
 ffacd0b85a97d-381f1829a97mr343524f8f.1.1731030816332; Thu, 07 Nov 2024
 17:53:36 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
 <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
 <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
 <CAHJ8P3L4Q4Pia66o1RQGw5NnUOVxzNgFXUPO33jtqfQ-Oc=G_g@mail.gmail.com>
 <0a8f96da-302d-4d6c-9ab6-0b66a05cbcfd@kernel.org>
 <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
 <d5ef36a3-1bcb-40a0-a963-c6d1887c4e4e@kernel.org>
 <CAHJ8P3JARkFxkyz-FLWN2PSZb2AL3=dSqF1v-SR-oU9z6tm+Rg@mail.gmail.com>
 <45cec698-2679-435b-b62a-ebe22d361955@kernel.org>
 <CAHJ8P3LWwA=VzKcr3nXO1uZtkc1H9dmO+5dNy247A2fGn6JHDA@mail.gmail.com>
 <e2e61445-c1fd-4b88-8402-b9f83111e05e@kernel.org>
In-Reply-To: <e2e61445-c1fd-4b88-8402-b9f83111e05e@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 8 Nov 2024 09:53:25 +0800
Message-ID: <CAHJ8P3+7eE2h9kWSN81H2n8MXuzvozB-nG3Uq2Z18-WdRXu3vg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月8日周五 09:22写道： > > On 2024/11/7
    18:53, Zhiguo Niu wrote: > > Chao Yu 于2024年11月7日周四 16:22写道：
    > >> > >> On 2024/11/7 14:54, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t9EC4-0007ay-7Y
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg45pel5ZGo5LqUIDA5OjIy
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzcgMTg6NTMsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDfml6Xlkajlm5sgMTY6MjLl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNyAxNDo1NCwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg35pel5ZGo5Zub
IDE0OjE45YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xMS82IDE2OjQxLCBaaGlndW8g
Tml1IHdyb3RlOgo+ID4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx
5pyINuaXpeWRqOS4iSAxNTo0MOWGmemBk++8mgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAyMDI0LzEx
LzYgMTQ6MDgsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTA6NDDlhpnpgZPvvJoKPiA+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+IE9uIDIwMjQvMTEvNiAxMDoyNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+Pj4+
Pj4+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJ
IDEwOjE25YaZ6YGT77yaCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gT24gMjAyNC8xMS81IDE5
OjAyLCBaaGlndW8gTml1IHdyb3RlOgo+ID4+Pj4+Pj4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAxODozOeWGmemBk++8mgo+ID4+Pj4+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+Pj4+PiBPbiAyMDI0LzExLzUgMTU6MjgsIFpoaWd1byBOaXUgd3JvdGU6
Cj4gPj4+Pj4+Pj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeac
iDXml6XlkajkuowgMTU6MDTlhpnpgZPvvJoKPiA+Pj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+
Pj4+IE9uIDIwMjQvMTEvNCA5OjU2LCBaaGlndW8gTml1IHdyb3RlOgo+ID4+Pj4+Pj4+Pj4+Pj4+
PiBJZiB1c2VyIGdpdmUgYSBmaWxlIHNpemUgYXMgImxlbmd0aCIgcGFyYW1ldGVyIGZvciBmaWVt
YXAKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24t
YmxvY2sgc2l6ZSBhbGlnbmVkLAo+ID4+Pj4+Pj4+Pj4+Pj4+PiBpdCB3aWxsIHNob3cgMiBzZWdt
ZW50cyBmaWVtYXAgcmVzdWx0cyBldmVuIHRoaXMgd2hvbGUgZmlsZQo+ID4+Pj4+Pj4+Pj4+Pj4+
PiBpcyBjb250aWd1b3VzIG9uIGRpc2ssIHN1Y2ggYXMgdGhlIGZvbGxvd2luZyByZXN1bHRzOgo+
ID4+Pj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAuL2YyZnNfaW8gZmll
bWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4+Pj4+Pj4+PiBGaWVtYXA6IG9m
ZnNldCA9IDAgbGVuID0gMTkwMzQKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGxv
Z2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4g
Pj4+Pj4+Pj4+Pj4+Pj4+IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDIwYmFhMDAw
IDAwMDAwMDAwMDAwMDQwMDAgMDAwMDEwMDAKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gMSAgICAgICAwMDAw
MDAwMDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+
ID4+Pj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4+PiBhZnRlciB0aGlzIHBhdGNoOgo+ID4+
Pj4+Pj4+Pj4+Pj4+PiAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+
ID4+Pj4+Pj4+Pj4+Pj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTkwMzQKPiA+Pj4+Pj4+
Pj4+Pj4+Pj4gICAgICAgICAgICAgbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxl
bmd0aCAgICAgICAgICAgZmxhZ3MKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gMCAgICAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMzE1ZjMwMDAgMDAwMDAwMDAwMDAwNTAwMCAwMDAwMTAwMQo+ID4+Pj4+Pj4+
Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGln
dW8ubml1QHVuaXNvYy5jb20+Cj4gPj4+Pj4+Pj4+Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4+Pj4+Pj4+
PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4g
Pj4+Pj4+Pj4+Pj4+Pj4+IGYyZnNfaW8gaGFzIGJlZW4gbW9kaWZpZWQgZm9yIHRlc3RpbmcsIHRo
ZSBsZW5ndGggZm9yIGZpZW1hcCBpcwo+ID4+Pj4+Pj4+Pj4+Pj4+PiByZWFsIGZpbGUgc2l6ZSwg
bm90IGJsb2NrIG51bWJlcgo+ID4+Pj4+Pj4+Pj4+Pj4+PiAtLS0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4g
ICAgICAgICAgZnMvZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAg
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+
Pj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5j
IGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gaW5kZXggMzA2Yjg2YjAuLjlmYzIy
OWQgMTAwNjQ0Cj4gPj4+Pj4+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4+
Pj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4+Pj4+Pj4+Pj4+IEBAIC0xOTY2
LDggKzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0
IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAg
ICAgIH0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+Pj4gLSAgICAgaWYgKGJ5dGVz
X3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gLSAgICAgICAgICAg
ICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAg
aWYgKGxlbiAmIChibGtzX3RvX2J5dGVzKGlub2RlLCAxKSAtIDEpKQo+ID4+Pj4+Pj4+Pj4+Pj4+
PiArICAgICAgICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwg
MSkpOwo+ID4+Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+Pj4gSG93IGRvIHlvdSB0aGluayBv
ZiBnZXR0aW5nIHJpZCBvZiBhYm92ZSBhbGlnbm1lbnQgZm9yIGxlbj8KPiA+Pj4+Pj4+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgc3RhcnRf
YmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+ID4+Pj4+Pj4+Pj4+Pj4+PiAgICAg
ICAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEp
Owo+ID4+Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+Pj4gQW5kIHJvdW5kIHVwIGVuZCBwb3Np
dGlvbiB3LzoKPiA+Pj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4+IGxhc3RfYmxrID0gYnl0
ZXNfdG9fYmxrcyhpbm9kZSwgcm91bmRfdXAoc3RhcnQgKyBsZW4gLSAxLCBGMkZTX0JMS1NJWkUp
KTsKPiA+Pj4+Pj4+Pj4+Pj4+IEhpIENoYW8sCj4gPj4+Pj4+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMg
d2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+ID4+Pj4+Pj4+Pj4+Pj4gLS0tLS0t
LS0tLS0tLQo+ID4+Pj4+Pj4+Pj4+Pj4gaWYgKHN0YXJ0X2JsayA+IGxhc3RfYmxrKQo+ID4+Pj4+
Pj4+Pj4+Pj4gICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4+Pj4+Pj4+IC0tLS0tLS0tLS0t
LS0KPiA+Pj4+Pj4+Pj4+Pj4+IGZvciBleGFtcGxlLCBhIGZpbGUgd2l0aCBzaXplIDE5MDA2LCBi
dXQgdGhlIGxlbmd0aCBmcm9tIHRoZSB1c2VyIGlzIDE2Mzg0Lgo+ID4+Pj4+Pj4+Pj4+Pj4gYmVm
b3JlIHRoaXMgbW9kaWZpY2F0aW9uLCAgbGFzdF9ibGsgPSAgYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
c3RhcnQgKwo+ID4+Pj4+Pj4+Pj4+Pj4gbGVuIC0gMSkgPSAoaW5vZGUsIDE2MzgzKSA9IDMKPiA+
Pj4+Pj4+Pj4+Pj4+IGFmdGVyIHRoZSBmaXJzdCBmMmZzX21hcF9ibG9ja3MoKS4gc3RhcnRfYmxr
IGNoYW5nZSB0byBiZSA0LAo+ID4+Pj4+Pj4+Pj4+Pj4gYWZ0ZXIgdGhlIHNlY29uZCBmMmZzX21h
cF9ibG9ja3MoKSwgZmllbWFwX2ZpbGxfbmV4X2V4dGVuIHdpbGwgYmUKPiA+Pj4+Pj4+Pj4+Pj4+
IGNhbGxlZCB0byBmaWxsIHVzZXIgcGFyYW1ldGVyIGFuZCB0aGVuCj4gPj4+Pj4+Pj4+Pj4+PiB3
aWxsIGdvdG8gb3V0IGJlY2F1c2Ugc3RhcnRfYmxrID4gbGFzdF9ibGssIHRoZW4gZmllbWFwIGZs
b3cgZmluaXNoZXMuCj4gPj4+Pj4+Pj4+Pj4+PiBidXQgYWZ0ZXIgdGhpcyBtb2RpZmljYXRpb24s
IGxhc3RfYmxrIHdpbGwgYmUgNAo+ID4+Pj4+Pj4+Pj4+Pj4gd2lsbCBkbyBmMmZzX21hcF9ibG9j
a3MoKSB1bnRpbCByZWFjaCB0aGUgbWF4X2ZpbGVfYmxvY2tzKGlub2RlKQo+ID4+Pj4+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+Pj4+PiBZZXMsIHlvdSdyZSByaWdodCwgaG93ZXZlciwgdy8gdGhpcyBwYXRj
aCwgaXQgbWF5IGNoYW5nZSBsYXN0X2JsaywgZS5nLgo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+
Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTkwMDYiIHZzIHhmc19pbyBmaWxlIC1j
ICJmaWVtYXAgLXYgMiAxOTAwNiIKPiA+Pj4+Pj4+Pj4+Pj4gc3RhcnRfYmxrIGFuZCBsYXN0X2Js
ayB3aWxsIGJlOiAwLCA0IGFuZCAwLCA1Lgo+ID4+Pj4+Pj4+Pj4+IEhpIENoYW8sCj4gPj4+Pj4+
Pj4+Pj4geWVzLCBidXQgdy9vIHRoaXMgcGF0Y2ggLCB0aGUgb3JpZ2luYWwgY29kZSBzdGlsbCBo
YXMgdGhlIHNhbWUgc2l0dWF0aW9uPz8KPiA+Pj4+Pj4+Pj4+PiBmb3IgZXhhbXBsZQo+ID4+Pj4+
Pj4+Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIgdnMgeGZzX2lvIGZpbGUg
LWMgImZpZW1hcCAtdiAyIDE2Mzg0Igo+ID4+Pj4+Pj4+Pj4+IHN0YXJ0X2JsayBhbmQgbGFzdF9i
bGsgd2lsbCBiZTogMCwgMyBhbmQgMCwgNC4KPiA+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+PiBGb3Ig
dGhlIGNhc2UgImZpZW1hcCAtdiAyIDE5MDA2Iiwgb2Zmc2V0IGlzIDIsIGFuZCBsZW5ndGggaXMg
MTkwMDYsIHNvIGxhc3Rfb2Zmc2V0Cj4gPj4+Pj4+Pj4+PiBpcyAxOTAwOCwgYW5kIGxhc3RfYmxr
IHNob3VsZCBiZSA0IHJhdGhlciB0aGFuIDUsIHJpZ2h0Pwo+ID4+Pj4+Pj4+PiBoaSBDaGFvLAo+
ID4+Pj4+Pj4+PiBpdCBpcyByaWdodCB3L28gbXkgcGF0Y2guCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+Pj4gQW5kIGZvciB5b3UgY2FzZSwgaXQgY2FsY3VsYXRlcyBsYXN0X2JsayBjb3JyZWN0bHku
Cj4gPj4+Pj4+Pj4+IFNvIHlvdSBzdWdnZXN0IHRoYXQgIlNob3VsZCB3ZSByb3VuZF91cCBsZW4g
YWZ0ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsKPiA+Pj4+Pj4+Pj4gY2FsY3VsYXRpb24/Igo+ID4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4gWmhpZ3VvLAo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gWWVzLCBJIHRo
aW5rIGFsaWdubWVudCBvZiBsZW4gc2hvdWxkIG5vdCBhZmZlY3QgY2FsY3VsYXRpb24gb2YgbGFz
dF9ibGsuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBJIG1lYW4gdGhpcywKPiA+Pj4+Pj4+Pgo+ID4+
Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4+ICAgICAgIGZzL2YyZnMvZGF0YS5jICAgICAgICAgIHwgNiAr
KystLS0KPiA+Pj4+Pj4+PiAgICAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4g
Pj4+Pj4+Pj4gICAgICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMg
Yi9mcy9mMmZzL2RhdGEuYwo+ID4+Pj4+Pj4+IGluZGV4IDdkMWJiOTUxOGE0MC4uY2JiYjk1NmY0
MjBkIDEwMDY0NAo+ID4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4+Pj4gKysr
IGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+Pj4+PiBAQCAtMTk2NywxMiArMTk2NywxMiBAQCBpbnQg
ZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5m
byAqZmllaW5mbywKPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gPj4+Pj4+Pj4gICAgICAgICAgICAgfQo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gLSAgICAg
ICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+ID4+Pj4+Pj4+IC0gICAgICAg
ICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+PiAtCj4gPj4+
Pj4+Pj4gICAgICAgICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQp
Owo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
c3RhcnQgKyBsZW4gLSAxKTsKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+ICsgICAgICAgaWYgKGxlbiAm
IEYyRlNfQkxLU0laRV9NQVNLKQo+ID4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBsZW4gPSByb3Vu
ZF91cChsZW4sIEYyRlNfQkxLU0laRSk7Cj4gPj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4gSGkgQ2hhbywK
PiA+Pj4+Pj4+IHRoaXMgdmVyaW9uIHZlcmlmeSBwYXNzIHdpdGggbXkgdGVzdCBjYXNlLgo+ID4+
Pj4+Pj4KPiA+Pj4+Pj4+IGJ1dCB0aGVyZSBpcyBzdGlsbCBhbm90aGVyIGlzc3VlIGluIG9yZ2lu
YWwgY29kZToKPiA+Pj4+Pj4+IHlsb2cvYW5hbHl6ZXIucHkgIHNpemUgPSAxOTAzNAo+ID4+Pj4+
Pj4gaWYgSSBpbnB1dCB0aGUgZm9sbG93aW5nIGNtZChzdGFydC9sZW5ndGggYXJlIGJvdGggcmVh
bCBzaXplLCBub3QgYmxvY2sgbnVtYmVyKQo+ID4+Pj4+Pj4gL2YyZnNfaW8gZmllbWFwIDIgMTYz
ODQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4gYW5kIHRoZSByZXN1bHRzIHNob3dzOgo+ID4+
Pj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAyIGxlbiA9IDE2Mzg0Cj4gPj4+Pj4+PiAgICAgICAgIGxv
Z2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4g
Pj4+Pj4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMGUyZWJjYTAwMCAwMDAwMDAwMDAw
MDA0MDAwIDAwMDAxMDAwCj4gPj4+Pj4+PiAxICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAwMGUy
ZWJjZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4gPj4+Pj4+PiBzbyBzdGFydF9ibGsv
bGFzdF9ibGsgc2hvdWxkIGJlIGNhbGN1bGF0ZSBpdCBpbiB0aGUgZm9sbG93aW5nIHdheT8KPiA+
Pj4+Pj4KPiA+Pj4+Pj4gSUlVQywgdGhlIHJvb3QgY2F1c2UgaXMgZjJmc19tYXBfYmxvY2tzKCkg
d2lsbCB0cnVuY2F0ZSBzaXplIG9mCj4gPj4+Pj4+IHJldHVybmVkIGV4dGVudCB0byBGMkZTX0JZ
VEVTX1RPX0JMSyhsZW4pLCBzbyB3aGVuZXZlciBwYXJhbWV0ZXIKPiA+Pj4+Pj4gQGxlbiBkb2Vz
bid0IGNvdmVyIGxhc3QgZXh0ZW50LCBpdCB0cmlnZ2VycyB0aGlzIGJ1Zy4KPiA+Pj4+Pj4KPiA+
Pj4+Pj4gbmV4dDoKPiA+Pj4+Pj4gICAgICAgICAgICBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1h
cCkpOwo+ID4+Pj4+PiAgICAgICAgICAgIG1hcC5tX2xibGsgPSBzdGFydF9ibGs7Cj4gPj4+Pj4+
ICAgICAgICAgICAgbWFwLm1fbGVuID0gRjJGU19CWVRFU19UT19CTEsobGVuKTsgIC0tLSBsaW1p
dCBtYXggc2l6ZSBvZiBleHRlbnQgaXQgZm91bmRzCj4gPj4+Pj4geWVzLCBJIHRoaW5rIHNvIHRv
by4KPiA+Pj4+Pj4gICAgICAgICAgICBtYXAubV9uZXh0X3Bnb2ZzID0gJm5leHRfcGdvZnM7Cj4g
Pj4+Pj4+ICAgICAgICAgICAgbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwo+ID4+Pj4+
PiAuLi4KPiA+Pj4+Pj4gICAgICAgICAgICByZXQgPSBmMmZzX21hcF9ibG9ja3MoaW5vZGUsICZt
YXAsIEYyRlNfR0VUX0JMT0NLX0ZJRU1BUCk7Cj4gPj4+Pj4+Cj4gPj4+Pj4+IHhmc19pbyBmaWxl
IC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPiA+Pj4+Pj4gZmlsZToKPiA+Pj4+Pj4gICAgICBFWFQ6
IEZJTEUtT0ZGU0VUICAgICAgQkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFHUwo+ID4+Pj4+PiAg
ICAgICAgMDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4MTAwMAo+
ID4+Pj4+PiAgICAgICAgMTogWzMyLi4zOV06ICAgICAgICAxMzkzMDQuLjEzOTMxMSAgICAgICA4
IDB4MTAwMQo+ID4+Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiCj4gPj4+
Pj4+IGZpbGU6Cj4gPj4+Pj4+ICAgICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdF
ICAgICAgVE9UQUwgRkxBR1MKPiA+Pj4+Pj4gICAgICAgIDA6IFswLi4zMV06ICAgICAgICAgMTM5
MjcyLi4xMzkzMDMgICAgICAzMiAweDEwMDAKPiA+Pj4+Pj4geGZzX2lvIGZpbGUgLWMgImZpZW1h
cCAtdiAwIDE2Mzg1Igo+ID4+Pj4+PiBmaWxlOgo+ID4+Pj4+PiAgICAgIEVYVDogRklMRS1PRkZT
RVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4gPj4+Pj4+ICAgICAgICAwOiBb
MC4uMzldOiAgICAgICAgIDEzOTI3Mi4uMTM5MzExICAgICAgNDAgMHgxMDAxCj4gPj4+Pj4KPiA+
Pj4+PiBCdXQgIElmIHRoZSBjb3JyZWN0IGxhc3RfYmxrIGlzIGNhbGN1bGF0ZWQgY29ycmVjdGx5
LCBmaWVtYXAgY2FuIGJlCj4gPj4+Pj4gZW5kZWQgYXMgc29vbiBhcyBwb3NzaWJsZT8gIHNvIHRo
ZSByZXN1bHRzIHNob3duIGlzIGFsc28gcmlnaHQ/Cj4gPj4+Pgo+ID4+Pj4gWmhpZ3VvLAo+ID4+
Pj4KPiA+Pj4+IElNTywgaXQncyBub3QsIGR1ZSB0byAxKSBpZiB0aGUgZXh0ZW50IGlzIGxhc3Qg
b25lLCBGSUVNQVBfRVhURU5UX0xBU1QKPiA+Pj4+IG11c3QgYmUgdGFnZ2VkIHRvIG5vdGljZSB1
c2VyIHRoYXQgaXQgZG9lc24ndCBuZWVkIGZ1cnRoZXIgZmllbWFwIG9uCj4gPj4+PiBsYXR0ZXIg
TEJBLCAyKSBvbmUgY29udGludW91cyBleHRlbnQgc2hvdWxkIG5vdCBiZSBzcGxpdCB0byB0d28u
Cj4gPj4+Pgo+ID4+Pj4gTGV0IG1lIGZpZ3VyZSBvdXQgYSBmaXggZm9yIHRoYXQuCj4gPj4+IEhp
IENoYW8sCj4gPj4+IE9LLCB0aGFua3MgZm9yIHlvdXIgZXhwbGFpbmF0aW9uLgo+ID4+PiBidHcs
IERvIEkgbmVlZCB0byB1cGRhdGUgYSBwYXRjaCBhYm91dCB0aGUgb3JpZ2luYWwgaXNzdWUgd2Ug
ZGlzc2N1c3NlZD8KPiA+Pj4gb3IgeW91IHdpbGwgbW9kaWZ5IGl0IHRvZ2V0aGVyPwo+ID4+Cj4g
Pj4gWmhpZ3VvLCBsZXQgbWUgc2VuZCBhIHBhdGNoc2V0IGluY2x1ZGluZyB5b3VyIHBhdGNoLCBu
b3csIEknbSB0ZXN0aW5nIHRoaXM6Cj4gPiBIaSBDaGFvLAo+ID4gSXQncyBvayBeXgo+ID4+Cj4g
Pj4gICBGcm9tIGM2N2NiNDc4MmEzZjE4NzU4NjVmOWFlMjRjY2U4MGE1OTc1MmQ2MDAgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4gPj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+
ID4+IERhdGU6IFRodSwgNyBOb3YgMjAyNCAxNDo1MjoxNyArMDgwMAo+ID4+IFN1YmplY3Q6IFtQ
QVRDSF0gZjJmczogZml4IHRvIHJlcXVlcnkgZXh0ZW50IHdoaWNoIGNyb3NzIGJvdW5kYXJ5IG9m
IGlucXVpcnkKPiA+Pgo+ID4+IGRkIGlmPS9kZXYvemVybyBvZj1maWxlIGJzPTRrIGNvdW50PTUK
PiA+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDIgMTYzODQiCj4gPj4gZmlsZToKPiA+PiAg
ICAgIEVYVDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4g
Pj4gICAgICAgIDA6IFswLi4zMV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEw
MDAKPiA+PiAgICAgICAgMTogWzMyLi4zOV06ICAgICAgICAxMzkzMDQuLjEzOTMxMSAgICAgICA4
IDB4MTAwMQo+ID4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIKPiA+PiBmaWxl
Ogo+ID4+ICAgICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwg
RkxBR1MKPiA+PiAgICAgICAgMDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAg
IDMyIDB4MTAwMAo+ID4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NSIKPiA+PiBm
aWxlOgo+ID4+ICAgICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9U
QUwgRkxBR1MKPiA+PiAgICAgICAgMDogWzAuLjM5XTogICAgICAgICAxMzkyNzIuLjEzOTMxMSAg
ICAgIDQwIDB4MTAwMQo+ID4+Cj4gPj4gVGhlcmUgYXJlIHR3byBwcm9ibGVtczoKPiA+PiAtIGNv
bnRpbnVvdXMgZXh0ZW50IGlzIHNwbGl0IHRvIHR3bwo+ID4+IC0gRklFTUFQX0VYVEVOVF9MQVNU
IGlzIG1pc3NpbmcgaW4gbGFzdCBleHRlbnQKPiA+Pgo+ID4+IFRoZSByb290IGNhdXNlIGlzOiBp
ZiB1cHBlciBib3VuZGFyeSBvZiBpbnF1aXJ5IGNyb3NzZXMgZXh0ZW50LAo+ID4+IGYyZnNfbWFw
X2Jsb2NrcygpIHdpbGwgdHJ1bmNhdGUgbGVuZ3RoIG9mIHJldHVybmVkIGV4dGVudCB0bwo+ID4+
IEYyRlNfQllURVNfVE9fQkxLKGxlbiksIGFuZCBhbHNvLCBpdCB3aWxsIHN0b3AgdG8gcXVlcnkg
bGF0dGVyCj4gPj4gZXh0ZW50IG9yIGhvbGUgdG8gbWFrZSBzdXJlIGN1cnJlbnQgZXh0ZW50IGlz
IGxhc3Qgb3Igbm90Lgo+ID4+Cj4gPj4gSW4gb3JkZXIgdG8gZml4IHRoaXMgaXNzdWUsIG9uY2Ug
d2UgZm91bmQgYW4gZXh0ZW50IGxvY2F0ZXMKPiA+PiBpbiB0aGUgZW5kIG9mIGlucXVpcnkgcmFu
Z2UgYnkgZjJmc19tYXBfYmxvY2tzKCksIHdlIG5lZWQgdG8KPiA+PiBleHBhbmQgaW5xdWlyeSBy
YW5nZSB0byByZXF1aXJ5Lgo+ID4+Cj4gPj4gUmVwb3J0ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4gPj4gLS0tCj4gPj4gICAgZnMvZjJmcy9kYXRhLmMgfCAyMCArKysrKysrKysrKysr
KystLS0tLQo+ID4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMKPiA+PiBpbmRleCA2OWYxY2IwNDkwZWUuLmVlNTYxNDMyNGRmMCAxMDA2NDQKPiA+PiAt
LS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4gQEAgLTE4
OTYsNyArMTg5Niw3IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ID4+ICAgICAgICAgICAgICAgICAgdTY0
IHN0YXJ0LCB1NjQgbGVuKQo+ID4+ICAgIHsKPiA+PiAgICAgICAgICBzdHJ1Y3QgZjJmc19tYXBf
YmxvY2tzIG1hcDsKPiA+PiAtICAgICAgIHNlY3Rvcl90IHN0YXJ0X2JsaywgbGFzdF9ibGs7Cj4g
Pj4gKyAgICAgICBzZWN0b3JfdCBzdGFydF9ibGssIGxhc3RfYmxrLCBibGtfbGVuLCBtYXhfbGVu
Owo+ID4+ICAgICAgICAgIHBnb2ZmX3QgbmV4dF9wZ29mczsKPiA+PiAgICAgICAgICB1NjQgbG9n
aWNhbCA9IDAsIHBoeXMgPSAwLCBzaXplID0gMDsKPiA+PiAgICAgICAgICB1MzIgZmxhZ3MgPSAw
Owo+ID4+IEBAIC0xOTQwLDE0ICsxOTQwLDEzIEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ID4+Cj4gPj4g
ICAgICAgICAgc3RhcnRfYmxrID0gRjJGU19CWVRFU19UT19CTEsoc3RhcnQpOwo+ID4+ICAgICAg
ICAgIGxhc3RfYmxrID0gRjJGU19CWVRFU19UT19CTEsoc3RhcnQgKyBsZW4gLSAxKTsKPiA+PiAt
Cj4gPj4gLSAgICAgICBpZiAobGVuICYgRjJGU19CTEtTSVpFX01BU0spCj4gPj4gLSAgICAgICAg
ICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgRjJGU19CTEtTSVpFKTsKPiA+PiArICAgICAgIGJs
a19sZW4gPSBsYXN0X2JsayAtIHN0YXJ0X2JsayArIDE7Cj4gPj4gKyAgICAgICBtYXhfbGVuID0g
RjJGU19CWVRFU19UT19CTEsobWF4Ynl0ZXMpIC0gc3RhcnRfYmxrOwo+ID4+Cj4gPj4gICAgbmV4
dDoKPiA+PiAgICAgICAgICBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+ID4+ICAgICAg
ICAgIG1hcC5tX2xibGsgPSBzdGFydF9ibGs7Cj4gPj4gLSAgICAgICBtYXAubV9sZW4gPSBGMkZT
X0JZVEVTX1RPX0JMSyhsZW4pOwo+ID4+ICsgICAgICAgbWFwLm1fbGVuID0gYmxrX2xlbjsKPiA+
PiAgICAgICAgICBtYXAubV9uZXh0X3Bnb2ZzID0gJm5leHRfcGdvZnM7Cj4gPj4gICAgICAgICAg
bWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwo+ID4+Cj4gPj4gQEAgLTE5NzAsNiArMTk2
OSwxNyBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1h
cF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+PiAgICAgICAgICAgICAgICAgIGZsYWdzIHw9IEZJ
RU1BUF9FWFRFTlRfTEFTVDsKPiA+PiAgICAgICAgICB9Cj4gPj4KPiA+PiArICAgICAgIC8qCj4g
Pj4gKyAgICAgICAgKiBjdXJyZW50IGV4dGVudCBtYXkgY3Jvc3MgYm91bmRhcnkgb2YgaW5xdWly
eSwgaW5jcmVhc2UgbGVuIHRvCj4gPj4gKyAgICAgICAgKiByZXF1ZXJ5Lgo+ID4+ICsgICAgICAg
ICovCj4gPj4gKyAgICAgICBpZiAoIWNvbXByX2NsdXN0ZXIgJiYgKG1hcC5tX2ZsYWdzICYgRjJG
U19NQVBfTUFQUEVEKSAmJgo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFw
Lm1fbGJsayArIG1hcC5tX2xlbiAtIDEgPT0gbGFzdF9ibGsgJiYKPiA+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJsa19sZW4gIT0gbWF4X2xlbikgewo+ID4+ICsgICAgICAgICAg
ICAgICBibGtfbGVuID0gbWF4X2xlbjsKPiA+PiArICAgICAgICAgICAgICAgZ290byBuZXh0Owo+
ID4+ICsgICAgICAgfQo+ID4+ICsKPiA+IGl0IHNlZW1zIGlmIHVzZXIgaW5wdXQgdGhlIGxlbmdo
dCB3aGljaCBpcyBsZXNzIHRoYW4gdGhlIGZpbGUgc2l6ZSwKPiA+IGJ1dCByZXR1cm4gdGhlIHdo
b2xlIGZpZW1hcD8KPiA+IHN1Y2ggYXM6Cj4gPiAgIGRkIGlmPS9kZXYvemVybyBvZj1maWxlIGJz
PTRrIGNvdW50PTUKPiA+ICAgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg0Igo+ID4g
d2lsbCBnZXQgZXh0ZW50IHdpdGggbGVuZ2h0ID0gMHg1MDAwPyBJcyB0aGlzIGV4cGVjdGVkPwo+
ID4gT3IgZGlkIEkgdW5kZXJzdGFuZCBpdCB3cm9uZz8KPgo+IEl0J3MgZmluZT8KPgo+IFF1b3Rl
ZCBmcm9tIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZmllbWFwLnJzdAo+Cj4gImZtX3N0YXJ0
LCBhbmQgZm1fbGVuZ3RoIHNwZWNpZnkgdGhlIGxvZ2ljYWwgcmFuZ2Ugd2l0aGluIHRoZSBmaWxl
Cj4gd2hpY2ggdGhlIHByb2Nlc3Mgd291bGQgbGlrZSBtYXBwaW5ncyBmb3IuIEV4dGVudHMgcmV0
dXJuZWQgbWlycm9yCj4gdGhvc2Ugb24gZGlzayAtIHRoYXQgaXMsIHRoZSBsb2dpY2FsIG9mZnNl
dCBvZiB0aGUgMXN0IHJldHVybmVkIGV4dGVudAo+IG1heSBzdGFydCBiZWZvcmUgZm1fc3RhcnQs
IGFuZCB0aGUgcmFuZ2UgY292ZXJlZCBieSB0aGUgbGFzdCByZXR1cm5lZAo+IGV4dGVudCBtYXkg
ZW5kIGFmdGVyIGZtX2xlbmd0aC4gQWxsIG9mZnNldHMgYW5kIGxlbmd0aHMgYXJlIGluIGJ5dGVz
LiIKPgo+IFF1b3RlZCBmcm9tIHJlcGx5IG9mIERhcnJpY2s6Cj4KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9mc3Rlc3RzLzIwMjEwMjI0MTY1MDU3LkdCNzI2OUBtYWdub2xpYS8KSGkgQ2hhbywK
Y2xlYXIsIGFuZCB2ZXJmeSB0aGFua3MgZm9yIHlvdSBraW5kbHkgZXhwbGFuYXRpb25zLgp0aGFu
a3MgYWdhaW4uCj4KPiBUaGFua3MsCj4KPiA+IHRoYW5rcyEKPiA+PiAgICAgICAgICBjb21wcl9h
cHBlbmRlZCA9IGZhbHNlOwo+ID4+ICAgICAgICAgIC8qIEluIGEgY2FzZSBvZiBjb21wcmVzc2Vk
IGNsdXN0ZXIsIGFwcGVuZCB0aGlzIHRvIHRoZSBsYXN0IGV4dGVudCAqLwo+ID4+ICAgICAgICAg
IGlmIChjb21wcl9jbHVzdGVyICYmICgobWFwLm1fZmxhZ3MgJiBGMkZTX01BUF9ERUxBTExPQykg
fHwKPiA+PiAtLQo+ID4+IDIuNDAuMQo+ID4+Cj4gPj4+IHRoYW5rcyEKPiA+Pj4+Cj4gPj4+PiBU
aGFua3MsCj4gPj4+Pgo+ID4+Pj4+IHN1Y2ggYXMgdGhpcyBzcGVjaWFsIGNhc2UgInhmc19pbyBm
aWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIgd2UgZGlzY3Vzc2VkLgo+ID4+Pj4+IGJ1dCBpdCBp
cyBmaW5lIGZvciBtZSB0byBrZWVwIHRoZSBjdXJyZW50IGNvZGVzLgo+ID4+Pj4+IHRoYW5rcyEK
PiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhvdWdodHM/Cj4gPj4+Pj4+Cj4gPj4+Pj4+IFRoYW5rcywKPiA+
Pj4+Pj4KPiA+Pj4+Pj4+IGJlZm9yZToKPiA+Pj4+Pj4+IHN0YXJ0X2JsayA9IGJ5dGVzX3RvX2Js
a3MoaW5vZGUsIHN0YXJ0KTsKPiA+Pj4+Pj4+IGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgc3RhcnQgKyBsZW4gLSAxKTsKPiA+Pj4+Pj4+IGFmdGVyOgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+
IHN0YXJ0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPiA+Pj4+Pj4+IGxhc3Rf
YmxrID0gc3RhcnRfYmxrICsgYnl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuIC0gMSk7Cj4gPj4+Pj4+
PiB0aGFua3MhCj4gPj4+Pj4+Pj4gICAgICAgbmV4dDoKPiA+Pj4+Pj4+PiAgICAgICAgICAgICBt
ZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIG1hcC5t
X2xibGsgPSBzdGFydF9ibGs7Cj4gPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
ZjJmc19mcy5oIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiA+Pj4+Pj4+PiBpbmRleCBiMGI4
MjFlZGZkOTcuLjk1NGU4ZTgzNDRiNyAxMDA2NDQKPiA+Pj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2YyZnNfZnMuaAo+ID4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4g
Pj4+Pj4+Pj4gQEAgLTI0LDEwICsyNCwxMSBAQAo+ID4+Pj4+Pj4+ICAgICAgICNkZWZpbmUgTkVX
X0FERFIgICAgICAgICAgICAgICgoYmxvY2tfdCktMSkgICAvKiB1c2VkIGFzIGJsb2NrX3QgYWRk
cmVzc2VzICovCj4gPj4+Pj4+Pj4gICAgICAgI2RlZmluZSBDT01QUkVTU19BRERSICAgICAgICAg
KChibG9ja190KS0yKSAgIC8qIHVzZWQgYXMgY29tcHJlc3NlZCBkYXRhIGZsYWcgKi8KPiA+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+ICsjZGVmaW5lIEYyRlNfQkxLU0laRV9NQVNLICAgICAgICAgICAgICAo
RjJGU19CTEtTSVpFIC0gMSkKPiA+Pj4+Pj4+PiAgICAgICAjZGVmaW5lIEYyRlNfQllURVNfVE9f
QkxLKGJ5dGVzKSAgICAgICgoYnl0ZXMpID4+IEYyRlNfQkxLU0laRV9CSVRTKQo+ID4+Pj4+Pj4+
ICAgICAgICNkZWZpbmUgRjJGU19CTEtfVE9fQllURVMoYmxrKSAgICAgICAgICAgICAgICAoKGJs
aykgPDwgRjJGU19CTEtTSVpFX0JJVFMpCj4gPj4+Pj4+Pj4gICAgICAgI2RlZmluZSBGMkZTX0JM
S19FTkRfQllURVMoYmxrKSAgICAgICAgICAgICAgIChGMkZTX0JMS19UT19CWVRFUyhibGsgKyAx
KSAtIDEpCj4gPj4+Pj4+Pj4gLSNkZWZpbmUgRjJGU19CTEtfQUxJR04oeCkgICAgICAgICAgICAg
ICAgICAgICAgKEYyRlNfQllURVNfVE9fQkxLKCh4KSArIEYyRlNfQkxLU0laRSAtIDEpKQo+ID4+
Pj4+Pj4+ICsjZGVmaW5lIEYyRlNfQkxLX0FMSUdOKHgpICAgICAgICAgICAgICAoRjJGU19CWVRF
U19UT19CTEsoKHgpICsgRjJGU19CTEtTSVpFIC0gMSkpCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiAg
ICAgICAvKiAwLCAxKG5vZGUgbmlkKSwgMihtZXRhIG5pZCkgYXJlIHJlc2VydmVkIG5vZGUgaWQg
Ki8KPiA+Pj4+Pj4+PiAgICAgICAjZGVmaW5lIEYyRlNfUkVTRVJWRURfTk9ERV9OVU0gICAgICAg
ICAgICAgICAgMwo+ID4+Pj4+Pj4+IC0tCj4gPj4+Pj4+Pj4gMi40MC4xCj4gPj4+Pj4+Pj4KPiA+
Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IFRoYW5rcwo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+
Pj4+Pj4+IFRoYW5rcywKPiA+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4gYnV0IG92ZXJhbGwgbGFz
dF9ibGsgd2lsbCBjaGFuZ2UgbG9vcCBjb3VudHMgYnV0IGhhcyBub3QgYWZmZWN0IG9uIHRoZSBy
ZXN1bHRzLgo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+PiBTaG91bGQgd2Ugcm91bmRfdXAg
bGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxrIGNhbGN1bGF0aW9uPwo+ID4+Pj4+Pj4+Pj4+
IEkgdGhpbmtzIGl0IGlzIG9rICxidXQganVzdCBhIGxpdHRsZSBiaXQgcmVkdW5kYW50IHdpdGgg
dGhlIGZvbGxvd2luZwo+ID4+Pj4+Pj4+Pj4+IGhhbmRsaW5nIGFib3V0IGxlbi4KPiA+Pj4+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+Pj4+IGlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4g
Pj4+Pj4+Pj4+Pj4gICAgICAgICAgbGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4gPj4+
Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+PiBCYXNlZCBvbiB0aGUgYWJvdmUgc2l0dWF0aW9uLAo+ID4+
Pj4+Pj4+Pj4+IGRvIHlvdSBoYXZlIGFueSBvdGhlciBnb29kIHN1Z2dlc3Rpb25zPyBeXgo+ID4+
Pj4+Pj4+Pj4+IHRoYW5rcyEKPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+
Pj4+PiBUaGFua3MsCj4gPj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+PiB0aGFua3PvvIEKPiA+
Pj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4+IFRoYW5rcywKPiA+Pj4+Pj4+Pj4+Pj4+Pgo+
ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pgo+ID4+Pj4KPiA+
Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
