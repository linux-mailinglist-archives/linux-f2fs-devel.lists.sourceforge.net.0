Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81B83FBCD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 02:28:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUGRP-0000PQ-QQ;
	Mon, 29 Jan 2024 01:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rUGRO-0000PE-DG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 01:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mcM9wK3xl1kq/cKiqD+eKuneVVFOjOMNC/5XyIYeyYU=; b=l5yFhdXCeZFR5kTpolNG3ezjMY
 LUB8FBVvzUCIaJXDGJyiajGBSK+CfBaGzfMwOD+X2hfH340QCuNKMnsl9hmA/z4P+2jZHYgdsce9Q
 R7uvBGvcCeFQ48YCCECqTk3OOox06JJUlil/qzBT923w/CZAzAoisJo2ujKDtocYHhUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mcM9wK3xl1kq/cKiqD+eKuneVVFOjOMNC/5XyIYeyYU=; b=e5rbxA3o7F6Z7Xhj0rY3IBViPt
 Ga652CkV6Lf5sR6iGdQkPb9NHhk5ntYO2L18vsZlN5bzPAvr9juE/MhprhzDJ+iwFqKH1uusj+qn4
 aDqFASSi2k2gGWkimtz2yKFs1WZd4LsrH5envQ6FVNgXzAOs4N91rwHgYNkJwb7oP+Bg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUGRK-0001l6-Rc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 01:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11D5961CCE;
 Mon, 29 Jan 2024 01:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF83EC433C7;
 Mon, 29 Jan 2024 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706491668;
 bh=NkU7xTweU96ajdi9Fvy8l3qWym9x0Ihl2M8f3JBKtCs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hpGWaGzRZQO3vY65y0NHyElKDi8PXRMW0iwOAaWRjxervIvQH3ZVIu+E0Up/EcD0L
 1PFsxld3n+kZjpj+4VjmVWBVAetWYCbdDLiGlN07jcGx6IEB8QSZEVy2SxqUqcCtCD
 optOJHib52iCli9R8CTa2qNiocSVyFW1JUmxpdGCQIXEuSL2fDd22CNJaM7181FD8w
 8z3027AN+rMZDv+9xpMn0PI1JQB3F1p8iIkvv4+Wt5wURaJ8n9mb+lf6HqLJ83lMyN
 abIgtCCsEyTUOtJpIc7ljBsAt44zXYBEO8lHaErtPGeCiCA82UIqCgiruxTQAJXtzb
 WoFtvpUG3RH/Q==
