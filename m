Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A888C3E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 14:44:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rp75v-0006kD-VS;
	Tue, 26 Mar 2024 13:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rp75u-0006k3-Ik
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 13:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JqqN3SlzgN8WbkNSS21XxFLfmWicoLM/GSXdVKQlc8k=; b=FyxiniiVQbG44Qg567VbkFxW5j
 R1Sfyn6Qpgn+sP3TfEhH1ru7nvgQ66tXUns9ruNRLCPc45Bj6Xa7in+FJUJQm93Y0+i1gc/1QI+C7
 dLFMdD+BdaehE3Sbr0wWawi9JzvqF1epiFpIFY4lCREH31LGqu+Xmk591YYqfW9IAUoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JqqN3SlzgN8WbkNSS21XxFLfmWicoLM/GSXdVKQlc8k=; b=OIwrgfnxge7T1tl4Oghdfw9aY7
 PGrF60hOrOIt34ahXyGDYeCfCQgLN+I5rKoVIQu+1DTiktMjAaTAiMJFF/Syw6FneUZmRubWDmq8d
 rXL9kHu0XB+cjVyWXG5HTetpeX53VtZUJFRhcUG5tQvi1Tm4/6zbirpKk2eAfj03vVdk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rp75u-0002PK-5x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 13:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B878A611ED;
 Tue, 26 Mar 2024 13:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7C8C433C7;
 Tue, 26 Mar 2024 13:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711460631;
 bh=MpdHKo/pfARWrNEUHGDFnEqINIOljO1DHUfimSXa2V4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=teLviXGM1CEIFpViliftf4YncsY+PMH3k7xzGBav3T1W5z1hdGtU7zxnZtaQ1Ypa8
 n1pXW7caq/cMSiB7VF8lUNt+mhDRbOenFCHrtfQKwH1OrZkpDpgXHHxYtRjMmeiOkM
 SA3hC/q16H8r0t3LLWjncpGfCUbbfaNGgmGemEqD+t8aFluGUPFA2r0PNTQ/7fhRDj
 wTeYk2C4jXUVy5vs05/huSDJ/NYQjU2koYHuIYcKWuSU+VFI0S1V/daQ/DnbcKqVkA
 b/c9XB2268syaXbQENT38Du2IBG7nsW+bGNFjQNnpaB00flEBuYmGRJumvRzDutKD7
 2X7zvRAVDBQlg==
Message-ID: <a0f95756-aaeb-43d7-93cc-a8befee2ec78@kernel.org>
Date: Tue, 26 Mar 2024 21:43:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Zhang <yi.zhang@redhat.com>
References: <20240325152623.797099-1-chao@kernel.org>
 <CAHj4cs8vWQ2YRTKKETWX5sJduYO1BJ8NPSwo8mw3LqqRfsns1g@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CAHj4cs8vWQ2YRTKKETWX5sJduYO1BJ8NPSwo8mw3LqqRfsns1g@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/26 21:26, Yi Zhang wrote: > I confirmed the issue
 was fixed now, thanks. > > Tested-by: Yi Zhang <yi.zhang@redhat.com> Yi,
 thanks for the test. Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rp75u-0002PK-5x
