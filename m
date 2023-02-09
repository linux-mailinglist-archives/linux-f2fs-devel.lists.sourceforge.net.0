Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF1C68FDD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Feb 2023 04:20:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPxU6-0003bB-Pu;
	Thu, 09 Feb 2023 03:20:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <linux@weissschuh.net>) id 1pPxU5-0003b4-FA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Feb 2023 03:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3PDIZyYb+5LLhaFUqsvYX1N3H9Ka1BZC1OmItwxznB4=; b=gXfgpxtWR24ZA+l2K421SuIXw4
 L9MLaCz5jqR6V3oc0yDWGEhbzLFNRw/OW1lsNUJ9FyUA/f/Oz5niTG/TxZgO+ySbmvaYZPuLIFLlb
 U9ticjCVvK/MBBiN5Ucp3HwDLMWMFmhpKx2R5/Xr/dPR2EIYWGb0yJud6ZNgIvFoAmjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3PDIZyYb+5LLhaFUqsvYX1N3H9Ka1BZC1OmItwxznB4=; b=Y
 dFKYO67okREtp0n04fF5HqibJmUR/4p9qjRHGmpAhiKTPiLUJ9LcelLQ549VC+/CEp12r8CQhNuoC
 PkhqSC/1sRpoMigk5P7dzpB422zZjVoAP3fEhPdjYlosSsOaH3zOdbQqPX0hM5/+8FbzErtF5NFB7
 Un/L8NWcIVlOHm5k=;
Received: from todd.t-8ch.de ([159.69.126.157])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPxTz-0006ds-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Feb 2023 03:20:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1675912814;
 bh=0ax1L+4wlH+3bsB/7eEn2YOweom015kqtn2sv4C2TLM=;
 h=From:Date:Subject:To:Cc:From;
 b=FmqVtcQMfIPfadTCbIb6fQaMYIPvH7vQ8bGmgzgE48D5pOefvT8fWpZQQmsMrDrF9
 fOJ4kowhcbW5ytiOuOmPFxEMntnr7Tb/W7qvlGpeerY56geyqtXb5gahcF30WoQowB
 mIzTTORMQQYsv37hlUAcFY3Ur8Pj4Qi76JlfPcPk=
