Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A00CCF0B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 09:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C38v/7GGk1560rKzEv4W+v/vLeOxKCj88tzo7MP+ClA=; b=Worjat85kJZQ3PIq/ba82XVyZ1
	pvCMrPzVwVYjsIfR07ZiPrIv8xiYDpXejTw70gj6XyXC8U2sZtFp0QrBRtW+vI1zwDrOkF4W4Ri7Z
	N507Aozf58F9uUnHEjHtUD7zzir8vMV9h9ireSrSW+ieh1ORoxqA5ZFRx0MriuIcLdIE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWWEy-0006ib-7T;
	Fri, 19 Dec 2025 08:53:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannechien@google.com>) id 1vWWEv-0006iT-Uy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 08:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fs8T/bx/dvPsalE6IyzXiaKyBFs/NfE6tP6xBoAggoI=; b=YW3PELWdish7duCjYls6aNJsc+
 35/pGu1tsOs+Wxzcr4L+EZdAFKJUyiD61fp7C1BDYzkJXDwNWTNWLbM3zxMsVZgIUQ37f/57Go2A1
 Hy9+WJmqD84NNjI7b/yZmAFfLMcTmB2JDILccvaukR8ylowO9qVMN+M3Tt1cKICy3FKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fs8T/bx/dvPsalE6IyzXiaKyBFs/NfE6tP6xBoAggoI=; b=i8qIBJvWv6HSt1U5dfL6/H2THs
 nec7K1874QCFwEwsVDPi3Ke5uW9xuitPW0M9xr326QGrge0L50h6Hk3udU18uH+1joUJG6GD36Qx6
 sjR7UusISAOLn38W4f6zfr1HFuiGc5OwP4jevHAdOCMFKgYZHN9kueuV1OdImaPVRRkw=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vWWEv-0001rY-9I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 08:53:33 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-64b66d427e9so5252a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Dec 2025 00:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766134402; cv=none;
 d=google.com; s=arc-20240605;
 b=EHu+GqGj7hPG6MZjAOmMabPsQPW1cquemr5A7z1ncSXGSdy5ueJPaI9dVeJj6WVG1A
 75pnGPDO+kKtpatc3BBJFuNXyTsJPoJw/zz3GlcIABxcdNbuHMXqBsA0p0SH+FobKYWM
 026Q0zw81OwTux09SgZx3lNbvMZU7slb9ko0V8AOTzlrePyBG262hN6xYS5LMuK8EfHq
 VSQD3aMfS1exWDRpMZXC9N5vJp7Xku/RUC+J0Z4cHjWxJyxl3w2IuWcCvHs1T4T9kf8X
 EjlMO+2WnfhfQJWazYsXVLDbthgCmYmDc1XX4w58nWnuoZz1B30k7paUyk2pwSylkEXy
 haVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Fs8T/bx/dvPsalE6IyzXiaKyBFs/NfE6tP6xBoAggoI=;
 fh=2P7V+7l1xb3RENa7wIibTFrsys+DtOjc7lCy8n3zKRg=;
 b=OyuPsr3BNpfJ7QNLpK88Q07NJZNP3ScjgCJESnQmCpVbUkQ/aXPYY2LTg7BqeGWPnW
 /K1T6e2FlJQ+J9GSmK1eaO+zfqlLxoASJkq1cm4WNVxPwtk32n33xNGZP25zj8LxQZKX
 Usim7fZU/MdlxSdHgwHgA2AXWNNFyvec2A/n5mCq65kiOR+e2j6yvsVQ8JNO8/6lFqrI
 IBnq8+Ctt/dZpYU+qE2iBZoNwv+xnJhXS94XVHIZ+1ViJCetK3WqZRgXn/tunpkGfAzJ
 1vPOlBvhkpt9yzV6fE+ZP9iBpmLu4LfxD/byxvnhJuGm5S3/Y5nGUWCyl5EBcnuHVmQb
 zNhA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766134402; x=1766739202;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fs8T/bx/dvPsalE6IyzXiaKyBFs/NfE6tP6xBoAggoI=;
 b=c3frKzFM3qBgsJaJIfs4j+6vLfoYckbhpqrlPSIb4gAHqIwe+GXjeqZZYPMPWvuxQK
 EUMbgLApHlOw/etR/EgzYhLRI51V0ZpfyBS6I8yTP8MgcI6EWZ5iLDwfkJL6rStxVn6w
 ED+Vg+FPjWZn+avbGevcbPZ+91uLTH3wPSgwD8ld9jrMzevYsZXjf8IjsXp4CSmA3Exo
 6kNEtxFA9ZZBnDes19SajAsXZlR+aVk2dVR0j4MEXqdoH+kOUBH4y5XdfRBGG7y3qVta
 E/RtVmav5sMOd/5ujERhX2lkyALjks7mU9Go50pHrEC1UVoN68/e3XjBGKg4mqGuQIVl
 e4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766134402; x=1766739202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fs8T/bx/dvPsalE6IyzXiaKyBFs/NfE6tP6xBoAggoI=;
 b=im9hVAyEtEw0EEs2PfrzYngx1rgBLhjSiaZZylYC0gNK+fvQF458NVM080UoXITWrq
 ko8T65bRgEn4cdpJIOAf+AgEx+sUKEAT2Q6KGv/QVC8c3LLjFRhn5a7A+kZYcDYpQwL1
 JK8dxf39M4+jS6OAuDMpqd78rCmpNAd2PeL4BXEQKkDvGZp0VBkcciaM0wauxr8fJr6S
 G7bcTDI6MhE/Hr3RPBI9tWMUlH8sTKvG8GOXB8cME/QclZflnYArT08s/oub5bRfEm3m
 UHzeu+G0i5j3toHDiRiFB20GCiw//s7FTKFNU2AhEu5ADwLI11KNBoREKEQ1IXCpbIOE
 JI5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwTxxW/z1TMPikrFsRs5DNYq3JD9DyKbQXO4fcBjbne1wJpcn8H8QfPve5me4qzFv3maPmCC9fAfzUqwmsMwV/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxPgCqkTHvPuCfMcTDAUK01oRviQ1Lg+pMErEvoTcKMyhmsqTyr
 2J+hnGOcu4ZywiiiITP9O4N9qiuFAfFiD3JXQikLSj5g/Iq3DDgrWTX5uTphpciaXIV/2jHqOq9
 5A46WDXFsZ21e6/1lNfnbbs2d5FFavp1jNKl9XODF