Message-ID: <e879da72-4c4f-4aed-8081-784f2de5c887@kernel.org>
Date: Mon, 29 Jan 2024 09:27:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
 <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
 <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
 <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/1/27 2:17, Daeho Jeong wrote: > On Thu, Jan 25, 2024
    at 5:27 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/1/26 0:25, Daeho
    Jeong wrote: >>> On Wed, Jan 24, 2024 at 7:34 PM Chao Yu <ch [...] 
 
 Content analysis details:   (-7.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUGRK-0001l6-Rc
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xLzI3IDI6MTcsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFRodSwgSmFuIDI1LCAy
MDI0IGF0IDU6MjfigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBP
biAyMDI0LzEvMjYgMDoyNSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBPbiBXZWQsIEphbiAyNCwg
MjAyNCBhdCA3OjM04oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+
Pj4+ICtDYyBZb25ncGVuZyBZYW5nCj4+Pj4KPj4+PiBEYWVobywKPj4+Pgo+Pj4+IFlvbmdwZW5n
IHJlcG9ydHMgYSBwb3RlbnRpYWwgaXNzdWU6IGlmIGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50
cyBpcwo+Pj4+IGxhcmdlciB0aGFuIHNlZ21lbnRzIG9mIG1haW5hcmVhLCBjLmN1cl9zZWdbQ1VS
U0VHX0hPVF9OT0RFXSB3aWxsIGV4Y2VlZAo+Pj4+IGVuZCBib3VuZGFyeSBvZiBtYWluYXJlYS4g
Q291bGQgeW91IHBsZWFzZSBjaGVjayB0aGF0PyB0aG91Z2ggaXQncyBhIGNvcm5lcgo+Pj4+IGNh
c2UuCj4+Pgo+Pj4gQ2FuIHlvdSBlbGFib3JhdGUgbW9yZT8KPj4KPj4gU2luY2UgYy5jdXJfc2Vn
W0NVUlNFR19IT1RfTk9ERV0gaXMgYW4gb2Zmc2V0IHN0YXJ0ZWQgZnJvbSBtYWluX2Jsa2FkZHIu
Cj4gCj4gT2gsIEdvdCBpdC4KPiBUaGVuLCBob3cgYWJvdXQgdGhpcz8KPiAKPiAgICAgICAgICAg
Yy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gPSBjLnpvbmVkX21vZGVsID09IEYyRlNfWk9ORURf
SE0gPwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGMuZGV2aWNlc1sxXS5zdGFydF9ibGth
ZGRyIC0KPiBnZXRfc2IobWFpbl9ibGthZGRyKSkgLyBjLmJsa3NfcGVyX3NlZyA6IDA7CgpCZXR0
ZXIsIGJ1dCBsb2cgaGVhZGVyIHNob3VsZCBhbGlnbiB0byBzdGFydCBibGthZGRyIG9mIHpvbmU/
CgpUaGFua3MsCgo+IAo+PiBJZiBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSB3YXMgYXNzaWdu
ZWQgdy8gYy5kZXZpY2VzWzBdLnRvdGFsX3NlZ21lbnRzLAo+PiBhbmQgYy5kZXZpY2VzWzBdLnRv
dGFsX3NlZ21lbnRzIGlzIGxhcmdlciB0aGFuIHNlZ21lbnRzIG9mIG1haW5hcmUsCj4+IGMuY3Vy
X3NlZ1tDVVJTRUdfSE9UX05PREVdIHdpbGwgZXhjZWVkIHRoZSBlbmQgYm91bmRhcnkgb2YgbWFp
bmFyZWEuCj4+Cj4+ICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdID0gYy56b25l
ZF9tb2RlbCA9PSBGMkZTX1pPTkVEX0hNID8KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGMu
ZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyA6IDA7Cj4+Cj4+PiBJbiB0aGUgY2FzZSBvZiBGMkZT
X1pPTkVEX0hNLCB3ZSBoYXZlIHRoZSBkZXZpY2VzWzFdLgo+Pj4gRG8geW91IG1lYW4gdGhlIGNh
c2Ugd2UgZm9ybWF0IHRoZSBmaWxlc3lzdGVtIGludGVudGlvbmFsbHkgc21hbGxlcgo+Pj4gdGhh
biB3aGF0IGRldmljZXMgaGF2ZT8KPj4KPj4gSSBtZWFuIGJsZXcgY2FzZToKPj4gZGV2aWNlWzBd
OiBjb252ZW50aW9uYWwgZGV2aWNlIHNpemUgPSAxMDI0MCBNQgo+PiBkZXZpY2VbMV06IHpvbmUg
ZGV2aWNlIHNpemUgPSAyIE1CCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+Pj4KPj4+PiBPbiAyMDI0
LzEvMTggNzowMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+IEZyb206IERhZWhvIEplb25nIDxk
YWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+Cj4+Pj4+IE1ha2UgdG8gYWxsb2NhdGUgbG9ncyBh
ZnRlciBjb252ZW50aW9uYWwgYXJlYSBmb3IgSE0gem9uZWQgZGV2aWNlcyB0bwo+Pj4+PiBzcGFy
ZSB0aGVtIGZvciBmaWxlIHBpbm5pbmcgc3VwcG9ydC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAg
ICBta2ZzL2YyZnNfZm9ybWF0LmMgfCAzICsrLQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvbWtm
cy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9mMmZzX2Zvcm1hdC5jCj4+Pj4+IGluZGV4IGYyODQwYzgu
LjkxYTdmNGIgMTAwNjQ0Cj4+Pj4+IC0tLSBhL21rZnMvZjJmc19mb3JtYXQuYwo+Pj4+PiArKysg
Yi9ta2ZzL2YyZnNfZm9ybWF0LmMKPj4+Pj4gQEAgLTU1Nyw3ICs1NTcsOCBAQCBzdGF0aWMgaW50
IGYyZnNfcHJlcGFyZV9zdXBlcl9ibG9jayh2b2lkKQo+Pj4+PiAgICAgICAgICAgICAgICAgYy5j
dXJfc2VnW0NVUlNFR19DT0xEX0RBVEFdID0gMDsKPj4+Pj4gICAgICAgICAgICAgICAgIGMuY3Vy
X3NlZ1tDVVJTRUdfV0FSTV9EQVRBXSA9IG5leHRfem9uZShDVVJTRUdfQ09MRF9EQVRBKTsKPj4+
Pj4gICAgICAgICB9IGVsc2UgaWYgKGMuem9uZWRfbW9kZSkgewo+Pj4+PiAtICAgICAgICAgICAg
IGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdID0gMDsKPj4+Pj4gKyAgICAgICAgICAgICBjLmN1
cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMg
OiAwOwo+Pj4+PiAgICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19XQVJNX05PREVdID0g
bmV4dF96b25lKENVUlNFR19IT1RfTk9ERSk7Cj4+Pj4+ICAgICAgICAgICAgICAgICBjLmN1cl9z
ZWdbQ1VSU0VHX0NPTERfTk9ERV0gPSBuZXh0X3pvbmUoQ1VSU0VHX1dBUk1fTk9ERSk7Cj4+Pj4+
ICAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9EQVRBXSA9IG5leHRfem9uZShD
VVJTRUdfQ09MRF9OT0RFKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
