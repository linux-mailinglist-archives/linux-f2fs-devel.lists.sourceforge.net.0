Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E08C09680
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Oct 2025 18:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4v8OqPIqlHZYumx6QUSVYJgIzjCu0IBcksVNO3CPoE=; b=XyLzU9PctLQJ6w2L5mEqfW2Xs9
	4f0L7xZK60Wv9IAmMW/6etV9+yUVIifnWI7ZxUMtK27/L6dc8Si48PZFBzHz6qt1tlzvXaRF1LUpU
	o3klFniENoSUnfnFdRRUU5cMMEvFJJgaE6UxFzJ5wuluo+T4gScgG5QXdrjgObSS4OLc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vCh4b-0004XM-VH;
	Sat, 25 Oct 2025 16:24:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1vCh4a-0004X9-Oa
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nPrc0/cAfrCoaoTN5l1822d/jpOHhS2Loyed355+6ZM=; b=FShElUi8CaICMzDd51UfsoEnwB
 aAKlZ0IVB1OBIY51+Q7/3rWVklYcMtijRIEmsM1ln/sJS4esXoQ/3ZO6p1zCzrCQcpPVbXAPMclqk
 Jnw4gPBWR/tNV4fAYJs4hMuMioB/FrgS301DFKZK/EN4yGNcLU2qgksw+zfQYjLfB3Zo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nPrc0/cAfrCoaoTN5l1822d/jpOHhS2Loyed355+6ZM=; b=SUeVplvefOhQC4TXpV/cj9PzUw
 OZrLGmqSLXP9O4qDzFWSBtLAwi+qFS5oq+0mjc22mHG6MpewpDczT0JsO7D31jLgy6RWgox0Pv+e+
 3Nm2oj/KQlWXND3X0awk5Tsfg8Jclk0W7bUocGCXvr7V6C/o7DnU6x9x306tLesMuH2s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vCh4b-0003fg-0p for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0B3E40748
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Oct 2025 16:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D19C4CEF5;
 Sat, 25 Oct 2025 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409486;
 bh=OG1WIUaN3zRAnMzSfe4HeqCKMVnfY9o001jP/RmG4QM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uVKETrnrm2t+cb0BtopA9jEn1ozC83/aE3x5+4J8BlnCGnSDXKHXQNyhHg44/Af3i
 oHK06F3TbSoPXZiVZiN8Hku2OMpAzF28fxsYRAIyxQ94NB+l4gZIPZ32BnwqESA4Ly
 xvosJyuy+kJotzrmQFYMEgnR1/KYT1pdammi7nmzyybx/LlIZykC8TbnFiNsxdQhV3
 aSsKgkmgabOQO36Ag6v+g1laphrxYSxvzW6lvkE/aJPuHCLXzDR2mVlvm4dXi2mqnH
 L4Xy0BUatx3WaV3nxkxvN72760qhmuPM6NPkvTe8AOMG4+SMqWJWkxoUePw6/XDmb7
 HoGri/vKV8wHA==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Sat, 25 Oct 2025 11:59:37 -0400
Message-ID: <20251025160905.3857885-346-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 a33be64b98d0723748d2fab0832b926613e1fce0
 ] This patch fixes to support different block size. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vCh4b-0003fg-0p
