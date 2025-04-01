Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB4A776B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Apr 2025 10:45:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzXFF-0005OP-8C;
	Tue, 01 Apr 2025 08:45:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tzXFE-0005OG-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 08:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ow2aUl3+lAyHjPGuEIStAfEyniWUkd0k6P54cDoLBgM=; b=ZUCHLvMOf1+djKEzIL82Z5BNR7
 qvWzf64XFzvFpB7RfafvEYYbjSyLYzhI7sGe3UAWtgUP5wu6peOUXHLQhYou8Zx7fza6xLYM3zBLs
 7rKZm8i8w8tbuRYV95Jt+crM10uW2i6ryjf5eryyZRG0Iwx3GRpzw6G2fV1wRyX+SmyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ow2aUl3+lAyHjPGuEIStAfEyniWUkd0k6P54cDoLBgM=; b=kRRG8+RiqzATn5BDTLdtecqxQW
 /3YNeV+T0s/sXfDi2Ia22CX9Yq8YkNFDyJIoKnWigpLz+cNlNrJUk2YLh5Eas8cSj3TIDQiz67Hi1
 2Csuznigu4y2dt1+MKYsC8uRyr8ZvJBiS0DziA9K4uppZkF+P4Q+NwZvcb08clbf+5VU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzXEw-0007mk-PT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 08:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F8E16115F;
 Tue,  1 Apr 2025 08:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C3FC4CEE4;
 Tue,  1 Apr 2025 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743497087;
 bh=iYTIi4ZogAn3QQusGKuajg5r0087RL31J33idY69lfU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=k7qilHD4Cr1UnJNQHb+uVsScDK9+BNrBHiulspZGNopg2MT917hXKTv4S53fQcqx8
 FOnYXUOlzblf7xgmn1yGf9lJwpyKUMxRgvPBwM1mR+sKSPiKaafHlJE7DRFFUEi1mb
 U2jLv9qjUDtInUqMprhA/OkEK78bGXUJFDfjnWF8YUOjhndB7MjNeyVVbZt1c5GOWD
 E1mdIJXAH5uuRj/zejTJDH1BE5c4mo9wxx16RPJ+FyIzdg2sN3hpA6ZWsie07pnfSU
 M1SpqVFTF+595miamjEtasigU84sw7HLYBKzoNnIfK4fC48u9Br+yamEwqC9IEvNHx
 CT9qE6nA3NnAA==
Message-ID: <de99eee5-abb6-4645-b1f1-3154866f40a4@kernel.org>
Date: Tue, 1 Apr 2025 16:44:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, linux-f2fs-devel@lists.sourceforge.net
References: <78f1965e-679c-42cc-abdb-c3ba51f6ffab@kernel.org>
 <20250401074710.2657-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250401074710.2657-1-yohan.joung@sk.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/1/25 15:47, yohan.joung wrote: > > >> 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tzXEw-0007mk-PT
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

