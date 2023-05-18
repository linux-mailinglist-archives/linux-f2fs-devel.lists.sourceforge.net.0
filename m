Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4E70879A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 20:12:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzi77-0000GH-3o;
	Thu, 18 May 2023 18:12:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1pzi75-0000GB-Rr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 18:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lcSudP0d0y5W4UJqGPB6CMWenz0A8Mu7rtujvtxJrkc=; b=Zh4ayN6HRh0Xi05yLve56jvPi7
 hqOh/sciX29mkSjLmg0HNvFepR5iAqM1S2Bj84FSRBkmHMcZO9jaDtFdMYKMdgCi/E074KmXQPyqm
 rEPGasTjpSncFfyvO2hBsXVviI51YMcbxmfS/e+Nxfr8HaK7GHD0cEtpDJa04nV3Wf0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lcSudP0d0y5W4UJqGPB6CMWenz0A8Mu7rtujvtxJrkc=; b=ewGQNqs5pC/uiYbbdKMpnJ9T4l
 YSSFH9HJM+snItSF/uilijQ6LL1PVYWBxKOZwNCOvlQzE1ye47XaA+0DkxU5yB5VYFZzWnmSAdgwp
 dg5Ol+FrEDeE4XCDF0v8RBQbI6KNI7WgQ8MWtjBIMmzRYIXAAEf89Mwu8d3Avo3wNFX8=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzi73-00CbEC-0p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 18:12:32 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-953343581a4so355665866b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684433542; x=1687025542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcSudP0d0y5W4UJqGPB6CMWenz0A8Mu7rtujvtxJrkc=;
 b=doyWuTwyGo04DhwkTIdxqPHyJIO+4TmPs7jDUph4XB5DZtOpSucJhK4ZHEUEE2w1nr
 ADZ8Xe74RqCIn2IFhRQKjrMm3fjkEo7weVSSlhHqAw9YjcAII1d3ReGLE8uY/L6dBlRW
 5I4n+7Rly+LDGenkXyfH4FCLenCMibo5864XUrD6toz7nqBN9CXbT6idm2AwMO5OfYL5
 d6nJdyaspWIcFnuELE+UsotjxMDCJ0DWPYT9C5HDVbvv91/mInKFGIQW9GeUy6l5WKcV
 7R0JgdabcZ3OhgOQvjSB8im4Aol4eggzzPwbq2vS+ONWRCbELvhC8zk7k85mtK9e3kBT
 QbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684433542; x=1687025542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcSudP0d0y5W4UJqGPB6CMWenz0A8Mu7rtujvtxJrkc=;
 b=LBwWy/gb4USNg6Q1V0USZP1y4h4qXSwgVd+WmbX8u12JL5CjT2SRdAEecjqJMnC7Mc
 lKhdcH89tbVnELWFxp5/c3uL+CAYp/jUHht+t8e2B8y8AnBV+r9Q2z44caTQmLgn/fJH
 dFEFUkgYy+oq4z18y6nEQkZoOjfO/rijJZQEwOXQJSvVSN+WAYX1MNiswETXOmUtiToP
 KzoX7mzEe1z/jmXF+OHN5Xb0tKa/gWcMB4md05K+4clImGuOvJV62FtJEBDt5pAwGTYC
 f/qgmtXwQw+hwFF6uVDr1U1pP4NvHHBW2n1rT8mL5mk8vqWH+F3o9BBh2AyzcQyyDsn2
 R/mQ==
X-Gm-Message-State: AC+VfDxAMQMaJ8plPa2U5dPMPdxSfNdYtOaphLdLB4ZG0e8F8/duTpJG
 E13+UZ0bd15IHNk61ttxN1mCiQdzFl7+dkogKdU9Wk0SJtA=
X-Google-Smtp-Source: ACHHUZ5raSwZL37n1XRj5QtldGJ7uVdrt5p8S/5MJYbyLIxPxpJDyLwxuusR7ckuxaU6u0ZdGT/ShjdQk4Mma2P9Yn0=
X-Received: by 2002:a17:907:6295:b0:94e:cbfb:5fab with SMTP id
 nd21-20020a170907629500b0094ecbfb5fabmr42163274ejc.75.1684433542110; Thu, 18
 May 2023 11:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f3z=kS9E+NTKH7t1J2xL1PpLOVMNx=CabD_t2K6U=T9uQ@mail.gmail.com>
 <b03137d3-cf73-60f7-3c0c-33c9beb9b209@kernel.org>
 <CAD14+f0xZguG9NG5anRzabgKrhvMeWO+kKrzXnL1MuM2gZ_yxA@mail.gmail.com>
 <68037247-6206-4419-fd87-52ee26c6df80@kernel.org>
 <CAD14+f3J_ReeS4VvqBZnLs04i=iXN36MJRWc_Pa95tftnZrtRg@mail.gmail.com>
 <c7f5350c-c13f-5079-9b1d-cc04ef04e246@kernel.org>
