Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47872A642FD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 08:11:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu4dG-000113-5v;
	Mon, 17 Mar 2025 07:11:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tu4dF-00010v-3S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 07:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m++JSGjG4oXb1MucuWWPiCj1H+6EabdblVlxnXlY3Uc=; b=KUWu7REEWMsGv0o/mWzmd1nZMa
 Ql7NwuCqWFVlYu4xTnzGhhDxb36DYygMK2XBH5sxEDz7x+DAF+hKF932LZGtygFLGr0I/03NyOCfl
 PdwLGfm7Bw7fVWXyjdG5XtuSVibQWBqeocSb1hQ+baQPM5CzwxTeMdi0JfNL1f7LwRDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m++JSGjG4oXb1MucuWWPiCj1H+6EabdblVlxnXlY3Uc=; b=D/NmcNch9ULPa4WxYZErWiCRqk
 5gcUNpjGsO54j4tl87oSoG3dqebK3DpMv1Qo4wyx/LC58g0r14fdVvwAohodeDKcDgyjYdnlamhUt
 0wEjp4mSDnkz1ZsseQ4OcGTV5XB3/2AoVjPCDnI+P5DICsb5XGscH3x3C7gPrcLKR7NE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu4dD-00067j-Dc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 07:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E03985C53AC;
 Mon, 17 Mar 2025 07:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E5FC4CEE3;
 Mon, 17 Mar 2025 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742195481;
 bh=BlDhQuCVuSbyyiPlqh5uRtnwin5bxEqTTI5pWG072vM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I2fg9cRy9+Q5lpZPxdRHQFu2n3pJzl1FUFXAqA8A+MPW3H8tCeM009l6/Pe5XVUOK
 4ZImmgOc6Ltqbx/eQzAhm2U5C593Pk345W5S1KFIIN637QiBnzl9ZDz2FrFXpGbiMS
 EHz1A8U89A5eY5sFv0F35VrwrvehAsuuGdvQoeUVBPjE9n2+8z8ie8jOzSTVe6QYYK
 l1bFi4wJh2yJrcHVRag5Yl0MPLknSL54cEpfBKVsPOUk9mSY0sI4HXsKx/9F7iiTmr
 2K1HD/25zWkrNOdLC+4nGkRLUZzieCgToXJgN7wBQp8mDwJZFd1KtKsvShLybv5NU5
 Dgw6ftTUJY5GQ==
Message-ID: <610d08c6-fe48-4013-98d0-867d23da506d@kernel.org>
Date: Mon, 17 Mar 2025 15:11:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250109122755.177926-1-guochunhai@vivo.com>
 <4270b213-e4f9-46b2-958a-df3dbaaed969@kernel.org>
 <95b8334a-45e6-496a-8b0b-ab7a7fe180b5@vivo.com>
