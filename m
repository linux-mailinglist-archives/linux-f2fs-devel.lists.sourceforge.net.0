Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6448F35D4EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Apr 2021 03:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lW87C-0000C1-Ac; Tue, 13 Apr 2021 01:45:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lW875-0000BS-Hx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 01:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fyARuQej1eayXqzQiISwFwy+ToVkwYbAuQoQcEFHssQ=; b=GZpB8X8boy1SCLOljZr7HfoFeD
 EzZHas5IEVOjI1WL8maXekZG+UKT2X4ZfcE/yHo6+e7l3leWIUmTKXElPMTy5nlZTat7COti7C/X1
 4FHoBEF3cu9fbE0P1RynJe4rcItiNOT2yrEudo0RqPzbRVwEbTXVl0XpmN5NgB6bDzWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fyARuQej1eayXqzQiISwFwy+ToVkwYbAuQoQcEFHssQ=; b=X86SjFX/CiGV3BHqeb2PIACZe9
 gfhAX0eVpmDd+eQgw6jrq65wvKfWbV9yktt5Tx2EDTATiFw5XuKniMo7ZSlXnYT/OtaQ8FHvcmJP9
 JMmsDpCrTxKzT7aEa/7bRhaG5JLqi6nzrrwG7XIvSNilbdwWHeNTTwQwhrALQoGroCu0=;
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lW86s-00D3r0-9e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 01:45:12 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id EC115E034A;
 Tue, 13 Apr 2021 09:44:50 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Chao Yu'" <yuchao0@huawei.com>
References: <20210412131357.368-1-changfengnan@vivo.com>
 <d422dfaf-aba9-76a5-44ca-035ebc598ff0@huawei.com>
In-Reply-To: <d422dfaf-aba9-76a5-44ca-035ebc598ff0@huawei.com>
Date: Tue, 13 Apr 2021 09:44:50 +0800
Message-ID: <003301d73006$98277a20$c8766e60$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLQh/ClvtRFJ61F2AOWwAFioz2u1wIZmakRAO9Dvfs=
Content-Language: zh-cn
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU1JGVYdGhoZSktOSU9CSRlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 NISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6Shw5MT8UGh4eFjYBOBEZ
 LihPC0tVSlVKTUpDSUxDSUJKT05IVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBT0pMSjcG