In-Reply-To: <c7f5350c-c13f-5079-9b1d-cc04ef04e246@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 19 May 2023 03:12:10 +0900
Message-ID: <CAD14+f0-+NF63rePDBeAx1yk6aB==nirjyZAfgurt5UbvVsY2Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Thanks for the patch. I'll try it out on both my
 laptop and workstation soon. One question though: would it make sense to see
 if it works fine on Android too? (With userspace's explicit GC trigger
 disabled.)
 Maybe it could be an indication on whether it works properly or not? 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pzi73-00CbEC-0p
Subject: Re: [f2fs-dev] [DISCUSSION] f2fs for desktop
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Koskovich <akoskovich@pm.me>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJJ2xsIHRyeSBpdCBvdXQgb24gYm90aCBt
eSBsYXB0b3AgYW5kIHdvcmtzdGF0aW9uIHNvb24uCgpPbmUgcXVlc3Rpb24gdGhvdWdoOiB3b3Vs
ZCBpdCBtYWtlIHNlbnNlIHRvIHNlZSBpZiBpdCB3b3JrcyBmaW5lIG9uCkFuZHJvaWQgdG9vPyAo
V2l0aCB1c2Vyc3BhY2UncyBleHBsaWNpdCBHQyB0cmlnZ2VyIGRpc2FibGVkLikKTWF5YmUgaXQg
Y291bGQgYmUgYW4gaW5kaWNhdGlvbiBvbiB3aGV0aGVyIGl0IHdvcmtzIHByb3Blcmx5IG9yIG5v
dD8KClRoYW5rcywKCk9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDQ6NTPigK9QTSBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMjAyMy80LzIxIDE6MjYsIEp1aHl1bmcgUGFy
ayB3cm90ZToKPiA+IEhpIENoYW8sCj4gPgo+ID4gT24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMTox
OeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBKdUh5
dW5nLAo+ID4+Cj4gPj4gU29ycnkgZm9yIGRlbGF5IHJlcGx5Lgo+ID4+Cj4gPj4gT24gMjAyMy80
LzExIDE6MDMsIEp1aHl1bmcgUGFyayB3cm90ZToKPiA+Pj4gSGkgQ2hhbywKPiA+Pj4KPiA+Pj4g
T24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgMTI6NDTigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IEhpIEp1aHl1bmcsCj4gPj4+Pgo+ID4+Pj4gT24gMjAy
My80LzQgMTU6MzYsIEp1aHl1bmcgUGFyayB3cm90ZToKPiA+Pj4+PiBIaSBldmVyeW9uZSwKPiA+
Pj4+Pgo+ID4+Pj4+IEkgd2FudCB0byBzdGFydCBhIGRpc2N1c3Npb24gb24gdXNpbmcgZjJmcyBm
b3IgcmVndWxhciBkZXNrdG9wcy93b3Jrc3RhdGlvbnMuCj4gPj4+Pj4KPiA+Pj4+PiBUaGVyZSBh
cmUgZ3Jvd2luZyBudW1iZXIgb2YgaW50ZXJlc3RzIGluIHVzaW5nIGYyZnMgYXMgdGhlIGdlbmVy
YWwKPiA+Pj4+PiByb290IGZpbGUtc3lzdGVtOgo+ID4+Pj4+IDIwMTg6IGh0dHBzOi8vd3d3LnBo
b3Jvbml4LmNvbS9uZXdzL0dSVUItTm93LVN1cHBvcnRzLUYyRlMKPiA+Pj4+PiAyMDIwOiBodHRw
czovL3d3dy5waG9yb25peC5jb20vbmV3cy9DbGVhci1MaW51eC1GMkZTLVJvb3QtT3B0aW9uCj4g
Pj4+Pj4gMjAyMzogaHR0cHM6Ly9jb2RlLmxhdW5jaHBhZC5uZXQvfm5leHVzcHJpc20vY3VydGlu
LytnaXQvY3VydGluLyttZXJnZS80Mzk4ODAKPiA+Pj4+PiAyMDIzOiBodHRwczovL2NvZGUubGF1
bmNocGFkLm5ldC9+bmV4dXNwcmlzbS9ncnViLytnaXQvdWJ1bnR1LyttZXJnZS80NDAxOTMKPiA+
Pj4+Pgo+ID4+Pj4+IEkndmUgYmVlbiBwZXJzb25hbGx5IHJ1bm5pbmcgZjJmcyBvbiBhbGwgb2Yg
bXkgeDg2IExpbnV4IGJveGVzIHNpbmNlCj4gPj4+Pj4gMjAxNSwgYW5kIEkgaGF2ZSBzZXZlcmFs
IGNvbmNlcm5zIHRoYXQgSSB0aGluayB3ZSBuZWVkIHRvIGNvbGxlY3RpdmVseQo+ID4+Pj4+IGFk
ZHJlc3MgZm9yIHJlZ3VsYXIgbm9uLUFuZHJvaWQgbm9ybWllcyB0byB1c2UgZjJmczoKPiA+Pj4+
Pgo+ID4+Pj4+IEEuIEJvb3Rsb2FkZXIgYW5kIGluc3RhbGxlciBzdXBwb3J0Cj4gPj4+Pj4gQi4g
SG9zdC1zaWRlIEdDCj4gPj4+Pj4gQy4gRXh0ZW5kZWQgbm9kZSBiaXRtYXAKPiA+Pj4+Pgo+ID4+
Pj4+IEknbGwgZ28gdGhyb3VnaCBlYWNoIG9uZS4KPiA+Pj4+Pgo+ID4+Pj4+ID09PSBBLiBCb290
bG9hZGVyIGFuZCBpbnN0YWxsZXIgc3VwcG9ydCA9PT0KPiA+Pj4+Pgo+ID4+Pj4+IEl0IHNlZW1z
IHRoYXQgYm90aCBHUlVCIGFuZCBzeXN0ZW1kLWJvb3Qgc3VwcG9ydHMgZjJmcyB3aXRob3V0IHRo
ZQo+ID4+Pj4+IG5lZWQgZm9yIGEgc2VwYXJhdGUgZXh0NC1mb3JtYXR0ZWQgL2Jvb3QgcGFydGl0
aW9uLgo+ID4+Pj4+IFNvbWUgZGlzdHJvcyBhcmUgc2VlbWluZ2x5IGRpc2FibGluZyBmMmZzIG1v
ZHVsZSBmb3IgR1JVQiB0aG91Z2ggZm9yCj4gPj4+Pj4gc2VjdXJpdHkgcmVhc29uczoKPiA+Pj4+
PiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9ncnViMi8rYnVnLzE4
Njg2NjQKPiA+Pj4+Pgo+ID4+Pj4+IEl0J3MgdWx0aW1hdGVseSB1cCB0byB0aGUgZGlzdHJvIGZv
bGtzIHRvIGVuYWJsZSB0aGlzLCBhbmQgc3RpbGwgaW4KPiA+Pj4+PiB0aGUgd29yc3QtY2FzZSBz
Y2VuYXJpbywgdGhleSBjYW4gc3BlY2lmeSBhIHNlcGFyYXRlIC9ib290IHBhcnRpdGlvbgo+ID4+
Pj4+IGFuZCBmb3JtYXQgaXQgdG8gZXh0NCB1cG9uIGluc3RhbGxhdGlvbi4KPiA+Pj4+Pgo+ID4+
Pj4+IFRoZSBpbnN0YWxsZXIgaXRzZWxmIHRvIHNob3cgZjJmcyBhbmQgY2FsbCBta2ZzLmYyZnMg
aXMgYmVpbmcgd29ya2VkCj4gPj4+Pj4gb24gY3VycmVudGx5IG9uIFVidW50dS4gU2VlIHRoZSAy
MDIzIGxpbmtzIGFib3ZlLgo+ID4+Pj4+Cj4gPj4+Pj4gTm90aGluZyBmMmZzIG1haW5saW5lIGRl
dmVsb3BlcnMgc2hvdWxkIGRvIGhlcmUsIGltby4KPiA+Pj4+Pgo+ID4+Pj4+ID09PSBCLiBIb3N0
LXNpZGUgR0MgPT09Cj4gPj4+Pj4KPiA+Pj4+PiBmMmZzIHJlbGlldmVzIG1vc3Qgb2YgdGhlIGRl
dmljZS1zaWRlIEdDIGJ1dCBpbnRyb2R1Y2VzIGEgbmV3Cj4gPj4+Pj4gaG9zdC1zaWRlIEdDLiBU
aGlzIGlzIGV4dHJlbWVseSBjb25mdXNpbmcgZm9yIHBlb3BsZSB3aG8gaGF2ZSBubwo+ID4+Pj4+
IGJhY2tncm91bmQgaW4gU1NEcyBhbmQgZmxhc2ggc3RvcmFnZSB0byB1bmRlcnN0YW5kLCBsZXQg
YWxvbmUKPiA+Pj4+PiBkaXNjYXJkL3RyaW0vZXJhc2UgY29tcGxpY2F0aW9ucy4KPiA+Pj4+Pgo+
ID4+Pj4+IEluIG1vc3QgY29uc3VtZXItZ3JhZGUgYmxhY2tib3ggU1NEcywgZGV2aWNlLXNpZGUg
R0NzIGFyZSBoYW5kbGVkCj4gPj4+Pj4gYXV0b21hdGljYWxseSBmb3IgdmFyaW91cyB3b3JrbG9h
ZHMuIGYyZnMsIGhvd2V2ZXIsIGxlYXZlcyB0aGF0Cj4gPj4+Pj4gcmVzcG9uc2liaWxpdHkgdG8g
dGhlIHVzZXJzcGFjZSB3aXRoIGNvbnNlcnZhdGl2ZSB0dW5pbmcgb24gdGhlCj4gPj4+Pgo+ID4+
Pj4gV2UndmUgcHJvcG9zZWQgYSBmMmZzIGZlYXR1cmUgbmFtZWQgInNwYWNlIGF3YXJlZCBnYXJi
YWdlIGNvbGxlY3Rpb24iCj4gPj4+PiBhbmQgc2hpcHBlZCBpdCBpbiBodWF3ZWkvaG9ub3IncyBk
ZXZpY2VzLCBidXQgZm9yZ290IHRvIHRyeSB1cHN0cmVhbWluZwo+ID4+Pj4gaXQuIDotUAo+ID4+
Pj4KPiA+Pj4+IEluIHRoaXMgZmVhdHVyZSwgd2UgaW50cm9kdWNlZCB0aHJlZSBtb2RlOgo+ID4+
Pj4gLSBwZXJmb3JtYW5jZSBtb2RlOiBzb21ldGhpbmcgbGlrZSB3cml0ZS1nYyBpbiBmdGwsIGl0
IGNhbiB0cmlnZ2VyCj4gPj4+PiBiYWNrZ3JvdW5kIGdjIG1vcmUgZnJlcXVlbnRseSBhbmQgdHVu
ZSBpdHMgc3BlZWQgYWNjb3JkaW5nIHRvIGZyZWUKPiA+Pj4+IHNlZ3MgYW5kIHJlY2xhaW1hYmxl
IGJsa3MgcmF0aW8uCj4gPj4+PiAtIGxpZmV0aW1lIG1vZGU6IHNsb3cgZG93biBiYWNrZ3JvdW5k
IGdjIHRvIGF2b2lkIGhpZ2ggd2FmIGlmIHRoZXJlCj4gPj4+PiBpcyBsZXNzIGZyZWUgc3BhY2Uu
Cj4gPj4+PiAtIGJhbGFuY2UgbW9kZTogYmVoYXZlIGFzIHVzdWFsLgo+ID4+Pj4KPiA+Pj4+IEkg
Z3Vlc3MgdGhpcyBtYXkgYmUgaGVscGZ1bCBmb3IgTGludXggZGVza3RvcCBkaXN0cm9zIHNpbmNl
IHRoZXJlIGlzCj4gPj4+PiBubyBzdWNoIHN0b3JhZ2Ugc2VydmljZSB0cmlnZ2VyIGdjX3VyZ2Vu
dC4KPiA+Pj4+Cj4gPj4+Cj4gPj4+IFRoYXQgaW5kZWVkIHNvdW5kcyBpbnRlcmVzdGluZy4KPiA+
Pj4KPiA+Pj4gSWYgeW91IG5lZWQgbWUgdG8gdGVzdCBzb21ldGhpbmcgb3V0LCBmZWVsIGZyZWUg
dG8gYXNrLgo+ID4+Cj4gPj4gVGhhbmtzIGEgbG90IGZvciB0aGF0LiA6KQo+ID4+Cj4gPj4gSSdt
IHRyeWluZyB0byBmaWd1cmUgb3V0IGEgcGF0Y2guLi4KPgo+IEp1aHl1bmcsCj4KPiBBcmUgeW91
IGludGVyZXN0aW5nIHRvIHRyeSB0aGlzIHBhdGNoIGluIGRpc3Ryb3M/Cj4KPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9jb21t
aXQvP2g9ZGV2LXRlc3QmaWQ9NDczNmU1NWJjOTY3ZTkxY2Y4YTI3NWI2Nzg3MzliMDA2YzI2MTdm
MAo+Cj4gVGhlcmUgYXJlIHNvbWUgdHVuYWJsZSBwYXJhbWV0ZXJzLCBJIGNhbiBleHBvcnQgdGhl
bSB2aWEgc3lzZnMgZW50cnksCj4gbGV0IG1lIHVwZGF0ZSBsYXRlci4KPgo+IFRoYW5rcywKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
