Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2F3A854FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 09:08:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u38VS-00035A-RJ;
	Fri, 11 Apr 2025 07:08:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u38VR-000352-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 07:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alNa+jTvrChJ+es6axsT39ri6cC/2lxAgBF1QvwhJKs=; b=IEuJES4+++8sfWrIKjFcssTYAg
 3ldxCOmkjrgKr307lJsvrhrVcUpteWrhyrxNvTZir694WwYMrz0OjvSWYFodd6CQc7BHF9hSZhI96
 7SlRxYoD8E3Esz0LHxyOCah6dzSn7t6kefjFBTG+EfuqMzvqN3HjP4JeUN5EumA+o9oU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=alNa+jTvrChJ+es6axsT39ri6cC/2lxAgBF1QvwhJKs=; b=XdxOn7tI98aQ45annd51N5aoDp
 ehqYOIAViWsFlH4Awf7Tax9iZF9DVFlIwMUxX6IzHFQ1ZKSaQVlOL7rfLROo4vwAPoTR5mIcAzlLc
 ARvF1Zy8IkT+sDRJ1hy72Pa0RHJbCpSDKZeQYTftKa43j8isK/Xpkz3CZ9EEs6w/yU4k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u38VB-00080j-IS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 07:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60C8943F0E;
 Fri, 11 Apr 2025 07:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10655C4CEE2;
 Fri, 11 Apr 2025 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744355312;
 bh=JdaPtBECEF8kBQpW9bKEXE1lyfEv6gUDJHPiFSFMtgc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=my67ZsIsbMajtTHL4GZOw2FPst/p3omhNTfgipefF3Fa0s/Z8Fkw6xChPLUXi0UD+
 Fvr8dEhfEs3+ZpPUPr8KP1WwlW6eDOpHAfNY56Dh6HcpCT3iidpNivDJAd42lt3K8t
 YQGtHlYV/eGfYwZajGGktOef9N3BqjkSi7UhROArMB9rRm5xe4MeLMwcFg4HrGIKgs
 k9wgF/qlqvdgUIX7eVC4aHSCdjIBl2YTLJ94Vz/ejTyczXC7GuCN555Q2Y9MgzT3Tm
 M7Cvn3gtOof3ax8Pg1ei3NmV4oGkST/KZZXqqeiRWoKvubA5f/49ZNE9wvtKVtK77v
 a7yJWlHTsUQYw==
