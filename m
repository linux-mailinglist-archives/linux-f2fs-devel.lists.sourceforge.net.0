Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745588638F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Mar 2024 23:58:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnRMF-0004CV-2L;
	Thu, 21 Mar 2024 22:57:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hdanton@sina.com>) id 1rnRMD-0004CN-HB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Mar 2024 22:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KULbmLBkM2LOROJvBDqj2roRrmgPyqS7Rbsr/TUpYxg=; b=l9cfbN3D8MqNNIgnRuucQJ2Q3w
 JZhrhhkiNSHxed3e8759lXl0HFQ0MHHKj2xiCAMAIH2zfbUnXNvShtvIfb1INEw15NwDsS6gLvSPp
 EfLtyacqYQSIBk7DgA1PhIAG0HanGWLFTLJitikwoKUbijipUgU8v94ceeDyF2yfwdw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KULbmLBkM2LOROJvBDqj2roRrmgPyqS7Rbsr/TUpYxg=; b=T6aKDCAn9oSCOSw4YAPRtxpA1J
 OuzFvkU18VabD2C3kVOP+8X4u4SAD3Luoubvi+ljZvjruREeaW1nvXi4KtGSSvoVwS3HwVDFZ4O/2
 VyDBh/u+7xHkmsy/lVKUkgto2y4ZIWit4Ik+FyVgqiz8/86PWNORTUrFjFt3yUMRvR2o=;
Received: from mail115-24.sinamail.sina.com.cn ([218.30.115.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnRM9-0008Uv-EY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Mar 2024 22:57:57 +0000
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.69.35])
 by sina.com (10.75.12.45) with ESMTP
 id 65FCB7E300003EF3; Thu, 22 Mar 2024 06:42:45 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 79488531458118
X-SMAIL-UIID: DBC259E4D4454619A4D39A5139142850-20240322-064245-1
From: Hillf Danton <hdanton@sina.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 22 Mar 2024 06:42:33 +0800
Message-Id: <20240321224233.2541-1-hdanton@sina.com>
In-Reply-To: <20240320001442.497813-1-jaegeuk@kernel.org>
References: 
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue,
 19 Mar 2024 17:14:42 -0700 Jaegeuk Kim >
 f2fs_ioc_shutdown(F2FS_GOING_DOWN_NOSYNC)
 issue_discard_thread > - mnt_want_write_file() > -
 sb_start_write(SB_FREEZE_WRITE) __sb_start_write() percp [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [218.30.115.24 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hdanton[at]sina.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1rnRM9-0008Uv-EY
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid the deadlock case when stopping
 discard thread
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Light=20Hsieh=20=28=E8=AC=9D=E6=98=8E=E7=87=88=29?=
 <Light.Hsieh@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCAxOSBNYXIgMjAyNCAxNzoxNDo0MiAtMDcwMCBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPgo+IGYyZnNfaW9jX3NodXRkb3duKEYyRlNfR09JTkdfRE9XTl9OT1NZTkMpICBp
c3N1ZV9kaXNjYXJkX3RocmVhZAo+ICAtIG1udF93YW50X3dyaXRlX2ZpbGUoKQo+ICAgIC0gc2Jf
c3RhcnRfd3JpdGUoU0JfRlJFRVpFX1dSSVRFKQoJIF9fc2Jfc3RhcnRfd3JpdGUoKQoJICAgcGVy
Y3B1X2Rvd25fcmVhZCgpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBzYl9zdGFydF9pbnR3cml0ZShTQl9GUkVFWkVfRlMpOwoJCQkJCQkgICBfX3NiX3N0
YXJ0X3dyaXRlKCkKCQkJCQkJICAgICBwZXJjcHVfZG93bl9yZWFkKCkKCkdpdmVuIGxvY2sgYWNx
dWlyZXJzIGZvciByZWFkIG9uIGJvdGggc2lkZXMsIHd0ZiBkZWFkbG9jayBhcmUgeW91IGZpeGlu
Zz8KCj4gIC0gZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgICAgICAgICAgICA6IHdh
aXRpbmcKPiAgICAgU1RPUF9DUF9SRUFTT05fU0hVVERPV04pOwo+ICAtIGYyZnNfc3RvcF9kaXNj
YXJkX3RocmVhZChzYmkpOwo+ICAgIC0ga3RocmVhZF9zdG9wKCkKPiAgICAgIDogd2FpdGluZwo+
IAo+ICAtIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7CgpNb3JlIGltcG9ydGFudCwgZmVlbCBm
cmVlIHRvIGFkZCBpbiBzcGluLgoKCVJlcG9ydGVkLWJ5OiAiTGlnaHQgSHNpZWggKOisneaYjueH
iCkiIDxMaWdodC5Ic2llaEBtZWRpYXRlay5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
