Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D538FCAFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 13:51:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEpB1-0008Bv-1T;
	Wed, 05 Jun 2024 11:51:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1sEpAz-0008Bo-S4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 11:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dr1tf/X8B+GJujyAL7DJLZeifJ4nkVJ7tYVSOmHb5YY=; b=HwUaaWWDdS9Qy1PM0c4n/Bzo5e
 sfxchIiQeS/qppGuOynUHEF6uRAe4crNh6l27ow3X2haW+36rHmqZDZo+PiPzW3OzAojNfgoKriFE
 m4VAIX2iOUs5oOEUHp2VbECd1x9HcVnAzI4E3rbj0lRlbRBidCvYA/zKvg15b3C0qn/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dr1tf/X8B+GJujyAL7DJLZeifJ4nkVJ7tYVSOmHb5YY=; b=IjC2qAAuW8fg+UC3GcHAaONz4z
 y2A8O3b0Hv7AygpHtwwI0rvK6oNg8vNAchXD2I+koBEl0+vRXNQeEVQ2d8Mzub+G7M8Bn3ojEWrS3
 64g2ZVQ0Q9kLdyVxMiedyVpNbQ9CyW5me9YbLBtPFj661PYaPjXDHaSYEHPnWgDSRsyQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEpAz-0008Ok-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 11:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E140617DF;
 Wed,  5 Jun 2024 11:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6485C32786;
 Wed,  5 Jun 2024 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717588282;
 bh=WpX8KJ2rFv8rTWOq152ssnWgFzrGTDeKzlN5FY1Oq58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IIw3C5OwJTAPbI1NdQjDOJR4HQjm0V8QNyTIKeYHLzuNJMwhSIql0s9Clt/0BttE2
 ZH7zoYd1ZQ73fX5zVX5XOzvHGkja17Laf3jefxeTCUewNMLAA+61RXQnbM6cMLp0vv
 bJpksREyjBNFdTaW+cEofGALfrtHT8hS8jgtHV0bSJ9tUfh8gU4YH01ftzLutVz7Zd
 KK8xdhkyYz/1t720Jc8lCzKcfHqLsWv2clfmPvg8tmwB/YrF3MWVZCdBKqNAn3rTlU
 UrRXb6st8e3zCorH+v5jFQccWtGyDZD+spLpDaaIsPn7mYOl8omicgsX4F5D2+LV5N
 ozBkq3MSO92RQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  5 Jun 2024 07:50:20 -0400
Message-ID: <20240605115101.2962372-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115101.2962372-1-sashal@kernel.org>
References: <20240605115101.2962372-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.12
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 3bdb7f161697e2d5123b89fe1778ef17a44858e7
 ] Shutdown does not check the error of thaw_super due to readonly, which
 causes a deadlock like below. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sEpAz-0008Ok-Dx
Subject: [f2fs-dev] [PATCH AUTOSEL 6.8 10/24] f2fs: don't set RO when
 shutting down f2fs
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
Cc: Sasha Levin <sashal@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 =?UTF-8?q?Light=20Hsieh=20=28=E8=AC=9D=E6=98=8E=E7=87=88=29?=
 <Light.Hsieh@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KClsgVXBzdHJlYW0gY29tbWl0
IDNiZGI3ZjE2MTY5N2UyZDUxMjNiODlmZTE3NzhlZjE3YTQ0ODU4ZTcgXQoKU2h1dGRvd24gZG9l
cyBub3QgY2hlY2sgdGhlIGVycm9yIG9mIHRoYXdfc3VwZXIgZHVlIHRvIHJlYWRvbmx5LCB3aGlj
aApjYXVzZXMgYSBkZWFkbG9jayBsaWtlIGJlbG93LgoKZjJmc19pb2Nfc2h1dGRvd24oRjJGU19H
T0lOR19ET1dOX0ZVTExTWU5DKSAgICAgICAgaXNzdWVfZGlzY2FyZF90aHJlYWQKIC0gYmRldl9m
cmVlemUKICAtIGZyZWV6ZV9zdXBlcgogLSBmMmZzX3N0b3BfY2hlY2twb2ludCgpCiAgLSBmMmZz
X2hhbmRsZV9jcml0aWNhbF9lcnJvciAgICAgICAgICAgICAgICAgICAgIC0gc2Jfc3RhcnRfd3Jp
dGUKICAgIC0gc2V0IFJPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
IHdhaXRpbmcKIC0gYmRldl90aGF3CiAgLSB0aGF3X3N1cGVyX2xvY2tlZAogICAgLSByZXR1cm4g
LUVJTlZBTCwgaWYgc2JfcmRvbmx5KCkKIC0gZjJmc19zdG9wX2Rpc2NhcmRfdGhyZWFkCiAgLT4g
d2FpdCBmb3Iga3RocmVhZF9zdG9wKGRpc2NhcmRfdGhyZWFkKTsKClJlcG9ydGVkLWJ5OiAiTGln
aHQgSHNpZWggKOisneaYjueHiCkiIDxMaWdodC5Ic2llaEBtZWRpYXRlay5jb20+ClJldmlld2Vk
LWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgpSZXZpZXdlZC1ieTogQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1
a0BrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZnMvZjJmcy9zdXBlci5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3N1
cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKaW5kZXggNjdiZWRkNWI2OWNjMS4uZTFlMmYwYTA2N2I5
OSAxMDA2NDQKLS0tIGEvZnMvZjJmcy9zdXBlci5jCisrKyBiL2ZzL2YyZnMvc3VwZXIuYwpAQCAt
NDE5NCw5ICs0MTk0LDE1IEBAIHZvaWQgZjJmc19oYW5kbGVfY3JpdGljYWxfZXJyb3Ioc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBjaGFyIHJlYXNvbiwKIAlpZiAoc2h1dGRvd24p
CiAJCXNldF9zYmlfZmxhZyhzYmksIFNCSV9JU19TSFVURE9XTik7CiAKLQkvKiBjb250aW51ZSBm
aWxlc3lzdGVtIG9wZXJhdG9ycyBpZiBlcnJvcnM9Y29udGludWUgKi8KLQlpZiAoY29udGludWVf
ZnMgfHwgZjJmc19yZWFkb25seShzYikpCisJLyoKKwkgKiBDb250aW51ZSBmaWxlc3lzdGVtIG9w
ZXJhdG9ycyBpZiBlcnJvcnM9Y29udGludWUuIFNob3VsZCBub3Qgc2V0CisJICogUk8gYnkgc2h1
dGRvd24sIHNpbmNlIFJPIGJ5cGFzc2VzIHRoYXdfc3VwZXIgd2hpY2ggY2FuIGhhbmcgdGhlCisJ
ICogc3lzdGVtLgorCSAqLworCWlmIChjb250aW51ZV9mcyB8fCBmMmZzX3JlYWRvbmx5KHNiKSB8
fCBzaHV0ZG93bikgeworCQlmMmZzX3dhcm4oc2JpLCAiU3RvcHBlZCBmaWxlc3lzdGVtIGR1ZSB0
byByZWFzb246ICVkIiwgcmVhc29uKTsKIAkJcmV0dXJuOworCX0KIAogCWYyZnNfd2FybihzYmks
ICJSZW1vdW50aW5nIGZpbGVzeXN0ZW0gcmVhZC1vbmx5Iik7CiAJLyoKLS0gCjIuNDMuMAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
