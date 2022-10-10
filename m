Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BB75FA111
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Oct 2022 17:22:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ohubd-0001oi-F8;
	Mon, 10 Oct 2022 15:22:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1ohubc-0001ob-K4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 15:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5uwzBQhaS2VUBWEn76TiWwPsIkdGz9QkeeH9965+gM=; b=NGGK7z+K6YVpwgK9mRG9ZjohXo
 /gen8BIjoFnAgmq96jvmxctraHVgZSjU2/8NUWCeUoEk7WBa2CEX11PJ4h7BuP3dUq2ZJcGkTFzfy
 kmklruAYLdAOlGqQqyEkCcqF0U5N49WGRkPR3OwXINIHfaCseMg6wX6XSwnUn7tgSsjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C5uwzBQhaS2VUBWEn76TiWwPsIkdGz9QkeeH9965+gM=; b=NQGExDbyDVsG4pz6rO+n5sPKjS
 sD5F+8aLKXHSnNv3AZIifkzHXB+DbyGB5/m6akS2dGjNFnAAjvqyJHsVW5dhoNzpjZOhPwuL9j3Ro
 eHzRQbZyBTc/BWe1iZk6Qpy1xM8Hj9KZBSjVguPDcbJA6UOzEKc8egN8Bb/zEzoonVXc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ohubb-0005gd-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 15:22:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1780EB80F9B;
 Mon, 10 Oct 2022 15:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC74AC433D6;
 Mon, 10 Oct 2022 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665415323;
 bh=no8M4HUxUtn5Brrmm9/Iz2cSzyV90e+SLK8FcxAraaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R2tYg+5KCSYc6jNCKReLmD6NGukEbLxjOw6Ke9/ZGGzU6X0QkmgPVG7y8QDl5PdDH
 A6/eBBN0s91iP9x57tXd0mgu+JbObaMe679zYY64fKSllcg1Yp9NT5KUKaAWSkxps/
 WQN8v9qzBdTAR5Zwb2sN1xZCjegHDRX/Ck7UkOe0NVV7/N43RVWA1Nz7iPgk0jl6cb
 l2U0A/7uDEXYEnNXCCu37Z8bosr1ZywkOAQpj8qj12dmsQpHIkDda3KkaS+Iy17XXR
 Pvn2BXARrTdcMrMCXuV/xDh7yhRcnMBZIl2BKXEmnmmPHOg4EHte7ZTfQjKGpoqLU6
 mqCUxVAhSe09A==
