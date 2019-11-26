Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB891109856
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 05:28:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZSSU-0005xO-LX; Tue, 26 Nov 2019 04:28:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <javier@javigon.com>) id 1iZSSS-0005x5-Nz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 04:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e6wMTLKnA+rNgtD/pp0DryO/NWlpo8/d9a9UXsGOjg4=; b=EjMsmmyoMVZ3FB6+IWzeqDcxLl
 Ce7AgybjoJp8vBL7NJENGBsV6NbmRPs8cl+QS4HLD3nfi97ERvj+i5rPwQwRB+eO6oaHkXMWzeEwp
 juR/xU1/f9vAv+Pv1WocEK52E84/XWJF5PDawKKL1PiiOMN78hHaIZoSTXCb18eGqxeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e6wMTLKnA+rNgtD/pp0DryO/NWlpo8/d9a9UXsGOjg4=; b=juENiZUkgMDbyMl7WAbWfVKKri
 0f0ACGKRh5VOoUfwrFnwWbYEMOmelYLwGAo2MLH1oZYHD0jeugnfUDkaezVEylYTVHVlDMkxjPceT
 WwruVpBvmem3qDW1OLaaJoRDrjLKZuBDw3uLjvYXs+8UgcwFwLxs8rG2gdJ8BR0298Sg=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iZSSL-005fNG-MN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 04:28:12 +0000
Received: by mail-wr1-f68.google.com with SMTP id t2so20752242wrr.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2019 20:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=javigon-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=e6wMTLKnA+rNgtD/pp0DryO/NWlpo8/d9a9UXsGOjg4=;
 b=N8k7cFOPVjqX2XGPDgw9O2rte/reF7R/56Ns6wnvp9fJxDVw6Rid+J5wO21USAz+sY
 0l9Ooms+vC9v+fUkgp1wqReUarFaRo3iZoUVbKbdCDB13AmDoSjv2GPie8BDbFmn1JeQ
 70Iwob9y2qCHHmsaVBbRuDvXcGrYr7Xu6UVbFiJApu7HaredvFmVZqNqwWwG2ondOUbE
 kI6M+vS4q6wTwemZSa5XlLZ6cP8zUJ6tc/NpB2q7T+c2csy6ZJgSsVA6tJgCJwcoOSvN
 sK3I3AM3FzWg1lucCP2+ST88HvJQ4C5TuKoC7xgY2pL0+GJdAn9fVRQ8M+T/+gmhuMHj
 Jshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e6wMTLKnA+rNgtD/pp0DryO/NWlpo8/d9a9UXsGOjg4=;
 b=bH+uI5DBYCGCIha2BKxulh9I45Hl5Xr6robUkyWpNJcqgjXG2txAUNyANdMMjRd3WP
 88kFjz3/7U7l70+PanrWHnTqaQk6+AzgPiPwqc78w/F1nvfIkHLSz+K5UtuGiD4cxpNF
 zh5ttLyxxPUWgd+hVXO4FC14u+GlxxMQy6zHGzk60yO0ehgB0dORNmhCtEYBLuNDiagT
 EKPBHtHPd3Or3DIPFShXEa1DeojfAeeZ4O0p6JmDH34IWEMrWcUsGAXsRqlpDrJp4JPF
 tDs8KSsF74O0VZdzSqnrwD6VWexabmer7+e3H9q7SDNAaR+1BmubMnICv3kDSclkr8mB
 MTyQ==
X-Gm-Message-State: APjAAAXUGDa2QUKhO4Lb8qLg6F3nkINfRnQQvJDXvT8wKbnrYQPiqu6l
 V/3lwThqi7H0i8RmgimTD24hl0a794F/dg==
X-Google-Smtp-Source: APXvYqx8y0/DoRJm7r1OiRmXfLs8gAGQIP6xyIigtQCt+q1MQA8F3r10IyeiIVwkBhNuVe6P6GeZjA==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr29786781wrp.82.1574740648040; 
 Mon, 25 Nov 2019 19:57:28 -0800 (PST)
Received: from localhost (ip-5-186-122-168.cgn.fibianet.dk. [5.186.122.168])
 by smtp.gmail.com with ESMTPSA id p25sm1470345wma.20.2019.11.25.19.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 19:57:27 -0800 (PST)
