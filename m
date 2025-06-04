Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E890BACD18E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 02:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAimr6bztlcI/KZLR6iVrf53azJl/83nEWFU32wNEpk=; b=fuHuIWLtortVQBhSKflOl8L/zy
	6a0Cyzduo07eHsiuyy+bqactpKjK/B3QDD+riRon3iQ2AGx5Tjb8Y+NqgE5uVSNu7CvTAydefRR4t
	CAbupgx40aE5ftJVzDwSNZrTZJ1foFGajjbUZ7n+ZxkDg/yyFS4rc98SFK4RP9ceIT2Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMcS1-0002S1-3r;
	Wed, 04 Jun 2025 00:57:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1uMcS0-0002Ru-10
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 00:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ovbhlTlvGpwaY/TGo0I3GiTt8rHlUDlO4+ekH4lL6j4=; b=S8QSE2i5HFlPLstjNEbVISZ9bt
 0KtjNW/oH5HgS8nlB3rtYksdHZunFGmyhTieLXGo5v1yjVnagA/DqZ3NOD5xpo7/3AB9TZwUAElkZ
 i+F2Kx8QCGF/T/Nz1Ij9JLOVFP4G5146r1S2xHZjft3bSsbr4BcciTss8wbgpIxiw+AI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ovbhlTlvGpwaY/TGo0I3GiTt8rHlUDlO4+ekH4lL6j4=; b=D0XJxhaPqS+kBjydgooVmNe5Hz
 A6ujp3kKx0RH5K4S0Xfmjo952OB483o1S8bII4wXtyOTu3Pu6wNPBpWV7Il+9+onotIGsWx7432if
 P/bw2aEHx/cF1HaoxYgXt0yMHipSQ/eEsPQz14+GMkzRBPJbI3fY80rrP45LNsbfdzto=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMcRz-0000xH-Qc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 00:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E5C660008
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Jun 2025 00:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BEFC4CEED;
 Wed,  4 Jun 2025 00:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748998660;
 bh=mT1Rne6Ygx1Vp1ZmVqMb9hkqHaEkBQfjE281f6VFCFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mEG/k+U5w+R8+kapNgHO1B1nEuPZdAiJlqYRnLHnLQpd/avlHpz5NSfTKoKdsiypo
 LZuQRW4GLcrGPJoxwxMYPG/kDkN3o7VgH888Et9q6CpS8aDqJl/+s1+42KcVwlN/ZE
 LcFO2NSzoAYwfkQ0d/7dh6xPiNWqO0SPPGHgnGKSoNvBPiQGoMO1Sq4Au6kJNtafiX
 1m18c0eIyAv9J39c/W6DwhmcPG34mutEaik8L7k/aAzh8se/wczinykfD27m5B5qmN
 BrAkNZtqVzTl5DjW9qgWtjhU/5WeK/ebwYsfIBif9SI+2MUyBnlYDJC+xADE/3Wzia
 34x5TCWGX+vhQ==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Tue,  3 Jun 2025 20:54:45 -0400
Message-Id: <20250604005531.4178547-62-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
X-Headers-End: 1uMcRz-0000xH-Qc
Subject: [f2fs-dev] [PATCH AUTOSEL 6.14 062/108] f2fs: fix to bail out in
 get_new_segment()
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

RnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKWyBVcHN0cmVhbSBjb21taXQgYmI1ZWI4
YTViMjIyZmE1MDkyZjYwZDU1NTU4NjdhMDVlYmMzYmRmMiBdCgotLS0tLS0tLS0tLS1bIGN1dCBo
ZXJlIF0tLS0tLS0tLS0tLS0KV0FSTklORzogQ1BVOiAzIFBJRDogNTc5IGF0IGZzL2YyZnMvc2Vn
bWVudC5jOjI4MzIgbmV3X2N1cnNlZysweDVlOC8weDZkYwpwYyA6IG5ld19jdXJzZWcrMHg1ZTgv
MHg2ZGMKQ2FsbCB0cmFjZToKIG5ld19jdXJzZWcrMHg1ZTgvMHg2ZGMKIGYyZnNfYWxsb2NhdGVf
ZGF0YV9ibG9jaysweGE1NC8weGUyOAogZG9fd3JpdGVfcGFnZSsweDZjLzB4MTk0CiBmMmZzX2Rv
X3dyaXRlX25vZGVfcGFnZSsweDM4LzB4NzgKIF9fd3JpdGVfbm9kZV9wYWdlKzB4MjQ4LzB4NmQ0
CiBmMmZzX3N5bmNfbm9kZV9wYWdlcysweDUyNC8weDcyYwogZjJmc193cml0ZV9jaGVja3BvaW50
KzB4NGJjLzB4OWIwCiBfX2NoZWNrcG9pbnRfYW5kX2NvbXBsZXRlX3JlcXMrMHg4MC8weDI0NAog
aXNzdWVfY2hlY2twb2ludF90aHJlYWQrMHg4Yy8weGVjCiBrdGhyZWFkKzB4MTE0LzB4MWJjCiBy
ZXRfZnJvbV9mb3JrKzB4MTAvMHgyMAoKZ2V0X25ld19zZWdtZW50KCkgZGV0ZWN0cyBpbmNvbnNp
c3RlbnQgc3RhdHVzIGluIGJldHdlZW4gZnJlZV9zZWdtYXAKYW5kIGZyZWVfc2VjbWFwLCBsZXQn
cyByZWNvcmQgc3VjaCBlcnJvciBpbnRvIHN1cGVyIGJsb2NrLCBhbmQgYmFpbApvdXQgZ2V0X25l
d19zZWdtZW50KCkgaW5zdGVhZCBvZiBjb250aW51ZSB1c2luZyB0aGUgc2VnbWVudC4KClNpZ25l
ZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSmFlZ2V1
ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgotLS0KCioqWUVTKiogVGhpcyBjb21taXQgc2hvdWxkIGJlIGJhY2tw
b3J0ZWQgdG8gc3RhYmxlIGtlcm5lbCB0cmVlcyBmb3IgdGhlCmZvbGxvd2luZyByZWFzb25zOiAq
KjEuIEZpeGVzIEltcG9ydGFudCBCdWcgQWZmZWN0aW5nIFVzZXJzOioqIFRoZQpjb21taXQgYWRk
cmVzc2VzIGEga2VybmVsIFdBUk5JTkcgdGhhdCBjYW4gYmUgdHJpZ2dlcmVkIGR1cmluZyBub3Jt
YWwKZmlsZXN5c3RlbSBvcGVyYXRpb25zLiBUaGUgY2FsbCB0cmFjZSBzaG93cyB0aGlzIG9jY3Vy
cyBkdXJpbmcKY2hlY2twb2ludCBvcGVyYXRpb25zIChgZjJmc193cml0ZV9jaGVja3BvaW50YCDi
hpIgYGYyZnNfc3luY19ub2RlX3BhZ2VzYArihpIgYGYyZnNfZG9fd3JpdGVfbm9kZV9wYWdlYCks
IHdoaWNoIGFyZSBjcml0aWNhbCBmb3IgZGF0YSBjb25zaXN0ZW5jeS4KKioyLiBTbWFsbCBhbmQg
Q29udGFpbmVkIEZpeDoqKiBUaGUgY2hhbmdlcyBhcmUgbWluaW1hbCBhbmQgc3VyZ2ljYWw6IC0K
SW4gYGZzL2YyZnMvc2VnbWVudC5jYDogT25seSA2IGxpbmVzIGNoYW5nZWQsIHJlcGxhY2luZyBh
CmBmMmZzX2J1Z19vbigpYCBjYWxsIHdpdGggcHJvcGVyIGVycm9yIGhhbmRsaW5nIC0gSW4KYGlu
Y2x1ZGUvbGludXgvZjJmc19mcy5oYDogQWRkaW5nIG9uZSBuZXcgZW51bSB2YWx1ZSBmb3IgdGhl
IHN0b3AKY2hlY2twb2ludCByZWFzb24gKiozLiBNaW5pbWFsIFJpc2sgb2YgUmVncmVzc2lvbjoq
KiBUaGUgY2hhbmdlIG9ubHkKYWZmZWN0cyB0aGUgZXJyb3IgcGF0aCB3aGVuIGNvcnJ1cHRpb24g
aXMgZGV0ZWN0ZWQuIEluc3RlYWQgb2YKdHJpZ2dlcmluZyBhIGtlcm5lbCBidWcsIGl0IG5vdzog
LSBSZXR1cm5zIGAtRUZTQ09SUlVQVEVEYCBlcnJvciBjb2RlIC0KU3RvcHMgY2hlY2twb2ludCB3
aXRoIHNwZWNpZmljIHJlYXNvbgooYFNUT1BfQ1BfUkVBU09OX0NPUlJVUFRFRF9GUkVFX0JJVE1B
UGApIC0gTWFpbnRhaW5zIGZpbGVzeXN0ZW0KaW50ZWdyaXR5IGJ5IHByZXZlbnRpbmcgdXNlIG9m
IGNvcnJ1cHRlZCBzZWdtZW50cyAqKjQuIEZvbGxvd3MKRXN0YWJsaXNoZWQgUGF0dGVybjoqKiBT
aW1pbGFyIGNvbW1pdHMgKCMyLCAjNCwgIzUpIHRoYXQgcmVwbGFjZSBmMmZzCnBhbmljcyB3aXRo
IGdyYWNlZnVsIGVycm9yIGhhbmRsaW5nIGhhdmUgYWxsIGJlZW4gbWFya2VkIGZvciBiYWNrcG9y
dGluZwooU3RhdHVzOiBZRVMpLiBUaGlzIGNvbW1pdCBmb2xsb3dzIHRoZSBleGFjdCBzYW1lIHBh
dHRlcm4gb2YgaW1wcm92aW5nCmYyZnMgcm9idXN0bmVzcy4gKio1LiBDcml0aWNhbCBTdWJzeXN0
ZW0gSW1wYWN0OioqIFRoZSBmaXggdG91Y2hlcyBmMmZzCnNlZ21lbnQgbWFuYWdlbWVudCwgd2hp
Y2ggaXMgZnVuZGFtZW50YWwgdG8gdGhlIGZpbGVzeXN0ZW0ncyBhbGxvY2F0aW9uCnN0cmF0ZWd5
LiBDb3JydXB0aW9uIGluIHNlZ21lbnQgYml0bWFwcyBjb3VsZCBsZWFkIHRvIGRhdGEgbG9zcyBv
cgpmaWxlc3lzdGVtIGNvcnJ1cHRpb24gaWYgbm90IGhhbmRsZWQgcHJvcGVybHkuICoqNi4gQ2xl
YXIgRXJyb3IgSGFuZGxpbmcKSW1wcm92ZW1lbnQ6KiogUmF0aGVyIHRoYW4gY3Jhc2hpbmcgdGhl
IGtlcm5lbCB3aGVuIGluY29uc2lzdGVudCBiaXRtYXAKc3RhdGUgaXMgZGV0ZWN0ZWQsIHRoZSBm
aXggYWxsb3dzIHRoZSBmaWxlc3lzdGVtIHRvIHN0b3AgY2hlY2twb2ludApvcGVyYXRpb25zIGdy
YWNlZnVsbHkgYW5kIHJlY29yZCB0aGUgY29ycnVwdGlvbiByZWFzb24sIHdoaWNoIGFpZHMgaW4K
ZGVidWdnaW5nIGFuZCByZWNvdmVyeS4gVGhlIGNvbW1pdCBtZWV0cyBhbGwgc3RhYmxlIHRyZWUg
Y3JpdGVyaWE6IGl0J3MKYW4gaW1wb3J0YW50IGJ1Z2ZpeCwgaGFzIG1pbmltYWwgcmlzaywgZG9l
c24ndCBpbnRyb2R1Y2UgbmV3IGZlYXR1cmVzLAphbmQgZm9sbG93cyBlc3RhYmxpc2hlZCBwYXR0
ZXJucyBmb3Igc2ltaWxhciBmaXhlcyB0aGF0IGhhdmUgYmVlbgpzdWNjZXNzZnVsbHkgYmFja3Bv
cnRlZC4KCiBmcy9mMmZzL3NlZ21lbnQuYyAgICAgICB8IDYgKysrKystCiBpbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVu
dC5jCmluZGV4IDM4NGJjYTAwMmVjOWEuLjNlZDU1ODg5YWQ3ZjcgMTAwNjQ0Ci0tLSBhL2ZzL2Yy
ZnMvc2VnbWVudC5jCisrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCkBAIC0yODM2LDcgKzI4MzYsMTEg
QEAgc3RhdGljIGludCBnZXRfbmV3X3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAog
CX0KIGdvdF9pdDoKIAkvKiBzZXQgaXQgYXMgZGlydHkgc2VnbWVudCBpbiBmcmVlIHNlZ21hcCAq
LwotCWYyZnNfYnVnX29uKHNiaSwgdGVzdF9iaXQoc2Vnbm8sIGZyZWVfaS0+ZnJlZV9zZWdtYXAp
KTsKKwlpZiAodGVzdF9iaXQoc2Vnbm8sIGZyZWVfaS0+ZnJlZV9zZWdtYXApKSB7CisJCXJldCA9
IC1FRlNDT1JSVVBURUQ7CisJCWYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsIFNUT1Bf
Q1BfUkVBU09OX0NPUlJVUFRFRF9GUkVFX0JJVE1BUCk7CisJCWdvdG8gb3V0X3VubG9jazsKKwl9
CiAKIAkvKiBubyBmcmVlIHNlY3Rpb24gaW4gY29udmVudGlvbmFsIHpvbmUgKi8KIAlpZiAobmV3
X3NlYyAmJiBwaW5uaW5nICYmCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCBi
L2luY2x1ZGUvbGludXgvZjJmc19mcy5oCmluZGV4IGMyNGY4YmMwMTA0NWQuLjUyMDZkNjNiMzM4
NjAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvZjJmc19mcy5oCkBAIC03OCw2ICs3OCw3IEBAIGVudW0gc3RvcF9jcF9yZWFzb24gewogCVNU
T1BfQ1BfUkVBU09OX1VQREFURV9JTk9ERSwKIAlTVE9QX0NQX1JFQVNPTl9GTFVTSF9GQUlMLAog
CVNUT1BfQ1BfUkVBU09OX05PX1NFR01FTlQsCisJU1RPUF9DUF9SRUFTT05fQ09SUlVQVEVEX0ZS
RUVfQklUTUFQLAogCVNUT1BfQ1BfUkVBU09OX01BWCwKIH07CiAKLS0gCjIuMzkuNQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
