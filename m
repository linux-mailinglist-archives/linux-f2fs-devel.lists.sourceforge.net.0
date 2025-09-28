Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3CBA7739
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 21:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pdWUIt19GlHAchWWZp73NsrlxTv3fBIIhUYooCOATKc=; b=EjSbYYoyYLOBw7X1HdKiRdpIkB
	UC5mVuMm1xS8ZMmd/tfXbMtifWIRz2a1+YMTiq08iumoYzoWZ2GU+FiUq7Y5fQ37FJ96ILFcSepWT
	SD1sUZ/w5L5sr3xX9LNe6IpFcL90OchoanwwRb/drw04Fx8tTyzpApWaHsvDIpvWsaew=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2xCA-0002eZ-02;
	Sun, 28 Sep 2025 19:36:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <user3mila@disroot.org>) id 1v2xBo-0002dx-M2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 19:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EME5MpB5QqD3r0H4NUzUaZNe8BHDulavmT1XQMA2kWg=; b=a8JO3oGNa6oU6a4URWyideMwvq
 56qW3XMrzF1lryKbO77YF5P0C86vpnLTzedeTkbAVXIWu5IPGNopTLQItr1JuPVDMRiC1xsJD5Siq
 t6iIJMCqJ9eMc1/8k2BOBVVgmLuT4BMaTpdXFPnnG7i+yOQEzheii1znIxZo8eDauE4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EME5MpB5QqD3r0H4NUzUaZNe8BHDulavmT1XQMA2kWg=; b=M
 R6GUsiGiGt9bBONOO9jKVZfRNRui+PNIVjri6WNOKusdYiPRevTa7JcWeDSOgLyyVh1x08+3cT0he
 2VPx6L+87SAdVNtTiRZV2gQZSeEjSmftsPOVGWstEerexgd6johLRYVjb/S0Ef2bF4+zIYjPo+bMF
 4Ib3SWkJ8c7hdjwg=;
Received: from layka.disroot.org ([178.21.23.139])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v2xBn-00063U-DM for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 19:36:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B8875260CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 21:36:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz87xf33tHO5 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 21:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1759088159; bh=39xIQ9puduXS2vcM8mT//ydAik9VFTmYwOmfjTzv8h0=;
 h=Date:To:From:Subject;
 b=f5A9PnhWBRtihn0+GKvrg1fQzgToLWtFvgcjCkZX+pQKr7B3VztRGROrcZqR5N/zG
 k9+pK2nzIl1mDSCyrBDMg9TQMxppo/HPalI22eEt4nZDf5TkWsTvo1plloVTrePVfH
 YxO9mfIxAK7xJsdwVaYX5xRacSR3EOtfUlXHIzCA+FoV12XSKeAWA+sEklsEo4xQtA
 AeHLOEzXoTdGyTrEKiBP6IQraAmiJmPckYJcJlRrvDBQP+FDnRAyUgK5VCIpjMVZgR
 I0Dl/rODC8f0g4XvYy64Taccz5J0rCoUbRt8CFuJHJRi5oNnpCobPUyBinhRvLxtGa
 JP5JMSQGxTb7g==
Message-ID: <12530fac-afec-46f9-89cc-a51f1dda71b2@disroot.org>
Date: Sun, 28 Sep 2025 21:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: f2fs <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I am experiencing this bug
 https://gitlab.alpinelinux.org/alpine/aports/-/issues/17543.
 I wanted to try the latest commit but it will fail to compile. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1v2xBn-00063U-DM
