Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED18FFDBC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 06:10:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWZJO-0004XX-CH; Mon, 18 Nov 2019 05:10:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1iWZJM-0004XJ-SL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 05:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W+4d37NiUZrTVp/T//URhJAtULIpMWsOCTG3JUgcQbA=; b=cvfboqRv1WHgAhApWEarpBrYhX
 5Y36PgbWcmSrCgDj0t1+rhW+pR39kaQmo5l8vAlZIR5SQYT0gs1rEZWbNu/hXqg8ekO//bp4EaBYM
 7Tdm8/kgS8B3PFjXUo+vELp62sacFtzV1/VKVCJdcyFD3fM8OU35rAcu32RTq/49lId8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W+4d37NiUZrTVp/T//URhJAtULIpMWsOCTG3JUgcQbA=; b=X+Rs6hs+MrTNBc0mgGDGwfIp+U
 iKNoy3S5J9gcicRwmOFPlSh7YzKm1J8iw8z9Syv2npvKtRrZvNjgyGpHZvzRXkrtcPj+X/E5csMaB
 WhsQrXaR8xdhTOjwWI+a5vh6cflUDEvGTOcWoj02Knn/6dpY3tj29M+pDur6gDrsRkcE=;
Received: from sender3-of-o52.zoho.com.cn ([124.251.121.247]
 helo=sender2.zoho.com.cn)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iWZJI-004CUu-7b
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 05:10:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1574053818; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=CFiTydxXmqD9bMG7v780o3N8ddqWN6K3FCgyTdlTsez+ICLl9SEtemLlO1rFmwdlnFVn0KaMzc1ve2S2pA//ZQDSMywCMchSASZ55qhlGgITwNozY47/lo2c/INkLP4RSjDGEAEdUnzyuSWpR2MhhKkB3r8PeWHkAF6uLKrdeQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1574053818;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=W+4d37NiUZrTVp/T//URhJAtULIpMWsOCTG3JUgcQbA=; 
 b=SfZrHruFtbvLbpQPjNc72IC+JSlnZfJ+XGA4IFDCxatxJXqhBCbg8JNLUagIec/KDcUIuQTVBtngdQoSW3hkUMbcgLGEpH8Fm+eXwz7ARt58nKunz86ZgaxuRX//6Mv41ix92didw44LkKsvKlQgBBZdKpmg9s6dWyjCHjCQdl8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574053818; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=1801; bh=W+4d37NiUZrTVp/T//URhJAtULIpMWsOCTG3JUgcQbA=;
 b=Jz7cAV9vUe3W4KyujDLRcYQXLcQV6tl7gVqHx1v+Ljon9oHqojtRod0Rc50n5YC5
 ZkEOZtA8Vu7ezLL5/F5sGKbob4KLpIxLDCTIwMJBQFp3pj5hakvhUeJmc/iSvEmO7Gl
 mbdedSI3usWavsqw8+/jaZGYDbtDrn2dLYPcKTdA=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 157405381681740.021350625482796;
 Mon, 18 Nov 2019 13:10:16 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org
Message-ID: <20191118050949.15629-2-cgxu519@mykernel.net>
Date: Mon, 18 Nov 2019 13:09:48 +0800
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118050949.15629-1-cgxu519@mykernel.net>
References: <20191118050949.15629-1-cgxu519@mykernel.net>
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iWZJI-004CUu-7b
Subject: [f2fs-dev] [RFC PATCH 2/3] f2fs: show prjquota info on statfs for a
 file
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
Cc: tytso@mit.edu, darrick.wong@oracle.com,
 Chengguang Xu <cgxu519@mykernel.net>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q3VycmVudGx5IHdlIHJlcGxhY2UgZmlsZXN5c3RlbSBzdGF0aXN0aWNzIHVzaW5nIHByanF1b3Rh