Message-ID: <00a7102c-6fdc-4172-9461-d7023703a041@kernel.org>
Date: Fri, 11 Apr 2025 15:08:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com>
 <b5a8a872-5d62-424d-8af4-fb9a4a29385e@kernel.org>
 <CAD14+f3D+rFDDLp4-Po_i85U7LyknUQwFSYgZkJq-6s-wuAhTg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f3D+rFDDLp4-Po_i85U7LyknUQwFSYgZkJq-6s-wuAhTg@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/4/11 3:08, Juhyung Park wrote: > Hi Chao, > > On Thu,
    Apr 10, 2025 at 7:56 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2025/4/10
    16:32, Juhyung Park wrote: >>> Hi everyone. >>> >>> Besides [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [172.234.252.31 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.234.252.31 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u38VB-00080j-IS
Subject: Re: [f2fs-dev] Reproducing resize corruption
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
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDM6MDgsIEp1aHl1bmcgUGFyayB3cm90ZToKPiBIaSBDaGFvLAo+IAo+IE9u
IFRodSwgQXByIDEwLCAyMDI1IGF0IDc6NTbigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pgo+PiBPbiAyMDI1LzQvMTAgMTY6MzIsIEp1aHl1bmcgUGFyayB3cm90ZToKPj4+
IEhpIGV2ZXJ5b25lLgo+Pj4KPj4+IEJlc2lkZXMgc2FsdmFnaW5nIEB1cGxpbmtyJ3MgZGF0YSBb
MV0sIEkgZmlndXJlZCBpdCdzIGltcG9ydGFudCBmb3IgdXMKPj4+IHRvIHVuZGVyc3RhbmQgd2h5
IHJlc2l6ZSBjb3JydXB0cyBkYXRhIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4KPj4gWWVzLCBJIGZl
ZWwgdGhlIHNhbWUgd2l0aCB5b3UuCj4+Cj4+Pgo+Pj4gSSB0b29rIHNvbWUgdGltZSB0b2RheSB0
byBoYXZlIG15IGxhcHRvcCdzIDEuOFRpQiBmMmZzIHBhcnRpdGlvbgo+Pj4gcmVzaXplZCBzbGln
aHRseSBhbmQgbWFuYWdlZCB0byByZXByb2R1Y2UgdGhlIGRhdGEgY29ycnVwdGlvbi4KPj4+Cj4+
PiBJJ20gbm90IG5lY2Vzc2FyaWx5IHN1cmUgd2hldGhlciB0aGlzIHdvdWxkIGJlIHRoZSBzYW1l
IHN5bXB0b21zIGFzCj4+PiBAdXBsaW5rcidzLCBidXQgaXQncyBwcm9iYWJseSBsaWtlbHkuCj4+
Cj4+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlcHJvZHVjaW5nLCBhbmQgZ29vZCBjYXRjaCEKPj4K
Pj4+Cj4+PiBIZXJlJ3Mgd2hhdCBJIGRpZDoKPj4+IDEuIFJlbW91bnRlZCB0byBjaGVja3BvaW50
PWRpc2FibGUKPj4+IDIuIENyZWF0ZSBhIGRtLXNuYXBzaG90IG9mIHRoZSBjdXJyZW50IHJvb3Qg
ZGV2aWNlCj4+PiAzLiBNb3VudCBzbmFwc2hvdCB0byByZXBsYXkgdGhlIGxvZwo+Pj4gNC4gVW5t
b3VudAo+Pj4gNS4gUmVzaXplIHNlY3RvciA0ODcyNDg4OTYgdG8gNDg2NTM5MjY0Cj4+Cj4+IEB1
cGxpbmtyJ3MgY2FzZSBpcyBleHBhbmRpbmcgcGFydGl0aW9uLCBub3QgdGhlIHNhbWUgdy8gc2hy
aW5rIG9uZS4KPiAKPiBJdCBtdXN0IGhhdmUgZ29uZSB0aHJvdWdoIHNocmluayBhbmQgZXhwYW5k
LCB0aGF0J3MgaG93IGdwYXJ0ZWQgd29ya3MgaWlyYy4KPiAKPiBUbyBiZSBzcGVjaWZpYywgaGlz
IGNhc2Ugd2FzIGV4cGFuZGluZyB0aGUgcGFydGl0aW9uIHRvIGEgZGlmZmVyZW50Cj4gb2Zmc2V0
LiBUbyByZWR1Y2UgdGltZSByZXF1aXJlZCBmb3IgdGhpcywgZ3BhcnRlZCBmaXJzdCBzaHJpbmtz
IHRoZQo+IHBhcnRpdGlvbiBhcyBtdWNoIGFzIGl0IGNhbiBpbnBsYWNlLCBhbmQgdGhlbiBtb3Zl
IGl0IHRvIHRoZSBuZXcKPiBvZmZzZXQsIGFuZCB0aGVuIGV4cGFuZCBpdCBiYWNrIHRvIGZ1bGwg
c2l6ZS4gTWF5YmUgdGhpcyBzY2VuYXJpbwo+IHByb2R1Y2VzIHNvbWUgYnVnPwo+IAo+Pgo+Pj4g
IyAuL3Jlc2l6ZS5mMmZzIC1kIDMgLXMgLWkgL2Rldi9tYXBwZXIvc25hcCAtdCA0ODY1MzkyNjQK
Pj4KPj4gQWxzbywgSSBkaWRuJ3Qgc2VlIGxhcmdlX25hdF9iaXRtYXAgZmxhZyBpbiBoaXMgZnNj
ay5sb2cuCj4+Cj4+Pgo+Pj4gTGF0ZXN0IGYyZnMtdG9vbHMgd2FzIHVzZWQ6Cj4+PiAzM2M1Yjk1
MzlhZjIgZjJmc19pbzogYWRkIGZyYWdyZWFkIGNvbW1hbmQgdG8gZXZhbHVhdGUgZnJhZ21lbnRl
ZAo+Pj4gYnVmZmVyIGZvciByZWFkcwo+Pj4KPj4+IFRoaXMgcmVwcm9kdWNlZCB0aGUgbW91bnQg
YW5kIGZzY2sgZmFpbHVyZS4KPj4+Cj4+PiBNb3VudCBsb2c6Cj4+PiBbNDQyNDMxLjAyMDU5NF0g
RjJGUy1mcyAoZG0tMik6IGludmFsaWQgY3JjX29mZnNldDogMAo+Pj4gWzQ0MjQzMS4xMzAwNTVd
IEYyRlMtZnMgKGRtLTIpOiBTSVQgaXMgY29ycnVwdGVkIG5vZGUjIDEzNjE1MjAxIHZzIDEzNjE2
MjkwCj4+PiBbNDQyNDMxLjEzOTY4NF0gRjJGUy1mcyAoZG0tMik6IEZhaWxlZCB0byBpbml0aWFs
aXplIEYyRlMgc2VnbWVudCBtYW5hZ2VyICgtMTE3KQo+Pgo+PiBJIHRyaWVkOgo+Pgo+PiBhKSBy
ZXNpemUuZjJmcyAtZCAzIC1zIC1pIGltZyAtdCAkc2VjdG9ycwo+PiBiKSByZXNpemUuZjJmcyAt
ZCAzIC1zIGltZyAtdCAkc2VjdG9ycwoKYykgcmVzaXplLmYyZnMgLWQgMyAtaSBpbWcgLXQgJHNl
Y3RvcnMgKGV4cGFuZGluZyksIHRoZSByb290IGNhdXNlIHNlZW1zCmNvbmZsaWN0IGJldHdlZW4g
LWkgYW5kIC1zIG9wdGlvbiBpbiBzaHJpbmsgbW9kZSByZXNpemUuCgpUaGFua3MsCgo+Pgo+PiBP
bmx5IGEpIGNhbiByZXByb2R1Y2UgdGhlIGJ1Zywgd2UgbmVlZCB0byByZXZlcnQgLWkgc3VwcG9y
dCBmb3IgcmVzaXplCj4+IGZpcnN0Lgo+IAo+IFVnaCwgSSBzdXNwZWN0ZWQgdGhpcyBjb3VsZCBi
ZSB0aGUgZGV0ZXJtaW5pbmcgZmFjdG9yIDooCj4gCj4gU28gQHVwbGlua3IncyBjYXNlIGlzIGEg
ZGlmZmVyZW50IGN1bHByaXQgb25lLiBJJ2xsIHRyeSB0byByZXByb2R1Y2UKPiBzb21ldGhpbmcg
d2l0aCBteSBwaG9uZSB3aGljaCBkb2Vzbid0IHVzZSBsYXJnZV9uYXRfYml0bWFwLgo+IAo+Pgo+
PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gZGVidWdmcyAmIHJlc2l6ZSBsb2c6Cj4+PiBodHRwczovL2Fy
dGVyOTcuY29tLy5mMmZzLTIwMjUwNDEwLwo+Pj4KPj4+IFRoZSBmc2NrIGxvZyB3YXMgd2F5IHRv
byBsYXJnZSwgOC4yMUdpQiB3aXRob3V0ICItZCIgZmxhZyBhbmQgaXQKPj4+IGNvbnRhaW5lZCBt
YW55IHNlbnNpdGl2ZSBkYXRhLCBzbyBJJ20gbm90IHVwbG9hZGluZyBpdCBmb3Igbm93Lgo+Pj4K
Pj4+ICAgRnJvbSBsb29raW5nIGF0IHRoZSBkbSBzdGF0cywgdGhlIGZzY2sgYWxzbyB3cm90ZSAy
MTM4IE1pQiB0byB0aGUKPj4+IHNuYXBzaG90IGRldmljZS4KPj4+Cj4+PiBDaGFvLCBjYW4gd2Ug
c3RhcnQgZnJvbSBoZXJlPwo+Pj4gVGhhbmtzLgo+Pj4KPj4+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzYwOGYyM2NlLTU2ZWYtNGZhZi1iZWUxLTNhYTg5Nzg2
ZWQ0MUBrZXJuZWwub3JnL1QvI21jNjI4ZjhmM2NhNmM3MzE3OGZmYTE3MTZmOTI3NzU1NTI3ODU2
ZDRiCj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
