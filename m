Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F679175B0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2024 03:36:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMHaA-0003yU-1Y;
	Wed, 26 Jun 2024 01:36:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sMHa8-0003yA-41
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 01:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=USckfHM9sLRZiVNL2ldLLmv41ST4gysR/UzYMDCEfec=; b=QcOR3EyCWb0pBWpLoujVbAroMU
 +9m1lPKtW/fJPmDJuqnb5pAIP1S3aYRJOdI5TiDXMVUDy1t8GEDVCu3F6+f7KWMh1gfZlDqbIJ8nH
 UaexnW9fdc24qcyj6ooizaxke2LnwTkKDDVY9wL4cUXu7H/lDdN2k6nsHtl4AdJB+wXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=USckfHM9sLRZiVNL2ldLLmv41ST4gysR/UzYMDCEfec=; b=Q/qZTw5BFQhO+Ofix22R4NsQqs
 KNVXNlLbwuLHbqzoHfMJmLSe6q0DP0kKHWhWWqrDGInOhzGPqhNy2qyzneH04wV9T9KPK15ND0b43
 LhgZqrAe+tuj3IlGE7F/t+e52U3QizACzTKUydPyHzBAblBoQIpPvJ0vyO0SvNz06U5c=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sMHa7-0008Nz-QR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 01:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 445EECE1732;
 Wed, 26 Jun 2024 01:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2E7C32781;
 Wed, 26 Jun 2024 01:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719365770;
 bh=EylTKytTiKR9UrIKOV/TB/XinEmowGbxpBbo3aAMfK4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tmPODW12+jYfkp2v954iTtNTfrXmeMgaOah3hGRH1IogwB90lD+l6TAMDg2vtcZzy
 xt2ZQLqeFW/hB/Imbu/f5sXf/TdaaQ6TJGkVtbdInWetc6p7TQlHge4PYSOJZ61WKF
 VU2mnLzQ++V7mBxpvPpKZWBjb4hZR8KHDhmdXSrJOlw4AZdn0rDX+qZXnU3BsU7m8H
 Z5wOgxuNuWL77Yt7k3H4ybCjuOoMbDgWOi2Q4tXBU07CkAqa+YWzWUKd+HjqkKTK2H
 jvdpJzAJ97pDO8abytKpDrieh4wmTafgPuPx4R2Bjt5pWrBK9RyU50E/zX+N/xeTxP
 y95tgcpgg+5Rg==
