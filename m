Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A0109956
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 07:43:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZUZL-0008Lc-6v; Tue, 26 Nov 2019 06:43:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <javier@javigon.com>) id 1iZUZK-0008LQ-9e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 06:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ETIUHJ3AzvG4MKmyof7txYs57MBd5qafDNDNbagrVYo=; b=L24f1b6I6CSNt22BKCe1brm8Ko
 nLVRF8zbDdW99HTd8o5qDLHNubQ0BhsAHnQiyXBxuxNWL7DzB+s63fMRvog5gwFukZntfhwvMU5fq
 oDyRsOTj3t3Tnrt3IpsMsHj7tlj768WonvRRW2VmlCdFP026ZVPmzQhhMERk3d7ULK7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ETIUHJ3AzvG4MKmyof7txYs57MBd5qafDNDNbagrVYo=; b=h1yvG3EXGW7Lc3zHonBrhf3lCa
 +VNTW77b3YJ+pXX5cO8JeCsz6B4r0yoy2YjgS23lsj6tJJGVZw9q1xalsAMrm5UJAoY5hZs6PUrSA
 J8pCMRH2A0i0w7Tca7yWdWii5QXVkrPkSD+jLk6MGAuWprmvwIa054D5OsdZNBUWlf7w=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iZUZI-00DjGp-IU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 06:43:26 +0000
Received: by mail-wm1-f66.google.com with SMTP id b11so1847751wmb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2019 22:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=javigon-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ETIUHJ3AzvG4MKmyof7txYs57MBd5qafDNDNbagrVYo=;
 b=dX4Rvw0zMtqYThfHdUPz31/4100BIND9a4FPEmcE1DdsM/Bw9snYmkdu6kGFMeaooB
 4LUn+RA5g0N/Ja4DRzXrpQawFoSGE5/tU6WH5A5aSWrgNAkx++6pQNDS21JUUFLH9twS
 WntUKQKv/HabwTmvMpjIDJ6eNDpgbILdz9TmTLKB9i15G3PgwVOUc8gPVLr1iVRcL0MP
 vXnUtUxyufSJuaW9dVSPtZuiDelOZTBLtjPGKQKHTvUFndoRY5LxhmnAXUZr3/OBL1Jx
 tJAzoPg3QVVTR8FDMhXk+0rRwi2TYxFC3g6gXCD3Gtvqp/QHDND9cW/DhAwEwfDBhaYK
 ukUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ETIUHJ3AzvG4MKmyof7txYs57MBd5qafDNDNbagrVYo=;
 b=T18OsWAUwKdZ9YjvPiC7NU2cZ+BK03KXNkqPWUvH5bxd2NjRAKxsKoXecxLNgpaqze
 hZl5E9IIHbJcGgSIsaYGdE603n3fWshvwt/Zb4+ZsOs/sUGnlciAu+23dV8VEY9H5F7a
 PXi/EoTchJqp/fxDfwLzXcJabr/UIen2nnHPPiqP/22he/utlK4iyGtrBrcfHBOCr++h
 b57CjV1NP2AECxLsFJhxqSWCDTm/IngcODRBBpiE90pWfL0sLyYocz5la+qW3ZyxiDfH
 cuke4UB95TcbF/1fUIocG69N477EZE79+/LwOpSzNISCtVoG+aX95Muia+SWK2lNaNKN
 +tsQ==
X-Gm-Message-State: APjAAAU4Ogo/U/KhU8+IUIyHiTxZloLtJOQJsxdBqxWB3ZUQwCwmNJOG
 eLfn9J3vHDK6FgaVnkxiVRN2Ow==
X-Google-Smtp-Source: APXvYqzfVhP4yywet9AudY12rs64ANWPmJoVuQ67NV89zaHmlmFhFFpY/La8bZ5ByNzdPWUk92hg3Q==
X-Received: by 2002:a7b:ce92:: with SMTP id q18mr2612740wmj.164.1574750597913; 
 Mon, 25 Nov 2019 22:43:17 -0800 (PST)
Received: from localhost ([194.62.217.57])
 by smtp.gmail.com with ESMTPSA id s9sm1870420wmj.22.2019.11.25.22.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 22:43:17 -0800 (PST)
