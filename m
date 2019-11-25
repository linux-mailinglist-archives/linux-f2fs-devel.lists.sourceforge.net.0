Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC991093E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 20:03:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZJe3-00069Q-1y; Mon, 25 Nov 2019 19:03:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <javier@javigon.com>) id 1iZJe1-00069F-6j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 19:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UlOSumQoWcAQJdorsUTG6xjcAVup8thJTbtcARuUmQ0=; b=hpTBC7jI1jliJFoWtsuFz+puad
 9Sl29szNY3w0TuwYSVPNe9+AZ8iEa9ncdKrzRpKH5C7iHvKJqzXMFUdyPbmRT4xslgdKpNqexVndz
 ZmAV7GcXSpFgiUMf5/FEzsLGWZtxC0UFuBDOVPSejT5rkCR2PXH14m2LxK68DEq60Rk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UlOSumQoWcAQJdorsUTG6xjcAVup8thJTbtcARuUmQ0=; b=TbvApGp0RVDysotX28IL1Mmz+8
 I/a6A3/evYRsjcKDXJKAtOfTNSayvpJqn951NWSGzEHCezFU4LhrsRLJiuX1ZJLb9WTc2ySEYwdIJ
 5qrrsjuM/O6kzokjNVcBxQQqYevNUHOJswbbfp2Nv090VDswyQ3pxdfH0bOP1BGRonUg=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iZJdw-00DQ1H-KU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 19:03:33 +0000
Received: by mail-wm1-f68.google.com with SMTP id l1so491607wme.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2019 11:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=javigon-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UlOSumQoWcAQJdorsUTG6xjcAVup8thJTbtcARuUmQ0=;
 b=Kw1EBbZmGCF99Iu6qPidBTYZP+Ln6f2Ho//8LK77WLDZ85N/c5klSWbVf8ttN3TWMn
 7y/TCA4Y6SjE4J4/s65Lr7hi5fznaPguKzjX09nqADZgd5APuHBQCPPMH5Khx+cZnJ1z
 PAh17CgDZtAUMEI3dMMHpdl7hm/9+xXzw3/UNZHW90Qp6L8+EgI3IkneU7bU5CXbHZQA
 xzesmvPVgYDlMTuKzb7oNbFMzgTOysaJh1mCSG1O8wDyPtBYVmO4qA4/Ooa2+U5UYaZu
 KeYoDpYOW7lROFEGZHeNdzYlxIoRLe4b71jbyEdVQZoyj1LstcqR22PEoi5Q3NBe4uCn
 5s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UlOSumQoWcAQJdorsUTG6xjcAVup8thJTbtcARuUmQ0=;
 b=aWbm2qWhpsqEQg2pQNGrKVnupfUo4cK41uF1gd28l/U38lVT8AW8NarCQVwoYXg8DV
 KVgiTQU7UfbUaKf381UuS6PhxG464wiy15k/vF3a4TqkkGMfIcLFOP2qiCH3+3FxdXc4
 oSU6iAzaG0udDxREB1Utd5CGWzm2DxZ2ZEY2j/LoUPeS7dlEjxCg4kytgpQKUn+/9Bbz
 RHpC1T9NwnjvLlMiUITLiw2sjyv4GOsa95qbM9kdREPTh7mQon84xdkiL+bWIxJU9oAj
 PUeBEMgNVVw+vqcZQvlBma5wPsMfBS5OEGb+ucHit1VIQgqvy28TbtDdwZ0SNBCM4I0d
 YDPA==
X-Gm-Message-State: APjAAAU5OMo+k7QKA1ny9e5x6TU9zG/QrklolnSB0Bip+bh34vBHHqxN
 9og2ATqkmx6VRo89xqh+l+ebjg==
X-Google-Smtp-Source: APXvYqx+dqlHxFDmhdz8og05bzChcXZSp0TX/OuqzavhcN+IGKg3ikpoKuUi8YKS6OABtPRILb6StQ==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr296821wma.119.1574708602018;
 Mon, 25 Nov 2019 11:03:22 -0800 (PST)
Received: from localhost (ip-5-186-122-168.cgn.fibianet.dk. [5.186.122.168])
 by smtp.gmail.com with ESMTPSA id 4sm242188wmd.33.2019.11.25.11.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 11:03:21 -0800 (PST)