X-HM-Tid: 0a78c8e7169a2c17kusnec115e034a
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.118.208 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lW86s-00D3r0-9e
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogIFtmMmZzLWRldmVsXSBXaHkgZG9lcyBm?=
	=?gb2312?b?MmZzIG5vdCByZWR1Y2UgZGlzayBzcGFjZSB3aGVuIGNvbXByZXNz?=
	=?gb2312?b?aW9uIGlzIG9uPw==?=
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhhbmtzLCBJIGdvdCBpdC4KCgotLS0tLdPKvP7Urbz+LS0tLS0Kt6K8/sjLOiBDaGFvIFl1IDx5
dWNoYW8wQGh1YXdlaS5jb20+Creiy83KsbzkOiAyMDIxxOo01MIxM8jVIDk6MTYKytW8/sjLOiBG
ZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+CrOty806IGphZWdldWtAa2VybmVs
Lm9yZzsgY2hhb0BrZXJuZWwub3JnOwpsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldArW98ziOiBSZTogW2YyZnMtZGV2XSBbZjJmcy1kZXZlbF0gV2h5IGRvZXMgZjJmcyBub3Qg
cmVkdWNlIGRpc2sgc3BhY2Ugd2hlbgpjb21wcmVzc2lvbiBpcyBvbj8KCk9uIDIwMjEvNC8xMiAy
MToxMywgRmVuZ25hbiBDaGFuZyB3cm90ZToKPiBJJ20gdGVzdGluZyB0aGUgZjJmcyBkYXRhIGNv
bXByZXNzaW9uIGZlYXR1cmUuIEkgY3JlYXRlZCBhIG5ldyBGUyB3aXRoCj4gdGhlIGZsYWdzIGV4
dHJhX2F0dHIgYW5kIGNvbXByZXNzaW9uLCB1c2UgY2hhdHRyIC1SICtjIG9uIHRoZSB0ZXN0IGRp
cgp0byBlbmFibGUgY29tcHJlc3Npb24gZm9yIHRoZSBkaXJlY3RvcnkuCj4gSSBmb3VuZCB0aGF0
IHdoZW4gY29tcHJlc3Npb24gd2FzIHR1cm5lZCBvbiwgdGhlIGZpbGVzIGRpZCBub3QgdGFrZSB1
cAphbnkgbGVzcyBzcGFjZS4KPiBVc2luZyB0cmFjZSwgSSBzZWUgdGhhdCB0aGUgZGF0YSBpcyBp
bmRlZWQgY29tcHJlc3NlZC4KPiBJcyB0aGVyZSBhIG1pc3Rha2UgaW4gbXkgdGVzdGluZyBtZXRo
b2QsIG9yIGlzIHRoaXMgaG93IGl0IHdhcyBkZXNpZ25lZAphbmQgd2h5PwoKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIwMDEzMDE4NTMzNS5HQTIyNTM5OUBnb29nbGUuY29tLwoKSSBn
dWVzcyB3ZSBzaG91bGQgZG9jdW1lbnQgaXQgd2VsbCBpbiBmMmZzLnJzdCB0byBhdm9pZCBhbnkg
Y29uZnVzaW9uLCBsZXQKbWUgcG9zdCBhIHBhdGNoIGZvciB0aGF0IHNvb24uCgpUaGFua3MsCgo+
Cj4gVGhpcyBpcyBteSB0ZXN0IG1ldGhvZDoKPgo+ICMgbW91bnQKPiAvZGV2L252bWUwbjEgb24g
L21udCB0eXBlIGYyZnMKPiAocncsbGF6eXRpbWUscmVsYXRpbWUsYmFja2dyb3VuZF9nYz1vbixk
aXNjYXJkLG5vX2hlYXAsdXNlcl94YXR0cixpbmxpCj4gbmVfeGF0dHIsYWNsLGlubGluZV9kYXRh
LGlubGluZV9kZW50cnksZmx1c2hfbWVyZ2UsZXh0ZW50X2NhY2hlLG1vZGU9YQo+IGRhcHRpdmUs
YWN0aXZlX2xvZ3M9NixhbGxvY19tb2RlPXJldXNlLGZzeW5jX21vZGU9cG9zaXgsY29tcHJlc3Nf
YWxnb3IKPiBpdGhtPWx6NCxjb21wcmVzc19sb2dfc2l6ZT0yKQo+ICMgZGYKPiBGaWxlc3lzdGVt
ICAgICAgICAgICAxSy1ibG9ja3MgICAgICBVc2VkIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24K
PiAvZGV2L3Jvb3QgICAgICAgICAgICAgICAxMTQ5MDEgICAgMTEyNDQ0ICAgICAgICAgMCAxMDAl
IC8KPiBkZXZ0bXBmcyAgICAgICAgICAgICAgICA0OTc0MzYgICAgICAgICAwICAgIDQ5NzQzNiAg
IDAlIC9kZXYKPiB0bXBmcyAgICAgICAgICAgICAgICAgICA1MDAwNjAgICAgICAgICAwICAgIDUw
MDA2MCAgIDAlIC9kZXYvc2htCj4gdG1wZnMgICAgICAgICAgICAgICAgICAgNTAwMDYwICAgICAg
ICA1MiAgICA1MDAwMDggICAwJSAvdG1wCj4gdG1wZnMgICAgICAgICAgICAgICAgICAgNTAwMDYw
ICAgICAgICAyMCAgICA1MDAwNDAgICAwJSAvcnVuCj4gL2Rldi9udm1lMG4xICAgICAgICAgIDEw
NDgzNzEyICAgIDQ5OTcyNCAgIDk5ODM5ODggICA1JSAvbW50Cj4gIyBta2RpciB0ZXN0Cj4gIyBj
aGF0dHIgLVIgK2MgdGVzdC8KPiAjIGRkIGlmPS9kZXYvemVybyBvZj0vbW50L3Rlc3QvZmlsZSBi
cz0xTSBjb3VudD0xMDAgIyBzeW5jICMgZGYKPiBGaWxlc3lzdGVtICAgICAgICAgICAxSy1ibG9j
a3MgICAgICBVc2VkIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24KPiAvZGV2L3Jvb3QgICAgICAg
ICAgICAgICAxMTQ5MDEgICAgMTEyNDQ0ICAgICAgICAgMCAxMDAlIC8KPiBkZXZ0bXBmcyAgICAg
ICAgICAgICAgICA0OTc0MzYgICAgICAgICAwICAgIDQ5NzQzNiAgIDAlIC9kZXYKPiB0bXBmcyAg
ICAgICAgICAgICAgICAgICA1MDAwNjAgICAgICAgICAwICAgIDUwMDA2MCAgIDAlIC9kZXYvc2ht
Cj4gdG1wZnMgICAgICAgICAgICAgICAgICAgNTAwMDYwICAgICAgIDM2OCAgICA0OTk2OTIgICAw
JSAvdG1wCj4gdG1wZnMgICAgICAgICAgICAgICAgICAgNTAwMDYwICAgICAgICAyMCAgICA1MDAw
NDAgICAwJSAvcnVuCj4gL2Rldi9udm1lMG4xICAgICAgICAgIDEwNDgzNzEyICAgIDYwMjIzMiAg
IDk4ODE0ODAgICA2JSAvbW50Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAuCj4KCgoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