Date: Tue, 26 Nov 2019 07:43:16 +0100
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20191126064316.ly4sfdcmyxtccnss@mpHalley.local>
References: <20191122085952.12754-1-javier@javigon.com>
 <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191125190320.g7beal27nc5ubju7@mpHalley>
 <BYAPR04MB58161C14246FA30366B69B9DE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191126035726.xj7pierxsck6adow@mpHalley>
 <BYAPR04MB581676157DCF909EDF1AAAFCE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
 <BYAPR04MB5816F0BB42891E49C5AB42DDE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR04MB5816F0BB42891E49C5AB42DDE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iZUZI-00DjGp-IU
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Javier =?utf-8?B?R29uesOhbGV6?= <javier.gonz@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjYuMTEuMjAxOSAwNjoyMCwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4rIFNoaW4nSWNoaXJv
Cj4KPk9uIDIwMTkvMTEvMjYgMTU6MTksIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+PiBPbiAyMDE5
LzExLzI2IDEyOjU4LCBKYXZpZXIgR29uesOhbGV6IHdyb3RlOgo+Pj4gT24gMjYuMTEuMjAxOSAw
MjowNiwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+Pj4gT24gMjAxOS8xMS8yNiA0OjAzLCBKYXZp
ZXIgR29uesOhbGV6IHdyb3RlOgo+Pj4+PiBPbiAyNS4xMS4yMDE5IDAwOjQ4LCBEYW1pZW4gTGUg
TW9hbCB3cm90ZToKPj4+Pj4+IE9uIDIwMTkvMTEvMjIgMTg6MDAsIEphdmllciBHb256w6FsZXog
d3JvdGU6Cj4+Pj4+Pj4gRnJvbTogSmF2aWVyIEdvbnrDoWxleiA8amF2aWVyLmdvbnpAc2Ftc3Vu
Zy5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBGaXggZmlsZSBzeXN0ZW0gY29ycnVwdGlvbiB3aGVuIHVz
aW5nIExGUyBtb3VudCAoZS5nLiwgaW4gem9uZWQKPj4+Pj4+PiBkZXZpY2VzKS4gU2VlbXMgbGlr
ZSB0aGUgZmFsbGJhY2sgaW50byBidWZmZXJlZCBJL08gY3JlYXRlcyBhbgo+Pj4+Pj4+IGluY29u
c2lzdGVuY3kgaWYgdGhlIGFwcGxpY2F0aW9uIGlzIGFzc3VtaW5nIGJvdGggcmVhZCBhbmQgd3Jp
dGUgRElPLiBJCj4+Pj4+Pj4gY2FuIGVhc2lseSByZXByb2R1Y2UgYSBjb3JydXB0aW9uIHdpdGgg
YSBzaW1wbGUgUm9ja3NEQiB0ZXN0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gTWlnaHQgYmUgdGhhdCB0aGUg
ZjJmc19mb3JjZWRfYnVmZmVyZWRfaW8gcGF0aCBicmluZ3Mgc29tZSBwcm9ibGVtcyB0b28sCj4+
Pj4+Pj4gYnV0IEkgaGF2ZSBub3Qgc2VlbiBvdGhlciBmYWlsdXJlcyBiZXNpZGVzIHRoaXMgb25l
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gUHJvYmxlbSByZXByb2R1Y2libGUgd2l0aG91dCBhIHpvbmVkIGJs
b2NrIGRldmljZSwgc2ltcGx5IGJ5IGZvcmNpbmcKPj4+Pj4+PiBMRlMgbW91bnQ6Cj4+Pj4+Pj4K
Pj4+Pj4+PiAgICQgc3VkbyBta2ZzLmYyZnMgLWYgLW0gL2Rldi9udm1lMG4xCj4+Pj4+Pj4gICAk
IHN1ZG8gbW91bnQgL2Rldi9udm1lMG4xIC9tbnQvZjJmcwo+Pj4+Pj4+ICAgJCBzdWRvICAvb3B0
L3JvY2tzZGIvZGJfYmVuY2ggIC0tYmVuY2htYXJrcz1maWxsc2VxIC0tdXNlX2V4aXN0aW5nX2Ri
PTAKPj4+Pj4+PiAgIC0tdXNlX2RpcmVjdF9yZWFkcz10cnVlIC0tdXNlX2RpcmVjdF9pb19mb3Jf
Zmx1c2hfYW5kX2NvbXBhY3Rpb249dHJ1ZQo+Pj4+Pj4+ICAgLS1kYj0vbW50L2YyZnMgLS1udW09
NTAwMCAtLXZhbHVlX3NpemU9MTA0ODU3NiAtLXZlcmlmeV9jaGVja3N1bT0xCj4+Pj4+Pj4gICAt
LWJsb2NrX3NpemU9NjU1MzYKPj4+Pj4+Pgo+Pj4+Pj4+IE5vdGUgdGhhdCB0aGUgb3B0aW9ucyB0
aGF0IGNhdXNlIHRoZSBwcm9ibGVtIGFyZToKPj4+Pj4+PiAgIC0tdXNlX2RpcmVjdF9yZWFkcz10
cnVlIC0tdXNlX2RpcmVjdF9pb19mb3JfZmx1c2hfYW5kX2NvbXBhY3Rpb249dHJ1ZQo+Pj4+Pj4+
Cj4+Pj4+Pj4gRml4ZXM6IGY5ZDZkMDU5NzY5OCAoImYyZnM6IGZpeCBvdXQtcGxhY2UtdXBkYXRl
IERJTyB3cml0ZSIpCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgR29uesOh
bGV6IDxqYXZpZXIuZ29uekBzYW1zdW5nLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgZnMvZjJm
cy9kYXRhLmMgfCAzIC0tLQo+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkK
Pj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jCj4+Pj4+Pj4gaW5kZXggNTc1NWU4OTdhNWYwLi5iMDQ1ZGQ2YWI2MzIgMTAwNjQ0Cj4+Pj4+
Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+
Pj4+IEBAIC0xMDgxLDkgKzEwODEsNiBAQCBpbnQgZjJmc19wcmVhbGxvY2F0ZV9ibG9ja3Moc3Ry
dWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20pCj4+Pj4+Pj4gIAkJCXJldHVy
biBlcnI7Cj4+Pj4+Pj4gIAl9Cj4+Pj4+Pj4KPj4+Pj4+PiAtCWlmIChkaXJlY3RfaW8gJiYgYWxs
b3dfb3V0cGxhY2VfZGlvKGlub2RlLCBpb2NiLCBmcm9tKSkKPj4+Pj4+PiAtCQlyZXR1cm4gMDsK
Pj4+Pj4+Cj4+Pj4+PiBTaW5jZSBmb3IgTEZTIG1vZGUsIGFsbCBESU9zIGNhbiBlbmQgdXAgb3V0
IG9mIHBsYWNlLCBJIHRoaW5rIHRoYXQgaXQKPj4+Pj4+IG1heSBiZSBiZXR0ZXIgdG8gY2hhbmdl
IGFsbG93X291dHBsYWNlX2RpbygpIHRvIGFsd2F5cyByZXR1cm4gdHJ1ZSBpbgo+Pj4+Pj4gdGhl
IGNhc2Ugb2YgTEZTIG1vZGUuIFNvIG1heSBiZSBzb21ldGhpbmcgbGlrZToKPj4+Pj4+Cj4+Pj4+
PiBzdGF0aWMgaW5saW5lIGludCBhbGxvd19vdXRwbGFjZV9kaW8oc3RydWN0IGlub2RlICppbm9k
ZSwKPj4+Pj4+IAkJCXN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyKQo+
Pj4+Pj4gewo+Pj4+Pj4gCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9k
ZSk7Cj4+Pj4+PiAJaW50IHJ3ID0gaW92X2l0ZXJfcncoaXRlcik7Cj4+Pj4+Pgo+Pj4+Pj4gCXJl
dHVybiB0ZXN0X29wdChzYmksIExGUykgfHwKPj4+Pj4+IAkgCShydyA9PSBXUklURSAmJiAhYmxv
Y2tfdW5hbGlnbmVkX0lPKGlub2RlLCBpb2NiLCBpdGVyKSk7Cj4+Pj4+PiB9Cj4+Pj4+Pgo+Pj4+
Pj4gaW5zdGVhZCBvZiB0aGUgb3JpZ2luYWw6Cj4+Pj4+Pgo+Pj4+Pj4gc3RhdGljIGlubGluZSBp
bnQgYWxsb3dfb3V0cGxhY2VfZGlvKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4+PiAJCQlzdHJ1
Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqaXRlcikKPj4+Pj4+IHsKPj4+Pj4+IAlz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+Pj4+Pj4gCWludCBy
dyA9IGlvdl9pdGVyX3J3KGl0ZXIpOwo+Pj4+Pj4KPj4+Pj4+IAlyZXR1cm4gKHRlc3Rfb3B0KHNi
aSwgTEZTKSAmJiAocncgPT0gV1JJVEUpICYmCj4+Pj4+PiAJCQkJIWJsb2NrX3VuYWxpZ25lZF9J
Tyhpbm9kZSwgaW9jYiwgaXRlcikpOwo+Pj4+Pj4gfQo+Pj4+Pj4KPj4+Pj4+IFRob3VnaHRzID8K
Pj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEkgc2VlIHdoYXQgeW91IG1lYW4gYW5kIGl0IG1ha2VzIHNlbnNl
LiBIb3dldmVyLCB0aGUgcHJvYmxlbSBJIGFtIHNlZWluZwo+Pj4+PiBvY2N1cnMgd2hlbiBhbGxv
d19vdXRwbGFjZV9kaW8oKSByZXR1cm5zIHRydWUsIGFzIHRoaXMgaXMgd2hhdCBjcmVhdGVzCj4+
Pj4+IHRoZSBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhlIHdyaXRlIGJlaW5nIGJ1ZmZlcmVkIGFu
ZCB0aGUgcmVhZCBiZWluZwo+Pj4+PiBESU8uCj4+Pj4KPj4+PiBCdXQgaWYgdGhlIHdyaXRlIGlz
IHN3aXRjaGVkIHRvIGJ1ZmZlcmVkLCB0aGUgRElPIHJlYWQgc2hvdWxkIHVzZSB0aGUKPj4+PiBi
dWZmZXJlZCBwYXRoIHRvbywgbm8gPyBTaW5jZSB0aGlzIGlzIGFsbCBoYXBwZW5pbmcgdW5kZXIg
VkZTLCB0aGUKPj4+PiBnZW5lcmljIERJTyByZWFkIHBhdGggd2lsbCBub3QgZW5zdXJlIHRoYXQg
dGhlIGJ1ZmZlcmVkIHdyaXRlcyBhcmUKPj4+PiBmbHVzaGVkIHRvIGRpc2sgYmVmb3JlIGlzc3Vp
bmcgdGhlIGRpcmVjdCByZWFkLCBJIHRoaW5rLiBTbyB0aGF0IHdvdWxkCj4+Pj4gZXhwbGFpbiB5
b3VyIGRhdGEgY29ycnVwdGlvbiwgaS5lLiB5b3UgYXJlIHJlYWRpbmcgc3RhbGUgZGF0YSBvbiB0
aGUKPj4+PiBkZXZpY2UgYmVmb3JlIHRoZSBidWZmZXJlZCB3cml0ZXMgbWFrZSBpdCB0byB0aGUg
bWVkaWEuCj4+Pj4KPj4+Cj4+PiBBcyBmYXIgYXMgSSBjYW4gc2VlLCB0aGUgcmVhZCBpcyBhbHdh
eXMgc2VudCBESU8sIHNvIHllcywgSSBhbHNvIGJlbGlldmUKPj4+IHRoYXQgd2UgYXJlIHJlYWRp
bmcgc3RhbGUgZGF0YS4gVGhpcyBpcyB3aHkgdGhlIGNvcnJ1cHRpb24gaXMgbm90IHNlZW4KPj4+
IGlmIHByZXZlbnRpbmcgYWxsb3dfb3V0cGxhY2VfZGlvKCkgZnJvbSBzZW5kaW5nIHRoZSB3cml0
ZSB0byB0aGUKPj4+IGJ1ZmZlcmVkIHBhdGguCj4+Pgo+Pj4gV2hhdCBzdXJwcmlzZXMgbWUgaXMg
dGhhdCB0aGlzIGlzIHZlcnkgZWFzeSB0byB0cmlnZ2VyIChzZWUgY29tbWl0KSwgc28KPj4+IEkg
YXNzdW1lIHlvdSBtdXN0IGhhdmUgc2VlbiB0aGlzIHdpdGggU01SIGluIHRoZSBwYXN0Lgo+Pgo+
PiBXZSBqdXN0IGRpZC4gU2hpbidJY2hpcm8gaW4gbXkgdGVhbSBmaW5hbGx5IHN1Y2NlZWRlZCBp
biByZWNyZWF0aW5nIHRoZQo+PiBwcm9ibGVtLiBUaGUgY2F1c2Ugc2VlbXMgdG8gYmU6Cj4+Cj4+
IGJvb2wgZGlyZWN0X2lvID0gaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RJUkVDVDsKPj4KPj4gYmVp
bmcgdHJ1ZSBvbiBlbnRyeSBvZiBmMmZzX3ByZWFsbG9jYXRlX2Jsb2NrcygpIHdoZXJlYXMKPj4g
ZjJmc19kaXJlY3RfSU8oKSBmb3JjZXMgYnVmZmVyZWQgSU8gcGF0aCBmb3IgRElPIG9uIHpvbmVk
IGRldmljZXMgd2l0aDoKPj4KPj4gaWYgKGYyZnNfZm9yY2VfYnVmZmVyZWRfaW8oaW5vZGUsIGlv
Y2IsIGl0ZXIpKQo+PiAJCXJldHVybiAwOwo+Pgo+PiB3aGljaCBoYXM6Cj4+Cj4+IAlpZiAoZjJm
c19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4gCQlyZXR1cm4gdHJ1ZTsKPj4KPj4gU28gdGhlIHRv
cCBESU8gY29kZSBzYXlzICJkbyBidWZmZXJlZCBJT3MiLCBidXQgbG93ZXIgaW4gdGhlIHdyaXRl
IHBhdGgsCj4+IHRoZSBJTyBpcyBzdGlsbCBhc3N1bWVkIHRvIGJlIGEgRElPIGJlY2F1c2Ugb2Yg
dGhlIGlvY2IgZmxhZy4uLiBUaGF0J3MKPj4gaW5jb25zaXN0ZW50Lgo+Pgo+PiBOb3RlIHRoYXQg
Zm9yIHRoZSBub24tem9uZWQgZGV2aWNlIExGUyBjYXNlLCBmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lv
KCkKPj4gcmV0dXJucyB0cnVlIG9ubHkgZm9yIHVuYWxpZ25lZCB3cml0ZSBESU9zLi4uIEJ1dCB0
aGF0IHdpbGwgc3RpbGwgdHJpcAo+PiBvbiB0aGUgaW9jYiBmbGFnIHRlc3QuIFNvIHRoZSBwcm9w
ZXIgZml4IGlzIGxpa2VseSBzb21ldGhpbmcgbGlrZToKPj4KPj4gaW50IGYyZnNfcHJlYWxsb2Nh
dGVfYmxvY2tzKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQo+PiB7
Cj4+IAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9pbm9kZShpb2NiLT5raV9maWxwKTsKPj4g
CXN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFwOwo+PiAJaW50IGZsYWc7Cj4+IAlpbnQgZXJyID0g
MDsKPj4gLQlib29sIGRpcmVjdF9pbyA9IGlvY2ItPmtpX2ZsYWdzICYgSU9DQl9ESVJFQ1Q7Cj4+
ICsJYm9vbCBkaXJlY3RfaW8gPSAoaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RJUkVDVCkgJiYKPj4g
KwkJITJmc19mb3JjZV9idWZmZXJlZF9pbyhpbm9kZSwgaW9jYiwgaXRlcik7Cj4+Cj4+IAkvKiBj
b252ZXJ0IGlubGluZSBkYXRhIGZvciBEaXJlY3QgSS9PKi8KPj4gCWlmIChkaXJlY3RfaW8pIHsK
Pj4gCQllcnIgPSBmMmZzX2NvbnZlcnRfaW5saW5lX2lub2RlKGlub2RlKTsKPj4gCQlpZiAoZXJy
KQo+PiAJCQlyZXR1cm4gZXJyOwo+PiAJfQo+Pgo+PiBTaGluJ0ljaGlybyB0cmllZCB0aGlzIG9u
IFNNUiBkaXNrcyBhbmQgdGhlIGZhaWx1cmUgaXMgZ29uZS4uLgo+Pgo+PiBDaGVlcnMuCj4+CgpZ
ZXMhIFRoaXMgaXMgaXQuIEkgb3JpZ2luYWxseSB0aG91Z2ggdGhhdCB0aGUgcHJvYmxlbSB3YXMg
b24KZjJmc19mb3JjZV9idWZmZXJlZF9pbygpLCBidXQgY291bGQgbm90IGhpdCB0aGUgcHJvYmxl
bSB0aGVyZS4gVGhhbmtzCmZvciB0aGUgYW5hbHlzaXM7IGl0IG1ha2VzIHNlbnNlIG5vdy4KCkp1
c3QgdGVzdGVkIHlvdXIgcGF0Y2ggb24gb3VyIGRyaXZlcyBhbmQgdGhlIHByb2JsZW0gaXMgZ29u
ZSB0b28uIEd1ZXNzCnlvdSBjYW4gc2VuZCBhIG5ldyBwYXRjaCBhbiBpZ25vcmUgdGhpcyBvbmUu
IFlvdSBjYW4gc2V0IG15IHJldmlld2VkLWJ5Cm9uIGl0LgoKVGhhbmtzIERhbWllbiEKSmF2aWVy
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
