Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93BA744DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 09:01:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty4eC-00089j-Tb;
	Fri, 28 Mar 2025 08:01:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ty4eB-00089S-5i
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 08:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8VwxNYsqc4w09eRjsayslz+UwZXKfP+CcKY6ThyqlDs=; b=kyh95djn0DndsoUCY60jjXNOLO
 gtcj45TDwU+GLFfFNPgAEtQJHwPqcER/SL5r/trWM/vD/g50DibEfh0p5lIfm50couuVI919gcmbP
 fulHbcGuGx/7Wil9WvnxQe6tX57Mvz5JpaNnL7gzcctiGjemoW3TqVcSH0J72WFElI3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8VwxNYsqc4w09eRjsayslz+UwZXKfP+CcKY6ThyqlDs=; b=C3Px/0LeHS3K5Hk+a3Qq/2wtYu
 LIhzeAa43CrB6oZG0A7Rlgi+pIs+sr4dSH+2vjwgGa8PQMMpfPIQfAGPMdCslx1Xyii6pBIuQCidH
 7R0K01r71OkCYJBC672TAPm8If2ErhEKpg50BeAxDDvuQHacl2wyh7R9zJPaXs2NPd+k=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ty4e5-0006c6-Ru for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 08:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D3FA0614B4;
 Fri, 28 Mar 2025 08:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB0DC4CEE4;
 Fri, 28 Mar 2025 08:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743148842;
 bh=xCqYAAeP8w6huQXbj6gia7kUfO4DTk9Xq0PQkbpFd30=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fYdZJg+HzUBknjpIVfKQdr7A2e9p33w1ZBpwv6nGpqml/CxgPY4rEcgqPSzI6cWkK
 w129rCaTWDoa89Fmv37wW9RWselVMPrbUCzEzw4KO8HZp91XjLL4CUvJ3eyH4TA9G4
 S80YIweMuTa+ZtRylQUdK5zTnxt91QmDxIgYu2/x2ZI0VhQWHN0VI6Lx1tyrMJT/GB
 REZbeJHeOkQ5/gMR6PgClEgGOsCcMMkMgHcSbcCnf43GVhV8xwprdxja8aCgo0rtOT
 Q1LZ2P2OJ4lTBVdZwv3YYb1pIGzEgIHyfFVcpxxwF1WIjHtPAsaUZsac+tho8CFiaU
 kPYu+8SQ/b3GA==
