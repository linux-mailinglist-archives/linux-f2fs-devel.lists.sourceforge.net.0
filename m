Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A75CACD1EC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 03:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4byLVi6qDhuMjKjgkMMszAkD4ESVpHxpltJVx+az2A=; b=VD2CwHY/vEI1d76rILIuAlps09
	O36N+AYuoBqQ3Ue5Ev6UjIVuNw6mIYNogSbLrUIdskpW5uJykORpGdN/VTnBnxXwBnYtPgh+L7bfZ
	Ej4yQ76pZEOnZDDm7xX2ZIdwr2dLFmEy5SdrW4w5MumA/apI2ah0N8qtO9aoesp7YmCI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMcVE-0006Xp-E6;
	Wed, 04 Jun 2025 01:01:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1uMcVD-0006Xh-8o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 01:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ms7xi4vPadFjq7XxNlwaphU21JlpbrR4+ENeFFAcdfM=; b=bSNzn9bV6TAPdkAE/SF8efag4m
 ILleQnx/fDtHtIE/mHf0RVv3jJEuX1+DcXaVM+n1/KAreyjRikeHXuxVu/+rJCXbnQn2AwNgSv/Xd
 dsS6q2vTrtcfBu4DjjIarR+ZKlY+iIc5QRoC0UMNiEZaw59iU0zjJXlv/Zu+BGfGlp4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ms7xi4vPadFjq7XxNlwaphU21JlpbrR4+ENeFFAcdfM=; b=fJ90fXcNOB/5dI6xfOxPcS4aIC
 Z/l+1TilsphvaJGhQJpDGQCfeUH8UX2qEIqWJFjo99UAZ/2Jb4WJjiT5WXlS1qpb3vcov1P3dK4Nq
 JWAsifrkaATeH3M1pUyQL+jAHWTeERV7O2/fgdoba1XmfAW6qEy16bgQ4Iaeiq3uWgg8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMcVA-0001Ao-L4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 01:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DB6C8629D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Jun 2025 01:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19A1C4CEEF;
 Wed,  4 Jun 2025 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748998857;
 bh=bMrVdcFROuaGQZZS47tY6ksX5AZ3pkjtqdQ5g5Ynl40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iZ3Ba69QhzW19OsltRac75b8+gtDNK5VZxIV6xQvmmaE9Vev74kXnoitM+1aglsnD
 4KcQTf2IimnYSQE+1rBiPeAcEupXfB1E/ieml7i+VUZoCT9obZxti+Dg9AlvLZTDwl
 p6N8jEtfSoeZUhbCruMdQNSXF4MTkWE39hNuR5NHqI+yKK53LvLBo/xyfalBu7qew3
 1Hjrgc3XYX+h+2mEsaMGnrwn3OWtWTe7uc9LUGqwJTewLKKWRp3ZxjfECDAaRc2Wwo
 /SR16O84mkRc/4ABIWfxgqf0LtaFP5kFwbPGxIjF1ufAr9cML3Vtc0B0YsEd2nwbrm
 FgSN7wu/UZOhQ==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Tue,  3 Jun 2025 20:58:39 -0400
Message-Id: <20250604005919.4191884-53-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 bb5eb8a5b222fa5092f60d5555867a05ebc3bdf2
 ] [ cut here ] WARNING: CPU: 3 PID: 579 at fs/f2fs/segment.c:2832
 new_curseg+0x5e8/0x6dc
 pc : new_curseg+0x5e8/0x6dc Call trace: new_curseg+0x5e8/0x6dc
 f2fs_allocate_data_block+0 [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uMcVA-0001Ao-L4
Subject: [f2fs-dev] [PATCH AUTOSEL 6.12 53/93] f2fs: fix to bail out in
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
dC5jCmluZGV4IGI5ZmZiMmVlOTU0OGEuLjc2OWE5MGI2MDllMmMgMTAwNjQ0Ci0tLSBhL2ZzL2Yy
ZnMvc2VnbWVudC5jCisrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCkBAIC0yNzcyLDcgKzI3NzIsMTEg
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
