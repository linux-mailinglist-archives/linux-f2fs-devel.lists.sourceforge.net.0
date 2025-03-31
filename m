Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB43A7650A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 13:36:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzDRO-0006in-Nc;
	Mon, 31 Mar 2025 11:36:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tzDRN-0006id-Jp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 11:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ov10SZyETArKLuFCdwOquR/qSXCpF7yOWFUw5tKE3A=; b=X4iv1sngi65ad8EXHLbWa0e+dE
 Gj4frVPz1LY4o62ASGrAnVHdkQ8Tow0ytJVvnEG8NUtIEKXYHJu58LRH14rKadSlLOIEviwyxVtkA
 NQfxuei8KnwpIzdWZIUmmmQNL+IVO3u3dMb3g1aucWYIFL0oxlpY8Hff5/nsJ79wIsrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3ov10SZyETArKLuFCdwOquR/qSXCpF7yOWFUw5tKE3A=; b=Z5x3EWvmRpiPv6iWF/NMZhLnGr
 SKw6TBnXoRQ+DEwaaLWQ65Nnr+rDVuEKq+ZRLLdO7KaDwJ4ZrIlGQPDo0lmvkOO8xejKjo3FVGchA
 Lr8j4hng6Jj90bu8hTYPZ84djaE/p4k5z5VEwC9RiqeiAkukiH8+DwjRfmnwUt6dPzuA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzDRC-0004U9-N6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 11:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA8CA434E7;
 Mon, 31 Mar 2025 11:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAC8C4CEE5;
 Mon, 31 Mar 2025 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743420973;
 bh=IRFmzHZa5lhPHHiYNz8oSv/Pz2F5YpZFGhKTA+VYUQo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Eq5gbsBEXh2+fcBX6d4MPBtyDWjkatMHWgBxegds4t0eoSo0W1aDNg+JJ9iZTG5+y
 gT/O0sJL7FcUmTEBsF2flhgG9WyXJWgUePcQg0fl2rqmH8ekQFB1ZZzkyCPC9NGUda
 TKDOqzQBTJyKwqeADhx4FrtwuS944ikFJTb+j1GYqscYo3biTuLmcwxO7sUDGOU13g
 ldfJKSdjz+1UtLs3uB1ILGdnihpgQ02UMY1liOVQRPOJ72wBbqdiZr17gWUdD2XHVM
 yXakafHzRjVB+VWG/SxvEzDsUrTpqlxnOWavU1UL5sQadxaaq8olA8s3Xj+1AeGCyX
 tfubHyYilUJlA==