Date: Tue, 26 Nov 2019 04:57:26 +0100
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20191126035726.xj7pierxsck6adow@mpHalley>
References: <20191122085952.12754-1-javier@javigon.com>
 <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191125190320.g7beal27nc5ubju7@mpHalley>
 <BYAPR04MB58161C14246FA30366B69B9DE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR04MB58161C14246FA30366B69B9DE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iZSSL-005fNG-MN
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

T24gMjYuMTEuMjAxOSAwMjowNiwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj5PbiAyMDE5LzExLzI2
IDQ6MDMsIEphdmllciBHb256w6FsZXogd3JvdGU6Cj4+IE9uIDI1LjExLjIwMTkgMDA6NDgsIERh
bWllbiBMZSBNb2FsIHdyb3RlOgo+Pj4gT24gMjAxOS8xMS8yMiAxODowMCwgSmF2aWVyIEdvbnrD
oWxleiB3cm90ZToKPj4+PiBGcm9tOiBKYXZpZXIgR29uesOhbGV6IDxqYXZpZXIuZ29uekBzYW1z
dW5nLmNvbT4KPj4+Pgo+Pj4+IEZpeCBmaWxlIHN5c3RlbSBjb3JydXB0aW9uIHdoZW4gdXNpbmcg
TEZTIG1vdW50IChlLmcuLCBpbiB6b25lZAo+Pj4+IGRldmljZXMpLiBTZWVtcyBsaWtlIHRoZSBm
YWxsYmFjayBpbnRvIGJ1ZmZlcmVkIEkvTyBjcmVhdGVzIGFuCj4+Pj4gaW5jb25zaXN0ZW5jeSBp
ZiB0aGUgYXBwbGljYXRpb24gaXMgYXNzdW1pbmcgYm90aCByZWFkIGFuZCB3cml0ZSBESU8uIEkK
Pj4+PiBjYW4gZWFzaWx5IHJlcHJvZHVjZSBhIGNvcnJ1cHRpb24gd2l0aCBhIHNpbXBsZSBSb2Nr
c0RCIHRlc3QuCj4+Pj4KPj4+PiBNaWdodCBiZSB0aGF0IHRoZSBmMmZzX2ZvcmNlZF9idWZmZXJl
ZF9pbyBwYXRoIGJyaW5ncyBzb21lIHByb2JsZW1zIHRvbywKPj4+PiBidXQgSSBoYXZlIG5vdCBz
ZWVuIG90aGVyIGZhaWx1cmVzIGJlc2lkZXMgdGhpcyBvbmUuCj4+Pj4KPj4+PiBQcm9ibGVtIHJl
cHJvZHVjaWJsZSB3aXRob3V0IGEgem9uZWQgYmxvY2sgZGV2aWNlLCBzaW1wbHkgYnkgZm9yY2lu
Zwo+Pj4+IExGUyBtb3VudDoKPj4+Pgo+Pj4+ICAgJCBzdWRvIG1rZnMuZjJmcyAtZiAtbSAvZGV2
L252bWUwbjEKPj4+PiAgICQgc3VkbyBtb3VudCAvZGV2L252bWUwbjEgL21udC9mMmZzCj4+Pj4g
ICAkIHN1ZG8gIC9vcHQvcm9ja3NkYi9kYl9iZW5jaCAgLS1iZW5jaG1hcmtzPWZpbGxzZXEgLS11
c2VfZXhpc3RpbmdfZGI9MAo+Pj4+ICAgLS11c2VfZGlyZWN0X3JlYWRzPXRydWUgLS11c2VfZGly
ZWN0X2lvX2Zvcl9mbHVzaF9hbmRfY29tcGFjdGlvbj10cnVlCj4+Pj4gICAtLWRiPS9tbnQvZjJm
cyAtLW51bT01MDAwIC0tdmFsdWVfc2l6ZT0xMDQ4NTc2IC0tdmVyaWZ5X2NoZWNrc3VtPTEKPj4+
PiAgIC0tYmxvY2tfc2l6ZT02NTUzNgo+Pj4+Cj4+Pj4gTm90ZSB0aGF0IHRoZSBvcHRpb25zIHRo
YXQgY2F1c2UgdGhlIHByb2JsZW0gYXJlOgo+Pj4+ICAgLS11c2VfZGlyZWN0X3JlYWRzPXRydWUg
LS11c2VfZGlyZWN0X2lvX2Zvcl9mbHVzaF9hbmRfY29tcGFjdGlvbj10cnVlCj4+Pj4KPj4+PiBG
aXhlczogZjlkNmQwNTk3Njk4ICgiZjJmczogZml4IG91dC1wbGFjZS11cGRhdGUgRElPIHdyaXRl
IikKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBHb256w6FsZXogPGphdmllci5nb256
QHNhbXN1bmcuY29tPgo+Pj4+IC0tLQo+Pj4+ICBmcy9mMmZzL2RhdGEuYyB8IDMgLS0tCj4+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+PiBpbmRleCA1NzU1ZTg5N2E1ZjAuLmIw
NDVkZDZhYjYzMiAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+ICsrKyBiL2Zz
L2YyZnMvZGF0YS5jCj4+Pj4gQEAgLTEwODEsOSArMTA4MSw2IEBAIGludCBmMmZzX3ByZWFsbG9j
YXRlX2Jsb2NrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPj4+
PiAgCQkJcmV0dXJuIGVycjsKPj4+PiAgCX0KPj4+Pgo+Pj4+IC0JaWYgKGRpcmVjdF9pbyAmJiBh
bGxvd19vdXRwbGFjZV9kaW8oaW5vZGUsIGlvY2IsIGZyb20pKQo+Pj4+IC0JCXJldHVybiAwOwo+
Pj4KPj4+IFNpbmNlIGZvciBMRlMgbW9kZSwgYWxsIERJT3MgY2FuIGVuZCB1cCBvdXQgb2YgcGxh
Y2UsIEkgdGhpbmsgdGhhdCBpdAo+Pj4gbWF5IGJlIGJldHRlciB0byBjaGFuZ2UgYWxsb3dfb3V0
cGxhY2VfZGlvKCkgdG8gYWx3YXlzIHJldHVybiB0cnVlIGluCj4+PiB0aGUgY2FzZSBvZiBMRlMg
bW9kZS4gU28gbWF5IGJlIHNvbWV0aGluZyBsaWtlOgo+Pj4KPj4+IHN0YXRpYyBpbmxpbmUgaW50
IGFsbG93X291dHBsYWNlX2RpbyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4gCQkJc3RydWN0IGtp
b2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIpCj4+PiB7Cj4+PiAJc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPj4+IAlpbnQgcncgPSBpb3ZfaXRlcl9y
dyhpdGVyKTsKPj4+Cj4+PiAJcmV0dXJuIHRlc3Rfb3B0KHNiaSwgTEZTKSB8fAo+Pj4gCSAJKHJ3
ID09IFdSSVRFICYmICFibG9ja191bmFsaWduZWRfSU8oaW5vZGUsIGlvY2IsIGl0ZXIpKTsKPj4+
IH0KPj4+Cj4+PiBpbnN0ZWFkIG9mIHRoZSBvcmlnaW5hbDoKPj4+Cj4+PiBzdGF0aWMgaW5saW5l
IGludCBhbGxvd19vdXRwbGFjZV9kaW8oc3RydWN0IGlub2RlICppbm9kZSwKPj4+IAkJCXN0cnVj
dCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyKQo+Pj4gewo+Pj4gCXN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+PiAJaW50IHJ3ID0gaW92X2l0
ZXJfcncoaXRlcik7Cj4+Pgo+Pj4gCXJldHVybiAodGVzdF9vcHQoc2JpLCBMRlMpICYmIChydyA9
PSBXUklURSkgJiYKPj4+IAkJCQkhYmxvY2tfdW5hbGlnbmVkX0lPKGlub2RlLCBpb2NiLCBpdGVy
KSk7Cj4+PiB9Cj4+Pgo+Pj4gVGhvdWdodHMgPwo+Pj4KPj4KPj4gSSBzZWUgd2hhdCB5b3UgbWVh
biBhbmQgaXQgbWFrZXMgc2Vuc2UuIEhvd2V2ZXIsIHRoZSBwcm9ibGVtIEkgYW0gc2VlaW5nCj4+
IG9jY3VycyB3aGVuIGFsbG93X291dHBsYWNlX2RpbygpIHJldHVybnMgdHJ1ZSwgYXMgdGhpcyBp
cyB3aGF0IGNyZWF0ZXMKPj4gdGhlIGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgd3JpdGUgYmVp
bmcgYnVmZmVyZWQgYW5kIHRoZSByZWFkIGJlaW5nCj4+IERJTy4KPgo+QnV0IGlmIHRoZSB3cml0
ZSBpcyBzd2l0Y2hlZCB0byBidWZmZXJlZCwgdGhlIERJTyByZWFkIHNob3VsZCB1c2UgdGhlCj5i
dWZmZXJlZCBwYXRoIHRvbywgbm8gPyBTaW5jZSB0aGlzIGlzIGFsbCBoYXBwZW5pbmcgdW5kZXIg
VkZTLCB0aGUKPmdlbmVyaWMgRElPIHJlYWQgcGF0aCB3aWxsIG5vdCBlbnN1cmUgdGhhdCB0aGUg
YnVmZmVyZWQgd3JpdGVzIGFyZQo+Zmx1c2hlZCB0byBkaXNrIGJlZm9yZSBpc3N1aW5nIHRoZSBk
aXJlY3QgcmVhZCwgSSB0aGluay4gU28gdGhhdCB3b3VsZAo+ZXhwbGFpbiB5b3VyIGRhdGEgY29y
cnVwdGlvbiwgaS5lLiB5b3UgYXJlIHJlYWRpbmcgc3RhbGUgZGF0YSBvbiB0aGUKPmRldmljZSBi
ZWZvcmUgdGhlIGJ1ZmZlcmVkIHdyaXRlcyBtYWtlIGl0IHRvIHRoZSBtZWRpYS4KPgoKQXMgZmFy
IGFzIEkgY2FuIHNlZSwgdGhlIHJlYWQgaXMgYWx3YXlzIHNlbnQgRElPLCBzbyB5ZXMsIEkgYWxz
byBiZWxpZXZlCnRoYXQgd2UgYXJlIHJlYWRpbmcgc3RhbGUgZGF0YS4gVGhpcyBpcyB3aHkgdGhl
IGNvcnJ1cHRpb24gaXMgbm90IHNlZW4KaWYgcHJldmVudGluZyBhbGxvd19vdXRwbGFjZV9kaW8o
KSBmcm9tIHNlbmRpbmcgdGhlIHdyaXRlIHRvIHRoZQpidWZmZXJlZCBwYXRoLgoKV2hhdCBzdXJw
cmlzZXMgbWUgaXMgdGhhdCB0aGlzIGlzIHZlcnkgZWFzeSB0byB0cmlnZ2VyIChzZWUgY29tbWl0
KSwgc28KSSBhc3N1bWUgeW91IG11c3QgaGF2ZSBzZWVuIHRoaXMgd2l0aCBTTVIgaW4gdGhlIHBh
c3QuCgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gbGVhdmUgdGhlIExGUyBjaGVjayBvdXQgb2YgdGhl
CmFsbG93X291dHBsYWNlX2RpbygpPyBPciBpbiBvdGhlciB3b3JkcywgaXMgdGhlcmUgYSBoYXJk
IHJlcXVpcmVtZW50IGZvcgp3cml0ZXMgdG8gdGFrZSB0aGlzIHBhdGggb24gYSB6b25lZCBkZXZp
Y2UgdGhhdCBJIGFtIG5vdCBzZWVpbmc/ClNvbWV0aGluZyBsaWtlOgoKICAgc3RhdGljIGlubGlu
ZSBpbnQgYWxsb3dfb3V0cGxhY2VfZGlvKHN0cnVjdCBpbm9kZSAqaW5vZGUsCiAgIAkJCXN0cnVj
dCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyKQogICB7CiAgIAlzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwogICAJaW50IHJ3ID0gaW92X2l0ZXJf
cncoaXRlcik7CgogICAJcmV0dXJuIChydyA9PSBXUklURSAmJiAhYmxvY2tfdW5hbGlnbmVkX0lP
KGlub2RlLCBpb2NiLCBpdGVyKSk7CiAgIH0KClRoYW5rcywKSmF2aWVyCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
