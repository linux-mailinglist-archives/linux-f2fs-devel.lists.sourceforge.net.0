Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF782418E1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 11:29:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5QaW-0004h3-7X; Tue, 11 Aug 2020 09:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k5QaU-0004gn-QU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 09:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvBhapulJHNTLDfrlwHP8ErNXcvplrpb7lxbHcaHUtw=; b=DJu534nKXtSpYWdn2zZHBiLcKX
 c0zMg+WQRLcrSFAtZtX/Auv7YUzyxV/AXVf55rbNmQdFsXWTFYvDz6vBFnUS4HUk1RhaGZjmdYTXU
 ACns1MIvBzItZtMrcCKIItNqKh+H0JECsnicDT/PPNItok5uTrjh2da9q01w3zqPGsKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvBhapulJHNTLDfrlwHP8ErNXcvplrpb7lxbHcaHUtw=; b=HtuRtg7DgpV6ZYujJp3zPG+rX0
 YXRvpL62pQsIko/luumpMUB+E6U3b9+Zb2bp6sk14vplqTiExh/KUDcCE897v6F3dT+Fp6wDSwL+2
 zc7Qn1LHoP1oK4UgJrtIYQVfUVIFyuycN6Ia8JNts3uLH10q60BtMVInI/vsfwRJggBw=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5QaR-000Il1-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 09:28:54 +0000
Received: by mail-lj1-f196.google.com with SMTP id t6so12739862ljk.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HvBhapulJHNTLDfrlwHP8ErNXcvplrpb7lxbHcaHUtw=;
 b=U8mNccyW3yzDJXPYeFEAVoPs5JVKhs0prNEtFyrW7pDtmkGgVKqmPiNsGO9kJYJGOp
 BY8VUGhNyG8xs3p58nO9z/PIMCi05UQ+dDpe7aMDZ9Mb1WPi9vIM6XX8wvSOLgL70m4O
 fOghEQpcp62m4TvEpysHbigawDwhksl4whHC2lXUkui90gOgPJVEbYla5UK89Ojljfbm
 udNGIAVxhTjm9MTwzkkR4HooxW3klZ4LX7MhDPn539CIbvIAUPyhJ4ZxFbsSRESMDevu
 ZvWtc5M2JHtpTu4xU1rq5XtTcQj9my+57hd5H9XnyB0+zt5abuIFWLnrwtxJ0EX1e1Gu
 FIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HvBhapulJHNTLDfrlwHP8ErNXcvplrpb7lxbHcaHUtw=;
 b=mg2rpLMSGFYbZF7Tu6ihWn0p98kRUEUokROPS1RNnMz0oYUMw+6m+1UNAUhlE3pFrQ
 dtVs5RlPUJ6fShuDZOVB+OZ8/CknRWL0EoeMQJly0uFNczWwIGVrnGXADtBsCO2pTxcR
 9S0jYBOx1NGKa7j65Dn+p0685TFV32ya2aLGXi9oS5Ejq+BOGVsMK3JQqHOfNlnMhu/i
 P9ZXgvpu0/538aN7GU5x2q5tQnvI+29q3s8sEUhzCYa2Y+RR/cFoL+vDP1uIx7BUF96D
 HXS5sX1KKmiT8+utuMYDqYIeOPZYVnQmqkxM1tq34j6OZWh4V5eQfBSkciP3QAILgN69
 1bnQ==
X-Gm-Message-State: AOAM532VyARaR+q4My2LtiNPOkYYiL/74HwXE/RWNoSsWNNRIh8crj2W
 4RnRcuAg7R8m3BIHW/TroPMcgpJN8ZX2OGr7sao=
X-Google-Smtp-Source: ABdhPJw5uYCu/KhAWYcYZ7ckKrVEbVS+zajglDqgVuJTHtg67Wv3tbh76aYFS1w2RTMMSVUb+HGZ9Dn0rljQeaeNxF4=
X-Received: by 2002:a2e:85d3:: with SMTP id h19mr2788882ljj.363.1597138124832; 
 Tue, 11 Aug 2020 02:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
In-Reply-To: <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 11 Aug 2020 18:28:33 +0900
Message-ID: <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5QaR-000Il1-Jd
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net,
 Gao Xiang <hsiangkao@redhat.com>, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QWN0dWFsbHksIGFzIHlvdSBjYW4gc2VlLCBJIHVzZSB0aGUgd2hvbGUgemVybyBkYXRhIGJsb2Nr
