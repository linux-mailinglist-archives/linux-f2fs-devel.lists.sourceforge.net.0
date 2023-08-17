Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518C77F8D7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Aug 2023 16:26:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWdxM-0002Cj-W5;
	Thu, 17 Aug 2023 14:26:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qWdxL-0002Cd-ET
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 14:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cB9LmRJhvRL4QIgQF8dFH252jqjkZzd7qJF5p+L8imw=; b=jnqSFrE4fxXJIKdAGYp00K4F8Y
 viMoQt5pv5a/wXYo89Y/78EYKAy0VgIHlT8hQP2/K4QLRQVEV4XCphkF5ELH1v63RKGSKsRpORkNb
 YWTq/ijz/7CJJ6HkUEgR76qAcYyWKFQ/fBXyrHRmq7LHBWgvLHggoLMejGKaEiHhMFMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cB9LmRJhvRL4QIgQF8dFH252jqjkZzd7qJF5p+L8imw=; b=Ngm952RLz12rxbehw8IEX/sMEd
 SyiNeuXaBbOSgShBi8wREtf5FKmMgLmPOWdCSsniSzr9+iR8BfWWgGUoLWUss5EszfytKpvtmvFjo
 kyfB7anxinmUAWon5a/dUwsNOghsKdA2M84Rq+371afdTS1cEnH2L1qRot7SxvbjuJxI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qWdxJ-007yOY-KF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 14:26:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C95B62421;
 Thu, 17 Aug 2023 14:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F33FC433C7;
 Thu, 17 Aug 2023 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692282387;
 bh=it65s9ZB6XCiQutHmtMQy+/qlc6EW2LjNIgwj6m/m68=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=oGf86IwyheBf5/4zJkbcFP22Yx8PNwpn89jQ9Trw4Jf34DmhFROuCSgMdad4HZOmq
 4txSvVg/DZaeNgILl5S6UX0Zu/dGNgPxa3eSG7Rwv6FzArYKoah2xkY/scXaFPC5s7
 5HU3XPcXogUKYLBQz2KEh81xAu7spL8bDuqiB7CdDBEZw48XUx/GWblv6yQiiJbg/2
 v1/B7UWoHSEZWzA3Dp/t+p53gxnS+BITtxgRuuaBW+Pnu+5v2vOXmdhvXNNi9txD3f
 fxWWuQpJfLjCU6XvWLVyXi2nD1FPbSYfpsr/CHCdZ8TN7NWRKVAop/WGScyLICDhQ8
 wRzgU/W02QZPw==
