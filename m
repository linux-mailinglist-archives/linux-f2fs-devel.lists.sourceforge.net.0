Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF81730BDCA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 13:10:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6uVo-00007q-Ou; Tue, 02 Feb 2021 12:10:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1l6uVn-00007i-3r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 12:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BZDkINtEXqY5nSvBta+vFmu79Vtx7wV3+jKrnFO+aPs=; b=ZWEGNkG1KW0Wo5Q7tp675YX6s9
 6TMJuwlgM1onDWZB6o8Wwxjg3VI++CyX4omnfLOQOoyIyLCJ7RVRKgiEWuvZE4KzPABTPWL1wsTJC
 Cx3v4HReVuLbsycJDgRAgr/LCiR+3wTy85quPJCvoOwdEuR2vn86sleW8eX5R4jiorkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BZDkINtEXqY5nSvBta+vFmu79Vtx7wV3+jKrnFO+aPs=; b=j1UuoiwSvXc0pb1n49kgOnHuNc
 H3h9Jnykfy3EEuhsA/Obu0S9QAIT79OuusgmAGoB4yHposVgbPEYZ9347BI+JHPWR675FDsl1obDf
 qnjbYRjWz4w48gskyHSVOpJ4XjBSW8zh920ZU/NtEe6T+VE38dpG7MbUIIZsGcTLAI2E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l6uVb-00Ec35-Ix
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 12:10:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8746B64F5D;
 Tue,  2 Feb 2021 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612267804;
 bh=9+NYi16sShih4NLwkXwFR5WL/nfdEw9USH/MLzlKLf0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cnCXmnLPICDPpfKwbfP/LBk5ogUDs17Blml0u/mNc6+BAZjELgSZ/vc+M2LJSzPxC
 Egbx1BANNIaL8tao/EqSIQr6RMx6AdGG/6BXWkBYKAV84TV8Tz0wa5pQadGf89CRKr
 dMUWVA7m0Nraur8yoM/i5vmDFRDN2osl/gbTFDg7cNKGvfo1zvIDCpbIb3WFAcziCt
 ZrSPQVL0ZaqvksAYYkiKuvR4ij0vjGyQ6rTtjb/LTalVo2LzC6utYCOme/+KcZKMTK
 Zxd4zcQt9SaB6a4GL4qqIB2Ps2ix/0yK9alNHrAMRrzsOfk9WFhuZiQrErBNHhMi+I
 xIlL8Pr8aDF5Q==
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <yuchao0@huawei.com>
References: <20210202092332.2562006-1-daeho43@gmail.com>
 <a7adaf99-0df1-cf4a-a60a-d47a104f51aa@huawei.com>
 <CACOAw_wmodtCvDRa_1hh2=u9AP3Qg6VBGG4K1by9QJNGweApVA@mail.gmail.com>
 <938ce080-d211-0834-64b4-fd4836a26d5a@huawei.com>
 <CACOAw_xLcARkqx7oQjLT--vxVHWBxdSz6dN0B00m9ejO+S7qoQ@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b925bd13-4a9f-21f5-41f0-b2556dabe065@kernel.org>