cyBpbiB0aGUgdGVzdCBmaWxlLgpJdCBjYW4gbWF4aW1pemUgdGhlIGVmZmVjdCBvZiBjaGFuZ2lu
ZyB2aXJ0dWFsIG1hcHBpbmcuCldoZW4gSSB1c2Ugbm9ybWFsIGZpbGVzIHdoaWNoIGNhbiBiZSBj
b21wcmVzc2VkIGFib3V0IDcwJSBmcm9tIHRoZQpvcmlnaW5hbCBmaWxlLApUaGUgdm1fbWFwX3Jh
bSgpIHZlcnNpb24gaXMgYWJvdXQgMnggZmFzdGVyIHRoYW4gdm1hcCgpIHZlcnNpb24uCgoyMDIw
64WEIDjsm5QgMTHsnbwgKO2ZlCkg7Jik7ZuEIDQ6NTUsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2Vp
LmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gMjAyMC84LzExIDE1OjE1LCBHYW8gWGlhbmcgd3Jv
dGU6Cj4gPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAxMjozNzo1M1BNICswOTAwLCBEYWVobyBK
ZW9uZyB3cm90ZToKPiA+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29t
Pgo+ID4+Cj4gPj4gQnkgcHJvZmlsaW5nIGYyZnMgY29tcHJlc3Npb24gd29ya3MsIEkndmUgZm91
bmQgdm1hcCgpIGNhbGxpbmdzIGFyZQo+ID4+IGJvdHRsZW5lY2tzIG9mIGYyZnMgZGVjb21wcmVz
c2lvbiBwYXRoLiBDaGFuZ2luZyB0aGVzZSB3aXRoCj4gPj4gdm1fbWFwX3JhbSgpLCB3ZSBjYW4g
ZW5oYW5jZSBmMmZzIGRlY29tcHJlc3Npb24gc3BlZWQgcHJldHR5IG11Y2guCj4gPj4KPiA+PiBb
VmVyaWZpY2F0aW9uXQo+ID4+IGRkIGlmPS9kZXYvemVybyBvZj1kdW1teSBicz0xbSBjb3VudD0x
MDAwCj4gPj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4gPj4gZGQgaWY9ZHVt
bXkgb2Y9L2Rldi96ZXJvIGJzPTUxMmsKPiA+Pgo+ID4+IC0gdy9vIGNvbXByZXNzaW9uIC0KPiA+
PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAxLjk5OTM4NCBzLCA1MDAgTS9zCj4g
Pj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgMi4wMzU5ODggcywgNDkxIE0vcwo+
ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMDM5NDU3IHMsIDQ5MCBNL3MK
PiA+Pgo+ID4+IC0gYmVmb3JlIHBhdGNoIC0KPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykg
Y29waWVkLCA5LjE0NjIxNyBzLCAxMDkgTS9zCj4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcp
IGNvcGllZCwgOS45OTc1NDIgcywgMTAwIE0vcwo+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBH
KSBjb3BpZWQsIDEwLjEwOTcyNyBzLCA5OSBNL3MKPiA+Pgo+ID4+IC0gYWZ0ZXIgcGF0Y2ggLQo+
ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMjUzNDQxIHMsIDQ0NCBNL3MK
PiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjczOTc2NCBzLCAzNjUgTS9z
Cj4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgMi4xODU2NDkgcywgNDU4IE0v
cwo+ID4KPiA+IEluZGVlZCwgdm1hcCgpIGFwcHJvYWNoIGhhcyBzb21lIGltcGFjdCBvbiB0aGUg
d2hvbGUKPiA+IHdvcmtmbG93LiBCdXQgSSBkb24ndCB0aGluayB0aGUgZ2FwIGlzIHN1Y2ggc2ln
bmlmaWNhbnQsCj4gPiBtYXliZSBpdCByZWxhdGVzIHRvIHVubG9ja2VkIGNwdWZyZXEgKGFuZCBi
aWcgbGl0dGxlCj4gPiBjb3JlIGRpZmZlcmVuY2UgaWYgaXQncyBvbiBzb21lIGFybTY0IGJvYXJk
KS4KPgo+IEFncmVlZCwKPgo+IEkgZ3Vlc3MgdGhlcmUgc2hvdWxkIGJlIG90aGVyIHJlYXNvbiBj
YXVzaW5nIHRoZSBsYXJnZSBwZXJmb3JtYW5jZQo+IGdhcCwgc2NoZWR1bGluZywgZnJlcXVlbmN5
LCBvciBzb21ldGhpbmcgZWxzZS4KPgo+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+ID4gLgo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