IGluZm8Kb24gc3RhdGZzIHdoZW4gc3BlY2lmaWVkIGRpcmVjdG9yeSBoYXMgcHJvamVjdCBpZCBp
bmhlcml0IGZsYWcuCkhvd2V2ZXIsIHN0YXRmcyBvbiBhIGZpbGUoYWNjdXJhdGVseSBub24tZGly
KSB3aGljaCBpcyB1bmRlciB0aGUKcHJvamVjdCBxdW90YSBkaXIod2l0aCBpbmhlcml0IGZsYWcp
IHN0aWxsIHNob3dzIHdob2xlIGZpbGVzeXN0ZW0Kc3RhdGlzdGljcy4gSW4gY29udGFpbmVyIHVz
ZSBjYXNlLCBpdCB3aWxsIGdpdmUgY29udGFpbmVyIHVzZXIKaW5jb25zaXN0ZW50IGV4cGVyaWVu
Y2UgYW5kIGNhdXNlIGNvbmZ1c2lvbiBhYm91dCBhdmFpbGFibGUgZnJlZQpzcGFjZS4KCkRldGFp
bCBpbmZvIGxpa2UgYmVsb3c6CldlIHVzZSBwcm9qZWN0IHF1b3RhIHRvIGxpbWl0IGRpc2sgc3Bh
Y2UgdXNhZ2UgZm9yIGEgY29udGFpbmVyCmFuZCBydW4gZGYgY29tbWFuZCBpbnNpZGUgY29udGFp
bmVyLgoKUnVuIGRmIG9uIGEgZGlyZWN0b3J5OgoKW3Jvb3QgL10jIGRmIC1oIC9ldGMvCkZpbGVz
eXN0ZW3CoMKgwqDCoMKgIFNpemXCoCBVc2VkIEF2YWlsIFVzZSUgTW91bnRlZCBvbgprYXRhU2hh
cmVkwqDCoMKgwqDCoCAxLjBHwqDCoCAxM00gMTAxMk3CoMKgIDIlIC8KClJ1biBkZiBvbiBhIGZp
bGU6Cgpbcm9vdCAvXSMgZGYgLWggL2V0Yy9leHBvcnRzCkZpbGVzeXN0ZW3CoMKgwqDCoMKgIFNp
emXCoCBVc2VkIEF2YWlsIFVzZSUgTW91bnRlZCBvbgprYXRhU2hhcmVkwqDCoMKgwqDCoCAxLjVU
wqAgNzc4TcKgIDEuNVTCoMKgIDElIC8KClNpZ25lZC1vZmYtYnk6IENoZW5nZ3VhbmcgWHUgPGNn
eHU1MTlAbXlrZXJuZWwubmV0PgotLS0KIGZzL2YyZnMvc3VwZXIuYyB8IDUgKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCmluZGV4IDE0NDNjZWUxNTg2My4uYzVi
OWE5MmQ2MDZiIDEwMDY0NAotLS0gYS9mcy9mMmZzL3N1cGVyLmMKKysrIGIvZnMvZjJmcy9zdXBl
ci5jCkBAIC0xMjg3LDggKzEyODcsOSBAQCBzdGF0aWMgaW50IGYyZnNfc3RhdGZzKHN0cnVjdCBk
ZW50cnkgKmRlbnRyeSwgc3RydWN0IGtzdGF0ZnMgKmJ1ZikKIAlidWYtPmZfZnNpZC52YWxbMV0g
PSAodTMyKShpZCA+PiAzMik7CiAKICNpZmRlZiBDT05GSUdfUVVPVEEKLQlpZiAoaXNfaW5vZGVf
ZmxhZ19zZXQoZGVudHJ5LT5kX2lub2RlLCBGSV9QUk9KX0lOSEVSSVQpICYmCi0JCQlzYl9oYXNf
cXVvdGFfbGltaXRzX2VuYWJsZWQoc2IsIFBSSlFVT1RBKSkgeworCWlmICgoaXNfaW5vZGVfZmxh
Z19zZXQoZGVudHJ5LT5kX2lub2RlLCBGSV9QUk9KX0lOSEVSSVQpIHx8CisJICAgICAhU19JU0RJ
UihkZW50cnktPmRfaW5vZGUtPmlfbW9kZSkpICYmCisJICAgIHNiX2hhc19xdW90YV9saW1pdHNf
ZW5hYmxlZChzYiwgUFJKUVVPVEEpKSB7CiAJCWYyZnNfc3RhdGZzX3Byb2plY3Qoc2IsIEYyRlNf
SShkZW50cnktPmRfaW5vZGUpLT5pX3Byb2ppZCwgYnVmKTsKIAl9CiAjZW5kaWYKLS0gCjIuMjAu
MQoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