Message-ID: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
Date: Fri, 28 Mar 2025 16:00:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, linux-f2fs-devel@lists.sourceforge.net
References: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
 <20250328072530.2475-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250328072530.2475-1-yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/3/28 15:25, yohan.joung wrote: >> On 2025/3/28 11:40,
    yohan.joung wrote: >>>> From: Chao Yu <chao@kernel.org> >>>> Sent: Thursday,
    March 27, 2025 10:48 PM >>>> To: 정요한(JOUNG YOHAN) Mobil [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.105.4.254 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.105.4.254 listed in bl.score.senderscore.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ty4e5-0006c6-Ru
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS8zLzI4IDE1OjI1LCB5b2hhbi5qb3VuZyB3cm90ZToKPj4gT24gMjAyNS8zLzI4IDEx
OjQwLCB5b2hhbi5qb3VuZyB3cm90ZToKPj4+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAyMDI1IDEwOjQ4IFBNCj4+Pj4gVG86
IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+OyBZ
b2hhbiBKb3VuZwo+Pj4+IDxqeWg0MjlAZ21haWwuY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnOyBk
YWVobzQzQGdtYWlsLmNvbQo+Pj4+IENjOiBjaGFvQGtlcm5lbC5vcmc7IGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC0KPj4+PiBrZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBBRQo+Pj4+IDxwaWxoeXVuLmtpbUBz
ay5jb20+Cj4+Pj4gU3ViamVjdDogW0V4dGVybmFsIE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0g
UmU6IFtFeHRlcm5hbCBNYWlsXSBSZToKPj4+PiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhlIGN1
cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEKPj4+PiB2aWN0aW0gZHVyaW5n
IGdhcmJhZ2UgY29sbGVjdGlvbgo+Pj4+Cj4+Pj4gT24gMjAyNS8zLzI3IDE2OjAwLCB5b2hhbi5q
b3VuZ0Bzay5jb20gd3JvdGU6Cj4+Pj4+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
Cj4+Pj4+PiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjcsIDIwMjUgNDozMCBQTQo+Pj4+Pj4gVG86
IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+OyBZ
b2hhbiBKb3VuZwo+Pj4+Pj4gPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7
IGRhZWhvNDNAZ21haWwuY29tCj4+Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgtCj4+Pj4+PiBrZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBBRQo+Pj4+Pj4gPHBpbGh5
dW4ua2ltQHNrLmNvbT4KPj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVy
bmFsIE1haWxdIFJlOiBbUEFUQ0hdIGYyZnM6Cj4+Pj4+PiBwcmV2ZW50IHRoZSBjdXJyZW50IHNl
Y3Rpb24gZnJvbSBiZWluZyBzZWxlY3RlZCBhcyBhIHZpY3RpbSBkdXJpbmcKPj4+Pj4+IGdhcmJh
Z2UgY29sbGVjdGlvbgo+Pj4+Pj4KPj4+Pj4+IE9uIDMvMjcvMjUgMTQ6NDMsIHlvaGFuLmpvdW5n
QHNrLmNvbSB3cm90ZToKPj4+Pj4+Pj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+
Pj4+Pj4+PiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjcsIDIwMjUgMzowMiBQTQo+Pj4+Pj4+PiBU
bzogWW9oYW4gSm91bmcgPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7Cj4+
Pj4+Pj4+IGRhZWhvNDNAZ21haWwuY29tCj4+Pj4+Pj4+IENjOiBjaGFvQGtlcm5lbC5vcmc7IGxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Owo+Pj4+Pj4+PiBsaW51eC0ga2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUKPj4+
Pj4+Pj4gPHlvaGFuLmpvdW5nQHNrLmNvbT4KPj4+Pj4+Pj4gU3ViamVjdDogW0V4dGVybmFsIE1h
aWxdIFJlOiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhlIGN1cnJlbnQKPj4+Pj4+Pj4gc2VjdGlv
biBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltIGR1cmluZyBnYXJiYWdlIGNvbGxlY3Rp
b24KPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gMy8yNi8yNSAyMjoxNCwgWW9oYW4gSm91bmcgd3JvdGU6
Cj4+Pj4+Pj4+PiBXaGVuIHNlbGVjdGluZyBhIHZpY3RpbSB1c2luZyBuZXh0X3ZpY3RpbV9zZWcg
aW4gYSBsYXJnZQo+Pj4+Pj4+Pj4gc2VjdGlvbiwgdGhlIHNlbGVjdGVkIHNlY3Rpb24gbWlnaHQg
YWxyZWFkeSBoYXZlIGJlZW4gY2xlYXJlZAo+Pj4+Pj4+Pj4gYW5kIGRlc2lnbmF0ZWQgYXMgdGhl
IG5ldyBjdXJyZW50IHNlY3Rpb24sIG1ha2luZyBpdCBhY3RpdmVseSBpbgo+PiB1c2UuCj4+Pj4+
Pj4+PiBUaGlzIGJlaGF2aW9yIGNhdXNlcyBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhlIFNJVCBh
bmQgU1NBLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBIaSwgZG9lcyB0aGlzIGZpeCB5b3VyIGlzc3VlPwo+
Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBpcyBhbiBpc3N1ZSB0aGF0IGFyaXNlcyB3aGVuIGRpdmlkaW5n
IGEgbGFyZ2Ugc2VjdGlvbiBpbnRvCj4+Pj4+Pj4gc2VnbWVudHMgZm9yIGdhcmJhZ2UgY29sbGVj
dGlvbi4KPj4+Pj4+PiBjYXVzZWQgYnkgdGhlIGJhY2tncm91bmQgR0MgKGdhcmJhZ2UgY29sbGVj
dGlvbikgdGhyZWFkIGluIGxhcmdlCj4+Pj4+Pj4gc2VjdGlvbgo+Pj4+Pj4+IGYyZnNfZ2Modmlj
dGltX3NlY3Rpb24pIC0+Cj4+Pj4+Pj4gZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRzKHZpY3Rp
bV9zZWN0aW9uKS0+Cj4+Pj4+Pj4gY3Vyc2VjKHZpY3RpbV9zZWN0aW9uKSAtPiBmMmZzX2djKHZp
Y3RpbV9zZWN0aW9uIGJ5Cj4+Pj4+Pj4gbmV4dF92aWN0aW1fc2VnKQo+Pj4+Pj4KPj4+Pj4+IEkg
ZGlkbid0IGdldCBpdCwgd2h5IGYyZnNfZ2V0X3ZpY3RpbSgpIHdpbGwgcmV0dXJuIHNlY3Rpb24g
d2hpY2ggaXMKPj4+Pj4+IHVzZWQgYnkgY3Vyc2VnPyBJdCBzaG91bGQgYmUgYXZvaWRlZCBieSBj
aGVja2luZyB3LyBzZWNfdXNhZ2VfY2hlY2soKS4KPj4+Pj4+Cj4+Pj4+PiBPciB3ZSBtaXNzZWQg
dG8gY2hlY2sgZ2Npbmcgc2VjdGlvbiB3aGljaCBuZXh0X3ZpY3RpbV9zZWcgcG9pbnRzIHRvCj4+
Pj4+PiBkdXJpbmcgZ2V0X25ld19zZWdtZW50KCk/Cj4+Pj4+Pgo+Pj4+Pj4gQ2FuIHRoaXMgaGFw
cGVuPwo+Pj4+Pj4KPj4+Pj4+IGUuZy4KPj4+Pj4+IC0gYmdnYyBzZWxlY3RzIHNlYyAjMAo+Pj4+
Pj4gLSBuZXh0X3ZpY3RpbV9zZWc6IHNlZyAjMAo+Pj4+Pj4gLSBtaWdyYXRlIHNlZyAjMCBhbmQg
c3RvcAo+Pj4+Pj4gLSBuZXh0X3ZpY3RpbV9zZWc6IHNlZyAjMQo+Pj4+Pj4gLSBjaGVja3BvaW50
LCBzZXQgc2VjICMwIGZyZWUgaWYgc2VjICMwIGhhcyBubyB2YWxpZCBibG9ja3MKPj4+Pj4+IC0g
YWxsb2NhdGUgc2VnICMwIGluIHNlYyAjMCBmb3IgY3Vyc2VnCj4+Pj4+PiAtIGN1cnNlZyBtb3Zl
cyB0byBzZWcgIzEgYWZ0ZXIgYWxsb2NhdGlvbgo+Pj4+Pj4gLSBiZ2djIHRyaWVzIHRvIG1pZ3Jh
dGUgc2VnICMxCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+PiBUaGF0J3MgY29ycmVjdAo+Pj4+
PiBJbiBmMmZzX2dldF92aWN0aW0sIHdlIHVzZSBuZXh0X3ZpY3RpbV9zZWcgdG8gZGlyZWN0bHkg
anVtcCB0bwo+Pj4+PiBnb3RfcmVzdWx0LCB0aGVyZWJ5IGJ5cGFzc2luZyBzZWNfdXNhZ2VfY2hl
Y2sgV2hhdCBkbyB5b3UgdGhpbmsKPj4+Pj4gYWJvdXQgdGhpcyBjaGFuZ2U/Cj4+Pj4+Cj4+Pj4+
IEBAIC04NTAsMTUgKzg1MCwyMCBAQCBpbnQgZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPj4+PiB1bnNpZ25lZCBpbnQgKnJlc3VsdCwKPj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcC5taW5fc2Vnbm8gPSBzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ107
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICpyZXN1bHQgPSBwLm1pbl9zZWdubzsK
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdf
R0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBnb3Rf
cmVzdWx0Owo+Pj4+PiAgICAgICAgICAgICAgICAgICAgfQo+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgaWYgKGdjX3R5cGUgPT0gRkdfR0MgJiYKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10gIT0gTlVMTF9TRUdOTykgewo+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+bmV4dF92
aWN0aW1fc2VnW0ZHX0dDXTsKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3Vs
dCA9IHAubWluX3NlZ25vOwo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5l
eHRfdmljdGltX3NlZ1tGR19HQ10gPSBOVUxMX1NFR05POwo+Pj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICB9Cj4+Pj4+
ICsKPj4+Pj4gKyAgICAgICAgICAgICAgIHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNl
Z25vKTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAgICAgICAgaWYgKHNlY191c2FnZV9jaGVjayhz
YmksIHNlY25vKSkKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4+
PiArCj4+Pj4+ICsgICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4+Pj4+ICAgICAgICAg
ICAgfQo+Pj4+Cj4+Pj4gQnV0IHN0aWxsIGFsbG9jYXRvciBjYW4gYXNzaWduIHRoaXMgc2VnbWVu
dCBhZnRlciBzZWNfdXNhZ2VfY2hlY2soKQo+Pj4+IGluIHJhY2UgY29uZGl0aW9uLCByaWdodD8K
Pj4+IFNpbmNlIHRoZSBCRyBHQyB1c2luZyBuZXh0X3ZpY3RpbSAgdGFrZXMgcGxhY2UgYWZ0ZXIg
dGhlIFNJVCB1cGRhdGUgaW4KPj4+IGRvX2NoZWNrcG9pbnQsIGl0IHNlZW1zIHVubGlrZWx5IHRo
YXQgYSByYWNlIGNvbmRpdGlvbiB3aXRoCj4+IHNlY191c2FnZV9jaGVjayB3aWxsIG9jY3VyLgo+
Pgo+PiBJIG1lYW4gdGhpczoKPj4KPj4gLSBnY190aHJlYWQKPj4gICAgLSBmMmZzX2djCj4+ICAg
ICAtIGYyZnNfZ2V0X3ZpY3RpbQo+PiAgICAgIC0gc2VjX3VzYWdlX2NoZWNrIC0tLSBzZWdubyAj
MSBpcyBub3QgdXNlZCBpbiBhbnkgY3Vyc2Vncwo+PiAJCQkJCS0gZjJmc19hbGxvY2F0ZV9kYXRh
X2Jsb2NrCj4+IAkJCQkJIC0gbmV3X2N1cnNlZwo+PiAJCQkJCSAgLSBnZXRfbmV3X3NlZ21lbnQg
ZmluZCBzZWdubyAjMQo+Pgo+PiAgICAgLSBkb19nYXJiYWdlX2NvbGxlY3QKPj4KPj4gVGhhbmtz
LAo+IAo+IAkJCQkJCSAgZG9fY2hlY2twb2ludCBzZWMwIGZyZWUKPiAJCQkJCQkgIElmIHNlYzAg
aXMgbm90IGZyZWVkLCB0aGVuIHNlZ25vMSB3aXRoaW4gc2VjMCBjYW5ub3QgYmUgYWxsb2NhdGVk
Cj4gLSBnY190aHJlYWQKPiAgICAtIGYyZnNfZ2MKPiAgICAgLSBmMmZzX2dldF92aWN0aW0KPiAg
ICAgIC0gc2VjX3VzYWdlX2NoZWNrICAtLS0gc2Vnbm8gIzEgaXMgbm90IHVzZWQgaW4gYW55IGN1
cnNlZ3MgKGJ1dCBzZWMwIGlzIGFscmVhZHkgdXNlZCkKPiAJCQkJCQkJLSBmMmZzX2FsbG9jYXRl
X2RhdGFfYmxvY2sKPiAJCQkJCQkJLSBuZXdfY3Vyc2VnCj4gCQkJCQkJCS0gZ2V0X25ld19zZWdt
ZW50IGZpbmQgc2Vnbm8gIzEKPiAJCQkJCQo+ICAgICAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+IAo+
IEkgYXBwcmVjaWF0ZSB5b3VyIHBhdGNoLCBpdCBpcyB1bmRlciB0ZXN0aW5nLgo+IGJ1dCBJJ20g
d29uZGVyaW5nIGlmIHRoZXJlJ3MgYSByaXNrIG9mIGEgcmFjZSBjb25kaXRpb24gaW4gdGhpcyBz
aXR1YXRpb24KCk9oLCB5ZXMsIEkgbWF5IG1pc3NlZCB0aGF0IGdldF9uZXdfc2VnbWVudCBjYW4g
cmV0dXJuIGEgZnJlZSBzZWdtZW50IGluCnBhcnRpYWwgdXNlZCBzZWN0aW9uLgoKU28gd2hhdCBk
byB5b3UgdGhpbmsgb2YgdGhpcz8KLSBjaGVjayBDVVJTRUcoKSBpbiBkb19nYXJiYWdlX2NvbGxl
Y3QoKSBhbmQgZ2V0X3ZpY3RpbSgpCi0gcmVzZXQgbmV4dF92aWN0aW1fc2VnW10gaW4gZ2V0X25l
d19zZWdtZW50KCkgYW5kIF9fc2V0X3Rlc3RfYW5kX2ZyZWUoKQpkdXJpbmcgY2hlY2twb2ludC4K
ClRoYW5rcywKCj4gCj4gCj4+Cj4+Pj4KPj4+PiBJTU8sIHdlIGNhbiBjbGVhciBuZXh0X3ZpY3Rp
bV9zZWdbXSBvbmNlIHNlY3Rpb24gaXMgZnJlZSBpbgo+Pj4+IF9fc2V0X3Rlc3RfYW5kX2ZyZWUo
KT8gc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+IEkgd2lsbCB0ZXN0IGl0IGFjY29yZGluZyB0byB5
b3VyIHN1Z2dlc3Rpb24uCj4+PiBJZiB0aGVyZSBhcmUgbm8gaXNzdWVzLCBjYW4gSSBzdWJtaXQg
aXQgYWdhaW4gd2l0aCB0aGUgcGF0Y2g/Cj4+PiBUaGFua3MKPj4+Pgo+Pj4+IC0tLQo+Pj4+ICAg
ICBmcy9mMmZzL3NlZ21lbnQuaCB8IDEzICsrKysrKysrKystLS0KPj4+PiAgICAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zZWdtZW50LmggYi9mcy9mMmZzL3NlZ21lbnQuaCBpbmRleAo+Pj4+IDA0
NjVkYzAwYjM0OS4uODI2ZTM3OTk5MDg1IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVu
dC5oCj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmgKPj4+PiBAQCAtNDczLDkgKzQ3MywxNiBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QKPj4+PiBmMmZz
X3NiX2luZm8gKnNiaSwKPj4+PiAgICAgCQkJZ290byBza2lwX2ZyZWU7Cj4+Pj4gICAgIAkJbmV4
dCA9IGZpbmRfbmV4dF9iaXQoZnJlZV9pLT5mcmVlX3NlZ21hcCwKPj4+PiAgICAgCQkJCXN0YXJ0
X3NlZ25vICsgU0VHU19QRVJfU0VDKHNiaSksIHN0YXJ0X3NlZ25vKTsKPj4+PiAtCQlpZiAobmV4
dCA+PSBzdGFydF9zZWdubyArIHVzYWJsZV9zZWdzKSB7Cj4+Pj4gLQkJCWlmICh0ZXN0X2FuZF9j
bGVhcl9iaXQoc2Vjbm8sIGZyZWVfaS0+ZnJlZV9zZWNtYXApKQo+Pj4+IC0JCQkJZnJlZV9pLT5m
cmVlX3NlY3Rpb25zKys7Cj4+Pj4gKwkJaWYgKChuZXh0ID49IHN0YXJ0X3NlZ25vICsgdXNhYmxl
X3NlZ3MpICYmCj4+Pj4gKwkJCXRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZnJlZV9pLT5mcmVl
X3NlY21hcCkpIHsKPj4+PiArCQkJZnJlZV9pLT5mcmVlX3NlY3Rpb25zKys7Cj4+Pj4gKwo+Pj4+
ICsJCQlpZiAoR0VUX1NFQ19GUk9NX1NFRyhzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ10pID09
Cj4+Pj4gKwkJCQkJCQkJCXNlY25vKQo+Pj4+ICsJCQkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdf
R0NdID0gTlVMTF9TRUdOTzsKPj4+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0
X3ZpY3RpbV9zZWdbRkdfR0NdKSA9PQo+Pj4+ICsJCQkJCQkJCQlzZWNubykKPj4+PiArCQkJCXNi
aS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSA9IE5VTExfU0VHTk87Cj4+Pj4gICAgIAkJfQo+Pj4+
ICAgICAJfQo+Pj4+ICAgICBza2lwX2ZyZWU6Cj4+Pj4gLS0KPj4+PiAyLjQwLjEKPj4+Pgo+Pj4+
Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEJlY2F1c2UgdGhlIGNhbGwgc3RhY2sgaXMgZGlmZmVyZW50LCBJ
IHRoaW5rIHRoYXQgaW4gb3JkZXIgdG8KPj4+Pj4+PiBoYW5kbGUgZXZlcnl0aGluZyBhdCBvbmNl
LCB3ZSBuZWVkIHRvIGFkZHJlc3MgaXQgd2l0aGluCj4+Pj4+Pj4gZG9fZ2FyYmFnZV9jb2xsZWN0
LCBvciBvdGhlcndpc2UgaW5jbHVkZSBpdCBvbiBib3RoIHNpZGVzLgo+Pj4+Pj4+IFdoYXQgZG8g
eW91IHRoaW5rPwo+Pj4+Pj4+Cj4+Pj4+Pj4gWzMwMTQ2LjMzNzQ3MV1bIFQxMzAwXSBGMkZTLWZz
IChkbS01NCk6IEluY29uc2lzdGVudCBzZWdtZW50Cj4+Pj4+Pj4gKDcwOTYxKSB0eXBlIFswLCAx
XSBpbiBTU0EgYW5kIFNJVCBbMzAxNDYuMzQ2MTUxXVsgVDEzMDBdIENhbGwgdHJhY2U6Cj4+Pj4+
Pj4gWzMwMTQ2LjM0NjE1Ml1bIFQxMzAwXSAgZHVtcF9iYWNrdHJhY2UrMHhlOC8weDEwYyBbMzAx
NDYuMzQ2MTU3XVsKPj4+Pj4+PiBUMTMwMF0gIHNob3dfc3RhY2srMHgxOC8weDI4IFszMDE0Ni4z
NDYxNThdWyBUMTMwMF0KPj4+Pj4+PiBkdW1wX3N0YWNrX2x2bCsweDUwLzB4NmMgWzMwMTQ2LjM0
NjE2MV1bIFQxMzAwXQo+Pj4+Pj4+IGR1bXBfc3RhY2srMHgxOC8weDI4IFszMDE0Ni4zNDYxNjJd
WyBUMTMwMF0KPj4+Pj4+PiBmMmZzX3N0b3BfY2hlY2twb2ludCsweDFjLzB4M2MgWzMwMTQ2LjM0
NjE2NV1bIFQxMzAwXQo+Pj4+Pj4+IGRvX2dhcmJhZ2VfY29sbGVjdCsweDQxYy8weDI3MWMgWzMw
MTQ2LjM0NjE2N11bIFQxMzAwXQo+Pj4+Pj4+IGYyZnNfZ2MrMHgyN2MvMHg4MjggWzMwMTQ2LjM0
NjE2OF1bIFQxMzAwXQo+Pj4+Pj4+IGdjX3RocmVhZF9mdW5jKzB4MjkwLzB4ODhjIFszMDE0Ni4z
NDYxNjldWyBUMTMwMF0KPj4+Pj4+PiBrdGhyZWFkKzB4MTFjLzB4MTY0IFszMDE0Ni4zNDYxNzJd
WyBUMTMwMF0KPj4+Pj4+PiByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMAo+Pj4+Pj4+Cj4+Pj4+Pj4g
c3RydWN0IGN1cnNlZ19pbmZvIDogMHhmZmZmZmY4MDNmOTVlODAwIHsKPj4+Pj4+PiAJc2Vnbm8g
ICAgICAgIDogMHgxMTUzMSA6IDcwOTYxCj4+Pj4+Pj4gfQo+Pj4+Pj4+Cj4+Pj4+Pj4gc3RydWN0
IGYyZnNfc2JfaW5mbyA6IDB4ZmZmZmZmODgxMWQxMjAwMCB7Cj4+Pj4+Pj4gCW5leHRfdmljdGlt
X3NlZ1swXSA6IDB4MTE1MzEgOiA3MDk2MSB9Cj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI1MDMyNTA4MDY0Ni4zMjkx
OTQ3LTIKPj4+Pj4+Pj4gLQo+Pj4+Pj4+PiBjaGFvQGtlcm5lbC5vcmcKPj4+Pj4+Pj4KPj4+Pj4+
Pj4gVGhhbmtzLAo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlv
aGFuIEpvdW5nIDx5b2hhbi5qb3VuZ0Bzay5jb20+Cj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+ICAg
ICBmcy9mMmZzL2djLmMgfCA0ICsrKysKPj4+Pj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2Mu
YyBiL2ZzL2YyZnMvZ2MuYyBpbmRleAo+Pj4+Pj4+Pj4gMmI4ZjkyMzliZWRlLi40YjVkMThlMzk1
ZWIgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+Pj4+Pj4+ICsrKyBiL2Zz
L2YyZnMvZ2MuYwo+Pj4+Pj4+Pj4gQEAgLTE5MjYsNiArMTkyNiwxMCBAQCBpbnQgZjJmc19nYyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Pj4+Pj4+PiBzdHJ1Y3QKPj4+Pj4+Pj4gZjJmc19n
Y19jb250cm9sICpnY19jb250cm9sKQo+Pj4+Pj4+Pj4gICAgIAkJZ290byBzdG9wOwo+Pj4+Pj4+
Pj4gICAgIAl9Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gKwlpZiAoX19pc19sYXJnZV9zZWN0aW9uKHNi
aSkgJiYKPj4+Pj4+Pj4+ICsJCQlJU19DVVJTRUMoc2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwg
c2Vnbm8pKSkKPj4+Pj4+Pj4+ICsJCWdvdG8gc3RvcDsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICAg
ICAJc2VnX2ZyZWVkID0gZG9fZ2FyYmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBn
Y190eXBlLAo+Pj4+Pj4+Pj4gICAgIAkJCQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9j
a3MsCj4+Pj4+Pj4+PiAgICAgCQkJCWdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPj4+Pj4+Pgo+Pj4+
Pgo+Pj4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