Subject: [f2fs-dev] fsck service "Error: In use by the system!"
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
From: realroot via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: realroot <user3mila@disroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sCgoKSSBhbSBleHBlcmllbmNpbmcgdGhpcyBidWcgCmh0dHBzOi8vZ2l0bGFiLmFscGlu
ZWxpbnV4Lm9yZy9hbHBpbmUvYXBvcnRzLy0vaXNzdWVzLzE3NTQzLgoKSSB3YW50ZWQgdG8gdHJ5
IHRoZSBsYXRlc3QgY29tbWl0IGJ1dCBpdCB3aWxsIGZhaWwgdG8gY29tcGlsZS4KCkdjYzoKCm1h
a2VbM106IEVudGVyaW5nIGRpcmVjdG9yeSAKJy8uLi4vZjJmcy10b29scy9zcmMvM2JkNDkxNDlk
YWU3MjM3YjkzMWIwOWQ4N2QwMGIyYWVmOGY3YWY5My90b29scy9mMmZzX2lvJwogwqAgQ0PCoCDC
oCDCoCDCoGYyZnNfaW8ubwpmMmZzX2lvLmM6IEluIGZ1bmN0aW9uICdkb19mYWxsb2NhdGUnOgpm
MmZzX2lvLmM6NjEzOjMzOiBlcnJvcjogJ0ZBTExPQ19GTF9DT0xMQVBTRV9SQU5HRScgdW5kZWNs
YXJlZCAoZmlyc3QgCnVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogwqAgNjEzIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1vZGUgfD0gRkFMTE9DX0ZMX0NPTExBUFNFX1JBTkdF
OwogwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmYyZnNfaW8uYzo2MTM6MzM6IG5vdGU6IGVh
Y2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSAKZm9yIGVhY2gg
ZnVuY3Rpb24gaXQgYXBwZWFycyBpbgpmMmZzX2lvLmM6NjE2OjMzOiBlcnJvcjogJ0ZBTExPQ19G
TF9JTlNFUlRfUkFOR0UnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSAKaW4gdGhpcyBmdW5jdGlvbikK
IMKgIDYxNiB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtb2RlIHw9IEZB
TExPQ19GTF9JTlNFUlRfUkFOR0U7CiDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBefn5+fn5+fn5+fn5+fn5+fn5+fn5+CmYyZnNfaW8u
Yzo2MjI6MzM6IGVycm9yOiAnRkFMTE9DX0ZMX1pFUk9fUkFOR0UnIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiAKdGhpcyBmdW5jdGlvbikKIMKgIDYyMiB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBtb2RlIHw9IEZBTExPQ19GTF9aRVJPX1JBTkdFOwogwqAgwqAgwqAgfMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KbWFrZVszXTogKioqIFtNYWtlZmlsZTo0MTE6IGYyZnNfaW8ub10gRXJyb3Ig
MQoKCkNsYW5nOgoKbWFrZVsyXTogRW50ZXJpbmcgZGlyZWN0b3J5IAonLy4uLi9mMmZzLXRvb2xz
L3NyYy8zYmQ0OTE0OWRhZTcyMzdiOTMxYjA5ZDg3ZDAwYjJhZWY4ZjdhZjkzL21rZnMnCiDCoCBD
Q8KgIMKgIMKgIMKgZjJmc19mb3JtYXRfbWFpbi5vCiDCoCBDQ8KgIMKgIMKgIMKgZjJmc19mb3Jt
YXQubwogwqAgQ0PCoCDCoCDCoCDCoGYyZnNfZm9ybWF0X3V0aWxzLm8KIMKgIENDwqAgwqAgwqAg
wqBsaWJmMmZzX2Zvcm1hdF9sYS1mMmZzX2Zvcm1hdF9tYWluLmxvCiDCoCBDQ8KgIMKgIMKgIMKg
bGliZjJmc19mb3JtYXRfbGEtZjJmc19mb3JtYXQubG8KIMKgIENDwqAgwqAgwqAgwqBsaWJmMmZz
X2Zvcm1hdF9sYS1mMmZzX2Zvcm1hdF91dGlscy5sbwogwqAgQ0NMRMKgIMKgIMKgbWtmcy5mMmZz
CmNsYW5nOiBlcnJvcjogbm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJy4uL2xpYi8ubGlicy9s
aWJmMmZzLnNvJwptYWtlWzJdOiAqKiogW01ha2VmaWxlOjQ4NzogbWtmcy5mMmZzXSBFcnJvciAx
Cm1ha2VbMl06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCgpCZXN0IHJlZ2Fy
ZHMsCgpSZWFscm9vdAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