T24gNC8xLzI1IDE1OjQ3LCB5b2hhbi5qb3VuZyB3cm90ZToKPiAKPiAKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiBTZW50
OiBUdWVzZGF5LCBBcHJpbCAxLCAyMDI1IDI6NDIgUE0KPj4gVG86IOygleyalO2VnChKT1VORyBZ
T0hBTikgTW9iaWxlIEFFIDx5b2hhbi5qb3VuZ0Bzay5jb20+OyBsaW51eC1mMmZzLQo+PiBkZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgamFlZ2V1a0Br
ZXJuZWwub3JnOyBqeWg0MjlAZ21haWwuY29tOyBsaW51eC0KPj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsg6rmA7ZWE7ZiEKEtJTSBQSUxIWVVOKSBNb2JpbGUgQUUgPHBpbGh5dW4ua2ltQHNrLmNv
bT4KPj4gU3ViamVjdDogW0V4dGVybmFsIE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtm
MmZzLWRldl0gW0V4dGVybmFsIE1haWxdCj4+IFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRD
SF0gZjJmczogcHJldmVudCB0aGUgY3VycmVudCBzZWN0aW9uIGZyb20KPj4gYmVpbmcgc2VsZWN0
ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbgo+Pgo+PiBPbiA0LzEvMjUg
MDk6NTEsIHlvaGFuLmpvdW5nIHdyb3RlOgo+Pj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KPj4+PiBTZW50OiBNb25kYXksIE1hcmNoIDMxLCAyMDI1IDg6MzYgUE0KPj4+PiBUbzog
7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFuLmpvdW5nQHNrLmNvbT47IGxp
bnV4LWYyZnMtCj4+Pj4gZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4gQ2M6IGNoYW9A
a2VybmVsLm9yZzsgamFlZ2V1a0BrZXJuZWwub3JnOyBqeWg0MjlAZ21haWwuY29tOyBsaW51eC0K
Pj4+PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmls
ZSBBRQo+Pj4+IDxwaWxoeXVuLmtpbUBzay5jb20+Cj4+Pj4gU3ViamVjdDogW0V4dGVybmFsIE1h
aWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtmMmZzLWRldl0gW0V4dGVybmFsCj4+Pj4gTWFp
bF0KPj4+PiBSZTogW0V4dGVybmFsIE1haWxdIFJlOiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhl
IGN1cnJlbnQgc2VjdGlvbgo+Pj4+IGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVy
aW5nIGdhcmJhZ2UgY29sbGVjdGlvbgo+Pj4+Cj4+Pj4gT24gMy8zMS8yNSAxMzoxMywgeW9oYW4u
am91bmcgd3JvdGU6Cj4+Pj4+PiBPbiAyMDI1LzMvMjggMTU6MjUsIHlvaGFuLmpvdW5nIHdyb3Rl
Ogo+Pj4+Pj4+PiBPbiAyMDI1LzMvMjggMTE6NDAsIHlvaGFuLmpvdW5nIHdyb3RlOgo+Pj4+Pj4+
Pj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+Pj4+PiBTZW50OiBUaHVy
c2RheSwgTWFyY2ggMjcsIDIwMjUgMTA6NDggUE0KPj4+Pj4+Pj4+PiBUbzog7KCV7JqU7ZWcKEpP
VU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFuLmpvdW5nQHNrLmNvbT47IFlvaGFuCj4+Pj4+Pj4+
Pj4gSm91bmcgPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7IGRhZWhvNDNA
Z21haWwuY29tCj4+Pj4+Pj4+Pj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4+Pj4+Pj4+Pj4gbGludXgtIGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IOq5gO2VhO2YhChLSU0gUElMSFlVTikgTW9iaWxlIEFFCj4+Pj4+Pj4+Pj4gPHBp
bGh5dW4ua2ltQHNrLmNvbT4KPj4+Pj4+Pj4+PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6
IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVybmFsIE1haWxdCj4+IFJlOgo+Pj4+Pj4+Pj4+IFtQ
QVRDSF0gZjJmczogcHJldmVudCB0aGUgY3VycmVudCBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0
ZWQKPj4+Pj4+Pj4+PiBhcyBhIHZpY3RpbSBkdXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uCj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+PiBPbiAyMDI1LzMvMjcgMTY6MDAsIHlvaGFuLmpvdW5nQHNrLmNvbSB3
cm90ZToKPj4+Pj4+Pj4+Pj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+
Pj4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSA0OjMwIFBNCj4+Pj4+Pj4+Pj4+
PiBUbzog7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFuLmpvdW5nQHNrLmNv
bT47IFlvaGFuCj4+Pj4+Pj4+Pj4+PiBKb3VuZyA8anloNDI5QGdtYWlsLmNvbT47IGphZWdldWtA
a2VybmVsLm9yZzsKPj4+Pj4+Pj4+Pj4+IGRhZWhvNDNAZ21haWwuY29tCj4+Pj4+Pj4+Pj4+PiBD
YzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dDsKPj4+Pj4+Pj4+Pj4+IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQo
S0lNIFBJTEhZVU4pIE1vYmlsZSBBRQo+Pj4+Pj4+Pj4+Pj4gPHBpbGh5dW4ua2ltQHNrLmNvbT4K
Pj4+Pj4+Pj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVybmFsIE1haWxd
IFJlOiBbUEFUQ0hdIGYyZnM6Cj4+Pj4+Pj4+Pj4+PiBwcmV2ZW50IHRoZSBjdXJyZW50IHNlY3Rp
b24gZnJvbSBiZWluZyBzZWxlY3RlZCBhcyBhIHZpY3RpbQo+Pj4+Pj4+Pj4+Pj4gZHVyaW5nIGdh
cmJhZ2UgY29sbGVjdGlvbgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IE9uIDMvMjcvMjUgMTQ6
NDMsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4gRnJvbTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+Pj4+Pj4+Pj4+PiBTZW50OiBUaHVyc2RheSwgTWFyY2gg
MjcsIDIwMjUgMzowMiBQTQo+Pj4+Pj4+Pj4+Pj4+PiBUbzogWW9oYW4gSm91bmcgPGp5aDQyOUBn
bWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7Cj4+Pj4+Pj4+Pj4+Pj4+IGRhZWhvNDNAZ21h
aWwuY29tCj4+Pj4+Pj4+Pj4+Pj4+IENjOiBjaGFvQGtlcm5lbC5vcmc7Cj4+Pj4+Pj4+Pj4+Pj4+
IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Owo+Pj4+Pj4+Pj4+Pj4+PiBs
aW51eC0ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2Jp
bGUgQUUKPj4+Pj4+Pj4+Pj4+Pj4gPHlvaGFuLmpvdW5nQHNrLmNvbT4KPj4+Pj4+Pj4+Pj4+Pj4g
U3ViamVjdDogW0V4dGVybmFsIE1haWxdIFJlOiBbUEFUQ0hdIGYyZnM6IHByZXZlbnQgdGhlCj4+
Pj4+Pj4+Pj4+Pj4+IGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmlj
dGltIGR1cmluZwo+Pj4+Pj4+Pj4+Pj4+PiBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+Pj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4+Pj4gT24gMy8yNi8yNSAyMjoxNCwgWW9oYW4gSm91bmcgd3JvdGU6Cj4+
Pj4+Pj4+Pj4+Pj4+PiBXaGVuIHNlbGVjdGluZyBhIHZpY3RpbSB1c2luZyBuZXh0X3ZpY3RpbV9z
ZWcgaW4gYSBsYXJnZQo+Pj4+Pj4+Pj4+Pj4+Pj4gc2VjdGlvbiwgdGhlIHNlbGVjdGVkIHNlY3Rp
b24gbWlnaHQgYWxyZWFkeSBoYXZlIGJlZW4KPj4+Pj4+Pj4+Pj4+Pj4+IGNsZWFyZWQgYW5kIGRl
c2lnbmF0ZWQgYXMgdGhlIG5ldyBjdXJyZW50IHNlY3Rpb24sIG1ha2luZwo+Pj4+Pj4+Pj4+Pj4+
Pj4gaXQgYWN0aXZlbHkgaW4KPj4+Pj4+Pj4gdXNlLgo+Pj4+Pj4+Pj4+Pj4+Pj4gVGhpcyBiZWhh
dmlvciBjYXVzZXMgaW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSBTSVQgYW5kIFNTQS4KPj4+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gSGksIGRvZXMgdGhpcyBmaXggeW91ciBpc3N1ZT8KPj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IFRoaXMgaXMgYW4gaXNzdWUgdGhhdCBhcmlzZXMgd2hl
biBkaXZpZGluZyBhIGxhcmdlIHNlY3Rpb24KPj4+Pj4+Pj4+Pj4+PiBpbnRvIHNlZ21lbnRzIGZv
ciBnYXJiYWdlIGNvbGxlY3Rpb24uCj4+Pj4+Pj4+Pj4+Pj4gY2F1c2VkIGJ5IHRoZSBiYWNrZ3Jv
dW5kIEdDIChnYXJiYWdlIGNvbGxlY3Rpb24pIHRocmVhZCBpbgo+Pj4+Pj4+Pj4+Pj4+IGxhcmdl
IHNlY3Rpb24KPj4+Pj4+Pj4+Pj4+PiBmMmZzX2djKHZpY3RpbV9zZWN0aW9uKSAtPgo+Pj4+Pj4+
Pj4+Pj4+IGYyZnNfY2xlYXJfcHJlZnJlZV9zZWdtZW50cyh2aWN0aW1fc2VjdGlvbiktPgo+Pj4+
Pj4+Pj4+Pj4+IGN1cnNlYyh2aWN0aW1fc2VjdGlvbikgLT4gZjJmc19nYyh2aWN0aW1fc2VjdGlv
biBieQo+Pj4+Pj4+Pj4+Pj4+IG5leHRfdmljdGltX3NlZykKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+PiBJIGRpZG4ndCBnZXQgaXQsIHdoeSBmMmZzX2dldF92aWN0aW0oKSB3aWxsIHJldHVybiBz
ZWN0aW9uCj4+Pj4+Pj4+Pj4+PiB3aGljaCBpcyB1c2VkIGJ5IGN1cnNlZz8gSXQgc2hvdWxkIGJl
IGF2b2lkZWQgYnkgY2hlY2tpbmcgdy8KPj4+Pj4+IHNlY191c2FnZV9jaGVjaygpLgo+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IE9yIHdlIG1pc3NlZCB0byBjaGVjayBnY2luZyBzZWN0aW9uIHdo
aWNoIG5leHRfdmljdGltX3NlZwo+Pj4+Pj4+Pj4+Pj4gcG9pbnRzIHRvIGR1cmluZyBnZXRfbmV3
X3NlZ21lbnQoKT8KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBDYW4gdGhpcyBoYXBwZW4/Cj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gZS5nLgo+Pj4+Pj4+Pj4+Pj4gLSBiZ2djIHNlbGVjdHMg
c2VjICMwCj4+Pj4+Pj4+Pj4+PiAtIG5leHRfdmljdGltX3NlZzogc2VnICMwCj4+Pj4+Pj4+Pj4+
PiAtIG1pZ3JhdGUgc2VnICMwIGFuZCBzdG9wCj4+Pj4+Pj4+Pj4+PiAtIG5leHRfdmljdGltX3Nl
Zzogc2VnICMxCj4+Pj4+Pj4+Pj4+PiAtIGNoZWNrcG9pbnQsIHNldCBzZWMgIzAgZnJlZSBpZiBz
ZWMgIzAgaGFzIG5vIHZhbGlkIGJsb2Nrcwo+Pj4+Pj4+Pj4+Pj4gLSBhbGxvY2F0ZSBzZWcgIzAg
aW4gc2VjICMwIGZvciBjdXJzZWcKPj4+Pj4+Pj4+Pj4+IC0gY3Vyc2VnIG1vdmVzIHRvIHNlZyAj
MSBhZnRlciBhbGxvY2F0aW9uCj4+Pj4+Pj4+Pj4+PiAtIGJnZ2MgdHJpZXMgdG8gbWlncmF0ZSBz
ZWcgIzEKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Pj4+IFRoYXQn
cyBjb3JyZWN0Cj4+Pj4+Pj4+Pj4+IEluIGYyZnNfZ2V0X3ZpY3RpbSwgd2UgdXNlIG5leHRfdmlj
dGltX3NlZyB0byBkaXJlY3RseSBqdW1wIHRvCj4+Pj4+Pj4+Pj4+IGdvdF9yZXN1bHQsIHRoZXJl
YnkgYnlwYXNzaW5nIHNlY191c2FnZV9jaGVjayBXaGF0IGRvIHlvdQo+Pj4+Pj4+Pj4+PiB0aGlu
ayBhYm91dCB0aGlzIGNoYW5nZT8KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQEAgLTg1MCwxNSAr
ODUwLDIwIEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbwo+Pj4+Pj4+
Pj4+PiAqc2JpLAo+Pj4+Pj4+Pj4+IHVuc2lnbmVkIGludCAqcmVzdWx0LAo+Pj4+Pj4+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+bmV4dF92aWN0aW1f
c2VnW0JHX0dDXTsKPj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3Vs
dCA9IHAubWluX3NlZ25vOwo+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
YmktPm5leHRfdmljdGltX3NlZ1tCR19HQ10gPSBOVUxMX1NFR05POwo+Pj4+Pj4+Pj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4+Pj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICB9Cj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICBpZiAoZ2NfdHlwZSA9
PSBGR19HQyAmJgo+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXQo+Pj4+Pj4+Pj4+PiAhPSBOVUxMX1NFR05PKQo+
Pj4+Pj4gewo+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdu
byA9IHNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXTsKPj4+Pj4+Pj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKnJlc3VsdCA9IHAubWluX3NlZ25vOwo+Pj4+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10gPSBOVUxMX1NF
R05POwo+Pj4+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7
Cj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICB9Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgIHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKTsK
Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgaWYgKHNlY191c2FnZV9j
aGVjayhzYmksIHNlY25vKSkKPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290
byBuZXh0Owo+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBnb3RvIGdv
dF9yZXN1bHQ7Cj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgfQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4g
QnV0IHN0aWxsIGFsbG9jYXRvciBjYW4gYXNzaWduIHRoaXMgc2VnbWVudCBhZnRlcgo+Pj4+Pj4+
Pj4+IHNlY191c2FnZV9jaGVjaygpIGluIHJhY2UgY29uZGl0aW9uLCByaWdodD8KPj4+Pj4+Pj4+
IFNpbmNlIHRoZSBCRyBHQyB1c2luZyBuZXh0X3ZpY3RpbSAgdGFrZXMgcGxhY2UgYWZ0ZXIgdGhl
IFNJVAo+Pj4+Pj4+Pj4gdXBkYXRlIGluIGRvX2NoZWNrcG9pbnQsIGl0IHNlZW1zIHVubGlrZWx5
IHRoYXQgYSByYWNlIGNvbmRpdGlvbgo+Pj4+Pj4+Pj4gd2l0aAo+Pj4+Pj4+PiBzZWNfdXNhZ2Vf
Y2hlY2sgd2lsbCBvY2N1ci4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSBtZWFuIHRoaXM6Cj4+Pj4+Pj4+
Cj4+Pj4+Pj4+IC0gZ2NfdGhyZWFkCj4+Pj4+Pj4+ICAgIC0gZjJmc19nYwo+Pj4+Pj4+PiAgICAg
LSBmMmZzX2dldF92aWN0aW0KPj4+Pj4+Pj4gICAgICAtIHNlY191c2FnZV9jaGVjayAtLS0gc2Vn
bm8gIzEgaXMgbm90IHVzZWQgaW4gYW55IGN1cnNlZ3MKPj4+Pj4+Pj4gCQkJCQktIGYyZnNfYWxs
b2NhdGVfZGF0YV9ibG9jawo+Pj4+Pj4+PiAJCQkJCSAtIG5ld19jdXJzZWcKPj4+Pj4+Pj4gCQkJ
CQkgIC0gZ2V0X25ld19zZWdtZW50IGZpbmQgc2Vnbm8gIzEKPj4+Pj4+Pj4KPj4+Pj4+Pj4gICAg
IC0gZG9fZ2FyYmFnZV9jb2xsZWN0Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pgo+
Pj4+Pj4+IAkJCQkJCSAgZG9fY2hlY2twb2ludCBzZWMwIGZyZWUKPj4+Pj4+PiAJCQkJCQkgIElm
IHNlYzAgaXMgbm90IGZyZWVkLCB0aGVuCj4+Pj4+PiBzZWdubzEgd2l0aGluIHNlYzAgY2Fubm90
IGJlCj4+Pj4+Pj4gYWxsb2NhdGVkCj4+Pj4+Pj4gLSBnY190aHJlYWQKPj4+Pj4+PiAgICAtIGYy
ZnNfZ2MKPj4+Pj4+PiAgICAgLSBmMmZzX2dldF92aWN0aW0KPj4+Pj4+PiAgICAgIC0gc2VjX3Vz
YWdlX2NoZWNrICAtLS0gc2Vnbm8gIzEgaXMgbm90IHVzZWQgaW4gYW55IGN1cnNlZ3MKPj4+Pj4+
PiAoYnV0Cj4+Pj4+Pj4gc2VjMAo+Pj4+Pj4gaXMgYWxyZWFkeSB1c2VkKQo+Pj4+Pj4+IAkJCQkJ
CQktIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jawo+Pj4+Pj4+IAkJCQkJCQktIG5ld19jdXJzZWcK
Pj4+Pj4+PiAJCQkJCQkJLSBnZXRfbmV3X3NlZ21lbnQgZmluZAo+Pj4+Pj4gc2Vnbm8gIzEKPj4+
Pj4+Pgo+Pj4+Pj4+ICAgICAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBh
cHByZWNpYXRlIHlvdXIgcGF0Y2gsIGl0IGlzIHVuZGVyIHRlc3RpbmcuCj4+Pj4+Pj4gYnV0IEkn
bSB3b25kZXJpbmcgaWYgdGhlcmUncyBhIHJpc2sgb2YgYSByYWNlIGNvbmRpdGlvbiBpbiB0aGlz
Cj4+Pj4+Pj4gc2l0dWF0aW9uCj4+Pj4+Pgo+Pj4+Pj4gT2gsIHllcywgSSBtYXkgbWlzc2VkIHRo
YXQgZ2V0X25ld19zZWdtZW50IGNhbiByZXR1cm4gYSBmcmVlCj4+Pj4+PiBzZWdtZW50IGluIHBh
cnRpYWwgdXNlZCBzZWN0aW9uLgo+Pj4+Pj4KPj4+Pj4+IFNvIHdoYXQgZG8geW91IHRoaW5rIG9m
IHRoaXM/Cj4+Pj4+PiAtIGNoZWNrIENVUlNFRygpIGluIGRvX2dhcmJhZ2VfY29sbGVjdCgpIGFu
ZCBnZXRfdmljdGltKCkKPj4+Pj4+IC0gcmVzZXQgbmV4dF92aWN0aW1fc2VnW10gaW4gZ2V0X25l
d19zZWdtZW50KCkgYW5kCj4+Pj4+PiBfX3NldF90ZXN0X2FuZF9mcmVlKCkgZHVyaW5nIGNoZWNr
cG9pbnQuCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+PiBIb3cgYWJvdXQgdXNpbmcg
dmljdGltX3NlY21hcD8KPj4+Pj4gZ2NfdGhyZWFkCj4+Pj4+IAkJCQltdXRleF9sb2NrKCZESVJU
WV9JKHNiaSktPnNlZ2xpc3RfbG9jayk7Cj4+Pj4+IAkJCQlfX3NldF90ZXN0X2FuZF9mcmVlCj4+
Pj4+IAkJCQljaGVjayBjdXIgc2VjdGlvbiBuZXh0X3ZpY3RpbSBjbGVhcgo+Pj4+PiAJCQkJbXV0
ZXhfdW5sb2NrKCZkaXJ0eV9pLT5zZWdsaXN0X2xvY2spOwo+Pj4+Pgo+Pj4+PiBtdXRleF9sb2Nr
KCZkaXJ0eS0+c2VnbGlzdF9sb2NrKTsKPj4+Pj4gZjJmc19nZXRfdmljdGltCj4+Pj4+IG11dGV4
X3VubG9jaygmZGlydHlfaS0+c2VnbGlzdF9sb2NrKTsKPj4+Pj4KPj4+Pj4gc3RhdGljIGlubGlu
ZSB2b2lkIF9fc2V0X3Rlc3RfYW5kX2ZyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4+
PiAgICAgICAgICAgICAgICAgaWYgKG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2Vncykg
ewo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNl
Y25vLCBmcmVlX2ktPmZyZWVfc2VjbWFwKSkKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmcmVlX2ktPmZyZWVfc2VjdGlvbnMrKzsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBkaXJ0eV9pLQo+Pj4g
dmljdGltX3NlY21hcCkpCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Jp
LT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0KPj4+Pj4gKyBOVUxMX1NFR05POwo+Pj4+Cj4+Pj4g
Q2FuIHRoaXMgaGFwcGVuPwo+Pj4+Cj4+Pj4gc2Vnc19wZXJfc2VjPTIKPj4+Pgo+Pj4+IC0gc2Vn
IzAgYW5kIHNlZyMxIGFyZSBhbGwgZGlydHkKPj4+PiAtIGFsbCB2YWxpZCBibG9ja3MgYXJlIHJl
bW92ZWQgaW4gc2VnIzEKPj4+PiAtIGNoZWNrcG9pbnQgLT4gc2VnIzEgYmVjb21lcyBmcmVlCj4+
Pj4gLSBnYyBzZWxlY3QgdGhpcyBzZWMgYW5kIG5leHRfdmljdGltX3NlZz1zZWcjMAo+Pj4+IC0g
bWlncmF0ZSBzZWcjMCwgbmV4dF92aWN0aW1fc2VnPXNlZyMxCj4+Pj4gLSBhbGxvY2F0b3IgYXNz
aWducyBzZWcjMSB0byBjdXJzZWcKPj4+PiAtIGdjIHRyaWVzIHRvIG1pZ3JhdGUgc2VnIzEKPj4K
Pj4gSSBtZWFudCBmb3IgYWJvdmUgY2FzZSwgYmVsb3cgY2hhbmdlIHN0aWxsIGNhbiBub3QgY2F0
Y2ggaXQsIHJpZ2h0PyBzaW5jZQo+PiBuZXh0X3ZpY3RpbV9zZWdbXSB3YXMgYXNzaWduZWQgYWZ0
ZXIgY2hlY2twb2ludC4KPj4KPj4gKwlpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBkaXJ0
eV9pLT52aWN0aW1fc2VjbWFwKSkKPj4gKwkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0g
TlVMTF9TRUdOTzsKPj4KPj4gVGhhbmtzLAo+Pgo+IEkgdW5kZXJzdG9vZCB3aGF0IHlvdSBzYWlk
Lgo+IEl0IHNlZW1zIHRoYXQgd2l0aG91dCBhIGNoZWNrcG9pbnQsCj4gd2Ugd29uJ3QgYmUgYWJs
ZSB0byBhbGxvY2F0ZSBzZWcjMSBpbiBzZWMwIAo+IGJlY2F1c2Ugd2hlbiByZXF1ZXN0aW5nIGEg
c2VnbWVudCBhbGxvY2F0aW9uLCAKPiBpZiBpdCdzIG5vdCB3aXRoaW4gdGhlIHNhbWUgc2VjdGlv
biwgaXQgY2hlY2tzIGluIGEgbmV3IHNlY21hcC4KPiBwbGVhc2UgbGV0IG1lIGtub3csIGlmIHRo
ZXJlJ3MgYW55dGhpbmcgSSd2ZSBtaXNzZWQKCk9oLCBJIHNlZSwgaXQgYWx3YXlzIHRyeSB0byBh
bGxvY2F0ZSBzZWdtZW50cyBzZXF1ZW50aWFsbHkgaW4gYSBsYXJnZQpzZWN0aW9uLXNpemUgaW1h
Z2UsIHRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4gOikKCnN0YXRpYyB1bnNpZ25lZCBpbnQg
X19nZXRfbmV4dF9zZWdubyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlKQp7Ci4u
LgoJaWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKSB7Ci4uLgoJCXJldHVybiBjdXJzZWctPnNl
Z25vOwouLi4KfQoKc3RhdGljIGludCBuZXdfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgaW50IHR5cGUsIGJvb2wgbmV3X3NlYykKewouLi4KCXNlZ25vID0gX19nZXRfbmV4dF9zZWdu
byhzYmksIHR5cGUpOwoJcmV0ID0gZ2V0X25ld19zZWdtZW50KHNiaSwgJnNlZ25vLCBuZXdfc2Vj
LCBwaW5uaW5nKTsKLi4uCn0KCkJUVywgSSBndWVzcyBpdCBjb3VsZCBiZSBtb3JlIGVmZmljaWVu
dCBpZiB3ZSBjYW4gcmV1c2UgZnJlZSBzZWdtZW50IGluCmRpcnR5IHNlY3Rpb24gZm9yIGNvbnZl
bnRpb25hbCBkZXZpY2UuCgo+IFRoYW5rcwo+IAo+IHN0YXRpYyBpbnQgZ2V0X25ld19zZWdtZW50
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAJCQl1bnNpZ25lZCBpbnQgKm5ld3NlZywgYm9v
bCBuZXdfc2VjLCBib29sIHBpbm5pbmcpCj4gCj4gCWlmICghbmV3X3NlYyAmJiAoKCpuZXdzZWcg
KyAxKSAlIFNFR1NfUEVSX1NFQyhzYmkpKSkgewo+IAkJc2Vnbm8gPSBmaW5kX25leHRfemVyb19i
aXQoZnJlZV9pLT5mcmVlX3NlZ21hcCwKPiAJCQlHRVRfU0VHX0ZST01fU0VDKHNiaSwgaGludCAr
IDEpLCAqbmV3c2VnICsgMSk7Cj4gCQlpZiAoc2Vnbm8gPCBHRVRfU0VHX0ZST01fU0VDKHNiaSwg
aGludCArIDEpKQo+IAkJCWdvdG8gZ290X2l0Owo+IAl9Cj4gCj4gZmluZF9vdGhlcl96b25lOgo+
IAlzZWNubyA9IGZpbmRfbmV4dF96ZXJvX2JpdChmcmVlX2ktPmZyZWVfc2VjbWFwLCBNQUlOX1NF
Q1Moc2JpKSwgaGludCk7Cj4gCj4+Pj4KPj4+PiBUaGFua3MsCj4+PiBUaGUgZGV0YWlsZWQgc2Nl
bmFyaW8KPj4+IHNlZ3NfcGVyX3NlYz0yCj4+PiAtIHNlZyMwIGFuZCBzZWcjMSBhcmUgYWxsIGRp
cnR5Cj4+PiAtIGFsbCB2YWxpZCBibG9ja3MgYXJlIHJlbW92ZWQgaW4gc2VnIzEKPj4+IC0gZ2Mg
c2VsZWN0IHRoaXMgc2VjIGFuZCBuZXh0X3ZpY3RpbV9zZWc9c2VnIzAKPj4+IC0gbWlncmF0ZSBz
ZWcjMCwgbmV4dF92aWN0aW1fc2VnPXNlZyMxCj4+PiAtIGNoZWNrcG9pbnQgLT4gc2VjKHNlZyMw
LCBzZWcjMSkgIGJlY29tZXMgZnJlZQoKU28sIGZvciB0aGlzIGNhc2UsIHdlIGNhbiBoYW5kbGUg
aXQgb25seSBpbiBjaGVja3BvaW50LgoKPj4gKwlpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNlY25v
LCBkaXJ0eV9pLT52aWN0aW1fc2VjbWFwKSkKPj4gKwkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdf
R0NdID0gTlVMTF9TRUdOTzsKCkRvIHdlIG5lZWQgdG8gaGFuZGxlIHNiaS0+bmV4dF92aWN0aW1f
c2VnW0ZHX0dDXSBhcyB3ZWxsPwoKVGhhbmtzLAoKPj4+IC0gYWxsb2NhdG9yIGFzc2lnbnMgc2Vj
KHNlZyMwLCBzZWcjMSkgdG8gY3Vyc2VnCj4+PiAtIGdjIHRyaWVzIHRvIG1pZ3JhdGUgc2VnIzEK
Pj4+Pgo+Pj4+PiAgICAgICAgICAgICAgICAgfQo+Pj4+PiAgICAgICAgIH0KPj4+Pj4+Cj4+Pj4+
Pj4KPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSU1PLCB3ZSBjYW4gY2xl
YXIgbmV4dF92aWN0aW1fc2VnW10gb25jZSBzZWN0aW9uIGlzIGZyZWUgaW4KPj4+Pj4+Pj4+PiBf
X3NldF90ZXN0X2FuZF9mcmVlKCk/IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4+Pj4+PiBJIHdp
bGwgdGVzdCBpdCBhY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0aW9uLgo+Pj4+Pj4+Pj4gSWYgdGhl
cmUgYXJlIG5vIGlzc3VlcywgY2FuIEkgc3VibWl0IGl0IGFnYWluIHdpdGggdGhlIHBhdGNoPwo+
Pj4+Pj4+Pj4gVGhhbmtzCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+PiAgICAg
ZnMvZjJmcy9zZWdtZW50LmggfCAxMyArKysrKysrKysrLS0tCj4+Pj4+Pj4+Pj4gICAgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50
LmggaW5kZXgKPj4+Pj4+Pj4+PiAwNDY1ZGMwMGIzNDkuLjgyNmUzNzk5OTA4NSAxMDA2NDQKPj4+
Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuaAo+Pj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
c2VnbWVudC5oCj4+Pj4+Pj4+Pj4gQEAgLTQ3Myw5ICs0NzMsMTYgQEAgc3RhdGljIGlubGluZSB2
b2lkCj4+Pj4+Pj4+Pj4gX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCj4+Pj4+Pj4+Pj4gICAgIAkJCWdvdG8gc2tpcF9mcmVlOwo+Pj4+Pj4+Pj4+ICAgICAJCW5l
eHQgPSBmaW5kX25leHRfYml0KGZyZWVfaS0+ZnJlZV9zZWdtYXAsCj4+Pj4+Pj4+Pj4gICAgIAkJ
CQlzdGFydF9zZWdubyArIFNFR1NfUEVSX1NFQyhzYmkpLAo+Pj4+Pj4gc3RhcnRfc2Vnbm8pOwo+
Pj4+Pj4+Pj4+IC0JCWlmIChuZXh0ID49IHN0YXJ0X3NlZ25vICsgdXNhYmxlX3NlZ3MpIHsKPj4+
Pj4+Pj4+PiAtCQkJaWYgKHRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZnJlZV9pLQo+Pj4+PiBm
cmVlX3NlY21hcCkpCj4+Pj4+Pj4+Pj4gLQkJCQlmcmVlX2ktPmZyZWVfc2VjdGlvbnMrKzsKPj4+
Pj4+Pj4+PiArCQlpZiAoKG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2VncykgJiYKPj4+
Pj4+Pj4+PiArCQkJdGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBmcmVlX2ktPmZyZWVfc2VjbWFw
KSkKPj4+PiB7Cj4+Pj4+Pj4+Pj4gKwkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+Pj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3Rp
bV9zZWdbQkdfR0NdKQo+Pj4+ID09Cj4+Pj4+Pj4+Pj4gKwkJCQkJCQkJCXNlY25vKQo+Pj4+Pj4+
Pj4+ICsJCQkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4+
Pj4+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0Nd
KQo+Pj4+ID09Cj4+Pj4+Pj4+Pj4gKwkJCQkJCQkJCXNlY25vKQo+Pj4+Pj4+Pj4+ICsJCQkJc2Jp
LT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4+Pj4+PiAgICAgCQl9
Cj4+Pj4+Pj4+Pj4gICAgIAl9Cj4+Pj4+Pj4+Pj4gICAgIHNraXBfZnJlZToKPj4+Pj4+Pj4+PiAt
LQo+Pj4+Pj4+Pj4+IDIuNDAuMQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+Pj4gQmVjYXVzZSB0aGUgY2FsbCBzdGFjayBpcyBkaWZmZXJlbnQsIEkgdGhp
bmsgdGhhdCBpbiBvcmRlcgo+Pj4+Pj4+Pj4+Pj4+IHRvIGhhbmRsZSBldmVyeXRoaW5nIGF0IG9u
Y2UsIHdlIG5lZWQgdG8gYWRkcmVzcyBpdCB3aXRoaW4KPj4+Pj4+Pj4+Pj4+PiBkb19nYXJiYWdl
X2NvbGxlY3QsIG9yIG90aGVyd2lzZSBpbmNsdWRlIGl0IG9uIGJvdGggc2lkZXMuCj4+Pj4+Pj4+
Pj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBbMzAx
NDYuMzM3NDcxXVsgVDEzMDBdIEYyRlMtZnMgKGRtLTU0KTogSW5jb25zaXN0ZW50IHNlZ21lbnQK
Pj4+Pj4+Pj4+Pj4+PiAoNzA5NjEpIHR5cGUgWzAsIDFdIGluIFNTQSBhbmQgU0lUIFszMDE0Ni4z
NDYxNTFdWyBUMTMwMF0KPj4+Pj4+Pj4+Pj4+PiBDYWxsCj4+Pj4+PiB0cmFjZToKPj4+Pj4+Pj4+
Pj4+PiBbMzAxNDYuMzQ2MTUyXVsgVDEzMDBdICBkdW1wX2JhY2t0cmFjZSsweGU4LzB4MTBjCj4+
Pj4+Pj4+Pj4+Pj4gWzMwMTQ2LjM0NjE1N11bIFQxMzAwXSAgc2hvd19zdGFjaysweDE4LzB4Mjgg
WzMwMTQ2LjM0NjE1OF1bCj4+Pj4+Pj4+Pj4+Pj4gVDEzMDBdIGR1bXBfc3RhY2tfbHZsKzB4NTAv
MHg2YyBbMzAxNDYuMzQ2MTYxXVsgVDEzMDBdCj4+Pj4+Pj4+Pj4+Pj4gZHVtcF9zdGFjaysweDE4
LzB4MjggWzMwMTQ2LjM0NjE2Ml1bIFQxMzAwXQo+Pj4+Pj4+Pj4+Pj4+IGYyZnNfc3RvcF9jaGVj
a3BvaW50KzB4MWMvMHgzYyBbMzAxNDYuMzQ2MTY1XVsgVDEzMDBdCj4+Pj4+Pj4+Pj4+Pj4gZG9f
Z2FyYmFnZV9jb2xsZWN0KzB4NDFjLzB4MjcxYyBbMzAxNDYuMzQ2MTY3XVsgVDEzMDBdCj4+Pj4+
Pj4+Pj4+Pj4gZjJmc19nYysweDI3Yy8weDgyOCBbMzAxNDYuMzQ2MTY4XVsgVDEzMDBdCj4+Pj4+
Pj4+Pj4+Pj4gZ2NfdGhyZWFkX2Z1bmMrMHgyOTAvMHg4OGMgWzMwMTQ2LjM0NjE2OV1bIFQxMzAw
XQo+Pj4+Pj4+Pj4+Pj4+IGt0aHJlYWQrMHgxMWMvMHgxNjQgWzMwMTQ2LjM0NjE3Ml1bIFQxMzAw
XQo+Pj4+Pj4+Pj4+Pj4+IHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwCj4+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+PiBzdHJ1Y3QgY3Vyc2VnX2luZm8gOiAweGZmZmZmZjgwM2Y5NWU4MDAgewo+Pj4+
Pj4+Pj4+Pj4+IAlzZWdubyAgICAgICAgOiAweDExNTMxIDogNzA5NjEKPj4+Pj4+Pj4+Pj4+PiB9
Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBzdHJ1Y3QgZjJmc19zYl9pbmZvIDogMHhmZmZm
ZmY4ODExZDEyMDAwIHsKPj4+Pj4+Pj4+Pj4+PiAJbmV4dF92aWN0aW1fc2VnWzBdIDogMHgxMTUz
MSA6IDcwOTYxIH0KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUwMzI1MDgwNjQ2LjMy
OQo+Pj4+Pj4+Pj4+Pj4+PiAxOQo+Pj4+Pj4+Pj4+Pj4+PiA0Nwo+Pj4+Pj4+Pj4+Pj4+PiAtMgo+
Pj4+Pj4+Pj4+Pj4+PiAtCj4+Pj4+Pj4+Pj4+Pj4+IGNoYW9Aa2VybmVsLm9yZwo+Pj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9oYW4gSm91bmcgPHlvaGFuLmpvdW5n
QHNrLmNvbT4KPj4+Pj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgIGZzL2YyZnMv
Z2MuYyB8IDQgKysrKwo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jIGluZGV4Cj4+Pj4+Pj4+Pj4+Pj4+PiAyYjhmOTIzOWJl
ZGUuLjRiNWQxOGUzOTVlYiAxMDA2NDQKPj4+Pj4+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZ2Mu
Ywo+Pj4+Pj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4+Pj4+Pj4+PiBAQCAt
MTkyNiw2ICsxOTI2LDEwIEBAIGludCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8KPj4+Pj4+
Pj4+Pj4+Pj4+ICpzYmksIHN0cnVjdAo+Pj4+Pj4+Pj4+Pj4+PiBmMmZzX2djX2NvbnRyb2wgKmdj
X2NvbnRyb2wpCj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgCQlnb3RvIHN0b3A7Cj4+Pj4+Pj4+Pj4+Pj4+
PiAgICAgCX0KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiArCWlmIChfX2lzX2xhcmdl
X3NlY3Rpb24oc2JpKSAmJgo+Pj4+Pj4+Pj4+Pj4+Pj4gKwkJCUlTX0NVUlNFQyhzYmksIEdFVF9T
RUNfRlJPTV9TRUcoc2JpLAo+PiBzZWdubykpKQo+Pj4+Pj4+Pj4+Pj4+Pj4gKwkJZ290byBzdG9w
Owo+Pj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgIAlzZWdfZnJlZWQgPSBkb19n
YXJiYWdlX2NvbGxlY3Qoc2JpLCBzZWdubywgJmdjX2xpc3QsCj4+Pj4gZ2NfdHlwZSwKPj4+Pj4+
Pj4+Pj4+Pj4+ICAgICAJCQkJZ2NfY29udHJvbC0+c2hvdWxkX21pZ3JhdGVfYmxvY2tzLAo+Pj4+
Pj4+Pj4+Pj4+Pj4gICAgIAkJCQlnY19jb250cm9sLT5vbmVfdGltZSk7Cj4+Pj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Cj4+Pgo+IAo+IAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
