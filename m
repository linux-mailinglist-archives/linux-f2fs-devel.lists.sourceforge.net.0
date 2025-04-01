Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C860A7740A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Apr 2025 07:42:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzUNx-0008SR-Bc;
	Tue, 01 Apr 2025 05:42:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tzUNw-0008SL-Dc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 05:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EKLS6TjAQvYa+aSVNOyWewYgLHpmW2861x/NK5u+R0=; b=fSuvck511XFo6WFq7f/M6tCfhM
 kPXtRegthOXlxeXBgOyO9atkiTw+ZqjQ0vn91RnoWLehE1JjhrOwgRIFEbILfT01+LrOX82I97Vzk
 XfjReqvps7kB02mmSupaqAQ6g55Vp0t3lux3MSjqskz6zYS/TnE7s0hnhOyc7Ia9XBok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3EKLS6TjAQvYa+aSVNOyWewYgLHpmW2861x/NK5u+R0=; b=kn8ehAydiiohpZZjsepoSJxV2G
 6mJ8m/wG7Vga3NR0QWPLc4YSeh1cCgeCxIkspGrTALRyCYoEzhqgWM3LjQR1VhvU4/ZVUdN0JMzeE
 m3LCsrrX9b4ALp7Hy0msayKKXQ+/ptyAj6uozcPv/k83jze8+t/GXHTrdi//H6Bzf0gs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzUNg-0003vN-86 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 05:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5989343709;
 Tue,  1 Apr 2025 05:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B84C4CEE8;
 Tue,  1 Apr 2025 05:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743486102;
 bh=z0lL2q4b3nhCAuAi9j1j/VMO5HBo7ishDcuz8ITm6jY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=n5BqjdEKq7ol2vFlO5UcldosAYc5xCJqINb+0OEr+fJBe4ALHs0aWKEI0fY7uNGDV
 8ruom+ZCgqtPl05Nqa7iSeFP5d9LaDznWTujCfayCnEHt8Mu3F0kmlxQGE6BAg2u9N
 Fe2IzpKkM0Kkvnhsh2J0UaSHNadVBh7WnE7Yp+lnKbMhLXfqLbP1KxK0kX5vlEfMZ2
 gFsiJBkIHggz07mzYTsiOPW0furGyNgsmHUJcHPfi9QVpurOVJjHGRUU2fcFuuJYc1
 lf01U54zPJvzoUFfNHMpQnbwiT6ts8/q8pw6ivC9ngzyPH6lQ1F6Z96hZxEf3S/5zp
 Z6/MVtofxr0qw==