Message-ID: <1516a462-1273-428d-aa3d-285bd00b7b69@kernel.org>
Date: Wed, 26 Jun 2024 09:36:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20240625065459.3665791-1-chao@kernel.org>
 <a861d9aaf9394aa6bc77548735629f87@BJMBX02.spreadtrum.com>
 <1fe7878f-36db-4055-9e40-b39425eb5936@kernel.org>
 <CAHJ8P3Jj0SYuTgqo12r1fZxnWrx_ZH-=Cg5FUhmX4ZvRCLbROA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3Jj0SYuTgqo12r1fZxnWrx_ZH-=Cg5FUhmX4ZvRCLbROA@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/25 19:07, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年6月25日周二 18:38写道： >> >> On 2024/6/25 16:09, 牛志国
    (Zhiguo Niu) wrote: >>> >>> >>> -----邮件原件----- >> [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sMHa7-0008Nz-QR
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IHJlZHVj?=
 =?utf-8?q?e_expensive_checkpoint_trigger_frequency?=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, wangzijie <wangzijie1@honor.com>,
 =?UTF-8?B?546L55qTIChIYW9faGFvIFdhbmcp?= <Hao_hao.Wang@unisoc.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzI1IDE5OjA3LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDbmnIgyNeaXpeWRqOS6jCAxODozOOWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzYvMjUgMTY6MDksIOeJm+W/l+WbvSAoWmhpZ3VvIE5pdSkgd3JvdGU6Cj4+Pgo+Pj4K
Pj4+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPj4+IOWPkeS7tuS6ujogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPgo+Pj4g5Y+R6YCB5pe26Ze0OiAyMDI05bm0NuaciDI15pelIDE0OjU1Cj4+PiDm
lLbku7bkuro6IGphZWdldWtAa2VybmVsLm9yZwo+Pj4g5oqE6YCBOiBsaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPjsgd2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT47
IOeJm+W/l+WbvSAoWmhpZ3VvIE5pdSkgPFpoaWd1by5OaXVAdW5pc29jLmNvbT47IFl1bmxlaSBI
ZSA8aGV5dW5sZWlAaGlob25vci5jb20+Cj4+PiDkuLvpopg6IFtQQVRDSCB2NF0gZjJmczogcmVk
dWNlIGV4cGVuc2l2ZSBjaGVja3BvaW50IHRyaWdnZXIgZnJlcXVlbmN5Cj4+Pgo+Pj4KPj4+IOaz
qOaEjzog6L+Z5bCB6YKu5Lu25p2l6Ieq5LqO5aSW6YOo44CC6Zmk6Z2e5L2g56Gu5a6a6YKu5Lu2
5YaF5a655a6J5YWo77yM5ZCm5YiZ5LiN6KaB54K55Ye75Lu75L2V6ZO+5o6l5ZKM6ZmE5Lu244CC
Cj4+PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4K
Pj4+Cj4+Pgo+Pj4KPj4+IFdlIG1heSB0cmlnZ2VyIGhpZ2ggZnJlcXVlbnQgY2hlY2twb2ludCBm
b3IgYmVsb3cgY2FzZToKPj4+IDEuIG1rZGlyIC9tbnQvZGlyMTsgc2V0IGRpcjEgZW5jcnlwdGVk
Cj4+PiAyLiB0b3VjaCAvbW50L2ZpbGUxOyBmc3luYyAvbW50L2ZpbGUxCj4+PiAzLiBta2RpciAv
bW50L2RpcjI7IHNldCBkaXIyIGVuY3J5cHRlZAo+Pj4gNC4gdG91Y2ggL21udC9maWxlMjsgZnN5
bmMgL21udC9maWxlMgo+Pj4gLi4uCj4+Pgo+Pj4gQWx0aG91Z2gsIG5ld2x5IGNyZWF0ZWQgZGly
IGFuZCBmaWxlIGFyZSBub3QgcmVsYXRlZCwgZHVlIHRvIGNvbW1pdCBiYmYxNTZmN2FmYTcgKCJm
MmZzOiBmaXggbG9zdCB4YXR0cnMgb2YgZGlyZWN0b3JpZXMiKSwgd2Ugd2lsbCB0cmlnZ2VyIGNo
ZWNrcG9pbnQgd2hlbmV2ZXIgZnN5bmMoKSBjb21lcyBhZnRlciBhIG5ldyBlbmNyeXB0ZWQgZGly
IGNyZWF0ZWQuCj4+Pgo+Pj4gSW4gb3JkZXIgdG8gYXZvaWQgc3VjaCBwZXJmb3JtYW5jZSByZWdy
ZXNzaW9uIGlzc3VlLCBsZXQncyByZWNvcmQgYW4gZW50cnkgaW5jbHVkaW5nIGRpcmVjdG9yeSdz
IGlubyBpbiBnbG9iYWwgY2FjaGUgd2hlbmV2ZXIgd2UgdXBkYXRlIGRpcmVjdG9yeSdzIHhhdHRy
IGRhdGEsIGFuZCB0aGVuIHRyaWdnZXJyaW5nIGNoZWNrcG9pbnQoKSBvbmx5IGlmIHhhdHRyIG1l
dGFkYXRhIG9mIHRhcmdldCBmaWxlJ3MgcGFyZW50IHdhcyB1cGRhdGVkLgo+Pj4KPj4+IFRoaXMg
cGF0Y2ggdXBkYXRlcyB0byBjb3ZlciBiZWxvdyBubyBlbmNyeXB0aW9uIGNhc2UgYXMgd2VsbDoK
Pj4+IDEpIHBhcmVudCBpcyBjaGVja3BvaW50ZWQKPj4+IDIpIHNldF94YXR0cihkaXIpIHcvIG5l
dyB4bmlkCj4+PiAzKSBjcmVhdGUoZmlsZSkKPj4+IDQpIGZzeW5jKGZpbGUpCj4+Pgo+Pj4gRml4
ZXM6IGJiZjE1NmY3YWZhNyAoImYyZnM6IGZpeCBsb3N0IHhhdHRycyBvZiBkaXJlY3RvcmllcyIp
Cj4+PiBSZXBvcnRlZC1ieTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT4KPj4+IFJl
cG9ydGVkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4+PiBUZXN0ZWQt
Ynk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+IFJlcG9ydGVkLWJ5OiBZ
dW5sZWkgSGUgPGhleXVubGVpQGhpaG9ub3IuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiAgICBmcy9mMmZzL2YyZnMuaCAgICAgICAg
ICAgICAgfCAgMiArKwo+Pj4gICAgZnMvZjJmcy9maWxlLmMgICAgICAgICAgICAgIHwgIDMgKysr
Cj4+PiAgICBmcy9mMmZzL3hhdHRyLmMgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKystLQo+
Pj4gICAgaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oIHwgIDMgKystCj4+PiAgICA0IGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXggZjFkNjVlZTNhZGRm
Li5mM2M5MTBiODk4M2IgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+Pj4gKysrIGIv
ZnMvZjJmcy9mMmZzLmgKPj4+IEBAIC0yODQsNiArMjg0LDcgQEAgZW51bSB7Cj4+PiAgICAgICAg
ICAgQVBQRU5EX0lOTywgICAgICAgICAgICAgLyogZm9yIGFwcGVuZCBpbm8gbGlzdCAqLwo+Pj4g
ICAgICAgICAgIFVQREFURV9JTk8sICAgICAgICAgICAgIC8qIGZvciB1cGRhdGUgaW5vIGxpc3Qg
Ki8KPj4+ICAgICAgICAgICBUUkFOU19ESVJfSU5PLCAgICAgICAgICAvKiBmb3IgdHJhbnNhY3Rp
b25zIGRpciBpbm8gbGlzdCAqLwo+Pj4gKyAgICAgICBFTkNfRElSX0lOTywgICAgICAgICAgICAv
KiBmb3IgZW5jcnlwdGVkIGRpciBpbm8gbGlzdCAqLwo+Pj4gICAgICAgICAgIEZMVVNIX0lOTywg
ICAgICAgICAgICAgIC8qIGZvciBtdWx0aXBsZSBkZXZpY2UgZmx1c2hpbmcgKi8KPj4+ICAgICAg
ICAgICBNQVhfSU5PX0VOVFJZLCAgICAgICAgICAvKiBtYXguIGxpc3QgKi8KPj4+ICAgIH07Cj4+
PiBAQCAtMTE1MCw2ICsxMTUxLDcgQEAgZW51bSBjcF9yZWFzb25fdHlwZSB7Cj4+PiAgICAgICAg
ICAgQ1BfRkFTVEJPT1RfTU9ERSwKPj4+ICAgICAgICAgICBDUF9TUEVDX0xPR19OVU0sCj4+PiAg
ICAgICAgICAgQ1BfUkVDT1ZFUl9ESVIsCj4+PiArICAgICAgIENQX0VOQ19ESVIsCj4+PiAgICB9
Owo+Pj4KPj4+ICAgIGVudW0gaW9zdGF0X3R5cGUgewo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMgaW5kZXggYTUyN2RlMWU3YTJmLi4yNzg1NzM5NzRkYjQg
MTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMK
Pj4+IEBAIC0yMTcsNiArMjE3LDkgQEAgc3RhdGljIGlubGluZSBlbnVtIGNwX3JlYXNvbl90eXBl
IG5lZWRfZG9fY2hlY2twb2ludChzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4gICAgICAgICAgICAg
ICAgICAgZjJmc19leGlzdF93cml0dGVuX2RhdGEoc2JpLCBGMkZTX0koaW5vZGUpLT5pX3Bpbm8s
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVFJBTlNfRElSX0lOTykpCj4+PiAgICAgICAgICAgICAgICAgICBjcF9yZWFzb24gPSBD
UF9SRUNPVkVSX0RJUjsKPj4+ICsgICAgICAgZWxzZSBpZiAoZjJmc19leGlzdF93cml0dGVuX2Rh
dGEoc2JpLCBGMkZTX0koaW5vZGUpLT5pX3Bpbm8sCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVOQ19ESVJfSU5PKSkKPj4+ICsgICAg
ICAgICAgICAgICBjcF9yZWFzb24gPSBDUF9FTkNfRElSOwo+Pj4KPj4+ICAgICAgICAgICByZXR1
cm4gY3BfcmVhc29uOwo+Pj4gICAgfQo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBi
L2ZzL2YyZnMveGF0dHIuYyBpbmRleCBmMjkwZmU5MzI3YzQuLmQwNGMwYjQ3YTRlNCAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMveGF0dHIuYwo+Pj4gKysrIGIvZnMvZjJmcy94YXR0ci5jCj4+PiBA
QCAtNjI5LDYgKzYyOSw3IEBAIHN0YXRpYyBpbnQgX19mMmZzX3NldHhhdHRyKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIGludCBpbmRleCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqbmFtZSwgY29uc3Qgdm9pZCAqdmFsdWUsIHNpemVfdCBzaXplLAo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqaXBhZ2UsIGludCBmbGFncykgIHsKPj4+ICsg
ICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPj4+ICAg
ICAgICAgICBzdHJ1Y3QgZjJmc194YXR0cl9lbnRyeSAqaGVyZSwgKmxhc3Q7Cj4+PiAgICAgICAg
ICAgdm9pZCAqYmFzZV9hZGRyLCAqbGFzdF9iYXNlX2FkZHI7Cj4+PiAgICAgICAgICAgaW50IGZv
dW5kLCBuZXdzaXplOwo+Pj4gQEAgLTc3Miw5ICs3NzMsMTggQEAgc3RhdGljIGludCBfX2YyZnNf
c2V0eGF0dHIoc3RydWN0IGlub2RlICppbm9kZSwgaW50IGluZGV4LAo+Pj4gICAgICAgICAgIGlm
IChpbmRleCA9PSBGMkZTX1hBVFRSX0lOREVYX0VOQ1JZUFRJT04gJiYKPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIXN0cmNtcChuYW1lLCBGMkZTX1hBVFRSX05BTUVfRU5DUllQVElPTl9D
T05URVhUKSkKPj4+ICAgICAgICAgICAgICAgICAgIGYyZnNfc2V0X2VuY3J5cHRlZF9pbm9kZShp
bm9kZSk7Cj4+PiAtICAgICAgIGlmIChTX0lTRElSKGlub2RlLT5pX21vZGUpKQo+Pj4gLSAgICAg
ICAgICAgICAgIHNldF9zYmlfZmxhZyhGMkZTX0lfU0IoaW5vZGUpLCBTQklfTkVFRF9DUCk7Cj4+
Pgo+Pj4gKyAgICAgICBpZiAoIVNfSVNESVIoaW5vZGUtPmlfbW9kZSkpCj4+PiArICAgICAgICAg
ICAgICAgZ290byBzYW1lOwo+Pj4gKyAgICAgICAvKgo+Pj4gKyAgICAgICAgKiBJbiByZXN0cmlj
dCBtb2RlLCBmc3luYygpIGFsd2F5cyB0cnkgdG8gdHJpZ2dlciBjaGVja3BvaW50IGZvciBhbGwK
Pj4+ICsgICAgICAgICogbWV0YWRhdGEgY29uc2lzdGVuY3ksIGluIG90aGVyIG1vZGUsIGl0IHRy
aWdnZXJzIGNoZWNrcG9pbnQgd2hlbgo+Pj4gKyAgICAgICAgKiBwYXJlbnQncyB4YXR0ciBtZXRh
ZGF0YSB3YXMgdXBkYXRlZC4KPj4+ICsgICAgICAgICovCj4+PiArICAgICAgIGlmIChGMkZTX09Q
VElPTihzYmkpLmZzeW5jX21vZGUgPT0gRlNZTkNfTU9ERV9TVFJJQ1QpCj4+PiArICAgICAgICAg
ICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURfQ1ApOwo+Pj4gSGkgQ2hhbywKPj4+IEZv
ciB0aGlzIGNhc2UsIHdpbGwgaXQgYWxzbyBjYXVzZSB0aGUgc2FtZSBpc3N1ZSB3aXRoIG9yaWdp
bmFsIGlzc3VlIHdoZW4gZnN5bmNfbW9kZSA9PSBGU1lOQ19NT0RFX1NUUklDVCA/Cj4+PiBpZiBj
a3B0IHRocmVhZCBpcyBibG9ja2VkIGJ5IHNvbWUgcmVhc29ucyBhbmQgU0JJX05FRURfQ1AgaXMg
bm90IGNsZWFyZWQgaW4gdGltZSwgU3Vic2VxdWVudCBmc3luYyB3aWxsIHRyaWdnZXIgY3A/Cj4+
Cj4+IEhpIFpoaWd1bywKPj4KPj4gSWYgdGhlcmUgaXMgbm8gZGlydHkgZGF0YSBhZnRlciBwcmV2
aW91cyBDUCwgbGF0ZXIgQ1AgdHJpZ2dlcmVkIGJ5IHN1YnNlcXVlbnQKPj4gZnN5bmMgd2lsbCBy
ZXR1cm4gZGlyZWN0bHk/Cj4+Cj4+ICAgICAgICAgIGlmICghaXNfc2JpX2ZsYWdfc2V0KHNiaSwg
U0JJX0lTX0RJUlRZKSAmJgo+PiAgICAgICAgICAgICAgICAgICgoY3BjLT5yZWFzb24gJiBDUF9G
QVNUQk9PVCkgfHwgKGNwYy0+cmVhc29uICYgQ1BfU1lOQykgfHwKPj4gICAgICAgICAgICAgICAg
ICAoKGNwYy0+cmVhc29uICYgQ1BfRElTQ0FSRCkgJiYgIXNiaS0+ZGlzY2FyZF9ibGtzKSkpCj4+
ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gCj4gSGkgQ2hhbywKPiBJIG1lYW4gaW4gdGhl
IGNhc2Ugb2YgIEYyRlNfT1BUSU9OKHNiaSkuZnN5bmNfbW9kZSA9PQo+IEZTWU5DX01PREVfU1RS
SUNULCAgdGhpcyB3aWxsIHN0aWxsIGNhdXNlIHRoZSBzYW1lIGlzc3VlIHdpdGggb3JpZ2luYWwK
PiBxdWVzdGlvbi4KPiBMZXQgbWUgcmVwb3N0IHRoZSBwcm9ibGVtcyBJIGVuY291bnRlcmVkIC4K
PiAKPiAxLnNldF9zYmlfZmxhZyhGMkZTX0lfU0IoaW5vZGUpLCBTQklfTkVFRF9DUCk7Cj4gCj4g
Mi4gY3AgdGhyZWEgaXMgYmxvY2tlZCBieSBpbyByZXNvdXJjZQo+ICMwIFtmZmZmZmZjMDE1ZmNi
MzMwXSBfX3N3aXRjaF90byBhdCBmZmZmZmZjMDEwMTk2MzUwCj4gIzEgW2ZmZmZmZmMwMTVmY2Iz
OTBdIF9fc2NoZWR1bGUgYXQgZmZmZmZmYzAxMTY4ZTUzYwo+ICMyIFtmZmZmZmZjMDE1ZmNiM2Yw
XSBzY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhlZDdjCj4gIzMgW2ZmZmZmZmMwMTVmY2I0NTBdIGlv
X3NjaGVkdWxlIGF0IGZmZmZmZmMwMTE2OGY3YTAKPiAjNCBbZmZmZmZmYzAxNWZjYjRjMF0gYmxr
X21xX2dldF90YWcgYXQgZmZmZmZmYzAxMDEwMDhhNAoKSXQgc2VlbXMgdGhlcmUgaXMgbm8gZnJl
ZSB0YWcgYXQgdGhhdCB0aW1lLCBjYW4geW91IGNoZWNrIGl0cyBjb250ZXh0CnRvIHNlZSB3aHkg
SU8gcXVldWUgY2FuIGJlIGNvbmdlc3RlZCBvbmNlIHlvdSBjYW4gcmVwcm9kdWNlIHRoaXMgaXNz
dWU/CgpJZiB0aGUgYm90dGxlbmVjayBpcyBwZXJmb3JtYW5jZSBvZiBzdG9yYWdlLCBob3cgYWJv
dXQgdXNpbmcgb3RoZXIKZnN5bmNfbW9kZSBpZiBpdHMgZGF0YSBjb25zaXN0ZW5jeSBwZXJmb3Jt
YWNlIG1hdGNoZXMgdGhlIHJlcXVpcmVtZW50LgoKVGhhbmtzLAoKPiAjNSBbZmZmZmZmYzAxNWZj
YjUzMF0gYmxrX21xX2dldF9yZXF1ZXN0IGF0IGZmZmZmZmMwMTA5MjQxYjAKPiAjNiBbZmZmZmZm
YzAxNWZjYjVmMF0gYmxrX21xX21ha2VfcmVxdWVzdCBhdCBmZmZmZmZjMDEwOTIzM2JjCj4gIzcg
W2ZmZmZmZmMwMTVmY2I2ODBdIGdlbmVyaWNfbWFrZV9yZXF1ZXN0IGF0IGZmZmZmZmMwMTAwZmM2
ZWMKPiAjOCBbZmZmZmZmYzAxNWZjYjcwMF0gc3VibWl0X2JpbyBhdCBmZmZmZmZjMDEwMGZjM2I4
Cj4gIzkgW2ZmZmZmZmMwMTVmY2I3NTBdIF9fc3VibWl0X2JpbyBhdCBmZmZmZmZjMDEwODFhMmUw
Cj4gIzEwIFtmZmZmZmZjMDE1ZmNiN2QwXSBfX3N1Ym1pdF9tZXJnZWRfYmlvIGF0IGZmZmZmZmMw
MTA4MWIwN2MKPiAjMTEgW2ZmZmZmZmMwMTVmY2I4YTBdIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUg
YXQgZmZmZmZmYzAxMDBlY2QzYwo+ICMxMiBbZmZmZmZmYzAxNWZjYjk5MF0gZjJmc19kb193cml0
ZV9tZXRhX3BhZ2UgYXQgZmZmZmZmYzAxMDg0NTczOAo+ICMxMyBbZmZmZmZmYzAxNWZjYjlkMF0g
X19mMmZzX3dyaXRlX21ldGFfcGFnZSBhdCBmZmZmZmZjMDEwODBhOGY0Cj4gIzE0IFtmZmZmZmZj
MDE1ZmNiYjYwXSBmMmZzX3N5bmNfbWV0YV9wYWdlcyBhdCBmZmZmZmZjMDEwODBhNjg0Cj4gIzE1
IFtmZmZmZmZjMDE1ZmNiY2EwXSBkb19jaGVja3BvaW50IGF0IGZmZmZmZmMwMTA4MGYwYTgKPiAj
MTYgW2ZmZmZmZmMwMTVmY2JkMTBdIGYyZnNfd3JpdGVfY2hlY2twb2ludCBhdCBmZmZmZmZjMDEw
ODBlNTBjCj4gIzE3IFtmZmZmZmZjMDE1ZmNiZGIwXSBfX2NoZWNrcG9pbnRfYW5kX2NvbXBsZXRl
X3JlcXMgYXQgZmZmZmZmYzAxMDgxMGY1NAo+ICMxOCBbZmZmZmZmYzAxNWZjYmU0MF0gaXNzdWVf
Y2hlY2twb2ludF90aHJlYWQgYXQgZmZmZmZmYzAxMDgxMTNlYwo+ICMxOSBbZmZmZmZmYzAxNWZj
YmU4MF0ga3RocmVhZCBhdCBmZmZmZmZjMDEwMjY2NWIwCj4gCj4gMy4gc3Vic2VxdWVudCBmc3lu
YyB3aWxsIHN0aWxsIGlzc3VlIGNrcHQgYmVjYXN1ZSBTQklfTkVFRF9DUCBpcyBzZXQsCj4gYW5k
IGlmIHRoaXMgaXMgYSB2ZXJ5IGltcG9ydGFudCB0aHJlYWQsIGl0IHdpbGwgY2F1c2Ugc3lzdGVt
IGlzc3VlLAo+IHN1Y2ggYXMgaW5pdC4KPiBidXQgdGhpcyBpcyBzaG91bGQgYmUgYXZvaWRlZC4K
PiBQSUQ6IDI4NyAgICAgIFRBU0s6IGZmZmZmZjgwZjllYjBlYzAgIENQVTogMiAgICBDT01NQU5E
OiAiaW5pdCIKPiAKPiAjMCBbZmZmZmZmYzAxMzg5YmFiMF0gX19zd2l0Y2hfdG8gYXQgZmZmZmZm
YzAxMDE5NjM1MAo+ICMxIFtmZmZmZmZjMDEzODliYjEwXSBfX3NjaGVkdWxlIGF0IGZmZmZmZmMw
MTE2OGU1M2MKPiAjMiBbZmZmZmZmYzAxMzg5YmI3MF0gc2NoZWR1bGUgYXQgZmZmZmZmYzAxMTY4
ZWQ3Ywo+ICMzIFtmZmZmZmZjMDEzODliYmMwXSB3YWl0X2Zvcl9jb21wbGV0aW9uIGF0IGZmZmZm
ZmMwMTE2OTIzNjgKPiAjNCBbZmZmZmZmYzAxMzg5YmNhMF0gZjJmc19pc3N1ZV9jaGVja3BvaW50
IGF0IGZmZmZmZmMwMTA4MTBjYjAKPiAjNSBbZmZmZmZmYzAxMzg5YmQwMF0gZjJmc19zeW5jX2Zz
IGF0IGZmZmZmZmMwMTA3ZjRlMWMKPiAjNiBbZmZmZmZmYzAxMzg5YmRjMF0gZjJmc19kb19zeW5j
X2ZpbGUgYXQgZmZmZmZmYzAxMDdkNGQ0NAo+ICM3IFtmZmZmZmZjMDEzODliZTIwXSBmMmZzX3N5
bmNfZmlsZSBhdCBmZmZmZmZjMDEwN2Q0OTJjCj4gIzggW2ZmZmZmZmMwMTM4OWJlMzBdIF9fYXJt
NjRfc3lzX2ZzeW5jIGF0IGZmZmZmZmMwMTA1ZDMxZDgKPiAjOSBbZmZmZmZmYzAxMzg5YmU3MF0g
ZWwwX3N2Y19jb21tb24gYXQgZmZmZmZmYzAxMDFhYTU1MAo+ICMxMCBbZmZmZmZmYzAxMzg5YmVi
MF0gZWwwX3N2Y19oYW5kbGVyIGF0IGZmZmZmZmMwMTAwODg2ZmMKPiAKPiB0aGFua3MhCj4+Cj4+
PiArICAgICAgIGVsc2UKPj4+ICsgICAgICAgICAgICAgICBmMmZzX2FkZF9pbm9fZW50cnkoc2Jp
LCBpbm9kZS0+aV9pbm8sIEVOQ19ESVJfSU5PKTsKPj4+IFRoaXMgcGF0Y2ggdmVyc2lvbiByZWdh
cmRsZXNzIG9mIHdoZXRoZXIgZGlyIGlzIGVuY3J5cHRlZCBvciBub3QsIHNvIHRoaXMgbmFtZShF
TkNfRElSX0lOTykgY2FuIGJlIHJlbmFtZSBvdGhlciBmb3IgbW9yZSBhY2N1cmF0ZT8KPj4KPj4g
VGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhpcywgbGV0IG1lIGZpeCBpdCBpbiB2NS4KPj4KPj4g
VGhhbmtzLAo+Pgo+Pj4gVGhhbmtz77yBCj4+PiAgICBzYW1lOgo+Pj4gICAgICAgICAgIGlmIChp
c19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQUNMX01PREUpKSB7Cj4+PiAgICAgICAgICAgICAg
ICAgICBpbm9kZS0+aV9tb2RlID0gRjJGU19JKGlub2RlKS0+aV9hY2xfbW9kZTsgZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2Yy
ZnMuaCBpbmRleCBlZDc5NGI1ZmVmYmUuLmU0YTk0OTk1ZTlhOCAxMDA2NDQKPj4+IC0tLSBhL2lu
Y2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaAo+Pj4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMv
ZjJmcy5oCj4+PiBAQCAtMTM5LDcgKzEzOSw4IEBAIFRSQUNFX0RFRklORV9FTlVNKEVYX0JMT0NL
X0FHRSk7Cj4+PiAgICAgICAgICAgICAgICAgICB7IENQX05PREVfTkVFRF9DUCwgICAgICAibm9k
ZSBuZWVkcyBjcCIgfSwgICAgICAgICAgICAgIFwKPj4+ICAgICAgICAgICAgICAgICAgIHsgQ1Bf
RkFTVEJPT1RfTU9ERSwgICAgICJmYXN0Ym9vdCBtb2RlIiB9LCAgICAgICAgICAgICAgXAo+Pj4g
ICAgICAgICAgICAgICAgICAgeyBDUF9TUEVDX0xPR19OVU0sICAgICAgImxvZyB0eXBlIGlzIDIi
IH0sICAgICAgICAgICAgICBcCj4+PiAtICAgICAgICAgICAgICAgeyBDUF9SRUNPVkVSX0RJUiwg
ICAgICAgImRpciBuZWVkcyByZWNvdmVyeSIgfSkKPj4+ICsgICAgICAgICAgICAgICB7IENQX1JF
Q09WRVJfRElSLCAgICAgICAiZGlyIG5lZWRzIHJlY292ZXJ5IiB9LCAgICAgICAgIFwKPj4+ICsg
ICAgICAgICAgICAgICB7IENQX0VOQ19ESVIsICAgICAgICAgICAicGVyc2lzdCBlbmNyeXB0aW9u
IHBvbGljeSIgfSkKPj4+Cj4+PiAgICAjZGVmaW5lIHNob3dfc2h1dGRvd25fbW9kZSh0eXBlKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICAgICAgICAgICBfX3By
aW50X3N5bWJvbGljKHR5cGUsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+Pj4gLS0KPj4+IDIuNDAuMQo+Pj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
