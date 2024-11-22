Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 444709D5947
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2024 07:17:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEMyj-00053G-ER;
	Fri, 22 Nov 2024 06:17:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tEMyh-000539-VV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 06:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5wJR4/MPRPFtLIdu1JSkdtW2TrOCBBljGVj5gyTdaTY=; b=bq28LYOL4IOQUnHcp8gtJOBGAB
 sbAilQzWOR0cezgVW3CkL0X52xCBVaWVf/4J5g0FtVWmcO5+j0uFIaaielBmrFGMMSXB48gGW4VAW
 4OWD68+eXeFcTqkQEzyRzKxRv4vaKx30PXNB03rGUCPE2vRdcTtPoqwXsLG2EpCLo6Ww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5wJR4/MPRPFtLIdu1JSkdtW2TrOCBBljGVj5gyTdaTY=; b=LDfOIjhwX+YWkXKBfEmql1KBzd
 WORbwOxLouQBT0clrGjVSEpovLgJEX9ZZ+M0S9DIzo1SP3PhXSJTYcxsCHccs/axKfAiWxORZ5sad
 fkzxtSa5bMTm43z9o65oPzeiTbQUAKRAM/xZPod5tH6wVBaXw+1GFpP3ZUcxnbqMi5eI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEMyg-00051N-Ae for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 06:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F6EAA40C3D;
 Fri, 22 Nov 2024 06:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A71CC4CECE;
 Fri, 22 Nov 2024 06:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732256228;
 bh=X09WMcDwbp9QmZT9rmMDKK8+T0zkPB2uDKF3CHx4Szk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=a9GSjYsnCY6a2fgDTy+TvXK8VsyxC+JFuTZCXFIhPGQMvhZD5l56VfXXTM1kxeR4s
 63lcWiGZUkXHsbIFPvs20QmSuHSMpMbCJilJBBMj19QflbX0/NsCkMTkSVD6FcRk73
 j4ZzWWhtVkgZQr5sUJUZ/EMh4SmQgszZLQphaCHwc26ZUxqQ/esMLknjLzdNNPhIuJ
 h0grHcL1g4J5XDEtw+d7wOxqj44DyfXnV3urnoHf/WxHvtVuYWj8BBrexQxlSiCIXi
 m5JcaklEUCDqQqc63W+RvQmYnA9tV+x8VLay+w7oB3nwu/vHod+z4jIlvxmYvd3jZL
 DL9K/y86mtfJg==