Message-ID: <78f1965e-679c-42cc-abdb-c3ba51f6ffab@kernel.org>
Date: Tue, 1 Apr 2025 13:41:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, linux-f2fs-devel@lists.sourceforge.net
References: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
 <20250401015156.2623-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250401015156.2623-1-yohan.joung@sk.com>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 4/1/25 09:51, yohan.joung wrote: >> From: Chao Yu <chao@kernel.org>
    >> Sent: Monday, March 31, 2025 8:36 PM >> To: 정요한(JOUNG YOHAN) Mobile
    AE <yohan.joung@sk.com>; linux-f2fs- >> devel@lists. [...] 
 
 Content analysis details:   (-1.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.234.252.31 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tzUNg-0003vN-86
Subject: Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [External
 Mail] Re: [PATCH] f2fs: prevent the current section from being selected as
 a victim during garbage collection
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: pilhyun.kim@sk.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 jyh429@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8xLzI1IDA5OjUxLCB5b2hhbi5qb3VuZyB3cm90ZToKPj4gRnJvbTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+PiBTZW50OiBNb25kYXksIE1hcmNoIDMxLCAyMDI1IDg6MzYgUE0KPj4g
VG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+
OyBsaW51eC1mMmZzLQo+PiBkZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gQ2M6IGNoYW9A
a2VybmVsLm9yZzsgamFlZ2V1a0BrZXJuZWwub3JnOyBqeWg0MjlAZ21haWwuY29tOyBsaW51eC0K
Pj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg6rmA7ZWE7ZiEKEtJTSBQSUxIWVVOKSBNb2JpbGUg
QUUgPHBpbGh5dW4ua2ltQHNrLmNvbT4KPj4gU3ViamVjdDogW0V4dGVybmFsIE1haWxdIFJlOiBb
RXh0ZXJuYWwgTWFpbF0gUmU6IFtmMmZzLWRldl0gW0V4dGVybmFsIE1haWxdCj4+IFJlOiBbRXh0
ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJldmVudCB0aGUgY3VycmVudCBzZWN0aW9u
IGZyb20KPj4gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJhZ2UgY29sbGVj
dGlvbgo+Pgo+PiBPbiAzLzMxLzI1IDEzOjEzLCB5b2hhbi5qb3VuZyB3cm90ZToKPj4+PiBPbiAy
MDI1LzMvMjggMTU6MjUsIHlvaGFuLmpvdW5nIHdyb3RlOgo+Pj4+Pj4gT24gMjAyNS8zLzI4IDEx
OjQwLCB5b2hhbi5qb3VuZyB3cm90ZToKPj4+Pj4+Pj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgo+Pj4+Pj4+PiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjcsIDIwMjUgMTA6NDggUE0K
Pj4+Pj4+Pj4gVG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3Vu
Z0Bzay5jb20+OyBZb2hhbiBKb3VuZwo+Pj4+Pj4+PiA8anloNDI5QGdtYWlsLmNvbT47IGphZWdl
dWtAa2VybmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPj4+Pj4+Pj4gQ2M6IGNoYW9Aa2VybmVs
Lm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4+Pj4+Pj4+IGxp
bnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmls
ZSBBRQo+Pj4+Pj4+PiA8cGlsaHl1bi5raW1Ac2suY29tPgo+Pj4+Pj4+PiBTdWJqZWN0OiBbRXh0
ZXJuYWwgTWFpbF0gUmU6IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVybmFsIE1haWxdIFJlOgo+
Pj4+Pj4+PiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhlIGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJl
aW5nIHNlbGVjdGVkIGFzCj4+Pj4+Pj4+IGEgdmljdGltIGR1cmluZyBnYXJiYWdlIGNvbGxlY3Rp
b24KPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gMjAyNS8zLzI3IDE2OjAwLCB5b2hhbi5qb3VuZ0Bzay5j
b20gd3JvdGU6Cj4+Pj4+Pj4+Pj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+
Pj4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSA0OjMwIFBNCj4+Pj4+Pj4+Pj4g
VG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+
OyBZb2hhbgo+Pj4+Pj4+Pj4+IEpvdW5nIDxqeWg0MjlAZ21haWwuY29tPjsgamFlZ2V1a0BrZXJu
ZWwub3JnOyBkYWVobzQzQGdtYWlsLmNvbQo+Pj4+Pj4+Pj4+IENjOiBjaGFvQGtlcm5lbC5vcmc7
IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Owo+Pj4+Pj4+Pj4+IGxpbnV4
LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBB
RQo+Pj4+Pj4+Pj4+IDxwaWxoeXVuLmtpbUBzay5jb20+Cj4+Pj4+Pj4+Pj4gU3ViamVjdDogW0V4
dGVybmFsIE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczoKPj4+Pj4+
Pj4+PiBwcmV2ZW50IHRoZSBjdXJyZW50IHNlY3Rpb24gZnJvbSBiZWluZyBzZWxlY3RlZCBhcyBh
IHZpY3RpbQo+Pj4+Pj4+Pj4+IGR1cmluZyBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+IE9uIDMvMjcvMjUgMTQ6NDMsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPj4+
Pj4+Pj4+Pj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+Pj4+Pj4+IFNl
bnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAzOjAyIFBNCj4+Pj4+Pj4+Pj4+PiBUbzogWW9o
YW4gSm91bmcgPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7Cj4+Pj4+Pj4+
Pj4+PiBkYWVobzQzQGdtYWlsLmNvbQo+Pj4+Pj4+Pj4+Pj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsg
bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4+Pj4+Pj4+Pj4+PiBsaW51
eC0ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUg
QUUKPj4+Pj4+Pj4+Pj4+IDx5b2hhbi5qb3VuZ0Bzay5jb20+Cj4+Pj4+Pj4+Pj4+PiBTdWJqZWN0
OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJldmVudCB0aGUKPj4+Pj4+Pj4+
Pj4+IGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltIGR1cmlu
Zwo+Pj4+Pj4+Pj4+Pj4gZ2FyYmFnZSBjb2xsZWN0aW9uCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4gT24gMy8yNi8yNSAyMjoxNCwgWW9oYW4gSm91bmcgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4gV2hl
biBzZWxlY3RpbmcgYSB2aWN0aW0gdXNpbmcgbmV4dF92aWN0aW1fc2VnIGluIGEgbGFyZ2UKPj4+
Pj4+Pj4+Pj4+PiBzZWN0aW9uLCB0aGUgc2VsZWN0ZWQgc2VjdGlvbiBtaWdodCBhbHJlYWR5IGhh
dmUgYmVlbgo+Pj4+Pj4+Pj4+Pj4+IGNsZWFyZWQgYW5kIGRlc2lnbmF0ZWQgYXMgdGhlIG5ldyBj
dXJyZW50IHNlY3Rpb24sIG1ha2luZyBpdAo+Pj4+Pj4+Pj4+Pj4+IGFjdGl2ZWx5IGluCj4+Pj4+
PiB1c2UuCj4+Pj4+Pj4+Pj4+Pj4gVGhpcyBiZWhhdmlvciBjYXVzZXMgaW5jb25zaXN0ZW5jeSBi
ZXR3ZWVuIHRoZSBTSVQgYW5kIFNTQS4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBIaSwgZG9l
cyB0aGlzIGZpeCB5b3VyIGlzc3VlPwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGlzIGlzIGFu
IGlzc3VlIHRoYXQgYXJpc2VzIHdoZW4gZGl2aWRpbmcgYSBsYXJnZSBzZWN0aW9uCj4+Pj4+Pj4+
Pj4+IGludG8gc2VnbWVudHMgZm9yIGdhcmJhZ2UgY29sbGVjdGlvbi4KPj4+Pj4+Pj4+Pj4gY2F1
c2VkIGJ5IHRoZSBiYWNrZ3JvdW5kIEdDIChnYXJiYWdlIGNvbGxlY3Rpb24pIHRocmVhZCBpbgo+
Pj4+Pj4+Pj4+PiBsYXJnZSBzZWN0aW9uCj4+Pj4+Pj4+Pj4+IGYyZnNfZ2ModmljdGltX3NlY3Rp
b24pIC0+Cj4+Pj4+Pj4+Pj4+IGYyZnNfY2xlYXJfcHJlZnJlZV9zZWdtZW50cyh2aWN0aW1fc2Vj
dGlvbiktPgo+Pj4+Pj4+Pj4+PiBjdXJzZWModmljdGltX3NlY3Rpb24pIC0+IGYyZnNfZ2Modmlj
dGltX3NlY3Rpb24gYnkKPj4+Pj4+Pj4+Pj4gbmV4dF92aWN0aW1fc2VnKQo+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4gSSBkaWRuJ3QgZ2V0IGl0LCB3aHkgZjJmc19nZXRfdmljdGltKCkgd2lsbCByZXR1
cm4gc2VjdGlvbgo+Pj4+Pj4+Pj4+IHdoaWNoIGlzIHVzZWQgYnkgY3Vyc2VnPyBJdCBzaG91bGQg
YmUgYXZvaWRlZCBieSBjaGVja2luZyB3Lwo+Pj4+IHNlY191c2FnZV9jaGVjaygpLgo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gT3Igd2UgbWlzc2VkIHRvIGNoZWNrIGdjaW5nIHNlY3Rpb24gd2hpY2gg
bmV4dF92aWN0aW1fc2VnCj4+Pj4+Pj4+Pj4gcG9pbnRzIHRvIGR1cmluZyBnZXRfbmV3X3NlZ21l
bnQoKT8KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IENhbiB0aGlzIGhhcHBlbj8KPj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+IGUuZy4KPj4+Pj4+Pj4+PiAtIGJnZ2Mgc2VsZWN0cyBzZWMgIzAKPj4+Pj4+Pj4+
PiAtIG5leHRfdmljdGltX3NlZzogc2VnICMwCj4+Pj4+Pj4+Pj4gLSBtaWdyYXRlIHNlZyAjMCBh
bmQgc3RvcAo+Pj4+Pj4+Pj4+IC0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzEKPj4+Pj4+Pj4+PiAt
IGNoZWNrcG9pbnQsIHNldCBzZWMgIzAgZnJlZSBpZiBzZWMgIzAgaGFzIG5vIHZhbGlkIGJsb2Nr
cwo+Pj4+Pj4+Pj4+IC0gYWxsb2NhdGUgc2VnICMwIGluIHNlYyAjMCBmb3IgY3Vyc2VnCj4+Pj4+
Pj4+Pj4gLSBjdXJzZWcgbW92ZXMgdG8gc2VnICMxIGFmdGVyIGFsbG9jYXRpb24KPj4+Pj4+Pj4+
PiAtIGJnZ2MgdHJpZXMgdG8gbWlncmF0ZSBzZWcgIzEKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRo
YW5rcywKPj4+Pj4+Pj4+IFRoYXQncyBjb3JyZWN0Cj4+Pj4+Pj4+PiBJbiBmMmZzX2dldF92aWN0
aW0sIHdlIHVzZSBuZXh0X3ZpY3RpbV9zZWcgdG8gZGlyZWN0bHkganVtcCB0bwo+Pj4+Pj4+Pj4g
Z290X3Jlc3VsdCwgdGhlcmVieSBieXBhc3Npbmcgc2VjX3VzYWdlX2NoZWNrIFdoYXQgZG8geW91
IHRoaW5rCj4+Pj4+Pj4+PiBhYm91dCB0aGlzIGNoYW5nZT8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBA
QCAtODUwLDE1ICs4NTAsMjAgQEAgaW50IGYyZnNfZ2V0X3ZpY3RpbShzdHJ1Y3QgZjJmc19zYl9p
bmZvCj4+Pj4+Pj4+PiAqc2JpLAo+Pj4+Pj4+PiB1bnNpZ25lZCBpbnQgKnJlc3VsdCwKPj4+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAubWluX3NlZ25vID0gc2JpLT5uZXh0X3Zp
Y3RpbV9zZWdbQkdfR0NdOwo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJl
c3VsdCA9IHAubWluX3NlZ25vOwo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4+Pj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZ290X3Jlc3VsdDsKPj4+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICB9Cj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgaWYgKGdjX3R5cGUgPT0gRkdf
R0MgJiYKPj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5u
ZXh0X3ZpY3RpbV9zZWdbRkdfR0NdCj4+Pj4+Pj4+PiAhPSBOVUxMX1NFR05PKQo+Pj4+IHsKPj4+
Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAubWluX3NlZ25vID0gc2JpLT5uZXh0
X3ZpY3RpbV9zZWdbRkdfR0NdOwo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
KnJlc3VsdCA9IHAubWluX3NlZ25vOwo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4+Pj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZ290X3Jlc3VsdDsKPj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICB9Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgc2Vjbm8g
PSBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgIGlmIChzZWNfdXNhZ2VfY2hlY2soc2JpLCBzZWNubykpCj4+Pj4+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiAr
ICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0Owo+Pj4+Pj4+Pj4gICAgICAgICAgICB9Cj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IEJ1dCBzdGlsbCBhbGxvY2F0b3IgY2FuIGFzc2lnbiB0aGlzIHNlZ21l
bnQgYWZ0ZXIKPj4+Pj4+Pj4gc2VjX3VzYWdlX2NoZWNrKCkgaW4gcmFjZSBjb25kaXRpb24sIHJp
Z2h0Pwo+Pj4+Pj4+IFNpbmNlIHRoZSBCRyBHQyB1c2luZyBuZXh0X3ZpY3RpbSAgdGFrZXMgcGxh
Y2UgYWZ0ZXIgdGhlIFNJVAo+Pj4+Pj4+IHVwZGF0ZSBpbiBkb19jaGVja3BvaW50LCBpdCBzZWVt
cyB1bmxpa2VseSB0aGF0IGEgcmFjZSBjb25kaXRpb24KPj4+Pj4+PiB3aXRoCj4+Pj4+PiBzZWNf
dXNhZ2VfY2hlY2sgd2lsbCBvY2N1ci4KPj4+Pj4+Cj4+Pj4+PiBJIG1lYW4gdGhpczoKPj4+Pj4+
Cj4+Pj4+PiAtIGdjX3RocmVhZAo+Pj4+Pj4gICAgLSBmMmZzX2djCj4+Pj4+PiAgICAgLSBmMmZz
X2dldF92aWN0aW0KPj4+Pj4+ICAgICAgLSBzZWNfdXNhZ2VfY2hlY2sgLS0tIHNlZ25vICMxIGlz
IG5vdCB1c2VkIGluIGFueSBjdXJzZWdzCj4+Pj4+PiAJCQkJCS0gZjJmc19hbGxvY2F0ZV9kYXRh
X2Jsb2NrCj4+Pj4+PiAJCQkJCSAtIG5ld19jdXJzZWcKPj4+Pj4+IAkJCQkJICAtIGdldF9uZXdf
c2VnbWVudCBmaW5kIHNlZ25vICMxCj4+Pj4+Pgo+Pj4+Pj4gICAgIC0gZG9fZ2FyYmFnZV9jb2xs
ZWN0Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+PiAJCQkJCQkgIGRvX2NoZWNrcG9p
bnQgc2VjMCBmcmVlCj4+Pj4+IAkJCQkJCSAgSWYgc2VjMCBpcyBub3QgZnJlZWQsIHRoZW4KPj4+
PiBzZWdubzEgd2l0aGluIHNlYzAgY2Fubm90IGJlCj4+Pj4+IGFsbG9jYXRlZAo+Pj4+PiAtIGdj
X3RocmVhZAo+Pj4+PiAgICAtIGYyZnNfZ2MKPj4+Pj4gICAgIC0gZjJmc19nZXRfdmljdGltCj4+
Pj4+ICAgICAgLSBzZWNfdXNhZ2VfY2hlY2sgIC0tLSBzZWdubyAjMSBpcyBub3QgdXNlZCBpbiBh
bnkgY3Vyc2VncyAoYnV0Cj4+Pj4+IHNlYzAKPj4+PiBpcyBhbHJlYWR5IHVzZWQpCj4+Pj4+IAkJ
CQkJCQktIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jawo+Pj4+PiAJCQkJCQkJLSBuZXdfY3Vyc2Vn
Cj4+Pj4+IAkJCQkJCQktIGdldF9uZXdfc2VnbWVudCBmaW5kCj4+Pj4gc2Vnbm8gIzEKPj4+Pj4K
Pj4+Pj4gICAgIC0gZG9fZ2FyYmFnZV9jb2xsZWN0Cj4+Pj4+Cj4+Pj4+IEkgYXBwcmVjaWF0ZSB5
b3VyIHBhdGNoLCBpdCBpcyB1bmRlciB0ZXN0aW5nLgo+Pj4+PiBidXQgSSdtIHdvbmRlcmluZyBp
ZiB0aGVyZSdzIGEgcmlzayBvZiBhIHJhY2UgY29uZGl0aW9uIGluIHRoaXMKPj4+Pj4gc2l0dWF0
aW9uCj4+Pj4KPj4+PiBPaCwgeWVzLCBJIG1heSBtaXNzZWQgdGhhdCBnZXRfbmV3X3NlZ21lbnQg
Y2FuIHJldHVybiBhIGZyZWUgc2VnbWVudAo+Pj4+IGluIHBhcnRpYWwgdXNlZCBzZWN0aW9uLgo+
Pj4+Cj4+Pj4gU28gd2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcz8KPj4+PiAtIGNoZWNrIENVUlNF
RygpIGluIGRvX2dhcmJhZ2VfY29sbGVjdCgpIGFuZCBnZXRfdmljdGltKCkKPj4+PiAtIHJlc2V0
IG5leHRfdmljdGltX3NlZ1tdIGluIGdldF9uZXdfc2VnbWVudCgpIGFuZAo+Pj4+IF9fc2V0X3Rl
c3RfYW5kX2ZyZWUoKSBkdXJpbmcgY2hlY2twb2ludC4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Cj4+
PiBIb3cgYWJvdXQgdXNpbmcgdmljdGltX3NlY21hcD8KPj4+IGdjX3RocmVhZAo+Pj4gCQkJCW11
dGV4X2xvY2soJkRJUlRZX0koc2JpKS0+c2VnbGlzdF9sb2NrKTsKPj4+IAkJCQlfX3NldF90ZXN0
X2FuZF9mcmVlCj4+PiAJCQkJY2hlY2sgY3VyIHNlY3Rpb24gbmV4dF92aWN0aW0gY2xlYXIKPj4+
IAkJCQltdXRleF91bmxvY2soJmRpcnR5X2ktPnNlZ2xpc3RfbG9jayk7Cj4+Pgo+Pj4gbXV0ZXhf
bG9jaygmZGlydHktPnNlZ2xpc3RfbG9jayk7Cj4+PiBmMmZzX2dldF92aWN0aW0KPj4+IG11dGV4
X3VubG9jaygmZGlydHlfaS0+c2VnbGlzdF9sb2NrKTsKPj4+Cj4+PiBzdGF0aWMgaW5saW5lIHZv
aWQgX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiAgICAg
ICAgICAgICAgICAgaWYgKG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2Vncykgewo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZnJl
ZV9pLT5mcmVlX3NlY21hcCkpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZy
ZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+Pj4gKwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZGlydHlfaS0+dmljdGltX3NlY21hcCkpCj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0JH
X0dDXSA9Cj4+PiArIE5VTExfU0VHTk87Cj4+Cj4+IENhbiB0aGlzIGhhcHBlbj8KPj4KPj4gc2Vn
c19wZXJfc2VjPTIKPj4KPj4gLSBzZWcjMCBhbmQgc2VnIzEgYXJlIGFsbCBkaXJ0eQo+PiAtIGFs
bCB2YWxpZCBibG9ja3MgYXJlIHJlbW92ZWQgaW4gc2VnIzEKPj4gLSBjaGVja3BvaW50IC0+IHNl
ZyMxIGJlY29tZXMgZnJlZQo+PiAtIGdjIHNlbGVjdCB0aGlzIHNlYyBhbmQgbmV4dF92aWN0aW1f
c2VnPXNlZyMwCj4+IC0gbWlncmF0ZSBzZWcjMCwgbmV4dF92aWN0aW1fc2VnPXNlZyMxCj4+IC0g
YWxsb2NhdG9yIGFzc2lnbnMgc2VnIzEgdG8gY3Vyc2VnCj4+IC0gZ2MgdHJpZXMgdG8gbWlncmF0
ZSBzZWcjMQoKSSBtZWFudCBmb3IgYWJvdmUgY2FzZSwgYmVsb3cgY2hhbmdlIHN0aWxsIGNhbiBu
b3QgY2F0Y2ggaXQsIHJpZ2h0PyBzaW5jZQpuZXh0X3ZpY3RpbV9zZWdbXSB3YXMgYXNzaWduZWQg
YWZ0ZXIgY2hlY2twb2ludC4KCisJaWYgKHRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZGlydHlf
aS0+dmljdGltX3NlY21hcCkpCisJCXNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dDXSA9IE5VTExf
U0VHTk87CgpUaGFua3MsCgo+Pgo+PiBUaGFua3MsCj4gVGhlIGRldGFpbGVkIHNjZW5hcmlvCj4g
c2Vnc19wZXJfc2VjPTIKPiAtIHNlZyMwIGFuZCBzZWcjMSBhcmUgYWxsIGRpcnR5Cj4gLSBhbGwg
dmFsaWQgYmxvY2tzIGFyZSByZW1vdmVkIGluIHNlZyMxCj4gLSBnYyBzZWxlY3QgdGhpcyBzZWMg
YW5kIG5leHRfdmljdGltX3NlZz1zZWcjMAo+IC0gbWlncmF0ZSBzZWcjMCwgbmV4dF92aWN0aW1f
c2VnPXNlZyMxCj4gLSBjaGVja3BvaW50IC0+IHNlYyhzZWcjMCwgc2VnIzEpICBiZWNvbWVzIGZy
ZWUKPiAtIGFsbG9jYXRvciBhc3NpZ25zIHNlYyhzZWcjMCwgc2VnIzEpIHRvIGN1cnNlZwo+IC0g
Z2MgdHJpZXMgdG8gbWlncmF0ZSBzZWcjMQo+Pgo+Pj4gICAgICAgICAgICAgICAgIH0KPj4+ICAg
ICAgICAgfQo+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJTU8sIHdl
IGNhbiBjbGVhciBuZXh0X3ZpY3RpbV9zZWdbXSBvbmNlIHNlY3Rpb24gaXMgZnJlZSBpbgo+Pj4+
Pj4+PiBfX3NldF90ZXN0X2FuZF9mcmVlKCk/IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4+Pj4g
SSB3aWxsIHRlc3QgaXQgYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbi4KPj4+Pj4+PiBJZiB0
aGVyZSBhcmUgbm8gaXNzdWVzLCBjYW4gSSBzdWJtaXQgaXQgYWdhaW4gd2l0aCB0aGUgcGF0Y2g/
Cj4+Pj4+Pj4gVGhhbmtzCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgICAgZnMvZjJm
cy9zZWdtZW50LmggfCAxMyArKysrKysrKysrLS0tCj4+Pj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmggaW5kZXgKPj4+
Pj4+Pj4gMDQ2NWRjMDBiMzQ5Li44MjZlMzc5OTkwODUgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2Zz
L2YyZnMvc2VnbWVudC5oCj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5oCj4+Pj4+Pj4+
IEBAIC00NzMsOSArNDczLDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZAo+Pj4+Pj4+PiBfX3NldF90
ZXN0X2FuZF9mcmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+Pj4gICAgIAkJCWdv
dG8gc2tpcF9mcmVlOwo+Pj4+Pj4+PiAgICAgCQluZXh0ID0gZmluZF9uZXh0X2JpdChmcmVlX2kt
PmZyZWVfc2VnbWFwLAo+Pj4+Pj4+PiAgICAgCQkJCXN0YXJ0X3NlZ25vICsgU0VHU19QRVJfU0VD
KHNiaSksCj4+Pj4gc3RhcnRfc2Vnbm8pOwo+Pj4+Pj4+PiAtCQlpZiAobmV4dCA+PSBzdGFydF9z
ZWdubyArIHVzYWJsZV9zZWdzKSB7Cj4+Pj4+Pj4+IC0JCQlpZiAodGVzdF9hbmRfY2xlYXJfYml0
KHNlY25vLCBmcmVlX2ktCj4+PiBmcmVlX3NlY21hcCkpCj4+Pj4+Pj4+IC0JCQkJZnJlZV9pLT5m
cmVlX3NlY3Rpb25zKys7Cj4+Pj4+Pj4+ICsJCWlmICgobmV4dCA+PSBzdGFydF9zZWdubyArIHVz
YWJsZV9zZWdzKSAmJgo+Pj4+Pj4+PiArCQkJdGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBmcmVl
X2ktPmZyZWVfc2VjbWFwKSkKPj4gewo+Pj4+Pj4+PiArCQkJZnJlZV9pLT5mcmVlX3NlY3Rpb25z
Kys7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKwkJCWlmIChHRVRfU0VDX0ZST01fU0VHKHNiaS0+bmV4
dF92aWN0aW1fc2VnW0JHX0dDXSkKPj4gPT0KPj4+Pj4+Pj4gKwkJCQkJCQkJCXNlY25vKQo+Pj4+
Pj4+PiArCQkJCXNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dDXSA9IE5VTExfU0VHTk87Cj4+Pj4+
Pj4+ICsJCQlpZiAoR0VUX1NFQ19GUk9NX1NFRyhzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10p
Cj4+ID09Cj4+Pj4+Pj4+ICsJCQkJCQkJCQlzZWNubykKPj4+Pj4+Pj4gKwkJCQlzYmktPm5leHRf
dmljdGltX3NlZ1tGR19HQ10gPSBOVUxMX1NFR05POwo+Pj4+Pj4+PiAgICAgCQl9Cj4+Pj4+Pj4+
ICAgICAJfQo+Pj4+Pj4+PiAgICAgc2tpcF9mcmVlOgo+Pj4+Pj4+PiAtLQo+Pj4+Pj4+PiAyLjQw
LjEKPj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBCZWNhdXNlIHRo
ZSBjYWxsIHN0YWNrIGlzIGRpZmZlcmVudCwgSSB0aGluayB0aGF0IGluIG9yZGVyIHRvCj4+Pj4+
Pj4+Pj4+IGhhbmRsZSBldmVyeXRoaW5nIGF0IG9uY2UsIHdlIG5lZWQgdG8gYWRkcmVzcyBpdCB3
aXRoaW4KPj4+Pj4+Pj4+Pj4gZG9fZ2FyYmFnZV9jb2xsZWN0LCBvciBvdGhlcndpc2UgaW5jbHVk
ZSBpdCBvbiBib3RoIHNpZGVzLgo+Pj4+Pj4+Pj4+PiBXaGF0IGRvIHlvdSB0aGluaz8KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gWzMwMTQ2LjMzNzQ3MV1bIFQxMzAwXSBGMkZTLWZzIChkbS01NCk6
IEluY29uc2lzdGVudCBzZWdtZW50Cj4+Pj4+Pj4+Pj4+ICg3MDk2MSkgdHlwZSBbMCwgMV0gaW4g
U1NBIGFuZCBTSVQgWzMwMTQ2LjM0NjE1MV1bIFQxMzAwXSBDYWxsCj4+Pj4gdHJhY2U6Cj4+Pj4+
Pj4+Pj4+IFszMDE0Ni4zNDYxNTJdWyBUMTMwMF0gIGR1bXBfYmFja3RyYWNlKzB4ZTgvMHgxMGMK
Pj4+Pj4+Pj4+Pj4gWzMwMTQ2LjM0NjE1N11bIFQxMzAwXSAgc2hvd19zdGFjaysweDE4LzB4Mjgg
WzMwMTQ2LjM0NjE1OF1bCj4+Pj4+Pj4+Pj4+IFQxMzAwXSBkdW1wX3N0YWNrX2x2bCsweDUwLzB4
NmMgWzMwMTQ2LjM0NjE2MV1bIFQxMzAwXQo+Pj4+Pj4+Pj4+PiBkdW1wX3N0YWNrKzB4MTgvMHgy
OCBbMzAxNDYuMzQ2MTYyXVsgVDEzMDBdCj4+Pj4+Pj4+Pj4+IGYyZnNfc3RvcF9jaGVja3BvaW50
KzB4MWMvMHgzYyBbMzAxNDYuMzQ2MTY1XVsgVDEzMDBdCj4+Pj4+Pj4+Pj4+IGRvX2dhcmJhZ2Vf
Y29sbGVjdCsweDQxYy8weDI3MWMgWzMwMTQ2LjM0NjE2N11bIFQxMzAwXQo+Pj4+Pj4+Pj4+PiBm
MmZzX2djKzB4MjdjLzB4ODI4IFszMDE0Ni4zNDYxNjhdWyBUMTMwMF0KPj4+Pj4+Pj4+Pj4gZ2Nf
dGhyZWFkX2Z1bmMrMHgyOTAvMHg4OGMgWzMwMTQ2LjM0NjE2OV1bIFQxMzAwXQo+Pj4+Pj4+Pj4+
PiBrdGhyZWFkKzB4MTFjLzB4MTY0IFszMDE0Ni4zNDYxNzJdWyBUMTMwMF0KPj4+Pj4+Pj4+Pj4g
cmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gc3RydWN0IGN1
cnNlZ19pbmZvIDogMHhmZmZmZmY4MDNmOTVlODAwIHsKPj4+Pj4+Pj4+Pj4gCXNlZ25vICAgICAg
ICA6IDB4MTE1MzEgOiA3MDk2MQo+Pj4+Pj4+Pj4+PiB9Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
IHN0cnVjdCBmMmZzX3NiX2luZm8gOiAweGZmZmZmZjg4MTFkMTIwMDAgewo+Pj4+Pj4+Pj4+PiAJ
bmV4dF92aWN0aW1fc2VnWzBdIDogMHgxMTUzMSA6IDcwOTYxIH0KPj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRl
dmVsLzIwMjUwMzI1MDgwNjQ2LjMyOTE5Cj4+Pj4+Pj4+Pj4+PiA0Nwo+Pj4+Pj4+Pj4+Pj4gLTIK
Pj4+Pj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4+Pj4+IGNoYW9Aa2VybmVsLm9yZwo+Pj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZb2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPgo+Pj4+
Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+ICAgICBmcy9mMmZzL2djLmMgfCA0ICsrKysKPj4+
Pj4+Pj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2Mu
YyBpbmRleAo+Pj4+Pj4+Pj4+Pj4+IDJiOGY5MjM5YmVkZS4uNGI1ZDE4ZTM5NWViIDEwMDY0NAo+
Pj4+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4+Pj4+Pj4+ICsrKyBiL2ZzL2Yy
ZnMvZ2MuYwo+Pj4+Pj4+Pj4+Pj4+IEBAIC0xOTI2LDYgKzE5MjYsMTAgQEAgaW50IGYyZnNfZ2Mo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4+Pj4+Pj4+Pj4+IHN0cnVjdAo+Pj4+Pj4+Pj4+
Pj4gZjJmc19nY19jb250cm9sICpnY19jb250cm9sKQo+Pj4+Pj4+Pj4+Pj4+ICAgICAJCWdvdG8g
c3RvcDsKPj4+Pj4+Pj4+Pj4+PiAgICAgCX0KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+ICsJ
aWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYmCj4+Pj4+Pj4+Pj4+Pj4gKwkJCUlTX0NVUlNF
QyhzYmksIEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdubykpKQo+Pj4+Pj4+Pj4+Pj4+ICsJCWdv
dG8gc3RvcDsKPj4+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+Pj4gICAgIAlzZWdfZnJlZWQgPSBk
b19nYXJiYWdlX2NvbGxlY3Qoc2JpLCBzZWdubywgJmdjX2xpc3QsCj4+IGdjX3R5cGUsCj4+Pj4+
Pj4+Pj4+Pj4gICAgIAkJCQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsCj4+Pj4+
Pj4+Pj4+Pj4gICAgIAkJCQlnY19jb250cm9sLT5vbmVfdGltZSk7Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Cj4gCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