Message-ID: <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
Date: Thu, 17 Aug 2023 22:26:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk.kim@gmail.com>, Guenter Roeck <linux@roeck-us.net>
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
X-Spam-Score: -9.2 (---------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/8/17 11:52, Jaegeuk Kim wrote: > On Wed, Aug 16, 2023
    at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote: >> >> On Wed, Aug
   16, 2023 at 10:25:06AM -0700, Jaegeuk Kim wrote: >>> Hi, >>> >>> [...] 
 
 Content analysis details:   (-9.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -4.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qWdxJ-007yOY-KF
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy84LzE3IDExOjUyLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiBXZWQsIEF1ZyAxNiwg
MjAyMyBhdCA3OjEx4oCvUE0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90
ZToKPj4KPj4gT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMTA6MjU6MDZBTSAtMDcwMCwgSmFlZ2V1
ayBLaW0gd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAxMDow
OeKAr1BNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4+Pj4KPj4+
PiBIaSwKPj4+Pgo+Pj4+IHdoZW4gdHJ5aW5nIHRvIGJvb3QgZnJvbSBhbiBmMmZzIGZpbGUgc3lz
dGVtIHdpdGggbG9jayBkZWJ1Z2dpbmcgZW5hYmxlZCwKPj4+PiBJIGdldCB0aGUgYXR0YWNoZWQg
Y2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IHdhcm5pbmcuIElzIHRoaXMgYSBrbm93bgo+Pj4+
IHByb2JsZW0gPwo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+IEd1ZW50ZXIKPj4+Pgo+Pj4+IC0tLQo+
Pj4+IFsgICAxMC4zMTU1MjJdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+Pj4+IFsgICAxMC4zMTU2MjBdIFdBUk5JTkc6IHBvc3NpYmxlIGNp
cmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSBkZXRlY3RlZAo+Pj4+IFsgICAxMC4zMTU3NTNdIDYu
NS4wLXJjNi0wMDAyNy1nOTFhYTZjNDEyZDdmICMxIFRhaW50ZWQ6IEcgICAgICAgICAgICAgICAg
IE4KPj4+PiBbICAgMTAuMzE1ODQzXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiBbICAgMTAuMzE1OTIyXSBzZWVkcm5nLzcxNyBpcyB0
cnlpbmcgdG8gYWNxdWlyZSBsb2NrOgo+Pj4+IFsgICAxMC4zMTYwMTBdIGZmZmY4ZTBlMDJjNmI4
NjggKCZmaS0+aV9zZW0peysuKy59LXszOjN9LCBhdDogZjJmc19hZGRfaW5saW5lX2VudHJ5KzB4
MTM0LzB4MmQwCj4+Pj4gWyAgIDEwLjMxNjMxNV0KPj4+PiBbICAgMTAuMzE2MzE1XSBidXQgdGFz
ayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoKPj4+PiBbICAgMTAuMzE2MzkxXSBmZmZmOGUwZTAy
YzZiMjc4ICgmZmktPmlfeGF0dHJfc2VtKXsuKy4rfS17MzozfSwgYXQ6IGYyZnNfYWRkX2RlbnRy
eSsweDQxLzB4YzAKPj4+PiBbICAgMTAuMzE2NTQzXQo+Pj4+IFsgICAxMC4zMTY1NDNdIHdoaWNo
IGxvY2sgYWxyZWFkeSBkZXBlbmRzIG9uIHRoZSBuZXcgbG9jay4KPj4+PiBbICAgMTAuMzE2NTQz
XQo+Pj4+IFsgICAxMC4zMTY2NDFdCj4+Pj4gWyAgIDEwLjMxNjY0MV0gdGhlIGV4aXN0aW5nIGRl
cGVuZGVuY3kgY2hhaW4gKGluIHJldmVyc2Ugb3JkZXIpIGlzOgo+Pj4+IFsgICAxMC4zMTY3NDVd
Cj4+Pj4gWyAgIDEwLjMxNjc0NV0gLT4gIzEgKCZmaS0+aV94YXR0cl9zZW0pey4rLit9LXszOjN9
Ogo+Pj4+IFsgICAxMC4zMTY4ODNdICAgICAgICBkb3duX3JlYWQrMHgzZC8weDE3MAo+Pj4+IFsg
ICAxMC4zMTY5NzNdICAgICAgICBmMmZzX2dldHhhdHRyKzB4MzcwLzB4NDQwCj4+Pj4gWyAgIDEw
LjMxNzAzNl0gICAgICAgIF9fZjJmc19nZXRfYWNsKzB4MzgvMHgxZTAKPj4+PiBbICAgMTAuMzE3
MDk0XSAgICAgICAgZjJmc19pbml0X2FjbCsweDY5LzB4NDIwCj4+Pj4gWyAgIDEwLjMxNzE1MV0g
ICAgICAgIGYyZnNfaW5pdF9pbm9kZV9tZXRhZGF0YSsweDcyLzB4NDUwCj4+Pj4gWyAgIDEwLjMx
NzIxOF0gICAgICAgIGYyZnNfYWRkX3JlZ3VsYXJfZW50cnkrMHgzNzIvMHg1MTAKPj4+PiBbICAg
MTAuMzE3MjgzXSAgICAgICAgZjJmc19hZGRfZGVudHJ5KzB4YjgvMHhjMAo+Pj4+IFsgICAxMC4z
MTczNDBdICAgICAgICBmMmZzX2RvX2FkZF9saW5rKzB4ZDkvMHgxMTAKPj4+PiBbICAgMTAuMzE3
Mzk5XSAgICAgICAgZjJmc19ta2RpcisweGRmLzB4MTgwCj4+Pj4gWyAgIDEwLjMxNzQ1M10gICAg
ICAgIHZmc19ta2RpcisweDE0Mi8weDIyMAo+Pj4+IFsgICAxMC4zMTc1MDhdICAgICAgICBkb19t
a2RpcmF0KzB4N2MvMHgxMjAKPj4+PiBbICAgMTAuMzE3NTYxXSAgICAgICAgX194NjRfc3lzX21r
ZGlyKzB4NDcvMHg3MAo+Pj4+IFsgICAxMC4zMTc2MTddICAgICAgICBkb19zeXNjYWxsXzY0KzB4
M2YvMHg5MAo+Pj4+IFsgICAxMC4zMTc2NzNdICAgICAgICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVy
X2h3ZnJhbWUrMHg3My8weGRkCj4+Pj4gWyAgIDEwLjMxNzc1N10KPj4+PiBbICAgMTAuMzE3NzU3
XSAtPiAjMCAoJmZpLT5pX3NlbSl7Ky4rLn0tezM6M306Cj4+Pj4gWyAgIDEwLjMxNzg0M10gICAg
ICAgIF9fbG9ja19hY3F1aXJlKzB4MTZiZi8weDI4NjAKPj4+PiBbICAgMTAuMzE3OTA3XSAgICAg
ICAgbG9ja19hY3F1aXJlKzB4Y2MvMHgyYzAKPj4+PiBbICAgMTAuMzE3OTYyXSAgICAgICAgZG93
bl93cml0ZSsweDNhLzB4YzAKPj4+PiBbICAgMTAuMzE4MDE0XSAgICAgICAgZjJmc19hZGRfaW5s
aW5lX2VudHJ5KzB4MTM0LzB4MmQwCj4+Pj4gWyAgIDEwLjMxODA3N10gICAgICAgIGYyZnNfYWRk
X2RlbnRyeSsweDU1LzB4YzAKPj4+PiBbICAgMTAuMzE4MTQxXSAgICAgICAgZjJmc19kb19hZGRf
bGluaysweGQ5LzB4MTEwCj4+Pj4gWyAgIDEwLjMxODIwMV0gICAgICAgIGYyZnNfY3JlYXRlKzB4
ZTgvMHgxNzAKPj4+PiBbICAgMTAuMzE4MjU1XSAgICAgICAgbG9va3VwX29wZW4uaXNyYS4wKzB4
NThlLzB4NmMwCj4+Pj4gWyAgIDEwLjMxODMxN10gICAgICAgIHBhdGhfb3BlbmF0KzB4MmFmLzB4
YTQwCj4+Pj4gWyAgIDEwLjMxODM3Ml0gICAgICAgIGRvX2ZpbHBfb3BlbisweGIxLzB4MTYwCj4+
Pj4gWyAgIDEwLjMxODQyOF0gICAgICAgIGRvX3N5c19vcGVuYXQyKzB4OTEvMHhjMAo+Pj4+IFsg
ICAxMC4zMTg0ODVdICAgICAgICBfX3g2NF9zeXNfb3BlbisweDU0LzB4YTAKPj4+PiBbICAgMTAu
MzE4NTQxXSAgICAgICAgZG9fc3lzY2FsbF82NCsweDNmLzB4OTAKPj4+PiBbICAgMTAuMzE4NTk3
XSAgICAgICAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzMvMHhkZAo+Pj4+IFsg
ICAxMC4zMTg2NzZdCj4+Pj4gWyAgIDEwLjMxODY3Nl0gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhl
bHAgdXMgZGVidWcgdGhpczoKPj4+PiBbICAgMTAuMzE4Njc2XQo+Pj4+IFsgICAxMC4zMTg3OTld
ICBQb3NzaWJsZSB1bnNhZmUgbG9ja2luZyBzY2VuYXJpbzoKPj4+PiBbICAgMTAuMzE4Nzk5XQo+
Pj4+IFsgICAxMC4zMTg4NzVdICAgICAgICBDUFUwICAgICAgICAgICAgICAgICAgICBDUFUxCj4+
Pj4gWyAgIDEwLjMxODkzNV0gICAgICAgIC0tLS0gICAgICAgICAgICAgICAgICAgIC0tLS0KPj4+
PiBbICAgMTAuMzE4OTk5XSAgIHJsb2NrKCZmaS0+aV94YXR0cl9zZW0pOwo+Pj4+IFsgICAxMC4z
MTkwNjhdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZmaS0+aV9zZW0pOwo+
Pj4+IFsgICAxMC4zMTkxNjZdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZm
aS0+aV94YXR0cl9zZW0pOwo+Pj4+IFsgICAxMC4zMTkyNjRdICAgbG9jaygmZmktPmlfc2VtKTsK
Pj4+Cj4+PiBJdCBsb29rcyBsaWtlIHRoZSBzYW1lIG9uZSByZXBvcnRlZCBieSBzeXpib3QuCj4+
PiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9YTQ5NzZjZTk0OWRmNjZi
MWRkZjEKPj4+Cj4+PiBIb3dldmVyLCBJIHN1c3BlY3QgaXQncyBhIGZhbHNlIGFsYXJtLCBzaW5j
ZSBJJ20gaW50ZXJwcmV0aW5nIHRoZSBsb29wIGFzIGJlbG93Lgo+Pj4KPj4+IENQVTAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEKPj4+IGxvY2sobmV3X2lub2Rl
IzEtPmlfeGF0dHJfc2VtKQoKVGhlIGNhbGwgcGF0aCBpcyBhcyBiZWxvdzoKCkNQVTAJCQkJCUNQ
VTEKLSBmMmZzX2NyZWF0ZQogIC0gZjJmc19kb19hZGRfbGluawogICAtIGYyZnNfZG93bl9yZWFk
KCZGMkZTX0koZGlyKS0+aV94YXR0cl9zZW0pOwogICBsb2NrKGRpciMxLT5pX3hhdHRyX3NlbSkK
CQkJCQktIGYyZnNfbWtkaXIKCQkJCQkgLSBmMmZzX2RvX2FkZF9saW5rCgkJCQkJICAtIGYyZnNf
YWRkX3JlZ3VsYXJfZW50cnkKCQkJCQkgICAtIGYyZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2Rl
KS0+aV9zZW0pOwoJCQkJCSAgIGxvY2sobmV3X2Rpcl9pbm9kZS0+aV9zZW0pCgkJCQkJICAgLSBm
MmZzX2luaXRfaW5vZGVfbWV0YWRhdGEKCQkJCQkgICAgLSBfX2YyZnNfZ2V0X2FjbAoJCQkJCSAg
ICAgLSBmMmZzX2dldHhhdHRyCgkJCQkJICAgICAgLSBmMmZzX2Rvd25fcmVhZCgmRjJGU19JKGlu
b2RlKS0+aV94YXR0cl9zZW0pOwoJCQkJCSAgICAgIGxvY2soZGlyIzItPmlfeGF0dHJfc2VtKQoK
ICAgIC0gZjJmc19kb3duX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX3NlbSk7CiAgICBsb2NrKG5l
d19yZWdfaW5vZGUtPmlfc2VtKQoKMS4gaV94YXR0cl9zZW1zIHdlcmUgZnJvbSBkaWZmZXJlbnQg
ZGlyZWN0b3JpZXMsIG90aGVyd2lzZSwgY3JlYXRlIGFuZApta2RpciBtYXkgcmFjZSBvbiBkaXIt
PmlfcndzZW0uCjIuIGZpLT5pX3NlbXMgd2VyZSBmcm9tIGRpZmZlcmVudCB0eXBlIG9mIGlub2Rl
cywgb25lIGlzIHJlZ3VsYXIsIGFuZAphbm90aGVyIGlzIGRpcmVjdG9yeS4KCj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jayhuZXdfaW5v
ZGUjMi0+aV9zZW0pCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbG9jayhkaXItPmlfeGF0dHJfc2VtKQo+Pj4gbG9jayhuZXdfaW5vZGUjMS0+
aV9zZW0pCj4+Pgo+Pj4gVGhpcyBsb29rcyBmaW5lIHRvIG1lLgo+Pj4KPj4KPj4gQmFzZWQgb24g
eW91ciBmZWVkYmFjaywgYW0gSSBjb3JyZWN0IGFzc3VtaW5nIHRoYXQgeW91IGRvbid0IHBsYW4K
Pj4gdG8gZml4IHRoaXMgPwo+IAo+IEknbSBxdWl0ZSBvcGVuIHRvIHNvbWV0aGluZyB0aGF0IEkg
bWF5IG1pc3MuIENoYW8sIHdoYXQgZG8geW91IHRoaW5rPwoKSmFlZ2V1aywgSSBhZ3JlZSB3aXRo
IHlvdSwgaXQgbG9va3MgbGlrZSBhIGZhbHNlIGFsYXJtLgoKVGhhbmtzLAoKPiAKPj4KPj4gVGhh
bmtzLAo+PiBHdWVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