Subject: Re: [f2fs-dev] [PATCH] f2fs: multidev: fix to recognize valid zero
 block address
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
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8zLzI2IDIxOjI2LCBZaSBaaGFuZyB3cm90ZToKPiBJIGNvbmZpcm1lZCB0aGUgaXNz
dWUgd2FzIGZpeGVkIG5vdywgdGhhbmtzLgo+IAo+IFRlc3RlZC1ieTogWWkgWmhhbmcgPHlpLnpo
YW5nQHJlZGhhdC5jb20+CgpZaSwgdGhhbmtzIGZvciB0aGUgdGVzdC4KClRoYW5rcywKCj4gCj4g
T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMTE6MjbigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBBcyByZXBvcnRlZCBieSBZaSBaaGFuZyBpbiBtYWlsaW5nIGxpc3Qg
WzFdLCBrZXJuZWwgd2FybmluZyB3YXMgY2F0Y2hlZAo+PiBkdXJpbmcgemJkLzAxMCB0ZXN0IGFz
IGJlbG93Ogo+Pgo+PiAuL2NoZWNrIHpiZC8wMTAKPj4gemJkLzAxMCAodGVzdCBnYXAgem9uZSBz
dXBwb3J0IHdpdGggRjJGUykgICAgICAgICAgICAgICAgICAgIFtmYWlsZWRdCj4+ICAgICAgcnVu
dGltZSAgICAuLi4gIDMuNzUycwo+PiAgICAgIHNvbWV0aGluZyBmb3VuZCBpbiBkbWVzZzoKPj4g
ICAgICBbIDQzNzguMTQ2NzgxXSBydW4gYmxrdGVzdHMgemJkLzAxMCBhdCAyMDI0LTAyLTE4IDEx
OjMxOjEzCj4+ICAgICAgWyA0Mzc4LjE5MjM0OV0gbnVsbF9ibGs6IG1vZHVsZSBsb2FkZWQKPj4g
ICAgICBbIDQzNzguMjA5ODYwXSBudWxsX2JsazogZGlzayBudWxsYjAgY3JlYXRlZAo+PiAgICAg
IFsgNDM3OC40MTMyODVdIHNjc2lfZGVidWc6c2RlYnVnX2RyaXZlcl9wcm9iZTogc2NzaV9kZWJ1
ZzogdHJpbQo+PiBwb2xsX3F1ZXVlcyB0byAwLiBwb2xsX3EvbnJfaHcgPSAoMC8xKQo+PiAgICAg
IFsgNDM3OC40MjIzMzRdIHNjc2kgaG9zdDE1OiBzY3NpX2RlYnVnOiB2ZXJzaW9uIDAxOTEgWzIw
MjEwNTIwXQo+PiAgICAgICAgICAgICAgICAgICAgICAgZGV2X3NpemVfbWI9MTAyNCwgb3B0cz0w
eDAsIHN1Ym1pdF9xdWV1ZXM9MSwgc3RhdGlzdGljcz0wCj4+ICAgICAgWyA0Mzc4LjQzNDkyMl0g
c2NzaSAxNTowOjA6MDogRGlyZWN0LUFjY2Vzcy1aQkMgTGludXgKPj4gc2NzaV9kZWJ1ZyAgICAg
ICAwMTkxIFBROiAwIEFOU0k6IDcKPj4gICAgICBbIDQzNzguNDQzMzQzXSBzY3NpIDE1OjA6MDow
OiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQKPj4gICAgICBbIDQzNzguNDQ5Mzcx
XSBzZCAxNTowOjA6MDogQXR0YWNoZWQgc2NzaSBnZW5lcmljIHNnNSB0eXBlIDIwCj4+ICAgICAg
WyA0Mzc4LjQ0OTQxOF0gc2QgMTU6MDowOjA6IFtzZGZdIEhvc3QtbWFuYWdlZCB6b25lZCBibG9j
ayBkZXZpY2UKPj4gICAgICAuLi4KPj4gICAgICAoU2VlICcvbW50L3Rlc3RzL2dpdGxhYi5jb20v
YXBpL3Y0L3Byb2plY3RzLzE5MTY4MTE2L3JlcG9zaXRvcnkvYXJjaGl2ZS56aXAvc3RvcmFnZS9i
bGt0ZXN0cy9ibGsvYmxrdGVzdHMvcmVzdWx0cy9ub2Rldi96YmQvMDEwLmRtZXNnJwo+Pgo+PiBX
QVJOSU5HOiBDUFU6IDIyIFBJRDogNDQwMTEgYXQgZnMvaW9tYXAvaXRlci5jOjUxCj4+IENQVTog
MjIgUElEOiA0NDAxMSBDb21tOiBmaW8gTm90IHRhaW50ZWQgNi44LjAtcmMzKyAjMQo+PiBSSVA6
IDAwMTA6aW9tYXBfaXRlcisweDMyYi8weDM1MAo+PiBDYWxsIFRyYWNlOgo+PiAgIDxUQVNLPgo+
PiAgIF9faW9tYXBfZGlvX3J3KzB4MWRmLzB4ODMwCj4+ICAgZjJmc19maWxlX3JlYWRfaXRlcisw
eDE1Ni8weDNkMCBbZjJmc10KPj4gICBhaW9fcmVhZCsweDEzOC8weDIxMAo+PiAgIGlvX3N1Ym1p
dF9vbmUrMHgxODgvMHg4YzAKPj4gICBfX3g2NF9zeXNfaW9fc3VibWl0KzB4OGMvMHgxYTAKPj4g
ICBkb19zeXNjYWxsXzY0KzB4ODYvMHgxNzAKPj4gICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3
ZnJhbWUrMHg2ZS8weDc2Cj4+Cj4+IFNoaW5pY2hpcm8gS2F3YXNha2kgaGVscHMgdG8gYW5hbHlz
ZSB0aGlzIGlzc3VlIGFuZCBwcm9wb3NlcyBhIHBvdGVudGlhbAo+PiBmaXhpbmcgcGF0Y2ggaW4g
WzJdLgo+Pgo+PiBRdW90ZWQgZnJvbSByZXBseSBvZiBTaGluaWNoaXJvIEthd2FzYWtpOgo+Pgo+
PiAiSSBjb25maXJtZWQgdGhhdCB0aGUgdHJpZ2dlciBjb21taXQgaXMgZGJmOGU2M2Y0OGFmIGFz
IFlpIHJlcG9ydGVkLiBJIHRvb2sgYQo+PiBsb29rIGluIHRoZSBjb21taXQsIGJ1dCBpdCBsb29r
cyBmaW5lIHRvIG1lLiBTbyBJIHRob3VnaHQgdGhlIGNhdXNlIGlzIG5vdAo+PiBpbiB0aGUgY29t
bWl0IGRpZmYuCj4+Cj4+IEkgZm91bmQgdGhlIFdBUk4gaXMgcHJpbnRlZCB3aGVuIHRoZSBmMmZz
IGlzIHNldCB1cCB3aXRoIG11bHRpcGxlIGRldmljZXMsCj4+IGFuZCByZWFkIHJlcXVlc3RzIGFy
ZSBtYXBwZWQgdG8gdGhlIHZlcnkgZmlyc3QgYmxvY2sgb2YgdGhlIHNlY29uZCBkZXZpY2UgaW4g
dGhlCj4+IGRpcmVjdCByZWFkIHBhdGguIEluIHRoaXMgY2FzZSwgZjJmc19tYXBfYmxvY2tzKCkg
YW5kIGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoKQo+PiBtb2RpZnkgbWFwLT5tX3BibGsgYXMgdGhl
IHBoeXNpY2FsIGJsb2NrIGFkZHJlc3MgZnJvbSBlYWNoIGJsb2NrIGRldmljZS4gSXQKPj4gYmVj
b21lcyB6ZXJvIHdoZW4gaXQgaXMgbWFwcGVkIHRvIHRoZSBmaXJzdCBibG9jayBvZiB0aGUgZGV2
aWNlLiBIb3dldmVyLAo+PiBmMmZzX2lvbWFwX2JlZ2luKCkgYXNzdW1lcyB0aGF0IG1hcC0+bV9w
YmxrIGlzIHRoZSBwaHlzaWNhbCBibG9jayBhZGRyZXNzIG9mIHRoZQo+PiB3aG9sZSBmMmZzLCBh
Y3Jvc3MgdGhlIGFsbCBibG9jayBkZXZpY2VzLiBJdCBjb21wYXJlcyBtYXAtPm1fcGJsayBhZ2Fp
bnN0Cj4+IE5VTExfQUREUiA9PSAwLCB0aGVuIGdvIGludG8gdGhlIHVuZXhwZWN0ZWQgYnJhbmNo
IGFuZCBzZXRzIHRoZSBpbnZhbGlkCj4+IGlvbWFwLT5sZW5ndGguIFRoZSBXQVJOIGNhdGNoZXMg
dGhlIGludmFsaWQgaW9tYXAtPmxlbmd0aC4KPj4KPj4gVGhpcyBXQVJOIGlzIHByaW50ZWQgZXZl
biBmb3Igbm9uLXpvbmVkIGJsb2NrIGRldmljZXMsIGJ5IGZvbGxvd2luZyBzdGVwcy4KPj4KPj4g
ICAtIENyZWF0ZSB0d28gKG5vbi16b25lZCkgbnVsbF9ibGsgZGV2aWNlcyBtZW1vcnkgYmFja2Vk
IHdpdGggMTI4TUIgc2l6ZSBlYWNoOgo+PiAgICAgbnVsbGIwIGFuZCBudWxsYjEuCj4+ICAgIyBt
a2ZzLmYyZnMgL2Rldi9udWxsYjAgLWMgL2Rldi9udWxsYjEKPj4gICAjIG1vdW50IC10IGYyZnMg
L2Rldi9udWxsYjAgIiR7bW91bnRfZGlyfSIKPj4gICAjIGRkIGlmPS9kZXYvemVybyBvZj0iJHtt
b3VudF9kaXJ9L3Rlc3QuZGF0IiBicz0xTSBjb3VudD0xOTIKPj4gICAjIGRkIGlmPSIke21vdW50
X2Rpcn0vdGVzdC5kYXQiIG9mPS9kZXYvbnVsbCBicz0xTSBjb3VudD0xOTIgaWZsYWc9ZGlyZWN0
Cj4+Cj4+IC4uLiIKPj4KPj4gU28sIHRoZSByb290IGNhdXNlIG9mIHRoaXMgaXNzdWUgaXM6IHdo
ZW4gbXVsdGktZGV2aWNlcyBmZWF0dXJlIGlzIG9uLAo+PiBmMmZzX21hcF9ibG9ja3MoKSBtYXkg
cmV0dXJuIHplcm8gYmxrYWRkciBpbiBub24tcHJpbWFyeSBkZXZpY2UsIHdoaWNoIGlzCj4+IGEg
dmVyaWZpZWQgdmFsaWQgYmxvY2sgYWRkcmVzcywgaG93ZXZlciwgZjJmc19pb21hcF9iZWdpbigp
IHRyZWF0cyBpdCBhcwo+PiBhbiBpbnZhbGlkIGJsb2NrIGFkZHJlc3MsIGFuZCB0aGVuIGl0IHRy
aWdnZXJzIHRoZSB3YXJuaW5nIGluIGlvbWFwCj4+IGZyYW1ld29yayBjb2RlLgo+Pgo+PiBGaW5h
bGx5LCBhcyBkaXNjdXNzZWQsIHdlIGRlY2lkZSB0byB1c2UgYSBtb3JlIHNpbXBsZSBhbmQgZGly
ZWN0IHdheSB0aGF0Cj4+IGNoZWNraW5nIChtYXAubV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkg
Y29uZGl0aW9uIGluc3RlYWQgb2YKPj4gKG1hcC5tX3BibGsgIT0gTlVMTF9BRERSKSB0byBmaXgg
dGhpcyBpc3N1ZS4KPj4KPj4gVGhhbmtzIGEgbG90IGZvciB0aGUgZWZmb3J0IG9mIFlpIFpoYW5n
IGFuZCBTaGluaWNoaXJvIEthd2FzYWtpIG9uIHRoaXMKPj4gaXNzdWUuCj4+Cj4+IFsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsL0NBSGo0Y3Mta2ZvallDOWkwRzcz
UFJrWXpjeENUZXg9LXZ1Z1JGZVA0MGdfVVJHdm5mUUBtYWlsLmdtYWlsLmNvbS8KPj4gWzJdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvZ25nZGo3N2s0cGljYWdzZmR0
aWFhN2dwZ251cDZmc2d3enNsdHg2bWlsbWhlZ21qZmZAaWF4Mm40d3ZycXllLwo+Pgo+PiBSZXBv
cnRlZC1ieTogWWkgWmhhbmcgPHlpLnpoYW5nQHJlZGhhdC5jb20+Cj4+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC9DQUhqNGNzLWtmb2pZQzlpMEc3M1BS
a1l6Y3hDVGV4PS12dWdSRmVQNDBnX1VSR3ZuZlFAbWFpbC5nbWFpbC5jb20vCj4+IFRlc3RlZC1i
eTogU2hpbidpY2hpcm8gS2F3YXNha2kgPHNoaW5pY2hpcm8ua2F3YXNha2lAd2RjLmNvbT4KPj4g
Rml4ZXM6IDE1MTdjMWE3YTQ0NSAoImYyZnM6IGltcGxlbWVudCBpb21hcCBvcGVyYXRpb25zIikK
Pj4gRml4ZXM6IDhkM2MxZmEzZmE1ZSAoImYyZnM6IGRvbid0IHJlbHkgb24gRjJGU19NQVBfKiBp
biBmMmZzX2lvbWFwX2JlZ2luIikKPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgo+PiAtLS0KPj4gICBmcy9mMmZzL2RhdGEuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5kZXggZDk0OTRiNWZjN2MxLi41ZWYx
ODc0YjU3MmEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMv
ZGF0YS5jCj4+IEBAIC00MTg1LDcgKzQxODUsNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9tYXBfYmVn
aW4oc3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbmd0aCwKPj4g
ICAgICAgICAgaWYgKFdBUk5fT05fT05DRShtYXAubV9wYmxrID09IENPTVBSRVNTX0FERFIpKQo+
PiAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pgo+PiAtICAgICAgIGlmIChtYXAu
bV9wYmxrICE9IE5VTExfQUREUikgewo+PiArICAgICAgIGlmIChtYXAubV9mbGFncyAmIEYyRlNf
TUFQX01BUFBFRCkgewo+PiAgICAgICAgICAgICAgICAgIGlvbWFwLT5sZW5ndGggPSBibGtzX3Rv
X2J5dGVzKGlub2RlLCBtYXAubV9sZW4pOwo+PiAgICAgICAgICAgICAgICAgIGlvbWFwLT50eXBl
ID0gSU9NQVBfTUFQUEVEOwo+PiAgICAgICAgICAgICAgICAgIGlvbWFwLT5mbGFncyB8PSBJT01B
UF9GX01FUkdFRDsKPj4gLS0KPj4gMi40MC4xCj4+Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