Date: Mon, 10 Oct 2022 08:22:03 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Alejandro Colomar <alx.manpages@gmail.com>
Message-ID: <Y0Q4m9mj3DUZEkrW@magnolia>
References: <20221004174307.6022-1-ebiggers@kernel.org>
 <26cafc28-e63a-6f13-df70-8ccec85a4ef0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26cafc28-e63a-6f13-df70-8ccec85a4ef0@gmail.com>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Oct 08, 2022 at 03:56:22AM +0200, Alejandro Colomar
 wrote: > Hi Eric, > > On 10/4/22 19:43, Eric Biggers wrote: > > From: Eric
 Biggers <ebiggers@google.com> > > > > Document the STATX_DIOALIGN [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ohubb-0005gd-Gy
Subject: Re: [f2fs-dev] [man-pages PATCH v3] statx.2,
 open.2: document STATX_DIOALIGN
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
Cc: linux-man@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBPY3QgMDgsIDIwMjIgYXQgMDM6NTY6MjJBTSArMDIwMCwgQWxlamFuZHJvIENvbG9t
YXIgd3JvdGU6Cj4gSGkgRXJpYywKPiAKPiBPbiAxMC80LzIyIDE5OjQzLCBFcmljIEJpZ2dlcnMg
d3JvdGU6Cj4gPiBGcm9tOiBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGdvb2dsZS5jb20+Cj4gPiAK
PiA+IERvY3VtZW50IHRoZSBTVEFUWF9ESU9BTElHTiBzdXBwb3J0IGZvciBzdGF0eCgpCj4gPiAo
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9saW51cy83MjU3MzdlN2MyMWQyZDI1KS4KPiA+IAo+ID4g
UmV2aWV3ZWQtYnk6IERhcnJpY2sgSi4gV29uZyA8ZGp3b25nQGtlcm5lbC5vcmc+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGdvb2dsZS5jb20+Cj4gCj4gUGxlYXNl
IHNlZSBzb21lIGZvcm1hdHRpbmcgY29tbWVudHMgYmVsb3cuCj4gCj4gPiAtLS0KPiA+IAo+ID4g
SSdtIHJlc2VuZGluZyB0aGlzIG5vdyB0aGF0IHN1cHBvcnQgZm9yIFNUQVRYX0RJT0FMSUdOIGhh
cyBiZWVuIG1lcmdlZAo+ID4gdXBzdHJlYW0uCj4gCj4gVGhhbmtzLgo+IAo+IENoZWVycywKPiBB
bGV4Cj4gCj4gPiAKPiA+IHYzOiB1cGRhdGVkIG1lbnRpb25zIG9mIExpbnV4IHZlcnNpb24sIGZp
eGVkIHNvbWUgcHVuY3R1YXRpb24sIGFuZCBhZGRlZAo+ID4gICAgICBhIFJldmlld2VkLWJ5Cj4g
PiAKPiA+IHYyOiByZWJhc2VkIG9udG8gbWFuLXBhZ2VzIG1hc3RlciBicmFuY2gsIG1lbnRpb25l
ZCB4ZnMsIGFuZCB1cGRhdGVkCj4gPiAgICAgIGxpbmsgdG8gcGF0Y2hzZXQKPiA+IAo+ID4gICBt
YW4yL29wZW4uMiAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tCj4gPiAgIG1hbjIvc3RhdHguMiB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9tYW4yL29wZW4uMiBiL21hbjIvb3Blbi4yCj4gPiBpbmRl
eCBkZWJhN2U0ZWEuLmI4NjE3ZTBkMiAxMDA2NDQKPiA+IC0tLSBhL21hbjIvb3Blbi4yCj4gPiAr
KysgYi9tYW4yL29wZW4uMgo+ID4gQEAgLTE3MzIsMjEgKzE3MzIsNDIgQEAgb2YgdXNlci1zcGFj
ZSBidWZmZXJzIGFuZCB0aGUgZmlsZSBvZmZzZXQgb2YgSS9Pcy4KPiA+ICAgSW4gTGludXggYWxp
Z25tZW50Cj4gPiAgIHJlc3RyaWN0aW9ucyB2YXJ5IGJ5IGZpbGVzeXN0ZW0gYW5kIGtlcm5lbCB2
ZXJzaW9uIGFuZCBtaWdodCBiZQo+ID4gICBhYnNlbnQgZW50aXJlbHkuCj4gPiAtSG93ZXZlciB0
aGVyZSBpcyBjdXJyZW50bHkgbm8gZmlsZXN5c3RlbVwtaW5kZXBlbmRlbnQKPiA+IC1pbnRlcmZh
Y2UgZm9yIGFuIGFwcGxpY2F0aW9uIHRvIGRpc2NvdmVyIHRoZXNlIHJlc3RyaWN0aW9ucyBmb3Ig
YSBnaXZlbgo+ID4gLWZpbGUgb3IgZmlsZXN5c3RlbS4KPiA+IC1Tb21lIGZpbGVzeXN0ZW1zIHBy
b3ZpZGUgdGhlaXIgb3duIGludGVyZmFjZXMKPiA+IC1mb3IgZG9pbmcgc28sIGZvciBleGFtcGxl
IHRoZQo+ID4gK1RoZSBoYW5kbGluZyBvZiBtaXNhbGlnbmVkCj4gPiArLkIgT19ESVJFQ1QKPiA+
ICtJL09zIGFsc28gdmFyaWVzOyB0aGV5IGNhbiBlaXRoZXIgZmFpbCB3aXRoCj4gPiArLkIgRUlO
VkFMCj4gPiArb3IgZmFsbCBiYWNrIHRvIGJ1ZmZlcmVkIEkvTy4KPiA+ICsuUFAKPiA+ICtTaW5j
ZSBMaW51eCA2LjEsCj4gPiArLkIgT19ESVJFQ1QKPiA+ICtzdXBwb3J0IGFuZCBhbGlnbm1lbnQg
cmVzdHJpY3Rpb25zIGZvciBhIGZpbGUgY2FuIGJlIHF1ZXJpZWQgdXNpbmcKPiA+ICsuQlIgc3Rh
dHggKDIpLAo+ID4gK3VzaW5nIHRoZQo+ID4gKy5CIFNUQVRYX0RJT0FMSUdOCj4gPiArZmxhZy4K
PiA+ICtTdXBwb3J0IGZvcgo+ID4gKy5CIFNUQVRYX0RJT0FMSUdOCj4gPiArdmFyaWVzIGJ5IGZp
bGVzeXN0ZW07IHNlZQo+ID4gKy5CUiBzdGF0eCAoMikuCj4gPiArLlBQCj4gPiArU29tZSBmaWxl
c3lzdGVtcyBwcm92aWRlIHRoZWlyIG93biBpbnRlcmZhY2VzIGZvciBxdWVyeWluZwo+ID4gKy5C
IE9fRElSRUNUCj4gPiArYWxpZ25tZW50IHJlc3RyaWN0aW9ucywgZm9yIGV4YW1wbGUgdGhlCj4g
PiAgIC5CIFhGU19JT0NfRElPSU5GTwo+ID4gICBvcGVyYXRpb24gaW4KPiA+ICAgLkJSIHhmc2N0
bCAoMykuCj4gPiArLkIgU1RBVFhfRElPQUxJR04KPiA+ICtzaG91bGQgYmUgdXNlZCBpbnN0ZWFk
IHdoZW4gaXQgaXMgYXZhaWxhYmxlLgo+ID4gICAuUFAKPiA+IC1VbmRlciBMaW51eCAyLjQsIHRy
YW5zZmVyIHNpemVzLCB0aGUgYWxpZ25tZW50IG9mIHRoZSB1c2VyIGJ1ZmZlciwKPiA+IC1hbmQg
dGhlIGZpbGUgb2Zmc2V0IG11c3QgYWxsIGJlIG11bHRpcGxlcyBvZiB0aGUgbG9naWNhbCBibG9j
ayBzaXplCj4gPiAtb2YgdGhlIGZpbGVzeXN0ZW0uCj4gPiAtU2luY2UgTGludXggMi42LjAsIGFs
aWdubWVudCB0byB0aGUgbG9naWNhbCBibG9jayBzaXplIG9mIHRoZQo+ID4gLXVuZGVybHlpbmcg
c3RvcmFnZSAodHlwaWNhbGx5IDUxMiBieXRlcykgc3VmZmljZXMuCj4gPiAtVGhlIGxvZ2ljYWwg
YmxvY2sgc2l6ZSBjYW4gYmUgZGV0ZXJtaW5lZCB1c2luZyB0aGUKCkknbSBub3Qgc28gZmFtaWxp
YXIgd2l0aCBzZW1hbnRpYyBuZXdsaW5lcy0tIGlzIHRoZXJlIGFuIGF1dG9tYXRlZApyZWZsb3cg
cHJvZ3JhbSB0aGF0IGZpeGVzIHRoZXNlIHByb2JsZW1zIG1lY2hhbmljYWxseSwgb3IgaXMgdGhp
cwpleHBlY3RlZCB0byBiZSBwZXJmb3JtZWQgbWFudWFsbHkgYnkgbWFucGFnZSBhdXRob3JzPwoK
SWYgbWFudWFsbHksIGRvIHRoZSBpdGVtcyBpbiBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0IGNvdW50
IGFzIGNsYXVzZXM/CgpXb3VsZCB0aGUgbmV4dCB0d28gcGFyYWdyYXBocyBvZiB0aGlzIGVtYWls
IHJlZm9ybWF0IGludG8gc2VtYW50aWMKbmV3bGluZXMgbGlrZSBzbz8KCglJbiB0aGUgc291cmNl
IG9mIGEgbWFudWFsIHBhZ2UsCgluZXcgc2VudGVuY2VzIHNob3VsZCAgYmUgc3RhcnRlZCBvbiBu
ZXcgbGluZXMsCglsb25nIHNlbnRlbmNlcyBzaG91bGQgYmUgc3BsaXQgaW50byBsaW5lcyBhdCBj
bGF1c2UgYnJlYWtzCgkoY29tbWFzLCBzZW1pY29sb25zLCBjb2xvbnMsIGFuZCBzbyBvbiksCglh
bmQgbG9uZyBjbGF1c2VzIHNob3VsZCBiZSBzcGxpdCBhdCBwaHJhc2UgYm91bmRhcmllcy4KCVRo
aXMgY29udmVudGlvbiwKCXNvbWV0aW1lcyBrbm93biBhcyAic2VtYW50aWMgbmV3bGluZXMiLAoJ
bWFrZXMgaXQgZWFzaWVyIHRvIHNlZSB0aGUgZWZmZWN0IG9mIHBhdGNoZXMsCgl3aGljaCBvZnRl
biBvcGVyYXRlIGF0IHRoZSBsZXZlbCBvZiBpbmRpdmlkdWFsIHNlbnRlbmNlcywgY2xhdXNlcywg
b3IgcGhyYXNlcy4KCkRvIHdlIHN0aWxsIGxpbmUtd3JhcCBhdCA3Ml5XNzReVzc4Xlc4MCBjb2x1
bW5zPwoKYW5kIHdvdWxkIHRoZSBwcm9wb3NlZCBtYW5wYWdlIHRleHQgcmVhZDoKCglJZiBub25l
IG9mIHRoZSBhYm92ZSBpcyBhdmFpbGFibGUsCgl0aGVuIGRpcmVjdCBJL08gc3VwcG9ydCBhbmQg
YWxpZ25tZW50IHJlc3RyaWN0aW9ucyBjYW4gb25seSBiZSBhc3N1bWVkCglmcm9tIGtub3duIGNo
YXJhY3RlcmlzdGljcyBvZiB0aGUgZmlsZXN5c3RlbSwKCXRoZSBpbmRpdmlkdWFsIGZpbGUsCgl0
aGUgdW5kZXJseWluZyBzdG9yYWdlIGRldmljZShzKSwKCWFuZCB0aGUga2VybmVsIHZlcnNpb24u
CglJbiBMaW51eCAyLjQsCgltb3N0IGJsb2NrIGRldmljZSBiYXNlZCBmaWxlc3lzdGVtcyByZXF1
aXJlIHRoYXQgdGhlIGZpbGUgb2Zmc2V0IGFuZCB0aGUKCWxlbmd0aCBhbmQgbWVtb3J5IGFkZHJl
c3Mgb2YgYWxsIEkvTyBzZWdtZW50cyBiZSBtdWx0aXBsZXMgb2YgdGhlCglmaWxlc3lzdGVtIGJs
b2NrIHNpemUKCSh0eXBpY2FsbHkgNDA5NiBieXRlcykuCglJbiBMaW51eCAyLjYuMCwKCXRoaXMg
d2FzIHJlbGF4ZWQgdG8gdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBvZiB0aGUgYmxvY2sgZGV2aWNl
CgkodHlwaWNhbGx5IDUxMiBieXRlcykuCglBIGJsb2NrIGRldmljZSdzIGxvZ2ljYWwgYmxvY2sg
c2l6ZSBjYW4gYmUgZGV0ZXJtaW5lZCB1c2luZyB0aGUKCS5CUiBpb2N0bCAoMikKCS5CIEJMS1NT
WkdFVAoJb3BlcmF0aW9uIG9yIGZyb20gdGhlIHNoZWxsIHVzaW5nIHRoZSBjb21tYW5kOgoKLS1E
Cgo+ID4gK0lmIG5vbmUgb2YgdGhlIGFib3ZlIGlzIGF2YWlsYWJsZSwgdGhlbiBkaXJlY3QgSS9P
IHN1cHBvcnQgYW5kIGFsaWdubWVudAo+IAo+IFBsZWFzZSB1c2Ugc2VtYW50aWMgbmV3bGluZXMu
Cj4gCj4gU2VlIG1hbi1wYWdlcyg3KToKPiAgICBVc2Ugc2VtYW50aWMgbmV3bGluZXMKPiAgICAg
ICAgSW4gdGhlIHNvdXJjZSBvZiBhIG1hbnVhbCBwYWdlLCBuZXcgc2VudGVuY2VzICBzaG91bGQg
IGJlCj4gICAgICAgIHN0YXJ0ZWQgb24gbmV3IGxpbmVzLCBsb25nIHNlbnRlbmNlcyBzaG91bGQg
YmUgc3BsaXQgaW50bwo+ICAgICAgICBsaW5lcyAgYXQgIGNsYXVzZSBicmVha3MgKGNvbW1hcywg
c2VtaWNvbG9ucywgY29sb25zLCBhbmQKPiAgICAgICAgc28gb24pLCBhbmQgbG9uZyBjbGF1c2Vz
IHNob3VsZCBiZSBzcGxpdCBhdCBwaHJhc2UgYm91bmTigJAKPiAgICAgICAgYXJpZXMuICBUaGlz
IGNvbnZlbnRpb24sICBzb21ldGltZXMgIGtub3duICBhcyAgInNlbWFudGljCj4gICAgICAgIG5l
d2xpbmVzIiwgIG1ha2VzIGl0IGVhc2llciB0byBzZWUgdGhlIGVmZmVjdCBvZiBwYXRjaGVzLAo+
ICAgICAgICB3aGljaCBvZnRlbiBvcGVyYXRlIGF0IHRoZSBsZXZlbCBvZiBpbmRpdmlkdWFsIHNl
bnRlbmNlcywKPiAgICAgICAgY2xhdXNlcywgb3IgcGhyYXNlcy4KPiAKPiAKPiA+ICtyZXN0cmlj
dGlvbnMgY2FuIG9ubHkgYmUgYXNzdW1lZCBmcm9tIGtub3duIGNoYXJhY3RlcmlzdGljcyBvZiB0
aGUgZmlsZXN5c3RlbSwKPiA+ICt0aGUgaW5kaXZpZHVhbCBmaWxlLCB0aGUgdW5kZXJseWluZyBz
dG9yYWdlIGRldmljZShzKSwgYW5kIHRoZSBrZXJuZWwgdmVyc2lvbi4KPiA+ICtJbiBMaW51eCAy
LjQsIG1vc3QgYmxvY2sgZGV2aWNlIGJhc2VkIGZpbGVzeXN0ZW1zIHJlcXVpcmUgdGhhdCB0aGUg
ZmlsZSBvZmZzZXQKPiA+ICthbmQgdGhlIGxlbmd0aCBhbmQgbWVtb3J5IGFkZHJlc3Mgb2YgYWxs
IEkvTyBzZWdtZW50cyBiZSBtdWx0aXBsZXMgb2YgdGhlCj4gPiArZmlsZXN5c3RlbSBibG9jayBz
aXplICh0eXBpY2FsbHkgNDA5NiBieXRlcykuCj4gPiArSW4gTGludXggMi42LjAsIHRoaXMgd2Fz
IHJlbGF4ZWQgdG8gdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBvZiB0aGUgYmxvY2sgZGV2aWNlCj4g
PiArKHR5cGljYWxseSA1MTIgYnl0ZXMpLgo+ID4gK0EgYmxvY2sgZGV2aWNlJ3MgbG9naWNhbCBi
bG9jayBzaXplIGNhbiBiZSBkZXRlcm1pbmVkIHVzaW5nIHRoZQo+ID4gICAuQlIgaW9jdGwgKDIp
Cj4gPiAgIC5CIEJMS1NTWkdFVAo+ID4gICBvcGVyYXRpb24gb3IgZnJvbSB0aGUgc2hlbGwgdXNp
bmcgdGhlIGNvbW1hbmQ6Cj4gPiBkaWZmIC0tZ2l0IGEvbWFuMi9zdGF0eC4yIGIvbWFuMi9zdGF0
eC4yCj4gPiBpbmRleCAwZDFiNDU5MWYuLjUwMzk3MDU3ZCAxMDA2NDQKPiA+IC0tLSBhL21hbjIv
c3RhdHguMgo+ID4gKysrIGIvbWFuMi9zdGF0eC4yCj4gPiBAQCAtNjEsNyArNjEsMTIgQEAgc3Ry
dWN0IHN0YXR4IHsKPiA+ICAgICAgICAgIGNvbnRhaW5pbmcgdGhlIGZpbGVzeXN0ZW0gd2hlcmUg
dGhlIGZpbGUgcmVzaWRlcyAqLwo+ID4gICAgICAgX191MzIgc3R4X2Rldl9tYWpvcjsgICAvKiBN
YWpvciBJRCAqLwo+ID4gICAgICAgX191MzIgc3R4X2Rldl9taW5vcjsgICAvKiBNaW5vciBJRCAq
Lwo+ID4gKwo+ID4gICAgICAgX191NjQgc3R4X21udF9pZDsgICAgICAvKiBNb3VudCBJRCAqLwo+
ID4gKwo+ID4gKyAgICAvKiBEaXJlY3QgSS9PIGFsaWdubWVudCByZXN0cmljdGlvbnMgKi8KPiA+
ICsgICAgX191MzIgc3R4X2Rpb19tZW1fYWxpZ247Cj4gPiArICAgIF9fdTMyIHN0eF9kaW9fb2Zm
c2V0X2FsaWduOwo+ID4gICB9Owo+ID4gICAuRUUKPiA+ICAgLmluCj4gPiBAQCAtMjQ3LDYgKzI1
Miw4IEBAIFNUQVRYX0JUSU1FCVdhbnQgc3R4X2J0aW1lCj4gPiAgIFNUQVRYX0FMTAlUaGUgc2Ft
ZSBhcyBTVEFUWF9CQVNJQ19TVEFUUyB8IFNUQVRYX0JUSU1FLgo+ID4gICAJSXQgaXMgZGVwcmVj
YXRlZCBhbmQgc2hvdWxkIG5vdCBiZSB1c2VkLgo+ID4gICBTVEFUWF9NTlRfSUQJV2FudCBzdHhf
bW50X2lkIChzaW5jZSBMaW51eCA1LjgpCj4gPiArU1RBVFhfRElPQUxJR04JV2FudCBzdHhfZGlv
X21lbV9hbGlnbiBhbmQgc3R4X2Rpb19vZmZzZXRfYWxpZ24KPiA+ICsJKHNpbmNlIExpbnV4IDYu
MTsgc3VwcG9ydCB2YXJpZXMgYnkgZmlsZXN5c3RlbSkKPiA+ICAgLlRFCj4gPiAgIC5pbgo+ID4g
ICAuUFAKPiA+IEBAIC00MDcsNiArNDE0LDI4IEBAIFRoaXMgaXMgdGhlIHNhbWUgbnVtYmVyIHJl
cG9ydGVkIGJ5Cj4gPiAgIC5CUiBuYW1lX3RvX2hhbmRsZV9hdCAoMikKPiA+ICAgYW5kIGNvcnJl
c3BvbmRzIHRvIHRoZSBudW1iZXIgaW4gdGhlIGZpcnN0IGZpZWxkIGluIG9uZSBvZiB0aGUgcmVj
b3JkcyBpbgo+ID4gICAuSVIgL3Byb2Mvc2VsZi9tb3VudGluZm8gLgo+ID4gKy5UUAo+ID4gKy5J
IHN0eF9kaW9fbWVtX2FsaWduCj4gPiArVGhlIGFsaWdubWVudCAoaW4gYnl0ZXMpIHJlcXVpcmVk
IGZvciB1c2VyIG1lbW9yeSBidWZmZXJzIGZvciBkaXJlY3QgSS9PCj4gPiArLkJSICIiICggT19E
SVJFQ1QgKQo+IAo+IC5SQiBhbmQgcmVtb3ZlIHRoZSAiIi4KPiAKPiA+ICtvbiB0aGlzIGZpbGUs
IG9yIDAgaWYgZGlyZWN0IEkvTyBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoaXMgZmlsZS4KPiA+ICsu
SVAKPiA+ICsuQiBTVEFUWF9ESU9BTElHTgo+ID4gKy5JUiAiIiAoIHN0eF9kaW9fbWVtX2FsaWdu
Cj4gCj4gLlJJCj4gCj4gPiArYW5kCj4gPiArLklSIHN0eF9kaW9fb2Zmc2V0X2FsaWduICkKPiA+
ICtpcyBzdXBwb3J0ZWQgb24gYmxvY2sgZGV2aWNlcyBzaW5jZSBMaW51eCA2LjEuCj4gPiArVGhl
IHN1cHBvcnQgb24gcmVndWxhciBmaWxlcyB2YXJpZXMgYnkgZmlsZXN5c3RlbTsgaXQgaXMgc3Vw
cG9ydGVkIGJ5IGV4dDQsCj4gPiArZjJmcywgYW5kIHhmcyBzaW5jZSBMaW51eCA2LjEuCj4gPiAr
LlRQCj4gPiArLkkgc3R4X2Rpb19vZmZzZXRfYWxpZ24KPiA+ICtUaGUgYWxpZ25tZW50IChpbiBi
eXRlcykgcmVxdWlyZWQgZm9yIGZpbGUgb2Zmc2V0cyBhbmQgSS9PIHNlZ21lbnQgbGVuZ3RocyBm
b3IKPiA+ICtkaXJlY3QgSS9PCj4gPiArLkJSICIiICggT19ESVJFQ1QgKQo+ID4gK29uIHRoaXMg
ZmlsZSwgb3IgMCBpZiBkaXJlY3QgSS9PIGlzIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBmaWxlLgo+
ID4gK1RoaXMgd2lsbCBvbmx5IGJlIG5vbnplcm8gaWYKPiA+ICsuSSBzdHhfZGlvX21lbV9hbGln
bgo+ID4gK2lzIG5vbnplcm8sIGFuZCB2aWNlIHZlcnNhLgo+ID4gICAuUFAKPiA+ICAgRm9yIGZ1
cnRoZXIgaW5mb3JtYXRpb24gb24gdGhlIGFib3ZlIGZpZWxkcywgc2VlCj4gPiAgIC5CUiBpbm9k
ZSAoNykuCj4gPiAKPiA+IGJhc2UtY29tbWl0OiBiYzI4ZDI4OWU1MDY2ZmM2MjZkZjI2MGJhZmMy
NDk4NDZhMGY2YWU2Cj4gCj4gLS0gCj4gPGh0dHA6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMv
PgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