Date: Thu, 09 Feb 2023 03:20:10 +0000
MIME-Version: 1.0
Message-Id: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAGlm5GMC/x2NQQrCQAwAv1JyNrDGXtqviMhmzdrUsi0bFaX07
 6YeZ2CYFUyqikHfrFDlraZzcTgeGkhDLHdBvTkDBToFCh0+Zh6vz+8imCkbctx9armjAB5xNEG
 usaTBs/KaJpdLlayf/+V82bYf4kgpr3UAAAA=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675912812; l=2105;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0ax1L+4wlH+3bsB/7eEn2YOweom015kqtn2sv4C2TLM=;
 b=kIRzSTrKvek4pySmNk1lSuXeegxwku6qFmFpJjx7qPcDmSyr1HrZc7v/iT/FDL9a3zQH3ynhi
 z00ICnBe17YAoHuKe6JJhWcCvt440/jSRgeJiJJdyR/TAYIYMrybH8a
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit ee6d3dd4ed48 ("driver core: make kobj_type
 constant.")
 the driver core allows the usage of const struct kobj_type. Take advantage
 of this to constify the structure definitions to prevent modification at
 runtime. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: weissschuh.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pPxTz-0006ds-Lp
Subject: [f2fs-dev] [PATCH] f2fs: make kobj_type structures constant
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
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U2luY2UgY29tbWl0IGVlNmQzZGQ0ZWQ0OCAoImRyaXZlciBjb3JlOiBtYWtlIGtvYmpfdHlwZSBj
b25zdGFudC4iKQp0aGUgZHJpdmVyIGNvcmUgYWxsb3dzIHRoZSB1c2FnZSBvZiBjb25zdCBzdHJ1
Y3Qga29ial90eXBlLgoKVGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcyB0byBjb25zdGlmeSB0aGUgc3Ry
dWN0dXJlIGRlZmluaXRpb25zIHRvIHByZXZlbnQKbW9kaWZpY2F0aW9uIGF0IHJ1bnRpbWUuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0t
LQogZnMvZjJmcy9zeXNmcy5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMg
Yi9mcy9mMmZzL3N5c2ZzLmMKaW5kZXggODNhMzY2ZjNlZTgwLi40M2YxZmYxYjkyYmEgMTAwNjQ0
Ci0tLSBhL2ZzL2YyZnMvc3lzZnMuYworKysgYi9mcy9mMmZzL3N5c2ZzLmMKQEAgLTExMjksMTMg
KzExMjksMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzeXNmc19vcHMgZjJmc19hdHRyX29wcyA9
IHsKIAkuc3RvcmUJPSBmMmZzX2F0dHJfc3RvcmUsCiB9OwogCi1zdGF0aWMgc3RydWN0IGtvYmpf
dHlwZSBmMmZzX3NiX2t0eXBlID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBrb2JqX3R5cGUgZjJm
c19zYl9rdHlwZSA9IHsKIAkuZGVmYXVsdF9ncm91cHMgPSBmMmZzX2dyb3VwcywKIAkuc3lzZnNf
b3BzCT0gJmYyZnNfYXR0cl9vcHMsCiAJLnJlbGVhc2UJPSBmMmZzX3NiX3JlbGVhc2UsCiB9Owog
Ci1zdGF0aWMgc3RydWN0IGtvYmpfdHlwZSBmMmZzX2t0eXBlID0geworc3RhdGljIGNvbnN0IHN0
cnVjdCBrb2JqX3R5cGUgZjJmc19rdHlwZSA9IHsKIAkuc3lzZnNfb3BzCT0gJmYyZnNfYXR0cl9v
cHMsCiB9OwogCkBAIC0xMTQzLDcgKzExNDMsNyBAQCBzdGF0aWMgc3RydWN0IGtzZXQgZjJmc19r
c2V0ID0gewogCS5rb2JqCT0gey5rdHlwZSA9ICZmMmZzX2t0eXBlfSwKIH07CiAKLXN0YXRpYyBz
dHJ1Y3Qga29ial90eXBlIGYyZnNfZmVhdF9rdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
a29ial90eXBlIGYyZnNfZmVhdF9rdHlwZSA9IHsKIAkuZGVmYXVsdF9ncm91cHMgPSBmMmZzX2Zl
YXRfZ3JvdXBzLAogCS5zeXNmc19vcHMJPSAmZjJmc19hdHRyX29wcywKIH07CkBAIC0xMTg0LDcg
KzExODQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyBmMmZzX3N0YXRfYXR0cl9v
cHMgPSB7CiAJLnN0b3JlCT0gZjJmc19zdGF0X2F0dHJfc3RvcmUsCiB9OwogCi1zdGF0aWMgc3Ry
dWN0IGtvYmpfdHlwZSBmMmZzX3N0YXRfa3R5cGUgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGtv
YmpfdHlwZSBmMmZzX3N0YXRfa3R5cGUgPSB7CiAJLmRlZmF1bHRfZ3JvdXBzID0gZjJmc19zdGF0
X2dyb3VwcywKIAkuc3lzZnNfb3BzCT0gJmYyZnNfc3RhdF9hdHRyX29wcywKIAkucmVsZWFzZQk9
IGYyZnNfc3RhdF9rb2JqX3JlbGVhc2UsCkBAIC0xMjExLDcgKzEyMTEsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHN5c2ZzX29wcyBmMmZzX2ZlYXR1cmVfbGlzdF9hdHRyX29wcyA9IHsKIAkuc2hv
dwk9IGYyZnNfc2JfZmVhdF9hdHRyX3Nob3csCiB9OwogCi1zdGF0aWMgc3RydWN0IGtvYmpfdHlw
ZSBmMmZzX2ZlYXR1cmVfbGlzdF9rdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga29ial90
eXBlIGYyZnNfZmVhdHVyZV9saXN0X2t0eXBlID0gewogCS5kZWZhdWx0X2dyb3VwcyA9IGYyZnNf
c2JfZmVhdF9ncm91cHMsCiAJLnN5c2ZzX29wcwk9ICZmMmZzX2ZlYXR1cmVfbGlzdF9hdHRyX29w
cywKIAkucmVsZWFzZQk9IGYyZnNfZmVhdHVyZV9saXN0X2tvYmpfcmVsZWFzZSwKCi0tLQpiYXNl
LWNvbW1pdDogMDk4M2Y2YmYyYmZjMDc4OWI1MWRkZjczMTVmNjQ0ZmY0ZGE1MGFjYgpjaGFuZ2Ut
aWQ6IDIwMjMwMjA5LWtvYmpfdHlwZS1mMmZzLWJhMjMwMmM0YjkyMAoKQmVzdCByZWdhcmRzLAot
LSAKVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