Subject: [f2fs-dev] [PATCH AUTOSEL 6.17-6.12] f2fs: fix wrong layout
 information on 16KB page
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KClsgVXBzdHJlYW0gY29tbWl0
IGEzM2JlNjRiOThkMDcyMzc0OGQyZmFiMDgzMmI5MjY2MTNlMWZjZTAgXQoKVGhpcyBwYXRjaCBm
aXhlcyB0byBzdXBwb3J0IGRpZmZlcmVudCBibG9jayBzaXplLgoKUmV2aWV3ZWQtYnk6IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KCkxMTSBHZW5lcmF0ZWQgZXhwbGFuYXRpb25zLCBtYXkgYmUgY29tcGxldGVseSBib2d1
czoKCllFUwoKRXhwbGFuYXRpb24KLSBGaXggc2NvcGU6IENvcnJlY3RzIHVzZXItdmlzaWJsZSBs
YXlvdXQgaW5mbyBpbgogIGAvcHJvYy9mcy9mMmZzLzxzYj4vZGlza19tYXBgIGZvciBub24tNEtC
IHBhZ2UvYmxvY2sgc2l6ZXMuCiAgUHJldmlvdXNseSwgc2l6ZXMgd2VyZSBoYXJkY29kZWQgdG8g
YSAyTUItcGVyLXNlZ21lbnQgYXNzdW1wdGlvbiwKICBwcm9kdWNpbmcgd3JvbmcgdmFsdWVzIG9u
IDE2S0IvNjRLQiBzeXN0ZW1zLgotIFdoYXQgY2hhbmdlZDogSW4gYGZzL2YyZnMvc3lzZnMuYzpk
aXNrX21hcF9zZXFfc2hvd2AgdGhlIG91dHB1dCBub3cKICBkZXJpdmVzIHNpemVzIGZyb20gYmxv
Y2sgc2l6ZSBpbnN0ZWFkIG9mIGFzc3VtaW5nIDRLQjoKICAtIEFkZHMgYmxvY2sgc2l6ZSBsaW5l
OiBmcy9mMmZzL3N5c2ZzLmM6MTc3MQogICAgLSBgc2VxX3ByaW50ZiguLi4sICIgQmxvY2sgc2l6
ZSAgICA6ICUxMmx1IEtCXG4iLCBGMkZTX0JMS1NJWkUgPj4KICAgICAgMTApO2AKICAtIENvbXB1
dGVzIHNlZ21lbnQgc2l6ZSBpbiBNQiBnZW5lcmljYWxseTogZnMvZjJmcy9zeXNmcy5jOjE3NzIK
ICAgIC0gYHNlcV9wcmludGYoLi4uLCAiIFNlZ21lbnQgc2l6ZSAgOiAlMTJkIE1CXG4iLCAoQkxL
U19QRVJfU0VHKHNiaSkKICAgICAgPDwgKEYyRlNfQkxLU0laRV9CSVRTIC0gMTApKSA+PiAxMCk7
YAogIC0gQ29tcHV0ZXMgc2VjdGlvbiBzaXplIGluIE1CIGdlbmVyaWNhbGx5OiBmcy9mMmZzL3N5
c2ZzLmM6MTc3NgogICAgLSBgc2VxX3ByaW50ZiguLi4sICIgU2VjdGlvbiBzaXplICA6ICUxMmQg
TUJcbiIsIChCTEtTX1BFUl9TRUMoc2JpKQogICAgICA8PCAoRjJGU19CTEtTSVpFX0JJVFMgLSAx
MCkpID4+IDEwKTtgCiAgLSBSZWxvY2F0ZXMgdGhlIOKAnCMgb2YgU2VjdGlvbnPigJ0gbGluZSBi
ZW5lYXRoIHNlY3Rpb24gc2l6ZSBmb3IgY2xhcml0eToKICAgIGZzL2YyZnMvc3lzZnMuYzoxNzc4
Ci0gV2h5IGl0IG1hdHRlcnM6IE9uIDE2S0Igc3lzdGVtcyAoYEYyRlNfQkxLU0laRV9CSVRTPTE0
YCksIGEgc2VnbWVudCBpcwogIDUxMiBibG9ja3Mgw5cgMTZLQiA9IDhNQi4gVGhlIG9sZCBjb2Rl
IHByaW50ZWQgc2VjdGlvbiBzaXplIHVzaW5nCiAgYFNFR1NfUEVSX1NFQyA8PCAxYCAoMk1CL3Nl
Z21lbnQgYXNzdW1wdGlvbiksIHVuZGVycmVwb3J0aW5nIGJ5IDTDly4gT24KICA2NEtCIHBhZ2Vz
LCBzZWdtZW50cyBhcmUgMzJNQiwgbWFraW5nIHRoZSBlcnJvciBldmVuIGxhcmdlci4KLSBDb3Jy
ZWN0bmVzcyBvZiB0aGUgbmV3IG1hdGg6IFRoZSBleHByZXNzaW9uIGAoYmxvY2tzIDw8CiAgKEYy
RlNfQkxLU0laRV9CSVRTIC0gMTApKSA+PiAxMGAgZXF1YWxzIGBibG9ja3MgKiAoYmxvY2tfc2l6
ZV9ieXRlcyAvCiAgMU1CKWAgYW5kIHlpZWxkcyB0aGUgcmlnaHQgTUIgY291bnQgZm9yIGFueSBg
UEFHRV9TSElGVGAgKGUuZy4sCiAgMTLihpI0S0IsIDE04oaSMTZLQiwgMTbihpI2NEtCKS4gRGVm
aW5pdGlvbnM6IGBGMkZTX0JMS1NJWkUgPSBQQUdFX1NJWkVgLAogIGBGMkZTX0JMS1NJWkVfQklU
UyA9IFBBR0VfU0hJRlRgIChpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaDoxOOKAkzE5KS4KICBCbG9j
ay10by1zZWdtZW50L3NlY3Rpb24gY291bnRzIGFyZSB2aWEgYEJMS1NfUEVSX1NFRyhzYmkpYCBh
bmQKICBgQkxLU19QRVJfU0VDKHNiaSlgIChmcy9mMmZzL2YyZnMuaDoxOTQ24oCTMTk0NykuCi0g
VXNlciBpbXBhY3Q6IEZpeGVzIGluYWNjdXJhdGUgZGlhZ25vc3RpY3MgdGhhdCBhZG1pbnMgYW5k
IHRvb2xpbmcgbWF5CiAgcmVseSBvbiB3aGVuIGluc3BlY3RpbmcgRjJGUyBsYXlvdXQuIE5vIG9u
LWRpc2sgZm9ybWF0IG9yIHJ1bnRpbWUKICBiZWhhdmlvciBjaGFuZ2U7IHB1cmVseSBkaXNwbGF5
LgotIENvbnRhaW5tZW50IGFuZCByaXNrOiBTaW5nbGUgZnVuY3Rpb24sIHByaW50LW9ubHkgY2hh
bmdlcyBpbiBhIHByb2NmcwogIHNlcV9maWxlLiBObyBsb2NraW5nLCBubyBzdGF0ZSBjaGFuZ2Vz
LCBubyBkZXBlbmRlbmN5IGltcGFjdC4KICBFeHRyZW1lbHkgbG93IHJlZ3Jlc3Npb24gcmlzay4g
VGhlIHByb2Mgb3V0cHV0IGZvcm1hdCBnYWlucyB0d28gbGluZXMKICAo4oCcQmxvY2sgc2l6ZeKA
nSwg4oCcU2VnbWVudCBzaXpl4oCdKSBhbmQgcmVvcmRlcnMg4oCcIyBvZiBTZWN0aW9uc+KAnTsg
cHJvY2ZzCiAgb3V0cHV0IGlzIG5vdCBhIHN0YWJsZSBBQkksIGFuZCB0aGlzIGlzIGEgY29ycmVj
dG5lc3MgZml4LgotIFN0YWJsZSBjcml0ZXJpYToKICAtIEZpeGVzIGEgcmVhbCBidWcgdGhhdCBh
ZmZlY3RzIHVzZXJzIG9uIG5vbi00S0IgcGFnZSBzeXN0ZW1zLgogIC0gU21hbGwsIGxvY2FsaXpl
ZCBjaGFuZ2U7IG5vIGFyY2hpdGVjdHVyYWwgbW9kaWZpY2F0aW9ucy4KICAtIE1pbmltYWwgcmlz
ayBvZiByZWdyZXNzaW9uOyBubyBmdW5jdGlvbmFsIHNpZGUgZWZmZWN0cy4KICAtIFRvdWNoZXMg
YSBmaWxlc3lzdGVtIGJ1dCBvbmx5IGl0cyBwcm9jIHJlcG9ydGluZyBwYXRoLgogIC0gTm8g4oCc
Q2M6IHN0YWJsZeKAnSB0YWcsIGJ1dCB0aGUgZml4IGlzIG9idmlvdXMgYW5kIHNlbGYtY29udGFp
bmVkLgoKQ29uY2x1c2lvbjogVGhpcyBpcyBhIHNhZmUsIGNvcnJlY3RuZXNzLW9ubHkgZml4IGlt
cHJvdmluZyBhY2N1cmFjeSBvZgpmMmZzIGRpYWdub3N0aWNzIG9uIDE2S0IvNjRLQiBwYWdlIHN5
c3RlbXMgYW5kIHNob3VsZCBiZSBiYWNrcG9ydGVkLgoKIGZzL2YyZnMvc3lzZnMuYyB8IDkgKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwppbmRleCBmNzM2
MDUyZGVhNTBhLi45MDJmZmIzZmFhMWZmIDEwMDY0NAotLS0gYS9mcy9mMmZzL3N5c2ZzLmMKKysr
IGIvZnMvZjJmcy9zeXNmcy5jCkBAIC0xNzIzLDEyICsxNzIzLDE1IEBAIHN0YXRpYyBpbnQgX19t
YXliZV91bnVzZWQgZGlza19tYXBfc2VxX3Nob3coc3RydWN0IHNlcV9maWxlICpzZXEsCiAJc2Vx
X3ByaW50ZihzZXEsICIgTWFpbiAgICAgICAgICA6IDB4JTAxMHggKCUxMGQpXG4iLAogCQkJU01f
SShzYmkpLT5tYWluX2Jsa2FkZHIsCiAJCQlsZTMyX3RvX2NwdShGMkZTX1JBV19TVVBFUihzYmkp
LT5zZWdtZW50X2NvdW50X21haW4pKTsKLQlzZXFfcHJpbnRmKHNlcSwgIiAjIG9mIFNlY3Rpb25z
IDogJTEyZFxuIiwKLQkJCWxlMzJfdG9fY3B1KEYyRlNfUkFXX1NVUEVSKHNiaSktPnNlY3Rpb25f
Y291bnQpKTsKKwlzZXFfcHJpbnRmKHNlcSwgIiBCbG9jayBzaXplICAgIDogJTEybHUgS0JcbiIs
IEYyRlNfQkxLU0laRSA+PiAxMCk7CisJc2VxX3ByaW50ZihzZXEsICIgU2VnbWVudCBzaXplICA6
ICUxMmQgTUJcbiIsCisJCQkoQkxLU19QRVJfU0VHKHNiaSkgPDwgKEYyRlNfQkxLU0laRV9CSVRT
IC0gMTApKSA+PiAxMCk7CiAJc2VxX3ByaW50ZihzZXEsICIgU2Vncy9TZWN0aW9ucyA6ICUxMmRc
biIsCiAJCQlTRUdTX1BFUl9TRUMoc2JpKSk7CiAJc2VxX3ByaW50ZihzZXEsICIgU2VjdGlvbiBz
aXplICA6ICUxMmQgTUJcbiIsCi0JCQlTRUdTX1BFUl9TRUMoc2JpKSA8PCAxKTsKKwkJCShCTEtT
X1BFUl9TRUMoc2JpKSA8PCAoRjJGU19CTEtTSVpFX0JJVFMgLSAxMCkpID4+IDEwKTsKKwlzZXFf
cHJpbnRmKHNlcSwgIiAjIG9mIFNlY3Rpb25zIDogJTEyZFxuIiwKKwkJCWxlMzJfdG9fY3B1KEYy
RlNfUkFXX1NVUEVSKHNiaSktPnNlY3Rpb25fY291bnQpKTsKIAogCWlmICghZjJmc19pc19tdWx0
aV9kZXZpY2Uoc2JpKSkKIAkJcmV0dXJuIDA7Ci0tIAoyLjUxLjAKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
