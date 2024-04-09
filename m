Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90789E03A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 18:20:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruED0-0000N4-DM;
	Tue, 09 Apr 2024 16:20:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ruECy-0000Ms-Nt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 16:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sj947wh/8AagoE/UzZUwNebBgRd8VQAvBFHc1LfpTVw=; b=c5N2Zy75W1gTZd97zzyao59FoG
 Bi5B16Cn3rJFqBFRvLYbw3BCiMO8zUh31SWxDRhrYza4UCzszM0zmRy6SdFaXfd7/SQ7Gg+obtM2l
 Y4zZXQm/qrzkDl03H/g4zN/ZtnJNrWp4M3CTN6Altq71Wd4zSK32Ec0VoRpAUSxgbbAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sj947wh/8AagoE/UzZUwNebBgRd8VQAvBFHc1LfpTVw=; b=OJTE5n0fs0wsjt037IzkX9Vcv4
 ALHY3kIC4TpmWCri0VVvIS0xysUByXxejXnOk+vQJXPCHfYcpE/FYd11uRNXvk6J3/6zk/EoJpCMT
 XPNEeFN4jonAsahJz/mD8hCk2vMViekDjaoTrN5KurqENNVHQdmGLs0/UwzK1NfDDLfM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruECy-0002f9-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 16:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E340ACE10ED;
 Tue,  9 Apr 2024 16:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BB1C433C7;
 Tue,  9 Apr 2024 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712679620;
 bh=vA77VMKw+Zk+qUpi/Fg+f2xXCoVaVTSiTo5V6KCtvCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNtj7sO3rQIpfn7QUaprFA1g3UWIIxL0NL6ByQZMXWZrTUHPiQrGqkuVWnQDAnd7t
 AyDZ04EA6A1ZmCCaYCfE76Pkhqy9RfgMX220ZsVPAa4YJD3TBF9yymnDmW+RQ2Q3i6
 nYdlHaTTgxeSXkKZg+xuba5X83crSBpnmozVuLHS87OLewcnKDakM1Gj3gI6goYQWh
 M//PFgqny4MeN70sgzKnS5yp1fakYvyjMqeqtvCascOLmOXXWYSCVoeEAjQkPa4peA
 Jk0QL8uJXuRI5rNenaJOHcz1F9jaBqBhzVGTL2J/5iq+97uNsvrV+nyFeyf/xb3vsn
 sJPJWGARlCw4w==
Date: Tue, 9 Apr 2024 16:20:19 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZhVqwwCesxWOfbOA@google.com>
References: <20240404195254.556896-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404195254.556896-1-jaegeuk@kernel.org>
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Shutdown does not check the error of thaw_super due to
 readonly, which causes a deadlock like below.
 f2fs_ioc_shutdown(F2FS_GOING_DOWN_FULLSYNC)
 issue_discard_thread - bdev_freeze - freeze_super - f2fs_stop_checkpoint()
 - f2fs_handle_critical_error - sb_start_write - set RO - waiting - bdev_thaw
 - th [...] 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruECy-0002f9-Ln
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't set RO when shutting down f2fs
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
Cc: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U2h1dGRvd24gZG9lcyBub3QgY2hlY2sgdGhlIGVycm9yIG9mIHRoYXdfc3VwZXIgZHVlIHRvIHJl
YWRvbmx5LCB3aGljaApjYXVzZXMgYSBkZWFkbG9jayBsaWtlIGJlbG93LgoKZjJmc19pb2Nfc2h1
dGRvd24oRjJGU19HT0lOR19ET1dOX0ZVTExTWU5DKSAgICAgICAgaXNzdWVfZGlzY2FyZF90aHJl
YWQKIC0gYmRldl9mcmVlemUKICAtIGZyZWV6ZV9zdXBlcgogLSBmMmZzX3N0b3BfY2hlY2twb2lu
dCgpCiAgLSBmMmZzX2hhbmRsZV9jcml0aWNhbF9lcnJvciAgICAgICAgICAgICAgICAgICAgIC0g
c2Jfc3RhcnRfd3JpdGUKICAgIC0gc2V0IFJPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtIHdhaXRpbmcKIC0gYmRldl90aGF3CiAgLSB0aGF3X3N1cGVyX2xvY2tlZAog
ICAgLSByZXR1cm4gLUVJTlZBTCwgaWYgc2JfcmRvbmx5KCkKIC0gZjJmc19zdG9wX2Rpc2NhcmRf
dGhyZWFkCiAgLT4gd2FpdCBmb3Iga3RocmVhZF9zdG9wKGRpc2NhcmRfdGhyZWFkKTsKClJlcG9y
dGVkLWJ5OiAiTGlnaHQgSHNpZWggKOisneaYjueHiCkiIDxMaWdodC5Ic2llaEBtZWRpYXRlay5j
b20+ClNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Ci0tLQoK
IENoYW5nZSBsb2cgZnJvbSB2MToKICAtIHVzZSBiZXR0ZXIgdmFyaWFibGUKICAtIGZpeCB0eXBv
CgogZnMvZjJmcy9zdXBlci5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMg
Yi9mcy9mMmZzL3N1cGVyLmMKaW5kZXggOGFjNDczNGMyZGY2Li5kZjMyNTczZDFmNjIgMTAwNjQ0
Ci0tLSBhL2ZzL2YyZnMvc3VwZXIuYworKysgYi9mcy9mMmZzL3N1cGVyLmMKQEAgLTQxNTksOSAr
NDE1OSwxNSBAQCB2b2lkIGYyZnNfaGFuZGxlX2NyaXRpY2FsX2Vycm9yKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgdW5zaWduZWQgY2hhciByZWFzb24sCiAJaWYgKHNodXRkb3duKQogCQlzZXRf
c2JpX2ZsYWcoc2JpLCBTQklfSVNfU0hVVERPV04pOwogCi0JLyogY29udGludWUgZmlsZXN5c3Rl
bSBvcGVyYXRvcnMgaWYgZXJyb3JzPWNvbnRpbnVlICovCi0JaWYgKGNvbnRpbnVlX2ZzIHx8IGYy
ZnNfcmVhZG9ubHkoc2IpKQorCS8qCisJICogQ29udGludWUgZmlsZXN5c3RlbSBvcGVyYXRvcnMg
aWYgZXJyb3JzPWNvbnRpbnVlLiBTaG91bGQgbm90IHNldAorCSAqIFJPIGJ5IHNodXRkb3duLCBz
aW5jZSBSTyBieXBhc3NlcyB0aGF3X3N1cGVyIHdoaWNoIGNhbiBoYW5nIHRoZQorCSAqIHN5c3Rl
bS4KKwkgKi8KKwlpZiAoY29udGludWVfZnMgfHwgZjJmc19yZWFkb25seShzYikgfHwgc2h1dGRv
d24pIHsKKwkJZjJmc193YXJuKHNiaSwgIlN0b3BwZWQgZmlsZXN5c3RlbSBkdWUgdG8gcmVhc29u
OiAlZCIsIHJlYXNvbik7CiAJCXJldHVybjsKKwl9CiAKIAlmMmZzX3dhcm4oc2JpLCAiUmVtb3Vu
dGluZyBmaWxlc3lzdGVtIHJlYWQtb25seSIpOwogCS8qCi0tIAoyLjQ0LjAuNDc4LmdkOTI2Mzk5
ZWY5LWdvb2cKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