Content-Language: en-US
In-Reply-To: <95b8334a-45e6-496a-8b0b-ab7a7fe180b5@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/13/25 10:25, Chunhai Guo wrote: > 在 1/20/2025 8:25
   PM, Chao Yu 写道: >> On 1/9/25 20:27, Chunhai Guo wrote: >>> During a checkpoint,
    the current active segment X may not be handled >>> proper [...] 
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tu4dD-00067j-Dc
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard for active
 segments
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8xMy8yNSAxMDoyNSwgQ2h1bmhhaSBHdW8gd3JvdGU6Cj4g5ZyoIDEvMjAvMjAyNSA4OjI1
IFBNLCBDaGFvIFl1IOWGmemBkzoKPj4gT24gMS85LzI1IDIwOjI3LCBDaHVuaGFpIEd1byB3cm90
ZToKPj4+IER1cmluZyBhIGNoZWNrcG9pbnQsIHRoZSBjdXJyZW50IGFjdGl2ZSBzZWdtZW50IFgg
bWF5IG5vdCBiZSBoYW5kbGVkCj4+PiBwcm9wZXJseS4gVGhpcyBvY2N1cnMgd2hlbiBzZWdtZW50
IFggaGFzIDAgdmFsaWQgYmxvY2tzIGFuZCBhIG5vbi16ZXJvCj4+IEhvdyBkb2VzIHRoaXMgaGFw
cGVuPyBBbGxvY2F0b3Igc2VsZWN0cyBhIGRpcnR5IHNlZ21lbnQgdy8gU1NSPyBhbmQgdGhlCj4+
IGxlZnQgdmFsaWQgZGF0YSBibG9ja3Mgd2VyZSBkZWxldGVkIGxhdGVyIGJlZm9yZSBmb2xsb3dp
bmcgY2hlY2twb2ludD8KPj4KPj4gSWYgc28sIHBlbmRpbmcgZGlzY2FyZCBjb3VudCBpbiB0aGF0
IHNlZ21lbnQgc2hvdWxkIGJlIGluIHJhbmdlIG9mICgwLCA1MTIpPwo+IAo+IAo+IFRoaXMgaXNz
dWUgaXMgZm91bmQgd2l0aCBMRlMgcmF0aGVyIHRoYW4gU1NSLiBIZXJlJ3Mgd2hhdCBoYXBwZW5z
OiBzb21lCj4gZGF0YSBibG9ja3MgYXJlIGFsbG9jYXRlZCBmb3IgYSBmaWxlIGluIHRoZSBjdXJy
ZW50IGFjdGl2ZSBzZWdtZW50LCBhbmQKPiB0aGVuIHRoZSBmaWxlIGlzIGRlbGV0ZWQsIHJlc3Vs
dGluZyBpbiBhbGwgdmFsaWQgZGF0YSBibG9ja3MgaW4gdGhlCj4gY3VycmVudCBhY3RpdmUgc2Vn
bWVudCBiZWluZyBkZWxldGVkIGJlZm9yZSB0aGUgZm9sbG93aW5nIGNoZWNrcG9pbnQuCj4gVGhp
cyBpc3N1ZSBpcyBlYXN5IHRvIHJlcHJvZHVjZSB3aXRoIHRoZSBmb2xsb3dpbmcgb3BlcmF0aW9u
czoKPiAKPiAKPiAjIG1rZnMuZjJmcyAtZiAvZGV2L252bWUybjEKPiAjIG1vdW50IC10IGYyZnMg
L2Rldi9udm1lMm4xIC92dG1wL21udC9mMmZzCj4gIyBkZCBpZj0vZGV2L252bWUwbjEgb2Y9L3Z0
bXAvbW50L2YyZnMvMS5iaW4gYnM9NGsgY291bnQ9MjU2Cj4gIyBzeW5jCj4gIyBybSAvdnRtcC9t
bnQvZjJmcy8xLmJpbgo+ICMgdW1vdW50IC92dG1wL21udC9mMmZzCj4gIyBkdW1wLmYyZnMgL2Rl
di9udm1lMm4xIHwgZ3JlcCAiY2hlY2twb2ludCBzdGF0ZSIKPiBJbmZvOiBjaGVja3BvaW50IHN0
YXRlID0gNDUgOiAgY3JjIGNvbXBhY3RlZF9zdW1tYXJ5IHVubW91bnQgLS0tLQo+ICd0cmltbWVk
JyBmbGFnIGlzIG1pc3NpbmcKCkNodW5oYWksCgpUaGFuayB5b3UgZm9yIHByb3ZpZGluZyB0ZXN0
Y2FzZSwgYXJlIHlvdSBpbnRlcmVzdCBpbiB1cHN0cmVhbSB0aGlzCmFzIGEgZjJmcyB0ZXN0Y2Fz
ZSB0byB4ZnN0ZXN0cz8KClRoYW5rcywKCj4gCj4gVGhlIHBlbmRpbmcgZGlzY2FyZCBjb3VudCBp
biB0aGF0IHNlZ21lbnQgaW5kZWVkIGZhbGxzIHdpdGhpbiB0aGUgcmFuZ2UKPiBvZiAoMCwgNTEy
KS4KPiAKPiBUaGFua3MsCj4+IFRoYW5rcywKPj4KPj4+IG51bWJlciBvZiBkaXNjYXJkIGJsb2Nr
cywgZm9yIHRoZSBmb2xsb3dpbmcgcmVhc29uczoKPj4+Cj4+PiBsb2NhdGVfZGlydHlfc2VnbWVu
dCgpIGRvZXMgbm90IG1hcmsgYW55IGFjdGl2ZSBzZWdtZW50IGFzIGEgcHJlZnJlZQo+Pj4gc2Vn
bWVudC4gQXMgYSByZXN1bHQsIHNlZ21lbnQgWCBpcyBub3QgaW5jbHVkZWQgaW4gZGlydHlfc2Vn
bWFwW1BSRV0sIGFuZAo+Pj4gZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRzKCkgc2tpcHMgaXQg
d2hlbiBoYW5kbGluZyBwcmVmcmVlIHNlZ21lbnRzLgo+Pj4KPj4+IGFkZF9kaXNjYXJkX2FkZHJz
KCkgc2tpcHMgYW55IHNlZ21lbnQgd2l0aCAwIHZhbGlkIGJsb2Nrcywgc28gc2VnbWVudCBYIGlz
Cj4+PiBhbHNvIHNraXBwZWQuCj4+Pgo+Pj4gQ29uc2VxdWVudGx5LCBubyBgc3RydWN0IGRpc2Nh
cmRfY21kYCBpcyBhY3R1YWxseSBjcmVhdGVkIGZvciBzZWdtZW50IFguCj4+PiBIb3dldmVyLCB0
aGUgY2twdF92YWxpZF9tYXAgYW5kIGN1cl92YWxpZF9tYXAgb2Ygc2VnbWVudCBYIGFyZSBzeW5j
ZWQgYnkKPj4+IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBkdXJpbmcgdGhlIGN1cnJlbnQgY2hlY2tw
b2ludCBwcm9jZXNzLiBBcyBhIHJlc3VsdCwKPj4+IGl0IGNhbm5vdCBmaW5kIHRoZSBtaXNzaW5n
IGRpc2NhcmQgYml0cyBldmVuIGluIHN1YnNlcXVlbnQgY2hlY2twb2ludHMuCj4+PiBDb25zZXF1
ZW50bHksIHRoZSB2YWx1ZSBvZiBzYmktPmRpc2NhcmRfYmxrcyByZW1haW5zIG5vbi16ZXJvLiBU
aHVzLCB3aGVuCj4+PiBmMmZzIGlzIHVtb3VudGVkLCBDUF9UUklNTUVEX0ZMQUcgd2lsbCBub3Qg
YmUgc2V0IGR1ZSB0byB0aGUgbm9uLXplcm8KPj4+IHNiaS0+ZGlzY2FyZF9ibGtzLgo+Pj4KPj4+
IFJlbGV2YW50IGNvZGUgcHJvY2VzczoKPj4+Cj4+PiBmMmZzX3dyaXRlX2NoZWNrcG9pbnQoKQo+
Pj4gICAgICAgZjJmc19mbHVzaF9zaXRfZW50cmllcygpCj4+PiAgICAgICAgICAgIGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShzZXMsIHRtcCwgaGVhZCwgc2V0X2xpc3QpIHsKPj4+ICAgICAgICAg
ICAgICAgIGZvcl9lYWNoX3NldF9iaXRfZnJvbShzZWdubywgYml0bWFwLCBlbmQpIHsKPj4+ICAg
ICAgICAgICAgICAgICAgICAuLi4KPj4+ICAgICAgICAgICAgICAgICAgICBhZGRfZGlzY2FyZF9h
ZGRycyhzYmksIGNwYywgZmFsc2UpOyAvLyBza2lwIHNlZ21lbnQgWCBkdWUgdG8gaXRzIDAgdmFs
aWQgYmxvY2tzCj4+PiAgICAgICAgICAgICAgICAgICAgLi4uCj4+PiAgICAgICAgICAgICAgICAg
ICAgc2VnX2luZm9fdG9fcmF3X3NpdCgpOyAvLyBzeW5jIGNrcHRfdmFsaWRfbWFwIHdpdGggY3Vy
X3ZhbGlkX21hcCBmb3Igc2VnbWVudCBYCj4+PiAgICAgICAgICAgICAgICAgICAgLi4uCj4+PiAg
ICAgICAgICAgICAgICB9Cj4+PiAgICAgICAgICAgIH0KPj4+ICAgICAgIGYyZnNfY2xlYXJfcHJl
ZnJlZV9zZWdtZW50cygpOyAvLyBzZWdtZW50IFggaXMgbm90IGluY2x1ZGVkIGluIGRpcnR5X3Nl
Z21hcFtQUkVdIGFuZCBpcyBza2lwcGVkCj4+Pgo+Pj4gU2luY2UgYWRkX2Rpc2NhcmRfYWRkcnMo
KSBjYW4gaGFuZGxlIGFjdGl2ZSBzZWdtZW50cyB3aXRoIG5vbi16ZXJvIHZhbGlkCj4+PiBibG9j
a3MsIGl0IGlzIHJlYXNvbmFibGUgdG8gZml4IHRoaXMgaXNzdWUgYnkgYWxsb3dpbmcgaXQgdG8g
YWxzbyBoYW5kbGUKPj4+IGFjdGl2ZSBzZWdtZW50cyB3aXRoIDAgdmFsaWQgYmxvY2tzLgo+Pj4K
Pj4+IEZpeGVzOiBiMjk1NTU1MDVkODEgKCJmMmZzOiBhZGQga2V5IGZ1bmN0aW9ucyBmb3Igc21h
bGwgZGlzY2FyZHMiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlA
dml2by5jb20+Cj4+PiAtLS0KPj4+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1m
MmZzLWRldmVsLzIwMjQxMjAzMDY1MTA4LjI3NjM0MzYtMS1ndW9jaHVuaGFpQHZpdm8uY29tLwo+
Pj4gdjEtPnYyOgo+Pj4gICAgLSBNb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2UgaXQg
ZWFzaWVyIHRvIHVuZGVyc3RhbmQuCj4+PiAgICAtIEFkZCBmaXhlcyB0byB0aGUgY29tbWl0Lgo+
Pj4gLS0tCj4+PiAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDQgKysrLQo+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+PiBpbmRleCA4NmU1NDdm
MDA4ZjkuLjEzZWU3M2EzYzQ4MSAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+
PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gQEAgLTIwOTAsNyArMjA5MCw5IEBAIHN0YXRp
YyBib29sIGFkZF9kaXNjYXJkX2FkZHJzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0
IGNwX2NvbnRyb2wgKmNwYywKPj4+ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+Pgo+Pj4g
ICAgICBpZiAoIWZvcmNlKSB7Cj4+PiAtICAgICAgICAgICAgaWYgKCFmMmZzX3JlYWx0aW1lX2Rp
c2NhcmRfZW5hYmxlKHNiaSkgfHwgIXNlLT52YWxpZF9ibG9ja3MgfHwKPj4+ICsgICAgICAgICAg
ICBpZiAoIWYyZnNfcmVhbHRpbWVfZGlzY2FyZF9lbmFibGUoc2JpKSB8fAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgKCFzZS0+dmFsaWRfYmxvY2tzICYmCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICFJU19DVVJTRUcoc2JpLCBjcGMtPnRyaW1fc3RhcnQpKSB8fAo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgU01fSShzYmkpLT5kY2NfaW5mby0+bnJfZGlzY2FyZHMgPj0KPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgU01fSShzYmkpLT5kY2NfaW5mby0+bWF4X2Rpc2Nh
cmRzKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IAo+IAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