Date: Tue, 2 Feb 2021 20:09:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_xLcARkqx7oQjLT--vxVHWBxdSz6dN0B00m9ejO+S7qoQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6uVb-00Ec35-Ix
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: rename checkpoint=merge mount
 option to checkpoint_merge
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8yLzIgMTk6MjksIERhZWhvIEplb25nIHdyb3RlOgo+IFRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uLgo+IAo+IEkgYW0gZ29pbmcgdG8gcmVtb3ZlIHRoZSBsaW5lIGNsZWFyaW5nICJN
RVJHRV9DSEVDS1BPSU5UIi4KPiBCdXQsIHdoZW4gd2UgZ28gd2l0aCB0aGUgYmVsb3cgcmVtb3Vu
dCBjb21tYW5kLCBJIHRoaW5rIHRoZQo+ICJub2NoZWNrcG9pbnRfbWVyZ2UiIG9wdGlvbiB3aWxs
IHdvcmsgd2VsbCB0byBkaXNhYmxlIG9ubHkganVzdAo+ICJjaGVja3BvaW50X21lcmdlIiBmcm9t
IHRoZSBwcmV2aW91cyBvcHRpb24uCj4gIm1vdW50IC1vIHJlbW91bnQsbm9jaGVja3BvaW50X21l
cmdlICAvZGlyIgo+IAo+IEl0IHdvdWxkIGJlIG1vcmUgY29udmVuaWVudCB0byB1c2Vycy4gV2hh
dCBkbyB5b3UgdGhpbms/CgpJdCdzIGZpbmUgdG8gbWUsIHBsZWFzZSBnbyBhaGVhZC4gOikKClRo
YW5rcywKCj4gCj4gMjAyMeuFhCAy7JuUIDLsnbwgKO2ZlCkg7Jik7ZuEIDY6NTUsIENoYW8gWXUg
PHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Pgo+PiBPbiAyMDIxLzIvMiAxNzo0
NCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBXaGVuIHdlIHJlbW91bnQgaXQgd2l0aG91dCB0aGUg
ImNoZWNrcG9pbnRfbWVyZ2UiIG9wdGlvbiwgc2hvdWxkbid0IHdlCj4+PiBuZWVkIHRvIGNsZWFy
ICJNRVJHRV9DSEVDS1BPSU5UIiBhZ2Fpbj8KPj4+IFRoaXMgaXMgYWN0dWFsbHkgd2hhdCBJIGlu
dGVuZGVkLCBidXQgSSB3YXMgd3JvbmcuIEFjdHVhbGx5LCBJIGZvdW5kIHRoaXMuCj4+Pgo+Pj4g
V2hlbiB3ZSByZW1vdW50IHRoZSBmaWxlc3lzdGVtLCB0aGUgcHJldmlvdXMgbW91bnQgb3B0aW9u
IGlzIHBhc3NlZAo+Pj4gdGhyb3VnaCB0aGUgImRhdGEiIGFyZ3VtZW50IGluIHRoZSBiZWxvdy4K
Pj4+IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFy
ICpkYXRhKQo+Pj4KPj4+IElmIHdlIGRvbid0IHByb3ZpZGUgdGhlICJub2NoZWNrcG9pbnRfbWVy
Z2UiIG9wdGlvbiwgaG93IGNhbiB3ZSB0dXJuCj4+PiBvZmYgdGhlICJjaGVja3BvaW50X21lcmdl
IiBvcHRpb24gd2hpY2ggaXMgdHVybmVkIG9uIGluIHRoZSBwcmV2aW91cwo+Pj4gbW91bnQ/Cj4+
Cj4+IFdlIGNhbiB1c2UgIm1vdW50IC1vIHJlbW91bnQgL2Rldi94eHggL21udCIgdG8gZGlzYWJs
ZSBjaGVja3BvaW50X21lcmdlLAo+PiBzaW5jZSB0aGF0IGNvbW1hbmQgd29uJ3QgcGFzcyBvbGQg
bW91bnQgb3B0aW9ucyB0byByZW1vdW50Pwo+Pgo+PiBRdW90ZWQgZnJvbSBtYW4gbW91bnQ6Cj4+
Cj4+ICAgICAgICAgICAgICAgICBtb3VudCAtbyByZW1vdW50LHJ3IC9kZXYvZm9vIC9kaXIKPj4K
Pj4gICAgICAgICAgICAgICAgIEFmdGVyICB0aGlzICBjYWxsICBhbGwgIG9sZCAgbW91bnQgb3B0
aW9ucyBhcmUgcmVwbGFjZWQgYW5kIGFyYml0cmFyeSBzdHVmZiBmcm9tIGZzdGFiIChvciBtdGFi
KSBpcyBpZ25vcmVkLCBleGNlcHQgdGhlIGxvb3A9IG9wdGlvbiB3aGljaCBpcyBpbnRlcm5hbGx5
IGdlbmVyYXRlZCBhbmQgbWFpbnRhaW5lZCBieSB0aGUKPj4gICAgICAgICAgICAgICAgIG1vdW50
IGNvbW1hbmQuCj4+Cj4+ICAgICAgICAgICAgICAgICBtb3VudCAtbyByZW1vdW50LHJ3ICAvZGly
Cj4+Cj4+ICAgICAgICAgICAgICAgICBBZnRlciB0aGlzIGNhbGwgbW91bnQgcmVhZHMgZnN0YWIg
YW5kIG1lcmdlcyB0aGVzZSBvcHRpb25zIHdpdGggdGhlIG9wdGlvbnMgZnJvbSB0aGUgY29tbWFu
ZCBsaW5lICgtbykuIElmIG5vIG1vdW50cG9pbnQgZm91bmQgaW4gZnN0YWIgdGhhbiByZW1vdW50
IHdpdGggdW5zcGVjaWZpZWQgc291cmNlIGlzIGFsbG93ZWQuCj4+Cj4+IFRoYW5rcywKPj4KPj4+
Cj4+PiAyMDIx64WEIDLsm5QgMuydvCAo7ZmUKSDsmKTtm4QgNjoyOCwgQ2hhbyBZdSA8eXVjaGFv
MEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4+Pj4KPj4+PiBPbiAyMDIxLzIvMiAxNzoyMywg
RGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdv
b2dsZS5jb20+Cj4+Pj4+Cj4+Pj4+IEFzIGNoZWNrcG9pbnQ9bWVyZ2UgY29tZXMgaW4sIG1vdW50
IG9wdGlvbiBzZXR0aW5nIHJlbGF0ZWQgdG8gY2hlY2twb2ludAo+Pj4+PiBoYWQgYmVlbiBtaXhl
ZCB1cCBhbmQgaXQgYmVjYW1lIGhhcmQgdG8gdW5kZXJzdGFuZC4gU28sIEkgc2VwYXJhdGVkCj4+
Pj4+IHRoaXMgb3B0aW9uIGZyb20gImNoZWNrcG9pbnQ9IiBhbmQgbWFkZSBhbm90aGVyIG1vdW50
IG9wdGlvbgo+Pj4+PiAiY2hlY2twb2ludF9tZXJnZSIgZm9yIHRoaXMuCj4+Pj4+Cj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+IC0t
LQo+Pj4+PiB2MjogcmVuYW1lZCAiY2hlY2twb2ludD1tZXJnZSIgdG8gImNoZWNrcG9pbnRfbWVy
Z2UiCj4+Pj4+IHYzOiByZW1vdmVkICJub2NoZWNrcG9pbnRfbWVyZ2UiIG9wdGlvbgo+Pj4+PiAt
LS0KPj4+Pj4gICAgIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5yc3QgfCAgNiArKyst
LS0KPj4+Pj4gICAgIGZzL2YyZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgfCAyMSArKysr
KysrKystLS0tLS0tLS0tLS0KPj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZz
LnJzdAo+Pj4+PiBpbmRleCBkMGVhZDQ1ZGM3MDYuLjQ3NTk5NGVkOGIxNSAxMDA2NDQKPj4+Pj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdAo+Pj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0Cj4+Pj4+IEBAIC0yNDcsOSArMjQ3LDkgQEAg
Y2hlY2twb2ludD0lc1s6JXVbJV1dICAgICAgU2V0IHRvICJkaXNhYmxlIiB0byB0dXJuIG9mZiBj
aGVja3BvaW50aW5nLiBTZXQgdG8gImVuYWJsCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBoaWRlIHVwIHRvIGFsbCByZW1haW5pbmcgZnJlZSBzcGFjZS4gVGhlIGFjdHVhbCBzcGFjZSB0
aGF0Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB3b3VsZCBiZSB1bnVzYWJsZSBjYW4g
YmUgdmlld2VkIGF0IC9zeXMvZnMvZjJmcy88ZGlzaz4vdW51c2FibGUKPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIFRoaXMgc3BhY2UgaXMgcmVjbGFpbWVkIG9uY2UgY2hlY2twb2ludD1l
bmFibGUuCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgSGVyZSBpcyBhbm90aGVyIG9wdGlv
biAibWVyZ2UiLCB3aGljaCBjcmVhdGVzIGEga2VybmVsIGRhZW1vbgo+Pj4+PiAtICAgICAgICAg
ICAgICAgICAgICAgIGFuZCBtYWtlcyBpdCB0byBtZXJnZSBjb25jdXJyZW50IGNoZWNrcG9pbnQg
cmVxdWVzdHMgYXMgbXVjaAo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgIGFzIHBvc3NpYmxl
IHRvIGVsaW1pbmF0ZSByZWR1bmRhbnQgY2hlY2twb2ludCBpc3N1ZXMuIFBsdXMsCj4+Pj4+ICtj
aGVja3BvaW50X21lcmdlICAgICAgV2hlbiBjaGVja3BvaW50IGlzIGVuYWJsZWQsIHRoaXMgY2Fu
IGJlIHVzZWQgdG8gY3JlYXRlIGEga2VybmVsCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ZGFlbW9uIGFuZCBtYWtlIGl0IHRvIG1lcmdlIGNvbmN1cnJlbnQgY2hlY2twb2ludCByZXF1ZXN0
cyBhcwo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgIG11Y2ggYXMgcG9zc2libGUgdG8gZWxp
bWluYXRlIHJlZHVuZGFudCBjaGVja3BvaW50IGlzc3Vlcy4gUGx1cywKPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHdlIGNhbiBlbGltaW5hdGUgdGhlIHNsdWdnaXNoIGlzc3VlIGNhdXNl
ZCBieSBzbG93IGNoZWNrcG9pbnQKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIG9wZXJh
dGlvbiB3aGVuIHRoZSBjaGVja3BvaW50IGlzIGRvbmUgaW4gYSBwcm9jZXNzIGNvbnRleHQgaW4K
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIGEgY2dyb3VwIGhhdmluZyBsb3cgaS9vIGJ1
ZGdldCBhbmQgY3B1IHNoYXJlcy4gVG8gbWFrZSB0aGlzCj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4gaW5kZXggNTY2OTZmNmNmYTg2Li5i
NjBkY2VmN2Y5ZDAgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+PiArKysg
Yi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4gQEAgLTIxNSw3ICsyMTUsNyBAQCBzdGF0aWMgbWF0Y2hf
dGFibGVfdCBmMmZzX3Rva2VucyA9IHsKPj4+Pj4gICAgICAgICB7T3B0X2NoZWNrcG9pbnRfZGlz
YWJsZV9jYXAsICJjaGVja3BvaW50PWRpc2FibGU6JXUifSwKPj4+Pj4gICAgICAgICB7T3B0X2No
ZWNrcG9pbnRfZGlzYWJsZV9jYXBfcGVyYywgImNoZWNrcG9pbnQ9ZGlzYWJsZToldSUlIn0sCj4+
Pj4+ICAgICAgICAge09wdF9jaGVja3BvaW50X2VuYWJsZSwgImNoZWNrcG9pbnQ9ZW5hYmxlIn0s
Cj4+Pj4+IC0gICAgIHtPcHRfY2hlY2twb2ludF9tZXJnZSwgImNoZWNrcG9pbnQ9bWVyZ2UifSwK
Pj4+Pj4gKyAgICAge09wdF9jaGVja3BvaW50X21lcmdlLCAiY2hlY2twb2ludF9tZXJnZSJ9LAo+
Pj4+PiAgICAgICAgIHtPcHRfY29tcHJlc3NfYWxnb3JpdGhtLCAiY29tcHJlc3NfYWxnb3JpdGht
PSVzIn0sCj4+Pj4+ICAgICAgICAge09wdF9jb21wcmVzc19sb2dfc2l6ZSwgImNvbXByZXNzX2xv
Z19zaXplPSV1In0sCj4+Pj4+ICAgICAgICAge09wdF9jb21wcmVzc19leHRlbnNpb24sICJjb21w
cmVzc19leHRlbnNpb249JXMifSwKPj4+Pj4gQEAgLTExNDIsMTIgKzExNDIsNiBAQCBzdGF0aWMg
aW50IHBhcnNlX29wdGlvbnMoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgY2hhciAqb3B0aW9ucywg
Ym9vbCBpc19yZW1vdW50KQo+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+
Pj4+ICAgICAgICAgfQo+Pj4+Pgo+Pj4+PiAtICAgICBpZiAodGVzdF9vcHQoc2JpLCBESVNBQkxF
X0NIRUNLUE9JTlQpICYmCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICB0ZXN0X29wdChzYmks
IE1FUkdFX0NIRUNLUE9JTlQpKSB7Cj4+Pj4+IC0gICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAi
Y2hlY2twb2ludD1tZXJnZSBjYW5ub3QgYmUgdXNlZCB3aXRoIGNoZWNrcG9pbnQ9ZGlzYWJsZVxu
Iik7Cj4+Pj4+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+IC0gICAgIH0KPj4+
Pj4gLQo+Pj4+PiAgICAgICAgIC8qIE5vdCBwYXNzIGRvd24gd3JpdGUgaGludHMgaWYgdGhlIG51
bWJlciBvZiBhY3RpdmUgbG9ncyBpcyBsZXNzZXIKPj4+Pj4gICAgICAgICAgKiB0aGFuIE5SX0NV
UlNFR19QRVJTSVNUX1RZUEUuCj4+Pj4+ICAgICAgICAgICovCj4+Pj4+IEBAIC0xNzgyLDcgKzE3
NzYsNyBAQCBzdGF0aWMgaW50IGYyZnNfc2hvd19vcHRpb25zKHN0cnVjdCBzZXFfZmlsZSAqc2Vx
LCBzdHJ1Y3QgZGVudHJ5ICpyb290KQo+Pj4+PiAgICAgICAgICAgICAgICAgc2VxX3ByaW50Zihz
ZXEsICIsY2hlY2twb2ludD1kaXNhYmxlOiV1IiwKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBGMkZTX09QVElPTihzYmkpLnVudXNhYmxlX2NhcCk7Cj4+Pj4+ICAgICAgICAg
aWYgKHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpCj4+Pj4+IC0gICAgICAgICAgICAg
c2VxX3B1dHMoc2VxLCAiLGNoZWNrcG9pbnQ9bWVyZ2UiKTsKPj4+Pj4gKyAgICAgICAgICAgICBz
ZXFfcHV0cyhzZXEsICIsY2hlY2twb2ludF9tZXJnZSIpOwo+Pj4+PiAgICAgICAgIGlmIChGMkZT
X09QVElPTihzYmkpLmZzeW5jX21vZGUgPT0gRlNZTkNfTU9ERV9QT1NJWCkKPj4+Pj4gICAgICAg
ICAgICAgICAgIHNlcV9wcmludGYoc2VxLCAiLGZzeW5jX21vZGU9JXMiLCAicG9zaXgiKTsKPj4+
Pj4gICAgICAgICBlbHNlIGlmIChGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgPT0gRlNZTkNf
TU9ERV9TVFJJQ1QpCj4+Pj4+IEBAIC0xODI3LDYgKzE4MjEsNyBAQCBzdGF0aWMgdm9pZCBkZWZh
dWx0X29wdGlvbnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+PiAgICAgICAgIHNiaS0+
c2ItPnNfZmxhZ3MgfD0gU0JfTEFaWVRJTUU7Cj4+Pj4+ICAgICAgICAgc2V0X29wdChzYmksIEZM
VVNIX01FUkdFKTsKPj4+Pj4gICAgICAgICBzZXRfb3B0KHNiaSwgRElTQ0FSRCk7Cj4+Pj4+ICsg
ICAgIGNsZWFyX29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+Pj4+Cj4+Pj4gSXQncyBub3Qg
bmVlZGVkIGhlcmU/Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4gICAgICAgICBpZiAoZjJm
c19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4+Pj4gICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9O
KHNiaSkuZnNfbW9kZSA9IEZTX01PREVfTEZTOwo+Pj4+PiAgICAgICAgIGVsc2UKPj4+Pj4gQEAg
LTIwNjYsOSArMjA2MSw4IEBAIHN0YXRpYyBpbnQgZjJmc19yZW1vdW50KHN0cnVjdCBzdXBlcl9i
bG9jayAqc2IsIGludCAqZmxhZ3MsIGNoYXIgKmRhdGEpCj4+Pj4+ICAgICAgICAgICAgICAgICB9
Cj4+Pj4+ICAgICAgICAgfQo+Pj4+Pgo+Pj4+PiAtICAgICBpZiAoIXRlc3Rfb3B0KHNiaSwgTUVS
R0VfQ0hFQ0tQT0lOVCkpIHsKPj4+Pj4gLSAgICAgICAgICAgICBmMmZzX3N0b3BfY2twdF90aHJl
YWQoc2JpKTsKPj4+Pj4gLSAgICAgfSBlbHNlIHsKPj4+Pj4gKyAgICAgaWYgKCF0ZXN0X29wdChz
YmksIERJU0FCTEVfQ0hFQ0tQT0lOVCkgJiYKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHRl
c3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPj4+Pj4gICAgICAgICAgICAgICAgIGVy
ciA9IGYyZnNfc3RhcnRfY2twdF90aHJlYWQoc2JpKTsKPj4+Pj4gICAgICAgICAgICAgICAgIGlm
IChlcnIpIHsKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIoc2JpLAo+Pj4+
PiBAQCAtMjA3Niw2ICsyMDcwLDggQEAgc3RhdGljIGludCBmMmZzX3JlbW91bnQoc3RydWN0IHN1
cGVyX2Jsb2NrICpzYiwgaW50ICpmbGFncywgY2hhciAqZGF0YSkKPj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVycik7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
cmVzdG9yZV9nYzsKPj4+Pj4gICAgICAgICAgICAgICAgIH0KPj4+Pj4gKyAgICAgfSBlbHNlIHsK
Pj4+Pj4gKyAgICAgICAgICAgICBmMmZzX3N0b3BfY2twdF90aHJlYWQoc2JpKTsKPj4+Pj4gICAg
ICAgICB9Cj4+Pj4+Cj4+Pj4+ICAgICAgICAgLyoKPj4+Pj4gQEAgLTM4MzEsNyArMzgyNyw4IEBA
IHN0YXRpYyBpbnQgZjJmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHZvaWQg
KmRhdGEsIGludCBzaWxlbnQpCj4+Pj4+Cj4+Pj4+ICAgICAgICAgLyogc2V0dXAgY2hlY2twb2lu
dCByZXF1ZXN0IGNvbnRyb2wgYW5kIHN0YXJ0IGNoZWNrcG9pbnQgaXNzdWUgdGhyZWFkICovCj4+
Pj4+ICAgICAgICAgZjJmc19pbml0X2NrcHRfcmVxX2NvbnRyb2woc2JpKTsKPj4+Pj4gLSAgICAg
aWYgKHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPj4+Pj4gKyAgICAgaWYgKCF0
ZXN0X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCkgJiYKPj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPj4+Pj4gICAgICAgICAg
ICAgICAgIGVyciA9IGYyZnNfc3RhcnRfY2twdF90aHJlYWQoc2JpKTsKPj4+Pj4gICAgICAgICAg
ICAgICAgIGlmIChlcnIpIHsKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIo
c2JpLAo+Pj4+Pgo+Pj4gLgo+Pj4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
