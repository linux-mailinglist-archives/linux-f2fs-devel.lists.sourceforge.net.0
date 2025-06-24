Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB11AE5C49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 08:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p55RmPnmrsBBaqmaskajWukuZ1MEOXgHsIwbOOOAVgg=; b=NLgxNn5LJIracoO7HnI/vgPK/+
	vTkSvzKzX5AKUamCJvXoox39ojTOta/ahaYs15XLgUuaJ1qKWZ7PMk4fb9x6j1uTca31gmLoV1B42
	d91oAkkh74oVrtDeE2RqDqxXC3UjCR5AjzX8Ga+Z32uSzgw4I2uMtJ+vZGM2098utF5M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTwhE-0005Mb-MZ;
	Tue, 24 Jun 2025 05:59:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundanthebest@gmail.com>) id 1uTwhE-0005MV-0Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 05:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6010/ZxGOxc/GtHfiUtuCWiZZWt6dGaK+o3fK6MDmU=; b=fEapbuBR5FsJY+r6GEKLepzoqY
 ISwv93LuiqQ3F1RczWhn9T5M+hdbxHEmQQH0f2NtTrQL6g/DB9SGav4b/4txFIte7R2apZkt6lMlD
 9CR9qMrnMHtYYzQnYwXuJM/Yarm4LZHJeAaucGMEj4kfR3XnezjoPSSIQEB/Zbl9RB0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m6010/ZxGOxc/GtHfiUtuCWiZZWt6dGaK+o3fK6MDmU=; b=eB5Vj+gptIah64D3LpJ3foZelF
 Lpm6FB8V/RMYesXVUvoG7o0sM+9cBFApqwVEvFNiTur1jGKHhaplCfc2RAsWYLrpEwj9GOlqw9du5
 N9CNi8Ds4tsoF98EJpQQan+OFnbLQQZ/gCGllrUkHQHymZiS7agEOEaQ5cLe7GCNwz9A=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uTwhD-0006Hr-Ga for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 05:59:51 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so1882269a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Jun 2025 22:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750744780; x=1751349580; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6010/ZxGOxc/GtHfiUtuCWiZZWt6dGaK+o3fK6MDmU=;
 b=H0Ceypo2j40vKt60kVzWjaCoaQyV8DyLAtjP2MD1O4VFh0YcGdpFB9j4pOCpQAocGd
 E4FHqBd5Eq/cUWSzE3mlq9EfcXxxm/Ma7g1W8husBtQtSeD1OdI9EzV9/AJw4Iu4wHB+
 9Z9p5rsNsUOH1VSSdsM9cRJnTHHiMu5SngE/7iEPTX7ZLW76UkmGnbV3LqX3nEnHtUrC
 D5zjWbO+HhpGoweFr5rJqH+unkIZrV92xRueEBIkdCdZ5u7aqRt83/SBIh41OWKzc945
 7hZd63q/Bb8d7++TM/eANwsQ9YIiY8vHmVUXT9WwsQyofYUcfsQtRDV+bmRXYfiBKAm1
 8ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750744780; x=1751349580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6010/ZxGOxc/GtHfiUtuCWiZZWt6dGaK+o3fK6MDmU=;
 b=b4txAHNycxpnTnAocSMhCC/xIcMzuw1BkShqg7yYX21X+N9338Za9Ty7nvM4MZNKVc
 gbIRCw2MDL3KMvlHf5WnQ+3vJxShl9DF9Ils9lCn5nFMBzuoMNf5cyRy1Hed4Au5cSs7
 CUhpSen9vuX6bbCBVSEPSuocNxAD8ZBdEAa7hcOQo0BWPbRVCUIJqbecWY2Q5gc4hDIN
 MYyuXsZBiC8hrD6RLefF/67Wy4XskWtBjCb4hKHQbLZFTIC8u491s4TYztr44QFYcihW
 HYkDJvm6skxeqQbFm9vQCXF0TPwyTwMCxNgD/9i/Hw4pySxUQd38OSIHcRsEg1ir8eKp
 g2zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUepv903JA0zsFeMgeYUw1b8uMR2dpf/reSrIjmLKvip3k1rSOb/qTHm/8j4BftSbZcv2yiKt2Y4IzkrLqbvUJ0@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzp0WmU1SDzeoLOrZQ78E9TevdwKLA9g4nucJ/wIIAk6JI+qf2m
 y0znzSuhh6no+qjMY5VwsxvqI52ouSKvO9cGi2avVuoN+wDmm+JQxFM4ruPMhbIciEOglgPUkqW
 FnKnwX65bc/3RFiKhmqvCkQ0q6ZtscEw=