Message-ID: <3f5c26c0-f44c-4639-a636-8c01c22405f6@kernel.org>
Date: Mon, 31 Mar 2025 19:36:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, linux-f2fs-devel@lists.sourceforge.net
References: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
 <20250331051402.2595-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250331051402.2595-1-yohan.joung@sk.com>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/31/25 13:13, yohan.joung wrote: >> On 2025/3/28 15:25, 
 yohan.joung wrote: >>>> On 2025/3/28 11:40, yohan.joung wrote: >>>>>> From:
 Chao Yu <chao@kernel.org> >>>>>> Sent: Thursday, March 27, 2025 [...] 
 Content analysis details:   (-1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tzDRC-0004U9-N6
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

T24gMy8zMS8yNSAxMzoxMywgeW9oYW4uam91bmcgd3JvdGU6Cj4+IE9uIDIwMjUvMy8yOCAxNToy
NSwgeW9oYW4uam91bmcgd3JvdGU6Cj4+Pj4gT24gMjAyNS8zLzI4IDExOjQwLCB5b2hhbi5qb3Vu
ZyB3cm90ZToKPj4+Pj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+IFNl
bnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAxMDo0OCBQTQo+Pj4+Pj4gVG86IOygleyalO2V
nChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+OyBZb2hhbiBKb3Vu
Zwo+Pj4+Pj4gPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7IGRhZWhvNDNA
Z21haWwuY29tCj4+Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgtCj4+Pj4+PiBrZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBBRQo+Pj4+Pj4gPHBpbGh5dW4ua2ltQHNr
LmNvbT4KPj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVybmFsIE1haWxd
IFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6Cj4+Pj4+PiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhl
IGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEKPj4+Pj4+IHZpY3RpbSBk
dXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uCj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNS8zLzI3IDE2OjAw
LCB5b2hhbi5qb3VuZ0Bzay5jb20gd3JvdGU6Cj4+Pj4+Pj4+IEZyb206IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4KPj4+Pj4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAyMDI1IDQ6MzAg
UE0KPj4+Pj4+Pj4gVG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5q
b3VuZ0Bzay5jb20+OyBZb2hhbiBKb3VuZwo+Pj4+Pj4+PiA8anloNDI5QGdtYWlsLmNvbT47IGph
ZWdldWtAa2VybmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPj4+Pj4+Pj4gQ2M6IGNoYW9Aa2Vy
bmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4+Pj4+Pj4+
IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1v
YmlsZSBBRQo+Pj4+Pj4+PiA8cGlsaHl1bi5raW1Ac2suY29tPgo+Pj4+Pj4+PiBTdWJqZWN0OiBb
RXh0ZXJuYWwgTWFpbF0gUmU6IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZzOgo+Pj4+
Pj4+PiBwcmV2ZW50IHRoZSBjdXJyZW50IHNlY3Rpb24gZnJvbSBiZWluZyBzZWxlY3RlZCBhcyBh
IHZpY3RpbQo+Pj4+Pj4+PiBkdXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uCj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IE9uIDMvMjcvMjUgMTQ6NDMsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPj4+Pj4+Pj4+
PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4+Pj4gU2VudDogVGh1cnNk
YXksIE1hcmNoIDI3LCAyMDI1IDM6MDIgUE0KPj4+Pj4+Pj4+PiBUbzogWW9oYW4gSm91bmcgPGp5
aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7Cj4+Pj4+Pj4+Pj4gZGFlaG80M0Bn
bWFpbC5jb20KPj4+Pj4+Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsKPj4+Pj4+Pj4+PiBsaW51eC0ga2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUKPj4+Pj4+Pj4+PiA8eW9o
YW4uam91bmdAc2suY29tPgo+Pj4+Pj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTog
W1BBVENIXSBmMmZzOiBwcmV2ZW50IHRoZSBjdXJyZW50Cj4+Pj4+Pj4+Pj4gc2VjdGlvbiBmcm9t
IGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltIGR1cmluZyBnYXJiYWdlCj4+Pj4+Pj4+Pj4gY29s
bGVjdGlvbgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gT24gMy8yNi8yNSAyMjoxNCwgWW9oYW4gSm91
bmcgd3JvdGU6Cj4+Pj4+Pj4+Pj4+IFdoZW4gc2VsZWN0aW5nIGEgdmljdGltIHVzaW5nIG5leHRf
dmljdGltX3NlZyBpbiBhIGxhcmdlCj4+Pj4+Pj4+Pj4+IHNlY3Rpb24sIHRoZSBzZWxlY3RlZCBz
ZWN0aW9uIG1pZ2h0IGFscmVhZHkgaGF2ZSBiZWVuIGNsZWFyZWQKPj4+Pj4+Pj4+Pj4gYW5kIGRl
c2lnbmF0ZWQgYXMgdGhlIG5ldyBjdXJyZW50IHNlY3Rpb24sIG1ha2luZyBpdCBhY3RpdmVseQo+
Pj4+Pj4+Pj4+PiBpbgo+Pj4+IHVzZS4KPj4+Pj4+Pj4+Pj4gVGhpcyBiZWhhdmlvciBjYXVzZXMg
aW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSBTSVQgYW5kIFNTQS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIgaXNzdWU/Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhp
cyBpcyBhbiBpc3N1ZSB0aGF0IGFyaXNlcyB3aGVuIGRpdmlkaW5nIGEgbGFyZ2Ugc2VjdGlvbiBp
bnRvCj4+Pj4+Pj4+PiBzZWdtZW50cyBmb3IgZ2FyYmFnZSBjb2xsZWN0aW9uLgo+Pj4+Pj4+Pj4g
Y2F1c2VkIGJ5IHRoZSBiYWNrZ3JvdW5kIEdDIChnYXJiYWdlIGNvbGxlY3Rpb24pIHRocmVhZCBp
biBsYXJnZQo+Pj4+Pj4+Pj4gc2VjdGlvbgo+Pj4+Pj4+Pj4gZjJmc19nYyh2aWN0aW1fc2VjdGlv
bikgLT4KPj4+Pj4+Pj4+IGYyZnNfY2xlYXJfcHJlZnJlZV9zZWdtZW50cyh2aWN0aW1fc2VjdGlv
biktPgo+Pj4+Pj4+Pj4gY3Vyc2VjKHZpY3RpbV9zZWN0aW9uKSAtPiBmMmZzX2djKHZpY3RpbV9z
ZWN0aW9uIGJ5Cj4+Pj4+Pj4+PiBuZXh0X3ZpY3RpbV9zZWcpCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkg
ZGlkbid0IGdldCBpdCwgd2h5IGYyZnNfZ2V0X3ZpY3RpbSgpIHdpbGwgcmV0dXJuIHNlY3Rpb24g
d2hpY2gKPj4+Pj4+Pj4gaXMgdXNlZCBieSBjdXJzZWc/IEl0IHNob3VsZCBiZSBhdm9pZGVkIGJ5
IGNoZWNraW5nIHcvCj4+IHNlY191c2FnZV9jaGVjaygpLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPciB3
ZSBtaXNzZWQgdG8gY2hlY2sgZ2Npbmcgc2VjdGlvbiB3aGljaCBuZXh0X3ZpY3RpbV9zZWcgcG9p
bnRzCj4+Pj4+Pj4+IHRvIGR1cmluZyBnZXRfbmV3X3NlZ21lbnQoKT8KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gQ2FuIHRoaXMgaGFwcGVuPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBlLmcuCj4+Pj4+Pj4+IC0gYmdn
YyBzZWxlY3RzIHNlYyAjMAo+Pj4+Pj4+PiAtIG5leHRfdmljdGltX3NlZzogc2VnICMwCj4+Pj4+
Pj4+IC0gbWlncmF0ZSBzZWcgIzAgYW5kIHN0b3AKPj4+Pj4+Pj4gLSBuZXh0X3ZpY3RpbV9zZWc6
IHNlZyAjMQo+Pj4+Pj4+PiAtIGNoZWNrcG9pbnQsIHNldCBzZWMgIzAgZnJlZSBpZiBzZWMgIzAg
aGFzIG5vIHZhbGlkIGJsb2Nrcwo+Pj4+Pj4+PiAtIGFsbG9jYXRlIHNlZyAjMCBpbiBzZWMgIzAg
Zm9yIGN1cnNlZwo+Pj4+Pj4+PiAtIGN1cnNlZyBtb3ZlcyB0byBzZWcgIzEgYWZ0ZXIgYWxsb2Nh
dGlvbgo+Pj4+Pj4+PiAtIGJnZ2MgdHJpZXMgdG8gbWlncmF0ZSBzZWcgIzEKPj4+Pj4+Pj4KPj4+
Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4+IFRoYXQncyBjb3JyZWN0Cj4+Pj4+Pj4gSW4gZjJmc19nZXRf
dmljdGltLCB3ZSB1c2UgbmV4dF92aWN0aW1fc2VnIHRvIGRpcmVjdGx5IGp1bXAgdG8KPj4+Pj4+
PiBnb3RfcmVzdWx0LCB0aGVyZWJ5IGJ5cGFzc2luZyBzZWNfdXNhZ2VfY2hlY2sgV2hhdCBkbyB5
b3UgdGhpbmsKPj4+Pj4+PiBhYm91dCB0aGlzIGNoYW5nZT8KPj4+Pj4+Pgo+Pj4+Pj4+IEBAIC04
NTAsMTUgKzg1MCwyMCBAQCBpbnQgZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3NiX2luZm8K
Pj4+Pj4+PiAqc2JpLAo+Pj4+Pj4gdW5zaWduZWQgaW50ICpyZXN1bHQsCj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcC5taW5fc2Vnbm8gPSBzYmktPm5leHRfdmljdGltX3NlZ1tC
R19HQ107Cj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3VsdCA9IHAubWlu
X3NlZ25vOwo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0
aW1fc2VnW0JHX0dDXSA9IE5VTExfU0VHTk87Cj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBnb3RfcmVzdWx0Owo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICB9Cj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICAgIGlmIChnY190eXBlID09IEZHX0dDICYmCj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10g
IT0gTlVMTF9TRUdOTykKPj4gewo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAu
bWluX3NlZ25vID0gc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdOwo+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICpyZXN1bHQgPSBwLm1pbl9zZWdubzsKPj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10gPSBOVUxMX1NF
R05POwo+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZ290X3Jlc3VsdDsKPj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+ICsKPj4+Pj4+PiArICAgICAgICAgICAg
ICAgc2Vjbm8gPSBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pOwo+Pj4+Pj4+ICsKPj4+Pj4+
PiArICAgICAgICAgICAgICAgaWYgKHNlY191c2FnZV9jaGVjayhzYmksIHNlY25vKSkKPj4+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4+Pj4+Pj4gICAgICAgICAgICB9Cj4+Pj4+
Pgo+Pj4+Pj4gQnV0IHN0aWxsIGFsbG9jYXRvciBjYW4gYXNzaWduIHRoaXMgc2VnbWVudCBhZnRl
ciBzZWNfdXNhZ2VfY2hlY2soKQo+Pj4+Pj4gaW4gcmFjZSBjb25kaXRpb24sIHJpZ2h0Pwo+Pj4+
PiBTaW5jZSB0aGUgQkcgR0MgdXNpbmcgbmV4dF92aWN0aW0gIHRha2VzIHBsYWNlIGFmdGVyIHRo
ZSBTSVQgdXBkYXRlCj4+Pj4+IGluIGRvX2NoZWNrcG9pbnQsIGl0IHNlZW1zIHVubGlrZWx5IHRo
YXQgYSByYWNlIGNvbmRpdGlvbiB3aXRoCj4+Pj4gc2VjX3VzYWdlX2NoZWNrIHdpbGwgb2NjdXIu
Cj4+Pj4KPj4+PiBJIG1lYW4gdGhpczoKPj4+Pgo+Pj4+IC0gZ2NfdGhyZWFkCj4+Pj4gICAgLSBm
MmZzX2djCj4+Pj4gICAgIC0gZjJmc19nZXRfdmljdGltCj4+Pj4gICAgICAtIHNlY191c2FnZV9j
aGVjayAtLS0gc2Vnbm8gIzEgaXMgbm90IHVzZWQgaW4gYW55IGN1cnNlZ3MKPj4+PiAJCQkJCS0g
ZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrCj4+Pj4gCQkJCQkgLSBuZXdfY3Vyc2VnCj4+Pj4gCQkJ
CQkgIC0gZ2V0X25ld19zZWdtZW50IGZpbmQgc2Vnbm8gIzEKPj4+Pgo+Pj4+ICAgICAtIGRvX2dh
cmJhZ2VfY29sbGVjdAo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4KPj4+IAkJCQkJCSAgZG9fY2hlY2tw
b2ludCBzZWMwIGZyZWUKPj4+IAkJCQkJCSAgSWYgc2VjMCBpcyBub3QgZnJlZWQsIHRoZW4KPj4g
c2Vnbm8xIHdpdGhpbiBzZWMwIGNhbm5vdCBiZQo+Pj4gYWxsb2NhdGVkCj4+PiAtIGdjX3RocmVh
ZAo+Pj4gICAgLSBmMmZzX2djCj4+PiAgICAgLSBmMmZzX2dldF92aWN0aW0KPj4+ICAgICAgLSBz
ZWNfdXNhZ2VfY2hlY2sgIC0tLSBzZWdubyAjMSBpcyBub3QgdXNlZCBpbiBhbnkgY3Vyc2VncyAo
YnV0IHNlYzAKPj4gaXMgYWxyZWFkeSB1c2VkKQo+Pj4gCQkJCQkJCS0gZjJmc19hbGxvY2F0ZV9k
YXRhX2Jsb2NrCj4+PiAJCQkJCQkJLSBuZXdfY3Vyc2VnCj4+PiAJCQkJCQkJLSBnZXRfbmV3X3Nl
Z21lbnQgZmluZAo+PiBzZWdubyAjMQo+Pj4KPj4+ICAgICAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+
Pj4KPj4+IEkgYXBwcmVjaWF0ZSB5b3VyIHBhdGNoLCBpdCBpcyB1bmRlciB0ZXN0aW5nLgo+Pj4g
YnV0IEknbSB3b25kZXJpbmcgaWYgdGhlcmUncyBhIHJpc2sgb2YgYSByYWNlIGNvbmRpdGlvbiBp
biB0aGlzCj4+PiBzaXR1YXRpb24KPj4KPj4gT2gsIHllcywgSSBtYXkgbWlzc2VkIHRoYXQgZ2V0
X25ld19zZWdtZW50IGNhbiByZXR1cm4gYSBmcmVlIHNlZ21lbnQgaW4KPj4gcGFydGlhbCB1c2Vk
IHNlY3Rpb24uCj4+Cj4+IFNvIHdoYXQgZG8geW91IHRoaW5rIG9mIHRoaXM/Cj4+IC0gY2hlY2sg
Q1VSU0VHKCkgaW4gZG9fZ2FyYmFnZV9jb2xsZWN0KCkgYW5kIGdldF92aWN0aW0oKQo+PiAtIHJl
c2V0IG5leHRfdmljdGltX3NlZ1tdIGluIGdldF9uZXdfc2VnbWVudCgpIGFuZCBfX3NldF90ZXN0
X2FuZF9mcmVlKCkKPj4gZHVyaW5nIGNoZWNrcG9pbnQuCj4+Cj4+IFRoYW5rcywKPiAKPiBIb3cg
YWJvdXQgdXNpbmcgdmljdGltX3NlY21hcD8KPiBnY190aHJlYWQKPiAJCQkJbXV0ZXhfbG9jaygm
RElSVFlfSShzYmkpLT5zZWdsaXN0X2xvY2spOwo+IAkJCQlfX3NldF90ZXN0X2FuZF9mcmVlCj4g
CQkJCWNoZWNrIGN1ciBzZWN0aW9uIG5leHRfdmljdGltIGNsZWFyIAo+IAkJCQltdXRleF91bmxv
Y2soJmRpcnR5X2ktPnNlZ2xpc3RfbG9jayk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAo+IG11dGV4X2xvY2soJmRpcnR5LT5zZWdsaXN0X2xvY2spOwo+IGYyZnNf
Z2V0X3ZpY3RpbQo+IG11dGV4X3VubG9jaygmZGlydHlfaS0+c2VnbGlzdF9sb2NrKTsKPiAKPiBz
dGF0aWMgaW5saW5lIHZvaWQgX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4gICAgICAgICAgICAgICAgIGlmIChuZXh0ID49IHN0YXJ0X3NlZ25vICsgdXNhYmxl
X3NlZ3MpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAodGVzdF9hbmRfY2xlYXJfYml0
KHNlY25vLCBmcmVlX2ktPmZyZWVfc2VjbWFwKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBkaXJ0eV9pLT52aWN0aW1fc2VjbWFw
KSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2Vn
W0JHX0dDXSA9IE5VTExfU0VHTk87CgpDYW4gdGhpcyBoYXBwZW4/CgpzZWdzX3Blcl9zZWM9MgoK
LSBzZWcjMCBhbmQgc2VnIzEgYXJlIGFsbCBkaXJ0eQotIGFsbCB2YWxpZCBibG9ja3MgYXJlIHJl
bW92ZWQgaW4gc2VnIzEKLSBjaGVja3BvaW50IC0+IHNlZyMxIGJlY29tZXMgZnJlZQotIGdjIHNl
bGVjdCB0aGlzIHNlYyBhbmQgbmV4dF92aWN0aW1fc2VnPXNlZyMwCi0gbWlncmF0ZSBzZWcjMCwg
bmV4dF92aWN0aW1fc2VnPXNlZyMxCi0gYWxsb2NhdG9yIGFzc2lnbnMgc2VnIzEgdG8gY3Vyc2Vn
Ci0gZ2MgdHJpZXMgdG8gbWlncmF0ZSBzZWcjMQoKVGhhbmtzLAoKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgfQo+Pgo+Pj4KPj4+Cj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBJTU8sIHdlIGNhbiBj
bGVhciBuZXh0X3ZpY3RpbV9zZWdbXSBvbmNlIHNlY3Rpb24gaXMgZnJlZSBpbgo+Pj4+Pj4gX19z
ZXRfdGVzdF9hbmRfZnJlZSgpPyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4+PiBJIHdpbGwgdGVz
dCBpdCBhY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0aW9uLgo+Pj4+PiBJZiB0aGVyZSBhcmUgbm8g
aXNzdWVzLCBjYW4gSSBzdWJtaXQgaXQgYWdhaW4gd2l0aCB0aGUgcGF0Y2g/Cj4+Pj4+IFRoYW5r
cwo+Pj4+Pj4KPj4+Pj4+IC0tLQo+Pj4+Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5oIHwgMTMgKysr
KysrKysrKy0tLQo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQu
aCBiL2ZzL2YyZnMvc2VnbWVudC5oIGluZGV4Cj4+Pj4+PiAwNDY1ZGMwMGIzNDkuLjgyNmUzNzk5
OTA4NSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oCj4+Pj4+PiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuaAo+Pj4+Pj4gQEAgLTQ3Myw5ICs0NzMsMTYgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIF9fc2V0X3Rlc3RfYW5kX2ZyZWUoc3RydWN0Cj4+Pj4+PiBmMmZzX3NiX2luZm8gKnNi
aSwKPj4+Pj4+ICAgICAJCQlnb3RvIHNraXBfZnJlZTsKPj4+Pj4+ICAgICAJCW5leHQgPSBmaW5k
X25leHRfYml0KGZyZWVfaS0+ZnJlZV9zZWdtYXAsCj4+Pj4+PiAgICAgCQkJCXN0YXJ0X3NlZ25v
ICsgU0VHU19QRVJfU0VDKHNiaSksCj4+IHN0YXJ0X3NlZ25vKTsKPj4+Pj4+IC0JCWlmIChuZXh0
ID49IHN0YXJ0X3NlZ25vICsgdXNhYmxlX3NlZ3MpIHsKPj4+Pj4+IC0JCQlpZiAodGVzdF9hbmRf
Y2xlYXJfYml0KHNlY25vLCBmcmVlX2ktPmZyZWVfc2VjbWFwKSkKPj4+Pj4+IC0JCQkJZnJlZV9p
LT5mcmVlX3NlY3Rpb25zKys7Cj4+Pj4+PiArCQlpZiAoKG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1
c2FibGVfc2VncykgJiYKPj4+Pj4+ICsJCQl0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGZyZWVf
aS0+ZnJlZV9zZWNtYXApKSB7Cj4+Pj4+PiArCQkJZnJlZV9pLT5mcmVlX3NlY3Rpb25zKys7Cj4+
Pj4+PiArCj4+Pj4+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3RpbV9z
ZWdbQkdfR0NdKSA9PQo+Pj4+Pj4gKwkJCQkJCQkJCXNlY25vKQo+Pj4+Pj4gKwkJCQlzYmktPm5l
eHRfdmljdGltX3NlZ1tCR19HQ10gPSBOVUxMX1NFR05POwo+Pj4+Pj4gKwkJCWlmIChHRVRfU0VD
X0ZST01fU0VHKHNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSkgPT0KPj4+Pj4+ICsJCQkJCQkJ
CQlzZWNubykKPj4+Pj4+ICsJCQkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9T
RUdOTzsKPj4+Pj4+ICAgICAJCX0KPj4+Pj4+ICAgICAJfQo+Pj4+Pj4gICAgIHNraXBfZnJlZToK
Pj4+Pj4+IC0tCj4+Pj4+PiAyLjQwLjEKPj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4gQmVjYXVzZSB0aGUgY2FsbCBzdGFjayBpcyBkaWZmZXJlbnQsIEkgdGhpbmsgdGhhdCBpbiBv
cmRlciB0bwo+Pj4+Pj4+Pj4gaGFuZGxlIGV2ZXJ5dGhpbmcgYXQgb25jZSwgd2UgbmVlZCB0byBh
ZGRyZXNzIGl0IHdpdGhpbgo+Pj4+Pj4+Pj4gZG9fZ2FyYmFnZV9jb2xsZWN0LCBvciBvdGhlcndp
c2UgaW5jbHVkZSBpdCBvbiBib3RoIHNpZGVzLgo+Pj4+Pj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gWzMwMTQ2LjMzNzQ3MV1bIFQxMzAwXSBGMkZTLWZzIChkbS01
NCk6IEluY29uc2lzdGVudCBzZWdtZW50Cj4+Pj4+Pj4+PiAoNzA5NjEpIHR5cGUgWzAsIDFdIGlu
IFNTQSBhbmQgU0lUIFszMDE0Ni4zNDYxNTFdWyBUMTMwMF0gQ2FsbAo+PiB0cmFjZToKPj4+Pj4+
Pj4+IFszMDE0Ni4zNDYxNTJdWyBUMTMwMF0gIGR1bXBfYmFja3RyYWNlKzB4ZTgvMHgxMGMKPj4+
Pj4+Pj4+IFszMDE0Ni4zNDYxNTddWyBUMTMwMF0gIHNob3dfc3RhY2srMHgxOC8weDI4IFszMDE0
Ni4zNDYxNThdWwo+Pj4+Pj4+Pj4gVDEzMDBdIGR1bXBfc3RhY2tfbHZsKzB4NTAvMHg2YyBbMzAx
NDYuMzQ2MTYxXVsgVDEzMDBdCj4+Pj4+Pj4+PiBkdW1wX3N0YWNrKzB4MTgvMHgyOCBbMzAxNDYu
MzQ2MTYyXVsgVDEzMDBdCj4+Pj4+Pj4+PiBmMmZzX3N0b3BfY2hlY2twb2ludCsweDFjLzB4M2Mg
WzMwMTQ2LjM0NjE2NV1bIFQxMzAwXQo+Pj4+Pj4+Pj4gZG9fZ2FyYmFnZV9jb2xsZWN0KzB4NDFj
LzB4MjcxYyBbMzAxNDYuMzQ2MTY3XVsgVDEzMDBdCj4+Pj4+Pj4+PiBmMmZzX2djKzB4MjdjLzB4
ODI4IFszMDE0Ni4zNDYxNjhdWyBUMTMwMF0KPj4+Pj4+Pj4+IGdjX3RocmVhZF9mdW5jKzB4Mjkw
LzB4ODhjIFszMDE0Ni4zNDYxNjldWyBUMTMwMF0KPj4+Pj4+Pj4+IGt0aHJlYWQrMHgxMWMvMHgx
NjQgWzMwMTQ2LjM0NjE3Ml1bIFQxMzAwXQo+Pj4+Pj4+Pj4gcmV0X2Zyb21fZm9yaysweDEwLzB4
MjAKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBzdHJ1Y3QgY3Vyc2VnX2luZm8gOiAweGZmZmZmZjgwM2Y5
NWU4MDAgewo+Pj4+Pj4+Pj4gCXNlZ25vICAgICAgICA6IDB4MTE1MzEgOiA3MDk2MQo+Pj4+Pj4+
Pj4gfQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IHN0cnVjdCBmMmZzX3NiX2luZm8gOiAweGZmZmZmZjg4
MTFkMTIwMDAgewo+Pj4+Pj4+Pj4gCW5leHRfdmljdGltX3NlZ1swXSA6IDB4MTE1MzEgOiA3MDk2
MSB9Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtZjJmcy1kZXZlbC8yMDI1MDMyNTA4MDY0Ni4zMjkxOTQ3Cj4+Pj4+Pj4+Pj4gLTIK
Pj4+Pj4+Pj4+PiAtCj4+Pj4+Pj4+Pj4gY2hhb0BrZXJuZWwub3JnCj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWW9oYW4gSm91bmcgPHlvaGFuLmpvdW5nQHNrLmNvbT4KPj4+Pj4+Pj4+Pj4gLS0tCj4+
Pj4+Pj4+Pj4+ICAgICBmcy9mMmZzL2djLmMgfCA0ICsrKysKPj4+Pj4+Pj4+Pj4gICAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYyBpbmRleAo+Pj4+Pj4+Pj4+PiAyYjhm
OTIzOWJlZGUuLjRiNWQxOGUzOTVlYiAxMDA2NDQKPj4+Pj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9n
Yy5jCj4+Pj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4+Pj4+PiBAQCAtMTkyNiw2
ICsxOTI2LDEwIEBAIGludCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+
Pj4+Pj4gc3RydWN0Cj4+Pj4+Pj4+Pj4gZjJmc19nY19jb250cm9sICpnY19jb250cm9sKQo+Pj4+
Pj4+Pj4+PiAgICAgCQlnb3RvIHN0b3A7Cj4+Pj4+Pj4+Pj4+ICAgICAJfQo+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+PiArCWlmIChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSAmJgo+Pj4+Pj4+Pj4+PiAr
CQkJSVNfQ1VSU0VDKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKSkpCj4+Pj4+Pj4+
Pj4+ICsJCWdvdG8gc3RvcDsKPj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+PiAgICAgCXNlZ19mcmVl
ZCA9IGRvX2dhcmJhZ2VfY29sbGVjdChzYmksIHNlZ25vLCAmZ2NfbGlzdCwgZ2NfdHlwZSwKPj4+
Pj4+Pj4+Pj4gICAgIAkJCQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsCj4+Pj4+
Pj4+Pj4+ICAgICAJCQkJZ2NfY29udHJvbC0+b25lX3RpbWUpOwo+Pj4+Pj4+Pj4KPj4+Pj4+Pgo+
Pj4+Pgo+Pj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
