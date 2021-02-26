Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B153325B90
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 03:21:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFSkt-0000wI-9Q; Fri, 26 Feb 2021 02:21:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1lFSks-0000wB-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 02:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6+dqTwnVHF+NUVIoH3KFgCf9poEE48MumP/V31f4fF0=; b=Go0WDkxo+NE2RE+kBmgdtEKaP+
 d4Zc+DjEUacUUxDvzJMdVGegm6HsjEKeTu3aBfWTOewUgb7WTjxFaOU98sgmlElxh+/DQvS3evA0V
 RCBrlPwpZhIfNDlmngrnSJPFR/4POmY8A9sm2dGXkP7LBI5q9mB7zRpJiWQmYtEMGwBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6+dqTwnVHF+NUVIoH3KFgCf9poEE48MumP/V31f4fF0=; b=FXS6uJLld5UjbORyGH1L9ahJKn
 S7y0gIjFFiVLy4VPyFnYeuGqc64gHuYyfSU4zKx6wB4nPKJ6sXDiaazutmRmFvBhWX1cLpZd5tj8b
 CC2QwPew7Xchr6l1TMBG/sW3uvew9ZQgurN1ydjGVNsd3L4s6gOXyKAFPQOHDGzlgsaA=;
Received: from sender2-pp-o92.zoho.com.cn ([163.53.93.251])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFSkc-0000aC-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 02:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1614306047; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=fiXq/ZnrAwvzYZVD7y3dg/lTvsPiT29QW5g1mkMaSXE+oCBceulBO+d69pRpkCMvxQzSSBL0JwxQxfm44GN4r9PJVog8XnWu5YNeuWp3na+6WAfcZQz5RjuCAfqCtvD6DVjgLsgi7MSwKIC6Frczmcqps7ZxCvhTEllzgLl1/04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1614306047;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To;
 bh=6+dqTwnVHF+NUVIoH3KFgCf9poEE48MumP/V31f4fF0=; 
 b=jWbdp4FiFjpfMfyO0j2CQ+ZX153y5TY/puEluiSQJL+ad6UbJG2W2Rc7DP0G/rujjhDhCQdp5Ln+L+xMVx1Z+vPVmFDB4Mr0S0tZPs5uvhPohpMOjwHoK8vOQnurN3fezoxYSrhHcvwd89SlyvY3VCu7/TOIN04sKZ8dI/T0fa4=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614306047; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=6+dqTwnVHF+NUVIoH3KFgCf9poEE48MumP/V31f4fF0=;
 b=ZgXNqMM+6HSIahFIXysp1hoH5kfhlMWxNb66vlzP6tm01CPewFp9jcF6djv64ELW
 9faJLDL1302jRnVYFRXcGmY9gLLkopDm9YC/Q9tYGZabieugKlli7B9SHPJ0r/OCVkm
 +7O2O/YWIAnif0OoptatK68wApwCPhUE9tHk4IPo=
Received: from mail.baihui.com by mx.zoho.com.cn
 with SMTP id 16143060454411013.0983921765252;
 Fri, 26 Feb 2021 10:20:45 +0800 (CST)
Date: Fri, 26 Feb 2021 10:20:45 +0800
From: Chengguang Xu <cgxu519@mykernel.net>
To: "Chao Yu" <yuchao0@huawei.com>
Message-ID: <177dc236dfe.cc0d00b0706.1250962138753029869@mykernel.net>
In-Reply-To: <c64bd725-2600-4d0c-bfa9-1e1fc7cdc045@huawei.com>
References: <20210223115016.2183798-1-cgxu519@mykernel.net>
 <c64bd725-2600-4d0c-bfa9-1e1fc7cdc045@huawei.com>
MIME-Version: 1.0
Importance: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1lFSkc-0000aC-Rt
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use per-inode maxbytes in
 f2fs_fiemap
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
Reply-To: cgxu519@mykernel.net
Cc: jaegeuk <jaegeuk@kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