X-Gm-Gg: ASbGncs8pBeMYq9iWyPLNK9mH/cN/jJ4NIdYylHX1jApea4bZ5VRZE+ZhxI8p8L2SIX
 sQFVSjS34kWFslsy8lefjo7Nobz7j2d24MXZUO00poxg/B2fYtrykWZdm9b3wrjirK2NMdzRofW
 FzvEa+SeStJZBstBsHcC3KgX9CPx/iwFusAQ2w7auqHsZuQB1au2biY3g=
X-Google-Smtp-Source: AGHT+IE+xtk8mCeLX4OzNGlO9SwlPPmDyNCsobTZwfKxxEZdu+lYg/k7JddDFzyJ8a/vNVxMgcZ5qdSBpvnFKoOwczc=
X-Received: by 2002:a17:907:7e92:b0:adb:229a:f8bd with SMTP id
 a640c23a62f3a-ae057b6cc1dmr1547486566b.29.1750744779560; Mon, 23 Jun 2025
 22:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
 <CALYkqXqVRYqq+5_5W4Sdeh07M8DyEYLvrsm3yqhhCQTY0pvU1g@mail.gmail.com>
 <20250611155144.GD6138@frogsfrogsfrogs>
In-Reply-To: <20250611155144.GD6138@frogsfrogsfrogs>
From: Kundan Kumar <kundanthebest@gmail.com>
Date: Tue, 24 Jun 2025 11:29:28 +0530
X-Gm-Features: Ac12FXzjJtXhWP5qaSTxOaM8kfMlrnXKIbZrGlp-NuqDUifHrwujHPqe26XNyh8
Message-ID: <CALYkqXpOBb1Ak2kEKWbO2Kc5NaGwb4XsX1q4eEaNWmO_4SQq9w@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 11, 2025 at 9:21 PM Darrick J. Wong wrote: > >
 On Wed, Jun 04, 2025 at 02:52:34PM +0530, Kundan Kumar wrote: > > > > > For
 xfs used this command: > > > > > xfs_io -c "stat" /mnt/testfile [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kundanthebest(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.41 listed in wl.mailspike.net]
X-Headers-End: 1uTwhD-0006Hr-Ga
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, Anuj gupta <anuj1072538@gmail.com>, jack@suse.cz,
 amir73il@gmail.com, david@fromorbit.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, Christoph Hellwig <hch@lst.de>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgOToyMeKAr1BNIERhcnJpY2sgSi4gV29uZyA8ZGp3b25n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMDQsIDIwMjUgYXQgMDI6NTI6MzRQ
TSArMDUzMCwgS3VuZGFuIEt1bWFyIHdyb3RlOgo+ID4gPiA+ID4gRm9yIHhmcyB1c2VkIHRoaXMg
Y29tbWFuZDoKPiA+ID4gPiA+IHhmc19pbyAtYyAic3RhdCIgL21udC90ZXN0ZmlsZQo+ID4gPiA+
ID4gQW5kIGZvciBleHQ0IHVzZWQgdGhpczoKPiA+ID4gPiA+IGZpbGVmcmFnIC9tbnQvdGVzdGZp
bGUKPiA+ID4gPgo+ID4gPiA+IGZpbGVmcmFnIG1lcmdlcyBjb250aWd1b3VzIGV4dGVudHMsIGFu
ZCBvbmx5IGNvdW50cyB1cCBmb3IgZGlzY29udGlndW91cwo+ID4gPiA+IG1hcHBpbmdzLCB3aGls
ZSBmc3hhdHRyLm5leHRlbnRzIGNvdW50cyBhbGwgZXh0ZW50IGV2ZW4gaWYgdGhleSBhcmUKPiA+
ID4gPiBjb250aWd1b3VzLiAgU28geW91IHByb2JhYmx5IHdhbnQgdG8gdXNlIGZpbGVmcmFnIGZv
ciBib3RoIGNhc2VzLgo+ID4gPgo+ID4gPiBHb3QgaXQg4oCUIHRoYW5rcyBmb3IgdGhlIGNsYXJp
ZmljYXRpb24uIFdlJ2xsIHN3aXRjaCB0byB1c2luZyBmaWxlZnJhZwo+ID4gPiBhbmQgd2lsbCBz
aGFyZSB1cGRhdGVkIGV4dGVudCBjb3VudCBudW1iZXJzIGFjY29yZGluZ2x5Lgo+ID4KPiA+IFVz
aW5nIGZpbGVmcmFnLCB3ZSByZWNvcmRlZCBleHRlbnQgY291bnRzIG9uIHhmcyBhbmQgZXh0NCBh
dCB0aHJlZQo+ID4gc3RhZ2VzOgo+ID4gYS4gSnVzdCBhZnRlciBhIDFHIHJhbmRvbSB3cml0ZSwK
PiA+IGIuIEFmdGVyIGEgMzAtc2Vjb25kIHdhaXQsCj4gPiBjLiBBZnRlciB1bm1vdW50aW5nIGFu
ZCByZW1vdW50aW5nIHRoZSBmaWxlc3lzdGVtLAo+ID4KPiA+IHhmcwo+ID4gQmFzZQo+ID4gYS4g
NjI1MSAgIGIuIDI1MjYgIGMuIDI1MjYKPiA+IFBhcmFsbGVsIHdyaXRlYmFjawo+ID4gYS4gNjE4
MyAgIGIuIDIzMjYgIGMuIDIzMjYKPgo+IEludGVyZXN0aW5nIHRoYXQgdGhlIG1hcHBpbmcgcmVj
b3JkIGNvdW50IGdvZXMgZG93bi4uLgo+Cj4gSSB3b25kZXIsIHlvdSBzYWlkIHRoZSB4ZnMgZmls
ZXN5c3RlbSBoYXMgNCBBR3MgYW5kIDEyIGNvcmVzLCBzbyBJIGd1ZXNzCj4gd2JfY3R4X2Fycltd
IGlzIDEyPyAgSSB3b25kZXIsIGRvIHlvdSBzZWUgYSBrbmVlIHBvaW50IGluIHdyaXRlYmFjawo+
IHRocm91Z2hwdXQgd2hlbiB0aGUgIyBvZiB3YiBjb250ZXh0cyBleGNlZWRzIHRoZSBBRyBjb3Vu
dD8KPgo+IFRob3VnaCBJIGd1ZXNzIGZvciB0aGUgKGhvcGVmdWxseSBjb21tb24pIGNhc2Ugb2Yg
cHVyZSBvdmVyd3JpdGVzLCB3ZQo+IGRvbid0IGhhdmUgdG8gZG8gYW55IG1ldGFkYXRhIHVwZGF0
ZXMgc28gd2Ugd291bGRuJ3QgcmVhbGx5IGhpdCBhCj4gc2NhbGluZyBsaW1pdCBkdWUgdG8gYWcg
Y291bnQgb3IgbG9nIGNvbnRlbnRpb24gb3Igd2hhdGV2ZXIuICBEb2VzIHRoYXQKPiBzcXVhcmUg
d2l0aCB3aGF0IHlvdSBzZWU/Cj4KCkhpIERhcnJpY2ssCgpXZSBhbmFseXplZCBBRyBjb3VudCB2
cy4gbnVtYmVyIG9mIHdyaXRlYmFjayBjb250ZXh0cyB0byBpZGVudGlmeSBhbnkKa25lZSBwb2lu
dC4gRWFybGllciwgd2JfY3R4X2FycltdIHdhcyBmaXhlZCBhdCAxMjsgbm93IHdlIHZhcmllZCBu
cl93Yl9jdHgKYW5kIG1lYXN1cmVkIHRoZSBpbXBhY3QuCgpXZSBpbXBsZW1lbnRlZCBhIGNvbmZp
Z3VyYWJsZSBudW1iZXIgb2Ygd3JpdGViYWNrIGNvbnRleHRzIHRvIG1lYXN1cmUKdGhyb3VnaHB1
dCBtb3JlIGVhc2lseS4gVGhpcyBmZWF0dXJlIHdpbGwgYmUgZXhwb3NlZCBpbiB0aGUgbmV4dCBz
ZXJpZXMuClRvIGNvbmZpZ3VyZSwgdXNlZDogZWNobyA8bnJfd2JfY3R4PiA+IC9zeXMvY2xhc3Mv
YmRpLzI1OToyL253cml0ZWJhY2tzLgoKSW4gb3VyIHRlc3QsIHdyaXRpbmcgMUcgYWNyb3NzIDEy
IGRpcmVjdG9yaWVzIHNob3dlZCBpbXByb3ZlZCBiYW5kd2lkdGggdXAKdG8gdGhlIG51bWJlciBv
ZiBhbGxvY2F0aW9uIGdyb3VwcyAoQUdzKSwgbW9zdGx5IGEga25lZSBwb2ludCwgYnV0IGdhaW5z
CnRhcGVyZWQgb2ZmIGJleW9uZCB0aGF0LiBBbHNvLCB3ZSBzZWUgYSBnb29kIGluY3JlYXNlIGlu
IGJhbmR3aWR0aCBvZiBhYm91dAoxNiB0aW1lcyBmcm9tIGJhc2UgdG8gbnJfd2JfY3R4ID0gNi4K
CiAgICBCYXNlIChzaW5nbGUgdGhyZWFkZWQpICAgICAgICAgICAgICAgIDogIDk3OTlLaUIvcwog
ICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSAxKSAgICA6ICA5NzI3S2lCL3MKICAg
IFBhcmFsbGVsIFdyaXRlYmFjayAobnJfd2JfY3R4ID0gMikgICAgOiAgMTguMU1pQi9zCiAgICBQ
YXJhbGxlbCBXcml0ZWJhY2sgKG5yX3diX2N0eCA9IDMpICAgIDogIDQ2LjRNaUIvcwogICAgUGFy
YWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSA0KSAgICA6ICAxMzVNaUIvcwogICAgUGFyYWxs
ZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSA1KSAgICA6ICAxNjBNaUIvcwogICAgUGFyYWxsZWwg
V3JpdGViYWNrIChucl93Yl9jdHggPSA2KSAgICA6ICAxNjNNaUIvcwogICAgUGFyYWxsZWwgV3Jp
dGViYWNrIChucl93Yl9jdHggPSA3KSAgICA6ICAxNjJNaUIvcwogICAgUGFyYWxsZWwgV3JpdGVi
YWNrIChucl93Yl9jdHggPSA4KSAgICA6ICAxNTRNaUIvcwogICAgUGFyYWxsZWwgV3JpdGViYWNr
IChucl93Yl9jdHggPSA5KSAgICA6ICAxNTJNaUIvcwogICAgUGFyYWxsZWwgV3JpdGViYWNrIChu
cl93Yl9jdHggPSAxMCkgICA6ICAxNDVNaUIvcwogICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93
Yl9jdHggPSAxMSkgICA6ICAxNDVNaUIvcwogICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9j
dHggPSAxMikgICA6ICAxMzhNaUIvcwoKClN5c3RlbSBjb25maWcKPT09PT09PT09PT0KTnVtYmVy
IG9mIENQVXMgPSAxMgpTeXN0ZW0gUkFNID0gOUcKRm9yIFhGUyBudW1iZXIgb2YgQUdzID0gNApV
c2VkIE5WTWUgU1NEIG9mIDMuODQgVEIgKEVudGVycHJpc2UgU1NEIFBNMTczM2EpCgpTY3JpcHQK
PT09PT0KbWtmcy54ZnMgLWYgL2Rldi9udm1lMG4xCm1vdW50IC9kZXYvbnZtZTBuMSAvbW50CmVj
aG8gPG51bV93Yl9jdHg+ID4gL3N5cy9jbGFzcy9iZGkvMjU5OjIvbndyaXRlYmFja3MKc3luYwpl
Y2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKCmZvciBpIGluIHsxLi4xMn07IGRvCiAg
bWtkaXIgLXAgL21udC9kaXIkaQpkb25lCgpmaW8gam9iX252bWUuZmlvCgp1bW91bnQgL21udApl
Y2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKc3luYwoKZmlvIGpvYgo9PT09PQpbZ2xv
YmFsXQpicz00awppb2RlcHRoPTEKcnc9cmFuZHdyaXRlCmlvZW5naW5lPWlvX3VyaW5nCm5yZmls
ZXM9MTIKbnVtam9icz0xICAgICAgICAgICAgICAgICMgRWFjaCBqb2Igd3JpdGVzIHRvIGEgZGlm
ZmVyZW50IGZpbGUKc2l6ZT0xZwpkaXJlY3Q9MCAgICAgICAgICAgICAgICAgIyBCdWZmZXJlZCBJ
L08gdG8gdHJpZ2dlciB3cml0ZWJhY2sKZ3JvdXBfcmVwb3J0aW5nPTEKY3JlYXRlX29uX29wZW49
MQpuYW1lPXRlc3QKCltqb2IxXQpkaXJlY3Rvcnk9L21udC9kaXIxCgpbam9iMl0KZGlyZWN0b3J5
PS9tbnQvZGlyMgouLi4KLi4uCltqb2IxMl0KZGlyZWN0b3J5PS9tbnQvZGlyMQoKPiA+IGV4dDQK
PiA+IEJhc2UKPiA+IGEuIDcwODAgICBiLiA3MDgwICAgIGMuIDExCj4gPiBQYXJhbGxlbCB3cml0
ZWJhY2sKPiA+IGEuIDU5NjEgICBiLiA1OTYxICAgIGMuIDExCj4KPiBIdW0sIHRoYXQncyBwYXJ0
aWN1bGFybHkgLi4uIGludGVyZXN0aW5nLiAgSSB3b25kZXIgd2hhdCB0aGUgbWFwcGluZwo+IGNv
dW50IGJlaGF2aW9ycyBhcmUgd2hlbiB5b3UgdHVybiBvZmYgZGVsYXllZCBhbGxvY2F0aW9uPwo+
Cj4gLS1ECj4KCkkgYXR0ZW1wdGVkIHRvIGRpc2FibGUgZGVsYXllZCBhbGxvY2F0aW9uIGJ5IHNl
dHRpbmcgYWxsb2NzaXplPTQwOTYKZHVyaW5nIG1vdW50IChtb3VudCAtbyBhbGxvY3NpemU9NDA5
NiAvZGV2L3BtZW0wIC9tbnQpLCBidXQgc3RpbGwKb2JzZXJ2ZWQgYSByZWR1Y3Rpb24gaW4gZmls
ZSBmcmFnbWVudHMgYWZ0ZXIgYSBkZWxheS4gSXMgdGhlcmUgc29tZXRoaW5nCkknbSBvdmVybG9v
a2luZz8KCi1LdW5kYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