X-Gm-Gg: AY/fxX40maj7X5TW1FtY2tkg9lHrRQkgBsP7aXnmC7zXyTAQ7n1p3sjyZd+Wg/spaT+
 l/mQU3eoiQM6XtCprvJXIv+jjUxivPhaKlzrMqjWN9Cy7vxkH1hqIPhRfMSZjXKdf0keMWfXr+L
 LdM+2ds6ugtbsEVq1VSp35iRVD70g1OeT3k8faoA3intIRvIevPwr2OQgatV5obL5B7Xli2VLz1
 DEEXZsCkS99JN3A70+kn75ygxobyHCBJQh0nfndLaov9VqJVREygfKf37lL6IwLOxdH+l5XIEFb
 wlgrllzVkGsTggtiiJeuJXU=
X-Google-Smtp-Source: AGHT+IHuq3d4KNN0YyYAniV+RPAme4gkyFjgPMmpMJeYKEriKWzrRS16Ut3ZIhRlPYydbLU+pSeNuVjrsmXnVjuRd+I=
X-Received: by 2002:a05:6402:289c:b0:64b:4a02:f726 with SMTP id
 4fb4d7f45d1cf-64ba219eacfmr11471a12.10.1766134401509; Fri, 19 Dec 2025
 00:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20251218071717.2573035-1-joannechien@google.com>
 <aUOuMmZnw3tij2nj@infradead.org>
 <CACQK4XDtWzoco7WgmF81dEYpF1rP3s+3AjemPL40ysojMztOtQ@mail.gmail.com>
 <aUTi5KPgn1fqezel@infradead.org>