IC0tLS0g5ZyoIOaYn+acn+WbmywgMjAyMS0wMi0yNSAwOToyNDo1MSBDaGFvIFl1IDx5dWNoYW8w
QGh1YXdlaS5jb20+IOaSsOWGmSAtLS0tCiA+IE9uIDIwMjEvMi8yMyAxOTo1MCwgQ2hlbmdndWFu
ZyBYdSB3cm90ZToKID4gPiBGMkZTIGlub2RlIG1heSBoYXZlIGRpZmZlcmVudCBtYXggc2l6ZSwK
ID4gPiBzbyBjaGFuZ2UgdG8gdXNlIHBlci1pbm9kZSBtYXhieXRlcy4KID4gPiAKID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGVuZ2d1YW5nIFh1IDxjZ3h1NTE5QG15a2VybmVsLm5ldD4KID4gPiAtLS0K
ID4gPiAgIGZzL2YyZnMvZGF0YS5jIHwgNSArKysrKwogPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQogPiA+IAogPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2Zz
L2YyZnMvZGF0YS5jCiA+ID4gaW5kZXggYjk3MjFjOGYxMTZjLi5iMzMwYzZhMjdiMTQgMTAwNjQ0
CiA+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKID4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwogPiA+
IEBAIC0xODM4LDYgKzE4MzgsNyBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9k
ZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKID4gPiAgICAgICBpbnQgcmV0
ID0gMDsKID4gPiAgICAgICBib29sIGNvbXByX2NsdXN0ZXIgPSBmYWxzZTsKID4gPiAgICAgICB1
bnNpZ25lZCBpbnQgY2x1c3Rlcl9zaXplID0gRjJGU19JKGlub2RlKS0+aV9jbHVzdGVyX3NpemU7
CiA+ID4gKyAgICBsb2ZmX3QgbWF4Ynl0ZXM7CiA+ID4gICAKID4gPiAgICAgICBpZiAoZmllaW5m
by0+ZmlfZmxhZ3MgJiBGSUVNQVBfRkxBR19DQUNIRSkgewogPiA+ICAgICAgICAgICByZXQgPSBm
MmZzX3ByZWNhY2hlX2V4dGVudHMoaW5vZGUpOwogPiA+IEBAIC0xODQ1LDYgKzE4NDYsMTAgQEAg
aW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50
X2luZm8gKmZpZWluZm8sCiA+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0OwogPiA+ICAgICAg
IH0KID4gPiAgIAogPiA+ICsgICAgbWF4Ynl0ZXMgPSBtYXhfZmlsZV9ibG9ja3MoaW5vZGUpIDw8
IEYyRlNfQkxLU0laRV9CSVRTOwogPiA+ICsgICAgaWYgKGxlbiA+IG1heGJ5dGVzIHx8IChtYXhi
eXRlcyAtIGxlbikgPCBzdGFydCkKID4gPiArICAgICAgICBsZW4gPSBtYXhieXRlcyAtIHN0YXJ0
OwogPiAKID4gVGhpcyBzaG91bGQgYmUgY2hlY2tlZCB1bmRlciBpbm9kZSBsb2NrLCBvdGhlcndp
c2UgdGhlIG1heCBmaWxlc2l6ZSBjYWxjdWxhdGlvbgogPiBjYW4gcmFjZSB3aXRoIGNvbXByZXNz
IGlub2RlIGNvbnZlcnNpb24uCiA+IAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4gVGhlcmUgYXJl
IHNvbWUgb3RoZXIgcGxhY2VzIGFsc28gY2FsbGluZyBtYXhfZmlsZV9ibG9ja3MoKSBhbmQgZjJm
c19jb21wcmVzc2VkX2ZpbGUoKSwKc28gIEknbSB3b25kZXJpbmcgIGlmIHdlIHNob3VsZCBhZGQg
bG9jayBpbnNpZGUgZjJmc19jb21wcmVzc2VkX2ZpbGUoKSB0byBhdm9pZCByYWNlIHdpdGggY29t
cHJlc3MgaW5vZGUgY29udmVyc2lvbi4KClRoYW5rcywKQ2hlbmdndWFuZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
