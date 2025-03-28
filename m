Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D672A743D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 07:17:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty31l-0005Ez-OE;
	Fri, 28 Mar 2025 06:17:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ty31j-0005Es-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 06:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1oiq8GGdRXsmD0VlYNcRcPKw45J5/cgyuHFHC8TixQE=; b=CNU8w0A0kSCxw9tnjqEWTuZOnq
 yc+zbpulmMAHiU7o4wmpEl216g2VX2Xg4VVY3u1iq0OgTFfSlVIfcdAa5rbTRz6X0iRQlbJmnqngy
 NeAAad+QHgQWHa5u/4oX2gApFdYZYmJ7Da18VgM+ujts5Ivf3nXKD1jE0GOSBEY5kY+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1oiq8GGdRXsmD0VlYNcRcPKw45J5/cgyuHFHC8TixQE=; b=IMyuoivKpDJ7PASQpYNDk90KwO
 R7ifPNfYXTho0CfXOMvrqZGsxU9bziQj5tyKNNOwg2LHLw48ih/oTtQa57VdlAfOfWhOoTSIWNH4a
 JtJ1h4oF7Ts8xFEwXkHAoYyGyuqv033vnBpnUNrzVGKUUduAcnBZN2u38DVtBY9swsSM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ty31c-0005ph-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 06:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4920B4418F;
 Fri, 28 Mar 2025 06:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B28C4CEE4;
 Fri, 28 Mar 2025 06:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743142618;
 bh=KmB8L29xhnkAFi7N2MBXURQIOrmtjScLsxtvh43qWHg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BqUiU/QHW8EqDyQF9r7FYzhL1bBcNdyv2mf0odnqyHSPzZ39w66CTmkeSwzKmuEv3
 wI96/Y/B+uYpx/WcNJfid/CQCS7Z5m8tzjj/5a+9h8wS/ChYImvK9PLlGwC/wy3Ciq
 lOIjlo0CwgbU4z6Wos4G8HFcri9E+pD0eExkRWLHMyRDf6tuRdhSua2NZduTAZfygI
 gyDjeuQBQfBYbUpfdExLEcZrZ/GfvCrf0AaXvRsB2maT6TYiyHKISZaI+7Ep10tDLy
 IdnlmxZFNGWtqZl33U2HoKDduLTO03c6lhCnnR8t1Qk3pyfGzICAlAv8M8VfNtWDnD
 ziECPJM1XxRAQ==
Message-ID: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
Date: Fri, 28 Mar 2025 14:17:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, linux-f2fs-devel@lists.sourceforge.net
References: <60e763d5-dff4-44a1-9e80-48d384335027@kernel.org>
 <20250328034042.2444-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250328034042.2444-1-yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/3/28 11:40, yohan.joung wrote: >> From: Chao Yu <chao@kernel.org>
    >> Sent: Thursday, March 27, 2025 10:48 PM >> To: 정요한(JOUNG YOHAN)
   Mobile AE <yohan.joung@sk.com>; Yohan Joung >> <jyh42 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
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
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ty31c-0005ph-5Y
Subject: Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH]
 f2fs: prevent the current section from being selected as a victim during
 garbage collection
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org, pilhyun.kim@sk.com,
 jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS8zLzI4IDExOjQwLCB5b2hhbi5qb3VuZyB3cm90ZToKPj4gRnJvbTogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPgo+PiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjcsIDIwMjUgMTA6NDgg
UE0KPj4gVG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bz
ay5jb20+OyBZb2hhbiBKb3VuZwo+PiA8anloNDI5QGdtYWlsLmNvbT47IGphZWdldWtAa2VybmVs
Lm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQo+PiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBBRSA8cGlsaHl1bi5raW1Ac2su
Y29tPgo+PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtFeHRlcm5hbCBNYWlsXSBSZTog
W0V4dGVybmFsIE1haWxdIFJlOgo+PiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhlIGN1cnJlbnQg
c2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltCj4+IGR1cmluZyBnYXJiYWdl
IGNvbGxlY3Rpb24KPj4KPj4gT24gMjAyNS8zLzI3IDE2OjAwLCB5b2hhbi5qb3VuZ0Bzay5jb20g
d3JvdGU6Cj4+Pj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAyNywgMjAyNSA0OjMwIFBNCj4+Pj4gVG86IOygleyalO2VnChKT1VORyBZ
T0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+OyBZb2hhbiBKb3VuZwo+Pj4+IDxq
eWg0MjlAZ21haWwuY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnOyBkYWVobzQzQGdtYWlsLmNvbQo+
Pj4+IENjOiBjaGFvQGtlcm5lbC5vcmc7IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0OyBsaW51eC0KPj4+PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lN
IFBJTEhZVU4pIE1vYmlsZSBBRQo+Pj4+IDxwaWxoeXVuLmtpbUBzay5jb20+Cj4+Pj4gU3ViamVj
dDogW0V4dGVybmFsIE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczoK
Pj4+PiBwcmV2ZW50IHRoZSBjdXJyZW50IHNlY3Rpb24gZnJvbSBiZWluZyBzZWxlY3RlZCBhcyBh
IHZpY3RpbSBkdXJpbmcKPj4+PiBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+Pgo+Pj4+IE9uIDMvMjcv
MjUgMTQ6NDMsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPj4+Pj4+IEZyb206IENoYW8gWXUg
PGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAz
OjAyIFBNCj4+Pj4+PiBUbzogWW9oYW4gSm91bmcgPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVr
QGtlcm5lbC5vcmc7Cj4+Pj4+PiBkYWVobzQzQGdtYWlsLmNvbQo+Pj4+Pj4gQ2M6IGNoYW9Aa2Vy
bmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQo+
Pj4+Pj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2Jp
bGUgQUUKPj4+Pj4+IDx5b2hhbi5qb3VuZ0Bzay5jb20+Cj4+Pj4+PiBTdWJqZWN0OiBbRXh0ZXJu
YWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJldmVudCB0aGUgY3VycmVudAo+Pj4+Pj4gc2Vj
dGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltIGR1cmluZyBnYXJiYWdlIGNvbGxl
Y3Rpb24KPj4+Pj4+Cj4+Pj4+PiBPbiAzLzI2LzI1IDIyOjE0LCBZb2hhbiBKb3VuZyB3cm90ZToK
Pj4+Pj4+PiBXaGVuIHNlbGVjdGluZyBhIHZpY3RpbSB1c2luZyBuZXh0X3ZpY3RpbV9zZWcgaW4g
YSBsYXJnZSBzZWN0aW9uLAo+Pj4+Pj4+IHRoZSBzZWxlY3RlZCBzZWN0aW9uIG1pZ2h0IGFscmVh
ZHkgaGF2ZSBiZWVuIGNsZWFyZWQgYW5kCj4+Pj4+Pj4gZGVzaWduYXRlZCBhcyB0aGUgbmV3IGN1
cnJlbnQgc2VjdGlvbiwgbWFraW5nIGl0IGFjdGl2ZWx5IGluIHVzZS4KPj4+Pj4+PiBUaGlzIGJl
aGF2aW9yIGNhdXNlcyBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhlIFNJVCBhbmQgU1NBLgo+Pj4+
Pj4KPj4+Pj4+IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIgaXNzdWU/Cj4+Pj4+Cj4+Pj4+IFRoaXMg
aXMgYW4gaXNzdWUgdGhhdCBhcmlzZXMgd2hlbiBkaXZpZGluZyBhIGxhcmdlIHNlY3Rpb24gaW50
bwo+Pj4+PiBzZWdtZW50cyBmb3IgZ2FyYmFnZSBjb2xsZWN0aW9uLgo+Pj4+PiBjYXVzZWQgYnkg
dGhlIGJhY2tncm91bmQgR0MgKGdhcmJhZ2UgY29sbGVjdGlvbikgdGhyZWFkIGluIGxhcmdlCj4+
Pj4+IHNlY3Rpb24KPj4+Pj4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbikgLT4KPj4+Pj4gZjJmc19j
bGVhcl9wcmVmcmVlX3NlZ21lbnRzKHZpY3RpbV9zZWN0aW9uKS0+Cj4+Pj4+IGN1cnNlYyh2aWN0
aW1fc2VjdGlvbikgLT4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbiBieSBuZXh0X3ZpY3RpbV9zZWcp
Cj4+Pj4KPj4+PiBJIGRpZG4ndCBnZXQgaXQsIHdoeSBmMmZzX2dldF92aWN0aW0oKSB3aWxsIHJl
dHVybiBzZWN0aW9uIHdoaWNoIGlzCj4+Pj4gdXNlZCBieSBjdXJzZWc/IEl0IHNob3VsZCBiZSBh
dm9pZGVkIGJ5IGNoZWNraW5nIHcvIHNlY191c2FnZV9jaGVjaygpLgo+Pj4+Cj4+Pj4gT3Igd2Ug
bWlzc2VkIHRvIGNoZWNrIGdjaW5nIHNlY3Rpb24gd2hpY2ggbmV4dF92aWN0aW1fc2VnIHBvaW50
cyB0bwo+Pj4+IGR1cmluZyBnZXRfbmV3X3NlZ21lbnQoKT8KPj4+Pgo+Pj4+IENhbiB0aGlzIGhh
cHBlbj8KPj4+Pgo+Pj4+IGUuZy4KPj4+PiAtIGJnZ2Mgc2VsZWN0cyBzZWMgIzAKPj4+PiAtIG5l
eHRfdmljdGltX3NlZzogc2VnICMwCj4+Pj4gLSBtaWdyYXRlIHNlZyAjMCBhbmQgc3RvcAo+Pj4+
IC0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzEKPj4+PiAtIGNoZWNrcG9pbnQsIHNldCBzZWMgIzAg
ZnJlZSBpZiBzZWMgIzAgaGFzIG5vIHZhbGlkIGJsb2Nrcwo+Pj4+IC0gYWxsb2NhdGUgc2VnICMw
IGluIHNlYyAjMCBmb3IgY3Vyc2VnCj4+Pj4gLSBjdXJzZWcgbW92ZXMgdG8gc2VnICMxIGFmdGVy
IGFsbG9jYXRpb24KPj4+PiAtIGJnZ2MgdHJpZXMgdG8gbWlncmF0ZSBzZWcgIzEKPj4+Pgo+Pj4+
IFRoYW5rcywKPj4+IFRoYXQncyBjb3JyZWN0Cj4+PiBJbiBmMmZzX2dldF92aWN0aW0sIHdlIHVz
ZSBuZXh0X3ZpY3RpbV9zZWcgdG8gZGlyZWN0bHkganVtcCB0bwo+Pj4gZ290X3Jlc3VsdCwgdGhl
cmVieSBieXBhc3Npbmcgc2VjX3VzYWdlX2NoZWNrIFdoYXQgZG8geW91IHRoaW5rIGFib3V0Cj4+
PiB0aGlzIGNoYW5nZT8KPj4+Cj4+PiBAQCAtODUwLDE1ICs4NTAsMjAgQEAgaW50IGYyZnNfZ2V0
X3ZpY3RpbShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+IHVuc2lnbmVkIGludCAqcmVzdWx0
LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+bmV4dF92
aWN0aW1fc2VnW0JHX0dDXTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3VsdCA9
IHAubWluX3NlZ25vOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmlj
dGltX3NlZ1tCR19HQ10gPSBOVUxMX1NFR05POwo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
Z290byBnb3RfcmVzdWx0Owo+Pj4gICAgICAgICAgICAgICAgICAgfQo+Pj4gICAgICAgICAgICAg
ICAgICAgaWYgKGdjX3R5cGUgPT0gRkdfR0MgJiYKPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10gIT0gTlVMTF9TRUdOTykgewo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+bmV4dF92aWN0
aW1fc2VnW0ZHX0dDXTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3VsdCA9IHAu
bWluX3NlZ25vOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGlt
X3NlZ1tGR19HQ10gPSBOVUxMX1NFR05POwo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290
byBnb3RfcmVzdWx0Owo+Pj4gICAgICAgICAgICAgICAgICAgfQo+Pj4gKwo+Pj4gKyAgICAgICAg
ICAgICAgIHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKTsKPj4+ICsKPj4+ICsg
ICAgICAgICAgICAgICBpZiAoc2VjX3VzYWdlX2NoZWNrKHNiaSwgc2Vjbm8pKQo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4gKwo+Pj4gKyAgICAgICAgICAgICAgIGdv
dG8gZ290X3Jlc3VsdDsKPj4+ICAgICAgICAgICB9Cj4+Cj4+IEJ1dCBzdGlsbCBhbGxvY2F0b3Ig
Y2FuIGFzc2lnbiB0aGlzIHNlZ21lbnQgYWZ0ZXIgc2VjX3VzYWdlX2NoZWNrKCkgaW4KPj4gcmFj
ZSBjb25kaXRpb24sIHJpZ2h0Pwo+IFNpbmNlIHRoZSBCRyBHQyB1c2luZyBuZXh0X3ZpY3RpbSAg
dGFrZXMgcGxhY2UgYWZ0ZXIgdGhlIFNJVCB1cGRhdGUgaW4gZG9fY2hlY2twb2ludCwKPiBpdCBz
ZWVtcyB1bmxpa2VseSB0aGF0IGEgcmFjZSBjb25kaXRpb24gd2l0aCBzZWNfdXNhZ2VfY2hlY2sg
d2lsbCBvY2N1ci4KCkkgbWVhbiB0aGlzOgoKLSBnY190aHJlYWQKICAtIGYyZnNfZ2MKICAgLSBm
MmZzX2dldF92aWN0aW0KICAgIC0gc2VjX3VzYWdlX2NoZWNrIC0tLSBzZWdubyAjMSBpcyBub3Qg
dXNlZCBpbiBhbnkgY3Vyc2VncwoJCQkJCS0gZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrCgkJCQkJ
IC0gbmV3X2N1cnNlZwoJCQkJCSAgLSBnZXRfbmV3X3NlZ21lbnQgZmluZCBzZWdubyAjMQoJCQkJ
CQogICAtIGRvX2dhcmJhZ2VfY29sbGVjdAoKVGhhbmtzLAoKPj4KPj4gSU1PLCB3ZSBjYW4gY2xl
YXIgbmV4dF92aWN0aW1fc2VnW10gb25jZSBzZWN0aW9uIGlzIGZyZWUgaW4KPj4gX19zZXRfdGVz
dF9hbmRfZnJlZSgpPyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IEkgd2lsbCB0ZXN0IGl0IGFjY29y
ZGluZyB0byB5b3VyIHN1Z2dlc3Rpb24uCj4gSWYgdGhlcmUgYXJlIG5vIGlzc3VlcywgY2FuIEkg
c3VibWl0IGl0IGFnYWluIHdpdGggdGhlIHBhdGNoPwo+IFRoYW5rcwo+Pgo+PiAtLS0KPj4gICAg
ZnMvZjJmcy9zZWdtZW50LmggfCAxMyArKysrKysrKysrLS0tCj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9zZWdtZW50LmggYi9mcy9mMmZzL3NlZ21lbnQuaCBpbmRleAo+PiAwNDY1ZGMwMGIzNDku
LjgyNmUzNzk5OTA4NSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmgKPj4gKysrIGIv
ZnMvZjJmcy9zZWdtZW50LmgKPj4gQEAgLTQ3Myw5ICs0NzMsMTYgQEAgc3RhdGljIGlubGluZSB2
b2lkIF9fc2V0X3Rlc3RfYW5kX2ZyZWUoc3RydWN0Cj4+IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiAg
ICAJCQlnb3RvIHNraXBfZnJlZTsKPj4gICAgCQluZXh0ID0gZmluZF9uZXh0X2JpdChmcmVlX2kt
PmZyZWVfc2VnbWFwLAo+PiAgICAJCQkJc3RhcnRfc2Vnbm8gKyBTRUdTX1BFUl9TRUMoc2JpKSwg
c3RhcnRfc2Vnbm8pOwo+PiAtCQlpZiAobmV4dCA+PSBzdGFydF9zZWdubyArIHVzYWJsZV9zZWdz
KSB7Cj4+IC0JCQlpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBmcmVlX2ktPmZyZWVfc2Vj
bWFwKSkKPj4gLQkJCQlmcmVlX2ktPmZyZWVfc2VjdGlvbnMrKzsKPj4gKwkJaWYgKChuZXh0ID49
IHN0YXJ0X3NlZ25vICsgdXNhYmxlX3NlZ3MpICYmCj4+ICsJCQl0ZXN0X2FuZF9jbGVhcl9iaXQo
c2Vjbm8sIGZyZWVfaS0+ZnJlZV9zZWNtYXApKSB7Cj4+ICsJCQlmcmVlX2ktPmZyZWVfc2VjdGlv
bnMrKzsKPj4gKwo+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3RpbV9z
ZWdbQkdfR0NdKSA9PQo+PiArCQkJCQkJCQkJc2Vjbm8pCj4+ICsJCQkJc2JpLT5uZXh0X3ZpY3Rp
bV9zZWdbQkdfR0NdID0gTlVMTF9TRUdOTzsKPj4gKwkJCWlmIChHRVRfU0VDX0ZST01fU0VHKHNi
aS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSkgPT0KPj4gKwkJCQkJCQkJCXNlY25vKQo+PiArCQkJ
CXNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSA9IE5VTExfU0VHTk87Cj4+ICAgIAkJfQo+PiAg
ICAJfQo+PiAgICBza2lwX2ZyZWU6Cj4+IC0tCj4+IDIuNDAuMQo+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+
IEJlY2F1c2UgdGhlIGNhbGwgc3RhY2sgaXMgZGlmZmVyZW50LCBJIHRoaW5rIHRoYXQgaW4gb3Jk
ZXIgdG8gaGFuZGxlCj4+Pj4+IGV2ZXJ5dGhpbmcgYXQgb25jZSwgd2UgbmVlZCB0byBhZGRyZXNz
IGl0IHdpdGhpbiBkb19nYXJiYWdlX2NvbGxlY3QsCj4+Pj4+IG9yIG90aGVyd2lzZSBpbmNsdWRl
IGl0IG9uIGJvdGggc2lkZXMuCj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rPwo+Pj4+Pgo+Pj4+PiBb
MzAxNDYuMzM3NDcxXVsgVDEzMDBdIEYyRlMtZnMgKGRtLTU0KTogSW5jb25zaXN0ZW50IHNlZ21l
bnQgKDcwOTYxKQo+Pj4+PiB0eXBlIFswLCAxXSBpbiBTU0EgYW5kIFNJVCBbMzAxNDYuMzQ2MTUx
XVsgVDEzMDBdIENhbGwgdHJhY2U6Cj4+Pj4+IFszMDE0Ni4zNDYxNTJdWyBUMTMwMF0gIGR1bXBf
YmFja3RyYWNlKzB4ZTgvMHgxMGMgWzMwMTQ2LjM0NjE1N11bCj4+Pj4+IFQxMzAwXSAgc2hvd19z
dGFjaysweDE4LzB4MjggWzMwMTQ2LjM0NjE1OF1bIFQxMzAwXQo+Pj4+PiBkdW1wX3N0YWNrX2x2
bCsweDUwLzB4NmMgWzMwMTQ2LjM0NjE2MV1bIFQxMzAwXQo+Pj4+PiBkdW1wX3N0YWNrKzB4MTgv
MHgyOCBbMzAxNDYuMzQ2MTYyXVsgVDEzMDBdCj4+Pj4+IGYyZnNfc3RvcF9jaGVja3BvaW50KzB4
MWMvMHgzYyBbMzAxNDYuMzQ2MTY1XVsgVDEzMDBdCj4+Pj4+IGRvX2dhcmJhZ2VfY29sbGVjdCsw
eDQxYy8weDI3MWMgWzMwMTQ2LjM0NjE2N11bIFQxMzAwXQo+Pj4+PiBmMmZzX2djKzB4MjdjLzB4
ODI4IFszMDE0Ni4zNDYxNjhdWyBUMTMwMF0KPj4+Pj4gZ2NfdGhyZWFkX2Z1bmMrMHgyOTAvMHg4
OGMgWzMwMTQ2LjM0NjE2OV1bIFQxMzAwXQo+Pj4+PiBrdGhyZWFkKzB4MTFjLzB4MTY0IFszMDE0
Ni4zNDYxNzJdWyBUMTMwMF0KPj4+Pj4gcmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPj4+Pj4KPj4+
Pj4gc3RydWN0IGN1cnNlZ19pbmZvIDogMHhmZmZmZmY4MDNmOTVlODAwIHsKPj4+Pj4gCXNlZ25v
ICAgICAgICA6IDB4MTE1MzEgOiA3MDk2MQo+Pj4+PiB9Cj4+Pj4+Cj4+Pj4+IHN0cnVjdCBmMmZz
X3NiX2luZm8gOiAweGZmZmZmZjg4MTFkMTIwMDAgewo+Pj4+PiAJbmV4dF92aWN0aW1fc2VnWzBd
IDogMHgxMTUzMSA6IDcwOTYxIH0KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUwMzI1MDgwNjQ2LjMyOTE5NDctMi0KPj4+Pj4+
IGNoYW9Aa2VybmVsLm9yZwo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4KPj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZb2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPgo+Pj4+
Pj4+IC0tLQo+Pj4+Pj4+ICAgIGZzL2YyZnMvZ2MuYyB8IDQgKysrKwo+Pj4+Pj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMgaW5kZXgKPj4+Pj4+PiAyYjhmOTIzOWJlZGUuLjRi
NWQxOGUzOTVlYiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+Pj4+PiArKysg
Yi9mcy9mMmZzL2djLmMKPj4+Pj4+PiBAQCAtMTkyNiw2ICsxOTI2LDEwIEBAIGludCBmMmZzX2dj
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+PiBzdHJ1Y3QKPj4+Pj4+IGYyZnNfZ2Nf
Y29udHJvbCAqZ2NfY29udHJvbCkKPj4+Pj4+PiAgICAJCWdvdG8gc3RvcDsKPj4+Pj4+PiAgICAJ
fQo+Pj4+Pj4+Cj4+Pj4+Pj4gKwlpZiAoX19pc19sYXJnZV9zZWN0aW9uKHNiaSkgJiYKPj4+Pj4+
PiArCQkJSVNfQ1VSU0VDKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKSkpCj4+Pj4+
Pj4gKwkJZ290byBzdG9wOwo+Pj4+Pj4+ICsKPj4+Pj4+PiAgICAJc2VnX2ZyZWVkID0gZG9fZ2Fy
YmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBnY190eXBlLAo+Pj4+Pj4+ICAgIAkJ
CQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsCj4+Pj4+Pj4gICAgCQkJCWdjX2Nv
bnRyb2wtPm9uZV90aW1lKTsKPj4+Pj4KPj4+Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