In-Reply-To: <aUTi5KPgn1fqezel@infradead.org>
Date: Fri, 19 Dec 2025 16:53:04 +0800
X-Gm-Features: AQt7F2oJIHIkcmTVNq-CM0D_Pggo29w0ne08iqhRm5s3GY2QUVqSO82KqAeqqQg
Message-ID: <CACQK4XCmq2_nSJA7jLz+TWiTgyZpVwnZZmG-NbNOkB2JjrCSeA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 19,
 2025 at 1:30 PM Christoph Hellwig <hch@infradead.org>
 wrote: > On Thu, Dec 18, 2025 at 08:02:48PM +0800, Joanne Chang wrote: >
 > Thank you for the feedback. I will implement a > > _req [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.208.41 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.41 listed in wl.mailspike.net]
X-Headers-End: 1vWWEv-0001rY-9I
Subject: Re: [f2fs-dev] [PATCH v1] generic/735: disable for f2fs
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTozMOKAr1BNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gT24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMDg6MDI6NDhQ
TSArMDgwMCwgSm9hbm5lIENoYW5nIHdyb3RlOgo+ID4gVGhhbmsgeW91IGZvciB0aGUgZmVlZGJh
Y2suIEkgd2lsbCBpbXBsZW1lbnQgYQo+ID4gX3JlcXVpcmVfYmxvY2tzX2luX2ZpbGUgaGVscGVy
IGluIHRoZSBuZXh0IHZlcnNpb24uIEFzIGZhciBhcyBJCj4gPiBrbm93LCB0aGVyZSBpc24ndCBh
IGdlbmVyaWMgd2F5IHRvIHF1ZXJ5IHRoZSBibG9jayBudW1iZXIgbGltaXQKPiA+IGFjcm9zcyBm
aWxlc3lzdGVtcywgc28gSSBwbGFuIHRvIGhhcmRjb2RlIHRoZSBrbm93biBsaW1pdCBmb3IKPiA+
IEYyRlMgd2l0aGluIHRoZSBoZWxwZXIgZm9yIG5vdy4KPgo+IE9oLCB0aGUgbGltaXRzIGlzIG5v
dCB0aGUgZmlsZSBzaXplIHBlciBzZSwgc28gdGhlIG51bWJlciBvZiBibG9ja3M/Cj4gSS5lLiB5
b3UgY2FuIGhhdmUgYSA2NC1iaXQgaV9zaXplLCBidXQgaWYgdGhlIGZpbGUgaXNuJ3Qgc3BhcmUg
aXQKPiBldmVudHVhbGx5IGNhbid0IGZpbGwgaG9sZXM/ICBUaGF0IHJlYWxseSBkb2VzIHNlZW0g
bGlrZSBiZWhhdmlvcgo+IGFwcGxpY2F0aW9ucyB3b3VsZCBub3Qgbm90IGV4cGVjdCwgYWthIGEg
YnVnLgoKVGhhbmtzIGZvciB0aGUgcmVwbHkuIFRvIGNsYXJpZnksIEkgbWVhbnQgdGVzdGluZyB0
aGUgYXJjaGl0ZWN0dXJhbApsaW1pdCBvZiBibG9ja3MgcGVyIGZpbGUsIG5vdCB0aGUgY3VycmVu
dCBmcmVlIGJsb2Nrcy4gU29ycnkgZm9yIGFueQpjb25mdXNpb24gaW4gbXkgcHJldmlvdXMgcmVw
bHkuCgpUaGUgbGltaXQgaXMgaW5kZWVkIHRoZSBtYXhpbXVtIGZpbGUgc2l6ZS4gSG93ZXZlciwg
c2luY2UgYm90aCB0aGUgRjJGUwpmaWxlIHNpemUgbGltaXQgYW5kIHRoZSB0ZXN0J3MgcmVxdWly
ZW1lbnRzIGFyZSBjYWxjdWxhdGVkIGFzCihibG9ja19udW1iZXIgKiBibG9ja19zaXplKSwgSSBi
ZWxpZXZlIGl0IGlzIHNpbXBsZXIgdG8ganVzdCB0ZXN0IHRoZQpibG9jayBudW1iZXIuCgpCZXN0
IHJlZ2FyZHMsCkpvYW5uZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
