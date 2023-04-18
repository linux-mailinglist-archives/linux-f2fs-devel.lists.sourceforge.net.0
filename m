Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDEE6E5B96
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 10:06:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pogLp-0003Qv-BU;
	Tue, 18 Apr 2023 08:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kristian.pletanek@mahavavy.com>) id 1pogLo-0003Qp-4R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 08:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IfqQW79nVX/qUpmHcJiWDpV9BQnOf/s+Zcq9ON74QJY=; b=cCwaRNI0Zp8u0amL5igtWDeqMS
 +EW8D7yfERrH2ftgC9wkUz2687Sz7C3SfJaTFqVL6MNMVWDop4aAB66Rix2Mtw3xmkutHG9LkJCFI
 FpBjIJ/YNhYQhnMIHK0IjrS/u8bxEYUiZ7MHVol+BOQmZ6Ekix5G0RD5wDaZJ1Ic0n7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IfqQW79nVX/qUpmHcJiWDpV9BQnOf/s+Zcq9ON74QJY=; b=b
 tqnfDPYbOR/rGclHjLE7Y3mfNLz+OEXGBixo/6XHyjbcVl8Cn+6GZ7pNuWQbiJ5VLdI0uhn3VBi0N
 NVIKl6sYenlFZM2bfkUprRnGgY+dJpwDtPSBgOZtsTga/ouziNZpxi3EvjxL2zJquaz92xfqEp0ic
 7/6yQHZ/mnQZA2Wk=;
Received: from mail.mahavavy.com ([92.222.170.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pogLm-00BFRJ-8m for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 08:06:08 +0000
Received: by mail.mahavavy.com (Postfix, from userid 1002)
 id 977AE232D1; Tue, 18 Apr 2023 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mahavavy.com; s=mail;
 t=1681803672; bh=IfqQW79nVX/qUpmHcJiWDpV9BQnOf/s+Zcq9ON74QJY=;
 h=Date:From:To:Subject:From;
 b=GMX10iNd3B40F26E5GCEzrc2IKIVeYwYXQtjXr5uEeGf9dexb+N42++/WEbSJlpEo
 OYWOTVP0mfgJ4jzx/3UFaJLNRKMZWZUYsBFD1C14BdMVbwET3ErNYMblx6M1GKZsgG
 kS2KHs1kjmZ368wk/U5b9mCXVf7iQCjFg3A0fKP8MTl0tBlOHZ9FT6OyTmUvvDcV9z
 iPBVhSJMFxDkfpESWbQn55nHL2DCfPTRhBGDO1Blv6TQC/nLAIGJ6TX5KWz5ebC2Ub
 mUVEjGIeTata1Dy+o5YYMZiD1dXoBR7q6au0Ejtf8PAFm0s8FAJHqQid6Nj8dStrd7
 zvBC5OV1pOVyQ==
Received: by mail.mahavavy.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Apr 2023 07:41:02 GMT
Message-ID: <20230418064500-0.1.21.32yo.0.k07yrtg8ol@mahavavy.com>
Date: Tue, 18 Apr 2023 07:41:02 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.mahavavy.com
MIME-Version: 1.0
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dobré ráno, zajišťujeme technologii tlakového lití hliníku.
    Máme výrobní závody v Polsku, Švédsku a Číně se schopností flexibilně
    přesouvat výrobu mezi lokalitami. 
 
 Content analysis details:   (1.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  1.9 MIXED_ES               Too many es are not es
X-Headers-End: 1pogLm-00BFRJ-8m
Subject: [f2fs-dev] =?utf-8?b?VGxha292xJsgbGl0w70=?=
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
From: =?UTF-8?Q? Kristi=C3=A1n_Plet=C3=A1nek ?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?Q? Kristi=C3=A1n_Plet=C3=A1nek ?=
 <kristian.pletanek@mahavavy.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9icsOpIHLDoW5vLAoKemFqacWhxaV1amVtZSB0ZWNobm9sb2dpaSB0bGFrb3bDqWhvIGxpdMOt
IGhsaW7DrWt1LgoKTcOhbWUgdsO9cm9ibsOtIHrDoXZvZHkgdiBQb2xza3UsIMWgdsOpZHNrdSBh
IMSMw61uxJsgc2Ugc2Nob3Bub3N0w60gZmxleGliaWxuxJsgcMWZZXNvdXZhdCB2w71yb2J1IG1l
emkgbG9rYWxpdGFtaS4KCk5hxaFlIGxpY8OtIGJ1xYhreSBqc291IHbEm3TFoWlub3UgYXV0b21h
dGlja8OpIG5lYm8gcG9sb2F1dG9tYXRpY2vDqSwgY2/FviB1bW/FvsWIdWplIHbDvXJvYnUgdmVs
a8O9Y2ggdsO9cm9ibsOtY2ggc8OpcmnDrSBzIHZ5c29rb3UgZmxleGliaWxpdG91IGRldGFpbMWv
LgogClBvc2t5dHVqZW1lIHBvZHBvcnUgdiBrYcW+ZMOpIGbDoXppIHbDvXZvamUgcHJvamVrdHUs
IHZ5dsOtasOtbWUgc3RydWt0dXJ1IGRldGFpbHUuCgpDaHTEm2xpIGJ5c3RlIG1sdXZpdCBvIHNw
b2x1cHLDoWNpIHYgdMOpdG8gb2JsYXN0aT8KClBvemRyYXZ5CktyaXN0acOhbiBQbGV0w6FuZWsK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