Message-ID: <c144fed9-89f6-48c3-9365-bb24260a661d@kernel.org>
Date: Fri, 22 Nov 2024 14:17:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20241121015751.2300234-1-chao@kernel.org>
 <20241121015751.2300234-2-chao@kernel.org>
 <CAHJ8P3LhPzmzf-tgiwSh+a+W+EC7pFE9+=RqkHL1543cHMag2w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LhPzmzf-tgiwSh+a+W+EC7pFE9+=RqkHL1543cHMag2w@mail.gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/22 13:23, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2024年11月21日周四 10:01写道：
    >> >> Quoted: >> "at this time, there are sti [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEMyg-00051N-Ae
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs node to limit max read
 extent count per-inode
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
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS8yMiAxMzoyMywgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IHZpYSBMaW51
eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiDk
uo4yMDI05bm0MTHmnIgyMeaXpeWRqOWbmyAxMDowMeWGmemBk++8mgo+Pgo+PiBRdW90ZWQ6Cj4+
ICJhdCB0aGlzIHRpbWUsIHRoZXJlIGFyZSBzdGlsbCAxMDg2OTExIGV4dGVudCBub2RlcyBpbiB0
aGlzIHpvbWJpZQo+PiBleHRlbnQgdHJlZSB0aGF0IG5lZWQgdG8gYmUgY2xlYW5lZCB1cC4KPj4K
Pj4gY3Jhc2hfYXJtNjRfc3ByZF92OC4wLjMrKz4gZXh0ZW50X3RyZWUubm9kZV9jbnQgZmZmZmZm
ODA4OTZjYzUwMAo+PiAgICBub2RlX2NudCA9IHsKPj4gICAgICBjb3VudGVyID0gMTA4NjkxMQo+
PiAgICB9LAo+PiAiCj4+Cj4+IEFzIHJlcG9ydGVkIGJ5IFhpdWhvbmcsIHRoZXJlIHdpbGwgYmUg
YSBodWdlIG51bWJlciBvZiBleHRlbnQgbm9kZXMKPj4gaW4gZXh0ZW50IHRyZWUsIGl0IG1heSBw
b3RlbnRpYWxseSBjYXVzZToKPj4gLSBzbGFiIG1lbW9yeSBmcmFnbWVudHMKPj4gLSBleHRyZW1l
IGxvbmcgdGltZSBzaHJpbmsgb24gZXh0ZW50IHRyZWUKPj4gLSBsb3cgbWFwcGluZyBlZmZpY2ll
bmN5Cj4+Cj4+IExldCdzIGFkZCBhIHN5c2ZzIG5vZGUgdG8gbGltaXQgbWF4IHJlYWQgZXh0ZW50
IGNvdW50IGZvciBlYWNoIGlub2RlLAo+PiBieSBkZWZhdWx0LCB2YWx1ZSBvZiB0aGlzIHRocmVz
aG9sZCBpcyAxMDI0MCwgaXQgY2FuIGJlIHVwZGF0ZWQKPj4gYWNjb3JkaW5nIHRvIHVzZXIncyBy
ZXF1aXJlbWVudC4KPj4KPj4gUmVwb3J0ZWQtYnk6IFhpdWhvbmcgV2FuZyA8eGl1aG9uZy53YW5n
QHVuaXNvYy5jb20+Cj4+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJm
cy1kZXZlbC8yMDI0MTExMjExMDYyNy4xMzE0NjMyLTEteGl1aG9uZy53YW5nQHVuaXNvYy5jb20v
Cj4+IFNpZ25lZC1vZmYtYnk6IFhpdWhvbmcgV2FuZyA8eGl1aG9uZy53YW5nQHVuaXNvYy5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gICBEb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgfCA2ICsrKysrKwo+PiAgIGZzL2Yy
ZnMvZXh0ZW50X2NhY2hlLmMgICAgICAgICAgICAgICAgICB8IDUgKysrKy0KPj4gICBmcy9mMmZz
L2YyZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrKysKPj4gICBmcy9mMmZzL3N5
c2ZzLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysKPj4gICA0IGZpbGVzIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24v
QUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+PiBpbmRleCA1MTMyOTZiYjZmMjkuLjNlMTYzMGM3
MGQ4YSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1m
MmZzCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+PiBA
QCAtODIyLDMgKzgyMiw5IEBAIERlc2NyaXB0aW9uOiAgICAgICAgSXQgY29udHJvbHMgdGhlIHZh
bGlkIGJsb2NrIHJhdGlvIHRocmVzaG9sZCBub3QgdG8gdHJpZ2dlciBleGNlc3Npdgo+PiAgICAg
ICAgICAgICAgICAgIGZvciB6b25lZCBkZWl2Y2VzLiBUaGUgaW5pdGlhbCB2YWx1ZSBvZiBpdCBp
cyA5NSglKS4gRjJGUyB3aWxsIHN0b3AgdGhlCj4+ICAgICAgICAgICAgICAgICAgYmFja2dyb3Vu
ZCBHQyB0aHJlYWQgZnJvbSBpbnRpYXRpbmcgR0MgZm9yIHNlY3Rpb25zIGhhdmluZyB2YWxpZCBi
bG9ja3MKPj4gICAgICAgICAgICAgICAgICBleGNlZWRpbmcgdGhlIHJhdGlvLgo+PiArCj4+ICtX
aGF0OiAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L21heF9yZWFkX2V4dGVudF9jb3VudAo+
PiArRGF0ZTogICAgICAgICAgTm92ZW1iZXIgMjAyNAo+PiArQ29udGFjdDogICAgICAgIkNoYW8g
WXUiIDxjaGFvQGtlcm5lbC5vcmc+Cj4+ICtEZXNjcmlwdGlvbjogICBJdCBjb250cm9scyBtYXgg
cmVhZCBleHRlbnQgY291bnQgZm9yIHBlci1pbm9kZSwgdGhlIHZhbHVlIG9mIHRocmVzaG9sZAo+
PiArICAgICAgICAgICAgICAgaXMgMTAyNDAgYnkgZGVmYXVsdC4KPj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+IGluZGV4IGI3
YTY4MTdiNDRiMC4uMzQ3YjNiNjQ3ODM0IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9j
YWNoZS5jCj4+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4gQEAgLTcxNyw3ICs3MTcs
OSBAQCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLAo+PiAgICAgICAgICAgICAgICAgIH0KPj4KPj4gICAgICAgICAgICAgICAgICBpZiAo
ZW5kIDwgb3JnX2VuZCAmJiAodHlwZSAhPSBFWF9SRUFEIHx8Cj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgb3JnX2VuZCAtIGVuZCA+PSBGMkZTX01JTl9FWFRFTlRfTEVOKSkgewo+
PiArICAgICAgICAgICAgICAgICAgICAgICAob3JnX2VuZCAtIGVuZCA+PSBGMkZTX01JTl9FWFRF
TlRfTEVOICYmCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGF0b21pY19yZWFkKCZldC0+bm9k
ZV9jbnQpIDwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+
bWF4X3JlYWRfZXh0ZW50X2NvdW50KSkpIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChwYXJ0cykgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3NldF9leHRl
bnRfaW5mbygmZWksCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW5kLCBvcmdfZW5kIC0gZW5kLAo+PiBAQCAtMTIxMiw2ICsxMjE0LDcgQEAgdm9pZCBmMmZzX2lu
aXRfZXh0ZW50X2NhY2hlX2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiAgICAgICAg
ICBzYmktPmhvdF9kYXRhX2FnZV90aHJlc2hvbGQgPSBERUZfSE9UX0RBVEFfQUdFX1RIUkVTSE9M
RDsKPj4gICAgICAgICAgc2JpLT53YXJtX2RhdGFfYWdlX3RocmVzaG9sZCA9IERFRl9XQVJNX0RB
VEFfQUdFX1RIUkVTSE9MRDsKPj4gICAgICAgICAgc2JpLT5sYXN0X2FnZV93ZWlnaHQgPSBMQVNU
X0FHRV9XRUlHSFQ7Cj4+ICsgICAgICAgc2JpLT5tYXhfcmVhZF9leHRlbnRfY291bnQgPSBERUZf
TUFYX1JFQURfRVhURU5UX0NPVU5UOwo+PiAgIH0KPj4KPj4gICBpbnQgX19pbml0IGYyZnNfY3Jl
YXRlX2V4dGVudF9jYWNoZSh2b2lkKQo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9m
cy9mMmZzL2YyZnMuaAo+PiBpbmRleCBiNjViMDIzYTU4OGEuLjZmMmNiZjRjNTc0MCAxMDA2NDQK
Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4gQEAgLTYz
NSw2ICs2MzUsOSBAQCBlbnVtIHsKPj4gICAjZGVmaW5lIERFRl9IT1RfREFUQV9BR0VfVEhSRVNI
T0xEICAgICAyNjIxNDQKPj4gICAjZGVmaW5lIERFRl9XQVJNX0RBVEFfQUdFX1RIUkVTSE9MRCAg
ICAyNjIxNDQwCj4+Cj4+ICsvKiBkZWZhdWx0IG1heCByZWFkIGV4dGVudCBjb3VudCBwZXIgaW5v
ZGUgKi8KPj4gKyNkZWZpbmUgREVGX01BWF9SRUFEX0VYVEVOVF9DT1VOVCAgICAgIDEwMjQwCj4+
ICsKPj4gICAvKiBleHRlbnQgY2FjaGUgdHlwZSAqLwo+PiAgIGVudW0gZXh0ZW50X3R5cGUgewo+
PiAgICAgICAgICBFWF9SRUFELAo+PiBAQCAtMTYxOSw2ICsxNjIyLDcgQEAgc3RydWN0IGYyZnNf
c2JfaW5mbyB7Cj4+ICAgICAgICAgIC8qIGZvciBleHRlbnQgdHJlZSBjYWNoZSAqLwo+PiAgICAg
ICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWVfaW5mbyBleHRlbnRfdHJlZVtOUl9FWFRFTlRfQ0FDSEVT
XTsKPj4gICAgICAgICAgYXRvbWljNjRfdCBhbGxvY2F0ZWRfZGF0YV9ibG9ja3M7ICAgICAgIC8q
IGZvciBibG9jayBhZ2UgZXh0ZW50X2NhY2hlICovCj4+ICsgICAgICAgdW5zaWduZWQgaW50IG1h
eF9yZWFkX2V4dGVudF9jb3VudDsgICAgIC8qIG1heCByZWFkIGV4dGVudCBjb3VudCBwZXIgaW5v
ZGUgKi8KPj4KPj4gICAgICAgICAgLyogVGhlIHRocmVzaG9sZCB1c2VkIGZvciBob3QgYW5kIHdh
cm0gZGF0YSBzZXBlcmF0aW9uKi8KPj4gICAgICAgICAgdW5zaWduZWQgaW50IGhvdF9kYXRhX2Fn
ZV90aHJlc2hvbGQ7Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5
c2ZzLmMKPj4gaW5kZXggYmRiZjI0ZGI2NjdiLi5kMTM1NmM2NTZjYWMgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2YyZnMvc3lzZnMuYwo+PiArKysgYi9mcy9mMmZzL3N5c2ZzLmMKPj4gQEAgLTc4Nyw2ICs3
ODcsMTMgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwK
Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4+ICAgICAgICAgIH0KPj4KPj4gKyAg
ICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJtYXhfcmVhZF9leHRlbnRfY291bnQiKSkg
ewo+PiArICAgICAgICAgICAgICAgaWYgKHQgPiBVSU5UX01BWCkKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsgICAgICAgICAgICAgICAqdWkgPSAodW5zaWdu
ZWQgaW50KXQ7Cj4+ICsgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4+ICsgICAgICAgfQo+
PiArCj4gSGkgQ2hhbywKPiBmcm9tIFhpdWhvbmcgcmVtaWRlciwgaXQgc2VlbXMgbWlzcyBjb2Rl
cyBvZiBhZGRpbmcgc3lzZnMgbm9kZQo+ICJtYXhfcmVhZF9leHRlbnRfY291bnQiPwo+IEYyRlNf
U0JJX0dFTkVSQUxfUldfQVRUUihtYXhfcmVhZF9leHRlbnRfY291bnQpOwo+IEFUVFJfTElTVCht
YXhfcmVhZF9leHRlbnRfY291bnQpOwoKT29wcywgbGV0IG1lIGZpeCB0aGlzIHNvb24uCgpUaGFu
a3MsCgo+IHRoYW5rc++8gQo+PiAgICAgICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJp
cHVfcG9saWN5IikpIHsKPj4gICAgICAgICAgICAgICAgICBpZiAodCA+PSBCSVQoRjJGU19JUFVf
TUFYKSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAtLQo+
PiAyLjQwLjEKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
