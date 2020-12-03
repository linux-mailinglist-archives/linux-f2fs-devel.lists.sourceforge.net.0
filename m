Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E82CD1C7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 09:52:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2LnxOE3EKI4D1bZ/gMi8Gop/NVDg9Xy9yrNSaXX7dg=; b=lboxo+yfd+1LpoNFvKP62uxi80
	uXjadwDlwdX1WbOTQyweURvJPpZD4rD4Tibse5hENwwUohRJI8xFio9HLRZ98F5NAupyNxq8cae8B
	Vu2V38xs/2EKXcuRvMuYeUa8+YWvT6mriUlXq9pMJtSvmNLK+CozBk3nrpIUvwJP8rBs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkkLp-0001YY-Tf; Thu, 03 Dec 2020 08:52:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <diego.sanchez@boldwhite24.com>) id 1kkkKz-0001WD-04
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hS3ibs4caZkahrzgcMN2TAJo2B2H5Muwb2NidDYlIzQ=; b=I9lns01E2XXI8BhIb2lpNXqrtR
 1BdEUCVvKsLtboRNTuSlcTuA7WPlXggSLkJCQWMnrmJuh754n7cxNsg5M3/6z8PX1p0uFc9GrqPW1
 KLJq7a5QOSrL+bO5IwZ6htd+tDLUKYM4mjlt9ow0FqyW1D0srr/42Kz7aMAA2emsPL/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hS3ibs4caZkahrzgcMN2TAJo2B2H5Muwb2NidDYlIzQ=; b=I
 8eGThjRnf0n5fQkP5F7OxmDnWxmG5yMibu6lRcJViodGtsxzMimfzmDP/0kpuwiNOq8BtbqQQ2Spa
 bFy/FVRgaKzrKtY7dKTaBiVOztxcZMbVI8fVEEugGtRX8VDJ+l1edvYWNlheElchrEl2uAJwULqod
 CqSvO8GEQaGq8FN8=;
Received: from mail.boldwhite24.com ([80.211.42.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkkKo-00D3bf-NU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:51:40 +0000
Received: by mail.boldwhite24.com (Postfix, from userid 1001)
 id 54E3EA3241; Thu,  3 Dec 2020 08:50:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=boldwhite24.com;
 s=mail; t=1606985449;
 bh=hS3ibs4caZkahrzgcMN2TAJo2B2H5Muwb2NidDYlIzQ=;
 h=Date:From:To:Subject:From;
 b=P02NrHBIBNq6Hn/sJxcc08R1rCtJ10cGyNG3Te+6HCsK2lMUvIg5ZxPVS+uSaWW2/
 /YTA7UwlyTIItzFGiPQkhLvrsB88PdqYomTgfmZReHkEqscF2mW7ebTKvHjfCZgeuH
 hQVDwFl0YXCByj76djYEU0E1cVThx6FmcZbbPp9AK0CrsocLfLOltqijKg+eIso0Xa
 JoLNuvzB4VSmVsBQiZMvDws0mlGY/ZOckXPISxk08WlzvrP8oxAHhx8ba9MUSG6OuB
 ztqBrus6mmEPJq64W36tZqDzo2dzHrQ+/TasdpjMXu4B8nRRtmG0LyG9gZLmCMPDt/
 716df43D4+KMQ==
Received: by mail.boldwhite24.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Dec 2020 08:50:11 GMT
Message-ID: <20201203074501-0.1.2m.anlm.0.lbnpd3ajci@boldwhite24.com>
Date: Thu,  3 Dec 2020 08:50:11 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.boldwhite24.com
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kkkKo-00D3bf-NU
Subject: [f2fs-dev] Disinfection
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
From: =?UTF-8?Q? Diego_S=C3=A1nchez ?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?Q? Diego_S=C3=A1nchez ?= <diego.sanchez@boldwhite24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R29vZCBtb3JuaW5nLAoKbG9va2luZyBmb3IgY29tcGFuaWVzIGludGVyZXN0ZWQgaW4gcmFpc2lu
ZyBhZGRpdGlvbmFsIGNhcGl0YWwgYnkgZGl2ZXJzaWZ5aW5nIHRoZWlyIG9mZmVyIGluIHNvYXBz
LCBsaXF1aWRzIGFuZCBnZWxzIGZvciBoYW5kIGRpc2luZmVjdGlvbiBhbmQgY29zbWV0aWNzIGZv
ciBib2R5IGFuZCBoYWlyIGNhcmUuCgpUaGUgZGlzdHJpYnV0aW9uIG9mIGlubm92YXRpdmUgcHJv
ZHVjdHMgY29ycmVzcG9uZGluZyB0byB0aGUgY3VycmVudCBwcmVmZXJlbmNlcyBvZiBjdXN0b21l
cnMgaW4gdGhlIGZpZWxkIG9mIGh5Z2llbmUgYW5kIHByZXZlbnRpdmUgaGVhbHRoY2FyZSBhbGxv
d3Mgb3VyIHBhcnRuZXJzIHRvIGdhaW4gbmV3IG1hcmtldHMgYW5kIGFjaGlldmUgYmV0dGVyIGVj
b25vbWljIHJlc3VsdHMuCgpJbiBhZGRpdGlvbiB0byBwcm9kdWN0cyB3aXRoIGJhY3RlcmljaWRh
bCBhY3Rpb24sIG91ciByYW5nZSBpbmNsdWRlcyBzaG93ZXIgZ2Vscywgc2hhbXBvb3MgYW5kIGhh
aXIgY29uZGl0aW9uZXJzLCBhcyB3ZWxsIGFzIGVmZmljaWVudCwgY29uY2VudHJhdGVkIGRldGVy
Z2VudHMuCgpUaGUgdmVyc2F0aWxpdHkgKHN1aXRhYmxlIGZvciBhbGwgc2tpbiB0eXBlcykgY29t
YmluZWQgd2l0aCBhbiBhZmZvcmRhYmxlIHByaWNlIG1lYW5zIHRoYXQgY3VzdG9tZXJzIG1ha2Ug
YW4gaW5mb3JtZWQgY2hvaWNlIG9mIGEgcHJvZHVjdCBhbW9uZyBvdGhlcnMgYXZhaWxhYmxlIG9u
IHRoZSBtYXJrZXQuCgpBcmUgeW91IGludGVyZXN0ZWQgaW4gY29vcGVyYXRpb24/CgpEaWVnbyBT
w6FuY2hlegoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