Date: Mon, 25 Nov 2019 20:03:20 +0100
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20191125190320.g7beal27nc5ubju7@mpHalley>
References: <20191122085952.12754-1-javier@javigon.com>
 <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iZJdw-00DQ1H-KU
Subject: Re: [f2fs-dev] [PATCH] f2fs: disble physical prealloc in LSF mount
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Javier =?utf-8?B?R29uesOhbGV6?= <javier.gonz@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjUuMTEuMjAxOSAwMDo0OCwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj5PbiAyMDE5LzExLzIy
IDE4OjAwLCBKYXZpZXIgR29uesOhbGV6IHdyb3RlOgo+PiBGcm9tOiBKYXZpZXIgR29uesOhbGV6
IDxqYXZpZXIuZ29uekBzYW1zdW5nLmNvbT4KPj4KPj4gRml4IGZpbGUgc3lzdGVtIGNvcnJ1cHRp
b24gd2hlbiB1c2luZyBMRlMgbW91bnQgKGUuZy4sIGluIHpvbmVkCj4+IGRldmljZXMpLiBTZWVt
cyBsaWtlIHRoZSBmYWxsYmFjayBpbnRvIGJ1ZmZlcmVkIEkvTyBjcmVhdGVzIGFuCj4+IGluY29u
c2lzdGVuY3kgaWYgdGhlIGFwcGxpY2F0aW9uIGlzIGFzc3VtaW5nIGJvdGggcmVhZCBhbmQgd3Jp
dGUgRElPLiBJCj4+IGNhbiBlYXNpbHkgcmVwcm9kdWNlIGEgY29ycnVwdGlvbiB3aXRoIGEgc2lt
cGxlIFJvY2tzREIgdGVzdC4KPj4KPj4gTWlnaHQgYmUgdGhhdCB0aGUgZjJmc19mb3JjZWRfYnVm
ZmVyZWRfaW8gcGF0aCBicmluZ3Mgc29tZSBwcm9ibGVtcyB0b28sCj4+IGJ1dCBJIGhhdmUgbm90
IHNlZW4gb3RoZXIgZmFpbHVyZXMgYmVzaWRlcyB0aGlzIG9uZS4KPj4KPj4gUHJvYmxlbSByZXBy
b2R1Y2libGUgd2l0aG91dCBhIHpvbmVkIGJsb2NrIGRldmljZSwgc2ltcGx5IGJ5IGZvcmNpbmcK
Pj4gTEZTIG1vdW50Ogo+Pgo+PiAgICQgc3VkbyBta2ZzLmYyZnMgLWYgLW0gL2Rldi9udm1lMG4x
Cj4+ICAgJCBzdWRvIG1vdW50IC9kZXYvbnZtZTBuMSAvbW50L2YyZnMKPj4gICAkIHN1ZG8gIC9v
cHQvcm9ja3NkYi9kYl9iZW5jaCAgLS1iZW5jaG1hcmtzPWZpbGxzZXEgLS11c2VfZXhpc3Rpbmdf
ZGI9MAo+PiAgIC0tdXNlX2RpcmVjdF9yZWFkcz10cnVlIC0tdXNlX2RpcmVjdF9pb19mb3JfZmx1
c2hfYW5kX2NvbXBhY3Rpb249dHJ1ZQo+PiAgIC0tZGI9L21udC9mMmZzIC0tbnVtPTUwMDAgLS12
YWx1ZV9zaXplPTEwNDg1NzYgLS12ZXJpZnlfY2hlY2tzdW09MQo+PiAgIC0tYmxvY2tfc2l6ZT02
NTUzNgo+Pgo+PiBOb3RlIHRoYXQgdGhlIG9wdGlvbnMgdGhhdCBjYXVzZSB0aGUgcHJvYmxlbSBh
cmU6Cj4+ICAgLS11c2VfZGlyZWN0X3JlYWRzPXRydWUgLS11c2VfZGlyZWN0X2lvX2Zvcl9mbHVz
aF9hbmRfY29tcGFjdGlvbj10cnVlCj4+Cj4+IEZpeGVzOiBmOWQ2ZDA1OTc2OTggKCJmMmZzOiBm
aXggb3V0LXBsYWNlLXVwZGF0ZSBESU8gd3JpdGUiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYXZp
ZXIgR29uesOhbGV6IDxqYXZpZXIuZ29uekBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBmcy9mMmZz
L2RhdGEuYyB8IDMgLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5kZXggNTc1
NWU4OTdhNWYwLi5iMDQ1ZGQ2YWI2MzIgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+
ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0xMDgxLDkgKzEwODEsNiBAQCBpbnQgZjJmc19w
cmVhbGxvY2F0ZV9ibG9ja3Moc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZy
b20pCj4+ICAJCQlyZXR1cm4gZXJyOwo+PiAgCX0KPj4KPj4gLQlpZiAoZGlyZWN0X2lvICYmIGFs
bG93X291dHBsYWNlX2Rpbyhpbm9kZSwgaW9jYiwgZnJvbSkpCj4+IC0JCXJldHVybiAwOwo+Cj5T
aW5jZSBmb3IgTEZTIG1vZGUsIGFsbCBESU9zIGNhbiBlbmQgdXAgb3V0IG9mIHBsYWNlLCBJIHRo
aW5rIHRoYXQgaXQKPm1heSBiZSBiZXR0ZXIgdG8gY2hhbmdlIGFsbG93X291dHBsYWNlX2Rpbygp
IHRvIGFsd2F5cyByZXR1cm4gdHJ1ZSBpbgo+dGhlIGNhc2Ugb2YgTEZTIG1vZGUuIFNvIG1heSBi
ZSBzb21ldGhpbmcgbGlrZToKPgo+c3RhdGljIGlubGluZSBpbnQgYWxsb3dfb3V0cGxhY2VfZGlv
KHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4JCQlzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3Zf
aXRlciAqaXRlcikKPnsKPglzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5v
ZGUpOwo+CWludCBydyA9IGlvdl9pdGVyX3J3KGl0ZXIpOwo+Cj4JcmV0dXJuIHRlc3Rfb3B0KHNi
aSwgTEZTKSB8fAo+CSAJKHJ3ID09IFdSSVRFICYmICFibG9ja191bmFsaWduZWRfSU8oaW5vZGUs
IGlvY2IsIGl0ZXIpKTsKPn0KPgo+aW5zdGVhZCBvZiB0aGUgb3JpZ2luYWw6Cj4KPnN0YXRpYyBp
bmxpbmUgaW50IGFsbG93X291dHBsYWNlX2RpbyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+CQkJc3Ry
dWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIpCj57Cj4Jc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPglpbnQgcncgPSBpb3ZfaXRlcl9ydyhp
dGVyKTsKPgo+CXJldHVybiAodGVzdF9vcHQoc2JpLCBMRlMpICYmIChydyA9PSBXUklURSkgJiYK
PgkJCQkhYmxvY2tfdW5hbGlnbmVkX0lPKGlub2RlLCBpb2NiLCBpdGVyKSk7Cj59Cj4KPlRob3Vn
aHRzID8KPgoKSSBzZWUgd2hhdCB5b3UgbWVhbiBhbmQgaXQgbWFrZXMgc2Vuc2UuIEhvd2V2ZXIs
IHRoZSBwcm9ibGVtIEkgYW0gc2VlaW5nCm9jY3VycyB3aGVuIGFsbG93X291dHBsYWNlX2Rpbygp
IHJldHVybnMgdHJ1ZSwgYXMgdGhpcyBpcyB3aGF0IGNyZWF0ZXMKdGhlIGluY29uc2lzdGVuY3kg
YmV0d2VlbiB0aGUgd3JpdGUgYmVpbmcgYnVmZmVyZWQgYW5kIHRoZSByZWFkIGJlaW5nCkRJTy4K
CkkgZGlkIHRlc3QgdGhlIGNvZGUgeW91IHByb3Bvc2UgYW5kLCBhcyBleHBlY3RlZCwgaXQgc3Rp
bGwgdHJpZ2dlcmVkIHRoZQpjb3JydXB0aW9uLgoKPj4gLQo+PiAgCWlmIChpc19pbm9kZV9mbGFn
X3NldChpbm9kZSwgRklfTk9fUFJFQUxMT0MpKQo+PiAgCQlyZXR1cm4gMDsKPj4KPj4KPgo+Cj4t
LSAKPkRhbWllbiBMZSBNb2FsCj5XZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gKClRoYW5rcywKSmF2
aWVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
